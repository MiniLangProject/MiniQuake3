# `src/mq3/botlib/ai_chat_output.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_output`](Package-mq3-botlib-ai-chat-output-1894800339.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_chat_matches.ml` as `matches` → [src/mq3/botlib/ai_chat_matches.ml](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)
- `mq3/botlib/ai_chat_profiles.ml` as `profiles` → [src/mq3/botlib/ai_chat_profiles.ml](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)
- `mq3/botlib/ai_chat_strings.ml` as `chatStrings` → [src/mq3/botlib/ai_chat_strings.ml](File-src-mq3-botlib-ai-chat-strings-ml-176982668.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/elementary_actions.ml` as `ea` → [src/mq3/botlib/elementary_actions.ml](File-src-mq3-botlib-elementary-actions-ml-737481412.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-botlib-ai-chat-output-chat-all-const-chat-all-0-src-mq3-botlib-ai-chat-output-ml-815428823"></a>
### CHAT_ALL

```ml
const CHAT_ALL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L19)

<a id="constant-constant-mq3-botlib-ai-chat-output-chat-team-const-chat-team-1-src-mq3-botlib-ai-chat-output-ml-1273494104"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L20)

<a id="constant-constant-mq3-botlib-ai-chat-output-chat-tell-const-chat-tell-2-src-mq3-botlib-ai-chat-output-ml-934111955"></a>
### CHAT_TELL

```ml
const CHAT_TELL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L21)

<a id="function-function-mq3-botlib-ai-chat-output-chatlength-function-chatlength-state-handle-src-mq3-botlib-ai-chat-output-ml-275297835"></a>
### chatLength

```ml
function chatLength(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L216)

<a id="function-function-mq3-botlib-ai-chat-output-chatstate-function-chatstate-state-handle-src-mq3-botlib-ai-chat-output-ml-817479493"></a>
### chatState

```ml
function chatState(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L184)

<a id="function-function-mq3-botlib-ai-chat-output-choose-function-choose-messages-state-updaterecent-src-mq3-botlib-ai-chat-output-ml-1130011067"></a>
### choose

```ml
function choose(messages, state, updateRecent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messages` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `updateRecent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L124)

<a id="function-function-mq3-botlib-ai-chat-output-choosereply-function-choosereply-messages-state-src-mq3-botlib-ai-chat-output-ml-489841423"></a>
### chooseReply

```ml
function chooseReply(messages, state)
```

Preserve BotReplyChat's released loop order: --num is evaluated before the recent-message test, unlike BotChooseInitialChatMessage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messages` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L131)

<a id="function-function-mq3-botlib-ai-chat-output-clear-function-clear-state-src-mq3-botlib-ai-chat-output-ml-2068968619"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L44)

<a id="function-function-mq3-botlib-ai-chat-output-clonematch-function-clonematch-value-src-mq3-botlib-ai-chat-output-ml-1816958325"></a>
### cloneMatch

```ml
function cloneMatch(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L181)

<a id="function-function-mq3-botlib-ai-chat-output-componentsfromencoded-function-componentsfromencoded-value-src-mq3-botlib-ai-chat-output-ml-18818501"></a>
### componentsFromEncoded

```ml
function componentsFromEncoded(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L164)

<a id="function-function-mq3-botlib-ai-chat-output-construct-function-construct-state-message-variables-context-vcontext-reply-src-mq3-botlib-ai-chat-output-ml-1953263453"></a>
### construct

```ml
function construct(state, message, variables, context, vcontext, reply)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `vcontext` | `dynamic` | — |  |
| `reply` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L174)

<a id="function-function-mq3-botlib-ai-chat-output-create-function-create-profilestate-stringstate-actions-context-readfn-timefn-randomfn-src-mq3-botlib-ai-chat-output-ml-554345536"></a>
### create

```ml
function create(profileState, stringState, actions, context, readFn, timeFn, randomFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profileState` | `dynamic` | — |  |
| `stringState` | `dynamic` | — |  |
| `actions` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `timeFn` | `dynamic` | — |  |
| `randomFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L43)

<a id="function-function-mq3-botlib-ai-chat-output-ensureloaded-function-ensureloaded-state-src-mq3-botlib-ai-chat-output-ml-1223835293"></a>
### ensureLoaded

```ml
function ensureLoaded(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L122)

<a id="function-function-mq3-botlib-ai-chat-output-enterchat-function-enterchat-state-handle-clientto-sendto-src-mq3-botlib-ai-chat-output-ml-1695903182"></a>
### enterChat

```ml
function enterChat(state, handle, clientTo, sendTo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `clientTo` | `dynamic` | — |  |
| `sendTo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L220)

<a id="function-function-mq3-botlib-ai-chat-output-expandonce-function-expandonce-state-components-variables-vcontext-reply-src-mq3-botlib-ai-chat-output-ml-15968389"></a>
### expandOnce

```ml
function expandOnce(state, components, variables, vcontext, reply)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `components` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |
| `vcontext` | `dynamic` | — |  |
| `reply` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L153)

<a id="function-function-mq3-botlib-ai-chat-output-expect-function-expect-reader-text-src-mq3-botlib-ai-chat-output-ml-901166554"></a>
### expect

```ml
function expect(reader, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L54)

<a id="function-function-mq3-botlib-ai-chat-output-fail-function-fail-message-src-mq3-botlib-ai-chat-output-ml-337632423"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L42)

<a id="function-function-mq3-botlib-ai-chat-output-initialchat-function-initialchat-state-handle-type-context-variables-src-mq3-botlib-ai-chat-output-ml-945256575"></a>
### initialChat

```ml
function initialChat(state, handle, type, context, variables)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L185)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-and-const-key-and-1-src-mq3-botlib-ai-chat-output-ml-2032748152"></a>
### KEY_AND

```ml
const KEY_AND = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L25)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-botnames-const-key-botnames-32-src-mq3-botlib-ai-chat-output-ml-1217424628"></a>
### KEY_BOTNAMES

```ml
const KEY_BOTNAMES = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L30)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-female-const-key-female-64-src-mq3-botlib-ai-chat-output-ml-1106492535"></a>
### KEY_FEMALE

```ml
const KEY_FEMALE = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L31)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-genderless-const-key-genderless-256-src-mq3-botlib-ai-chat-output-ml-1158711660"></a>
### KEY_GENDERLESS

```ml
const KEY_GENDERLESS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L33)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-male-const-key-male-128-src-mq3-botlib-ai-chat-output-ml-717684490"></a>
### KEY_MALE

```ml
const KEY_MALE = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L32)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-name-const-key-name-4-src-mq3-botlib-ai-chat-output-ml-662266633"></a>
### KEY_NAME

```ml
const KEY_NAME = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L27)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-not-const-key-not-2-src-mq3-botlib-ai-chat-output-ml-2084856135"></a>
### KEY_NOT

```ml
const KEY_NOT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L26)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-string-const-key-string-8-src-mq3-botlib-ai-chat-output-ml-1110176817"></a>
### KEY_STRING

```ml
const KEY_STRING = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L28)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-variables-const-key-variables-16-src-mq3-botlib-ai-chat-output-ml-1761722582"></a>
### KEY_VARIABLES

```ml
const KEY_VARIABLES = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L29)

<a id="function-function-mq3-botlib-ai-chat-output-keyresult-function-keyresult-key-cs-message-match-src-mq3-botlib-ai-chat-output-ml-575459189"></a>
### keyResult

```ml
function keyResult(key, cs, message, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `cs` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L188)

- [mq3.botlib.ai_chat_output.Loader](Type-mq3-botlib-ai-chat-output-loader-1396766644.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-output-ml-143972578"></a>
### loadText

```ml
function loadText(loader, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L48)

<a id="constant-constant-mq3-botlib-ai-chat-output-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-output-ml-115876988"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L23)

<a id="function-function-mq3-botlib-ai-chat-output-message-function-message-reader-first-src-mq3-botlib-ai-chat-output-ml-386215889"></a>
### message

```ml
function message(reader, first)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L55)

<a id="function-function-mq3-botlib-ai-chat-output-next-function-next-reader-src-mq3-botlib-ai-chat-output-ml-1308475629"></a>
### next

```ml
function next(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L52)

<a id="function-function-mq3-botlib-ai-chat-output-now-function-now-state-src-mq3-botlib-ai-chat-output-ml-2100061129"></a>
### now

```ml
function now(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L46)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-chat-length-const-op-chat-length-515-src-mq3-botlib-ai-chat-output-ml-228905498"></a>
### OP_CHAT_LENGTH

```ml
const OP_CHAT_LENGTH = 515
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L17)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-enter-chat-const-op-enter-chat-516-src-mq3-botlib-ai-chat-output-ml-1055847597"></a>
### OP_ENTER_CHAT

```ml
const OP_ENTER_CHAT = 516
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L18)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-initial-chat-const-op-initial-chat-513-src-mq3-botlib-ai-chat-output-ml-628437800"></a>
### OP_INITIAL_CHAT

```ml
const OP_INITIAL_CHAT = 513
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L15)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-reply-chat-const-op-reply-chat-514-src-mq3-botlib-ai-chat-output-ml-2018837995"></a>
### OP_REPLY_CHAT

```ml
const OP_REPLY_CHAT = 514
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L16)

<a id="function-function-mq3-botlib-ai-chat-output-parserandomlists-function-parserandomlists-state-src-mq3-botlib-ai-chat-output-ml-1945906485"></a>
### parseRandomLists

```ml
function parseRandomLists(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L57)

<a id="function-function-mq3-botlib-ai-chat-output-parsereplies-function-parsereplies-state-src-mq3-botlib-ai-chat-output-ml-1080962801"></a>
### parseReplies

```ml
function parseReplies(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L97)

<a id="function-function-mq3-botlib-ai-chat-output-parsereplykey-function-parsereplykey-reader-src-mq3-botlib-ai-chat-output-ml-1007510233"></a>
### parseReplyKey

```ml
function parseReplyKey(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L83)

<a id="function-function-mq3-botlib-ai-chat-output-parsereplypieces-function-parsereplypieces-reader-src-mq3-botlib-ai-chat-output-ml-1774211801"></a>
### parseReplyPieces

```ml
function parseReplyPieces(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L68)

<a id="function-function-mq3-botlib-ai-chat-output-randomlist-function-randomlist-state-name-src-mq3-botlib-ai-chat-output-ml-1758430518"></a>
### randomList

```ml
function randomList(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L135)

- [mq3.botlib.ai_chat_output.RandomList](Type-mq3-botlib-ai-chat-output-randomlist-973240048.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-randomvalue-function-randomvalue-state-src-mq3-botlib-ai-chat-output-ml-1294088169"></a>
### randomValue

```ml
function randomValue(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L47)

- [mq3.botlib.ai_chat_output.Reader](Type-mq3-botlib-ai-chat-output-reader-727736040.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-output-recent-time-const-recent-time-20-src-mq3-botlib-ai-chat-output-ml-1484942281"></a>
### RECENT_TIME

```ml
const RECENT_TIME = 20.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L22)

<a id="function-function-mq3-botlib-ai-chat-output-removetildes-function-removetildes-value-src-mq3-botlib-ai-chat-output-ml-870894385"></a>
### removeTildes

```ml
function removeTildes(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L217)

<a id="function-function-mq3-botlib-ai-chat-output-replacereplysynonyms-function-replacereplysynonyms-state-value-context-src-mq3-botlib-ai-chat-output-ml-1714997793"></a>
### replaceReplySynonyms

```ml
function replaceReplySynonyms(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L136)

<a id="function-function-mq3-botlib-ai-chat-output-replaceweightedsynonyms-function-replaceweightedsynonyms-state-value-context-src-mq3-botlib-ai-chat-output-ml-1023633251"></a>
### replaceWeightedSynonyms

```ml
function replaceWeightedSynonyms(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L147)

- [mq3.botlib.ai_chat_output.Reply](Type-mq3-botlib-ai-chat-output-reply-23062993.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-replychat-function-replychat-state-handle-message-mcontext-vcontext-variables-src-mq3-botlib-ai-chat-output-ml-1737811658"></a>
### replyChat

```ml
function replyChat(state, handle, message, mcontext, vcontext, variables)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `mcontext` | `dynamic` | — |  |
| `vcontext` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L206)

- [mq3.botlib.ai_chat_output.ReplyKey](Type-mq3-botlib-ai-chat-output-replykey-1205241592.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-replymatches-function-replymatches-reply-cs-message-match-src-mq3-botlib-ai-chat-output-ml-1375409862"></a>
### replyMatches

```ml
function replyMatches(reply, cs, message, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reply` | `dynamic` | — |  |
| `cs` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L197)

<a id="function-function-mq3-botlib-ai-chat-output-setup-function-setup-state-nochat-src-mq3-botlib-ai-chat-output-ml-240457386"></a>
### setup

```ml
function setup(state, noChat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `noChat` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L115)

<a id="function-function-mq3-botlib-ai-chat-output-shutdown-function-shutdown-state-src-mq3-botlib-ai-chat-output-ml-671823217"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L45)

- [mq3.botlib.ai_chat_output.State](Type-mq3-botlib-ai-chat-output-state-428510952.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-chat-output-ml-1893910013"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L225)

<a id="function-function-mq3-botlib-ai-chat-output-unread-function-unread-reader-value-src-mq3-botlib-ai-chat-output-ml-670899120"></a>
### unread

```ml
function unread(reader, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L53)
