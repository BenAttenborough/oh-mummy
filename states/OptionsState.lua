OptionsState = Class{__includes = BaseState}

function OptionsState:init()
   
end

function OptionsState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        gStateMachine:change('play')
    end
    if love.keyboard.wasPressed('i') then
        gStateMachine:change('instructions')
    end
end

function OptionsState:render()
    love.graphics.clear(getColour("Sky Blue"))
    setColour("Black")
    playarea_rectangle("fill", 30, 0, 230, 150)
    screenarea_printf('HI-SCORE-TABLE', 0, 65, VIRTUAL_WIDTH, 'center')
    screenarea_printf('I-Instructions  O-Options  P-Play  ?', 0, 180, VIRTUAL_WIDTH, 'center')
end

function OptionsState:exit()
    love.keyboard.reset()
end