Tombs = Class{}

require 'items/tombs/Tomb'

function Tombs:init()
    self.tombs = {}
end

function Tombs:update()
    -- print("Update tombs")
    for i,tomb in ipairs(self.tombs) do
        tomb:update()
    end
end

function Tombs:create()
    local tombTypes = {}
    for i=1,10 do table.insert(tombTypes, 1) end
    for i=1,6 do table.insert(tombTypes, 2) end
    table.insert(tombTypes, 3)
    table.insert(tombTypes, 4)
    table.insert(tombTypes, 5)
    table.insert(tombTypes, 6)
    tombTypes = M.shuffle(tombTypes, os.time())
    local type = 0
    for i=0,3 do
        for j=0,4 do
            table.insert(self.tombs, Tomb((j * 7) + 2, (i * 5) + 2, false, tombTypes[type]))
            type = type + 1
        end
    end
end

function Tombs:render()
    for i,tomb in ipairs(self.tombs) do
        tomb:render()
    end
end