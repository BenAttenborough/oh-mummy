Player = Class{}

require 'items/player/playerSprite'

function Player:init(x, y, lives)
    self.x = x
    self.y = y
    self.movementCounter = 0
    self.direction = "right"
    self.lives = lives
    self.hasKey = false
    self.hasScroll = false
    self.hasRoyalTomb = false
end

function Player:afterMovement(direction)
    self.movementCounter = 0
    self.direction = direction
    tombs:update()
end

function Player:getKey()
    print("Testx")
    self.hasKey = true
end

function Player:movement(direction, dt)
    if self.movementCounter < MOVEMENT_INTERVAL then
        self.movementCounter = self.movementCounter + dt
        return
    end
    if direction == 'right' then
        if self.x <= 35 and currentMap[self.y][self.x + 1] ~= 1 then
            currentMap[self.y][self.x] = 2
            self.x = self.x + 1
        end
        self:afterMovement(direction)
    end
    if direction == 'left' then
        if self.x >1 and currentMap[self.y][self.x - 1] ~= 1 then
            currentMap[self.y][self.x] = 3
            self.x = self.x - 1
        end
        self:afterMovement(direction)
    end
    if direction == 'up' then
        if self.y > 1 and currentMap[self.y - 1][self.x] ~= 1 then
            currentMap[self.y][self.x] = 4
            self.y = self.y - 1
        end
        self:afterMovement(direction)
        if self.y == 1 then
            print("Trying to exit level")
            if self:exitRequirementIsMet() then
                print("You CAN exit the level")
            else
                print("You CANNOT exit the level")
            end
        end
    end
    if direction == 'down' then
        if self.y <= 22 and currentMap[self.y + 1][self.x] ~= 1 then
            currentMap[self.y][self.x] = 5
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

function Player:renderLives()
    local offset = 12
    for i=0,self.lives - 1 do
        if offset % 2 == 0 then
            drawItem(playerSpriteRight2, TILE_SIZE * offset, -11)
        else
            drawItem(playerSpriteRight1, TILE_SIZE * offset, -11)
        end
        offset = offset + 1
    end
end

function Player:titleMovement(dt)
    if self.movementCounter < MOVEMENT_INTERVAL then
        self.movementCounter = self.movementCounter + dt
        return
    end
    if self.direction == 'right' then
        if self.x <= 24 then
            currentMap[self.y][self.x] = 2
            self.x = self.x + 1
        else
            self.direction = 'left'
        end     
    end
    if self.direction == 'left' then
        if self.x > 12 then
            currentMap[self.y][self.x] = 3
            self.x = self.x - 1
        else
            self.direction = 'right'
            currentMap[self.y][self.x] = 2
            self.x = self.x + 1
        end     
    end
    self.movementCounter = 0
end

function Player:hitByMummy()
    if self.lives > 1 then
        self.lives = self.lives - 1   
    end
end

function Player:exitRequirementIsMet()
    return self.hasKey
end