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

Set `level.podium1.nextthink` to `level.time` and `level.podium1.think` to `celebrateStop` in `mq3.game.arenas.abortPodium`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `podium1` and `time`. May update `level.podium1.nextthink` and `level.podium1.think` in place. |
| `argv` | `dynamic` | — | Not read by this implementation; retained in the `abortPodium` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L213)

<a id="constant-constant-mq3-game-arenas-anim-togglebit-const-anim-togglebit-128-src-mq3-game-arenas-ml-1489311742"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```

Animation bit toggled to restart an animation even when its index is unchanged.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L26)

<a id="function-function-mq3-game-arenas-celebratestart-function-celebratestart-level-player-src-mq3-game-arenas-ml-441193319"></a>
### celebrateStart

```ml
function celebrateStart(level, player)
```

Update `player.s.torsoAnim`, `player.nextthink` and `player.think` during `celebrateStart`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `nextthink` and `think`. May update `player.s.torsoAnim`, `player.nextthink` and `player.think` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L163)

<a id="function-function-mq3-game-arenas-celebratestop-function-celebratestop-level-player-src-mq3-game-arenas-ml-368978369"></a>
### celebrateStop

```ml
function celebrateStop(level, player)
```

Set `player.s.torsoAnim` to `((player.s.torsoAnim & ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)|anim` in `mq3.game.arenas.celebrateStop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `celebrateStop` signature. |
| `player` | `dynamic` | — | Player entity; accesses `s`. May update `player.s.torsoAnim` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L153)

<a id="function-function-mq3-game-arenas-clientlimit-function-clientlimit-limit-src-mq3-game-arenas-ml-1036826327"></a>
### clientLimit

```ml
function clientLimit(limit)
```

Validate the arena client limit against the native sixty-four-client storage capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `limit` | `dynamic` | — | Operand used to evaluate the returned expression `limit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L32)

<a id="constant-constant-mq3-game-arenas-contents-body-const-contents-body-headers-contents-body-src-mq3-game-arenas-ml-1035965384"></a>
### CONTENTS_BODY

```ml
const CONTENTS_BODY = headers.CONTENTS_BODY
```

Collision-contents bit identifying body space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L22)

<a id="constant-constant-mq3-game-arenas-contents-playerclip-const-contents-playerclip-headers-contents-playerclip-src-mq3-game-arenas-ml-169709941"></a>
### CONTENTS_PLAYERCLIP

```ml
const CONTENTS_PLAYERCLIP = headers.CONTENTS_PLAYERCLIP
```

Collision-contents bit identifying playerclip space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L20)

<a id="constant-constant-mq3-game-arenas-contents-solid-const-contents-solid-headers-contents-solid-src-mq3-game-arenas-ml-115381813"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = headers.CONTENTS_SOLID
```

Collision-contents bit identifying solid space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L18)

<a id="function-function-mq3-game-arenas-cvarinteger-function-cvarinteger-level-name-src-mq3-game-arenas-ml-1996026689"></a>
### cvarInteger

```ml
function cvarInteger(level, name)
```

Apply `mq3.qcommon.cvar.find` while evaluating `cvarInteger`. Return paths include `variable.integer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L40)

<a id="constant-constant-mq3-game-arenas-entitynum-world-const-entitynum-world-1022-src-mq3-game-arenas-ml-1017198498"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```

Reserved entity number representing the BSP world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L24)

<a id="function-function-mq3-game-arenas-facefrompodium-function-facefrompodium-level-podium-ent-src-mq3-game-arenas-ml-1756913819"></a>
### faceFromPodium

```ml
function faceFromPodium(level, podium, ent)
```

Set `ent.s.apos.trBase` to `angles` in `mq3.game.arenas.faceFromPodium`. Return paths include `angles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermission_origin`. |
| `podium` | `dynamic` | — | Podium record; accesses `r`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. May update `ent.s.apos.trBase` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L122)

<a id="function-function-mq3-game-arenas-padpoint-function-padpoint-pad-offset-angles-src-mq3-game-arenas-ml-1320660318"></a>
### padPoint

```ml
function padPoint(pad, offset, angles)
```

Transform a podium-local offset into world coordinates using the podium origin and view axes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pad` | `dynamic` | — | Pad record; accesses `r`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L113)

<a id="function-function-mq3-game-arenas-podiumplacementthink-function-podiumplacementthink-level-podium-src-mq3-game-arenas-ml-1662847054"></a>
### podiumPlacementThink

```ml
function podiumPlacementThink(level, podium)
```

Set `podium.nextthink` to `n.add32(level.time,100)` in `mq3.game.arenas.podiumPlacementThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `intermission_angle`, `intermission_origin`, `podium1` and `podium2` and related fields. |
| `podium` | `dynamic` | — | Podium record; accesses `nextthink`. May update `podium.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L172)

<a id="function-function-mq3-game-arenas-spawnmodelonvictorypad-function-spawnmodelonvictorypad-level-pad-offset-ent-place-src-mq3-game-arenas-ml-228826084"></a>
### spawnModelOnVictoryPad

```ml
function spawnModelOnVictoryPad(level, pad, offset, ent, place)
```

Apply `mq3.game.entities.spawn`, `mq3.game.entitystate.copy` and `mq3.game.arenas.faceFromPodium` while evaluating `spawnModelOnVictoryPad`. Return paths include `body`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `pad` | `dynamic` | — | Podium record; accesses `r`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `r`. |
| `place` | `dynamic` | — | Value used by `spawnModelOnVictoryPad` in `body.count = place`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L134)

<a id="function-function-mq3-game-arenas-spawnmodelsonvictorypads-function-spawnmodelsonvictorypads-level-src-mq3-game-arenas-ml-870222102"></a>
### spawnModelsOnVictoryPads

```ml
function spawnModelsOnVictoryPads(level)
```

Update `level.podium1`, `level.podium2` and `level.podium3` during `spawnModelsOnVictoryPads`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `podium1`, `podium2`, `podium3`, `sortedClients` and `entities` and related fields. May update `level.podium1`, `level.podium2` and `level.podium3` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L195)

<a id="function-function-mq3-game-arenas-spawnpodium-function-spawnpodium-level-src-mq3-game-arenas-ml-206452580"></a>
### spawnPodium

```ml
function spawnPodium(level)
```

Apply `mq3.game.entities.spawn`, `mq3.game.spawn_values.modelIndex` and `mq3.game.arenas.cvarInteger` while evaluating `spawnPodium`. Return paths include `podium`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `intermission_angle`, `intermission_origin` and `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L183)

<a id="constant-constant-mq3-game-arenas-timer-gesture-const-timer-gesture-internal-timer-gesture-src-mq3-game-arenas-ml-1032549759"></a>
### TIMER_GESTURE

```ml
const TIMER_GESTURE = internal.TIMER_GESTURE
```

Gesture animation duration in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L28)

<a id="function-function-mq3-game-arenas-updatetournamentinfo-function-updatetournamentinfo-level-src-mq3-game-arenas-ml-635633058"></a>
### updateTournamentInfo

```ml
function updateTournamentInfo(level)
```

Use `level.consoleCommandFn` to perform `updateTournamentInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `entities`, `clients`, `spawner` and `numNonSpectatorClients` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/arenas.ml#L49)
