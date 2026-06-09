local Entity = require "Entity"
local Bullet = require "Bullet"
local Player = Entity:extend()
local playerSprite = love.graphics.newImage("img/spaceship.png")

function Player:new(posX, posY, width, height, speed)
    self.initPosX = (screenW / 2) - 50
    self.initPosY = (screenH / 2) + 150
    Player.super.new(self, posX, posY, width, height)
    self.sprite = playerSprite
    self.color = { 0, 0, 1 }
    self.scaleX = self.width / self.sprite:getWidth()
    self.scaleY = self.height / self.sprite:getHeight()
    self.speed = speed
    self.listOfBullets = {}
end

function Player:draw()
    love.graphics.draw(self.sprite, self.posX, self.posY, 0, self.scaleX, self.scaleY)
    love.graphics.setColor(1,1,1)

    for i, bullet in ipairs(self.listOfBullets) do
        bullet:draw()
    end
end

function Player:update(dt)
    if love.keyboard.isDown("right") and self.posX <= (screenW - self.width) then
        self.posX = self.posX + self.speed * dt
    end
    if love.keyboard.isDown("left") and self.posX >= 0 then
        self.posX = self.posX - self.speed * dt
    end
    if love.keyboard.isDown("up") and self.posY >= 0 then
        self.posY = self.posY - self.speed * dt
    end
    if love.keyboard.isDown("down") and self.posY <= (screenH - self.height) then
        self.posY = self.posY + self.speed * dt
    end

    for i = #self.listOfBullets, 1, -1 do
        local bullet = self.listOfBullets[i]
        bullet:update(dt)
        if bullet.dead then
            table.remove(self.listOfBullets, i)
        end
    end
end

function Player:reset()
    self.posX = self.initPosX
    self.posY = self.initPosY
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(self.listOfBullets, Bullet(self.posX + self.width / 2, self.posY, 5, 15, -650))
    elseif key == "s" then
        table.insert(self.listOfBullets, Bullet(self.posX + self.width / 2, self.posY, 100, 5, -150))
    end
end

function Player:checkBulletCollisions(enemies)
    for _, bullet in ipairs(self.listOfBullets) do
        bullet:checkHit(enemies)
    end
end

return Player