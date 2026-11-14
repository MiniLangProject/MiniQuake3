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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L72)

<a id="extern_function-extern-function-mq3-game-combat-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-game-combat-ml-1877373054"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L13)

<a id="function-function-mq3-game-combat-checkarmor-function-checkarmor-ent-amount-dflags-src-mq3-game-combat-ml-651209566"></a>
### checkArmor

```ml
function checkArmor(ent, amount, dflags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `dflags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L134)

<a id="function-function-mq3-game-combat-checkhurtcarrier-function-checkhurtcarrier-level-targ-attacker-src-mq3-game-combat-ml-475885773"></a>
### checkHurtCarrier

```ml
function checkHurtCarrier(level, targ, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L126)

<a id="function-function-mq3-game-combat-damage-function-damage-level-targ-inflictor-attacker-dir-point-amount-dflags-mod-src-mq3-game-combat-ml-1808099025"></a>
### damage

```ml
function damage(level, targ, inflictor, attacker, dir, point, amount, dflags, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `dflags` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L144)

<a id="constant-constant-mq3-game-combat-damage-no-armor-const-damage-no-armor-2-src-mq3-game-combat-ml-656562291"></a>
### DAMAGE_NO_ARMOR

```ml
const DAMAGE_NO_ARMOR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L15)

<a id="constant-constant-mq3-game-combat-damage-no-knockback-const-damage-no-knockback-4-src-mq3-game-combat-ml-877389469"></a>
### DAMAGE_NO_KNOCKBACK

```ml
const DAMAGE_NO_KNOCKBACK = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L16)

<a id="constant-constant-mq3-game-combat-damage-no-protection-const-damage-no-protection-8-src-mq3-game-combat-ml-1377546305"></a>
### DAMAGE_NO_PROTECTION

```ml
const DAMAGE_NO_PROTECTION = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L17)

<a id="constant-constant-mq3-game-combat-damage-radius-const-damage-radius-1-src-mq3-game-combat-ml-589993440"></a>
### DAMAGE_RADIUS

```ml
const DAMAGE_RADIUS = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L14)

<a id="constant-constant-mq3-game-combat-fl-godmode-const-fl-godmode-16-src-mq3-game-combat-ml-914560114"></a>
### FL_GODMODE

```ml
const FL_GODMODE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L18)

<a id="constant-constant-mq3-game-combat-fl-no-knockback-const-fl-no-knockback-2048-src-mq3-game-combat-ml-1408256715"></a>
### FL_NO_KNOCKBACK

```ml
const FL_NO_KNOCKBACK = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L19)

<a id="function-function-mq3-game-combat-gametype-function-gametype-level-src-mq3-game-combat-ml-924928022"></a>
### gametype

```ml
function gametype(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L63)

<a id="function-function-mq3-game-combat-invulnerabilityeffect-function-invulnerabilityeffect-level-targ-dir-point-impactpoint-bouncedir-src-mq3-game-combat-ml-2104107714"></a>
### invulnerabilityEffect

```ml
function invulnerabilityEffect(level, targ, dir, point, impactpoint, bouncedir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `impactpoint` | `dynamic` | — |  |
| `bouncedir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L43)

<a id="function-function-mq3-game-combat-logaccuracyhit-function-logaccuracyhit-level-target-attacker-src-mq3-game-combat-ml-1937329952"></a>
### logAccuracyHit

```ml
function logAccuracyHit(level, target, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L87)

<a id="function-function-mq3-game-combat-missionpack-function-missionpack-level-src-mq3-game-combat-ml-1638481888"></a>
### missionpack

```ml
function missionpack(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L23)

<a id="constant-constant-mq3-game-combat-mod-juiced-const-mod-juiced-28-src-mq3-game-combat-ml-1591915107"></a>
### MOD_JUICED

```ml
const MOD_JUICED = 28
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L21)

<a id="constant-constant-mq3-game-combat-mod-proximity-mine-const-mod-proximity-mine-26-src-mq3-game-combat-ml-1031161591"></a>
### MOD_PROXIMITY_MINE

```ml
const MOD_PROXIMITY_MINE = 26
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L20)

<a id="function-function-mq3-game-combat-onsameteam-function-onsameteam-level-first-second-src-mq3-game-combat-ml-1769371220"></a>
### onSameTeam

```ml
function onSameTeam(level, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L121)

<a id="function-function-mq3-game-combat-persistenttag-function-persistenttag-level-client-src-mq3-game-combat-ml-558851647"></a>
### persistentTag

```ml
function persistentTag(level, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L57)

<a id="function-function-mq3-game-combat-radiusdamage-function-radiusdamage-level-origin-attacker-amount-radius-ignore-mod-src-mq3-game-combat-ml-368991781"></a>
### radiusDamage

```ml
function radiusDamage(level, origin, attacker, amount, radius, ignore, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `ignore` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L93)

<a id="function-function-mq3-game-combat-raysphereintersections-function-raysphereintersections-origin-radius-point-dir-intersections-src-mq3-game-combat-ml-1583478913"></a>
### raySphereIntersections

```ml
function raySphereIntersections(origin, radius, point, dir, intersections)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `intersections` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L26)

<a id="function-function-mq3-game-combat-shottrace-function-shottrace-level-start-finish-mins-maxs-passentity-mask-src-mq3-game-combat-ml-207118107"></a>
### shotTrace

```ml
function shotTrace(level, start, finish, mins, maxs, passEntity, mask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L67)

<a id="constant-constant-mq3-game-combat-stat-persistant-powerup-const-stat-persistant-powerup-7-src-mq3-game-combat-ml-1756783990"></a>
### STAT_PERSISTANT_POWERUP

```ml
const STAT_PERSISTANT_POWERUP = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/combat.ml#L22)
