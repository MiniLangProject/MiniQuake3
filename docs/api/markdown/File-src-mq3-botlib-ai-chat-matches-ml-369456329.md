# `src/mq3/botlib/ai_chat_matches.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_matches`](Package-mq3-botlib-ai-chat-matches-1449719331.md)

Reachable from entry: **yes**

## Imports

- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `textStrings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-chat-matches-botpath-function-botpath-name-src-mq3-botlib-ai-chat-matches-ml-1438199263"></a>
### botPath

```ml
function botPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L26)

<a id="function-function-mq3-botlib-ai-chat-matches-clear-function-clear-state-src-mq3-botlib-ai-chat-matches-ml-652726285"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L105)

<a id="function-function-mq3-botlib-ai-chat-matches-create-function-create-context-readfn-src-mq3-botlib-ai-chat-matches-ml-380043725"></a>
### create

```ml
function create(context, readFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L24)

<a id="function-function-mq3-botlib-ai-chat-matches-emptymatch-function-emptymatch-value-src-mq3-botlib-ai-chat-matches-ml-1367188807"></a>
### emptyMatch

```ml
function emptyMatch(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L25)

<a id="function-function-mq3-botlib-ai-chat-matches-ensureloaded-function-ensureloaded-state-src-mq3-botlib-ai-chat-matches-ml-577849351"></a>
### ensureLoaded

```ml
function ensureLoaded(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L104)

<a id="function-function-mq3-botlib-ai-chat-matches-expectinteger-function-expectinteger-registry-source-label-src-mq3-botlib-ai-chat-matches-ml-1757003670"></a>
### expectInteger

```ml
function expectInteger(registry, source, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L39)

<a id="function-function-mq3-botlib-ai-chat-matches-expecttext-function-expecttext-registry-source-value-src-mq3-botlib-ai-chat-matches-ml-1811088845"></a>
### expectText

```ml
function expectText(registry, source, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L35)

<a id="function-function-mq3-botlib-ai-chat-matches-fail-function-fail-message-src-mq3-botlib-ai-chat-matches-ml-65165713"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L23)

<a id="function-function-mq3-botlib-ai-chat-matches-findmatch-function-findmatch-state-value-context-src-mq3-botlib-ai-chat-matches-ml-70702011"></a>
### findMatch

```ml
function findMatch(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L138)

<a id="function-function-mq3-botlib-ai-chat-matches-load-function-load-state-filename-src-mq3-botlib-ai-chat-matches-ml-878644588"></a>
### load

```ml
function load(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L100)

- [mq3.botlib.ai_chat_matches.Loader](Type-mq3-botlib-ai-chat-matches-loader-1375810372.md) — struct
<a id="function-function-mq3-botlib-ai-chat-matches-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-matches-ml-2024573378"></a>
### loadText

```ml
function loadText(loader, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L30)

- [mq3.botlib.ai_chat_matches.Match](Type-mq3-botlib-ai-chat-matches-match-1783988752.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-matches-match-abi-size-const-match-abi-size-328-src-mq3-botlib-ai-chat-matches-ml-2109965710"></a>
### MATCH_ABI_SIZE

```ml
const MATCH_ABI_SIZE = 328
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L15)

<a id="function-function-mq3-botlib-ai-chat-matches-matchvariable-function-matchvariable-match-variable-size-src-mq3-botlib-ai-chat-matches-ml-414784718"></a>
### matchVariable

```ml
function matchVariable(match, variable, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `match` | `dynamic` | — |  |
| `variable` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L148)

<a id="constant-constant-mq3-botlib-ai-chat-matches-max-match-variables-const-max-match-variables-8-src-mq3-botlib-ai-chat-matches-ml-1585129891"></a>
### MAX_MATCH_VARIABLES

```ml
const MAX_MATCH_VARIABLES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L14)

<a id="constant-constant-mq3-botlib-ai-chat-matches-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-matches-ml-1408856804"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L13)

<a id="constant-constant-mq3-botlib-ai-chat-matches-op-find-match-const-op-find-match-518-src-mq3-botlib-ai-chat-matches-ml-2103737613"></a>
### OP_FIND_MATCH

```ml
const OP_FIND_MATCH = 518
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L11)

<a id="constant-constant-mq3-botlib-ai-chat-matches-op-match-variable-const-op-match-variable-519-src-mq3-botlib-ai-chat-matches-ml-662446266"></a>
### OP_MATCH_VARIABLE

```ml
const OP_MATCH_VARIABLE = 519
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-matches-op-string-contains-const-op-string-contains-517-src-mq3-botlib-ai-chat-matches-ml-1581207192"></a>
### OP_STRING_CONTAINS

```ml
const OP_STRING_CONTAINS = 517
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L10)

<a id="function-function-mq3-botlib-ai-chat-matches-parse-function-parse-state-filename-src-mq3-botlib-ai-chat-matches-ml-324245374"></a>
### parse

```ml
function parse(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L78)

<a id="function-function-mq3-botlib-ai-chat-matches-parsepieces-function-parsepieces-registry-source-firsttoken-src-mq3-botlib-ai-chat-matches-ml-25827569"></a>
### parsePieces

```ml
function parsePieces(registry, source, firstToken)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `firstToken` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L54)

- [mq3.botlib.ai_chat_matches.Piece](Type-mq3-botlib-ai-chat-matches-piece-1020623727.md) — struct
- [mq3.botlib.ai_chat_matches.State](Type-mq3-botlib-ai-chat-matches-state-1467600216.md) — struct
<a id="function-function-mq3-botlib-ai-chat-matches-stringcontains-function-stringcontains-value-needle-casesensitive-src-mq3-botlib-ai-chat-matches-ml-1147336912"></a>
### stringContains

```ml
function stringContains(value, needle, caseSensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |
| `caseSensitive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L108)

<a id="function-function-mq3-botlib-ai-chat-matches-stringsmatch-function-stringsmatch-pieces-match-src-mq3-botlib-ai-chat-matches-ml-460764268"></a>
### stringsMatch

```ml
function stringsMatch(pieces, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pieces` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L116)

<a id="function-function-mq3-botlib-ai-chat-matches-suffix-function-suffix-value-start-src-mq3-botlib-ai-chat-matches-ml-539675639"></a>
### suffix

```ml
function suffix(value, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L115)

<a id="function-function-mq3-botlib-ai-chat-matches-take-function-take-registry-source-src-mq3-botlib-ai-chat-matches-ml-457733388"></a>
### take

```ml
function take(registry, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L34)

- [mq3.botlib.ai_chat_matches.Template](Type-mq3-botlib-ai-chat-matches-template-825433973.md) — struct
<a id="function-function-mq3-botlib-ai-chat-matches-trimenters-function-trimenters-value-src-mq3-botlib-ai-chat-matches-ml-1216999263"></a>
### trimEnters

```ml
function trimEnters(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L137)

<a id="function-function-mq3-botlib-ai-chat-matches-upper-function-upper-value-src-mq3-botlib-ai-chat-matches-ml-806226135"></a>
### upper

```ml
function upper(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L107)
