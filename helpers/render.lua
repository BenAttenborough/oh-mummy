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
