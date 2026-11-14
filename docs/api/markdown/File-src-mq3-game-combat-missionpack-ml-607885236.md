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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L67)

<a id="function-function-mq3-game-combat-missionpack-cleanupplayerdie-function-cleanupplayerdie-level-self-src-mq3-game-combat-missionpack-ml-1580319672"></a>
### cleanupPlayerDie

```ml
function cleanupPlayerDie(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L52)

<a id="constant-constant-mq3-game-combat-missionpack-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-combat-missionpack-ml-1791835658"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L16)

<a id="function-function-mq3-game-combat-missionpack-dropplayerdeathitems-function-dropplayerdeathitems-level-self-src-mq3-game-combat-missionpack-ml-1190200964"></a>
### dropPlayerDeathItems

```ml
function dropPlayerDeathItems(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L60)

<a id="constant-constant-mq3-game-combat-missionpack-ef-kamikaze-const-ef-kamikaze-512-src-mq3-game-combat-missionpack-ml-669888657"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L15)

<a id="constant-constant-mq3-game-combat-missionpack-ef-nodraw-const-ef-nodraw-128-src-mq3-game-combat-missionpack-ml-42053266"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L14)

<a id="constant-constant-mq3-game-combat-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-game-combat-missionpack-ml-1000521980"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L18)

<a id="function-function-mq3-game-combat-missionpack-kamikaze-deathactivate-function-kamikaze-deathactivate-level-ent-src-mq3-game-combat-missionpack-ml-754287187"></a>
### Kamikaze_DeathActivate

```ml
function Kamikaze_DeathActivate(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L42)

<a id="function-function-mq3-game-combat-missionpack-kamikaze-deathtimer-function-kamikaze-deathtimer-level-self-src-mq3-game-combat-missionpack-ml-874081074"></a>
### Kamikaze_DeathTimer

```ml
function Kamikaze_DeathTimer(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L46)

<a id="constant-constant-mq3-game-combat-missionpack-stat-persistant-powerup-const-stat-persistant-powerup-7-src-mq3-game-combat-missionpack-ml-241809358"></a>
### STAT_PERSISTANT_POWERUP

```ml
const STAT_PERSISTANT_POWERUP = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L17)

<a id="constant-constant-mq3-game-combat-missionpack-svf-noclient-const-svf-noclient-1-src-mq3-game-combat-missionpack-ml-1297404122"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L13)

<a id="function-function-mq3-game-combat-missionpack-tossclientcubes-function-tossclientcubes-level-self-src-mq3-game-combat-missionpack-ml-1776894812"></a>
### TossClientCubes

```ml
function TossClientCubes(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L20)

<a id="function-function-mq3-game-combat-missionpack-tossclientpersistantpowerups-function-tossclientpersistantpowerups-level-ent-src-mq3-game-combat-missionpack-ml-735002531"></a>
### TossClientPersistantPowerups

```ml
function TossClientPersistantPowerups(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat_missionpack.ml#L34)
