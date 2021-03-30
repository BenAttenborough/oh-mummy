love.keyboard.keysPressed = {}
love.keyboard.keysHeld = {}

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    love.keyboard.keysHeld[key] = true
end

function love.keyreleased(key)
    love.keyboard.keysHeld[key] = false
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.keyboard.wasHeld(key)
    return love.keyboard.keysHeld[key]
end