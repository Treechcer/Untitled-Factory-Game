player = require("player.player")
camera = require("player.camera")

local width, height = love.graphics.getDimensions()

buildings = {
    structures = {
        furnace = {stone = 10}
    }
}

function buildings.build()
    player.tiles()
end

return buildings