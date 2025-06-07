worlData = require("world.worlData")

map = {}

math.randomseed(os.time())

for i = 1, worlData.width, 1 do

    local layer = {}

    for j = 1, worlData.height, 1 do

        local r = math.random(3)
        local part

        if r == 1 then
            part = {type = "grass", isMinable = false}
        elseif r == 2 then
            part = {type = "iron", isMinable = true}
        elseif r == 3 then
            part = {type = "coal", isMinable = true}
        end

        table.insert(layer, j, part)
    end

    table.insert(map, i, layer)
end

return map