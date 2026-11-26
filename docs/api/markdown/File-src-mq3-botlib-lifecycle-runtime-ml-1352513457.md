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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L10)

<a id="constant-constant-mq3-botlib-lifecycle-runtime-blerr-librarynotsetup-const-blerr-librarynotsetup-1-src-mq3-botlib-lifecycle-runtime-ml-1004667460"></a>
### BLERR_LIBRARYNOTSETUP

```ml
const BLERR_LIBRARYNOTSETUP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L9)

<a id="constant-constant-mq3-botlib-lifecycle-runtime-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-lifecycle-runtime-ml-1303065883"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L8)

<a id="function-function-mq3-botlib-lifecycle-runtime-create-function-create-src-mq3-botlib-lifecycle-runtime-ml-870927670"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L14)

<a id="function-function-mq3-botlib-lifecycle-runtime-integervariable-function-integervariable-state-name-fallback-src-mq3-botlib-lifecycle-runtime-ml-2037091256"></a>
### integerVariable

```ml
function integerVariable(state, name, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L31)

<a id="function-function-mq3-botlib-lifecycle-runtime-loadmap-function-loadmap-state-mapname-src-mq3-botlib-lifecycle-runtime-ml-587696076"></a>
### loadMap

```ml
function loadMap(state, mapName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L53)

<a id="function-function-mq3-botlib-lifecycle-runtime-setup-function-setup-state-src-mq3-botlib-lifecycle-runtime-ml-1557795449"></a>
### setup

```ml
function setup(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L36)

<a id="function-function-mq3-botlib-lifecycle-runtime-shutdown-function-shutdown-state-src-mq3-botlib-lifecycle-runtime-ml-601336231"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L45)

<a id="function-function-mq3-botlib-lifecycle-runtime-startframe-function-startframe-state-time-src-mq3-botlib-lifecycle-runtime-ml-1918970480"></a>
### startFrame

```ml
function startFrame(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L49)

- [mq3.botlib.lifecycle_runtime.State](Type-mq3-botlib-lifecycle-runtime-state-889245960.md) — struct
<a id="function-function-mq3-botlib-lifecycle-runtime-updateentity-function-updateentity-state-entity-present-src-mq3-botlib-lifecycle-runtime-ml-1106690493"></a>
### updateEntity

```ml
function updateEntity(state, entity, present)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `present` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L58)

<a id="function-function-mq3-botlib-lifecycle-runtime-varchanged-function-varchanged-state-name-src-mq3-botlib-lifecycle-runtime-ml-175641138"></a>
### varChanged

```ml
function varChanged(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L29)

<a id="function-function-mq3-botlib-lifecycle-runtime-vardefault-function-vardefault-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-1461882287"></a>
### varDefault

```ml
function varDefault(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L26)

<a id="function-function-mq3-botlib-lifecycle-runtime-varget-function-varget-state-name-src-mq3-botlib-lifecycle-runtime-ml-855526846"></a>
### varGet

```ml
function varGet(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L22)

<a id="function-function-mq3-botlib-lifecycle-runtime-vargetvalue-function-vargetvalue-state-name-src-mq3-botlib-lifecycle-runtime-ml-944485354"></a>
### varGetValue

```ml
function varGetValue(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L25)

<a id="function-function-mq3-botlib-lifecycle-runtime-variableindex-function-variableindex-state-name-src-mq3-botlib-lifecycle-runtime-ml-1773160874"></a>
### variableIndex

```ml
function variableIndex(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L15)

<a id="function-function-mq3-botlib-lifecycle-runtime-varset-function-varset-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-446558523"></a>
### varSet

```ml
function varSet(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L18)

<a id="function-function-mq3-botlib-lifecycle-runtime-varsetnotmodified-function-varsetnotmodified-state-name-src-mq3-botlib-lifecycle-runtime-ml-25094044"></a>
### varSetNotModified

```ml
function varSetNotModified(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L30)

<a id="function-function-mq3-botlib-lifecycle-runtime-varstring-function-varstring-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-1187307455"></a>
### varString

```ml
function varString(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L27)

<a id="function-function-mq3-botlib-lifecycle-runtime-varvalue-function-varvalue-state-name-value-src-mq3-botlib-lifecycle-runtime-ml-112179903"></a>
### varValue

```ml
function varValue(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L28)
