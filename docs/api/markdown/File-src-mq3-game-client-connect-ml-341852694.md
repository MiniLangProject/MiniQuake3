# `src/mq3/game/client_connect.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_connect`](Package-mq3-game-client-connect-1902566080.md)

Reachable from entry: **no**

## Imports

- `mq3/game/bot_clients.ml` as `botClients` → [src/mq3/game/bot_clients.ml](File-src-mq3-game-bot-clients-ml-237353140.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/ip_filters.ml` as `ipFilters` → [src/mq3/game/ip_filters.ml](File-src-mq3-game-ip-filters-ml-868936231.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/session.ml` as `sessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-client-connect-connect-function-connect-level-slot-firsttime-isbot-src-mq3-game-client-connect-ml-1135071614"></a>
### connect

```ml
function connect(level, slot, firstTime, isBot)
```

Use `level.userinfoFn`, `level.filterPacketFn` and `level.botConnectFn` to perform `connect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`, `userinfoFn`, `filterPacketFn`, `cvarMaintenance` and `clients` and related fields. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `firstTime` | `dynamic` | — | Value used by `connect` in `if firstTime or level.newSession then sessions.initClient(level,client,info) end if`. |
| `isBot` | `dynamic` | — | Value used by `connect` in `if isBot then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_connect.ml#L19)
