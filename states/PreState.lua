PreState = Class{__includes = BaseState}

function PreState:init()
   
end

function PreState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play')
    end
end

function PreState:render()
    love.graphics.clear(getColour("Bright Blue"))
end

function PreState:exit()
    -- Must clear keyboard
    love.keyboard.reset()
end