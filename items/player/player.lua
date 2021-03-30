Player = Class{}

function Player:init(x, y, open)
    self.x = x
    self.y = y
    self.isOpen = open or false
end

function Player:update(dt)
    
end

function Player:render()
    toogle = true
    for i=0,GUTTER_HEIGHT - 1 do
        for j=0,GUTTER_WIDTH - 1 do
            if toggle then setColour("Orange") else setColour("Bright Yellow") end
            playarea_points(self.x + j, self.y + i)
        end
    end    
end
