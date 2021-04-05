function getColour(colour)
    tempColour = gColours[colour]
    if tempColour == nil then
        return {1, 1, 1}
    else
        return {tempColour[1]/255, tempColour[2]/255, tempColour[3]/255} 
    end
end

function setColour(colour)
    love.graphics.setColor( getColour(colour) )
end

function screenarea_printf(text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky)
    leftOffset = SCREENAREA_OFFSET_LEFT + x
    topOffset = SCREENAREA_OFFSET_TOP + y

    if align == "center" then
        leftOffset = 0
    end

    love.graphics.printf(text, leftOffset, topOffset, limit, align, r, sx, sy, ox, oy, kx, ky)
end

function playarea_rectangle(mode, x, y, width, height)
    love.graphics.rectangle( mode, PLAYAREA_OFFSET_LEFT + x, PLAYAREA_OFFSET_TOP + y, width, height )
end

function playarea_points( x, y )
    love.graphics.points( PLAYAREA_OFFSET_LEFT + x, PLAYAREA_OFFSET_TOP + y )
end

function createTombs()
    local tombs = {}
    for i=0,3 do
        for j=0,4 do
            table.insert(tombs, Tomb((GUTTER_WIDTH * (j + 1)) + (TOMB_WIDTH * j), (GUTTER_HEIGHT * (i + 1)) + (TOMB_HEIGHT * i)))
        end
    end
    return tombs
end