PowerUp = Class{}

function PowerUp:init(x, y)
    self.x = x
    self.y = y
    self.width = 16
    self.height = 16
    
    -- used to determine whether this brick should be rendered
    self.inPlay = true
end

function PowerUp:hit()

    -- sound on hit
    gSounds['brick-hit-2']:stop()
    gSounds['brick-hit-2']:play()

    self.inPlay = false

    -- play a second layer sound if the brick is destroyed
    if not self.inPlay then
        gSounds['brick-hit-1']:stop()
        gSounds['brick-hit-1']:play()
    end
end

function PowerUp:update(dt)

end

function PowerUp:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['powerups'][2], 
            self.x, self.y)
    end
end