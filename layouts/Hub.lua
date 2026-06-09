local Hub = Object:extend()

function Hub:new()
    self.font = love.graphics.newFont(14)
    self.padding = 10

    bigFont = love.graphics.newFont(48)
    smallFont = love.graphics.newFont(20)
end

function Hub:draw(state)
    local oldFont = love.graphics.getFont()
    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)

    love.graphics.print(state.playerName, self.padding, self.padding)
    love.graphics.print("Vidas: "..state.lives, self.padding, self.padding + 30)

    local points = "Puntos: "..state.points
    local pointsWidth = self.font:getWidth(points)
    love.graphics.print(points, screenW - pointsWidth - self.padding, self.padding)

    local lvl = "Nivel: " .. state.level
    local lvlW = self.font:getWidth(lvl)
    love.graphics.print(lvl, screenW - lvlW - self.padding, self.padding + 20)

    love.graphics.setFont(oldFont)
    love.graphics.setColor(1, 1, 1)
end

function Hub.showGameOver()
    love.graphics.setColor(1, 0, 0)
    love.graphics.setFont(bigFont)
    love.graphics.printf("GAME OVER", 0, screenH / 2 - 50, screenW, "center")

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(smallFont)
    love.graphics.printf("Press Enter to try again", 0, screenH / 2 + 20, screenW, "center")

    love.graphics.setColor(1, 1, 1)
end

function Hub.showGameEnd()
    love.graphics.setColor(1, 1, 0)
    love.graphics.setFont(bigFont)
    love.graphics.printf("GAME END", 0, screenH / 2 - 50, screenW, "center")

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(smallFont)
    love.graphics.printf("Thank for game", 0, screenH / 2 + 20, screenW, "center")

    love.graphics.setColor(1, 1, 1)
end

return Hub