local GameState = Object:extend()

function GameState:new(playerName, initialLives, pointsToWin)
    self.playerName = playerName
    self.lives = initialLives
    self.pointsToWin = pointsToWin or 150
    self.points = 0
    self.level = 1
end

function GameState:reset()
    self.lives = 3
    self.points = 0
    self.level = 1
end

function GameState:addPoints(amount)
    self.points = self.points + amount
end

function GameState:loseLife()
    self.lives = self.lives - 1
end

function GameState:isGameOver()
    return self.lives <= 0
end

function GameState:isGameEnd()
    return self.points >= self.pointsToWin
end

return GameState