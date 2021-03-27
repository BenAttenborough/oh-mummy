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

