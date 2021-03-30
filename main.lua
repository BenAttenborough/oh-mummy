push = require 'libs/push'
Class = require 'libs/class'
Timer = require 'libs/timer'

require 'StateMachine'
require 'states/BaseState'
require 'states/TitleState'
require 'states/ColourState'

require 'configs/global'

require 'helpers/helpers'
require 'helpers/input'

require 'items/tomb'
require 'items/key'
require 'items/sarcophagus'

require 'items/player/player'

function love.update(dt)
    gStateMachine:update(dt)
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Oh Mummy!')
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        pixelperfect = true,
        vsync = true
    })

    gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['colour'] = function() return ColourState() end,
    }
    gStateMachine:change('title', {})
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    push:apply('end')
end