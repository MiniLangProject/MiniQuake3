# `src/mq3/botlib/lifecycle_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.lifecycle_runtime`](Package-mq3-botlib-lifecycle-runtime-435168691.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/lib_variables.ml` as `libvars` → [src/mq3/botlib/lib_variables.ml](File-src-mq3-botlib-lib-variables-ml-1792457987.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-botlib-lifecycle-runtime-blerr-invalidentitynumber-const-blerr-invalidentitynumber-2-src-mq3-botlib-lifecycle-runtime-ml-361668153"></a>
### BLERR_INVALIDENTITYNUMBER

```ml
const BLERR_INVALIDENTITYNUMBER = 2
```

Bot-library error indicating an out-of-range entity number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L13)

<a id="constant-constant-mq3-botlib-lifecycle-runtime-blerr-librarynotsetup-const-blerr-librarynotsetup-1-src-mq3-botlib-lifecycle-runtime-ml-1004667460"></a>
### BLERR_LIBRARYNOTSETUP

```ml
const BLERR_LIBRARYNOTSETUP = 1
```

Bot-library error indicating that setup has not completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L11)

<a id="constant-constant-mq3-botlib-lifecycle-runtime-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-lifecycle-runtime-ml-1303065883"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```

Bot-library status indicating successful completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L9)

<a id="function-function-mq3-botlib-lifecycle-runtime-create-function-create-src-mq3-botlib-lifecycle-runtime-ml-870927670"></a>
### create

```ml
function create()
```

Create a `mq3.botlib.lifecycle_runtime.State` record, initializing `maxclients` as `128` and `maxentities` as `1024`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L42)

<a id="function-function-mq3-botlib-lifecycle-runtime-integervariable-function-integervariable-state-name-fallback-src-mq3-botlib-lifecycle-runtime-ml-2037091256"></a>
### integerVariable

```ml
function integerVariable(state, name, fallback)
```

Apply `mq3.botlib.lifecycle_runtime.varGet` while evaluating `integerVariable`. Return paths include `n.trunc32(toNumber(value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L94)

<a id="function-function-mq3-botlib-lifecycle-runtime-loadmap-function-loadmap-state-mapname-src-mq3-botlib-lifecycle-runtime-ml-587696076"></a>
### loadMap

```ml
function loadMap(state, mapName)
```

Set `state.mapName` to `mapName` and `state.mapLoads` to `state.mapLoads+1` in `mq3.botlib.lifecycle_runtime.loadMap`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lifecycle runtime state; accesses `setup`, `mapName` and `mapLoads`. May update `state.mapName` and `state.mapLoads` in place. |
| `mapName` | `dynamic` | — | Value used by `loadMap` in `if mapName==void then mapName="" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L126)

<a id="function-function-mq3-botlib-lifecycle-runtime-setup-function-setup-state-src-mq3-botlib-lifecycle-runtime-ml-1557795449"></a>
### setup

```ml
function setup(state)
```

Update `state.maxclients`, `state.maxentities`, `state.setup` and `state.mapName` and related state during `setup`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lifecycle runtime state; accesses `maxclients`, `maxentities`, `setup`, `mapName` and `mapLoads` and related fields. May update `state.maxclients`, `state.maxentities` and `state.setup` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L101)

<a id="function-function-mq3-botlib-lifecycle-runtime-shutdown-function-shutdown-state-src-mq3-botlib-lifecycle-runtime-ml-601336231"></a>
### shutdown

```ml
function shutdown(state)
```

Set `state.setup` to `false` and `state.mapName` to `""` in `mq3.botlib.lifecycle_runtime.shutdown`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lifecycle runtime state; accesses `setup` and `mapName`. May update `state.setup` and `state.mapName` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L112)

<a id="function-function-mq3-botlib-lifecycle-runtime-startframe-function-startframe-state-time-src-mq3-botlib-lifecycle-runtime-ml-1918970480"></a>
### startFrame

```ml
function startFrame(state, time)
```

Set `state.time` to `time` and `state.frames` to `state.frames+1` in `mq3.botlib.lifecycle_runtime.startFrame`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lifecycle runtime state; accesses `setup`, `time` and `frames`. May update `state.time` and `state.frames` in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L119)

- [mq3.botlib.lifecycle_runtime.State](Type-mq3-botlib-lifecycle-runtime-state-889245960.md) — struct
<a id="function-function-mq3-botlib-lifecycle-runtime-updateentity-function-updateentity-state-entity-present-src-mq3-botlib-lifecycle-runtime-ml-1106690493"></a>
### updateEntity

```ml
function updateEntity(state, entity, present)
```

Set `state.entityUpdates` to `state.entityUpdates+1` and `state.removedEntities` to `state.removedEntities+1` in `mq3.botlib.lifecycle_runtime.updateEntity`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lifecycle runtime state; accesses `setup`, `maxentities`, `entityUpdates` and `removedEntities`. May update `state.entityUpdates` and `state.removedEntities` in place. |
| `entity` | `dynamic` | — | Value used by `updateEntity` in `if entity<0 or entity>state.maxentities then return BLERR_INVALIDENTITYNUMBER end if`. |
| `present` | `dynamic` | — | Value used by `updateEntity` in `if not present then state.removedEntities=state.removedEntities+1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L135)

<a id="function-function-mq3-botlib-lifecycle-runtime-varchanged-function-varchanged-state-name-src-mq3-botlib-lifecycle-runtime-ml-175641138"></a>
### varChanged

```ml
function varChanged(state, name)
```

Forward `varChanged` to `mq3.botlib.lib_variables.changed` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L85)

<a id="function-function-mq3-botlib-lifecycle-runtime-vardefault-function-vardefault-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-1461882287"></a>
### varDefault

```ml
function varDefault(state, name, value)
```

Forward `varDefault` to `mq3.botlib.lib_variables.variable` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L71)

<a id="function-function-mq3-botlib-lifecycle-runtime-varget-function-varget-state-name-src-mq3-botlib-lifecycle-runtime-ml-855526846"></a>
### varGet

```ml
function varGet(state, name)
```

Forward `varGet` to `mq3.botlib.lib_variables.getString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L60)

<a id="function-function-mq3-botlib-lifecycle-runtime-vargetvalue-function-vargetvalue-state-name-src-mq3-botlib-lifecycle-runtime-ml-944485354"></a>
### varGetValue

```ml
function varGetValue(state, name)
```

Forward `varGetValue` to `mq3.botlib.lib_variables.getValue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L66)

<a id="function-function-mq3-botlib-lifecycle-runtime-variableindex-function-variableindex-state-name-src-mq3-botlib-lifecycle-runtime-ml-1773160874"></a>
### variableIndex

```ml
function variableIndex(state, name)
```

Forward `variableIndex` to `mq3.botlib.lib_variables.indexOf` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L46)

<a id="function-function-mq3-botlib-lifecycle-runtime-varset-function-varset-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-446558523"></a>
### varSet

```ml
function varSet(state, name, value)
```

Apply `mq3.botlib.lib_variables.set` while evaluating `varSet`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L53)

<a id="function-function-mq3-botlib-lifecycle-runtime-varsetnotmodified-function-varsetnotmodified-state-name-src-mq3-botlib-lifecycle-runtime-ml-25094044"></a>
### varSetNotModified

```ml
function varSetNotModified(state, name)
```

Forward `varSetNotModified` to `mq3.botlib.lib_variables.setNotModified` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L89)

<a id="function-function-mq3-botlib-lifecycle-runtime-varstring-function-varstring-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-1187307455"></a>
### varString

```ml
function varString(state, name, value)
```

Forward `varString` to `mq3.botlib.lib_variables.variableString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L76)

<a id="function-function-mq3-botlib-lifecycle-runtime-varvalue-function-varvalue-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-112179903"></a>
### varValue

```ml
function varValue(state, name, value)
```

Forward `varValue` to `mq3.botlib.lib_variables.variableValue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lifecycle_runtime.ml#L81)
