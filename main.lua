love = require("love")
player = require("player.player")
map = require("world.mapGen")
camera = require("player.camera")

function love.draw()

    local width, height = love.graphics.getDimensions()

    for i = 1, #map, 1 do
        for j = 1, #map[i], 1 do
            if map[i][j] == "" then
                love.graphics.setColor(1,0,0)
            elseif map[i][j] == "iron" then
                love.graphics.setColor(0,1,0)
            elseif map[i][j] == "coal" then
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill", i * width / 10 - (width / 10) - (camera.x), j * height / 10 - (height / 10) - (camera.y), width / 10, height / 10)
        end
    end

    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function love.load()
    
end

function love.update(dt)
    move = {x = 0, y = 0}

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        move.y = -1
    end
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        move.y = 1
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        move.x = -1
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        move.x = 1
    end

    player.move({x = move.x, y = move.y}, dt)
    camera.viewPort({x = move.x, y = move.y}, dt)
end