--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.isShining = false
    -- timer used to switch the highlight rect's color
    self.rectHighlighted = false
end

function Tile:setTween()
    -- set our Timer class to turn cursor highlight on and off
    Timer.every(1, function()
        self.rectHighlighted = not self.rectHighlighted
    end)
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

    if self.isShining then
        -- multiply so drawing white rect makes it brighter
        love.graphics.setBlendMode('add')

        -- render highlight rect color based on timer
        if self.rectHighlighted then
            love.graphics.setColor(1, 1, 1, 96/255)
        else
            love.graphics.setColor(1, 1, 1, 16/255)
        end

        love.graphics.rectangle('fill', (self.gridX - 1) * 32 + (VIRTUAL_WIDTH - 272),
            (self.gridY - 1) * 32 + 16, 32, 32, 4)

        -- back to alpha
        love.graphics.setBlendMode('alpha')
    end
end