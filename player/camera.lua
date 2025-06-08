worldData = require("world.worldData")

camera = {
    x = 0,
    y = 0,
    speed = 300,
}

function camera.viewPort(dir, dt)
    local player = require("player.player")

    camera.moved = false

    local width, height = love.graphics.getDimensions()

    local X = width / 2 - 25
    local Y = height / 2 - 25

    local len = math.sqrt(dir.x^2 + dir.y^2)

    if (player.x >= 0 and player.x <= X) and dir.x > 0 and len ~= 0 then
        player.move(dir, dt)
        camera.moved = true
    elseif (player.x <= 750 and player.x >= 750 - X) and dir.x < 0 and len ~= 0 then
        player.move(dir, dt)
        camera.moved = true
    elseif (player.y >= 0 and player.y <= Y) and dir.y > 0 and len ~= 0 then
        player.move(dir, dt)
        camera.moved = true
    elseif (player.y <= 550 and player.y >= 550 - Y) and dir.y < 0 and len ~= 0 then
        player.move(dir, dt)
        camera.moved = true
    end

    if len ~= 0 and not camera.moved then
        camera.x = camera.x + (dir.x / len) * camera.speed * dt
        camera.y = camera.y + (dir.y / len) * camera.speed * dt
        camera.moved = true
    end

    if camera.x < 0 then
        camera.x = 0
        player.move(dir, dt)
    elseif camera.x > 2200 then
        camera.x = 2200
        player.move(dir, dt)
    end

    if camera.y < 0 then
        camera.y = 0
        player.move(dir, dt)
    elseif camera.y > 2400 then
        camera.y = 2400
        player.move(dir, dt)
    end
end


return camera