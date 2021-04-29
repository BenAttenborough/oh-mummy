PreState = Class{__includes = BaseState}

-- require 'items/player/Player'
require 'items/player/playerSprite'

function PreState:init()
    -- player = Player(1,3,lives)
end

function PreState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play')
    end
    if love.keyboard.wasPressed('i') then
        gStateMachine:change('instructions')
    end
    if love.keyboard.wasPressed('o') then
        gStateMachine:change('options')
    end
end

function PreState:render()
    love.graphics.clear(getColour("Sky Blue"))
    setColour("Black")
    playarea_rectangle("fill", 30, -10, 230, 170)
    setColour("Orange")
    playarea_rectangle("fill", 45, 5, 200, 140)
    setColour("Bright Yellow")
    playarea_rectangle("fill", 75, 20, 140, 30)
    playarea_rectangle("fill", 60, 45, 170, 85)
    setColour("Black")
    drawItem(playerSpriteRight2, 52, 20)
    drawItem(playerSpriteLeft2, 223, 20)
    screenarea_printf('HI-SCORE-TABLE', 0, 40, VIRTUAL_WIDTH, 'center')
    screenarea_printf('I-Instructions  O-Options  P-Play  ?', 0, 180, VIRTUAL_WIDTH, 'center')
    for i,score in ipairs(highScores) do
        screenarea_printf(string.format("%05d", score.amount), 80, 65 + (i -1) * 15, VIRTUAL_WIDTH )
        screenarea_printf(score.name, 130, 65 + (i -1) * 15, VIRTUAL_WIDTH )
    end
end

function PreState:exit()
    love.keyboard.reset()
end