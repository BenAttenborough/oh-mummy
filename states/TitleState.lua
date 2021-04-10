TitleState = Class{__includes = BaseState}

function TitleState:init()
    tombs = Tombs()
    tombs:createTitleTombs()
end

function TitleState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        gStateMachine:change('play')
    end
end

function TitleState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    screenarea_printf('"OH MUMMY" © 1984 GEM SOFTWARE', 0, 0, VIRTUAL_WIDTH, 'center')
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    tombs:render()
    setColour("Bright Yellow")
    playarea_rectangle("fill", 72, 56, 152, 64)
    setColour("Black")
    playarea_rectangle("fill", 85, 80, 125, 15)
    setColour("Orange")
    screenarea_printf('"C" TO CONTINUE', 102, 125, VIRTUAL_WIDTH)
end

function TitleState:exit() end