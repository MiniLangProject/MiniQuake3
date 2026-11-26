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
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-botlib-ai-chat-output-chat-all-const-chat-all-0-src-mq3-botlib-ai-chat-output-ml-815428823"></a>
### CHAT_ALL

```ml
const CHAT_ALL = 0
```

Chat destination selecting all players.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L24)

<a id="constant-constant-mq3-botlib-ai-chat-output-chat-team-const-chat-team-1-src-mq3-botlib-ai-chat-output-ml-1273494104"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```

Chat destination selecting the bot's team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L26)

<a id="constant-constant-mq3-botlib-ai-chat-output-chat-tell-const-chat-tell-2-src-mq3-botlib-ai-chat-output-ml-934111955"></a>
### CHAT_TELL

```ml
const CHAT_TELL = 2
```

Chat destination selecting one explicitly addressed client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L28)

<a id="function-function-mq3-botlib-ai-chat-output-chatlength-function-chatlength-state-handle-src-mq3-botlib-ai-chat-output-ml-275297835"></a>
### chatLength

```ml
function chatLength(state, handle)
```

Apply `mq3.botlib.ai_chat_output.chatState` while evaluating `chatLength`. Return paths include `len(bytes(cs.chatMessage))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `profiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L400)

<a id="function-function-mq3-botlib-ai-chat-output-chatstate-function-chatstate-state-handle-src-mq3-botlib-ai-chat-output-ml-817479493"></a>
### chatState

```ml
function chatState(state, handle)
```

Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `chatState`. Return paths include `pools.chatState(state.profiles.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `profiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L342)

<a id="function-function-mq3-botlib-ai-chat-output-choose-function-choose-messages-state-updaterecent-src-mq3-botlib-ai-chat-output-ml-1130011067"></a>
### choose

```ml
function choose(messages, state, updateRecent)
```

Apply `mq3.botlib.ai_chat_output.now` and `mq3.botlib.ai_chat_output.randomValue` while evaluating `choose`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messages` | `dynamic` | — | Value used by `choose` in `for each value in messages if value.recentTime<=time then available=available+[value] end if end for`. |
| `state` | `dynamic` | — | AI chat output state; accesses `timeFn` and `context`. |
| `updateRecent` | `dynamic` | — | Value used by `choose` in `if updateRecent then value.recentTime=time+RECENT_TIME end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L249)

<a id="function-function-mq3-botlib-ai-chat-output-choosereply-function-choosereply-messages-state-src-mq3-botlib-ai-chat-output-ml-489841423"></a>
### chooseReply

```ml
function chooseReply(messages, state)
```

Preserve BotReplyChat's released loop order: --num is evaluated before the recent-message test, unlike BotChooseInitialChatMessage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messages` | `dynamic` | — | Value used by `chooseReply` in `for each value in messages if value.recentTime<=time then available=available+1 end if end for`. |
| `state` | `dynamic` | — | AI chat output state; accesses `timeFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L258)

<a id="function-function-mq3-botlib-ai-chat-output-clear-function-clear-state-src-mq3-botlib-ai-chat-output-ml-2068968619"></a>
### clear

```ml
function clear(state)
```

Update `state.randomLists`, `state.replies` and `state.loaded` during `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `randomLists`, `replies` and `loaded`. May update `state.randomLists`, `state.replies` and `state.loaded` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L132)

<a id="function-function-mq3-botlib-ai-chat-output-clonematch-function-clonematch-value-src-mq3-botlib-ai-chat-output-ml-1816958325"></a>
### cloneMatch

```ml
function cloneMatch(value)
```

Build the `mq3.botlib.ai_chat_matches.Match` result for `cloneMatch`. Return paths include `matches.Match(value.string,value.type,value.subtype,offsets,lengths)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `offsets`, `lengths`, `string`, `type` and `subtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L336)

<a id="function-function-mq3-botlib-ai-chat-output-componentsfromencoded-function-componentsfromencoded-value-src-mq3-botlib-ai-chat-output-ml-18818501"></a>
### componentsFromEncoded

```ml
function componentsFromEncoded(value)
```

Decode chat control markers into fixed text, variable and random-list message components.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L310)

<a id="function-function-mq3-botlib-ai-chat-output-construct-function-construct-state-message-variables-context-vcontext-reply-src-mq3-botlib-ai-chat-output-ml-1953263453"></a>
### construct

```ml
function construct(state, message, variables, context, vcontext, reply)
```

Apply `mq3.botlib.ai_chat_output.expandOnce`, `mq3.botlib.ai_chat_output.replaceWeightedSynonyms` and `mq3.botlib.ai_chat_output.componentsFromEncoded` while evaluating `construct`. Return paths include `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `strings`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |
| `vcontext` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |
| `reply` | `dynamic` | — | Value used by `expandOnce` in `if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L327)

<a id="function-function-mq3-botlib-ai-chat-output-create-function-create-profilestate-stringstate-actions-context-readfn-timefn-randomfn-src-mq3-botlib-ai-chat-output-ml-554345536"></a>
### create

```ml
function create(profileState, stringState, actions, context, readFn, timeFn, randomFn)
```

Create a `mq3.botlib.ai_chat_output.State` record, initializing `profiles` from `profileState`, `strings` from `stringState` and `actions` from `actions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profileState` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_output.State.profiles`. |
| `stringState` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_output.State.strings`. |
| `actions` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_output.State.actions`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |
| `timeFn` | `dynamic` | — | Callback that supplies the current botlib time. |
| `randomFn` | `dynamic` | — | Callback that supplies the random value used by selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L129)

<a id="function-function-mq3-botlib-ai-chat-output-ensureloaded-function-ensureloaded-state-src-mq3-botlib-ai-chat-output-ml-1223835293"></a>
### ensureLoaded

```ml
function ensureLoaded(state)
```

Forward `ensureLoaded` to `mq3.botlib.ai_chat_output.setup` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `loaded`, `strings`, `randomLists` and `replies`. May update `state.randomLists`, `state.replies` and `state.loaded` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L243)

<a id="function-function-mq3-botlib-ai-chat-output-enterchat-function-enterchat-state-handle-clientto-sendto-src-mq3-botlib-ai-chat-output-ml-1695903182"></a>
### enterChat

```ml
function enterChat(state, handle, clientTo, sendTo)
```

Apply `mq3.botlib.ai_chat_output.chatState`, `mq3.botlib.ai_chat_output.removeTildes` and `mq3.botlib.elementary_actions.command` while evaluating `enterChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `actions`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `clientTo` | `dynamic` | — | Value passed as argument 1 to `str`. |
| `sendTo` | `dynamic` | — | Value used by `enterChat` in `if sendTo==CHAT_TEAM then result=ea.command(state.actions,cs.client,"say_team "+message) else if sendTo==CHAT_TE...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L411)

<a id="function-function-mq3-botlib-ai-chat-output-expandonce-function-expandonce-state-components-variables-vcontext-reply-src-mq3-botlib-ai-chat-output-ml-15968389"></a>
### expandOnce

```ml
function expandOnce(state, components, variables, vcontext, reply)
```

Apply `mq3.botlib.ai_chat_output.replaceReplySynonyms`, `mq3.botlib.ai_chat_strings.replaceSynonyms` and `mq3.botlib.ai_chat_output.randomList` while evaluating `expandOnce`. Return paths include `[output,expanded]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `strings`. |
| `components` | `dynamic` | — | Value used by `expandOnce` in `for each component in components`. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `vcontext` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |
| `reply` | `dynamic` | — | Value used by `expandOnce` in `if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L297)

<a id="function-function-mq3-botlib-ai-chat-output-expect-function-expect-reader-text-src-mq3-botlib-ai-chat-output-ml-901166554"></a>
### expect

```ml
function expect(reader, text)
```

Apply `mq3.botlib.ai_chat_output.next` while evaluating `expect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry` and `source`. May update `reader.pending` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L159)

<a id="function-function-mq3-botlib-ai-chat-output-fail-function-fail-message-src-mq3-botlib-ai-chat-output-ml-337632423"></a>
### fail

```ml
function fail(message)
```

Construct error `7574` with diagnostic text `"AI chat output: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L120)

<a id="function-function-mq3-botlib-ai-chat-output-initialchat-function-initialchat-state-handle-type-context-variables-src-mq3-botlib-ai-chat-output-ml-945256575"></a>
### initialChat

```ml
function initialChat(state, handle, type, context, variables)
```

Apply `mq3.botlib.ai_chat_output.chatState`, `mq3.botlib.ai_chat_output.ensureLoaded` and `mq3.botlib.ai_chat_profiles.typeByName` while evaluating `initialChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `profiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `type` | `dynamic` | — | Name used to identify the requested entry. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L349)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-and-const-key-and-1-src-mq3-botlib-ai-chat-output-ml-2032748152"></a>
### KEY_AND

```ml
const KEY_AND = 1
```

Reply-chat key requiring this match condition in addition to the others.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L35)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-botnames-const-key-botnames-32-src-mq3-botlib-ai-chat-output-ml-1217424628"></a>
### KEY_BOTNAMES

```ml
const KEY_BOTNAMES = 32
```

Reply-chat key matching one of the available bot names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L45)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-female-const-key-female-64-src-mq3-botlib-ai-chat-output-ml-1106492535"></a>
### KEY_FEMALE

```ml
const KEY_FEMALE = 64
```

Reply-chat key requiring the female chat-gender setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L47)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-genderless-const-key-genderless-256-src-mq3-botlib-ai-chat-output-ml-1158711660"></a>
### KEY_GENDERLESS

```ml
const KEY_GENDERLESS = 256
```

Reply-chat key requiring a neutral chat-gender setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L51)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-male-const-key-male-128-src-mq3-botlib-ai-chat-output-ml-717684490"></a>
### KEY_MALE

```ml
const KEY_MALE = 128
```

Reply-chat key requiring the male chat-gender setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L49)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-name-const-key-name-4-src-mq3-botlib-ai-chat-output-ml-662266633"></a>
### KEY_NAME

```ml
const KEY_NAME = 4
```

Reply-chat key matching the bot's configured name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L39)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-not-const-key-not-2-src-mq3-botlib-ai-chat-output-ml-2084856135"></a>
### KEY_NOT

```ml
const KEY_NOT = 2
```

Reply-chat key excluding messages that satisfy the specified condition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L37)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-string-const-key-string-8-src-mq3-botlib-ai-chat-output-ml-1110176817"></a>
### KEY_STRING

```ml
const KEY_STRING = 8
```

Reply-chat key matching a literal string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L41)

<a id="constant-constant-mq3-botlib-ai-chat-output-key-variables-const-key-variables-16-src-mq3-botlib-ai-chat-output-ml-1761722582"></a>
### KEY_VARIABLES

```ml
const KEY_VARIABLES = 16
```

Reply-chat key matching variable-bearing message templates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L43)

<a id="function-function-mq3-botlib-ai-chat-output-keyresult-function-keyresult-key-cs-message-match-src-mq3-botlib-ai-chat-output-ml-575459189"></a>
### keyResult

```ml
function keyResult(key, cs, message, match)
```

Apply `mq3.botlib.ai_chat_matches.stringContains`, `mq3.botlib.ai_chat_matches.stringsMatch` and `mq3.botlib.ai_chat_strings.findWord` while evaluating `keyResult`. Return paths include `chatStrings.findWord(message,key.text,0)>=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key record; accesses `flags`, `text` and `pieces`. |
| `cs` | `dynamic` | — | Cs record; accesses `name` and `gender`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `string` and `lengths`. May update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L357)

- [mq3.botlib.ai_chat_output.Loader](Type-mq3-botlib-ai-chat-output-loader-1396766644.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-output-ml-143972578"></a>
### loadText

```ml
function loadText(loader, name)
```

Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_output.loadText`. Return paths include `loader.state.readFn(loader.state.context,profiles.botPath(name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — | Loader record; accesses `state`. May update `loader.state.fileReads` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L145)

<a id="constant-constant-mq3-botlib-ai-chat-output-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-output-ml-115876988"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```

Maximum character capacity of a bot chat or console message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L32)

<a id="function-function-mq3-botlib-ai-chat-output-message-function-message-reader-first-src-mq3-botlib-ai-chat-output-ml-386215889"></a>
### message

```ml
function message(reader, first)
```

Forward `message` to `mq3.botlib.ai_chat_profiles.readMessage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `source`. |
| `first` | `dynamic` | — | Value used by `readMessage` in `token=first`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L163)

<a id="function-function-mq3-botlib-ai-chat-output-next-function-next-reader-src-mq3-botlib-ai-chat-output-ml-1308475629"></a>
### next

```ml
function next(reader)
```

Set `reader.pending` to `void` in `mq3.botlib.ai_chat_output.next`. Return paths include `pc.read(reader.registry,reader.source)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry` and `source`. May update `reader.pending` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L151)

<a id="function-function-mq3-botlib-ai-chat-output-now-function-now-state-src-mq3-botlib-ai-chat-output-ml-2100061129"></a>
### now

```ml
function now(state)
```

Use `state.timeFn` to perform `now`. Return paths include `state.timeFn(state.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `timeFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L138)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-chat-length-const-op-chat-length-515-src-mq3-botlib-ai-chat-output-ml-228905498"></a>
### OP_CHAT_LENGTH

```ml
const OP_CHAT_LENGTH = 515
```

Bot-library syscall identifier for chat length.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L20)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-enter-chat-const-op-enter-chat-516-src-mq3-botlib-ai-chat-output-ml-1055847597"></a>
### OP_ENTER_CHAT

```ml
const OP_ENTER_CHAT = 516
```

Bot-library syscall identifier for enter chat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L22)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-initial-chat-const-op-initial-chat-513-src-mq3-botlib-ai-chat-output-ml-628437800"></a>
### OP_INITIAL_CHAT

```ml
const OP_INITIAL_CHAT = 513
```

Bot-library syscall identifier for initial chat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L16)

<a id="constant-constant-mq3-botlib-ai-chat-output-op-reply-chat-const-op-reply-chat-514-src-mq3-botlib-ai-chat-output-ml-2018837995"></a>
### OP_REPLY_CHAT

```ml
const OP_REPLY_CHAT = 514
```

Bot-library syscall identifier for reply chat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L18)

<a id="function-function-mq3-botlib-ai-chat-output-parserandomlists-function-parserandomlists-state-src-mq3-botlib-ai-chat-output-ml-1945906485"></a>
### parseRandomLists

```ml
function parseRandomLists(state)
```

Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.botlib.ai_chat_output.next` while evaluating `parseRandomLists`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_output.Loader.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L167)

<a id="function-function-mq3-botlib-ai-chat-output-parsereplies-function-parsereplies-state-src-mq3-botlib-ai-chat-output-ml-1080962801"></a>
### parseReplies

```ml
function parseReplies(state)
```

Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.botlib.ai_chat_output.next` while evaluating `parseReplies`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_output.Loader.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L213)

<a id="function-function-mq3-botlib-ai-chat-output-parsereplykey-function-parsereplykey-reader-src-mq3-botlib-ai-chat-output-ml-1007510233"></a>
### parseReplyKey

```ml
function parseReplyKey(reader)
```

Build the `mq3.botlib.ai_chat_output.ReplyKey` result for `parseReplyKey`. Return paths include `ReplyKey(flags|KEY_STRING,token.text,[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry` and `source`. May update `reader.pending` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L197)

<a id="function-function-mq3-botlib-ai-chat-output-parsereplypieces-function-parsereplypieces-reader-src-mq3-botlib-ai-chat-output-ml-1774211801"></a>
### parseReplyPieces

```ml
function parseReplyPieces(reader)
```

Apply `mq3.botlib.ai_chat_output.next` and `mq3.botlib.ai_chat_output.unread` while evaluating `parseReplyPieces`. Return paths include `fail("invalid reply match separator")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry` and `source`. May update `reader.pending` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L180)

<a id="function-function-mq3-botlib-ai-chat-output-randomlist-function-randomlist-state-name-src-mq3-botlib-ai-chat-output-ml-1758430518"></a>
### randomList

```ml
function randomList(state, name)
```

Find a random-chat list by its exact name, returning void when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `randomLists`. |
| `name` | `dynamic` | — | Lookup text matched against `value.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L265)

- [mq3.botlib.ai_chat_output.RandomList](Type-mq3-botlib-ai-chat-output-randomlist-973240048.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-randomvalue-function-randomvalue-state-src-mq3-botlib-ai-chat-output-ml-1294088169"></a>
### randomValue

```ml
function randomValue(state)
```

Use `state.randomFn` to perform `randomValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `randomFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L141)

- [mq3.botlib.ai_chat_output.Reader](Type-mq3-botlib-ai-chat-output-reader-727736040.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-output-recent-time-const-recent-time-20-src-mq3-botlib-ai-chat-output-ml-1563256461"></a>
### RECENT_TIME

```ml
const RECENT_TIME = 20
```

Cooldown interval preventing recently used chat lines from being selected again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L30)

<a id="function-function-mq3-botlib-ai-chat-output-removetildes-function-removetildes-value-src-mq3-botlib-ai-chat-output-ml-870894385"></a>
### removeTildes

```ml
function removeTildes(value)
```

Remove single tilde markers and unescape doubled tildes in ai chat output text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L403)

<a id="function-function-mq3-botlib-ai-chat-output-replacereplysynonyms-function-replacereplysynonyms-state-value-context-src-mq3-botlib-ai-chat-output-ml-1714997793"></a>
### replaceReplySynonyms

```ml
function replaceReplySynonyms(state, value, context)
```

Apply `mq3.botlib.ai_chat_strings.ensureLoaded`, `mq3.botlib.ai_chat_strings.findWord` and `mq3.botlib.ai_chat_strings.replaceRange` while evaluating `replaceReplySynonyms`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `strings`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L270)

<a id="function-function-mq3-botlib-ai-chat-output-replaceweightedsynonyms-function-replaceweightedsynonyms-state-value-context-src-mq3-botlib-ai-chat-output-ml-1023633251"></a>
### replaceWeightedSynonyms

```ml
function replaceWeightedSynonyms(state, value, context)
```

Apply `mq3.botlib.ai_chat_strings.ensureLoaded`, `mq3.botlib.ai_chat_output.randomValue` and `mq3.botlib.ai_chat_strings.replaceWords` while evaluating `replaceWeightedSynonyms`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `strings`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L285)

- [mq3.botlib.ai_chat_output.Reply](Type-mq3-botlib-ai-chat-output-reply-23062993.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-replychat-function-replychat-state-handle-message-mcontext-vcontext-variables-src-mq3-botlib-ai-chat-output-ml-1737811658"></a>
### replyChat

```ml
function replyChat(state, handle, message, mcontext, vcontext, variables)
```

Apply `mq3.botlib.ai_chat_output.chatState`, `mq3.botlib.ai_chat_output.ensureLoaded` and `mq3.botlib.ai_chat_output.replyMatches` while evaluating `replyChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `replies`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `mcontext` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |
| `vcontext` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L387)

- [mq3.botlib.ai_chat_output.ReplyKey](Type-mq3-botlib-ai-chat-output-replykey-1205241592.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-replymatches-function-replymatches-reply-cs-message-match-src-mq3-botlib-ai-chat-output-ml-1375409862"></a>
### replyMatches

```ml
function replyMatches(reply, cs, message, match)
```

Apply `mq3.botlib.ai_chat_output.keyResult` while evaluating `replyMatches`. Return paths include `found`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reply` | `dynamic` | — | Reply record; accesses `keys`. |
| `cs` | `dynamic` | — | Cs record; accesses `name` and `gender`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `string` and `lengths`. May update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L371)

<a id="function-function-mq3-botlib-ai-chat-output-setup-function-setup-state-nochat-src-mq3-botlib-ai-chat-output-ml-240457386"></a>
### setup

```ml
function setup(state, noChat)
```

Update `state.randomLists`, `state.replies` and `state.loaded` during `setup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `loaded`, `strings`, `randomLists` and `replies`. May update `state.randomLists`, `state.replies` and `state.loaded` in place. |
| `noChat` | `dynamic` | — | Value used by `setup` in `if not noChat then replies=parseReplies(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L234)

<a id="function-function-mq3-botlib-ai-chat-output-shutdown-function-shutdown-state-src-mq3-botlib-ai-chat-output-ml-671823217"></a>
### shutdown

```ml
function shutdown(state)
```

Forward `shutdown` to `mq3.botlib.ai_chat_output.clear` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `randomLists`, `replies` and `loaded`. May update `state.randomLists`, `state.replies` and `state.loaded` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L135)

- [mq3.botlib.ai_chat_output.State](Type-mq3-botlib-ai-chat-output-state-428510952.md) — struct
<a id="function-function-mq3-botlib-ai-chat-output-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-chat-output-ml-1893910013"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op>=OP_INITIAL_CHAT and op<=OP_ENTER_CHAT` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L418)

<a id="function-function-mq3-botlib-ai-chat-output-unread-function-unread-reader-value-src-mq3-botlib-ai-chat-output-ml-670899120"></a>
### unread

```ml
function unread(reader, value)
```

Set `reader.pending` to `value` in `mq3.botlib.ai_chat_output.unread`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`. May update `reader.pending` in place. |
| `value` | `dynamic` | — | Value used by `unread` in `reader.pending=value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L155)
