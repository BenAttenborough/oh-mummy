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
    for i=0,3 do
        for j=0,4 do
            table.insert(self.tombs, Tomb((j * 7) + 2, (i * 5) + 2))
        end
    end
end

function Tombs:render()
    for i,tomb in ipairs(self.tombs) do
        tomb:render()
    end
end