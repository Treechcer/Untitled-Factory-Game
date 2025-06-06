camera = {
    x = 0,
    y = 0,
    speed = 100
}

function camera.viewPort(dir, dt)
    local len = ((dir.x ^ 2) + (dir.y ^ 2)) ^ (1/2)

    if len ~= 0 then
        camera.y = camera.y + ((dir.y / len) * camera.speed * dt)
        camera.x = camera.x + ((dir.x / len) * camera.speed * dt)
    end
end

return camera