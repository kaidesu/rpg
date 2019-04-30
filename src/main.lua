local sti = require "lib/sti"

function love.load()
    map = sti("maps/world-1.lua")
end

function love.draw()
    love.graphics.scale(3, 3)
    map:draw(0, 0)
end