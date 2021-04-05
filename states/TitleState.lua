TitleState = Class{__includes = BaseState}

function TitleState:init()
    -- tombs = createTombs()
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
    -- for i,tomb in ipairs(tombs) do
    --     tomb:render()
    -- end
    -- drawItem(itemKey,16,0)
    gap = 40
    gutter = 16 
    drawItem(itemSarcophagus, gutter, gutter)
    drawItem(itemSarcophagus, gutter * 2 + gap, gutter)
    drawItem(itemSarcophagus, gutter * 3 + gap * 2, gutter)
    drawItem(itemSarcophagus, gutter * 4 + gap * 3, gutter)
    drawItem(itemKey, gutter * 5 + gap * 4, gutter)
end

function TitleState:exit() end