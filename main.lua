Object = require "lib.classic"
local Enemy = require "Enemy"
local Player = require "Player"
local Collision = require "Collision"
local GameState = require "GameState"
local Hub = require "layouts.Hub"

local gameOver = false
local gameEnd = false
local player, state
local brackground = love.graphics.newImage("img/galaxy.jpg")

function love.load()
    gameOver = false
    gameEnd = false
    screenW, screenH = love.graphics.getDimensions(screen)
    print("w: "..screenW.." h: "..screenH)
    state = GameState("SpaceShipExample", 3)
    player = Player((screenW / 2) - 50, (screenH / 2) + 150, 100, 100, 450)
    hub = Hub()
    enemies = {}
    makeEnemies()
end

function love.update(dt)
    if gameOver then return end
    player:update(dt)
    player:checkBulletCollisions(enemies)
    for i = #enemies, 1, -1 do
        local enemy = enemies[i]
        enemy:update(dt)

        if Collision.checkCollision(player, enemy) then
            enemy.hit = true
            state:loseLife()
        end

        if enemy.hit then
            state:addPoints(10)
            table.remove(enemies, i)
        end

        if state:isGameOver() then
            gameOver = true
            return
        end

        if state:isGameEnd() then
            gameEnd = true
            return
        end
    end
end

function love.draw()
    love.graphics.draw(brackground, 0, 0)

    if gameOver then
        hub:showGameOver()
        return
    end

    if gameEnd then
        hub:showGameEnd()
        return
    end

    player:draw()
    for _, enemy in ipairs(enemies) do
        enemy:draw()
    end
    hub:draw(state)
end

function love.keypressed(key)
    if gameOver or gameEnd then
        if key == "return" then
            state:reset()
            player:reset()
            enemies = {}
            makeEnemies()
            gameOver = false
            gameEnd = false
        end
        return
    end
    player:keyPressed(key)
end

function makeEnemies()
    for i = 1, 15, 1 do
        local enemy = Enemy(math.random(10, 590), math.random(0, screenH / 2), 50, 50, math.random(100, 500))
        table.insert(enemies, enemy)
    end
end
