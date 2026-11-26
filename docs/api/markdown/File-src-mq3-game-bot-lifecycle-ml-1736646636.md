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

Use `state.botLibVarSetFn` to perform `botLibVar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `botLibVarSetFn`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Value passed as argument 3 to `state.botLibVarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L235)

- [mq3.game.bot_lifecycle.BotState](Type-mq3-game-bot-lifecycle-botstate-1141153540.md) — struct
<a id="function-function-mq3-game-bot-lifecycle-create-function-create-registry-src-mq3-game-bot-lifecycle-ml-1645017815"></a>
### create

```ml
function create(registry)
```

Build the `mq3.game.bot_lifecycle.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Initial value stored in `mq3.game.bot_lifecycle.State.registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L168)

<a id="function-function-mq3-game-bot-lifecycle-createbot-function-createbot-client-src-mq3-game-bot-lifecycle-ml-1114290541"></a>
### createBot

```ml
function createBot(client)
```

Create a `mq3.game.bot_lifecycle.BotState` record, initializing `inuse` as `true`, `client` from `client` and `entitynum` from `client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_lifecycle.BotState.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L178)

<a id="function-function-mq3-game-bot-lifecycle-cvareffect-function-cvareffect-state-kind-key-value-src-mq3-game-bot-lifecycle-ml-1916731171"></a>
### cvarEffect

```ml
function cvarEffect(state, kind, key, value)
```

Use `state.cvarEffectFn` to perform `cvarEffect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `cvarEffectFn`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.cvarEffectFn`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 4 to `state.cvarEffectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L187)

<a id="function-function-mq3-game-bot-lifecycle-endmatch-function-endmatch-state-src-mq3-game-bot-lifecycle-ml-1799126469"></a>
### endMatch

```ml
function endMatch(state)
```

Set `state.interbreedMatchCount` to `n.add32(state.interbreedMatchCount,1)` and `state.interbreedMatchCount` to `0` in `mq3.game.bot_lifecycle.endMatch`. Return paths include `interbreedBots(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `interbreed`, `interbreedMatchCount`, `interbreedcycle` and `interbreedwrite`. May update `state.interbreedMatchCount` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L435)

<a id="function-function-mq3-game-bot-lifecycle-initlibrary-function-initlibrary-state-src-mq3-game-bot-lifecycle-ml-444314811"></a>
### initLibrary

```ml
function initLibrary(state)
```

Use `state.botLibSetupFn` to perform `initLibrary`. Return paths include `state.botLibSetupFn(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `developer` and `botLibSetupFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L242)

<a id="function-function-mq3-game-bot-lifecycle-interbreedbots-function-interbreedbots-state-src-mq3-game-bot-lifecycle-ml-1675249965"></a>
### interbreedBots

```ml
function interbreedBots(state)
```

Use `state.geneticSelectionFn`, `state.interbreedGoalFn` and `state.mutateGoalFn` to perform `interbreedBots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `botstates`, `geneticSelectionFn`, `interbreedGoalFn` and `mutateGoalFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L410)

<a id="function-function-mq3-game-bot-lifecycle-loadmap-function-loadmap-state-restart-src-mq3-game-bot-lifecycle-ml-1497086434"></a>
### loadMap

```ml
function loadMap(state, restart)
```

Use `state.botLibLoadMapFn` and `state.deathmatchSetupFn` to perform `loadMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `botLibLoadMapFn`, `botstates` and `deathmatchSetupFn`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L351)

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

Apply `mq3.game.bot_lifecycle.cvarEffect`, `mq3.qcommon.cvar.find` and `mq3.shared.info.copy` while evaluating `queryCvar`. Return paths include `infoStrings.copy(variable.string,capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `registry`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L208)

<a id="function-function-mq3-game-bot-lifecycle-rank-function-rank-bot-src-mq3-game-bot-lifecycle-ml-1897762733"></a>
### rank

```ml
function rank(bot)
```

Forward `rank` to `mq3.compat.numeric.f32` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `numKills` and `numDeaths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L386)

<a id="function-function-mq3-game-bot-lifecycle-registercvar-function-registercvar-state-snapshot-name-defaultvalue-flags-src-mq3-game-bot-lifecycle-ml-1728268099"></a>
### registerCvar

```ml
function registerCvar(state, snapshot, name, defaultValue, flags)
```

Register a bot lifecycle cvar through the configured host services and retain its local state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `registry`. |
| `snapshot` | `dynamic` | — | Snapshot record; accesses `handle` and `modificationCount`. May update `snapshot.handle` and `snapshot.modificationCount` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `defaultValue` | `dynamic` | — | Value passed as argument 4 to `state.cvarEffectFn`. |
| `flags` | `dynamic` | — | Initial value stored in `mq3.qcommon.cvar.Cvar.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L198)

<a id="function-function-mq3-game-bot-lifecycle-required-function-required-state-callback-label-src-mq3-game-bot-lifecycle-ml-957825630"></a>
### required

```ml
function required(state, callback, label)
```

Require a bot lifecycle callback and report the missing service by name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `required` signature. |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L312)

<a id="function-function-mq3-game-bot-lifecycle-resetstate-function-resetstate-state-bot-src-mq3-game-bot-lifecycle-ml-118040456"></a>
### resetState

```ml
function resetState(state, bot)
```

Update `bot.setupcount`, `bot.checkpoints`, `bot.patrolpoints` and `bot.walker` and related state during `resetState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `freeWaypointsFn`, `resetMoveStateFn`, `resetGoalStateFn`, `resetWeaponStateFn` and `resetAvoidGoalsFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `checkpoints`, `patrolpoints`, `setupcount`, `walker` and `numKills` and related fields. May update `bot.setupcount`, `bot.checkpoints` and `bot.patrolpoints` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L320)

<a id="function-function-mq3-game-bot-lifecycle-setcvar-function-setcvar-state-name-value-src-mq3-game-bot-lifecycle-ml-1359916419"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

Apply `mq3.game.bot_lifecycle.cvarEffect` and `mq3.qcommon.cvar.set2` while evaluating `setCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `registry`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Value passed as argument 4 to `state.cvarEffectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L227)

<a id="function-function-mq3-game-bot-lifecycle-setup-function-setup-state-restart-src-mq3-game-bot-lifecycle-ml-615696140"></a>
### setup

```ml
function setup(state, restart)
```

Set `state.botstates` to `array(MAX_CLIENTS,void)` in `mq3.game.bot_lifecycle.setup`. Return paths include `initLibrary(state) == 0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `thinktime`, `memorydump`, `saveroutingcache`, `pause` and `report` and related fields. May update `state.botstates` in place. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L290)

<a id="function-function-mq3-game-bot-lifecycle-shutdown-function-shutdown-state-restart-src-mq3-game-bot-lifecycle-ml-2101214770"></a>
### shutdown

```ml
function shutdown(state, restart)
```

Use `state.shutdownClientFn` and `state.botLibShutdownFn` to perform `shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `botstates`, `shutdownClientFn` and `botLibShutdownFn`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L368)

- [mq3.game.bot_lifecycle.State](Type-mq3-game-bot-lifecycle-state-939171775.md) — struct
<a id="function-function-mq3-game-bot-lifecycle-updatecvar-function-updatecvar-state-snapshot-name-src-mq3-game-bot-lifecycle-ml-1906683300"></a>
### updateCvar

```ml
function updateCvar(state, snapshot, name)
```

Apply `mq3.game.bot_lifecycle.cvarEffect` and `mq3.qcommon.cvar.updateVm` while evaluating `updateCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `registry`. |
| `snapshot` | `dynamic` | — | Snapshot record; accesses `handle`, `modificationCount`, `string`, `value` and `integer` and related fields. May update `snapshot.modificationCount`, `snapshot.string` and `snapshot.value` and additional fields in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L219)

<a id="function-function-mq3-game-bot-lifecycle-writeinterbreeded-function-writeinterbreeded-state-filename-src-mq3-game-bot-lifecycle-ml-50112198"></a>
### writeInterbreeded

```ml
function writeInterbreeded(state, filename)
```

Use `state.saveGoalFn` to perform `writeInterbreeded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot lifecycle state; accesses `botstates` and `saveGoalFn`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L394)
