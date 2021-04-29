PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/mummy/Mummy'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    mummyTomb = tombs:getMummyTomb()
    print(mummyTomb.x)
    print(mummyTomb.y)
    player = Player(1,3,lives)
    footsteps = Footsteps()
    self.paused = false
    currentMap = deepcopy(map)
    self.mummies = {}
    table.insert(self.mummies, Mummy(36,23))
    table.insert(self.mummies, Mummy(36,3))   
    hiddenMummy = Mummy(mummyTomb.x + 4, mummyTomb.y + 2, "up", true)
    table.insert(self.mummies, hiddenMummy)
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end

    if not self.paused then
        -- print(dt)
        player:update(dt)
        tombs:update(dt)

        for key, mummy in pairs(self.mummies) do
            if mummy.toDelete then
                table.remove(self.mummies, key)
            end
        end

        for key, mummy in pairs(self.mummies) do
            mummy:update(dt)
            if mummy:collides(player) then
                mummy:markForDeletion()
                player:loseLife()
                if lives < 1 then
                    print("Game over!")
                    self.paused = true
                end
            end
        end
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
        playarea_rectangle("fill", 0, 15, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
        setColour("Orange")
        screenarea_printf('GAME OVER!', 20, 25, VIRTUAL_WIDTH)
    end
end

function PlayState:exit() end
