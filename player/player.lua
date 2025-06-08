camera = require("player.camera")

local width, height = love.graphics.getDimensions()

player = {
    x = width / 2 - 25,
    y = height / 2 - 25,
    width = height / 10,
    height = height / 10,
    speed = 300,

    inventory = {
        stone = 0, ironOre = 0, ironBar = 0, coal = 0
    }
}

function player.move(dir, dt)
    local len = ((dir.x ^ 2) + (dir.y ^ 2)) ^ (1/2)

    if len ~= 0 then
        player.y = player.y + ((dir.y / len) * player.speed * dt)
        player.x = player.x + ((dir.x / len) * player.speed * dt)
    end

    if player.x < 0 then
        player.x = 0
    elseif player.x > 740 then
        player.x = 740
    end
    if player.y < 0 then
        player.y = 0
    elseif player.y > 540 then
        player.y = 540
    end
end

return player