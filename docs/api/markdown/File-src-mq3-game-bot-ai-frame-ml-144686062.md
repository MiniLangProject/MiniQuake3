# `src/mq3/game/bot_ai_frame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_ai_frame`](Package-mq3-game-bot-ai-frame-932892716.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_ai_commands.ml` as `botCommands` → [src/mq3/game/bot_ai_commands.ml](File-src-mq3-game-bot-ai-commands-ml-200092467.md)
- `mq3/game/bot_input.ml` as `botInput` → [src/mq3/game/bot_input.ml](File-src-mq3-game-bot-input-ml-1155152552.md)
- `mq3/game/bot_lifecycle.ml` as `botFrameLifecycle` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)

## Declarations

<a id="function-function-mq3-game-bot-ai-frame-activebot-function-activebot-state-index-src-mq3-game-bot-ai-frame-ml-2119399237"></a>
### activeBot

```ml
function activeBot(state, index)
```

Check whether the selected bot-state entry exists and is marked in use.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot AI frame state; accesses `botstates`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L198)

<a id="function-function-mq3-game-bot-ai-frame-botentity-function-botentity-ent-index-src-mq3-game-bot-ai-frame-ml-1483302155"></a>
### botEntity

```ml
function botEntity(ent, index)
```

Build the `mq3.game.bot_ai_frame.BotEntityState` result for `botEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `s`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L163)

- [mq3.game.bot_ai_frame.BotEntityState](Type-mq3-game-bot-ai-frame-botentitystate-560919205.md) — struct
<a id="function-function-mq3-game-bot-ai-frame-commandclientstate-function-commandclientstate-services-clientnum-src-mq3-game-bot-ai-frame-ml-112755053"></a>
### commandClientState

```ml
function commandClientState(services, clientNum)
```

Forward `commandClientState` to `mq3.game.bot_ai_frame.getClientState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `frameLevel`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L134)

<a id="function-function-mq3-game-bot-ai-frame-connected-function-connected-level-index-src-mq3-game-bot-ai-frame-ml-1110104196"></a>
### connected

```ml
function connected(level, index)
```

Test `level.entities[index].client != void and level.entities[index].client.connected == 2` as the condition for `connected`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L206)

<a id="function-function-mq3-game-bot-ai-frame-create-function-create-state-src-mq3-game-bot-ai-frame-ml-2050999901"></a>
### create

```ml
function create(state)
```

Apply `mq3.game.bot_ai_commands.create` and `mq3.game.bot_input.create` while evaluating `create`. Return paths include `services`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.game.bot_ai_frame.Services.lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L95)

<a id="function-function-mq3-game-bot-ai-frame-eligibleentity-function-eligibleentity-ent-src-mq3-game-bot-ai-frame-ml-783949097"></a>
### eligibleEntity

```ml
function eligibleEntity(ent)
```

Select linked, client-visible entities for bot perception, excluding ordinary missiles and event-only entities.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `inuse`, `r` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L177)

<a id="function-function-mq3-game-bot-ai-frame-getclientstate-function-getclientstate-level-clientnum-src-mq3-game-bot-ai-frame-ml-1576009423"></a>
### getClientState

```ml
function getClientState(level, clientNum)
```

Apply `mq3.game.bot_ai_frame.validSlot`, `mq3.game.playerstate.create` and `mq3.game.playerstate.copy` while evaluating `getClientState`. Return paths include `[true,playerstate.copy(ent.client.ps)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L125)

<a id="function-function-mq3-game-bot-ai-frame-getentitystate-function-getentitystate-level-entitynum-src-mq3-game-bot-ai-frame-ml-1969677219"></a>
### getEntityState

```ml
function getEntityState(level, entityNum)
```

Apply `mq3.game.bot_ai_frame.validSlot`, `mq3.game.entitystate.create` and `mq3.game.entitystate.copy` while evaluating `getEntityState`. Return paths include `[true,entitystate.copy(ent.s)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L141)

<a id="function-function-mq3-game-bot-ai-frame-getsnapshotentity-function-getsnapshotentity-level-services-clientnum-sequence-src-mq3-game-bot-ai-frame-ml-841591236"></a>
### getSnapshotEntity

```ml
function getSnapshotEntity(level, services, clientNum, sequence)
```

Use `services.snapshotEntityFn` to perform `getSnapshotEntity`. Return paths include `[n.add32(sequence,1),getEntityState(level,entNum)[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `services` | `dynamic` | — | Host service callbacks; accesses `snapshotEntityFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `sequence` | `dynamic` | — | Value passed as argument 3 to `services.snapshotEntityFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L153)

<a id="constant-constant-mq3-game-bot-ai-frame-max-clients-const-max-clients-64-src-mq3-game-bot-ai-frame-ml-138227167"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L15)

<a id="constant-constant-mq3-game-bot-ai-frame-max-gentities-const-max-gentities-1024-src-mq3-game-bot-ai-frame-ml-2028950748"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L16)

<a id="function-function-mq3-game-bot-ai-frame-need-function-need-callback-label-src-mq3-game-bot-ai-frame-ml-1854810419"></a>
### need

```ml
function need(callback, label)
```

Require a bot frame service callback and identify a missing service in the resulting error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L108)

<a id="function-function-mq3-game-bot-ai-frame-regularupdate-function-regularupdate-services-src-mq3-game-bot-ai-frame-ml-290245038"></a>
### regularUpdate

```ml
function regularUpdate(services)
```

Set `services.regularUpdateTime` to `n.fadd(services.floatTimeFn(services),0.3)` in `mq3.game.bot_ai_frame.regularUpdate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`, `regularUpdateTime` and `updateEntityItemsFn`. May update `services.regularUpdateTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L186)

- [mq3.game.bot_ai_frame.Runtime](Type-mq3-game-bot-ai-frame-runtime-1021335758.md) — struct
- [mq3.game.bot_ai_frame.Services](Type-mq3-game-bot-ai-frame-services-1932823690.md) — struct
<a id="constant-constant-mq3-game-bot-ai-frame-solid-bbox-const-solid-bbox-1-src-mq3-game-bot-ai-frame-ml-1355513396"></a>
### SOLID_BBOX

```ml
const SOLID_BBOX = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L18)

<a id="constant-constant-mq3-game-bot-ai-frame-solid-bsp-const-solid-bsp-2-src-mq3-game-bot-ai-frame-ml-907572499"></a>
### SOLID_BSP

```ml
const SOLID_BSP = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L19)

<a id="function-function-mq3-game-bot-ai-frame-startframe-function-startframe-level-services-time-src-mq3-game-bot-ai-frame-ml-246449395"></a>
### startFrame

```ml
function startFrame(level, services, time)
```

Update `services.commandServices.fightServices`, `services.commandServices.seekServices`, `services.commandServices.frameLevel` and `services.commandServices.getClientStateFn` and related state during `startFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`, `fightServices`, `commandServices`, `seekServices` and `checkSpawnFn` and related fields. May update `services.commandServices.fightServices`, `services.commandServices.seekServices` and `services.commandServices.frameLevel` and additional fields in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L214)

<a id="constant-constant-mq3-game-bot-ai-frame-svf-noclient-const-svf-noclient-1-src-mq3-game-bot-ai-frame-ml-1584358430"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L17)

- [mq3.game.bot_ai_frame.UserCommand](Type-mq3-game-bot-ai-frame-usercommand-1780820726.md) — struct
<a id="function-function-mq3-game-bot-ai-frame-validslot-function-validslot-slot-limit-label-src-mq3-game-bot-ai-frame-ml-736637507"></a>
### validSlot

```ml
function validSlot(slot, limit, label)
```

Require an integer bot-frame slot within the specified table limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `limit` | `dynamic` | — | Value used by `validSlot` in `if typeof(slot) != "int" or slot < 0 or slot >= limit then return error(498,"Invalid "+label+" slot") end if`. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L117)
