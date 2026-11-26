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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L55)

<a id="function-function-mq3-botlib-aas-main-aas-error-function-aas-error-state-message-src-mq3-botlib-aas-main-ml-1091664122"></a>
### AAS_Error

```ml
function AAS_Error(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L28)

<a id="function-function-mq3-botlib-aas-main-aas-indexfrommodel-function-aas-indexfrommodel-state-modelname-src-mq3-botlib-aas-main-ml-1349556571"></a>
### AAS_IndexFromModel

```ml
function AAS_IndexFromModel(state, modelname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `modelname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L44)

<a id="function-function-mq3-botlib-aas-main-aas-indexfromstring-function-aas-indexfromstring-state-indexname-stringindex-numindexes-string-src-mq3-botlib-aas-main-ml-956988540"></a>
### AAS_IndexFromString

```ml
function AAS_IndexFromString(state, indexname, stringindex, numindexes, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `indexname` | `dynamic` | — |  |
| `stringindex` | `dynamic` | — |  |
| `numindexes` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L35)

<a id="function-function-mq3-botlib-aas-main-aas-initialized-function-aas-initialized-state-src-mq3-botlib-aas-main-ml-1320945733"></a>
### AAS_Initialized

```ml
function AAS_Initialized(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L53)

<a id="function-function-mq3-botlib-aas-main-aas-loaded-function-aas-loaded-state-src-mq3-botlib-aas-main-ml-851503961"></a>
### AAS_Loaded

```ml
function AAS_Loaded(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L52)

<a id="function-function-mq3-botlib-aas-main-aas-loadfiles-function-aas-loadfiles-state-mapname-runtime-src-mq3-botlib-aas-main-ml-1289944340"></a>
### AAS_LoadFiles

```ml
function AAS_LoadFiles(state, mapname, runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L69)

<a id="function-function-mq3-botlib-aas-main-aas-loadmap-function-aas-loadmap-state-mapname-runtime-src-mq3-botlib-aas-main-ml-283858186"></a>
### AAS_LoadMap

```ml
function AAS_LoadMap(state, mapname, runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L73)

<a id="function-function-mq3-botlib-aas-main-aas-modelfromindex-function-aas-modelfromindex-state-index-src-mq3-botlib-aas-main-ml-1514827861"></a>
### AAS_ModelFromIndex

```ml
function AAS_ModelFromIndex(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L40)

<a id="function-function-mq3-botlib-aas-main-aas-projectpointontovector-function-aas-projectpointontovector-point-vstart-vend-src-mq3-botlib-aas-main-ml-802019099"></a>
### AAS_ProjectPointOntoVector

```ml
function AAS_ProjectPointOntoVector(point, vStart, vEnd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `vStart` | `dynamic` | — |  |
| `vEnd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L66)

<a id="function-function-mq3-botlib-aas-main-aas-setinitialized-function-aas-setinitialized-state-src-mq3-botlib-aas-main-ml-1526682069"></a>
### AAS_SetInitialized

```ml
function AAS_SetInitialized(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L54)

<a id="function-function-mq3-botlib-aas-main-aas-setup-function-aas-setup-state-src-mq3-botlib-aas-main-ml-939129467"></a>
### AAS_Setup

```ml
function AAS_Setup(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L78)

<a id="function-function-mq3-botlib-aas-main-aas-shutdown-function-aas-shutdown-state-src-mq3-botlib-aas-main-ml-1202137357"></a>
### AAS_Shutdown

```ml
function AAS_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L81)

<a id="function-function-mq3-botlib-aas-main-aas-startframe-function-aas-startframe-state-time-src-mq3-botlib-aas-main-ml-969516712"></a>
### AAS_StartFrame

```ml
function AAS_StartFrame(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L60)

<a id="function-function-mq3-botlib-aas-main-aas-stringfromindex-function-aas-stringfromindex-state-indexname-stringindex-numindexes-index-src-mq3-botlib-aas-main-ml-112488729"></a>
### AAS_StringFromIndex

```ml
function AAS_StringFromIndex(state, indexname, stringindex, numindexes, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `indexname` | `dynamic` | — |  |
| `stringindex` | `dynamic` | — |  |
| `numindexes` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L29)

<a id="function-function-mq3-botlib-aas-main-aas-time-function-aas-time-state-src-mq3-botlib-aas-main-ml-922919861"></a>
### AAS_Time

```ml
function AAS_Time(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L65)

<a id="function-function-mq3-botlib-aas-main-aas-updatestringindexes-function-aas-updatestringindexes-state-numconfigstrings-configstrings-src-mq3-botlib-aas-main-ml-226694741"></a>
### AAS_UpdateStringIndexes

```ml
function AAS_UpdateStringIndexes(state, numconfigstrings, configstrings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `numconfigstrings` | `dynamic` | — |  |
| `configstrings` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L48)

<a id="constant-constant-mq3-botlib-aas-main-blerr-noaasfile-const-blerr-noaasfile-3-src-mq3-botlib-aas-main-ml-1622374066"></a>
### BLERR_NOAASFILE

```ml
const BLERR_NOAASFILE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L12)

<a id="constant-constant-mq3-botlib-aas-main-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-aas-main-ml-1798628865"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L11)

<a id="function-function-mq3-botlib-aas-main-create-function-create-maxclients-maxentities-src-mq3-botlib-aas-main-ml-1131172611"></a>
### create

```ml
function create(maxclients, maxentities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxclients` | `dynamic` | — |  |
| `maxentities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L21)

<a id="constant-constant-mq3-botlib-aas-main-cs-models-const-cs-models-32-src-mq3-botlib-aas-main-ml-1782773368"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L13)

<a id="function-function-mq3-botlib-aas-main-emit-function-emit-state-kind-text-src-mq3-botlib-aas-main-ml-747201432"></a>
### emit

```ml
function emit(state, kind, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L26)

<a id="function-function-mq3-botlib-aas-main-invoke-function-invoke-state-callback-src-mq3-botlib-aas-main-ml-1480696330"></a>
### invoke

```ml
function invoke(state, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L25)

<a id="constant-constant-mq3-botlib-aas-main-max-configstrings-const-max-configstrings-1024-src-mq3-botlib-aas-main-ml-1713099878"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L15)

<a id="constant-constant-mq3-botlib-aas-main-max-models-const-max-models-256-src-mq3-botlib-aas-main-ml-586923814"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L14)

<a id="function-function-mq3-botlib-aas-main-services-function-services-context-src-mq3-botlib-aas-main-ml-1624178551"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L20)

- [mq3.botlib.aas_main.Services](Type-mq3-botlib-aas-main-services-380357013.md) — struct
- [mq3.botlib.aas_main.State](Type-mq3-botlib-aas-main-state-188456918.md) — struct
