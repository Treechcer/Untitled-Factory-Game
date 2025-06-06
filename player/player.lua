camera = require("player.camera")

math.randomseed(os.time())
local width, height = love.graphics.getDimensions()

player = {
    x = 0,
    y = 0,
    width = 50,
    height = 50,
    speed = 150
}

function player.move(dir, dt)
    local len = ((dir.x ^ 2) + (dir.y ^ 2)) ^ (1/2)

    if len ~= 0 then
        player.y = player.y + ((dir.y / len) * player.speed * dt)
        player.x = player.x + ((dir.x / len) * player.speed * dt)
    end
end

return player