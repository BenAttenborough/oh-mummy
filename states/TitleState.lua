TitleState = Class{__includes = BaseState}

function TitleState:init()
    
end

function TitleState:update(dt)
   
end

function TitleState:render()
    love.graphics.setColor(gColours["Bright Blue"])
    love.graphics.setFont(gTitleFont)
    love.graphics.printf('OH MUMMY!', 0, 0, VIRTUAL_WIDTH, 'center')
    counter = 20;
    for k, v in pairs(gColours) do
        -- love.graphics.setColor(gColours[k])
        love.graphics.printf(k, 0, counter, VIRTUAL_WIDTH, 'center')
        counter = counter + 20
    end
end

function TitleState:exit() end