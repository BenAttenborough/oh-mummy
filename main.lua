push = require 'libs/push'
Class = require 'libs/class'
Timer = require 'libs/timer'

require 'StateMachine'
require 'states/BaseState'
require 'states/TitleState'

WINDOW_WIDTH = 1024
WINDOW_HEIGHT = 576

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 270

function love.update(dt)
    gStateMachine:update(dt)
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Oh Mummy!')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end
    }
    gStateMachine:change('title', {})
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    push:apply('end')
end