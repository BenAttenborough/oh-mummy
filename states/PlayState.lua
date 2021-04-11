PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/mummy/Mummy'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    player = Player(1,1)
    footsteps = Footsteps()
    mummy = Mummy(1,1)
    currentMap = deepcopy(map)
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
    player:update(dt)
    mummy:update(dt)
end

function PlayState:renderLives()
    setColour("Black")
    love.graphics.rectangle('fill', 240, 40, 100, 15)
    player:renderLives(5)
end

function PlayState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    love.graphics.setFont(gTitleFont)
    setColour("Orange")
    screenarea_printf('SCORE', 14, 0, VIRTUAL_WIDTH)
    setColour("Sky Blue")
    screenarea_printf(string.format("%05d", score), 60, 0, VIRTUAL_WIDTH)
    setColour("Orange")
    screenarea_printf('MEN', 175, 0, VIRTUAL_WIDTH)
    self:renderLives()
    playarea_rectangle("line", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    tombs:render()
    footsteps:render()
    player:render()
    mummy:render()
end

function PlayState:exit() end
