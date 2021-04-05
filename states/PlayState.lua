PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    player = Player(1,1)
    footsteps = Footsteps()
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
    player:update(dt)
end

function PlayState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    screenarea_printf('"OH MUMMY" © 1984 GEM SOFTWARE', 0, 0, VIRTUAL_WIDTH, 'center')
    playarea_rectangle("line", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    tombs:render()
    footsteps:render()
    player:render()
end

function PlayState:exit() end
