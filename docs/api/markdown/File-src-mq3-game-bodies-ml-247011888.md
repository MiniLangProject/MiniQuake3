# `src/mq3/game/bodies.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bodies`](Package-mq3-game-bodies-761804534.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/entitystate.ml` as `es` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/g_local.ml` as `local` → [src/mq3/game/g_local.ml](File-src-mq3-game-g-local-ml-1293969097.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-bodies-bounce-function-bounce-level-ent-hit-src-mq3-game-bodies-ml-330496776"></a>
### bounce

```ml
function bounce(level, ent, hit)
```

Update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]`, `hit.endpos[2]` and `ent.s.groundEntityNum` and related state during `bounce`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `previousTime` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `physicsBounce` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.s.groundEntityNum` and additional fields in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace`, `endpos` and `entityNum`. May update `hit.endpos[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L127)

<a id="function-function-mq3-game-bodies-copytoqueue-function-copytoqueue-level-ent-src-mq3-game-bodies-ml-1802435609"></a>
### copyToQueue

```ml
function copyToQueue(level, ent)
```

Set `level.bodyQueIndex` to `local.nextBodyQueueSlot(level.bodyQueIndex)` in `mq3.game.bodies.copyToQueue`. Return paths include `game.link(level,body)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`, `bodyQue`, `bodyQueIndex` and `time`. May update `level.bodyQueIndex` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `client`, `r` and `health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L97)

<a id="function-function-mq3-game-bodies-die-function-die-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-bodies-ml-1278382099"></a>
### die

```ml
function die(level, self, inflictor, attacker, damage, meansOfDeath)
```

Set `self.health` to `-39` in `mq3.game.bodies.die`. Return paths include `gib(level,self,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `blood`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `health`. May update `self.health` in place. |
| `inflictor` | `dynamic` | — | Not read by this implementation; retained in the `die` signature. |
| `attacker` | `dynamic` | — | Not read by this implementation; retained in the `die` signature. |
| `damage` | `dynamic` | — | Not read by this implementation; retained in the `die` signature. |
| `meansOfDeath` | `dynamic` | — | Not read by this implementation; retained in the `die` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L67)

<a id="function-function-mq3-game-bodies-gib-function-gib-level-self-killer-src-mq3-game-bodies-ml-1680785247"></a>
### gib

```ml
function gib(level, self, killer)
```

Update `self.takedamage`, `self.s.eType` and `self.r.contents` during `gib`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`, `takedamage` and `r`. May update `self.takedamage`, `self.s.eType` and `self.r.contents` in place. |
| `killer` | `dynamic` | — | Integer parameter stored alongside the emitted event. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L50)

<a id="function-function-mq3-game-bodies-initqueue-function-initqueue-level-src-mq3-game-bodies-ml-2120058292"></a>
### initQueue

```ml
function initQueue(level)
```

Update `level.bodyQueIndex`, `level.bodyQue` and `level.bodyQue[i]` during `initQueue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `bodyQueIndex` and `bodyQue`. May update `level.bodyQueIndex`, `level.bodyQue` and `level.bodyQue[i]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L74)

<a id="function-function-mq3-game-bodies-lookatkiller-function-lookatkiller-level-self-inflictor-attacker-src-mq3-game-bodies-ml-1830717165"></a>
### lookAtKiller

```ml
function lookAtKiller(level, self, inflictor, attacker)
```

Set `self.client.ps.stats[c.STAT_DEAD_YAW]` to `n.trunc32(self.s.angles[1])` and `self.client.ps.stats[c.STAT_DEAD_YAW]` to `n.trunc32(vectorYaw(dir))` in `mq3.game.bodies.lookAtKiller`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `lookAtKiller` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client` and `s`. May update `self.client.ps.stats[c.STAT_DEAD_YAW]` in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L33)

<a id="function-function-mq3-game-bodies-run-function-run-level-ent-src-mq3-game-bodies-ml-1004141553"></a>
### run

```ml
function run(level, ent)
```

Update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` during `run`. Return paths include `bounce(level,ent,hit)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`, `s`, `clipmask` and `r`. May update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L148)

<a id="function-function-mq3-game-bodies-sink-function-sink-level-ent-src-mq3-game-bodies-ml-861259595"></a>
### sink

```ml
function sink(level, ent)
```

Update `ent.physicsObject`, `ent.nextthink` and `ent.s.pos.trBase[2]` during `sink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `timestamp`, `physicsObject`, `nextthink` and `s`. May update `ent.physicsObject`, `ent.nextthink` and `ent.s.pos.trBase[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L89)

<a id="function-function-mq3-game-bodies-vectoryaw-function-vectoryaw-vector-src-mq3-game-bodies-ml-1820394903"></a>
### vectorYaw

```ml
function vectorYaw(vector)
```

Convert a horizontal direction vector to the nonnegative yaw angle used to orient a corpse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — | Array or byte sequence accessed at `1` and `0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bodies.ml#L19)
