PlayState = Class{__includes = BaseState}

require 'items/player/Player'

function PlayState:init()
    tombs = createTombs()
    player = Player(0,0)
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
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    for i,tomb in ipairs(tombs) do
        tomb:render()
    end
    player:render()
    drawItem(footstepsSprite,16,0)
end

function PlayState:exit() end
