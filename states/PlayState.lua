PlayState = Class{__includes = BaseState}

require 'items/player/Player'
require 'items/mummy/Mummy'
require 'items/footsteps/Footsteps'
require 'items/tombs/Tombs'

function PlayState:init()
    tombs = Tombs()
    tombs:create()
    player = Player(1,3)
    footsteps = Footsteps()
    mummy = Mummy(1,3)
    currentMap = deepcopy(map)
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
    player:update(dt)
    mummy:update(dt)
    if player:collides(mummy) then
        print("Collision")
    end
end

function PlayState:renderLives()
    setColour("Black")
    love.graphics.rectangle('fill', 240, 39, 84, 16)
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
    setColour("Black")
    playarea_rectangle("fill", 0, 15, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    playarea_rectangle("fill", 7 * TILE_SIZE, 0, TILE_SIZE, TILE_SIZE)
    tombs:render()
    footsteps:render()
    player:render()
    mummy:render()
end

function PlayState:exit() end
