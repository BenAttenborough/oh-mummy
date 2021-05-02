PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/mummy/Mummy'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    mummyTomb = tombs:getMummyTomb()
    player = Player(15,1,'down')
    footsteps = Footsteps()
    self.paused = false
    currentMap = deepcopy(map)
    self.mummies = {}
    for i=1,numberOfMummies do
        table.insert(self.mummies, Mummy(unpack(mummyPositions[i])))
    end
    hiddenMummy = Mummy(mummyTomb.x + 4, mummyTomb.y + 2, "up", true)
    table.insert(self.mummies, hiddenMummy)
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end

    if not self.paused then
        tombs:update(dt)

        for key, mummy in pairs(self.mummies) do
            if mummy.toDelete then
                table.remove(self.mummies, key)
            end
        end

        for key, mummy in pairs(self.mummies) do
            -- print(mummy:proposedDirection())
            mummy:update(dt)
            if mummy:collides(player) then
                mummy:markForDeletion()
                player:loseLife()
                numberOfMummies = math.max(numberOfMummies - 1, 0)
                if lives < 1 then
                    self.paused = true
                end
            end
        end

        -- for i, mummy in ipairs(self.mummies) do
        --     for j=i,#self.mummies,1 do
        --         if j + 1 > #self.mummies then break end
        --         if mummy:collides(self.mummies[j + 1]) then
        --             print("Mummy collides")
        --         end
        --     end
        -- end

        player:update(dt)
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
