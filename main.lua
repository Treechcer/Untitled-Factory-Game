love = require("love")
player = require("player.player")
map = require("world.mapGen")
camera = require("player.camera")
buildings = require("building.mainBuild")
game = require("game")
menu = require("UI.mainMenu")

local width, height = love.graphics.getDimensions()

function drawGame()
    for i = 1, #map do
        for j = 1, #map[i] do
            if map[i][j].type == "grass" then
                love.graphics.setColor(0.29, 0.56, 0.19)
            elseif map[i][j].type == "iron" then
                love.graphics.setColor(0.55, 0.55, 0.6)
            elseif map[i][j].type == "coal" then
                love.graphics.setColor(0.2, 0.2, 0.25)
            elseif map[i][j].type == "stone" then
                love.graphics.setColor(0.4, 0.4, 0.45)
            end
            love.graphics.rectangle("fill", i * height / 10 - height / 10 - camera.x, j * height / 10 - height / 10 - camera.y, height / 10, height / 10)
        end
    end

    love.graphics.setColor(0.6, 0.8, 0.5)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

    love.graphics.setColor(0, 0, 0)
    love.graphics.print(player.y, 100, 100)
end

function love.mousepressed(x, y, istouch)
    if game.gameState == "MENU" then
        menu.buttonCheck(x, y)
    end
end

function love.draw()
    if game.gameState == "MENU" then
       menu.drawMenu()
    elseif game.gameState == "IN-GAME" then
        drawGame()
    end
end

function love.load()

end

function love.update(dt)
    if game.gameState == "MENU" then

    elseif game.gameState == "IN-GAME" then
            move = {x = 0, y = 0}

    if love.keyboard.isDown("w")then
        move.y = -1
    end
    if love.keyboard.isDown("s") then
        move.y = 1
    end
    if love.keyboard.isDown("a") then
        move.x = -1
    end
    if love.keyboard.isDown("d") then
        move.x = 1
    end

    if love.keyboard.isDown("up") then
        buildings.build()
    elseif love.keyboard.isDown("down") then
        buildings.build()
    elseif love.keyboard.isDown("left") then
        buildings.build()
    elseif love.keyboard.isDown("right") then
        buildings.build()
    end

        camera.viewPort({x = move.x, y = move.y}, dt)
    end

end