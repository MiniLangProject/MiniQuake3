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

Normalize a ai chat matches resource path by removing leading slashes and ensuring the botfiles prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L40)

<a id="function-function-mq3-botlib-ai-chat-matches-clear-function-clear-state-src-mq3-botlib-ai-chat-matches-ml-652726285"></a>
### clear

```ml
function clear(state)
```

Set `state.templates` to `[]` and `state.loaded` to `false` in `mq3.botlib.ai_chat_matches.clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat matches state; accesses `templates` and `loaded`. May update `state.templates` and `state.loaded` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L147)

<a id="function-function-mq3-botlib-ai-chat-matches-create-function-create-context-readfn-src-mq3-botlib-ai-chat-matches-ml-380043725"></a>
### create

```ml
function create(context, readFn)
```

Create a `mq3.botlib.ai_chat_matches.State` record, initializing `context` from `context` and `readFn` from `readFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L34)

<a id="function-function-mq3-botlib-ai-chat-matches-emptymatch-function-emptymatch-value-src-mq3-botlib-ai-chat-matches-ml-1367188807"></a>
### emptyMatch

```ml
function emptyMatch(value)
```

Create a `mq3.botlib.ai_chat_matches.Match` record, initializing `string` from `value`, `offsets` as `[-1,-1,-1,-1,-1,-1,-1,-1]` and `lengths` as `[0,0,0,0,0,0,0,0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_matches.Match.string`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L37)

<a id="function-function-mq3-botlib-ai-chat-matches-ensureloaded-function-ensureloaded-state-src-mq3-botlib-ai-chat-matches-ml-577849351"></a>
### ensureLoaded

```ml
function ensureLoaded(state)
```

Apply `mq3.botlib.ai_chat_matches.load` while evaluating `ensureLoaded`. Return paths include `load(state,"match.c")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat matches state; accesses `loaded` and `templates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L144)

<a id="function-function-mq3-botlib-ai-chat-matches-expectinteger-function-expectinteger-registry-source-label-src-mq3-botlib-ai-chat-matches-ml-1757003670"></a>
### expectInteger

```ml
function expectInteger(registry, source, label)
```

Apply `mq3.botlib.ai_chat_matches.take` and `mq3.botlib.ai_chat_matches.expectText` while evaluating `expectInteger`. Return paths include `fail("unsupported $evalint operator "+part.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L67)

<a id="function-function-mq3-botlib-ai-chat-matches-expecttext-function-expecttext-registry-source-value-src-mq3-botlib-ai-chat-matches-ml-1811088845"></a>
### expectText

```ml
function expectText(registry, source, value)
```

Apply `mq3.botlib.ai_chat_matches.take` while evaluating `expectText`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `fail("expected "+value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L59)

<a id="function-function-mq3-botlib-ai-chat-matches-fail-function-fail-message-src-mq3-botlib-ai-chat-matches-ml-65165713"></a>
### fail

```ml
function fail(message)
```

Construct error `7597` with diagnostic text `"AI chat matches: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L30)

<a id="function-function-mq3-botlib-ai-chat-matches-findmatch-function-findmatch-state-value-context-src-mq3-botlib-ai-chat-matches-ml-70702011"></a>
### findMatch

```ml
function findMatch(state, value, context)
```

Apply `mq3.botlib.ai_chat_matches.ensureLoaded`, `mq3.botlib.ai_chat_matches.emptyMatch` and `mq3.botlib.ai_chat_matches.trimEnters` while evaluating `findMatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat matches state; accesses `templates`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L198)

<a id="function-function-mq3-botlib-ai-chat-matches-load-function-load-state-filename-src-mq3-botlib-ai-chat-matches-ml-878644588"></a>
### load

```ml
function load(state, filename)
```

Set `state.templates` to `templates` and `state.loaded` to `true` in `mq3.botlib.ai_chat_matches.load`. Return paths include `len(templates)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat matches state; accesses `templates` and `loaded`. May update `state.templates` and `state.loaded` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L138)

- [mq3.botlib.ai_chat_matches.Loader](Type-mq3-botlib-ai-chat-matches-loader-1375810372.md) — struct
<a id="function-function-mq3-botlib-ai-chat-matches-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-matches-ml-2024573378"></a>
### loadText

```ml
function loadText(loader, name)
```

Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_matches.loadText`. Return paths include `loader.state.readFn(loader.state.context,botPath(name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — | Loader record; accesses `state`. May update `loader.state.fileReads` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L47)

- [mq3.botlib.ai_chat_matches.Match](Type-mq3-botlib-ai-chat-matches-match-1783988752.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-matches-match-abi-size-const-match-abi-size-328-src-mq3-botlib-ai-chat-matches-ml-2109965710"></a>
### MATCH_ABI_SIZE

```ml
const MATCH_ABI_SIZE = 328
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L15)

<a id="function-function-mq3-botlib-ai-chat-matches-matchvariable-function-matchvariable-match-variable-size-src-mq3-botlib-ai-chat-matches-ml-414784718"></a>
### matchVariable

```ml
function matchVariable(match, variable, size)
```

Extract a matched chat variable and truncate it to the supplied buffer capacity minus its terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `variable` | `dynamic` | — | Operand used to evaluate the returned expression `decode(slice(bytes(match.string),match.offsets[variable],count))`. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L212)

<a id="constant-constant-mq3-botlib-ai-chat-matches-max-match-variables-const-max-match-variables-8-src-mq3-botlib-ai-chat-matches-ml-1585129891"></a>
### MAX_MATCH_VARIABLES

```ml
const MAX_MATCH_VARIABLES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L14)

<a id="constant-constant-mq3-botlib-ai-chat-matches-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-matches-ml-1408856804"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L13)

<a id="constant-constant-mq3-botlib-ai-chat-matches-op-find-match-const-op-find-match-518-src-mq3-botlib-ai-chat-matches-ml-2103737613"></a>
### OP_FIND_MATCH

```ml
const OP_FIND_MATCH = 518
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L11)

<a id="constant-constant-mq3-botlib-ai-chat-matches-op-match-variable-const-op-match-variable-519-src-mq3-botlib-ai-chat-matches-ml-662446266"></a>
### OP_MATCH_VARIABLE

```ml
const OP_MATCH_VARIABLE = 519
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-matches-op-string-contains-const-op-string-contains-517-src-mq3-botlib-ai-chat-matches-ml-1581207192"></a>
### OP_STRING_CONTAINS

```ml
const OP_STRING_CONTAINS = 517
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L10)

<a id="function-function-mq3-botlib-ai-chat-matches-parse-function-parse-state-filename-src-mq3-botlib-ai-chat-matches-ml-324245374"></a>
### parse

```ml
function parse(state, filename)
```

Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.botlib.ai_chat_matches.take` while evaluating `parse`. Return paths include `templates.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_matches.Loader.state`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L113)

<a id="function-function-mq3-botlib-ai-chat-matches-parsepieces-function-parsepieces-registry-source-firsttoken-src-mq3-botlib-ai-chat-matches-ml-25827569"></a>
### parsePieces

```ml
function parsePieces(registry, source, firstToken)
```

Apply `mq3.botlib.ai_chat_matches.take` while evaluating `parsePieces`. Return paths include `fail("expected match piece separator, found "+separator.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `firstToken` | `dynamic` | — | Value used by `parsePieces` in `nextToken=firstToken`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L86)

- [mq3.botlib.ai_chat_matches.Piece](Type-mq3-botlib-ai-chat-matches-piece-1020623727.md) — struct
- [mq3.botlib.ai_chat_matches.State](Type-mq3-botlib-ai-chat-matches-state-1467600216.md) — struct
<a id="function-function-mq3-botlib-ai-chat-matches-stringcontains-function-stringcontains-value-needle-casesensitive-src-mq3-botlib-ai-chat-matches-ml-1147336912"></a>
### stringContains

```ml
function stringContains(value, needle, caseSensitive)
```

Apply `mq3.botlib.ai_chat_matches.upper` while evaluating `stringContains`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `needle` | `dynamic` | — | Text or value to search for. |
| `caseSensitive` | `dynamic` | — | Whether comparisons distinguish letter case. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L156)

<a id="function-function-mq3-botlib-ai-chat-matches-stringsmatch-function-stringsmatch-pieces-match-src-mq3-botlib-ai-chat-matches-ml-460764268"></a>
### stringsMatch

```ml
function stringsMatch(pieces, match)
```

Update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` during `stringsMatch`. Return paths include `position==len(bytes(match.string))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pieces` | `dynamic` | — | Value used by `stringsMatch` in `for each piece in pieces`. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `string` and `lengths`. May update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L170)

<a id="function-function-mq3-botlib-ai-chat-matches-suffix-function-suffix-value-start-src-mq3-botlib-ai-chat-matches-ml-539675639"></a>
### suffix

```ml
function suffix(value, start)
```

Return the text suffix beginning at the supplied byte offset, or an empty string beyond the end.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `slice`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L166)

<a id="function-function-mq3-botlib-ai-chat-matches-take-function-take-registry-source-src-mq3-botlib-ai-chat-matches-ml-457733388"></a>
### take

```ml
function take(registry, source)
```

Forward `take` to `mq3.vm.pc_parser.read` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L54)

- [mq3.botlib.ai_chat_matches.Template](Type-mq3-botlib-ai-chat-matches-template-825433973.md) — struct
<a id="function-function-mq3-botlib-ai-chat-matches-trimenters-function-trimenters-value-src-mq3-botlib-ai-chat-matches-ml-1216999263"></a>
### trimEnters

```ml
function trimEnters(value)
```

Remove trailing line-feed bytes from chat text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L193)

<a id="function-function-mq3-botlib-ai-chat-matches-upper-function-upper-value-src-mq3-botlib-ai-chat-matches-ml-806226135"></a>
### upper

```ml
function upper(value)
```

Convert an ASCII lowercase letter to uppercase while preserving other byte values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value-32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L151)
