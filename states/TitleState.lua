TitleState = Class{__includes = BaseState}

function TitleState:init()
    
end

function TitleState:update(dt)
   
end

function TitleState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    screenarea_printf('"OH MUMMY" © 1984 GEM SOFTWARE', 0, 0, VIRTUAL_WIDTH, 'center')
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    drawTombs()
    drawItem(itemKey,16,0)
    drawItem(itemSarcophagus,16 + 40 + 16,0)
end

function TitleState:exit() end

function drawTomb(x,y)
    x = x - 1
    y = y - 1
    toggle = true
    for i=1,TOMB_HEIGHT do
        for j=1,TOMB_WIDTH do
            if toggle then setColour("Orange") else setColour("Bright Yellow") end
            playarea_points(x + j, y + i)
            toggle = not toggle
        end
        toggle = not toggle
    end
end

function drawTombs()
    for i=0,3 do
        for j=0,4 do
            drawTomb((GUTTER_WIDTH * (j + 1)) + (TOMB_WIDTH * j), (GUTTER_HEIGHT * (i + 1)) + (TOMB_HEIGHT * i))
        end
    end
end

function drawItem(item, x, y)
    x = x - 1
    y = y - 1
    for i,line in ipairs(item) do
        for j,cell in ipairs(item[i]) do
            setColour("Black")
            if cell == 0 then setColour("Sky Blue") end
            if cell == 1 then setColour("Bright Yellow") end
            if cell == 2 then setColour("Orange") end
            playarea_points(x + j, y + i)
        end
    end
end