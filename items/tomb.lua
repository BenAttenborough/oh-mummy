Tomb = Class{}

function Tomb:init(x, y, open)
    self.x = x
    self.y = y
    self.isOpen = open or false
end

function Tomb:update(dt)
    
end

function Tomb:render()
    if self.isOpen then
    else
        self:renderUnopenedTomb()
    end
end

function Tomb:renderUnopenedTomb()
    toggle = true
    for i=0,TOMB_HEIGHT - 1 do
        for j=0,TOMB_WIDTH - 1 do
            if toggle then setColour("Orange") else setColour("Bright Yellow") end
            playarea_points(self.x + j, self.y + i)
            toggle = not toggle
        end
        toggle = not toggle
    end
end
