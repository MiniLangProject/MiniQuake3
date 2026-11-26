# `src/mq3/botlib/aas_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_main`](Package-mq3-botlib-aas-main-1231346473.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/aas_entities.ml` as `aasEntities` → [src/mq3/botlib/aas_entities.ml](File-src-mq3-botlib-aas-entities-ml-525847367.md)
- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-aas-main-aas-continueinit-function-aas-continueinit-state-time-src-mq3-botlib-aas-main-ml-550061944"></a>
### AAS_ContinueInit

```ml
function AAS_ContinueInit(state, time)
```

Use `state.services.continueReachabilityFn` to perform `AAS_ContinueInit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `loaded`, `initialized` and `services`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L176)

<a id="function-function-mq3-botlib-aas-main-aas-error-function-aas-error-state-message-src-mq3-botlib-aas-main-ml-1091664122"></a>
### AAS_Error

```ml
function AAS_Error(state, message)
```

Record or dispatch `"fatal"` actions in `AAS_Error`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `services`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L118)

<a id="function-function-mq3-botlib-aas-main-aas-indexfrommodel-function-aas-indexfrommodel-state-modelname-src-mq3-botlib-aas-main-ml-1349556571"></a>
### AAS_IndexFromModel

```ml
function AAS_IndexFromModel(state, modelname)
```

Record or dispatch `"error"` actions in `AAS_IndexFromModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `indexesSetup` and `configstrings`. |
| `modelname` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L152)

<a id="function-function-mq3-botlib-aas-main-aas-indexfromstring-function-aas-indexfromstring-state-indexname-stringindex-numindexes-string-src-mq3-botlib-aas-main-ml-956988540"></a>
### AAS_IndexFromString

```ml
function AAS_IndexFromString(state, indexname, stringindex, numindexes, string)
```

Record or dispatch `"error"` actions in `AAS_IndexFromString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `indexesSetup`. |
| `indexname` | `dynamic` | — | Value used by `AAS_IndexFromString` in `if state==void or not state.indexesSetup then emit(state,"error",indexname+": index not setup")`. |
| `stringindex` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `numindexes` | `dynamic` | — | Value used by `AAS_IndexFromString` in `limit=numindexes`. |
| `string` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L137)

<a id="function-function-mq3-botlib-aas-main-aas-initialized-function-aas-initialized-state-src-mq3-botlib-aas-main-ml-1320945733"></a>
### AAS_Initialized

```ml
function AAS_Initialized(state)
```

Test `state!=void and state.initialized` as the condition for `AAS_Initialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L169)

<a id="function-function-mq3-botlib-aas-main-aas-loaded-function-aas-loaded-state-src-mq3-botlib-aas-main-ml-851503961"></a>
### AAS_Loaded

```ml
function AAS_Loaded(state)
```

Test `state!=void and state.loaded` as the condition for `AAS_Loaded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `loaded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L166)

<a id="function-function-mq3-botlib-aas-main-aas-loadfiles-function-aas-loadfiles-state-mapname-runtime-src-mq3-botlib-aas-main-ml-1289944340"></a>
### AAS_LoadFiles

```ml
function AAS_LoadFiles(state, mapname, runtime)
```

Update `state.mapname`, `state.filename`, `state.runtime` and `state.loaded` during `AAS_LoadFiles`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `mapname`, `filename`, `runtime`, `loaded` and `entities`. May update `state.mapname`, `state.filename` and `state.runtime` and additional fields in place. |
| `mapname` | `dynamic` | — | Value used by `AAS_LoadFiles` in `state.mapname=mapname`. |
| `runtime` | `dynamic` | — | AAS main runtime; accesses `initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L203)

<a id="function-function-mq3-botlib-aas-main-aas-loadmap-function-aas-loadmap-state-mapname-runtime-src-mq3-botlib-aas-main-ml-283858186"></a>
### AAS_LoadMap

```ml
function AAS_LoadMap(state, mapname, runtime)
```

Set `state.initialized` to `false` and `state.loaded` to `false` in `mq3.botlib.aas_main.AAS_LoadMap`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `initialized`, `services` and `loaded`. May update `state.initialized` and `state.loaded` in place. |
| `mapname` | `dynamic` | — | Value used by `AAS_LoadFiles` in `state.mapname=mapname`. |
| `runtime` | `dynamic` | — | AAS main runtime; accesses `initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L211)

<a id="function-function-mq3-botlib-aas-main-aas-modelfromindex-function-aas-modelfromindex-state-index-src-mq3-botlib-aas-main-ml-1514827861"></a>
### AAS_ModelFromIndex

```ml
function AAS_ModelFromIndex(state, index)
```

Record or dispatch `"error"` actions in `AAS_ModelFromIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `indexesSetup` and `configstrings`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L145)

<a id="function-function-mq3-botlib-aas-main-aas-projectpointontovector-function-aas-projectpointontovector-point-vstart-vend-src-mq3-botlib-aas-main-ml-802019099"></a>
### AAS_ProjectPointOntoVector

```ml
function AAS_ProjectPointOntoVector(point, vStart, vEnd)
```

Project a point onto the infinite line through the supplied endpoints, retaining the start for a zero-length line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `vStart` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `vEnd` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L196)

<a id="function-function-mq3-botlib-aas-main-aas-setinitialized-function-aas-setinitialized-state-src-mq3-botlib-aas-main-ml-1526682069"></a>
### AAS_SetInitialized

```ml
function AAS_SetInitialized(state)
```

Record or dispatch `"message"` actions in `AAS_SetInitialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `initialized`. May update `state.initialized` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L172)

<a id="function-function-mq3-botlib-aas-main-aas-setup-function-aas-setup-state-src-mq3-botlib-aas-main-ml-939129467"></a>
### AAS_Setup

```ml
function AAS_Setup(state)
```

Update `state.entities`, `state.numframes`, `state.time` and `state.initialized` and related state during `AAS_Setup`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `entities`, `maxentities`, `numframes`, `time` and `initialized` and related fields. May update `state.entities`, `state.numframes` and `state.time` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L218)

<a id="function-function-mq3-botlib-aas-main-aas-shutdown-function-aas-shutdown-state-src-mq3-botlib-aas-main-ml-1202137357"></a>
### AAS_Shutdown

```ml
function AAS_Shutdown(state)
```

Record or dispatch `"message"` actions in `AAS_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `services`, `runtime`, `entities`, `maxentities` and `loaded` and related fields. May update `state.runtime`, `state.entities` and `state.loaded` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L223)

<a id="function-function-mq3-botlib-aas-main-aas-startframe-function-aas-startframe-state-time-src-mq3-botlib-aas-main-ml-969516712"></a>
### AAS_StartFrame

```ml
function AAS_StartFrame(state, time)
```

Update `state.time`, `state.entities.time`, `state.frameroutingupdates` and `state.numframes` and related state during `AAS_StartFrame`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `time`, `entities`, `frameroutingupdates` and `numframes`. May update `state.time`, `state.entities.time` and `state.frameroutingupdates` and additional fields in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L184)

<a id="function-function-mq3-botlib-aas-main-aas-stringfromindex-function-aas-stringfromindex-state-indexname-stringindex-numindexes-index-src-mq3-botlib-aas-main-ml-112488729"></a>
### AAS_StringFromIndex

```ml
function AAS_StringFromIndex(state, indexname, stringindex, numindexes, index)
```

Record or dispatch `"error"` actions in `AAS_StringFromIndex`. Return paths include `stringindex[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `indexesSetup`. |
| `indexname` | `dynamic` | — | Value used by `AAS_StringFromIndex` in `if state==void or not state.indexesSetup then emit(state,"error",indexname+": index "+str(index)+" not setup")`. |
| `stringindex` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `numindexes` | `dynamic` | — | Value used by `AAS_StringFromIndex` in `if index<0 or index>=numindexes or index>=len(stringindex) then emit(state,"error",indexname+": index "+str(inde...`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L125)

<a id="function-function-mq3-botlib-aas-main-aas-time-function-aas-time-state-src-mq3-botlib-aas-main-ml-922919861"></a>
### AAS_Time

```ml
function AAS_Time(state)
```

Return the AAS frame time, or zero when no AAS state is available.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L191)

<a id="function-function-mq3-botlib-aas-main-aas-updatestringindexes-function-aas-updatestringindexes-state-numconfigstrings-configstrings-src-mq3-botlib-aas-main-ml-226694741"></a>
### AAS_UpdateStringIndexes

```ml
function AAS_UpdateStringIndexes(state, numconfigstrings, configstrings)
```

Set `state.configstrings[index]` to `configstrings[index]` and `state.indexesSetup` to `true` in `mq3.botlib.aas_main.AAS_UpdateStringIndexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `configstrings` and `indexesSetup`. May update `state.configstrings[index]` and `state.indexesSetup` in place. |
| `numconfigstrings` | `dynamic` | — | Value used by `AAS_UpdateStringIndexes` in `limit=numconfigstrings`. |
| `configstrings` | `dynamic` | — | Array or byte sequence accessed at `index`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L160)

<a id="constant-constant-mq3-botlib-aas-main-blerr-noaasfile-const-blerr-noaasfile-3-src-mq3-botlib-aas-main-ml-1622374066"></a>
### BLERR_NOAASFILE

```ml
const BLERR_NOAASFILE = 3
```

Bot-library error indicating that no AAS navigation map is loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L14)

<a id="constant-constant-mq3-botlib-aas-main-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-aas-main-ml-1798628865"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```

Bot-library status indicating successful completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L12)

<a id="function-function-mq3-botlib-aas-main-create-function-create-maxclients-maxentities-src-mq3-botlib-aas-main-ml-1131172611"></a>
### create

```ml
function create(maxclients, maxentities)
```

Build the `mq3.botlib.aas_main.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxclients` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_main.State.maxclients`. |
| `maxentities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_main.State.maxentities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L101)

<a id="constant-constant-mq3-botlib-aas-main-cs-models-const-cs-models-32-src-mq3-botlib-aas-main-ml-1782773368"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```

First configuration-string slot reserved for registered model names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L16)

<a id="function-function-mq3-botlib-aas-main-emit-function-emit-state-kind-text-src-mq3-botlib-aas-main-ml-747201432"></a>
### emit

```ml
function emit(state, kind, text)
```

Use `state.services.printFn` to perform `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `services`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.services.printFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L113)

<a id="function-function-mq3-botlib-aas-main-invoke-function-invoke-state-callback-src-mq3-botlib-aas-main-ml-1480696330"></a>
### invoke

```ml
function invoke(state, callback)
```

Invoke an optional AAS service with its host context, returning void when the service is unavailable.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS main state; accesses `services`. |
| `callback` | `dynamic` | — | Callback invoked by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L108)

<a id="constant-constant-mq3-botlib-aas-main-max-configstrings-const-max-configstrings-1024-src-mq3-botlib-aas-main-ml-1713099878"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Number of indexed configuration-string slots in the game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L20)

<a id="constant-constant-mq3-botlib-aas-main-max-models-const-max-models-256-src-mq3-botlib-aas-main-ml-586923814"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```

These are sent over the net as 8 bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L18)

<a id="function-function-mq3-botlib-aas-main-services-function-services-context-src-mq3-botlib-aas-main-ml-1624178551"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.aas_main.Services` record, initializing `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L97)

- [mq3.botlib.aas_main.Services](Type-mq3-botlib-aas-main-services-380357013.md) — struct
- [mq3.botlib.aas_main.State](Type-mq3-botlib-aas-main-state-188456918.md) — struct
