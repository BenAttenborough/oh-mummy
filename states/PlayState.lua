PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/mummy/Mummy'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    player = Player(1,3,lives)
    footsteps = Footsteps()
    self.paused = false
    currentMap = deepcopy(map)
    self.mummies = {}
    table.insert(self.mummies, Mummy(36,23))
    table.insert(self.mummies, Mummy(36,3))
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end

    if not self.paused then
        player:update(dt)

        local n=#self.mummies
        for i=1,n do
            if self.mummies[i].toDelete then
                self.mummies[i] = nil
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
    tombs:render()
    footsteps:render()
    player:render()
    for key, mummy in pairs(self.mummies) do
        mummy:render()
    end
    if lives < 1 then
        setColour("Black")
        playarea_rectangle("fill", 0, 15, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
        setColour("Orange")
        screenarea_printf('GAME OVER!', 20, 25, VIRTUAL_WIDTH)
    end
end

function PlayState:exit() end
