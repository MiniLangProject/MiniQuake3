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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L97)

<a id="function-function-mq3-game-bodies-copytoqueue-function-copytoqueue-level-ent-src-mq3-game-bodies-ml-1802435609"></a>
### copyToQueue

```ml
function copyToQueue(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L71)

<a id="function-function-mq3-game-bodies-die-function-die-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-bodies-ml-1278382099"></a>
### die

```ml
function die(level, self, inflictor, attacker, damage, meansOfDeath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `meansOfDeath` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L49)

<a id="function-function-mq3-game-bodies-gib-function-gib-level-self-killer-src-mq3-game-bodies-ml-1680785247"></a>
### gib

```ml
function gib(level, self, killer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `killer` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L39)

<a id="function-function-mq3-game-bodies-initqueue-function-initqueue-level-src-mq3-game-bodies-ml-2120058292"></a>
### initQueue

```ml
function initQueue(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L54)

<a id="function-function-mq3-game-bodies-lookatkiller-function-lookatkiller-level-self-inflictor-attacker-src-mq3-game-bodies-ml-1830717165"></a>
### lookAtKiller

```ml
function lookAtKiller(level, self, inflictor, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L26)

<a id="function-function-mq3-game-bodies-run-function-run-level-ent-src-mq3-game-bodies-ml-1004141553"></a>
### run

```ml
function run(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L115)

<a id="function-function-mq3-game-bodies-sink-function-sink-level-ent-src-mq3-game-bodies-ml-861259595"></a>
### sink

```ml
function sink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L66)

<a id="function-function-mq3-game-bodies-vectoryaw-function-vectoryaw-vector-src-mq3-game-bodies-ml-1820394903"></a>
### vectorYaw

```ml
function vectorYaw(vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bodies.ml#L17)
