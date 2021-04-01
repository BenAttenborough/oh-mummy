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
            self.x = self.x + 8
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
    if love.keyboard.wasHeld('left') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            self.x = self.x - 8
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
    if love.keyboard.wasHeld('up') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            self.y = self.y - 8
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
    if love.keyboard.wasHeld('down') then
        if self.movementCounter > MOVEMENT_INTERVAL then
            self.y = self.y + 8
            self.movementCounter = 0
        else
            self.movementCounter = self.movementCounter + dt
        end
    end
end

function Player:render()
    drawItem(playerSprite, self.x, self.y)   
end
