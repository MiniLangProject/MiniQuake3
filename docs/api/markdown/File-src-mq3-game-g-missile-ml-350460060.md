# `src/mq3/game/g_missile.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_missile`](Package-mq3-game-g-missile-713368768.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/g_weapon.ml` as `weapon` → [src/mq3/game/g_weapon.ml](File-src-mq3-game-g-weapon-ml-2045534346.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/missiles.ml` as `missileBase` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-game-g-missile-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-g-missile-ml-1042631864"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L31)

<a id="constant-constant-mq3-game-g-missile-damage-no-knockback-const-damage-no-knockback-4-src-mq3-game-g-missile-ml-564266265"></a>
### DAMAGE_NO_KNOCKBACK

```ml
const DAMAGE_NO_KNOCKBACK = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L34)

<a id="constant-constant-mq3-game-g-missile-ef-bounce-half-const-ef-bounce-half-32-src-mq3-game-g-missile-ml-811162282"></a>
### EF_BOUNCE_HALF

```ml
const EF_BOUNCE_HALF = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L27)

<a id="constant-constant-mq3-game-g-missile-ef-nodraw-const-ef-nodraw-128-src-mq3-game-g-missile-ml-487458868"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L28)

<a id="constant-constant-mq3-game-g-missile-ef-ticking-const-ef-ticking-2-src-mq3-game-g-missile-ml-1486328767"></a>
### EF_TICKING

```ml
const EF_TICKING = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L26)

<a id="constant-constant-mq3-game-g-missile-entitynum-none-const-entitynum-none-1023-src-mq3-game-g-missile-ml-1205474385"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L33)

<a id="function-function-mq3-game-g-missile-fire-bfg-function-fire-bfg-level-self-start-dir-src-mq3-game-g-missile-ml-83546995"></a>
### fire_bfg

```ml
function fire_bfg(level, self, start, dir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L165)

<a id="function-function-mq3-game-g-missile-fire-grapple-function-fire-grapple-level-self-start-dir-src-mq3-game-g-missile-ml-854171595"></a>
### fire_grapple

```ml
function fire_grapple(level, self, start, dir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L167)

<a id="function-function-mq3-game-g-missile-fire-grenade-function-fire-grenade-level-self-start-dir-src-mq3-game-g-missile-ml-962124035"></a>
### fire_grenade

```ml
function fire_grenade(level, self, start, dir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L164)

<a id="function-function-mq3-game-g-missile-fire-nail-function-fire-nail-level-self-start-forward-right-up-src-mq3-game-g-missile-ml-552681064"></a>
### fire_nail

```ml
function fire_nail(level, self, start, forward, right, up)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L168)

<a id="function-function-mq3-game-g-missile-fire-plasma-function-fire-plasma-level-self-start-dir-src-mq3-game-g-missile-ml-1000516013"></a>
### fire_plasma

```ml
function fire_plasma(level, self, start, dir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L163)

<a id="function-function-mq3-game-g-missile-fire-prox-function-fire-prox-level-self-start-dir-src-mq3-game-g-missile-ml-1855502207"></a>
### fire_prox

```ml
function fire_prox(level, self, start, dir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L169)

<a id="function-function-mq3-game-g-missile-fire-rocket-function-fire-rocket-level-self-start-dir-src-mq3-game-g-missile-ml-1843225833"></a>
### fire_rocket

```ml
function fire_rocket(level, self, start, dir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L166)

<a id="function-function-mq3-game-g-missile-g-bouncemissile-function-g-bouncemissile-level-ent-hit-src-mq3-game-g-missile-ml-133320190"></a>
### G_BounceMissile

```ml
function G_BounceMissile(level, ent, hit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L36)

<a id="function-function-mq3-game-g-missile-g-explodemissile-function-g-explodemissile-level-ent-src-mq3-game-g-missile-ml-51055687"></a>
### G_ExplodeMissile

```ml
function G_ExplodeMissile(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L37)

<a id="function-function-mq3-game-g-missile-g-missileimpact-function-g-missileimpact-level-ent-hit-src-mq3-game-g-missile-ml-729818106"></a>
### G_MissileImpact

```ml
function G_MissileImpact(level, ent, hit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L119)

<a id="function-function-mq3-game-g-missile-g-runmissile-function-g-runmissile-level-ent-src-mq3-game-g-missile-ml-141336767"></a>
### G_RunMissile

```ml
function G_RunMissile(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L145)

<a id="function-function-mq3-game-g-missile-gametype-function-gametype-level-src-mq3-game-g-missile-ml-513423556"></a>
### gameType

```ml
function gameType(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L50)

<a id="function-function-mq3-game-g-missile-invulnerabilityeffect-function-invulnerabilityeffect-level-target-direction-point-src-mq3-game-g-missile-ml-2016797264"></a>
### invulnerabilityEffect

```ml
function invulnerabilityEffect(level, target, direction, point)
```

Exact RaySphereIntersections/G_InvulnerabilityEffect geometry used by the Team Arena projectile reflection branch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L106)

<a id="constant-constant-mq3-game-g-missile-mask-shot-const-mask-shot-100663297-src-mq3-game-g-missile-ml-1269504947"></a>
### MASK_SHOT

```ml
const MASK_SHOT = 100663297
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L32)

<a id="constant-constant-mq3-game-g-missile-mod-juiced-const-mod-juiced-28-src-mq3-game-g-missile-ml-2112044359"></a>
### MOD_JUICED

```ml
const MOD_JUICED = 28
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L25)

<a id="constant-constant-mq3-game-g-missile-mod-proximity-mine-const-mod-proximity-mine-26-src-mq3-game-g-missile-ml-1953935071"></a>
### MOD_PROXIMITY_MINE

```ml
const MOD_PROXIMITY_MINE = 26
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L24)

<a id="function-function-mq3-game-g-missile-proximitymine-activate-function-proximitymine-activate-level-ent-src-mq3-game-g-missile-ml-1143216451"></a>
### ProximityMine_Activate

```ml
function ProximityMine_Activate(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L66)

<a id="function-function-mq3-game-g-missile-proximitymine-die-function-proximitymine-die-level-ent-inflictor-attacker-damage-mod-src-mq3-game-g-missile-ml-363952673"></a>
### ProximityMine_Die

```ml
function ProximityMine_Die(level, ent, inflictor, attacker, damage, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L45)

<a id="function-function-mq3-game-g-missile-proximitymine-explode-function-proximitymine-explode-level-mine-src-mq3-game-g-missile-ml-1418904909"></a>
### ProximityMine_Explode

```ml
function ProximityMine_Explode(level, mine)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `mine` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L39)

<a id="function-function-mq3-game-g-missile-proximitymine-explodeonplayer-function-proximitymine-explodeonplayer-level-mine-src-mq3-game-g-missile-ml-1641089697"></a>
### ProximityMine_ExplodeOnPlayer

```ml
function ProximityMine_ExplodeOnPlayer(level, mine)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `mine` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L77)

<a id="function-function-mq3-game-g-missile-proximitymine-player-function-proximitymine-player-level-mine-player-src-mq3-game-g-missile-ml-877093170"></a>
### ProximityMine_Player

```ml
function ProximityMine_Player(level, mine, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `mine` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L89)

<a id="function-function-mq3-game-g-missile-proximitymine-trigger-function-proximitymine-trigger-level-trigger-other-trace-src-mq3-game-g-missile-ml-169294651"></a>
### ProximityMine_Trigger

```ml
function ProximityMine_Trigger(level, trigger, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `trigger` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L55)

<a id="constant-constant-mq3-game-g-missile-svf-noclient-const-svf-noclient-1-src-mq3-game-g-missile-ml-503051952"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L29)

<a id="constant-constant-mq3-game-g-missile-svf-use-current-origin-const-svf-use-current-origin-128-src-mq3-game-g-missile-ml-1722215418"></a>
### SVF_USE_CURRENT_ORIGIN

```ml
const SVF_USE_CURRENT_ORIGIN = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L30)

<a id="constant-constant-mq3-game-g-missile-wp-nailgun-const-wp-nailgun-11-src-mq3-game-g-missile-ml-1883500237"></a>
### WP_NAILGUN

```ml
const WP_NAILGUN = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L22)

<a id="constant-constant-mq3-game-g-missile-wp-prox-launcher-const-wp-prox-launcher-12-src-mq3-game-g-missile-ml-90165684"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L23)
