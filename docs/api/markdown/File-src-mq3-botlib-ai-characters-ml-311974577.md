# `src/mq3/botlib/ai_characters.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_characters`](Package-mq3-botlib-ai-characters-1514604263.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-characters-applydefaults-function-applydefaults-character-defaults-src-mq3-botlib-ai-characters-ml-1423527071"></a>
### applyDefaults

```ml
function applyDefaults(character, defaults)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |
| `defaults` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L84)

<a id="function-function-mq3-botlib-ai-characters-botpath-function-botpath-name-src-mq3-botlib-ai-characters-ml-1251753679"></a>
### botPath

```ml
function botPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L38)

- [mq3.botlib.ai_characters.Character](Type-mq3-botlib-ai-characters-character-418560778.md) — struct
<a id="function-function-mq3-botlib-ai-characters-characterat-function-characterat-state-handle-src-mq3-botlib-ai-characters-ml-1515208985"></a>
### characterAt

```ml
function characterAt(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L46)

<a id="function-function-mq3-botlib-ai-characters-characteristic-function-characteristic-state-handle-index-src-mq3-botlib-ai-characters-ml-1416997369"></a>
### characteristic

```ml
function characteristic(state, handle, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L129)

- [mq3.botlib.ai_characters.Characteristic](Type-mq3-botlib-ai-characters-characteristic-762300994.md) — struct
<a id="function-function-mq3-botlib-ai-characters-characteristicbfloat-function-characteristicbfloat-state-handle-index-minimum-maximum-src-mq3-botlib-ai-characters-ml-1190373915"></a>
### characteristicBFloat

```ml
function characteristicBFloat(state, handle, index, minimum, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L137)

<a id="function-function-mq3-botlib-ai-characters-characteristicbinteger-function-characteristicbinteger-state-handle-index-minimum-maximum-src-mq3-botlib-ai-characters-ml-1623104267"></a>
### characteristicBInteger

```ml
function characteristicBInteger(state, handle, index, minimum, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L144)

<a id="function-function-mq3-botlib-ai-characters-characteristicfloat-function-characteristicfloat-state-handle-index-src-mq3-botlib-ai-characters-ml-1725003463"></a>
### characteristicFloat

```ml
function characteristicFloat(state, handle, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L133)

<a id="function-function-mq3-botlib-ai-characters-characteristicinteger-function-characteristicinteger-state-handle-index-src-mq3-botlib-ai-characters-ml-567537639"></a>
### characteristicInteger

```ml
function characteristicInteger(state, handle, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L140)

<a id="function-function-mq3-botlib-ai-characters-characteristicstring-function-characteristicstring-state-handle-index-src-mq3-botlib-ai-characters-ml-1744199693"></a>
### characteristicString

```ml
function characteristicString(state, handle, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L147)

<a id="function-function-mq3-botlib-ai-characters-create-function-create-maxclients-context-readfn-src-mq3-botlib-ai-characters-ml-594838103"></a>
### create

```ml
function create(maxClients, context, readFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L34)

<a id="constant-constant-mq3-botlib-ai-characters-ct-float-const-ct-float-2-src-mq3-botlib-ai-characters-ml-630287919"></a>
### CT_FLOAT

```ml
const CT_FLOAT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L13)

<a id="constant-constant-mq3-botlib-ai-characters-ct-integer-const-ct-integer-1-src-mq3-botlib-ai-characters-ml-1999964514"></a>
### CT_INTEGER

```ml
const CT_INTEGER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L12)

<a id="constant-constant-mq3-botlib-ai-characters-ct-none-const-ct-none-0-src-mq3-botlib-ai-characters-ml-854836939"></a>
### CT_NONE

```ml
const CT_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L11)

<a id="constant-constant-mq3-botlib-ai-characters-ct-string-const-ct-string-3-src-mq3-botlib-ai-characters-ml-415817490"></a>
### CT_STRING

```ml
const CT_STRING = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L14)

<a id="constant-constant-mq3-botlib-ai-characters-default-character-const-default-character-bots-default-c-c-src-mq3-botlib-ai-characters-ml-2049530438"></a>
### DEFAULT_CHARACTER

```ml
const DEFAULT_CHARACTER = "bots/default_c.c"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L15)

<a id="function-function-mq3-botlib-ai-characters-emptycharacteristic-function-emptycharacteristic-src-mq3-botlib-ai-characters-ml-15512530"></a>
### emptyCharacteristic

```ml
function emptyCharacteristic()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L32)

<a id="function-function-mq3-botlib-ai-characters-emptyvalues-function-emptyvalues-src-mq3-botlib-ai-characters-ml-218559576"></a>
### emptyValues

```ml
function emptyValues()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L33)

<a id="function-function-mq3-botlib-ai-characters-fail-function-fail-message-src-mq3-botlib-ai-characters-ml-1249746645"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L31)

<a id="function-function-mq3-botlib-ai-characters-findcached-function-findcached-state-filename-skill-src-mq3-botlib-ai-characters-ml-1045860609"></a>
### findCached

```ml
function findCached(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L52)

<a id="function-function-mq3-botlib-ai-characters-freecharacter-function-freecharacter-state-handle-src-mq3-botlib-ai-characters-ml-1375664903"></a>
### freeCharacter

```ml
function freeCharacter(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L48)

<a id="function-function-mq3-botlib-ai-characters-freehandle-function-freehandle-state-handle-src-mq3-botlib-ai-characters-ml-856407809"></a>
### freeHandle

```ml
function freeHandle(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L47)

<a id="function-function-mq3-botlib-ai-characters-freeslot-function-freeslot-state-src-mq3-botlib-ai-characters-ml-232889515"></a>
### freeSlot

```ml
function freeSlot(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L51)

<a id="function-function-mq3-botlib-ai-characters-interpolate-function-interpolate-state-firsthandle-secondhandle-desiredskill-src-mq3-botlib-ai-characters-ml-106638342"></a>
### interpolate

```ml
function interpolate(state, firstHandle, secondHandle, desiredSkill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `firstHandle` | `dynamic` | — |  |
| `secondHandle` | `dynamic` | — |  |
| `desiredSkill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L107)

<a id="function-function-mq3-botlib-ai-characters-loadcached-function-loadcached-state-filename-skill-reload-src-mq3-botlib-ai-characters-ml-470981906"></a>
### loadCached

```ml
function loadCached(state, filename, skill, reload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |
| `reload` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L90)

<a id="function-function-mq3-botlib-ai-characters-loadcharacter-function-loadcharacter-state-filename-skill-src-mq3-botlib-ai-characters-ml-339382127"></a>
### loadCharacter

```ml
function loadCharacter(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L118)

<a id="function-function-mq3-botlib-ai-characters-loadcharacterskill-function-loadcharacterskill-state-filename-skill-src-mq3-botlib-ai-characters-ml-625601933"></a>
### loadCharacterSkill

```ml
function loadCharacterSkill(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L103)

- [mq3.botlib.ai_characters.Loader](Type-mq3-botlib-ai-characters-loader-1255715784.md) — struct
<a id="function-function-mq3-botlib-ai-characters-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-characters-ml-598017954"></a>
### loadText

```ml
function loadText(loader, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L42)

<a id="constant-constant-mq3-botlib-ai-characters-max-characteristics-const-max-characteristics-80-src-mq3-botlib-ai-characters-ml-1318302197"></a>
### MAX_CHARACTERISTICS

```ml
const MAX_CHARACTERISTICS = 80
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L10)

<a id="function-function-mq3-botlib-ai-characters-numbertoken-function-numbertoken-token-label-src-mq3-botlib-ai-characters-ml-450946757"></a>
### numberToken

```ml
function numberToken(token, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L55)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-bfloat-const-op-characteristic-bfloat-503-src-mq3-botlib-ai-characters-ml-624974547"></a>
### OP_CHARACTERISTIC_BFLOAT

```ml
const OP_CHARACTERISTIC_BFLOAT = 503
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L20)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-binteger-const-op-characteristic-binteger-505-src-mq3-botlib-ai-characters-ml-1162021765"></a>
### OP_CHARACTERISTIC_BINTEGER

```ml
const OP_CHARACTERISTIC_BINTEGER = 505
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L22)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-float-const-op-characteristic-float-502-src-mq3-botlib-ai-characters-ml-2138145746"></a>
### OP_CHARACTERISTIC_FLOAT

```ml
const OP_CHARACTERISTIC_FLOAT = 502
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L19)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-integer-const-op-characteristic-integer-504-src-mq3-botlib-ai-characters-ml-1845346452"></a>
### OP_CHARACTERISTIC_INTEGER

```ml
const OP_CHARACTERISTIC_INTEGER = 504
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L21)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-string-const-op-characteristic-string-506-src-mq3-botlib-ai-characters-ml-617368546"></a>
### OP_CHARACTERISTIC_STRING

```ml
const OP_CHARACTERISTIC_STRING = 506
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L23)

<a id="constant-constant-mq3-botlib-ai-characters-op-free-character-const-op-free-character-501-src-mq3-botlib-ai-characters-ml-1547326839"></a>
### OP_FREE_CHARACTER

```ml
const OP_FREE_CHARACTER = 501
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L18)

<a id="constant-constant-mq3-botlib-ai-characters-op-load-character-const-op-load-character-500-src-mq3-botlib-ai-characters-ml-1648560528"></a>
### OP_LOAD_CHARACTER

```ml
const OP_LOAD_CHARACTER = 500
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L17)

<a id="function-function-mq3-botlib-ai-characters-parsecharacter-function-parsecharacter-state-filename-wantedskill-src-mq3-botlib-ai-characters-ml-1185386746"></a>
### parseCharacter

```ml
function parseCharacter(state, filename, wantedSkill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `wantedSkill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L59)

- [mq3.botlib.ai_characters.Parsed](Type-mq3-botlib-ai-characters-parsed-1456683806.md) — struct
<a id="function-function-mq3-botlib-ai-characters-setreloadcharacters-function-setreloadcharacters-state-value-src-mq3-botlib-ai-characters-ml-340714902"></a>
### setReloadCharacters

```ml
function setReloadCharacters(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L50)

<a id="function-function-mq3-botlib-ai-characters-shutdown-function-shutdown-state-src-mq3-botlib-ai-characters-ml-762111347"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L49)

<a id="function-function-mq3-botlib-ai-characters-skipblock-function-skipblock-registry-source-src-mq3-botlib-ai-characters-ml-841308160"></a>
### skipBlock

```ml
function skipBlock(registry, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L56)

- [mq3.botlib.ai_characters.State](Type-mq3-botlib-ai-characters-state-1967703916.md) — struct
