# `src/mq3/game/bot_lifecycle.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_lifecycle`](Package-mq3-game-bot-lifecycle-296827328.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-bot-lifecycle-botlibvar-function-botlibvar-state-name-value-src-mq3-game-bot-lifecycle-ml-1719001225"></a>
### botLibVar

```ml
function botLibVar(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L202)

- [mq3.game.bot_lifecycle.BotState](Type-mq3-game-bot-lifecycle-botstate-1141153540.md) — struct
<a id="function-function-mq3-game-bot-lifecycle-create-function-create-registry-src-mq3-game-bot-lifecycle-ml-1645017815"></a>
### create

```ml
function create(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L164)

<a id="function-function-mq3-game-bot-lifecycle-createbot-function-createbot-client-src-mq3-game-bot-lifecycle-ml-1114290541"></a>
### createBot

```ml
function createBot(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L172)

<a id="function-function-mq3-game-bot-lifecycle-cvareffect-function-cvareffect-state-kind-key-value-src-mq3-game-bot-lifecycle-ml-1916731171"></a>
### cvarEffect

```ml
function cvarEffect(state, kind, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L176)

<a id="function-function-mq3-game-bot-lifecycle-endmatch-function-endmatch-state-src-mq3-game-bot-lifecycle-ml-1799126469"></a>
### endMatch

```ml
function endMatch(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L375)

<a id="function-function-mq3-game-bot-lifecycle-initlibrary-function-initlibrary-state-src-mq3-game-bot-lifecycle-ml-444314811"></a>
### initLibrary

```ml
function initLibrary(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L207)

<a id="function-function-mq3-game-bot-lifecycle-interbreedbots-function-interbreedbots-state-src-mq3-game-bot-lifecycle-ml-1675249965"></a>
### interbreedBots

```ml
function interbreedBots(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L352)

<a id="function-function-mq3-game-bot-lifecycle-loadmap-function-loadmap-state-restart-src-mq3-game-bot-lifecycle-ml-1497086434"></a>
### loadMap

```ml
function loadMap(state, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L303)

<a id="constant-constant-mq3-game-bot-lifecycle-max-clients-const-max-clients-64-src-mq3-game-bot-lifecycle-ml-1966335303"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L10)

<a id="constant-constant-mq3-game-bot-lifecycle-max-gentities-const-max-gentities-1024-src-mq3-game-bot-lifecycle-ml-1149872298"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L11)

<a id="function-function-mq3-game-bot-lifecycle-querycvar-function-querycvar-state-name-capacity-src-mq3-game-bot-lifecycle-ml-241355000"></a>
### queryCvar

```ml
function queryCvar(state, name, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L187)

<a id="function-function-mq3-game-bot-lifecycle-rank-function-rank-bot-src-mq3-game-bot-lifecycle-ml-1897762733"></a>
### rank

```ml
function rank(bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L333)

<a id="function-function-mq3-game-bot-lifecycle-registercvar-function-registercvar-state-snapshot-name-defaultvalue-flags-src-mq3-game-bot-lifecycle-ml-1728268099"></a>
### registerCvar

```ml
function registerCvar(state, snapshot, name, defaultValue, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L181)

<a id="function-function-mq3-game-bot-lifecycle-required-function-required-state-callback-label-src-mq3-game-bot-lifecycle-ml-957825630"></a>
### required

```ml
function required(state, callback, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L270)

<a id="function-function-mq3-game-bot-lifecycle-resetstate-function-resetstate-state-bot-src-mq3-game-bot-lifecycle-ml-118040456"></a>
### resetState

```ml
function resetState(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L275)

<a id="function-function-mq3-game-bot-lifecycle-setcvar-function-setcvar-state-name-value-src-mq3-game-bot-lifecycle-ml-1359916419"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L198)

<a id="function-function-mq3-game-bot-lifecycle-setup-function-setup-state-restart-src-mq3-game-bot-lifecycle-ml-615696140"></a>
### setup

```ml
function setup(state, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L252)

<a id="function-function-mq3-game-bot-lifecycle-shutdown-function-shutdown-state-restart-src-mq3-game-bot-lifecycle-ml-2101214770"></a>
### shutdown

```ml
function shutdown(state, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L317)

- [mq3.game.bot_lifecycle.State](Type-mq3-game-bot-lifecycle-state-939171775.md) — struct
<a id="function-function-mq3-game-bot-lifecycle-updatecvar-function-updatecvar-state-snapshot-name-src-mq3-game-bot-lifecycle-ml-1906683300"></a>
### updateCvar

```ml
function updateCvar(state, snapshot, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L194)

<a id="function-function-mq3-game-bot-lifecycle-writeinterbreeded-function-writeinterbreeded-state-filename-src-mq3-game-bot-lifecycle-ml-50112198"></a>
### writeInterbreeded

```ml
function writeInterbreeded(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L338)
