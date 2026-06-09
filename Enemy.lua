local Entity = require "Entity"
local Enemy = Entity:extend()
local enemySprite = love.graphics.newImage("img/enemy.png")

function Enemy:new(posX, posY, width, height, speed)
    Enemy.super.new(self, posX, posY, width, height)
    self.sprite = enemySprite
    self.scaleX = self.width / self.sprite:getWidth()
    self.scaleY = self.height / self.sprite:getHeight()
    self.speed = speed
    self.direction = 1
    self.hit = false
end

function Enemy:update(dt)
    self.posX = self.posX + self.speed * self.direction * dt
    if self.posX > screenW - self.width or self.posX < 0 then
        self.direction = self.direction * -1
    end
end

function Enemy:draw()
    --love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.draw(self.sprite, self.posX, self.posY, 0, self.scaleX, self.scaleY)
end

return Enemy