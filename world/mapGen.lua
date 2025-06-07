worlData = require("world.worlData")

function makePart(type, isMinable)
    return {type = type, isMinable = isMinable}
end

map = {}

math.randomseed(os.time())

for i = 1, worlData.width, 1 do

    local layer = {}

    for j = 1, worlData.height, 1 do

        local r = math.random(4)
        local part

        if r == 1 then
            part = makePart("grass", false)
        elseif r == 2 then
            part = makePart("iron", true)
        elseif r == 3 then
            part = makePart("coal", true)
        elseif r == 4 then
            part = makePart("stone", true)
        end

        table.insert(layer, j, part)
    end

    table.insert(map, i, layer)
end

return map