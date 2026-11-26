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

Apply `mq3.game.weapon_state.get`, `mq3.game.missiles.fire` and `mq3.game.weapons.weaponScaleMissile` while evaluating `bfg`. Return paths include `weaponScaleMissile(state,missile)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L160)

<a id="function-function-mq3-game-weapons-bounceprojectile-function-bounceprojectile-start-impact-dir-endout-src-mq3-game-weapons-ml-2082710700"></a>
### bounceProjectile

```ml
function bounceProjectile(start, impact, dir, endout)
```

Set `endout[axis]` to `n.fadd(impact[axis],n.fmul(8192.0,bounced[axis]))` in `mq3.game.weapons.bounceProjectile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `impact` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 2 to `mq3.shared.math.DotProduct`. |
| `endout` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L75)

<a id="function-function-mq3-game-weapons-calcmuzzlepoint-function-calcmuzzlepoint-ent-forward-right-up-output-src-mq3-game-weapons-ml-1316326524"></a>
### calcMuzzlePoint

```ml
function calcMuzzlePoint(ent, forward, right, up, output)
```

Update `output[axis]` and `output[2]` during `calcMuzzlePoint`. Return paths include `weaponSnapshot.snapVector(output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `forward` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `right` | `dynamic` | — | Not read by this implementation; retained in the `calcMuzzlePoint` signature. |
| `up` | `dynamic` | — | Not read by this implementation; retained in the `calcMuzzlePoint` signature. |
| `output` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L45)

<a id="function-function-mq3-game-weapons-calcmuzzlepointorigin-function-calcmuzzlepointorigin-ent-origin-forward-right-up-output-src-mq3-game-weapons-ml-923559486"></a>
### calcMuzzlePointOrigin

```ml
function calcMuzzlePointOrigin(ent, origin, forward, right, up, output)
```

Forward `calcMuzzlePointOrigin` to `mq3.game.weapons.calcMuzzlePoint` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `origin` | `dynamic` | — | Not read by this implementation; retained in the `calcMuzzlePointOrigin` signature. |
| `forward` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `right` | `dynamic` | — | Value passed as argument 3 to `mq3.game.weapons.calcMuzzlePoint`. |
| `up` | `dynamic` | — | Value passed as argument 4 to `mq3.game.weapons.calcMuzzlePoint`. |
| `output` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L65)

<a id="function-function-mq3-game-weapons-checkgauntlet-function-checkgauntlet-level-ent-src-mq3-game-weapons-ml-833972343"></a>
### checkGauntlet

```ml
function checkGauntlet(level, ent)
```

Apply `mq3.game.weapons.weaponClient`, `mq3.game.weapon_state.get` and `mq3.game.weapons.weaponAim` while evaluating `checkGauntlet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `quadfactor`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L96)

<a id="function-function-mq3-game-weapons-fire-function-fire-level-ent-src-mq3-game-weapons-ml-1399069775"></a>
### fire

```ml
function fire(level, ent)
```

Apply `mq3.game.weapons.weaponClient`, `mq3.game.weapon_state.get` and `mq3.game.weapons.weaponAim` while evaluating `fire`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `quadfactor` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L180)

<a id="function-function-mq3-game-weapons-gauntlet-function-gauntlet-level-ent-src-mq3-game-weapons-ml-513973947"></a>
### gauntlet

```ml
function gauntlet(level, ent)
```

Return `void` for `gauntlet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `gauntlet` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `gauntlet` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L88)

<a id="function-function-mq3-game-weapons-grapple-function-grapple-level-ent-src-mq3-game-weapons-ml-1996687401"></a>
### grapple

```ml
function grapple(level, ent)
```

Apply `mq3.game.weapons.weaponClient`, `mq3.game.weapon_state.get` and `mq3.game.missiles.fire` while evaluating `grapple`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L169)

<a id="function-function-mq3-game-weapons-grenade-function-grenade-level-ent-src-mq3-game-weapons-ml-686986183"></a>
### grenade

```ml
function grenade(level, ent)
```

Apply `mq3.game.weapon_state.get`, `mq3.game.missiles.fire` and `mq3.game.weapons.weaponScaleMissile` while evaluating `grenade`. Return paths include `weaponScaleMissile(state,missile)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L132)

<a id="function-function-mq3-game-weapons-plasma-function-plasma-level-ent-src-mq3-game-weapons-ml-1920326259"></a>
### plasma

```ml
function plasma(level, ent)
```

Apply `mq3.game.weapon_state.get`, `mq3.game.missiles.fire` and `mq3.game.weapons.weaponScaleMissile` while evaluating `plasma`. Return paths include `weaponScaleMissile(state,missile)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L151)

<a id="function-function-mq3-game-weapons-rocket-function-rocket-level-ent-src-mq3-game-weapons-ml-1155687471"></a>
### rocket

```ml
function rocket(level, ent)
```

Apply `mq3.game.weapon_state.get`, `mq3.game.missiles.fire` and `mq3.game.weapons.weaponScaleMissile` while evaluating `rocket`. Return paths include `weaponScaleMissile(state,missile)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `weaponState`. May update `level.weaponState` in place. |
| `ent` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L142)

<a id="function-function-mq3-game-weapons-weaponaim-function-weaponaim-state-angles-src-mq3-game-weapons-ml-1122322505"></a>
### weaponAim

```ml
function weaponAim(state, angles)
```

Update `state.forward[axis]`, `state.right[axis]` and `state.up[axis]` during `weaponAim`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Weapons state; accesses `forward`, `right` and `up`. May update `state.forward[axis]`, `state.right[axis]` and `state.up[axis]` in place. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L27)

<a id="function-function-mq3-game-weapons-weaponclient-function-weaponclient-ent-src-mq3-game-weapons-ml-485236891"></a>
### weaponClient

```ml
function weaponClient(ent)
```

Require and return a client state for a player weapon operation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L19)

<a id="function-function-mq3-game-weapons-weaponscalemissile-function-weaponscalemissile-state-missile-src-mq3-game-weapons-ml-339648111"></a>
### weaponScaleMissile

```ml
function weaponScaleMissile(state, missile)
```

Set `missile.damage` to `n.trunc32(n.fmul(missile.damage,state.quadFactor))` and `missile.splashDamage` to `n.trunc32(n.fmul(missile.splashDamage,state.quadFactor))` in `mq3.game.weapons.weaponScaleMissile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Weapons state; accesses `quadFactor`. |
| `missile` | `dynamic` | — | Missile record; accesses `damage` and `splashDamage`. May update `missile.damage` and `missile.splashDamage` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/weapons.ml#L123)
