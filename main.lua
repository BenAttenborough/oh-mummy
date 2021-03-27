push = require 'libs/push'

WINDOW_WIDTH = 1024
WINDOW_HEIGHT = 576

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 270

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Oh Mummy!')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
end