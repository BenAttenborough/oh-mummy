Player = Class{}

require 'items/player/playerSprite'

function Player:init(x, y)
    self.x = x
    self.y = y
    self.movementCounter = 0
end

function Player:update(dt)
    if love.keyboard.wasHeld('right') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            if self.x < 35 and map[self.y + 1][self.x + 2] ~= 1 then
                self.x = self.x + 1
            end
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
    if love.keyboard.wasHeld('left') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            if self.x > 0 and map[self.y + 1][self.x] ~= 1 then
                self.x = self.x - 1
            end
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
    if love.keyboard.wasHeld('up') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            if self.y > 0 and map[self.y][self.x + 1] ~= 1  then
                self.y = self.y - 1
            end
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
    if love.keyboard.wasHeld('down') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            if self.y < 20 and map[self.y + 2][self.x + 1] ~= 1 then
                self.y = self.y + 1
            end
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
end

function Player:render()
    drawItem(playerSprite, self.x * 8, self.y * 8)   
end
