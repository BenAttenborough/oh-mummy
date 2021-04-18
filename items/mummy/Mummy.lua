Mummy = Class{}

require 'items/mummy/mummySprite'

function Mummy:init(x, y, direction)
    self.x = x
    self.y = y
    self.direction = direction or "right"
    self.movementCounter = 0
    self.directions = {'right', 'left', 'up', 'down'}
end

function Mummy:update(dt)
    self:movement(dt)
end

function Mummy:render()
    if self.direction == 'right' then
        self:drawSprite(mummySpriteRight1, mummySpriteRight2, self.x)    
    end
    if self.direction == 'left' then
        self:drawSprite(mummySpriteLeft1, mummySpriteLeft2, self.x)    
    end
    if self.direction == 'up' then
        self:drawSprite(mummySpriteUp1, mummySpriteUp2, self.y)    
    end
    if self.direction == 'down' then
        self:drawSprite(mummySpriteDown1, mummySpriteDown2, self.y)    
    end
end

function Mummy:drawSprite(frame1, frame2, axis)
    if axis % 2 == 0 then
        drawItem(frame1, (self.x - 1) * 8, ((self.y - 1) * 8))
    else
        drawItem(frame2, (self.x - 1) * 8, ((self.y - 1) * 8))
    end
end

function Mummy:movement(dt)
    if self.movementCounter < MOVEMENT_INTERVAL then
        self.movementCounter = self.movementCounter + dt
        return
    end
    if (self.x -1) % 7 == 0 and ((self.y - 3) % 10) == 0  then
        self.direction = self.directions[ love.math.random(1,4) ]
    end
    if self.direction == 'right' then
        if self.x <= 35 then
            self.x = self.x + 1
        end
        self.movementCounter = 0
    end
    if self.direction == 'left' then
        if self.x > 1 then
            self.x = self.x - 1
        end
        self.movementCounter = 0
    end
    if self.direction == 'down' then
        if self.y <= 22 then
            self.y = self.y + 1
        end
        self.movementCounter = 0
    end
    if self.direction == 'up' then
        if self.y > 3 then
            self.y = self.y - 1
        end
        self.movementCounter = 0
    end
end


function Mummy:collides(obstacle)
    -- print("self.x", self.x)
    -- print("self.y", self.y)
    -- print("obstacle.x", obstacle.x)
    -- print("obstacle.y", obstacle.y)
    if (self.x == obstacle.x and self.y == obstacle.y) then
        return true
    end
    return false
end