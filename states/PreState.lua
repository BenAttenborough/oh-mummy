PreState = Class{__includes = BaseState}

function PreState:init()
   
end

function PreState:update(dt)
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

function PreState:render()
    love.graphics.clear(getColour("Sky Blue"))
    setColour("Black")
    playarea_rectangle("fill", 30, 0, 230, 150)
    setColour("Orange")
    playarea_rectangle("fill", 45, 15, 200, 120)
    setColour("Bright Yellow")
    playarea_rectangle("fill", 75, 30, 140, 30)
    playarea_rectangle("fill", 60, 55, 170, 60)
    setColour("Black")
    playarea_rectangle("fill", 55, 30, 15, 15)
    playarea_rectangle("fill", 220, 30, 15, 15)
    screenarea_printf('HI-SCORE-TABLE', 0, 65, VIRTUAL_WIDTH, 'center')
    screenarea_printf('I-Instructions  O-Options  P-Play  ?', 0, 180, VIRTUAL_WIDTH, 'center')
end

function PreState:exit()
    love.keyboard.reset()
end