local Collision = {}

function Collision.checkCollision(entityA, entityB)
    local entityALeft = entityA.posX
    local entityARight = entityA.posX + entityA.width
    local entityATop = entityA.posY
    local entityABottom = entityA.posY + entityA.height

    local entityBLeft = entityB.posX
    local entityBRight = entityB.posX + entityB.width
    local entityBTop = entityB.posY
    local entityBBottom = entityB.posY + entityB.height

    return entityARight > entityBLeft
        and entityALeft < entityBRight
        and entityABottom > entityBTop
        and entityATop < entityBBottom
end

return Collision
