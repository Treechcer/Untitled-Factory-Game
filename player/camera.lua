worlData = require("world.worlData")

camera = {
    x = 0,
    y = 0,
    speed = 1500,
}

function camera.viewPort(dir, dt)
    local player = require("player.player")

    camera.moved = false

    local width, height = love.graphics.getDimensions()
    local X = 20
    local Y = 20

    local len = math.sqrt(dir.x^2 + dir.y^2)
    local move = false

if (player.x < X or player.x > 750 - X or player.y < Y or player.y > 600 - Y) then
    if player.x < X and camera.x > 0 then
        move = true
    elseif player.x > 750 - X and camera.x < 3200 then
        move = true
    elseif player.y < Y and camera.y > 0 then
        move = true
    elseif player.y > 550 - Y and camera.y < 2400 then
        --[[
            this doesn't work for some reason, so I'll do it later hopefully
        ]]
        move = true
    end
    if not move then
        player.move(dir, dt)
    end
end

    if len ~= 0 and ((player.x > X and player.y > Y) or (move)) then
        camera.x = camera.x + (dir.x / len) * camera.speed * dt
        camera.y = camera.y + (dir.y / len) * camera.speed * dt
        camera.moved = true
    end

    if camera.x < 0 then
        camera.x = 0
        player.move(dir, dt)
    elseif camera.x > 3200 then
        camera.x = 3200
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