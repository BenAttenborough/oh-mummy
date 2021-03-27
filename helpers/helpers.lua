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
