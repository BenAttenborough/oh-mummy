Tomb = Class{}

function Tomb:init(x, y, open)
    self.x = x
    self.y = y
    self.isOpen = open or false
end

function Tomb:update(dt)
    if not self.isOpen then
        if self:isSurrounded() == true then
            -- print("Opening tomb")
            self.isOpen = true
        end
    end
end

function Tomb:render()
    if self.isOpen then
        self:renderOpenTomb()
    else
        self:renderUnopenedTomb()
    end
end

function Tomb:renderUnopenedTomb()
    toggle = true
    for i=0,TOMB_HEIGHT - 1 do
        for j=0,TOMB_WIDTH - 1 do
            if toggle then setColour("Orange") else setColour("Bright Yellow") end
            playarea_points((self.x * 8) + j, (self.y * 8) + i)
            toggle = not toggle
        end
        toggle = not toggle
    end
end

function Tomb:renderOpenTomb()
    toggle = true
    for i=0,TOMB_HEIGHT - 1 do
        for j=0,TOMB_WIDTH - 1 do
            if toggle then setColour("Orange") else setColour("Sky Blue") end
            playarea_points((self.x * 8) + j, (self.y * 8) + i)
            toggle = not toggle
        end
        toggle = not toggle
    end
end

function Tomb:isSurrounded()
    -- Check if adjacent cells have steps
    -- print("===")
    for i = self.x - 1, self.x + 6 do
        -- print(i)
        -- print("map[1][" .. i .. "]")
        -- print(map[1][i])
        if map[self.y - 1][i] ~= 2 then
            return false
        end
    end
    -- print("===")
    -- return true
    return true
end