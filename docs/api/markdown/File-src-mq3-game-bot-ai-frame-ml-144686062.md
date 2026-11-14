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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L161)

<a id="function-function-mq3-game-bot-ai-frame-botentity-function-botentity-ent-index-src-mq3-game-bot-ai-frame-ml-1483302155"></a>
### botEntity

```ml
function botEntity(ent, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L133)

- [mq3.game.bot_ai_frame.BotEntityState](Type-mq3-game-bot-ai-frame-botentitystate-560919205.md) — struct
<a id="function-function-mq3-game-bot-ai-frame-commandclientstate-function-commandclientstate-services-clientnum-src-mq3-game-bot-ai-frame-ml-112755053"></a>
### commandClientState

```ml
function commandClientState(services, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L115)

<a id="function-function-mq3-game-bot-ai-frame-connected-function-connected-level-index-src-mq3-game-bot-ai-frame-ml-1110104196"></a>
### connected

```ml
function connected(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L166)

<a id="function-function-mq3-game-bot-ai-frame-create-function-create-state-src-mq3-game-bot-ai-frame-ml-2050999901"></a>
### create

```ml
function create(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L89)

<a id="function-function-mq3-game-bot-ai-frame-eligibleentity-function-eligibleentity-ent-src-mq3-game-bot-ai-frame-ml-783949097"></a>
### eligibleEntity

```ml
function eligibleEntity(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L145)

<a id="function-function-mq3-game-bot-ai-frame-getclientstate-function-getclientstate-level-clientnum-src-mq3-game-bot-ai-frame-ml-1576009423"></a>
### getClientState

```ml
function getClientState(level, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L109)

<a id="function-function-mq3-game-bot-ai-frame-getentitystate-function-getentitystate-level-entitynum-src-mq3-game-bot-ai-frame-ml-1969677219"></a>
### getEntityState

```ml
function getEntityState(level, entityNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L119)

<a id="function-function-mq3-game-bot-ai-frame-getsnapshotentity-function-getsnapshotentity-level-services-clientnum-sequence-src-mq3-game-bot-ai-frame-ml-841591236"></a>
### getSnapshotEntity

```ml
function getSnapshotEntity(level, services, clientNum, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L126)

<a id="constant-constant-mq3-game-bot-ai-frame-max-clients-const-max-clients-64-src-mq3-game-bot-ai-frame-ml-138227167"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L15)

<a id="constant-constant-mq3-game-bot-ai-frame-max-gentities-const-max-gentities-1024-src-mq3-game-bot-ai-frame-ml-2028950748"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L16)

<a id="function-function-mq3-game-bot-ai-frame-need-function-need-callback-label-src-mq3-game-bot-ai-frame-ml-1854810419"></a>
### need

```ml
function need(callback, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L99)

<a id="function-function-mq3-game-bot-ai-frame-regularupdate-function-regularupdate-services-src-mq3-game-bot-ai-frame-ml-290245038"></a>
### regularUpdate

```ml
function regularUpdate(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L152)

- [mq3.game.bot_ai_frame.Runtime](Type-mq3-game-bot-ai-frame-runtime-1021335758.md) — struct
- [mq3.game.bot_ai_frame.Services](Type-mq3-game-bot-ai-frame-services-1932823690.md) — struct
<a id="constant-constant-mq3-game-bot-ai-frame-solid-bbox-const-solid-bbox-1-src-mq3-game-bot-ai-frame-ml-1355513396"></a>
### SOLID_BBOX

```ml
const SOLID_BBOX = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L18)

<a id="constant-constant-mq3-game-bot-ai-frame-solid-bsp-const-solid-bsp-2-src-mq3-game-bot-ai-frame-ml-907572499"></a>
### SOLID_BSP

```ml
const SOLID_BSP = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L19)

<a id="function-function-mq3-game-bot-ai-frame-startframe-function-startframe-level-services-time-src-mq3-game-bot-ai-frame-ml-246449395"></a>
### startFrame

```ml
function startFrame(level, services, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L170)

<a id="constant-constant-mq3-game-bot-ai-frame-svf-noclient-const-svf-noclient-1-src-mq3-game-bot-ai-frame-ml-1584358430"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L17)

- [mq3.game.bot_ai_frame.UserCommand](Type-mq3-game-bot-ai-frame-usercommand-1780820726.md) — struct
<a id="function-function-mq3-game-bot-ai-frame-validslot-function-validslot-slot-limit-label-src-mq3-game-bot-ai-frame-ml-736637507"></a>
### validSlot

```ml
function validSlot(slot, limit, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L104)
