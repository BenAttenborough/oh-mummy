Mummy = Class{}

require 'items/mummy/mummySprite'

function Mummy:init(x, y, open, type)
    self.x = x
    self.y = y
end

function Mummy:update(dt)

end

function Mummy:render()
    self:drawSprite(mummySpriteDown1, mummySpriteDown2, self.x)
end

function Mummy:drawSprite(frame1, frame2, axis)
    if axis % 2 == 0 then
        drawItem(frame1, (self.x - 1) * 8, (self.y - 1) * 8)
    else
        drawItem(frame2, (self.x - 1) * 8, (self.y - 1) * 8)
    end
end