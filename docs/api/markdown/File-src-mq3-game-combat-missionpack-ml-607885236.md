# `src/mq3/game/combat_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.combat_missionpack`](Package-mq3-game-combat-missionpack-852311718.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_items.ml` as `combatItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/g_weapon.ml` as `weapon` → [src/mq3/game/g_weapon.ml](File-src-mq3-game-g-weapon-ml-2045534346.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-combat-missionpack-afterplayerdie-function-afterplayerdie-level-self-src-mq3-game-combat-missionpack-ml-1525598856"></a>
### afterPlayerDie

```ml
function afterPlayerDie(level, self)
```

Apply `mq3.game.combat_missionpack.Kamikaze_DeathTimer` while evaluating `afterPlayerDie`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `inuse` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L94)

<a id="function-function-mq3-game-combat-missionpack-cleanupplayerdie-function-cleanupplayerdie-level-self-src-mq3-game-combat-missionpack-ml-1580319672"></a>
### cleanupPlayerDie

```ml
function cleanupPlayerDie(level, self)
```

Update `self.client.ps.eFlags`, `self.activator.think` and `self.activator.nextthink` during `cleanupPlayerDie`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client` and `activator`. May update `self.client.ps.eFlags`, `self.activator.think` and `self.activator.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L73)

<a id="constant-constant-mq3-game-combat-missionpack-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-combat-missionpack-ml-1791835658"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```

Collision-contents bit identifying trigger space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L20)

<a id="function-function-mq3-game-combat-missionpack-dropplayerdeathitems-function-dropplayerdeathitems-level-self-src-mq3-game-combat-missionpack-ml-1190200964"></a>
### dropPlayerDeathItems

```ml
function dropPlayerDeathItems(level, self)
```

Apply `mq3.game.combat_missionpack.TossClientPersistantPowerups` and `mq3.game.combat_missionpack.TossClientCubes` while evaluating `dropPlayerDeathItems`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Game entity; accesses `client`. May update `self.client.ps.stats[STAT_PERSISTANT_POWERUP]` and `self.client.persistantPowerup` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L84)

<a id="constant-constant-mq3-game-combat-missionpack-ef-kamikaze-const-ef-kamikaze-512-src-mq3-game-combat-missionpack-ml-669888657"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 512
```

Network entity-flag bit indicating kamikaze.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L18)

<a id="constant-constant-mq3-game-combat-missionpack-ef-nodraw-const-ef-nodraw-128-src-mq3-game-combat-missionpack-ml-42053266"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```

Network entity-flag bit indicating nodraw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L16)

<a id="constant-constant-mq3-game-combat-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-game-combat-missionpack-ml-1000521980"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L24)

<a id="function-function-mq3-game-combat-missionpack-kamikaze-deathactivate-function-kamikaze-deathactivate-level-ent-src-mq3-game-combat-missionpack-ml-754287187"></a>
### Kamikaze_DeathActivate

```ml
function Kamikaze_DeathActivate(level, ent)
```

Apply `mq3.game.g_weapon.G_StartKamikaze` and `mq3.game.entities.free` while evaluating `Kamikaze_DeathActivate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `activator` and `s`. May update `ent.s.eFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L57)

<a id="function-function-mq3-game-combat-missionpack-kamikaze-deathtimer-function-kamikaze-deathtimer-level-self-src-mq3-game-combat-missionpack-ml-874081074"></a>
### Kamikaze_DeathTimer

```ml
function Kamikaze_DeathTimer(level, self)
```

Apply `mq3.game.entities.spawn` while evaluating `Kamikaze_DeathTimer`. Return paths include `timer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L64)

<a id="constant-constant-mq3-game-combat-missionpack-stat-persistant-powerup-const-stat-persistant-powerup-7-src-mq3-game-combat-missionpack-ml-241809358"></a>
### STAT_PERSISTANT_POWERUP

```ml
const STAT_PERSISTANT_POWERUP = 7
```

Player-state statistics index storing persistant powerup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L22)

<a id="constant-constant-mq3-game-combat-missionpack-svf-noclient-const-svf-noclient-1-src-mq3-game-combat-missionpack-ml-1297404122"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```

Server entity-flag bit controlling noclient.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L14)

<a id="function-function-mq3-game-combat-missionpack-tossclientcubes-function-tossclientcubes-level-self-src-mq3-game-combat-missionpack-ml-1776894812"></a>
### TossClientCubes

```ml
function TossClientCubes(level, self)
```

Set `self.client.ps.generic1` to `0` in `mq3.game.combat_missionpack.TossClientCubes`. Return paths include `drop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `neutralObelisk`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. May update `self.client.ps.generic1` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L29)

<a id="function-function-mq3-game-combat-missionpack-tossclientpersistantpowerups-function-tossclientpersistantpowerups-level-ent-src-mq3-game-combat-missionpack-ml-735002531"></a>
### TossClientPersistantPowerups

```ml
function TossClientPersistantPowerups(level, ent)
```

Set `ent.client.ps.stats[STAT_PERSISTANT_POWERUP]` to `0` and `ent.client.persistantPowerup` to `void` in `mq3.game.combat_missionpack.TossClientPersistantPowerups`. Return paths include `powerup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.stats[STAT_PERSISTANT_POWERUP]` and `ent.client.persistantPowerup` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L46)
