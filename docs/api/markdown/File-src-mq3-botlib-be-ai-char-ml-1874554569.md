# `src/mq3/botlib/be_ai_char.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_ai_char`](Package-mq3-botlib-be-ai-char-2134554065.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_characters.ml` as `impl` → [src/mq3/botlib/ai_characters.ml](File-src-mq3-botlib-ai-characters-ml-311974577.md)

## Declarations

<a id="function-function-mq3-botlib-be-ai-char-botcharacterfromhandle-function-botcharacterfromhandle-state-handle-src-mq3-botlib-be-ai-char-ml-903445263"></a>
### BotCharacterFromHandle

```ml
function BotCharacterFromHandle(state, handle)
```

Forward `BotCharacterFromHandle` to `mq3.botlib.ai_characters.characterAt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L11)

<a id="function-function-mq3-botlib-be-ai-char-botdefaultcharacteristics-function-botdefaultcharacteristics-character-defaults-src-mq3-botlib-be-ai-char-ml-2041171653"></a>
### BotDefaultCharacteristics

```ml
function BotDefaultCharacteristics(character, defaults)
```

Forward `BotDefaultCharacteristics` to `mq3.botlib.ai_characters.applyDefaults` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Character record; accesses `values`. May update `character.values[index]` in place. |
| `defaults` | `dynamic` | — | Defaults record; accesses `values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L43)

<a id="function-function-mq3-botlib-be-ai-char-botdumpcharacter-function-botdumpcharacter-character-src-mq3-botlib-be-ai-char-ml-580550675"></a>
### BotDumpCharacter

```ml
function BotDumpCharacter(character)
```

Serialize the loaded character filename, skill and typed characteristics into readable bot-character text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Character record; accesses `filename`, `skill` and `values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L14)

<a id="function-function-mq3-botlib-be-ai-char-botfindcachedcharacter-function-botfindcachedcharacter-state-filename-skill-src-mq3-botlib-be-ai-char-ml-1607811827"></a>
### BotFindCachedCharacter

```ml
function BotFindCachedCharacter(state, filename, skill)
```

Forward `BotFindCachedCharacter` to `mq3.botlib.ai_characters.findCached` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L55)

<a id="function-function-mq3-botlib-be-ai-char-botfreecharacter-function-botfreecharacter-state-handle-src-mq3-botlib-be-ai-char-ml-1739676575"></a>
### BotFreeCharacter

```ml
function BotFreeCharacter(state, handle)
```

Forward `BotFreeCharacter` to `mq3.botlib.ai_characters.freeCharacter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `reloadCharacters`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L39)

<a id="function-function-mq3-botlib-be-ai-char-botfreecharacter2-function-botfreecharacter2-state-handle-src-mq3-botlib-be-ai-char-ml-1312173079"></a>
### BotFreeCharacter2

```ml
function BotFreeCharacter2(state, handle)
```

Forward `BotFreeCharacter2` to `mq3.botlib.ai_characters.freeHandle` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `characters`. May update `state.characters[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot character. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L35)

<a id="function-function-mq3-botlib-be-ai-char-botfreecharacterstrings-function-botfreecharacterstrings-character-src-mq3-botlib-be-ai-char-ml-331075107"></a>
### BotFreeCharacterStrings

```ml
function BotFreeCharacterStrings(character)
```

Set `character.values[index].stringValue` to `""` in `mq3.botlib.be_ai_char.BotFreeCharacterStrings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Character record; accesses `values`. May update `character.values[index].stringValue` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L27)

<a id="function-function-mq3-botlib-be-ai-char-botinterpolatecharacters-function-botinterpolatecharacters-state-handle1-handle2-desiredskill-src-mq3-botlib-be-ai-char-ml-894434117"></a>
### BotInterpolateCharacters

```ml
function BotInterpolateCharacters(state, handle1, handle2, desiredSkill)
```

Forward `BotInterpolateCharacters` to `mq3.botlib.ai_characters.interpolate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `characters`. May update `state.characters[slot]` in place. |
| `handle1` | `dynamic` | — | Handle identifying the allocated bot character. |
| `handle2` | `dynamic` | — | Handle identifying the allocated bot character. |
| `desiredSkill` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L72)

<a id="function-function-mq3-botlib-be-ai-char-botloadcachedcharacter-function-botloadcachedcharacter-state-filename-skill-reload-src-mq3-botlib-be-ai-char-ml-788780898"></a>
### BotLoadCachedCharacter

```ml
function BotLoadCachedCharacter(state, filename, skill, reload)
```

Forward `BotLoadCachedCharacter` to `mq3.botlib.ai_characters.loadCached` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `characters`. May update `state.characters[slot]` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |
| `reload` | `dynamic` | — | Value used by `loadCached` in `if not reload then handle=findCached(state,filename,skill)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L61)

<a id="function-function-mq3-botlib-be-ai-char-botloadcharacter-function-botloadcharacter-state-filename-skill-src-mq3-botlib-be-ai-char-ml-2072443643"></a>
### BotLoadCharacter

```ml
function BotLoadCharacter(state, filename, skill)
```

Forward `BotLoadCharacter` to `mq3.botlib.ai_characters.loadCharacter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `readFn`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L77)

<a id="function-function-mq3-botlib-be-ai-char-botloadcharacterfromfile-function-botloadcharacterfromfile-state-filename-skill-src-mq3-botlib-be-ai-char-ml-56750659"></a>
### BotLoadCharacterFromFile

```ml
function BotLoadCharacterFromFile(state, filename, skill)
```

Apply `mq3.botlib.ai_characters.parseCharacter` while evaluating `BotLoadCharacterFromFile`. Return paths include `parsed.character`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `context`, `readFn` and `fileReads`. May update `state.fileReads` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L48)

<a id="function-function-mq3-botlib-be-ai-char-botloadcharacterskill-function-botloadcharacterskill-state-filename-skill-src-mq3-botlib-be-ai-char-ml-1996323809"></a>
### BotLoadCharacterSkill

```ml
function BotLoadCharacterSkill(state, filename, skill)
```

Forward `BotLoadCharacterSkill` to `mq3.botlib.ai_characters.loadCharacterSkill` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `reloadCharacters` and `characters`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L66)

<a id="function-function-mq3-botlib-be-ai-char-botshutdowncharacters-function-botshutdowncharacters-state-src-mq3-botlib-be-ai-char-ml-649552499"></a>
### BotShutdownCharacters

```ml
function BotShutdownCharacters(state)
```

Forward `BotShutdownCharacters` to `mq3.botlib.ai_characters.shutdown` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. May update `state.characters[handle]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L116)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-bfloat-function-characteristic-bfloat-state-character-index-minimum-maximum-src-mq3-botlib-be-ai-char-ml-1740748110"></a>
### Characteristic_BFloat

```ml
function Characteristic_BFloat(state, character, index, minimum, maximum)
```

Forward `Characteristic_BFloat` to `mq3.botlib.ai_characters.characteristicBFloat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `character` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `minimum` | `dynamic` | — | Operand used to evaluate the returned expression `minimum`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L96)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-binteger-function-characteristic-binteger-state-character-index-minimum-maximum-src-mq3-botlib-be-ai-char-ml-315491794"></a>
### Characteristic_BInteger

```ml
function Characteristic_BInteger(state, character, index, minimum, maximum)
```

Forward `Characteristic_BInteger` to `mq3.botlib.ai_characters.characteristicBInteger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `character` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `minimum` | `dynamic` | — | Operand used to evaluate the returned expression `minimum`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L108)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-float-function-characteristic-float-state-character-index-src-mq3-botlib-be-ai-char-ml-826646588"></a>
### Characteristic_Float

```ml
function Characteristic_Float(state, character, index)
```

Forward `Characteristic_Float` to `mq3.botlib.ai_characters.characteristicFloat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `character` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L89)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-integer-function-characteristic-integer-state-character-index-src-mq3-botlib-be-ai-char-ml-259827784"></a>
### Characteristic_Integer

```ml
function Characteristic_Integer(state, character, index)
```

Forward `Characteristic_Integer` to `mq3.botlib.ai_characters.characteristicInteger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `character` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L101)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-string-function-characteristic-string-state-character-index-src-mq3-botlib-be-ai-char-ml-490773066"></a>
### Characteristic_String

```ml
function Characteristic_String(state, character, index)
```

Forward `Characteristic_String` to `mq3.botlib.ai_characters.characteristicString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `character` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L113)

<a id="function-function-mq3-botlib-be-ai-char-checkcharacteristicindex-function-checkcharacteristicindex-state-character-index-src-mq3-botlib-be-ai-char-ml-706454408"></a>
### CheckCharacteristicIndex

```ml
function CheckCharacteristicIndex(state, character, index)
```

Apply `mq3.botlib.ai_characters.characterAt` while evaluating `CheckCharacteristicIndex`. Return paths include `value.values[index].type!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `maxClients` and `characters`. |
| `character` | `dynamic` | — | Handle identifying the allocated bot character. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_char.ml#L82)
