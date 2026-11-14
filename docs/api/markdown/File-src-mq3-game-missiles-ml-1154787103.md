# `src/mq3/game/missiles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.missiles`](Package-mq3-game-missiles-1363713983.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-missiles-accuracy-function-accuracy-level-ent-src-mq3-game-missiles-ml-399353473"></a>
### accuracy

```ml
function accuracy(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L23)

<a id="function-function-mq3-game-missiles-bounce-function-bounce-level-ent-hit-src-mq3-game-missiles-ml-1775339680"></a>
### bounce

```ml
function bounce(level, ent, hit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L51)

<a id="function-function-mq3-game-missiles-explode-function-explode-level-ent-src-mq3-game-missiles-ml-1318663987"></a>
### explode

```ml
function explode(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L68)

<a id="function-function-mq3-game-missiles-fire-function-fire-level-self-start-dir-weapon-src-mq3-game-missiles-ml-2085538035"></a>
### fire

```ml
function fire(level, self, start, dir, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L132)

<a id="function-function-mq3-game-missiles-hookclient-function-hookclient-ent-src-mq3-game-missiles-ml-715130013"></a>
### hookClient

```ml
function hookClient(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L29)

<a id="function-function-mq3-game-missiles-hookfree-function-hookfree-level-ent-src-mq3-game-missiles-ml-1084910121"></a>
### hookFree

```ml
function hookFree(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L33)

<a id="function-function-mq3-game-missiles-hookpoint-function-hookpoint-other-src-mq3-game-missiles-ml-1114785480"></a>
### hookPoint

```ml
function hookPoint(other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L37)

<a id="function-function-mq3-game-missiles-hookthink-function-hookthink-level-ent-src-mq3-game-missiles-ml-371921023"></a>
### hookThink

```ml
function hookThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L44)

<a id="function-function-mq3-game-missiles-impact-function-impact-level-ent-hit-src-mq3-game-missiles-ml-1409096684"></a>
### impact

```ml
function impact(level, ent, hit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L77)

<a id="function-function-mq3-game-missiles-run-function-run-level-ent-src-mq3-game-missiles-ml-50430007"></a>
### run

```ml
function run(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L112)

<a id="function-function-mq3-game-missiles-snaptowards-function-snaptowards-v-towards-src-mq3-game-missiles-ml-1913883608"></a>
### snapTowards

```ml
function snapTowards(v, towards)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |
| `towards` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/missiles.ml#L15)
