Tomb = Class{}

function Tomb:init(x, y, open, type)
    self.x = x
    self.y = y
    self.isOpen = open or false
    self.type = type
end

function Tomb:update(dt)
    if not self.isOpen then
        if self:isSurrounded() == true then
            self.isOpen = true
            if self.type == 1 then score = score + 5 end
            if self.type == 5 then score = score + 5 end
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
    
    if self.type == 1 then 
        drawItem(itemCoffin, (self.x * 8), (self.y * 8))
    end
    if self.type == 2 then
        toggle = true
        for i=0,TOMB_HEIGHT - 1 do
            for j=0,TOMB_WIDTH - 1 do
                if toggle then setColour("Orange") else setColour("Black") end
                playarea_points((self.x * 8) + j, (self.y * 8) + i)
                toggle = not toggle
            end
            toggle = not toggle
        end  
    end
    if self.type == 3 then drawItem(itemKey, (self.x * 8), (self.y * 8)) end
    if self.type == 4 then drawItem(itemScroll, (self.x * 8), (self.y * 8)) end
    if self.type == 5 then drawItem(itemSarcophagus, (self.x * 8), (self.y * 8)) end
    if self.type == 6 then drawItem(itemSarcophagus, (self.x * 8), (self.y * 8)) end
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