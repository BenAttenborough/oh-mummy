TitleState = Class{__includes = BaseState}

function TitleState:init()
    
end

function TitleState:update(dt)
   
end

function TitleState:render()
    setColour("Bright Blue")
    love.graphics.setFont(gTitleFont)
    love.graphics.printf('OH MUMMY!', 0, 0, VIRTUAL_WIDTH, 'center')
    counter = 8;
    for k, v in pairs(gColours) do
        setColour(k)
        love.graphics.printf(k, 0, counter, VIRTUAL_WIDTH, 'center')
        counter = counter + 8
    end
end

function TitleState:exit() end

function setColour(colour)
    tempColour = gColours[colour]
    if tempColour == nil then
        love.graphics.setColor( {255, 255, 255} )
    else
        love.graphics.setColor( {tempColour[1]/255, tempColour[2]/255, tempColour[3]/255} )
    end
end