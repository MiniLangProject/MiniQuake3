# `src/mq3/botlib/ai_chat_profiles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_profiles`](Package-mq3-botlib-ai-chat-profiles-1030943412.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/public_headers.ml` as `publicHeaders` → [src/mq3/botlib/public_headers.ml](File-src-mq3-botlib-public-headers-ml-206085358.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-chat-profiles-appendchecked-function-appendchecked-text-piece-src-mq3-botlib-ai-chat-profiles-ml-1340063353"></a>
### appendChecked

```ml
function appendChecked(text, piece)
```

Append a chat-message fragment and reject text reaching the fixed message-buffer capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `piece` | `dynamic` | — | Value used by `appendChecked` in `value=text+piece`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L135)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-blerr-cannotloadichat-const-blerr-cannotloadichat-publicheaders-blerr-cannotloadichat-src-mq3-botlib-ai-chat-profiles-ml-1687316334"></a>
### BLERR_CANNOTLOADICHAT

```ml
const BLERR_CANNOTLOADICHAT = publicHeaders.BLERR_CANNOTLOADICHAT
```

Bot-library error indicating that an initial-chat script could not be loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L20)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-blerr-noerror-const-blerr-noerror-publicheaders-blerr-noerror-src-mq3-botlib-ai-chat-profiles-ml-1092420923"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = publicHeaders.BLERR_NOERROR
```

Bot-library status indicating successful completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L18)

<a id="function-function-mq3-botlib-ai-chat-profiles-botpath-function-botpath-name-src-mq3-botlib-ai-chat-profiles-ml-1416474883"></a>
### botPath

```ml
function botPath(name)
```

Normalize a ai chat profiles resource path by removing leading slashes and ensuring the botfiles prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L119)

- [mq3.botlib.ai_chat_profiles.Cached](Type-mq3-botlib-ai-chat-profiles-cached-416331736.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-cachedprofile-function-cachedprofile-state-filename-chatname-src-mq3-botlib-ai-chat-profiles-ml-627699675"></a>
### cachedProfile

```ml
function cachedProfile(state, filename, chatName)
```

Find a cached chat profile by case-insensitive filename and profile name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat profiles state; accesses `cache`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `chatName` | `dynamic` | — | Named chat profile within the chat-definition file. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L219)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-chat-genderfemale-const-chat-genderfemale-publicheaders-chat-genderfemale-src-mq3-botlib-ai-chat-profiles-ml-813431034"></a>
### CHAT_GENDERFEMALE

```ml
const CHAT_GENDERFEMALE = publicHeaders.CHAT_GENDERFEMALE
```

Chat gender selector for female pronoun choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L24)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-chat-genderless-const-chat-genderless-publicheaders-chat-genderless-src-mq3-botlib-ai-chat-profiles-ml-1324900677"></a>
### CHAT_GENDERLESS

```ml
const CHAT_GENDERLESS = publicHeaders.CHAT_GENDERLESS
```

Chat gender selector for neutral or unspecified pronoun choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L22)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-chat-gendermale-const-chat-gendermale-publicheaders-chat-gendermale-src-mq3-botlib-ai-chat-profiles-ml-1129552525"></a>
### CHAT_GENDERMALE

```ml
const CHAT_GENDERMALE = publicHeaders.CHAT_GENDERMALE
```

Chat gender selector for male pronoun choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L26)

- [mq3.botlib.ai_chat_profiles.ChatType](Type-mq3-botlib-ai-chat-profiles-chattype-897042392.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-clearcache-function-clearcache-state-src-mq3-botlib-ai-chat-profiles-ml-485682533"></a>
### clearCache

```ml
function clearCache(state)
```

Set `state.cache` to `[]` in `mq3.botlib.ai_chat_profiles.clearCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat profiles state; accesses `cache`. May update `state.cache` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L262)

- [mq3.botlib.ai_chat_profiles.Component](Type-mq3-botlib-ai-chat-profiles-component-399226877.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-profiles-component-fixed-const-component-fixed-1-src-mq3-botlib-ai-chat-profiles-ml-113256772"></a>
### COMPONENT_FIXED

```ml
const COMPONENT_FIXED = 1
```

Chat-template component containing literal text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L33)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-component-random-const-component-random-3-src-mq3-botlib-ai-chat-profiles-ml-1602466990"></a>
### COMPONENT_RANDOM

```ml
const COMPONENT_RANDOM = 3
```

Chat-template component selecting a named random-text list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L37)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-component-variable-const-component-variable-2-src-mq3-botlib-ai-chat-profiles-ml-2076940765"></a>
### COMPONENT_VARIABLE

```ml
const COMPONENT_VARIABLE = 2
```

Chat-template component substituting a captured match variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L35)

<a id="function-function-mq3-botlib-ai-chat-profiles-create-function-create-resourcepools-context-readfn-src-mq3-botlib-ai-chat-profiles-ml-307114986"></a>
### create

```ml
function create(resourcePools, context, readFn)
```

Create a `mq3.botlib.ai_chat_profiles.State` record, initializing `pools` from `resourcePools`, `context` from `context` and `readFn` from `readFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `resourcePools` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_profiles.State.pools`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L112)

<a id="function-function-mq3-botlib-ai-chat-profiles-fail-function-fail-message-src-mq3-botlib-ai-chat-profiles-ml-1981254663"></a>
### fail

```ml
function fail(message)
```

Construct error `7570` with diagnostic text `"AI chat: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L107)

<a id="function-function-mq3-botlib-ai-chat-profiles-loadchatfile-function-loadchatfile-state-handle-filename-chatname-src-mq3-botlib-ai-chat-profiles-ml-799955511"></a>
### loadChatFile

```ml
function loadChatFile(state, handle, filename, chatName)
```

Set `state.cache` to `state.cache+[Cached(filename,chatName,profile)]` in `mq3.botlib.ai_chat_profiles.loadChatFile`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat profiles state; accesses `pools`, `reload` and `cache`. May update `state.cache` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `chatName` | `dynamic` | — | Named chat profile within the chat-definition file. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L228)

- [mq3.botlib.ai_chat_profiles.Loader](Type-mq3-botlib-ai-chat-profiles-loader-1934258233.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-profiles-ml-1455325212"></a>
### loadText

```ml
function loadText(loader, name)
```

Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_profiles.loadText`. Return paths include `loader.state.readFn(loader.state.context,botPath(name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — | Loader record; accesses `state`. May update `loader.state.fileReads` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L126)

<a id="function-function-mq3-botlib-ai-chat-profiles-marker-function-marker-src-mq3-botlib-ai-chat-profiles-ml-727875724"></a>
### marker

```ml
function marker()
```

Return the result of `decode(bytes(1,1))` for `marker`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L131)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-max-chat-name-const-max-chat-name-32-src-mq3-botlib-ai-chat-profiles-ml-1022498206"></a>
### MAX_CHAT_NAME

```ml
const MAX_CHAT_NAME = 32
```

Maximum length of a bot name used by the chat subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L30)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-max-message-size-const-max-message-size-publicheaders-max-message-size-src-mq3-botlib-ai-chat-profiles-ml-1030760066"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = publicHeaders.MAX_MESSAGE_SIZE
```

Maximum character capacity of a bot chat or console message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L28)

- [mq3.botlib.ai_chat_profiles.Message](Type-mq3-botlib-ai-chat-profiles-message-1986615917.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-profiles-op-load-chat-file-const-op-load-chat-file-522-src-mq3-botlib-ai-chat-profiles-ml-645099120"></a>
### OP_LOAD_CHAT_FILE

```ml
const OP_LOAD_CHAT_FILE = 522
```

Bot-library syscall identifier for load chat file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-op-set-chat-gender-const-op-set-chat-gender-523-src-mq3-botlib-ai-chat-profiles-ml-432394397"></a>
### OP_SET_CHAT_GENDER

```ml
const OP_SET_CHAT_GENDER = 523
```

Bot-library syscall identifier for set chat gender.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L14)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-op-set-chat-name-const-op-set-chat-name-524-src-mq3-botlib-ai-chat-profiles-ml-369737078"></a>
### OP_SET_CHAT_NAME

```ml
const OP_SET_CHAT_NAME = 524
```

Bot-library syscall identifier for set chat name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L16)

<a id="function-function-mq3-botlib-ai-chat-profiles-parseprofile-function-parseprofile-state-filename-wantedname-src-mq3-botlib-ai-chat-profiles-ml-1224733952"></a>
### parseProfile

```ml
function parseProfile(state, filename, wantedName)
```

Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.vm.pc_parser.read` while evaluating `parseProfile`. Return paths include `skipped`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_profiles.Loader.state`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `wantedName` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L201)

<a id="function-function-mq3-botlib-ai-chat-profiles-parseselectedchat-function-parseselectedchat-registry-source-filename-chatname-src-mq3-botlib-ai-chat-profiles-ml-1665261154"></a>
### parseSelectedChat

```ml
function parseSelectedChat(registry, source, filename, chatName)
```

Build the `mq3.botlib.ai_chat_profiles.Profile` result for `parseSelectedChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `chatName` | `dynamic` | — | Named chat profile within the chat-definition file. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L188)

<a id="function-function-mq3-botlib-ai-chat-profiles-parsetype-function-parsetype-registry-source-src-mq3-botlib-ai-chat-profiles-ml-806363952"></a>
### parseType

```ml
function parseType(registry, source)
```

Build the `mq3.botlib.ai_chat_profiles.ChatType` result for `parseType`. Return paths include `message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L171)

- [mq3.botlib.ai_chat_profiles.Profile](Type-mq3-botlib-ai-chat-profiles-profile-2065744819.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-readmessage-function-readmessage-registry-source-first-src-mq3-botlib-ai-chat-profiles-ml-925377962"></a>
### readMessage

```ml
function readMessage(registry, source, first)
```

Build the `mq3.botlib.ai_chat_profiles.Message` result for `readMessage`. Return paths include `fail("expected comma or semicolon in chat message, found "+separator.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `first` | `dynamic` | — | Value used by `readMessage` in `token=first`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L142)

<a id="function-function-mq3-botlib-ai-chat-profiles-setchatgender-function-setchatgender-state-handle-gender-src-mq3-botlib-ai-chat-profiles-ml-1535195464"></a>
### setChatGender

```ml
function setChatGender(state, handle, gender)
```

Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `setChatGender`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat profiles state; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `gender` | `dynamic` | — | Chat gender identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L240)

<a id="function-function-mq3-botlib-ai-chat-profiles-setchatname-function-setchatname-state-handle-name-client-src-mq3-botlib-ai-chat-profiles-ml-559149717"></a>
### setChatName

```ml
function setChatName(state, handle, name, client)
```

Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `setChatName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat profiles state; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `client` | `dynamic` | — | Value used by `setChatName` in `chatState.client=client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L249)

<a id="function-function-mq3-botlib-ai-chat-profiles-setreload-function-setreload-state-value-src-mq3-botlib-ai-chat-profiles-ml-1283853004"></a>
### setReload

```ml
function setReload(state, value)
```

Set `state.reload` to `value!=0` in `mq3.botlib.ai_chat_profiles.setReload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat profiles state; accesses `reload`. May update `state.reload` in place. |
| `value` | `dynamic` | — | Value used by `setReload` in `if state!=void then state.reload=value!=0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L116)

<a id="function-function-mq3-botlib-ai-chat-profiles-skipblock-function-skipblock-registry-source-src-mq3-botlib-ai-chat-profiles-ml-1684126462"></a>
### skipBlock

```ml
function skipBlock(registry, source)
```

Apply `mq3.vm.pc_parser.read` while evaluating `skipBlock`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L165)

- [mq3.botlib.ai_chat_profiles.State](Type-mq3-botlib-ai-chat-profiles-state-192328531.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-typebyname-function-typebyname-profile-name-src-mq3-botlib-ai-chat-profiles-ml-1357555370"></a>
### typeByName

```ml
function typeByName(profile, name)
```

Find a chat message type by an ASCII case-insensitive name, returning void when the profile or type is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profile` | `dynamic` | — | Profile record; accesses `types`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L257)
