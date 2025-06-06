map = {}

for i = 1, 10, 1 do

    local layer = {}

    for j = 1, 10, 1 do

        local r = math.random(3)
        local part

        if r == 1 then
            part = ""
        elseif r == 2 then
            part = "iron"
        elseif r == 3 then
            part = "coal"
        end

        table.insert(layer, j, part)
    end

    table.insert(map, i, layer)
end

return map