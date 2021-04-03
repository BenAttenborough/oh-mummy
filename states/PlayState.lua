PlayState = Class{__includes = BaseState}

require 'items/player/Player'

function PlayState:init()
    tombs = createTombs()
    player = Player(0,0)
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
    player:update(dt)
end

function PlayState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.setFont(gTitleFont)
    screenarea_printf('"OH MUMMY" © 1984 GEM SOFTWARE', 0, 0, VIRTUAL_WIDTH, 'center')
    playarea_rectangle("fill", 0, 0, PLAYAREA_WIDTH, PLAYAREA_HEIGHT)
    for i,tomb in ipairs(tombs) do
        tomb:render()
    end
    player:render()
    -- drawItem(footstepsSprite,16,0)
    for i,line in ipairs(map) do
        for j,cell in ipairs(map[i]) do
            if cell == 2 then
                if j % 2 == 0 then
                    drawItem(footstepsSprite,(j-1) * 8, (i-1) * 8)
                else
                    drawItem(footstepsSprite2,(j-1) * 8, (i-1) * 8)
                end
            end
        end
    end
end

function PlayState:exit() end
