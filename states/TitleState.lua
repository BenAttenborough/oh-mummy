TitleState = Class{__includes = BaseState}

function TitleState:init()
    
end

function TitleState:update(dt)
   
end

function TitleState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Blue")
    love.graphics.rectangle( "fill", PLAYAREA_OFFSET_LEFT, PLAYAREA_OFFSET_TOP, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    love.graphics.printf('"OH MUMMY (C) 1984 GEM SOFTWARE"', 0, 0, VIRTUAL_WIDTH, 'center')
end

function TitleState:exit() end
