# `src/mq3/game/arenas.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.arenas`](Package-mq3-game-arenas-972835178.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/entitystate.ml` as `entityState` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/game_internal_headers.ml` as `internal` → [src/mq3/game/game_internal_headers.ml](File-src-mq3-game-game-internal-headers-ml-370319487.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-arenas-abortpodium-function-abortpodium-level-argv-src-mq3-game-arenas-ml-50643856"></a>
### abortPodium

```ml
function abortPodium(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L170)

<a id="constant-constant-mq3-game-arenas-anim-togglebit-const-anim-togglebit-128-src-mq3-game-arenas-ml-1489311742"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L21)

<a id="function-function-mq3-game-arenas-celebratestart-function-celebratestart-level-player-src-mq3-game-arenas-ml-441193319"></a>
### celebrateStart

```ml
function celebrateStart(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L130)

<a id="function-function-mq3-game-arenas-celebratestop-function-celebratestop-level-player-src-mq3-game-arenas-ml-368978369"></a>
### celebrateStop

```ml
function celebrateStop(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L123)

<a id="function-function-mq3-game-arenas-clientlimit-function-clientlimit-limit-src-mq3-game-arenas-ml-1036826327"></a>
### clientLimit

```ml
function clientLimit(limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L24)

<a id="constant-constant-mq3-game-arenas-contents-body-const-contents-body-headers-contents-body-src-mq3-game-arenas-ml-1035965384"></a>
### CONTENTS_BODY

```ml
const CONTENTS_BODY = headers.CONTENTS_BODY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L19)

<a id="constant-constant-mq3-game-arenas-contents-playerclip-const-contents-playerclip-headers-contents-playerclip-src-mq3-game-arenas-ml-169709941"></a>
### CONTENTS_PLAYERCLIP

```ml
const CONTENTS_PLAYERCLIP = headers.CONTENTS_PLAYERCLIP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L18)

<a id="constant-constant-mq3-game-arenas-contents-solid-const-contents-solid-headers-contents-solid-src-mq3-game-arenas-ml-115381813"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = headers.CONTENTS_SOLID
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L17)

<a id="function-function-mq3-game-arenas-cvarinteger-function-cvarinteger-level-name-src-mq3-game-arenas-ml-1996026689"></a>
### cvarInteger

```ml
function cvarInteger(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L29)

<a id="constant-constant-mq3-game-arenas-entitynum-world-const-entitynum-world-1022-src-mq3-game-arenas-ml-1017198498"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L20)

<a id="function-function-mq3-game-arenas-facefrompodium-function-facefrompodium-level-podium-ent-src-mq3-game-arenas-ml-1756913819"></a>
### faceFromPodium

```ml
function faceFromPodium(level, podium, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `podium` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L101)

<a id="function-function-mq3-game-arenas-padpoint-function-padpoint-pad-offset-angles-src-mq3-game-arenas-ml-1320660318"></a>
### padPoint

```ml
function padPoint(pad, offset, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pad` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L96)

<a id="function-function-mq3-game-arenas-podiumplacementthink-function-podiumplacementthink-level-podium-src-mq3-game-arenas-ml-1662847054"></a>
### podiumPlacementThink

```ml
function podiumPlacementThink(level, podium)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `podium` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L136)

<a id="function-function-mq3-game-arenas-spawnmodelonvictorypad-function-spawnmodelonvictorypad-level-pad-offset-ent-place-src-mq3-game-arenas-ml-228826084"></a>
### spawnModelOnVictoryPad

```ml
function spawnModelOnVictoryPad(level, pad, offset, ent, place)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `pad` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `place` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L107)

<a id="function-function-mq3-game-arenas-spawnmodelsonvictorypads-function-spawnmodelsonvictorypads-level-src-mq3-game-arenas-ml-870222102"></a>
### spawnModelsOnVictoryPads

```ml
function spawnModelsOnVictoryPads(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L155)

<a id="function-function-mq3-game-arenas-spawnpodium-function-spawnpodium-level-src-mq3-game-arenas-ml-206452580"></a>
### spawnPodium

```ml
function spawnPodium(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L145)

<a id="constant-constant-mq3-game-arenas-timer-gesture-const-timer-gesture-internal-timer-gesture-src-mq3-game-arenas-ml-1032549759"></a>
### TIMER_GESTURE

```ml
const TIMER_GESTURE = internal.TIMER_GESTURE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L22)

<a id="function-function-mq3-game-arenas-updatetournamentinfo-function-updatetournamentinfo-level-src-mq3-game-arenas-ml-635633058"></a>
### updateTournamentInfo

```ml
function updateTournamentInfo(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L36)
