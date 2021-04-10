push = require 'libs/push'
Class = require 'libs/class'
Timer = require 'libs/timer'
M = require('libs/Moses/moses')

require 'StateMachine'
require 'states/BaseState'
require 'states/TitleState'
require 'states/ColourState'
require 'states/PlayState'
require 'states/PreState'

require 'configs/global'

require 'helpers/helpers'
require 'helpers/input'
require 'helpers/render'

-- require 'items/tomb'
require 'items/key'
require 'items/sarcophagus'
require 'items/coffin'
require 'items/scroll'

require 'map/map'
require 'items/player/player'
require 'items/footsteps/footstepsSprite'

function love.update(dt)
    gStateMachine:update(dt)
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Oh Mummy!')
    score = 0
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    currentMap = deepcopy(map)

    gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['colour'] = function() return ColourState() end,
        ['play'] = function() return PlayState() end,
        ['pre'] = function() return PreState() end,
    }
    gStateMachine:change('title', {})
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    push:apply('end')
end