# `src/mq3/game/g_arenas.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_arenas`](Package-mq3-game-g-arenas-445123180.md)

Reachable from entry: **no**

## Imports

- `mq3/game/arenas.ml` as `runtime` → [src/mq3/game/arenas.ml](File-src-mq3-game-arenas-ml-1267669936.md)

## Declarations

<a id="function-function-mq3-game-g-arenas-celebratestart-function-celebratestart-level-player-src-mq3-game-g-arenas-ml-960886087"></a>
### CelebrateStart

```ml
function CelebrateStart(level, player)
```

Forward `CelebrateStart` to `mq3.game.arenas.celebrateStart` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `nextthink` and `think`. May update `player.s.torsoAnim`, `player.nextthink` and `player.think` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L24)

<a id="function-function-mq3-game-g-arenas-celebratestop-function-celebratestop-level-player-src-mq3-game-g-arenas-ml-52164537"></a>
### CelebrateStop

```ml
function CelebrateStop(level, player)
```

Forward `CelebrateStop` to `mq3.game.arenas.celebrateStop` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.arenas.celebrateStop`. |
| `player` | `dynamic` | — | Player entity; accesses `s`. May update `player.s.torsoAnim` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L20)

<a id="function-function-mq3-game-g-arenas-podiumplacementthink-function-podiumplacementthink-level-podium-src-mq3-game-g-arenas-ml-1053627870"></a>
### PodiumPlacementThink

```ml
function PodiumPlacementThink(level, podium)
```

Forward `PodiumPlacementThink` to `mq3.game.arenas.podiumPlacementThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `intermission_angle`, `intermission_origin`, `podium1` and `podium2` and related fields. |
| `podium` | `dynamic` | — | Podium record; accesses `nextthink`. May update `podium.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L28)

<a id="function-function-mq3-game-g-arenas-spawnmodelonvictorypad-function-spawnmodelonvictorypad-level-pad-offset-ent-place-src-mq3-game-g-arenas-ml-700296716"></a>
### SpawnModelOnVictoryPad

```ml
function SpawnModelOnVictoryPad(level, pad, offset, ent, place)
```

Forward `SpawnModelOnVictoryPad` to `mq3.game.arenas.spawnModelOnVictoryPad` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `pad` | `dynamic` | — | Podium record; accesses `r`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `r`. |
| `place` | `dynamic` | — | Value used by `spawnModelOnVictoryPad` in `body.count = place`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L16)

<a id="function-function-mq3-game-g-arenas-spawnmodelsonvictorypads-function-spawnmodelsonvictorypads-level-src-mq3-game-g-arenas-ml-2000729802"></a>
### SpawnModelsOnVictoryPads

```ml
function SpawnModelsOnVictoryPads(level)
```

Forward `SpawnModelsOnVictoryPads` to `mq3.game.arenas.spawnModelsOnVictoryPads` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `podium1`, `podium2`, `podium3`, `sortedClients` and `entities` and related fields. May update `level.podium1`, `level.podium2` and `level.podium3` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L34)

<a id="function-function-mq3-game-g-arenas-spawnpodium-function-spawnpodium-level-src-mq3-game-g-arenas-ml-1315367480"></a>
### SpawnPodium

```ml
function SpawnPodium(level)
```

Forward `SpawnPodium` to `mq3.game.arenas.spawnPodium` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `intermission_angle`, `intermission_origin` and `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L31)

<a id="function-function-mq3-game-g-arenas-svcmd-abortpodium-f-function-svcmd-abortpodium-f-level-argv-src-mq3-game-g-arenas-ml-1582218406"></a>
### Svcmd_AbortPodium_f

```ml
function Svcmd_AbortPodium_f(level, argv)
```

Forward `Svcmd_AbortPodium_f` to `mq3.game.arenas.abortPodium` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `podium1` and `time`. May update `level.podium1.nextthink` and `level.podium1.think` in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L38)

<a id="function-function-mq3-game-g-arenas-updatetournamentinfo-function-updatetournamentinfo-level-src-mq3-game-g-arenas-ml-676261822"></a>
### UpdateTournamentInfo

```ml
function UpdateTournamentInfo(level)
```

Forward `UpdateTournamentInfo` to `mq3.game.arenas.updateTournamentInfo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `entities`, `clients`, `spawner` and `numNonSpectatorClients` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_arenas.ml#L9)
