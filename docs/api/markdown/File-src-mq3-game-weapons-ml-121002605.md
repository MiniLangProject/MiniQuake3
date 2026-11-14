# `src/mq3/game/weapons.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.weapons`](Package-mq3-game-weapons-93181019.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `weaponCombat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `weaponEntities` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `weaponEvents` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/missiles.ml` as `weaponMissiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/snapshot.ml` as `weaponSnapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/weapon_hitscan.ml` as `weaponHitscan` → [src/mq3/game/weapon_hitscan.ml](File-src-mq3-game-weapon-hitscan-ml-1375014721.md)
- `mq3/game/weapon_state.ml` as `weaponState` → [src/mq3/game/weapon_state.ml](File-src-mq3-game-weapon-state-ml-1905655678.md)
- `mq3/shared/directions.ml` as `weaponDirections` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-weapons-bfg-function-bfg-level-ent-src-mq3-game-weapons-ml-870785505"></a>
### bfg

```ml
function bfg(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L116)

<a id="function-function-mq3-game-weapons-bounceprojectile-function-bounceprojectile-start-impact-dir-endout-src-mq3-game-weapons-ml-2082710700"></a>
### bounceProjectile

```ml
function bounceProjectile(start, impact, dir, endout)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `impact` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `endout` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L52)

<a id="function-function-mq3-game-weapons-calcmuzzlepoint-function-calcmuzzlepoint-ent-forward-right-up-output-src-mq3-game-weapons-ml-1316326524"></a>
### calcMuzzlePoint

```ml
function calcMuzzlePoint(ent, forward, right, up, output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L34)

<a id="function-function-mq3-game-weapons-calcmuzzlepointorigin-function-calcmuzzlepointorigin-ent-origin-forward-right-up-output-src-mq3-game-weapons-ml-923559486"></a>
### calcMuzzlePointOrigin

```ml
function calcMuzzlePointOrigin(ent, origin, forward, right, up, output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L47)

<a id="function-function-mq3-game-weapons-checkgauntlet-function-checkgauntlet-level-ent-src-mq3-game-weapons-ml-833972343"></a>
### checkGauntlet

```ml
function checkGauntlet(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L67)

<a id="function-function-mq3-game-weapons-fire-function-fire-level-ent-src-mq3-game-weapons-ml-1399069775"></a>
### fire

```ml
function fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L130)

<a id="function-function-mq3-game-weapons-gauntlet-function-gauntlet-level-ent-src-mq3-game-weapons-ml-513973947"></a>
### gauntlet

```ml
function gauntlet(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L62)

<a id="function-function-mq3-game-weapons-grapple-function-grapple-level-ent-src-mq3-game-weapons-ml-1996687401"></a>
### grapple

```ml
function grapple(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L122)

<a id="function-function-mq3-game-weapons-grenade-function-grenade-level-ent-src-mq3-game-weapons-ml-686986183"></a>
### grenade

```ml
function grenade(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L97)

<a id="function-function-mq3-game-weapons-plasma-function-plasma-level-ent-src-mq3-game-weapons-ml-1920326259"></a>
### plasma

```ml
function plasma(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L110)

<a id="function-function-mq3-game-weapons-rocket-function-rocket-level-ent-src-mq3-game-weapons-ml-1155687471"></a>
### rocket

```ml
function rocket(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L104)

<a id="function-function-mq3-game-weapons-weaponaim-function-weaponaim-state-angles-src-mq3-game-weapons-ml-1122322505"></a>
### weaponAim

```ml
function weaponAim(state, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L22)

<a id="function-function-mq3-game-weapons-weaponclient-function-weaponclient-ent-src-mq3-game-weapons-ml-485236891"></a>
### weaponClient

```ml
function weaponClient(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L17)

<a id="function-function-mq3-game-weapons-weaponscalemissile-function-weaponscalemissile-state-missile-src-mq3-game-weapons-ml-339648111"></a>
### weaponScaleMissile

```ml
function weaponScaleMissile(state, missile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `missile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L91)
