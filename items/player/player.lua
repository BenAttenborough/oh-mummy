Player = Class{}

require 'items/player/playerSprite'

function Player:init(x, y)
    self.x = x
    self.y = y
    self.movementCounter = 0
    self.direction = "right"
end

function Player:afterMovement(direction)
    self.movementCounter = 0
    self.direction = direction
end

function Player:movement(direction, dt)
    if self.movementCounter < MOVEMENT_INTERVAL then
        self.movementCounter = self.movementCounter + dt
        return
    end
    if direction == 'right' then
        if self.x <= 35 and map[self.y][self.x + 1] ~= 1 then
            map[self.y][self.x] = 2
            self.x = self.x + 1
        end
        self:afterMovement(direction)
    end
    if direction == 'left' then
        if self.x >1 and map[self.y][self.x - 1] ~= 1 then
            map[self.y][self.x] = 2
            self.x = self.x - 1
        end
        self:afterMovement(direction)
    end
    if direction == 'up' then
        if self.y > 1 and map[self.y - 1][self.x] ~= 1 then
            map[self.y][self.x] = 2
            self.y = self.y - 1
        end
        self:afterMovement(direction)
    end
    if direction == 'down' then
        if self.y < 20 and map[self.y + 1][self.x] ~= 1 then
            map[self.y][self.x] = 2
            self.y = self.y + 1
        end
        self:afterMovement(direction)
    end
end

function Player:update(dt)
    if love.keyboard.wasHeld('right') then
        self:movement('right', dt)
    end
    if love.keyboard.wasHeld('left') then
        self:movement('left', dt)
    end
    if love.keyboard.wasHeld('up') then
        self:movement('up', dt)
    end
    if love.keyboard.wasHeld('down') then
        self:movement('down', dt)
    end
end

function Player:drawSprite(frame1, frame2, axis)
    if axis % 2 == 0 then
        drawItem(frame1, (self.x - 1) * 8, (self.y - 1) * 8)
    else
        drawItem(frame2, (self.x - 1) * 8, (self.y - 1) * 8)
    end
end

function Player:render()
    if self.direction == "right" then
        self:drawSprite(playerSpriteRight1, playerSpriteRight2, self.x)
    end
    if self.direction == "left" then
        self:drawSprite(playerSpriteLeft1, playerSpriteLeft2, self.x)
    end
    if self.direction == "up" then
        self:drawSprite(playerSpriteUp1, playerSpriteUp2, self.y)
    end
    if self.direction == "down" then
        self:drawSprite(playerSpriteDown1, playerSpriteDown2, self.y)
    end
end
