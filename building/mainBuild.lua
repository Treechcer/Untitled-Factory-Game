player = require("player.player")
camera = require("player.camera")

local width, height = love.graphics.getDimensions()

buildings = {
    structures = {
        furnace = {stone = 10}
    },
    active = {},
    numerator = 0
}

function buildings.build(pos)
    local tileSize = height / 10

    local worlPosX = player.x + camera.x + (tileSize * pos.x)
    local worlPosY = player.y + camera.y + (tileSize * pos.y)


    X = math.floor(worlPosX / tileSize) + 1
    Y = math.floor(worlPosY / tileSize) + 1

    buildings.active["b" .. buildings.numerator] = {tileX = X, tileY = Y, width = 1, height = 1, type = "furnace"}
    buildings.numerator = buildings.numerator + 1
end

return buildings