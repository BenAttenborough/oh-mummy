
function flipSpriteHorz(sprite)
    flippedSprite = {}
    for i,v in ipairs(sprite) do
        table.insert(flippedSprite, {})
        for index, value in ipairs(sprite[i]) do
            table.insert(flippedSprite[i], 1, value)
        end
    end
    return flippedSprite
end

playerSpriteRight1 = {
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0},
    {0,0,0,0,3,3,3,3,3,3,3,3,3,3,0,0},
    {0,0,0,0,3,3,3,1,1,2,0,2,0,0,0,0},
    {0,0,0,0,0,1,1,1,2,2,2,2,2,2,0,0},
    {0,0,0,0,0,3,3,1,2,2,0,2,0,0,0,0},
    {0,0,0,0,1,1,1,3,3,2,2,0,0,0,0,0},
    {0,0,0,1,1,1,3,3,3,3,3,0,0,0,0,0},
    {0,0,0,1,1,1,1,1,2,3,3,2,0,0,0,0},
    {0,0,0,0,3,1,1,2,2,2,3,2,0,0,0,0},
    {0,0,0,0,3,3,3,3,2,3,3,0,0,0,0,0},
    {0,0,0,0,0,3,3,3,3,3,0,0,0,0,0,0},
    {0,0,0,0,0,0,3,3,3,3,0,0,0,0,0,0},
    {0,0,0,0,0,0,3,3,3,3,0,0,0,0,0,0},
    {0,0,0,0,0,0,2,2,2,2,0,0,0,0,0,0},
    {0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0},
}

playerSpriteRight2 = {
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0},
    {0,0,0,0,3,3,3,3,3,3,3,3,3,3,0,0},
    {0,0,0,0,3,3,3,1,1,2,0,2,0,0,0,0},
    {0,0,0,0,0,1,1,1,2,2,2,2,2,2,0,0},
    {0,0,0,0,0,3,3,1,2,2,0,2,0,0,0,0},
    {0,0,0,0,1,1,1,3,3,2,2,0,0,0,0,0},
    {0,0,0,0,1,1,1,1,3,3,3,0,0,0,0,0},
    {0,0,0,0,3,1,1,1,1,1,1,1,2,2,0,0},
    {0,0,0,0,3,3,1,1,1,1,1,1,2,2,0,0},
    {0,0,0,3,3,3,3,3,3,0,3,3,0,0,0,0},
    {0,0,3,3,3,3,3,3,0,3,3,3,3,0,0,0},
    {0,0,2,3,3,3,3,0,3,3,3,3,3,0,0,0},
    {0,2,2,2,3,3,0,0,0,3,3,3,3,3,0,0},
    {0,0,2,2,2,0,0,0,0,0,2,2,2,2,0,0},
    {0,0,0,2,2,2,0,0,0,0,2,2,2,2,2,0},
}

-- playerSpriteRight1 = {
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
-- }

-- playerSpriteRight2 = {
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
--     {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
-- }

playerSpriteLeft1 = flipSpriteHorz(playerSpriteRight1)
playerSpriteLeft2 = flipSpriteHorz(playerSpriteRight2)

playerSpriteDown1 = {
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0},
    {0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0},
    {0,0,0,0,2,3,3,3,3,3,3,2,0,0,0,0},
    {0,0,0,0,2,3,3,3,3,3,3,2,0,0,0,0},
    {0,0,0,0,0,2,2,3,3,2,2,0,0,0,0,0},
    {0,0,0,1,1,3,2,2,2,2,1,1,0,0,0,0},
    {0,0,1,1,1,3,3,2,2,3,3,1,1,0,0,0},
    {0,0,1,1,1,3,3,3,3,3,3,1,1,0,0,0},
    {0,0,1,1,2,3,3,3,3,3,3,3,2,0,0,0},
    {0,0,0,2,2,3,3,0,3,3,3,3,0,0,0,0},
    {0,0,0,3,3,3,3,0,3,3,3,3,0,0,0,0},
    {0,0,0,2,2,2,2,0,3,3,3,3,0,0,0,0},
    {0,0,0,2,2,2,0,0,2,3,3,3,0,0,0,0},
    {0,0,0,0,0,0,0,0,2,2,2,2,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,0},
}

playerSpriteDown2 = flipSpriteHorz(playerSpriteDown1)

playerSpriteUp1 = {
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0},
    {0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0},
    {0,0,0,0,2,3,3,3,3,3,3,2,0,0,0,0},
    {0,0,0,0,2,2,1,1,1,1,2,2,0,0,0,0},
    {0,0,0,0,0,2,2,1,1,2,2,0,2,0,0,0},
    {0,0,0,1,1,3,3,3,3,3,1,1,1,0,0,0},
    {0,0,1,1,1,3,3,3,3,3,1,1,1,0,0,0},
    {0,0,1,1,1,3,3,3,3,3,3,1,1,0,0,0},
    {0,0,1,1,1,3,3,3,3,3,3,3,0,0,0,0},
    {0,0,2,2,3,3,3,0,3,3,3,3,0,0,0,0},
    {0,0,0,3,3,3,3,0,3,3,3,3,0,0,0,0},
    {0,0,0,2,2,2,2,0,3,3,3,3,0,0,0,0},
    {0,0,0,0,2,2,2,0,3,3,3,2,0,0,0,0},
    {0,0,0,0,0,0,0,0,2,2,2,2,0,0,0,0},
    {0,0,0,0,0,0,0,0,2,2,2,0,0,0,0,0},
}

playerSpriteUp2 = flipSpriteHorz(playerSpriteUp1)
