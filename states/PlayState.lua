PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/mummy/Mummy'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    -- mummyTomb = tombs:getMummyTomb()
    player = Player(15,1,'down')
    footsteps = Footsteps()
    self.paused = false
    currentMap = deepcopy(map)
    self.mummies = {}
    for i=1,numberOfMummies do
        table.insert(self.mummies, Mummy(unpack(mummyPositions[i])))
    end
    -- hiddenMummy = Mummy(mummyTomb.x + 4, mummyTomb.y + 2, "up", true)
    table.insert(self.mummies, hiddenMummy)
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end

    if not self.paused then
        tombs:update(dt)

        for key, mummy in pairs(self.mummies) do
            -- print("Key: ", key)
            -- print("Mummy.x: ", mummy.x)
            -- print("----------------")
            if mummy.toDelete then
                table.remove(self.mummies, key)
            end
        end

        for key, mummy in pairs(self.mummies) do
            if mummy.asleep or mummy.movementCounter < MOVEMENT_INTERVAL then                
                mummy.movementCounter = mummy.movementCounter + dt
            else
                if not mummy.isWaking then
                    if (mummy.x -1) % 7 == 0 and ((mummy.y - 3) % 10) == 0  then
                        -- mummy.direction = mummy.directions[ love.math.random(1,4) ]
                        -- mummy.direction = mummy.directions[ love.math.random(1,2) ]
                    end
                    -- print("Mummy x: " .. mummy.x .. " mummy y: " .. mummy.y)
                    if self:mummyWouldCollidiedWithMummy(mummy) then
                        print("Mummy would collide with mummy")
                        mummy.movementCounter = 0
                    else
                        mummy:update(dt)
                    end
                else
                    mummy.direction = 'right'
                    mummy.wakeCount = mummy.wakeCount + 1
                    if mummy.wakeCount > 3 then
                        mummy.direction = 'down'
                    end
                    if mummy.wakeCount > 5 then
                        mummy.isWaking = false
                    end
                    mummy:update(dt)
                end
                if mummy:collides(player) then
                    mummy:markForDeletion()
                    player:loseLife()
                    numberOfMummies = math.max(numberOfMummies - 1, 0)
                    if lives < 1 then
                        self.paused = true
                    end
                end
            end
        end
        player:update(dt)
    end
end

function PlayState:mummyWouldCollidiedWithMummy(objectMummy)
    for i, mummy in ipairs(self.mummies) do
        if objectMummy.direction == "right" then
            -- print("mummyWouldCollidiedWithMummy objectMummy.x: " .. objectMummy.x)
            -- print("mummyWouldCollidiedWithMummy mummy.x: " .. mummy.x)
            if (mummy.x + 1 == objectMummy.x or 
            mummy.x + 2 == objectMummy.x or 
            mummy.x + 3 == objectMummy.x ) and
            mummy.y == objectMummy.y  then 
                print(mummy.x + 3 .. " equals " .. objectMummy.x)
                -- objectMummy.direction = "left"
                -- if mummy.direction == "left" then mummy.direction = "right" end
                return true 
            else
                print(mummy.x + 3 .. " does not equal " .. objectMummy.x)
            end
        end
        if objectMummy.direction == "left" then
            if (mummy.x - 1 == objectMummy.x or 
            mummy.x - 2 == objectMummy.x or
            mummy.x - 3 == objectMummy.x) and 
            mummy.y == objectMummy.y then 
                -- objectMummy.direction = "right"
                -- if mummy.direction == "right" then mummy.direction = "left" end
                return true 
            end
        end
        if objectMummy.direction == "up" then
            if (mummy.y - 1 == objectMummy.y or 
            mummy.y - 2 == objectMummy.y or 
            mummy.y - 3 == objectMummy.y) and 
            mummy.x == objectMummy.x then 
                -- objectMummy.direction = "down"
                -- if mummy.direction == "down" then mummy.direction = "up" end
                return true 
            end
        end
        if objectMummy.direction == "down" then
            if (mummy.y + 1 == objectMummy.y or 
            mummy.y + 2 == objectMummy.y or
            mummy.y + 3 == objectMummy.y) and 
            mummy.x == objectMummy.x then 
                -- objectMummy.direction = "up"
                -- if mummy.direction == "up" then mummy.direction = "down" end
                return true 
            end
        end
        return false
    end
end

function PlayState:renderLives()
    setColour("Black")
    love.graphics.rectangle('fill', 240, 39, 84, 16)
    player:renderLives()
end

function PlayState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    love.graphics.setFont(gTitleFont)
    setColour("Orange")
    screenarea_printf('SCORE', 14, 0, VIRTUAL_WIDTH)
    setColour("Sky Blue")
    screenarea_printf(string.format("%05d", score), 60, 0, VIRTUAL_WIDTH)
    setColour("Orange")
    screenarea_printf('MEN', 175, 0, VIRTUAL_WIDTH)
    self:renderLives()
    setColour("Black")
    playarea_rectangle("fill", 0, 15, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    playarea_rectangle("fill", 7 * TILE_SIZE, 0, TILE_SIZE, TILE_SIZE)
    footsteps:render()
    player:render()
    for key, mummy in pairs(self.mummies) do
        mummy:render()
    end
    tombs:render()
    if lives < 1 then
        setColour("Black")
        playarea_rectangle("fill", 65, 70, 165, 70)
        setColour("Orange")
        screenarea_printf('G A M E  O V E R !', 95, 90, VIRTUAL_WIDTH)
        -- print(score)
        -- print(highScores[#highScores].amount)
        -- if score >= highScores[#highScores].amount then
        --     highScores[#highScores].name = ""
        --     highScores[#highScores].amount = score
        --     table.sort(highScores, function(a,b) return (a.amount > b.amount) end)
        -- end
        -- resetGame()
        scoreInput = true
        gStateMachine:change('pre')
    end
    love.graphics.printf("Level: " .. level,10,10,100)
end

function PlayState:exit() end
