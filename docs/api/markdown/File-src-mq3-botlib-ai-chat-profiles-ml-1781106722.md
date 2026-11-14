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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `piece` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L46)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-blerr-cannotloadichat-const-blerr-cannotloadichat-publicheaders-blerr-cannotloadichat-src-mq3-botlib-ai-chat-profiles-ml-1687316334"></a>
### BLERR_CANNOTLOADICHAT

```ml
const BLERR_CANNOTLOADICHAT = publicHeaders.BLERR_CANNOTLOADICHAT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L15)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-blerr-noerror-const-blerr-noerror-publicheaders-blerr-noerror-src-mq3-botlib-ai-chat-profiles-ml-1092420923"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = publicHeaders.BLERR_NOERROR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L14)

<a id="function-function-mq3-botlib-ai-chat-profiles-botpath-function-botpath-name-src-mq3-botlib-ai-chat-profiles-ml-1416474883"></a>
### botPath

```ml
function botPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L37)

- [mq3.botlib.ai_chat_profiles.Cached](Type-mq3-botlib-ai-chat-profiles-cached-416331736.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-cachedprofile-function-cachedprofile-state-filename-chatname-src-mq3-botlib-ai-chat-profiles-ml-627699675"></a>
### cachedProfile

```ml
function cachedProfile(state, filename, chatName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `chatName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L107)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-chat-genderfemale-const-chat-genderfemale-publicheaders-chat-genderfemale-src-mq3-botlib-ai-chat-profiles-ml-813431034"></a>
### CHAT_GENDERFEMALE

```ml
const CHAT_GENDERFEMALE = publicHeaders.CHAT_GENDERFEMALE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L17)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-chat-genderless-const-chat-genderless-publicheaders-chat-genderless-src-mq3-botlib-ai-chat-profiles-ml-1324900677"></a>
### CHAT_GENDERLESS

```ml
const CHAT_GENDERLESS = publicHeaders.CHAT_GENDERLESS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L16)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-chat-gendermale-const-chat-gendermale-publicheaders-chat-gendermale-src-mq3-botlib-ai-chat-profiles-ml-1129552525"></a>
### CHAT_GENDERMALE

```ml
const CHAT_GENDERMALE = publicHeaders.CHAT_GENDERMALE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L18)

- [mq3.botlib.ai_chat_profiles.ChatType](Type-mq3-botlib-ai-chat-profiles-chattype-897042392.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-clearcache-function-clearcache-state-src-mq3-botlib-ai-chat-profiles-ml-485682533"></a>
### clearCache

```ml
function clearCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L131)

- [mq3.botlib.ai_chat_profiles.Component](Type-mq3-botlib-ai-chat-profiles-component-399226877.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-profiles-component-fixed-const-component-fixed-1-src-mq3-botlib-ai-chat-profiles-ml-113256772"></a>
### COMPONENT_FIXED

```ml
const COMPONENT_FIXED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L22)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-component-random-const-component-random-3-src-mq3-botlib-ai-chat-profiles-ml-1602466990"></a>
### COMPONENT_RANDOM

```ml
const COMPONENT_RANDOM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L24)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-component-variable-const-component-variable-2-src-mq3-botlib-ai-chat-profiles-ml-2076940765"></a>
### COMPONENT_VARIABLE

```ml
const COMPONENT_VARIABLE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L23)

<a id="function-function-mq3-botlib-ai-chat-profiles-create-function-create-resourcepools-context-readfn-src-mq3-botlib-ai-chat-profiles-ml-307114986"></a>
### create

```ml
function create(resourcePools, context, readFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `resourcePools` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L35)

<a id="function-function-mq3-botlib-ai-chat-profiles-fail-function-fail-message-src-mq3-botlib-ai-chat-profiles-ml-1981254663"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L34)

<a id="function-function-mq3-botlib-ai-chat-profiles-loadchatfile-function-loadchatfile-state-handle-filename-chatname-src-mq3-botlib-ai-chat-profiles-ml-799955511"></a>
### loadChatFile

```ml
function loadChatFile(state, handle, filename, chatName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `chatName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L111)

- [mq3.botlib.ai_chat_profiles.Loader](Type-mq3-botlib-ai-chat-profiles-loader-1934258233.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-loadtext-function-loadtext-loader-name-src-mq3-botlib-ai-chat-profiles-ml-1455325212"></a>
### loadText

```ml
function loadText(loader, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loader` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L41)

<a id="function-function-mq3-botlib-ai-chat-profiles-marker-function-marker-src-mq3-botlib-ai-chat-profiles-ml-727875724"></a>
### marker

```ml
function marker()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L45)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-max-chat-name-const-max-chat-name-32-src-mq3-botlib-ai-chat-profiles-ml-1022498206"></a>
### MAX_CHAT_NAME

```ml
const MAX_CHAT_NAME = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L20)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-max-message-size-const-max-message-size-publicheaders-max-message-size-src-mq3-botlib-ai-chat-profiles-ml-1030760066"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = publicHeaders.MAX_MESSAGE_SIZE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L19)

- [mq3.botlib.ai_chat_profiles.Message](Type-mq3-botlib-ai-chat-profiles-message-1986615917.md) — struct
<a id="constant-constant-mq3-botlib-ai-chat-profiles-op-load-chat-file-const-op-load-chat-file-522-src-mq3-botlib-ai-chat-profiles-ml-645099120"></a>
### OP_LOAD_CHAT_FILE

```ml
const OP_LOAD_CHAT_FILE = 522
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L11)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-op-set-chat-gender-const-op-set-chat-gender-523-src-mq3-botlib-ai-chat-profiles-ml-432394397"></a>
### OP_SET_CHAT_GENDER

```ml
const OP_SET_CHAT_GENDER = 523
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-profiles-op-set-chat-name-const-op-set-chat-name-524-src-mq3-botlib-ai-chat-profiles-ml-369737078"></a>
### OP_SET_CHAT_NAME

```ml
const OP_SET_CHAT_NAME = 524
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L13)

<a id="function-function-mq3-botlib-ai-chat-profiles-parseprofile-function-parseprofile-state-filename-wantedname-src-mq3-botlib-ai-chat-profiles-ml-1224733952"></a>
### parseProfile

```ml
function parseProfile(state, filename, wantedName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `wantedName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L93)

<a id="function-function-mq3-botlib-ai-chat-profiles-parseselectedchat-function-parseselectedchat-registry-source-filename-chatname-src-mq3-botlib-ai-chat-profiles-ml-1665261154"></a>
### parseSelectedChat

```ml
function parseSelectedChat(registry, source, filename, chatName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `chatName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L84)

<a id="function-function-mq3-botlib-ai-chat-profiles-parsetype-function-parsetype-registry-source-src-mq3-botlib-ai-chat-profiles-ml-806363952"></a>
### parseType

```ml
function parseType(registry, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L72)

- [mq3.botlib.ai_chat_profiles.Profile](Type-mq3-botlib-ai-chat-profiles-profile-2065744819.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-readmessage-function-readmessage-registry-source-first-src-mq3-botlib-ai-chat-profiles-ml-925377962"></a>
### readMessage

```ml
function readMessage(registry, source, first)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L49)

<a id="function-function-mq3-botlib-ai-chat-profiles-setchatgender-function-setchatgender-state-handle-gender-src-mq3-botlib-ai-chat-profiles-ml-1535195464"></a>
### setChatGender

```ml
function setChatGender(state, handle, gender)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `gender` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L119)

<a id="function-function-mq3-botlib-ai-chat-profiles-setchatname-function-setchatname-state-handle-name-client-src-mq3-botlib-ai-chat-profiles-ml-559149717"></a>
### setChatName

```ml
function setChatName(state, handle, name, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L123)

<a id="function-function-mq3-botlib-ai-chat-profiles-setreload-function-setreload-state-value-src-mq3-botlib-ai-chat-profiles-ml-1283853004"></a>
### setReload

```ml
function setReload(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L36)

<a id="function-function-mq3-botlib-ai-chat-profiles-skipblock-function-skipblock-registry-source-src-mq3-botlib-ai-chat-profiles-ml-1684126462"></a>
### skipBlock

```ml
function skipBlock(registry, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L69)

- [mq3.botlib.ai_chat_profiles.State](Type-mq3-botlib-ai-chat-profiles-state-192328531.md) — struct
<a id="function-function-mq3-botlib-ai-chat-profiles-typebyname-function-typebyname-profile-name-src-mq3-botlib-ai-chat-profiles-ml-1357555370"></a>
### typeByName

```ml
function typeByName(profile, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profile` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L128)
