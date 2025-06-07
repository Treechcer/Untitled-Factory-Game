camera = require("player.camera")

local width, height = love.graphics.getDimensions()

player = {
    x = width / 2 - 25,
    y = height / 2 - 25,
    width = 50,
    height = 50,
    speed = 300
}

function player.move(dir, dt)
    local len = ((dir.x ^ 2) + (dir.y ^ 2)) ^ (1/2)

    if len ~= 0 then
        player.y = player.y + ((dir.y / len) * player.speed * dt)
        player.x = player.x + ((dir.x / len) * player.speed * dt)
    end

    if player.x < 0 then
        player.x = 0
    elseif player.x > 750 then
        player.x = 750
    end
    if player.y < 0 then
        player.y = 0
    elseif player.y > 550 then
        player.y = 550
    end
end

return player