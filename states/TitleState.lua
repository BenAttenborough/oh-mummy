TitleState = Class{__includes = BaseState}

function TitleState:init()
    
end

function TitleState:update(dt)
   
end

function TitleState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    screenarea_printf('"OH MUMMY" (C) 1984 GEM SOFTWARE', 0, 0, VIRTUAL_WIDTH, 'center')
    love.graphics.rectangle("fill", PLAYAREA_OFFSET_LEFT, PLAYAREA_OFFSET_TOP, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
end

function TitleState:exit() end
