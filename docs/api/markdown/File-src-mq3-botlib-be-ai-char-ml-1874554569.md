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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L8)

<a id="function-function-mq3-botlib-be-ai-char-botdefaultcharacteristics-function-botdefaultcharacteristics-character-defaults-src-mq3-botlib-be-ai-char-ml-2041171653"></a>
### BotDefaultCharacteristics

```ml
function BotDefaultCharacteristics(character, defaults)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |
| `defaults` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L27)

<a id="function-function-mq3-botlib-be-ai-char-botdumpcharacter-function-botdumpcharacter-character-src-mq3-botlib-be-ai-char-ml-580550675"></a>
### BotDumpCharacter

```ml
function BotDumpCharacter(character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L9)

<a id="function-function-mq3-botlib-be-ai-char-botfindcachedcharacter-function-botfindcachedcharacter-state-filename-skill-src-mq3-botlib-be-ai-char-ml-1607811827"></a>
### BotFindCachedCharacter

```ml
function BotFindCachedCharacter(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L31)

<a id="function-function-mq3-botlib-be-ai-char-botfreecharacter-function-botfreecharacter-state-handle-src-mq3-botlib-be-ai-char-ml-1739676575"></a>
### BotFreeCharacter

```ml
function BotFreeCharacter(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L26)

<a id="function-function-mq3-botlib-be-ai-char-botfreecharacter2-function-botfreecharacter2-state-handle-src-mq3-botlib-be-ai-char-ml-1312173079"></a>
### BotFreeCharacter2

```ml
function BotFreeCharacter2(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L25)

<a id="function-function-mq3-botlib-be-ai-char-botfreecharacterstrings-function-botfreecharacterstrings-character-src-mq3-botlib-be-ai-char-ml-331075107"></a>
### BotFreeCharacterStrings

```ml
function BotFreeCharacterStrings(character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L20)

<a id="function-function-mq3-botlib-be-ai-char-botinterpolatecharacters-function-botinterpolatecharacters-state-handle1-handle2-desiredskill-src-mq3-botlib-be-ai-char-ml-894434117"></a>
### BotInterpolateCharacters

```ml
function BotInterpolateCharacters(state, handle1, handle2, desiredSkill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle1` | `dynamic` | — |  |
| `handle2` | `dynamic` | — |  |
| `desiredSkill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L34)

<a id="function-function-mq3-botlib-be-ai-char-botloadcachedcharacter-function-botloadcachedcharacter-state-filename-skill-reload-src-mq3-botlib-be-ai-char-ml-788780898"></a>
### BotLoadCachedCharacter

```ml
function BotLoadCachedCharacter(state, filename, skill, reload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |
| `reload` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L32)

<a id="function-function-mq3-botlib-be-ai-char-botloadcharacter-function-botloadcharacter-state-filename-skill-src-mq3-botlib-be-ai-char-ml-2072443643"></a>
### BotLoadCharacter

```ml
function BotLoadCharacter(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L35)

<a id="function-function-mq3-botlib-be-ai-char-botloadcharacterfromfile-function-botloadcharacterfromfile-state-filename-skill-src-mq3-botlib-be-ai-char-ml-56750659"></a>
### BotLoadCharacterFromFile

```ml
function BotLoadCharacterFromFile(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L28)

<a id="function-function-mq3-botlib-be-ai-char-botloadcharacterskill-function-botloadcharacterskill-state-filename-skill-src-mq3-botlib-be-ai-char-ml-1996323809"></a>
### BotLoadCharacterSkill

```ml
function BotLoadCharacterSkill(state, filename, skill)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L33)

<a id="function-function-mq3-botlib-be-ai-char-botshutdowncharacters-function-botshutdowncharacters-state-src-mq3-botlib-be-ai-char-ml-649552499"></a>
### BotShutdownCharacters

```ml
function BotShutdownCharacters(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L44)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-bfloat-function-characteristic-bfloat-state-character-index-minimum-maximum-src-mq3-botlib-be-ai-char-ml-1740748110"></a>
### Characteristic_BFloat

```ml
function Characteristic_BFloat(state, character, index, minimum, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L40)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-binteger-function-characteristic-binteger-state-character-index-minimum-maximum-src-mq3-botlib-be-ai-char-ml-315491794"></a>
### Characteristic_BInteger

```ml
function Characteristic_BInteger(state, character, index, minimum, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L42)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-float-function-characteristic-float-state-character-index-src-mq3-botlib-be-ai-char-ml-826646588"></a>
### Characteristic_Float

```ml
function Characteristic_Float(state, character, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L39)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-integer-function-characteristic-integer-state-character-index-src-mq3-botlib-be-ai-char-ml-259827784"></a>
### Characteristic_Integer

```ml
function Characteristic_Integer(state, character, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L41)

<a id="function-function-mq3-botlib-be-ai-char-characteristic-string-function-characteristic-string-state-character-index-src-mq3-botlib-be-ai-char-ml-490773066"></a>
### Characteristic_String

```ml
function Characteristic_String(state, character, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L43)

<a id="function-function-mq3-botlib-be-ai-char-checkcharacteristicindex-function-checkcharacteristicindex-state-character-index-src-mq3-botlib-be-ai-char-ml-706454408"></a>
### CheckCharacteristicIndex

```ml
function CheckCharacteristicIndex(state, character, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_char.ml#L36)
