# `src/mq3/game/combat.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.combat`](Package-mq3-game-combat-1336804150.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-combat-candamage-function-candamage-level-targ-origin-src-mq3-game-combat-ml-993849338"></a>
### canDamage

```ml
function canDamage(level, targ, origin)
```

Trace from the damage origin toward the target to determine whether world geometry blocks damage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `traceObserveFn`. |
| `targ` | `dynamic` | — | Targ record; accesses `r` and `s`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L116)

<a id="extern_function-extern-function-mq3-game-combat-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-game-combat-ml-1877373054"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

Round a floating-point value upward through the native C runtime ceiling function.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point value to round toward positive infinity. |


**Returns:** The least integer-valued double greater than or equal to value.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L16)

<a id="function-function-mq3-game-combat-checkarmor-function-checkarmor-ent-amount-dflags-src-mq3-game-combat-ml-651209566"></a>
### checkArmor

```ml
function checkArmor(ent, amount, dflags)
```

Set `ent.client.ps.stats[c.STAT_ARMOR]` to `n.i32(count-saved)` in `mq3.game.combat.checkArmor`. Return paths include `saved`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.stats[c.STAT_ARMOR]` in place. |
| `amount` | `dynamic` | — | Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`. |
| `dflags` | `dynamic` | — | Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L202)

<a id="function-function-mq3-game-combat-checkhurtcarrier-function-checkhurtcarrier-level-targ-attacker-src-mq3-game-combat-ml-475885773"></a>
### checkHurtCarrier

```ml
function checkHurtCarrier(level, targ, attacker)
```

Set `attacker.client.lasthurtcarrier` to `n.f32(level.time)` in `mq3.game.combat.checkHurtCarrier`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `targ` | `dynamic` | — | Targ record; accesses `client`. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. May update `attacker.client.lasthurtcarrier` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L190)

<a id="function-function-mq3-game-combat-damage-function-damage-level-targ-inflictor-attacker-dir-point-amount-dflags-mod-src-mq3-game-combat-ml-1808099025"></a>
### damage

```ml
function damage(level, targ, inflictor, attacker, dir, point, amount, dflags, mod)
```

Update `attacker.client.ps.persistant[c.PERS_HITS]`, `attacker.client.ps.persistant[c.PERS_ATTACKEE_ARMOR]`, `targ.client.lasthurt_client` and `targ.client.lasthurt_mod` and related state during `damage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields. |
| `targ` | `dynamic` | — | Targ record; accesses `takedamage`, `client`, `s`, `use` and `moverState` and related fields. May update `targ.client.lasthurt_client`, `targ.client.lasthurt_mod` and `targ.health` and additional fields in place. |
| `inflictor` | `dynamic` | — | Damage-delivering entity; accesses `parent`. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client` and `s`. May update `attacker.client.ps.persistant[c.PERS_HITS]` and `attacker.client.ps.persistant[c.PERS_ATTACKEE_ARMOR]` in place. |
| `dir` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `amount` | `dynamic` | — | Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`. |
| `dflags` | `dynamic` | — | Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L222)

<a id="constant-constant-mq3-game-combat-damage-no-armor-const-damage-no-armor-2-src-mq3-game-combat-ml-656562291"></a>
### DAMAGE_NO_ARMOR

```ml
const DAMAGE_NO_ARMOR = 2
```

Damage-processing flag enabling no armor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L20)

<a id="constant-constant-mq3-game-combat-damage-no-knockback-const-damage-no-knockback-4-src-mq3-game-combat-ml-877389469"></a>
### DAMAGE_NO_KNOCKBACK

```ml
const DAMAGE_NO_KNOCKBACK = 4
```

Damage-processing flag enabling no knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L22)

<a id="constant-constant-mq3-game-combat-damage-no-protection-const-damage-no-protection-8-src-mq3-game-combat-ml-1377546305"></a>
### DAMAGE_NO_PROTECTION

```ml
const DAMAGE_NO_PROTECTION = 8
```

Damage-processing flag enabling no protection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L24)

<a id="constant-constant-mq3-game-combat-damage-radius-const-damage-radius-1-src-mq3-game-combat-ml-589993440"></a>
### DAMAGE_RADIUS

```ml
const DAMAGE_RADIUS = 1
```

Damage-processing flag enabling radius.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L18)

<a id="constant-constant-mq3-game-combat-fl-godmode-const-fl-godmode-16-src-mq3-game-combat-ml-914560114"></a>
### FL_GODMODE

```ml
const FL_GODMODE = 16
```

Game entity-flag bit enabling or marking godmode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L26)

<a id="constant-constant-mq3-game-combat-fl-no-knockback-const-fl-no-knockback-2048-src-mq3-game-combat-ml-1408256715"></a>
### FL_NO_KNOCKBACK

```ml
const FL_NO_KNOCKBACK = 2048
```

Game entity-flag bit enabling or marking no knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L28)

<a id="function-function-mq3-game-combat-gametype-function-gametype-level-src-mq3-game-combat-ml-924928022"></a>
### gametype

```ml
function gametype(level)
```

Read the game type used by combat rules, returning zero when no spawner exists.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L95)

<a id="function-function-mq3-game-combat-invulnerabilityeffect-function-invulnerabilityeffect-level-targ-dir-point-impactpoint-bouncedir-src-mq3-game-combat-ml-2104107714"></a>
### invulnerabilityEffect

```ml
function invulnerabilityEffect(level, targ, dir, point, impactpoint, bouncedir)
```

Set `impactpoint[axis]` to `intersections[0][axis]` and `bouncedir[axis]` to `normal[axis]` in `mq3.game.combat.invulnerabilityEffect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `targ` | `dynamic` | — | Targ record; accesses `client`. |
| `dir` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `impactpoint` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |
| `bouncedir` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L70)

<a id="function-function-mq3-game-combat-logaccuracyhit-function-logaccuracyhit-level-target-attacker-src-mq3-game-combat-ml-1937329952"></a>
### logAccuracyHit

```ml
function logAccuracyHit(level, target, attacker)
```

Apply `mq3.game.combat.onSameTeam` while evaluating `logAccuracyHit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `target` | `dynamic` | — | Target record; accesses `takedamage` and `client`. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L135)

<a id="function-function-mq3-game-combat-missionpack-function-missionpack-level-src-mq3-game-combat-ml-1638481888"></a>
### missionpack

```ml
function missionpack(level)
```

Test `level.spawner != void and level.spawner.missionpack` as the condition for `missionpack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L37)

<a id="constant-constant-mq3-game-combat-mod-juiced-const-mod-juiced-28-src-mq3-game-combat-ml-1591915107"></a>
### MOD_JUICED

```ml
const MOD_JUICED = 28
```

Cause-of-death identifier attributing damage or a kill to juiced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L32)

<a id="constant-constant-mq3-game-combat-mod-proximity-mine-const-mod-proximity-mine-26-src-mq3-game-combat-ml-1031161591"></a>
### MOD_PROXIMITY_MINE

```ml
const MOD_PROXIMITY_MINE = 26
```

Cause-of-death identifier attributing damage or a kill to proximity mine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L30)

<a id="function-function-mq3-game-combat-onsameteam-function-onsameteam-level-first-second-src-mq3-game-combat-ml-1769371220"></a>
### onSameTeam

```ml
function onSameTeam(level, first, second)
```

Apply `mq3.game.combat.gametype` while evaluating `onSameTeam`. Return paths include `first.client.team == second.client.team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `first` | `dynamic` | — | First record; accesses `client`. |
| `second` | `dynamic` | — | Second record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L181)

<a id="function-function-mq3-game-combat-persistenttag-function-persistenttag-level-client-src-mq3-game-combat-ml-558851647"></a>
### persistentTag

```ml
function persistentTag(level, client)
```

Apply `mq3.game.combat.missionpack` and `mq3.game.constants.missionpackItemTag` while evaluating `persistentTag`. Return paths include `c.missionpackItemTag(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `client` | `dynamic` | — | Client state; accesses `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L87)

<a id="function-function-mq3-game-combat-radiusdamage-function-radiusdamage-level-origin-attacker-amount-radius-ignore-mod-src-mq3-game-combat-ml-368991781"></a>
### radiusDamage

```ml
function radiusDamage(level, origin, attacker, amount, radius, ignore, mod)
```

Apply `mq3.server.world.areaEntities`, `mq3.game.combat.canDamage` and `mq3.game.combat.logAccuracyHit` while evaluating `radiusDamage`. Return paths include `hitClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `amount` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |
| `radius` | `dynamic` | — | Radius used by the spatial or damage query. |
| `ignore` | `dynamic` | — | Value used by `radiusDamage` in `if ent == ignore or not ent.takedamage then continue end if`. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L149)

<a id="function-function-mq3-game-combat-raysphereintersections-function-raysphereintersections-origin-radius-point-dir-intersections-src-mq3-game-combat-ml-1583478913"></a>
### raySphereIntersections

```ml
function raySphereIntersections(origin, radius, point, dir, intersections)
```

Update `intersections[0]` and `intersections[1]` during `raySphereIntersections`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `radius` | `dynamic` | — | Radius used by the spatial or damage query. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |
| `intersections` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L46)

<a id="function-function-mq3-game-combat-shottrace-function-shottrace-level-start-finish-mins-maxs-passentity-mask-src-mq3-game-combat-ml-207118107"></a>
### shotTrace

```ml
function shotTrace(level, start, finish, mins, maxs, passEntity, mask)
```

Use `level.traceObserveFn` to perform `shotTrace`. Return paths include `hit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `traceObserveFn`. |
| `start` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `finish` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `passEntity` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `mask` | `dynamic` | — | Initial value stored in `mq3.collision.world.Work.mask`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L107)

<a id="constant-constant-mq3-game-combat-stat-persistant-powerup-const-stat-persistant-powerup-7-src-mq3-game-combat-ml-1756783990"></a>
### STAT_PERSISTANT_POWERUP

```ml
const STAT_PERSISTANT_POWERUP = 7
```

Player-state statistics index storing persistant powerup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/combat.ml#L34)
