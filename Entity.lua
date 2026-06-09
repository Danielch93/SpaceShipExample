local Entity = Object:extend()

function Entity:new(posX, posY, width, height)
    self.posX = posX
    self.posY = posY
    self.width = width
    self.height = height
end

function Entity:update(dt)
    
end

return Entity
