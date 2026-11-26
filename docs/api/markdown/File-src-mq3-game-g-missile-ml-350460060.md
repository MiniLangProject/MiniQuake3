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

Collision-contents bit identifying trigger space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L41)

<a id="constant-constant-mq3-game-g-missile-damage-no-knockback-const-damage-no-knockback-4-src-mq3-game-g-missile-ml-564266265"></a>
### DAMAGE_NO_KNOCKBACK

```ml
const DAMAGE_NO_KNOCKBACK = 4
```

Damage-processing flag enabling no knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L47)

<a id="constant-constant-mq3-game-g-missile-ef-bounce-half-const-ef-bounce-half-32-src-mq3-game-g-missile-ml-811162282"></a>
### EF_BOUNCE_HALF

```ml
const EF_BOUNCE_HALF = 32
```

Network entity-flag bit indicating bounce half.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L33)

<a id="constant-constant-mq3-game-g-missile-ef-nodraw-const-ef-nodraw-128-src-mq3-game-g-missile-ml-487458868"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```

Network entity-flag bit indicating nodraw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L35)

<a id="constant-constant-mq3-game-g-missile-ef-ticking-const-ef-ticking-2-src-mq3-game-g-missile-ml-1486328767"></a>
### EF_TICKING

```ml
const EF_TICKING = 2
```

Network entity-flag bit indicating ticking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L31)

<a id="constant-constant-mq3-game-g-missile-entitynum-none-const-entitynum-none-1023-src-mq3-game-g-missile-ml-1205474385"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```

Entity-number sentinel meaning that no entity was hit or referenced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L45)

<a id="function-function-mq3-game-g-missile-fire-bfg-function-fire-bfg-level-self-start-dir-src-mq3-game-g-missile-ml-83546995"></a>
### fire_bfg

```ml
function fire_bfg(level, self, start, dir)
```

Forward `fire_bfg` to `mq3.game.missiles.fire` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L238)

<a id="function-function-mq3-game-g-missile-fire-grapple-function-fire-grapple-level-self-start-dir-src-mq3-game-g-missile-ml-854171595"></a>
### fire_grapple

```ml
function fire_grapple(level, self, start, dir)
```

Forward `fire_grapple` to `mq3.game.missiles.fire` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L250)

<a id="function-function-mq3-game-g-missile-fire-grenade-function-fire-grenade-level-self-start-dir-src-mq3-game-g-missile-ml-962124035"></a>
### fire_grenade

```ml
function fire_grenade(level, self, start, dir)
```

Forward `fire_grenade` to `mq3.game.missiles.fire` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L232)

<a id="function-function-mq3-game-g-missile-fire-nail-function-fire-nail-level-self-start-forward-right-up-src-mq3-game-g-missile-ml-552681064"></a>
### fire_nail

```ml
function fire_nail(level, self, start, forward, right, up)
```

Forward `fire_nail` to `mq3.game.g_weapon.fireNail` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `forward` | `dynamic` | — | Value passed as argument 3 to `mq3.shared.math.VectorMA`. |
| `right` | `dynamic` | — | Value passed as argument 3 to `mq3.shared.math.VectorMA`. |
| `up` | `dynamic` | — | Value passed as argument 3 to `mq3.shared.math.VectorMA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L258)

<a id="function-function-mq3-game-g-missile-fire-plasma-function-fire-plasma-level-self-start-dir-src-mq3-game-g-missile-ml-1000516013"></a>
### fire_plasma

```ml
function fire_plasma(level, self, start, dir)
```

Forward `fire_plasma` to `mq3.game.missiles.fire` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L226)

<a id="function-function-mq3-game-g-missile-fire-prox-function-fire-prox-level-self-start-dir-src-mq3-game-g-missile-ml-1855502207"></a>
### fire_prox

```ml
function fire_prox(level, self, start, dir)
```

Forward `fire_prox` to `mq3.game.g_weapon.fireProx` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s` and `client`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L264)

<a id="function-function-mq3-game-g-missile-fire-rocket-function-fire-rocket-level-self-start-dir-src-mq3-game-g-missile-ml-1843225833"></a>
### fire_rocket

```ml
function fire_rocket(level, self, start, dir)
```

Forward `fire_rocket` to `mq3.game.missiles.fire` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L244)

<a id="function-function-mq3-game-g-missile-g-bouncemissile-function-g-bouncemissile-level-ent-hit-src-mq3-game-g-missile-ml-133320190"></a>
### G_BounceMissile

```ml
function G_BounceMissile(level, ent, hit)
```

Forward `G_BounceMissile` to `mq3.game.missiles.bounce` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `previousTime` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.r.currentOrigin[axis]` and additional fields in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace` and `endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L53)

<a id="function-function-mq3-game-g-missile-g-explodemissile-function-g-explodemissile-level-ent-src-mq3-game-g-missile-ml-51055687"></a>
### G_ExplodeMissile

```ml
function G_ExplodeMissile(level, ent)
```

Forward `G_ExplodeMissile` to `mq3.game.missiles.explode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `freeAfterEvent`, `splashDamage`, `r` and `parent` and related fields. May update `ent.s.eType` and `ent.freeAfterEvent` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L57)

<a id="function-function-mq3-game-g-missile-g-missileimpact-function-g-missileimpact-level-ent-hit-src-mq3-game-g-missile-ml-729818106"></a>
### G_MissileImpact

```ml
function G_MissileImpact(level, ent, hit)
```

Update `ent.s.eFlags`, `ent.target_ent`, `ent.s.pos.trType` and `ent.s.pos.trDelta` and related state during `G_MissileImpact`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `target_ent`, `damage`, `r` and `methodOfDeath` and related fields. May update `ent.s.eFlags`, `ent.target_ent` and `ent.s.pos.trType` and additional fields in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace`, `entityNum` and `endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L174)

<a id="function-function-mq3-game-g-missile-g-runmissile-function-g-runmissile-level-ent-src-mq3-game-g-missile-ml-141336767"></a>
### G_RunMissile

```ml
function G_RunMissile(level, ent)
```

Update `ent.r.currentOrigin`, `ent.parent.client.hook` and `ent.count` during `G_RunMissile`. Return paths include `game.runThink(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `r`, `target_ent`, `count` and `clipmask` and related fields. May update `ent.r.currentOrigin`, `ent.parent.client.hook` and `ent.count` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L203)

<a id="function-function-mq3-game-g-missile-gametype-function-gametype-level-src-mq3-game-g-missile-ml-513423556"></a>
### gameType

```ml
function gameType(level)
```

Read the active game type from the spawner, using zero when no spawner is installed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L82)

<a id="function-function-mq3-game-g-missile-invulnerabilityeffect-function-invulnerabilityeffect-level-target-direction-point-src-mq3-game-g-missile-ml-2016797264"></a>
### invulnerabilityEffect

```ml
function invulnerabilityEffect(level, target, direction, point)
```

Exact RaySphereIntersections/G_InvulnerabilityEffect geometry used by the Team Arena projectile reflection branch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `target` | `dynamic` | — | Target record; accesses `client`. |
| `direction` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L157)

<a id="constant-constant-mq3-game-g-missile-mask-shot-const-mask-shot-100663297-src-mq3-game-g-missile-ml-1269504947"></a>
### MASK_SHOT

```ml
const MASK_SHOT = 100663297
```

Combined CONTENTS_* mask used for shot collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L43)

<a id="constant-constant-mq3-game-g-missile-mod-juiced-const-mod-juiced-28-src-mq3-game-g-missile-ml-2112044359"></a>
### MOD_JUICED

```ml
const MOD_JUICED = 28
```

Cause-of-death identifier attributing damage or a kill to juiced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L29)

<a id="constant-constant-mq3-game-g-missile-mod-proximity-mine-const-mod-proximity-mine-26-src-mq3-game-g-missile-ml-1953935071"></a>
### MOD_PROXIMITY_MINE

```ml
const MOD_PROXIMITY_MINE = 26
```

Cause-of-death identifier attributing damage or a kill to proximity mine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L27)

<a id="function-function-mq3-game-g-missile-proximitymine-activate-function-proximitymine-activate-level-ent-src-mq3-game-g-missile-ml-1143216451"></a>
### ProximityMine_Activate

```ml
function ProximityMine_Activate(level, ent)
```

Update `ent.think`, `ent.nextthink`, `ent.takedamage` and `ent.health` and related state during `ProximityMine_Activate`. Return paths include `trigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `think`, `nextthink`, `takedamage`, `health` and `die` and related fields. May update `ent.think`, `ent.nextthink` and `ent.takedamage` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L106)

<a id="function-function-mq3-game-g-missile-proximitymine-die-function-proximitymine-die-level-ent-inflictor-attacker-damage-mod-src-mq3-game-g-missile-ml-363952673"></a>
### ProximityMine_Die

```ml
function ProximityMine_Die(level, ent, inflictor, attacker, damage, mod)
```

Set `ent.think` to `ProximityMine_Explode` and `ent.nextthink` to `n.add32(level.time,1)` in `mq3.game.g_missile.ProximityMine_Die`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `think` and `nextthink`. May update `ent.think` and `ent.nextthink` in place. |
| `inflictor` | `dynamic` | — | Not read by this implementation; retained in the `ProximityMine_Die` signature. |
| `attacker` | `dynamic` | — | Not read by this implementation; retained in the `ProximityMine_Die` signature. |
| `damage` | `dynamic` | — | Not read by this implementation; retained in the `ProximityMine_Die` signature. |
| `mod` | `dynamic` | — | Not read by this implementation; retained in the `ProximityMine_Die` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L75)

<a id="function-function-mq3-game-g-missile-proximitymine-explode-function-proximitymine-explode-level-mine-src-mq3-game-g-missile-ml-1418904909"></a>
### ProximityMine_Explode

```ml
function ProximityMine_Explode(level, mine)
```

Set `mine.activator` to `void` in `mq3.game.g_missile.ProximityMine_Explode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `mine` | `dynamic` | — | Mine record; accesses `activator`. May update `mine.activator` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L62)

<a id="function-function-mq3-game-g-missile-proximitymine-explodeonplayer-function-proximitymine-explodeonplayer-level-mine-src-mq3-game-g-missile-ml-1641089697"></a>
### ProximityMine_ExplodeOnPlayer

```ml
function ProximityMine_ExplodeOnPlayer(level, mine)
```

Set `mine.r.svFlags` to `mine.r.svFlags & n.i32(~SVF_NOCLIENT)` and `mine.splashMethodOfDeath` to `MOD_PROXIMITY_MINE` in `mq3.game.g_missile.ProximityMine_ExplodeOnPlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `mine` | `dynamic` | — | Mine record; accesses `enemy`, `parent`, `s`, `r` and `splashMethodOfDeath`. May update `mine.r.svFlags` and `mine.splashMethodOfDeath` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L120)

<a id="function-function-mq3-game-g-missile-proximitymine-player-function-proximitymine-player-level-mine-player-src-mq3-game-g-missile-ml-877093170"></a>
### ProximityMine_Player

```ml
function ProximityMine_Player(level, mine, player)
```

Update `player.activator.splashDamage`, `player.activator.splashRadius`, `mine.think` and `mine.nextthink` and related state during `ProximityMine_Player`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `mine` | `dynamic` | — | Mine record; accesses `s`, `splashDamage`, `think`, `nextthink` and `r` and related fields. May update `mine.think`, `mine.nextthink` and `mine.s.eFlags` and additional fields in place. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `activator` and `client`. May update `player.activator.splashDamage`, `player.activator.splashRadius` and `player.client.ps.eFlags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L136)

<a id="function-function-mq3-game-g-missile-proximitymine-trigger-function-proximitymine-trigger-level-trigger-other-trace-src-mq3-game-g-missile-ml-169294651"></a>
### ProximityMine_Trigger

```ml
function ProximityMine_Trigger(level, trigger, other, trace)
```

Apply `mq3.game.g_missile.gameType`, `mq3.game.combat.canDamage` and `mq3.game.events.add` while evaluating `ProximityMine_Trigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `trigger` | `dynamic` | — | Trigger record; accesses `s` and `parent`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `s`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `ProximityMine_Trigger` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L92)

<a id="constant-constant-mq3-game-g-missile-svf-noclient-const-svf-noclient-1-src-mq3-game-g-missile-ml-503051952"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```

Server entity-flag bit controlling noclient.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L37)

<a id="constant-constant-mq3-game-g-missile-svf-use-current-origin-const-svf-use-current-origin-128-src-mq3-game-g-missile-ml-1722215418"></a>
### SVF_USE_CURRENT_ORIGIN

```ml
const SVF_USE_CURRENT_ORIGIN = 128
```

Server entity-flag bit controlling use current origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L39)

<a id="constant-constant-mq3-game-g-missile-wp-nailgun-const-wp-nailgun-11-src-mq3-game-g-missile-ml-1883500237"></a>
### WP_NAILGUN

```ml
const WP_NAILGUN = 11
```

Weapon identifier selecting nailgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L23)

<a id="constant-constant-mq3-game-g-missile-wp-prox-launcher-const-wp-prox-launcher-12-src-mq3-game-g-missile-ml-90165684"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 12
```

Weapon identifier selecting prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_missile.ml#L25)
