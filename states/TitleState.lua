TitleState = Class{__includes = BaseState}

function TitleState:init()
    
end

function TitleState:update(dt)
   
end

function TitleState:render()
    love.graphics.setColor(204/255, 33/255, 75/255)
    love.graphics.printf('OH MUMMY!', 0, 40, VIRTUAL_WIDTH, 'center')
end

function TitleState:exit() end