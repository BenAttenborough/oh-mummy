PlayState = Class{__includes = BaseState}

function PlayState:init()
    tombs = createTombs()
end

function PlayState:update(dt)
   
end

function PlayState:render()
    love.graphics.clear(getColour("White"))
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    screenarea_printf('"OH MUMMY" © 1984 GEM SOFTWARE', 0, 0, VIRTUAL_WIDTH, 'center')
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    for i,tomb in ipairs(tombs) do
        tomb:render()
    end
    drawItem(itemKey,16,0)
    drawItem(itemSarcophagus,16 + 40 + 16,0)
end

function PlayState:exit() end

function drawItem(item, x, y)
    x = x - 1
    y = y - 1
    for i,line in ipairs(item) do
        for j,cell in ipairs(item[i]) do
            if cell > 0 then
                setColour("Black")
                if cell == 1 then setColour("Bright Yellow") end
                if cell == 2 then setColour("Orange") end
                if cell == 3 then setColour("Sky Blue") end
                playarea_points(x + j, y + i)
            end
        end
    end
end