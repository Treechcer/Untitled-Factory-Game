menu = {}

local width, height = love.graphics.getDimensions()

menu.button = {
    height = height / 20,
    width = width / 3.5,
    text = "Start Game!",
    X = (width / 2) - (width / 3.5 / 2),
    Y = (height / 2) - (height / 20 / 2)
}

function menu.drawMenu()
    local player = require("player.player")

    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", (width / 2) - (menu.button.width / 2), (height / 2) - (menu.button.height / 2), menu.button.width, menu.button.height)

    love.graphics.setColor(0,0,0)
    font = love.graphics.newFont(24)
    love.graphics.setFont(font)
    love.graphics.print(menu.button.text, (width / 2) - (menu.button.width / 3), (height / 2) - (menu.button.height / 2))

    player.tiles()
end

function menu.buttonCheck(x, y)
    local game = require("game")

    if x >= menu.button.X and x <= menu.button.X + menu.button.width and y >= menu.button.Y and y <= menu.button.Y + menu.button.height then
        game.gameState = "IN-GAME"
    end
end

return menu