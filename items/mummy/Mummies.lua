Mummies = Class{}

require 'items/mummy/mummySprite'

function Mummies:init()
    self.mummies = {};
end

function Mummies:update(dt)
    for key, mummy in pairs(self.mummies) do
        mummy:update(dt)
    end
end

function Mummies:render()
    for key, mummy in pairs(self.mummies) do
        mummy:render()
    end
end

function Mummies:add(x,y)
    table.insert(self.mummies, Mummy(x,y))
end

function Mummies:collides(obstacle)
    for key, mummy in pairs(self.mummies) do
        if mummy:collide(obstacle) then
            -- action()
        end
    end
end