Tomb = Class{}

function Tomb:init(x, y, open)
    self.x = x
    self.y = y
    self.isOpen = open or false
end

function Tomb:update(dt)
    -- print("Tomb:update")
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
    for i = self.x - 1, self.x + 6 do
        if map[self.y - 1][i] == 0 then
            return false
        end
        if map[self.y + 4][i] == 0 then
            return false
        end
    end
    if map[self.y][self.x - 1] == 0 then
        return false
    end
    if map[self.y + 1][self.x - 1] == 0 then
        return false
    end
    if map[self.y + 2][self.x - 1] == 0 then
        return false
    end
    if map[self.y + 3][self.x - 1] == 0 then
        return false
    end
    if map[self.y][self.x + 6] == 0 then
        return false
    end
    if map[self.y + 1][self.x + 6] == 0 then
        return false
    end
    if map[self.y + 2][self.x + 6] == 0 then
        return false
    end
    if map[self.y + 3][self.x + 6] == 0 then
        return false
    end
    return true
end