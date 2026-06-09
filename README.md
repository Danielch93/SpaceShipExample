# SpaceShipExample

Juego 2D de disparos hecho con [LÖVE](https://love2d.org/) como proyecto de aprendizaje.
Derriba enemigos, acumula puntos y evita que te destruyan.

## Como ejecutar

1. Instala [LÖVE 11.x](https://love2d.org/)
2. Clona el repo y entra a la carpeta
3. Ejecuta:

```bash
love .
```

## Controles

| Tecla | Accion |
|-------|--------|
| Flechas | Mover la nave |
| Espacio | Disparar |
| S | Disparo secundario |
| Enter | Reiniciar tras Game Over |

## Arquitectura

```
example/
├── main.lua          ← Orquestador del juego
├── Entity.lua        ← Clase base (posicion, dimensiones)
├── Player.lua        ← Nave del jugador (movimiento, disparo)
├── Enemy.lua         ← Enemigos (rebote, sprites)
├── Bullet.lua        ← Balas (movimiento, colision)
├── Collision.lua     ← Deteccion AABB (4 condiciones)
├── GameState.lua     ← Estado del juego (vidas, puntos)
├── layouts/
│   └── Hub.lua       ← Interfaz (HUD, Game Over)
├── lib/
│   └── classic.lua   ← Libreria de clases (rxi/classic)
└── img/
    ├── galaxy.jpg    ← Fondo
    ├── spaceship.png ← Nave
    └── enemy.png     ← Enemigo
```

## Conceptos aplicados

- **Clases y herencia** con `classic` (Entity → Player, Enemy, Bullet)
- **Colision AABB** con 4 condiciones
- **Encapsulamiento**: Player maneja sus balas, Bullet se autoevalua
- **Maquina de estados**: juego activo → Game Over → Victoria
- **Patron dead flag**: balas/enemigos se marcan antes de eliminarse

## Creditos

- [classic](https://github.com/rxi/classic) — rxi (MIT)
- Assets: propios / [Kenney](https://kenney.nl) (CC0)
- Aprendizaje: [How to LOVE](https://sheepolution.com/learn) — Sheepolution

## Licencia

MIT © 2026
