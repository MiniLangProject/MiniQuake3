# `src/mq3/botlib/ai_chat_strings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_strings`](Package-mq3-botlib-ai-chat-strings-1273453064.md)

Reachable from entry: **yes**

## Imports

- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `textStrings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-chat-strings-botpath-function-botpath-name-src-mq3-botlib-ai-chat-strings-ml-117605523"></a>
### botPath

```ml
function botPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L20)

<a id="function-function-mq3-botlib-ai-chat-strings-boundary-function-boundary-value-src-mq3-botlib-ai-chat-strings-ml-321088693"></a>
### boundary

```ml
function boundary(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L94)

<a id="function-function-mq3-botlib-ai-chat-strings-clear-function-clear-state-src-mq3-botlib-ai-chat-strings-ml-892248795"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L75)

<a id="function-function-mq3-botlib-ai-chat-strings-create-function-create-context-readfn-src-mq3-botlib-ai-chat-strings-ml-631454887"></a>
### create

```ml
function create(context, readFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L19)

<a id="function-function-mq3-botlib-ai-chat-strings-ensureloaded-function-ensureloaded-state-src-mq3-botlib-ai-chat-strings-ml-836462845"></a>
### ensureLoaded

```ml
function ensureLoaded(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L72)

<a id="function-function-mq3-botlib-ai-chat-strings-expect-function-expect-registry-source-text-src-mq3-botlib-ai-chat-strings-ml-1960644145"></a>
### expect

```ml
function expect(registry, source, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L29)

<a id="function-function-mq3-botlib-ai-chat-strings-fail-function-fail-message-src-mq3-botlib-ai-chat-strings-ml-1188082487"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L18)

<a id="function-function-mq3-botlib-ai-chat-strings-findword-function-findword-value-wordvalue-start-src-mq3-botlib-ai-chat-strings-ml-675628104"></a>
### findWord

```ml
function findWord(value, wordValue, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `wordValue` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L99)

- [mq3.botlib.ai_chat_strings.Group](Type-mq3-botlib-ai-chat-strings-group-248301701.md) — struct
<a id="function-function-mq3-botlib-ai-chat-strings-iswhitespace-function-iswhitespace-value-src-mq3-botlib-ai-chat-strings-ml-633914033"></a>
### isWhiteSpace

```ml
function isWhiteSpace(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L77)

<a id="function-function-mq3-botlib-ai-chat-strings-load-function-load-state-filename-src-mq3-botlib-ai-chat-strings-ml-280133518"></a>
### load

```ml
function load(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L68)

- [mq3.botlib.ai_chat_strings.Loader](Type-mq3-botlib-ai-chat-strings-loader-157619677.md) — struct
<a id="function-function-mq3-botlib-ai-chat-strings-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-strings-ml-86561266"></a>
### loadText

```ml
function loadText(loader, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L24)

<a id="function-function-mq3-botlib-ai-chat-strings-lower-function-lower-value-src-mq3-botlib-ai-chat-strings-ml-1862599675"></a>
### lower

```ml
function lower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L93)

<a id="function-function-mq3-botlib-ai-chat-strings-matchesat-function-matchesat-data-word-at-src-mq3-botlib-ai-chat-strings-ml-1464872409"></a>
### matchesAt

```ml
function matchesAt(data, word, at)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `word` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L95)

<a id="constant-constant-mq3-botlib-ai-chat-strings-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-strings-ml-392347090"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L11)

<a id="constant-constant-mq3-botlib-ai-chat-strings-op-replace-synonyms-const-op-replace-synonyms-521-src-mq3-botlib-ai-chat-strings-ml-1422786995"></a>
### OP_REPLACE_SYNONYMS

```ml
const OP_REPLACE_SYNONYMS = 521
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L10)

<a id="constant-constant-mq3-botlib-ai-chat-strings-op-unify-white-spaces-const-op-unify-white-spaces-520-src-mq3-botlib-ai-chat-strings-ml-1036907216"></a>
### OP_UNIFY_WHITE_SPACES

```ml
const OP_UNIFY_WHITE_SPACES = 520
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L9)

<a id="function-function-mq3-botlib-ai-chat-strings-parse-function-parse-state-filename-src-mq3-botlib-ai-chat-strings-ml-920490488"></a>
### parse

```ml
function parse(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L48)

<a id="function-function-mq3-botlib-ai-chat-strings-parsegroup-function-parsegroup-registry-source-context-src-mq3-botlib-ai-chat-strings-ml-353618665"></a>
### parseGroup

```ml
function parseGroup(registry, source, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L32)

<a id="function-function-mq3-botlib-ai-chat-strings-replacerange-function-replacerange-value-at-count-replacement-src-mq3-botlib-ai-chat-strings-ml-2131545949"></a>
### replaceRange

```ml
function replaceRange(value, at, count, replacement)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `replacement` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L111)

<a id="function-function-mq3-botlib-ai-chat-strings-replacesynonyms-function-replacesynonyms-state-value-context-src-mq3-botlib-ai-chat-strings-ml-1048737193"></a>
### replaceSynonyms

```ml
function replaceSynonyms(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L129)

<a id="function-function-mq3-botlib-ai-chat-strings-replacewords-function-replacewords-value-synonym-replacement-src-mq3-botlib-ai-chat-strings-ml-1398205812"></a>
### replaceWords

```ml
function replaceWords(value, synonym, replacement)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `synonym` | `dynamic` | — |  |
| `replacement` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L116)

- [mq3.botlib.ai_chat_strings.State](Type-mq3-botlib-ai-chat-strings-state-573645047.md) — struct
- [mq3.botlib.ai_chat_strings.Synonym](Type-mq3-botlib-ai-chat-strings-synonym-1217201239.md) — struct
<a id="function-function-mq3-botlib-ai-chat-strings-take-function-take-registry-source-src-mq3-botlib-ai-chat-strings-ml-1758465788"></a>
### take

```ml
function take(registry, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L28)

<a id="function-function-mq3-botlib-ai-chat-strings-unifywhitespaces-function-unifywhitespaces-value-src-mq3-botlib-ai-chat-strings-ml-771593789"></a>
### unifyWhiteSpaces

```ml
function unifyWhiteSpaces(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_strings.ml#L81)
