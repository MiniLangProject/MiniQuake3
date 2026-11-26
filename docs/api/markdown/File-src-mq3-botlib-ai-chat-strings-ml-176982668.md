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

Normalize a ai chat strings resource path by removing leading slashes and ensuring the botfiles prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L58)

<a id="function-function-mq3-botlib-ai-chat-strings-boundary-function-boundary-value-src-mq3-botlib-ai-chat-strings-ml-321088693"></a>
### boundary

```ml
function boundary(value)
```

Test `value==32 or value==46 or value==44 or value==33` as the condition for `boundary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value==32 or value==46 or value==44 or value==33`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L164)

<a id="function-function-mq3-botlib-ai-chat-strings-clear-function-clear-state-src-mq3-botlib-ai-chat-strings-ml-892248795"></a>
### clear

```ml
function clear(state)
```

Set `state.groups` to `[]` and `state.loaded` to `false` in `mq3.botlib.ai_chat_strings.clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat strings state; accesses `groups` and `loaded`. May update `state.groups` and `state.loaded` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L137)

<a id="function-function-mq3-botlib-ai-chat-strings-create-function-create-context-readfn-src-mq3-botlib-ai-chat-strings-ml-631454887"></a>
### create

```ml
function create(context, readFn)
```

Create a `mq3.botlib.ai_chat_strings.State` record, initializing `context` from `context` and `readFn` from `readFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L55)

<a id="function-function-mq3-botlib-ai-chat-strings-ensureloaded-function-ensureloaded-state-src-mq3-botlib-ai-chat-strings-ml-836462845"></a>
### ensureLoaded

```ml
function ensureLoaded(state)
```

Apply `mq3.botlib.ai_chat_strings.load` while evaluating `ensureLoaded`. Return paths include `load(state,"syn.c")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat strings state; accesses `loaded` and `groups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L132)

<a id="function-function-mq3-botlib-ai-chat-strings-expect-function-expect-registry-source-text-src-mq3-botlib-ai-chat-strings-ml-1960644145"></a>
### expect

```ml
function expect(registry, source, text)
```

Apply `mq3.botlib.ai_chat_strings.take` while evaluating `expect`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L77)

<a id="function-function-mq3-botlib-ai-chat-strings-fail-function-fail-message-src-mq3-botlib-ai-chat-strings-ml-1188082487"></a>
### fail

```ml
function fail(message)
```

Construct error `7595` with diagnostic text `"AI chat strings: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L51)

<a id="function-function-mq3-botlib-ai-chat-strings-findword-function-findword-value-wordvalue-start-src-mq3-botlib-ai-chat-strings-ml-675628104"></a>
### findWord

```ml
function findWord(value, wordValue, start)
```

Apply `mq3.botlib.ai_chat_strings.boundary` and `mq3.botlib.ai_chat_strings.matchesAt` while evaluating `findWord`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `wordValue` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `start` | `dynamic` | — | Value used by `findWord` in `if len(word)==0 or start<0 then return -1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L177)

- [mq3.botlib.ai_chat_strings.Group](Type-mq3-botlib-ai-chat-strings-group-248301701.md) — struct
<a id="function-function-mq3-botlib-ai-chat-strings-iswhitespace-function-iswhitespace-value-src-mq3-botlib-ai-chat-strings-ml-633914033"></a>
### isWhiteSpace

```ml
function isWhiteSpace(value)
```

Classify separators according to the released bot-chat character rules, which preserve letters, digits and listed punctuation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `isWhiteSpace` in `if value>=97 and value<=122 or value>=65 and value<=90 or value>=48 and value<=57 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L141)

<a id="function-function-mq3-botlib-ai-chat-strings-load-function-load-state-filename-src-mq3-botlib-ai-chat-strings-ml-280133518"></a>
### load

```ml
function load(state, filename)
```

Set `state.groups` to `groups` and `state.loaded` to `true` in `mq3.botlib.ai_chat_strings.load`. Return paths include `len(groups)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat strings state; accesses `groups` and `loaded`. May update `state.groups` and `state.loaded` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L126)

- [mq3.botlib.ai_chat_strings.Loader](Type-mq3-botlib-ai-chat-strings-loader-157619677.md) — struct
<a id="function-function-mq3-botlib-ai-chat-strings-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-strings-ml-86561266"></a>
### loadText

```ml
function loadText(loader, name)
```

Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_strings.loadText`. Return paths include `loader.state.readFn(loader.state.context,botPath(name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — | Loader record; accesses `state`. May update `loader.state.fileReads` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L65)

<a id="function-function-mq3-botlib-ai-chat-strings-lower-function-lower-value-src-mq3-botlib-ai-chat-strings-ml-1862599675"></a>
### lower

```ml
function lower(value)
```

Convert an ASCII uppercase letter to lowercase while preserving other byte values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value+32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L161)

<a id="function-function-mq3-botlib-ai-chat-strings-matchesat-function-matchesat-data-word-at-src-mq3-botlib-ai-chat-strings-ml-1464872409"></a>
### matchesAt

```ml
function matchesAt(data, word, at)
```

Apply `mq3.botlib.ai_chat_strings.lower` while evaluating `matchesAt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `at+index`. |
| `word` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `at` | `dynamic` | — | Value used by `matchesAt` in `if at<0 or at+len(word)>len(data) then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L169)

<a id="constant-constant-mq3-botlib-ai-chat-strings-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-strings-ml-392347090"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```

Maximum character capacity of a bot chat or console message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L14)

<a id="constant-constant-mq3-botlib-ai-chat-strings-op-replace-synonyms-const-op-replace-synonyms-521-src-mq3-botlib-ai-chat-strings-ml-1422786995"></a>
### OP_REPLACE_SYNONYMS

```ml
const OP_REPLACE_SYNONYMS = 521
```

Bot-library syscall identifier for replace synonyms.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-strings-op-unify-white-spaces-const-op-unify-white-spaces-520-src-mq3-botlib-ai-chat-strings-ml-1036907216"></a>
### OP_UNIFY_WHITE_SPACES

```ml
const OP_UNIFY_WHITE_SPACES = 520
```

Bot-library syscall identifier for unify white spaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L10)

<a id="function-function-mq3-botlib-ai-chat-strings-parse-function-parse-state-filename-src-mq3-botlib-ai-chat-strings-ml-920490488"></a>
### parse

```ml
function parse(state, filename)
```

Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.botlib.ai_chat_strings.take` while evaluating `parse`. Return paths include `groups`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_strings.Loader.state`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L103)

<a id="function-function-mq3-botlib-ai-chat-strings-parsegroup-function-parsegroup-registry-source-context-src-mq3-botlib-ai-chat-strings-ml-353618665"></a>
### parseGroup

```ml
function parseGroup(registry, source, context)
```

Build the `mq3.botlib.ai_chat_strings.Group` result for `parseGroup`. Return paths include `Group(context,values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L84)

<a id="function-function-mq3-botlib-ai-chat-strings-replacerange-function-replacerange-value-at-count-replacement-src-mq3-botlib-ai-chat-strings-ml-2131545949"></a>
### replaceRange

```ml
function replaceRange(value, at, count, replacement)
```

Replace a byte range in a string while preserving its prefix and suffix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `at` | `dynamic` | — | Value passed as argument 5 to `copyBytes`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `replacement` | `dynamic` | — | Text substituted for a matching word or token. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L194)

<a id="function-function-mq3-botlib-ai-chat-strings-replacesynonyms-function-replacesynonyms-state-value-context-src-mq3-botlib-ai-chat-strings-ml-1048737193"></a>
### replaceSynonyms

```ml
function replaceSynonyms(state, value, context)
```

Apply `mq3.botlib.ai_chat_strings.ensureLoaded` and `mq3.botlib.ai_chat_strings.replaceWords` while evaluating `replaceSynonyms`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat strings state; accesses `groups`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L220)

<a id="function-function-mq3-botlib-ai-chat-strings-replacewords-function-replacewords-value-synonym-replacement-src-mq3-botlib-ai-chat-strings-ml-1398205812"></a>
### replaceWords

```ml
function replaceWords(value, synonym, replacement)
```

Apply `mq3.botlib.ai_chat_strings.findWord` and `mq3.botlib.ai_chat_strings.replaceRange` while evaluating `replaceWords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `synonym` | `dynamic` | — | Word or synonym selected for replacement. |
| `replacement` | `dynamic` | — | Text substituted for a matching word or token. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L203)

- [mq3.botlib.ai_chat_strings.State](Type-mq3-botlib-ai-chat-strings-state-573645047.md) — struct
- [mq3.botlib.ai_chat_strings.Synonym](Type-mq3-botlib-ai-chat-strings-synonym-1217201239.md) — struct
<a id="function-function-mq3-botlib-ai-chat-strings-take-function-take-registry-source-src-mq3-botlib-ai-chat-strings-ml-1758465788"></a>
### take

```ml
function take(registry, source)
```

Forward `take` to `mq3.vm.pc_parser.read` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L72)

<a id="function-function-mq3-botlib-ai-chat-strings-unifywhitespaces-function-unifywhitespaces-value-src-mq3-botlib-ai-chat-strings-ml-771593789"></a>
### unifyWhiteSpaces

```ml
function unifyWhiteSpaces(value)
```

Apply `mq3.botlib.ai_chat_strings.isWhiteSpace` while evaluating `unifyWhiteSpaces`. Return paths include `decode(slice(output,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L147)
