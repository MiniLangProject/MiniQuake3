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

Update `character.values[index]` during `applyDefaults`. Return paths include `character`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Character record; accesses `values`. May update `character.values[index]` in place. |
| `defaults` | `dynamic` | — | Defaults record; accesses `values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L135)

<a id="function-function-mq3-botlib-ai-characters-botpath-function-botpath-name-src-mq3-botlib-ai-characters-ml-1251753679"></a>
### botPath

```ml
function botPath(name)
```

Normalize a ai characters resource path by removing leading slashes and ensuring the botfiles prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L53)

- [mq3.botlib.ai_characters.Character](Type-mq3-botlib-ai-characters-character-418560778.md) — struct
<a id="function-function-mq3-botlib-ai-characters-characterat-function-characterat-state-handle-src-mq3-botlib-ai-characters-ml-1515208985"></a>
### characterAt

```ml
function characterAt(state, handle)
```

Look up a one-based bot character handle, returning void when the state or handle is invalid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L67)

<a id="function-function-mq3-botlib-ai-characters-characteristic-function-characteristic-state-handle-index-src-mq3-botlib-ai-characters-ml-1416997369"></a>
### characteristic

```ml
function characteristic(state, handle, index)
```

Apply `mq3.botlib.ai_characters.characterAt` while evaluating `characteristic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L202)

- [mq3.botlib.ai_characters.Characteristic](Type-mq3-botlib-ai-characters-characteristic-762300994.md) — struct
<a id="function-function-mq3-botlib-ai-characters-characteristicbfloat-function-characteristicbfloat-state-handle-index-minimum-maximum-src-mq3-botlib-ai-characters-ml-1190373915"></a>
### characteristicBFloat

```ml
function characteristicBFloat(state, handle, index, minimum, maximum)
```

Apply `mq3.botlib.ai_characters.characteristicFloat` while evaluating `characteristicBFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `minimum` | `dynamic` | — | Operand used to evaluate the returned expression `minimum`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L220)

<a id="function-function-mq3-botlib-ai-characters-characteristicbinteger-function-characteristicbinteger-state-handle-index-minimum-maximum-src-mq3-botlib-ai-characters-ml-1623104267"></a>
### characteristicBInteger

```ml
function characteristicBInteger(state, handle, index, minimum, maximum)
```

Apply `mq3.botlib.ai_characters.characteristicInteger` while evaluating `characteristicBInteger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `minimum` | `dynamic` | — | Operand used to evaluate the returned expression `minimum`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L237)

<a id="function-function-mq3-botlib-ai-characters-characteristicfloat-function-characteristicfloat-state-handle-index-src-mq3-botlib-ai-characters-ml-1725003463"></a>
### characteristicFloat

```ml
function characteristicFloat(state, handle, index)
```

Apply `mq3.botlib.ai_characters.characteristic` while evaluating `characteristicFloat`. Return paths include `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L210)

<a id="function-function-mq3-botlib-ai-characters-characteristicinteger-function-characteristicinteger-state-handle-index-src-mq3-botlib-ai-characters-ml-567537639"></a>
### characteristicInteger

```ml
function characteristicInteger(state, handle, index)
```

Apply `mq3.botlib.ai_characters.characteristic` while evaluating `characteristicInteger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L227)

<a id="function-function-mq3-botlib-ai-characters-characteristicstring-function-characteristicstring-state-handle-index-src-mq3-botlib-ai-characters-ml-1744199693"></a>
### characteristicString

```ml
function characteristicString(state, handle, index)
```

Apply `mq3.botlib.ai_characters.characteristic` while evaluating `characteristicString`. Return paths include `value.stringValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L244)

<a id="function-function-mq3-botlib-ai-characters-create-function-create-maxclients-context-readfn-src-mq3-botlib-ai-characters-ml-594838103"></a>
### create

```ml
function create(maxClients, context, readFn)
```

Build the `mq3.botlib.ai_characters.State` result for `create`. Return paths include `State(maxClients,array(maxClients+1,void),context,readFn,false,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_characters.State.maxClients`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L47)

<a id="constant-constant-mq3-botlib-ai-characters-ct-float-const-ct-float-2-src-mq3-botlib-ai-characters-ml-630287919"></a>
### CT_FLOAT

```ml
const CT_FLOAT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L13)

<a id="constant-constant-mq3-botlib-ai-characters-ct-integer-const-ct-integer-1-src-mq3-botlib-ai-characters-ml-1999964514"></a>
### CT_INTEGER

```ml
const CT_INTEGER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L12)

<a id="constant-constant-mq3-botlib-ai-characters-ct-none-const-ct-none-0-src-mq3-botlib-ai-characters-ml-854836939"></a>
### CT_NONE

```ml
const CT_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L11)

<a id="constant-constant-mq3-botlib-ai-characters-ct-string-const-ct-string-3-src-mq3-botlib-ai-characters-ml-415817490"></a>
### CT_STRING

```ml
const CT_STRING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L14)

<a id="constant-constant-mq3-botlib-ai-characters-default-character-const-default-character-bots-default-c-c-src-mq3-botlib-ai-characters-ml-2049530438"></a>
### DEFAULT_CHARACTER

```ml
const DEFAULT_CHARACTER = "bots/default_c.c"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L15)

<a id="function-function-mq3-botlib-ai-characters-emptycharacteristic-function-emptycharacteristic-src-mq3-botlib-ai-characters-ml-15512530"></a>
### emptyCharacteristic

```ml
function emptyCharacteristic()
```

Create a `mq3.botlib.ai_characters.Characteristic` record, initializing `type` as `CT_NONE`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L40)

<a id="function-function-mq3-botlib-ai-characters-emptyvalues-function-emptyvalues-src-mq3-botlib-ai-characters-ml-218559576"></a>
### emptyValues

```ml
function emptyValues()
```

Apply `mq3.botlib.ai_characters.emptyCharacteristic` while evaluating `emptyValues`. Return paths include `values`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L42)

<a id="function-function-mq3-botlib-ai-characters-fail-function-fail-message-src-mq3-botlib-ai-characters-ml-1249746645"></a>
### fail

```ml
function fail(message)
```

Construct error `7550` with diagnostic text `"AI character: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L38)

<a id="function-function-mq3-botlib-ai-characters-findcached-function-findcached-state-filename-skill-src-mq3-botlib-ai-characters-ml-1045860609"></a>
### findCached

```ml
function findCached(state, filename, skill)
```

Find a cached character by filename and skill tolerance, accepting any cached skill when the requested skill is negative.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `filename` | `dynamic` | — | Lookup text matched against `value.filename`. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L90)

<a id="function-function-mq3-botlib-ai-characters-freecharacter-function-freecharacter-state-handle-src-mq3-botlib-ai-characters-ml-1375664903"></a>
### freeCharacter

```ml
function freeCharacter(state, handle)
```

Apply `mq3.botlib.ai_characters.freeHandle` while evaluating `freeCharacter`. Return paths include `freeHandle(state,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `reloadCharacters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L75)

<a id="function-function-mq3-botlib-ai-characters-freehandle-function-freehandle-state-handle-src-mq3-botlib-ai-characters-ml-856407809"></a>
### freeHandle

```ml
function freeHandle(state, handle)
```

Set `state.characters[handle]` to `void` in `mq3.botlib.ai_characters.freeHandle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `characters`. May update `state.characters[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L71)

<a id="function-function-mq3-botlib-ai-characters-freeslot-function-freeslot-state-src-mq3-botlib-ai-characters-ml-232889515"></a>
### freeSlot

```ml
function freeSlot(state)
```

Find the first unused one-based character slot, returning zero when the table is full.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L85)

<a id="function-function-mq3-botlib-ai-characters-interpolate-function-interpolate-state-firsthandle-secondhandle-desiredskill-src-mq3-botlib-ai-characters-ml-106638342"></a>
### interpolate

```ml
function interpolate(state, firstHandle, secondHandle, desiredSkill)
```

Set `state.characters[slot]` to `result` in `mq3.botlib.ai_characters.interpolate`. Return paths include `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `characters`. May update `state.characters[slot]` in place. |
| `firstHandle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `secondHandle` | `dynamic` | — | Handle identifying the allocated bot character. |
| `desiredSkill` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L172)

<a id="function-function-mq3-botlib-ai-characters-loadcached-function-loadcached-state-filename-skill-reload-src-mq3-botlib-ai-characters-ml-470981906"></a>
### loadCached

```ml
function loadCached(state, filename, skill, reload)
```

Set `state.characters[slot]` to `parsed.character` in `mq3.botlib.ai_characters.loadCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `characters`. May update `state.characters[slot]` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |
| `reload` | `dynamic` | — | Value used by `loadCached` in `if not reload then handle=findCached(state,filename,skill)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L146)

<a id="function-function-mq3-botlib-ai-characters-loadcharacter-function-loadcharacter-state-filename-skill-src-mq3-botlib-ai-characters-ml-339382127"></a>
### loadCharacter

```ml
function loadCharacter(state, filename, skill)
```

Apply `mq3.botlib.ai_characters.loadCharacterSkill`, `mq3.botlib.ai_characters.findCached` and `mq3.botlib.ai_characters.interpolate` while evaluating `loadCharacter`. Return paths include `interpolate(state,first,second,skill)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `readFn`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L187)

<a id="function-function-mq3-botlib-ai-characters-loadcharacterskill-function-loadcharacterskill-state-filename-skill-src-mq3-botlib-ai-characters-ml-625601933"></a>
### loadCharacterSkill

```ml
function loadCharacterSkill(state, filename, skill)
```

Apply `mq3.botlib.ai_characters.loadCached` and `mq3.botlib.ai_characters.applyDefaults` while evaluating `loadCharacterSkill`. Return paths include `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `reloadCharacters` and `characters`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L163)

- [mq3.botlib.ai_characters.Loader](Type-mq3-botlib-ai-characters-loader-1255715784.md) — struct
<a id="function-function-mq3-botlib-ai-characters-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-characters-ml-598017954"></a>
### loadText

```ml
function loadText(loader, name)
```

Use `loader.readFn` to perform `loadText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — | Loader record; accesses `readFn` and `context`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L60)

<a id="constant-constant-mq3-botlib-ai-characters-max-characteristics-const-max-characteristics-80-src-mq3-botlib-ai-characters-ml-1318302197"></a>
### MAX_CHARACTERISTICS

```ml
const MAX_CHARACTERISTICS = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L10)

<a id="function-function-mq3-botlib-ai-characters-numbertoken-function-numbertoken-token-label-src-mq3-botlib-ai-characters-ml-450946757"></a>
### numberToken

```ml
function numberToken(token, label)
```

Require a numeric preprocessor token and report a labeled parse error for any other value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Parsed token; accesses `type`. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L96)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-bfloat-const-op-characteristic-bfloat-503-src-mq3-botlib-ai-characters-ml-624974547"></a>
### OP_CHARACTERISTIC_BFLOAT

```ml
const OP_CHARACTERISTIC_BFLOAT = 503
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L20)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-binteger-const-op-characteristic-binteger-505-src-mq3-botlib-ai-characters-ml-1162021765"></a>
### OP_CHARACTERISTIC_BINTEGER

```ml
const OP_CHARACTERISTIC_BINTEGER = 505
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L22)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-float-const-op-characteristic-float-502-src-mq3-botlib-ai-characters-ml-2138145746"></a>
### OP_CHARACTERISTIC_FLOAT

```ml
const OP_CHARACTERISTIC_FLOAT = 502
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L19)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-integer-const-op-characteristic-integer-504-src-mq3-botlib-ai-characters-ml-1845346452"></a>
### OP_CHARACTERISTIC_INTEGER

```ml
const OP_CHARACTERISTIC_INTEGER = 504
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L21)

<a id="constant-constant-mq3-botlib-ai-characters-op-characteristic-string-const-op-characteristic-string-506-src-mq3-botlib-ai-characters-ml-617368546"></a>
### OP_CHARACTERISTIC_STRING

```ml
const OP_CHARACTERISTIC_STRING = 506
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L23)

<a id="constant-constant-mq3-botlib-ai-characters-op-free-character-const-op-free-character-501-src-mq3-botlib-ai-characters-ml-1547326839"></a>
### OP_FREE_CHARACTER

```ml
const OP_FREE_CHARACTER = 501
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L18)

<a id="constant-constant-mq3-botlib-ai-characters-op-load-character-const-op-load-character-500-src-mq3-botlib-ai-characters-ml-1648560528"></a>
### OP_LOAD_CHARACTER

```ml
const OP_LOAD_CHARACTER = 500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L17)

<a id="function-function-mq3-botlib-ai-characters-parsecharacter-function-parsecharacter-state-filename-wantedskill-src-mq3-botlib-ai-characters-ml-1185386746"></a>
### parseCharacter

```ml
function parseCharacter(state, filename, wantedSkill)
```

Set `state.fileReads` to `state.fileReads+1` in `mq3.botlib.ai_characters.parseCharacter`. Return paths include `fail("invalid characteristic value "+value.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `context`, `readFn` and `fileReads`. May update `state.fileReads` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `wantedSkill` | `dynamic` | — | Value used by `parseCharacter` in `if wantedSkill>=0 and skillToken.intValue!=wantedSkill then skipped=skipBlock(registry,source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L107)

- [mq3.botlib.ai_characters.Parsed](Type-mq3-botlib-ai-characters-parsed-1456683806.md) — struct
<a id="function-function-mq3-botlib-ai-characters-setreloadcharacters-function-setreloadcharacters-state-value-src-mq3-botlib-ai-characters-ml-340714902"></a>
### setReloadCharacters

```ml
function setReloadCharacters(state, value)
```

Set `state.reloadCharacters` to `value!=0` in `mq3.botlib.ai_characters.setReloadCharacters`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `reloadCharacters`. May update `state.reloadCharacters` in place. |
| `value` | `dynamic` | — | Value used by `setReloadCharacters` in `if state!=void then state.reloadCharacters=value!=0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L82)

<a id="function-function-mq3-botlib-ai-characters-shutdown-function-shutdown-state-src-mq3-botlib-ai-characters-ml-762111347"></a>
### shutdown

```ml
function shutdown(state)
```

Set `state.characters[handle]` to `void` in `mq3.botlib.ai_characters.shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. May update `state.characters[handle]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L78)

<a id="function-function-mq3-botlib-ai-characters-skipblock-function-skipblock-registry-source-src-mq3-botlib-ai-characters-ml-841308160"></a>
### skipBlock

```ml
function skipBlock(registry, source)
```

Apply `mq3.vm.pc_parser.read` while evaluating `skipBlock`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L100)

- [mq3.botlib.ai_characters.State](Type-mq3-botlib-ai-characters-state-1967703916.md) — struct
