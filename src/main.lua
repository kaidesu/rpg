local sti = require "lib/sti"

function love.load()
    map = sti("maps/world-1.lua")

    local layer = map:addCustomLayer("sprites", 2)

    -- Fetch player
    local player
    for k, object in pairs(map.objects) do
        if object.name == "player" then
            print("found player object")
            player = object
            break
        end
    end

    -- Create player object
    local sprite = love.graphics.newImage("sprites/down_stand.png")
    layer.player = {
        sprite = sprite,
        x      = player.x,
        y      = player.y,
        ox     = sprite:getWidth() / 2,
        oy     = sprite:getHeight() / 1.35
    }

    -- Draw player
    layer.draw = function(self)
        love.graphics.draw(
            self.player.sprite,
            math.floor(self.player.x),
            math.floor(self.player.y),
            0,
            1,
            1,
            self.player.ox,
            self.player.oy
        )
    end

    -- map:removeLayer("Spawn Point")
end

function love.update(dt)
    local scale = 2
    love.graphics.scale(scale)
    
    map:update(dt)
end

function love.draw()
    

    map:draw()
end