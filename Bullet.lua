local Entity = require "Entity"
local Collision = require "Collision"
local Bullet = Entity:extend()

function Bullet:new(posX, posY, width, height, speed)
    Bullet.super.new(self, posX, posY, width, height)
    self.color = { 1, 1, 1 }
    self.speed = speed
    self.dead = false
end

function Bullet:update(dt)
    self.posY = self.posY + self.speed * dt
    if self.posY + self.height < 0 then
        self.dead = true
    end
end

function Bullet:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.posX, self.posY, self.width, self.height)
    love.graphics.setColor(1,1,1)
end

function Bullet:checkHit(enemies)
    if self.dead then return end
    for _, enemy in ipairs(enemies) do
        if not enemy.hit and Collision.checkCollision(self, enemy) then
            self.dead = true
            enemy.hit = true
            return
        end
    end
end

return Bullet