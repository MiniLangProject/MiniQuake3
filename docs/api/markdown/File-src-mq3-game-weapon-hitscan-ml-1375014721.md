# `src/mq3/game/weapon_hitscan.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.weapon_hitscan`](Package-mq3-game-weapon-hitscan-1816917033.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/missiles.ml` as `missiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/weapon_state.ml` as `state` → [src/mq3/game/weapon_state.ml](File-src-mq3-game-weapon-state-ml-1905655678.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-game-weapon-hitscan-award-mask-const-award-mask-231496-src-mq3-game-weapon-hitscan-ml-1083688658"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L20)

<a id="function-function-mq3-game-weapon-hitscan-bullet-function-bullet-level-ent-spread-damage-src-mq3-game-weapon-hitscan-ml-1146743315"></a>
### bullet

```ml
function bullet(level, ent, spread, damage)
```

Set `ent.client.accuracy_hits` to `n.add32(ent.client.accuracy_hits,1)` in `mq3.game.weapon_hitscan.bullet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `client`. May update `ent.client.accuracy_hits` in place. |
| `spread` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L56)

<a id="function-function-mq3-game-weapon-hitscan-hitscancenteredrandom-function-hitscancenteredrandom-level-src-mq3-game-weapon-hitscan-ml-45965204"></a>
### hitscanCenteredRandom

```ml
function hitscanCenteredRandom(level)
```

Return `2.0*(n.fdiv(game.random(level),32767.0)-0.5)` for `hitscanCenteredRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L46)

<a id="function-function-mq3-game-weapon-hitscan-hitscanclient-function-hitscanclient-ent-src-mq3-game-weapon-hitscan-ml-1760211671"></a>
### hitscanClient

```ml
function hitscanClient(ent)
```

Require and return a client state for hitscan weapon accuracy bookkeeping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L24)

<a id="function-function-mq3-game-weapon-hitscan-hitscancopy-function-hitscancopy-target-source-src-mq3-game-weapon-hitscan-ml-54506952"></a>
### hitscanCopy

```ml
function hitscanCopy(target, source)
```

Set `target[axis]` to `source[axis]` in `mq3.game.weapon_hitscan.hitscanCopy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |
| `source` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L38)

<a id="function-function-mq3-game-weapon-hitscan-hitscanentity-function-hitscanentity-level-number-src-mq3-game-weapon-hitscan-ml-263779489"></a>
### hitscanEntity

```ml
function hitscanEntity(level, number)
```

Read a trace-hit entity after validating its number against native entity storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `number` | `dynamic` | — | Operand used to evaluate the returned expression `level.entities[number]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L31)

<a id="function-function-mq3-game-weapon-hitscan-lightning-function-lightning-level-ent-src-mq3-game-weapon-hitscan-ml-552170733"></a>
### lightning

```ml
function lightning(level, ent)
```

Set `ent.client.accuracy_hits` to `n.add32(ent.client.accuracy_hits,1)` in `mq3.game.weapon_hitscan.lightning`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `client`. May update `ent.client.accuracy_hits` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L186)

<a id="constant-constant-mq3-game-weapon-hitscan-mask-shot-const-mask-shot-100663297-src-mq3-game-weapon-hitscan-ml-714104971"></a>
### MASK_SHOT

```ml
const MASK_SHOT = 100663297
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L18)

<a id="function-function-mq3-game-weapon-hitscan-rail-function-rail-level-ent-src-mq3-game-weapon-hitscan-ml-815929269"></a>
### rail

```ml
function rail(level, ent)
```

Apply `mq3.game.weapon_state.get`, `mq3.game.combat.shotTrace` and `mq3.game.weapon_hitscan.hitscanEntity` while evaluating `rail`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L140)

<a id="function-function-mq3-game-weapon-hitscan-shotgun-function-shotgun-level-ent-src-mq3-game-weapon-hitscan-ml-1724690917"></a>
### shotgun

```ml
function shotgun(level, ent)
```

Apply `mq3.game.weapon_state.get`, `mq3.game.entities.tempEntity` and `mq3.game.weapon_hitscan.hitscanCopy` while evaluating `shotgun`. Return paths include `shotgunPattern(level,temp.s.pos.trBase,temp.s.origin2,temp.s.eventParm,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L130)

<a id="function-function-mq3-game-weapon-hitscan-shotgunpattern-function-shotgunpattern-level-origin-origin2-seed-ent-src-mq3-game-weapon-hitscan-ml-1912116694"></a>
### shotgunPattern

```ml
function shotgunPattern(level, origin, origin2, seed, ent)
```

Set `ent.client.accuracy_hits` to `n.add32(ent.client.accuracy_hits,1)` in `mq3.game.weapon_hitscan.shotgunPattern`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `origin2` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize2`. |
| `seed` | `dynamic` | — | State used to initialize the deterministic random sequence. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.accuracy_hits` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L108)

<a id="function-function-mq3-game-weapon-hitscan-shotgunpellet-function-shotgunpellet-level-start-finish-ent-src-mq3-game-weapon-hitscan-ml-1452732982"></a>
### shotgunPellet

```ml
function shotgunPellet(level, start, finish, ent)
```

Apply `mq3.game.weapon_state.get`, `mq3.game.movement.copy` and `mq3.game.combat.shotTrace` while evaluating `shotgunPellet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L89)

<a id="constant-constant-mq3-game-weapon-hitscan-surf-noimpact-const-surf-noimpact-headers-surf-noimpact-src-mq3-game-weapon-hitscan-ml-628713333"></a>
### SURF_NOIMPACT

```ml
const SURF_NOIMPACT = headers.SURF_NOIMPACT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_hitscan.ml#L19)
