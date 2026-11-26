# `src/mq3/client/cgame_servercmds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_servercmds`](Package-mq3-client-cgame-servercmds-1183716955.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-servercmds-action-function-action-boundary-kind-value-value2-number-emit-src-mq3-client-cgame-servercmds-ml-712778282"></a>
### action

```ml
function action(boundary, kind, value, value2, number, emit)
```

Creates a `mq3.client.cgame_servercmds.Action` record. Assigns `boundary` from `boundary`, `kind` from `kind`, `value` from `value`, `value2` from `value2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — | Value used to initialize `Action.boundary`. |
| `kind` | `dynamic` | — | Value used to initialize `Action.kind`. |
| `value` | `dynamic` | — | Value used to initialize `Action.value`. |
| `value2` | `dynamic` | — | Value used to initialize `Action.value2`. |
| `number` | `dynamic` | — | Value used to initialize `Action.number`. |
| `emit` | `dynamic` | — | Value used to initialize `Action.dispatched`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L420)

- [mq3.client.cgame_servercmds.Action](Type-mq3-client-cgame-servercmds-action-1170717877.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-add-function-add-effect-boundary-kind-value-value2-number-emit-src-mq3-client-cgame-servercmds-ml-534581999"></a>
### add

```ml
function add(effect, boundary, kind, value, value2, number, emit)
```

Updates `effect.actions` during client game servercmds `add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `effect.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `value` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`. |
| `value2` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`. |
| `number` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`. |
| `emit` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L432)

<a id="function-function-mq3-client-cgame-servercmds-addbufferedvoicechat-function-addbufferedvoicechat-state-vchat-emit-src-mq3-client-cgame-servercmds-ml-855109622"></a>
### addBufferedVoiceChat

```ml
function addBufferedVoiceChat(state, vchat, emit)
```

CG_AddBufferedVoiceChat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.voiceBuffer[state.voiceChatBufferIn]`, `state.voiceChatBufferIn`, `state.voiceChatBufferOut`. |
| `vchat` | `dynamic` | — | Value used by `state.voiceBuffer[state.voiceChatBufferIn]=vchat`. |
| `emit` | `dynamic` | — | Value used by `if state.voiceChatBufferIn==state.voiceChatBufferOut then nested=playVoiceChat(state,state.voiceBuffer[state.voiceChatBufferOut],emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L691)

<a id="function-function-mq3-client-cgame-servercmds-addtoteamchat-function-addtoteamchat-state-text-src-mq3-client-cgame-servercmds-ml-1057302260"></a>
### addToTeamChat

```ml
function addToTeamChat(state, text)
```

CG_AddToTeamChat, including color carry and last-space wrapping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.teamChatPos`, `state.teamLastChatPos`, `state.teamChatMsgs[state.teamChatPos%height]`, `state.teamChatMsgTimes[state.teamChatPos%height]`. |
| `text` | `dynamic` | — | Text consumed or emitted by `addToTeamChat` in the client game servercmds path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L557)

<a id="function-function-mq3-client-cgame-servercmds-arg-function-arg-args-index-src-mq3-client-cgame-servercmds-ml-455799667"></a>
### arg

```ml
function arg(args, index)
```

Evaluates client game servercmds `arg` and returns `""`, `args[index]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Sequence read at `args[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(args)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L436)

<a id="extern_function-extern-function-mq3-client-cgame-servercmds-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-servercmds-ml-2035448370"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game servercmds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L13)

- [mq3.client.cgame_servercmds.BufferedVoice](Type-mq3-client-cgame-servercmds-bufferedvoice-600835574.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-cachehead-function-cachehead-state-name-index-src-mq3-client-cgame-servercmds-ml-1209603924"></a>
### cacheHead

```ml
function cacheHead(state, name, index)
```

Updates `state.headVoices` during client game servercmds `cacheHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.headVoices`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game servercmds resource. |
| `index` | `dynamic` | — | Value assigned to `pair.voiceChatNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L651)

<a id="function-function-mq3-client-cgame-servercmds-client-function-client-src-mq3-client-cgame-servercmds-ml-1763235438"></a>
### client

```ml
function client()
```

Creates a `mq3.client.cgame_servercmds.Client` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L404)

- [mq3.client.cgame_servercmds.Client](Type-mq3-client-cgame-servercmds-client-547319872.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-cmdargv-function-cmdargv-args-index-src-mq3-client-cgame-servercmds-ml-64623187"></a>
### cmdArgv

```ml
function cmdArgv(args, index)
```

Cmd_Argv compatibility name retained for the original candidate inventory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Argument 1 of `mq3.client.cgame_servercmds.arg`. |
| `index` | `dynamic` | — | Argument 2 of `mq3.client.cgame_servercmds.arg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L769)

<a id="function-function-mq3-client-cgame-servercmds-configstringmodified-function-configstringmodified-state-num-value-emit-src-mq3-client-cgame-servercmds-ml-659706539"></a>
### configStringModified

```ml
function configStringModified(state, num, value, emit)
```

CG_ConfigStringModified. The engine has already integrated the new value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.configstrings[num]`, `state.scores1`, `state.scores2`, `state.levelStartTime` and additional values. |
| `num` | `dynamic` | — | Value used by `if num<0 or num>=len(state.configstrings) then return error(7820,"cg_servercmds: bad configstring index") end if`. |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `configStringModified`. |
| `emit` | `dynamic` | — | Value used by `if num==CS_MUSIC then add(effect,"audio","start-music",value,"",0,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L525)

<a id="function-function-mq3-client-cgame-servercmds-create-function-create-src-mq3-client-cgame-servercmds-ml-1267341318"></a>
### create

```ml
function create()
```

Calls `mq3.client.cgame_servercmds.client`, `mq3.client.cgame_servercmds.State` from client game servercmds `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L406)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-flagstatus-const-cs-flagstatus-23-src-mq3-client-cgame-servercmds-ml-1727650702"></a>
### CS_FLAGSTATUS

```ml
const CS_FLAGSTATUS = 23
```

Server configuration-string index for flagstatus; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L97)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-intermission-const-cs-intermission-22-src-mq3-client-cgame-servercmds-ml-454244011"></a>
### CS_INTERMISSION

```ml
const CS_INTERMISSION = 22
```

Server configuration-string index for intermission; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L95)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-level-start-time-const-cs-level-start-time-21-src-mq3-client-cgame-servercmds-ml-2133037984"></a>
### CS_LEVEL_START_TIME

```ml
const CS_LEVEL_START_TIME = 21
```

Server configuration-string index for level start time; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L93)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-models-const-cs-models-32-src-mq3-client-cgame-servercmds-ml-444271308"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```

Server configuration-string index for models; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L101)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-music-const-cs-music-2-src-mq3-client-cgame-servercmds-ml-347748153"></a>
### CS_MUSIC

```ml
const CS_MUSIC = 2
```

Server configuration-string index for music; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L69)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-players-const-cs-players-544-src-mq3-client-cgame-servercmds-ml-1383695540"></a>
### CS_PLAYERS

```ml
const CS_PLAYERS = 544
```

Server configuration-string index for players; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L105)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-scores1-const-cs-scores1-6-src-mq3-client-cgame-servercmds-ml-783345299"></a>
### CS_SCORES1

```ml
const CS_SCORES1 = 6
```

Server configuration-string index for scores1; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L73)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-scores2-const-cs-scores2-7-src-mq3-client-cgame-servercmds-ml-970956556"></a>
### CS_SCORES2

```ml
const CS_SCORES2 = 7
```

Server configuration-string index for scores2; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L75)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-serverinfo-const-cs-serverinfo-0-src-mq3-client-cgame-servercmds-ml-255752417"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```

Server configuration-string index for serverinfo; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L67)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-shaderstate-const-cs-shaderstate-24-src-mq3-client-cgame-servercmds-ml-998418065"></a>
### CS_SHADERSTATE

```ml
const CS_SHADERSTATE = 24
```

Server configuration-string index for shaderstate; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L99)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-sounds-const-cs-sounds-288-src-mq3-client-cgame-servercmds-ml-1815120811"></a>
### CS_SOUNDS

```ml
const CS_SOUNDS = 288
```

Server configuration-string index for sounds; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L103)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-no-const-cs-teamvote-no-18-src-mq3-client-cgame-servercmds-ml-843035718"></a>
### CS_TEAMVOTE_NO

```ml
const CS_TEAMVOTE_NO = 18
```

Server configuration-string index for teamvote no; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L91)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-string-const-cs-teamvote-string-14-src-mq3-client-cgame-servercmds-ml-156650274"></a>
### CS_TEAMVOTE_STRING

```ml
const CS_TEAMVOTE_STRING = 14
```

Server configuration-string index for teamvote string; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L87)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-time-const-cs-teamvote-time-12-src-mq3-client-cgame-servercmds-ml-1178099664"></a>
### CS_TEAMVOTE_TIME

```ml
const CS_TEAMVOTE_TIME = 12
```

Server configuration-string index for teamvote time; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L85)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-yes-const-cs-teamvote-yes-16-src-mq3-client-cgame-servercmds-ml-12278262"></a>
### CS_TEAMVOTE_YES

```ml
const CS_TEAMVOTE_YES = 16
```

Server configuration-string index for teamvote yes; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L89)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-no-const-cs-vote-no-11-src-mq3-client-cgame-servercmds-ml-1394687077"></a>
### CS_VOTE_NO

```ml
const CS_VOTE_NO = 11
```

Server configuration-string index for vote no; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L83)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-string-const-cs-vote-string-9-src-mq3-client-cgame-servercmds-ml-1451531412"></a>
### CS_VOTE_STRING

```ml
const CS_VOTE_STRING = 9
```

Server configuration-string index for vote string; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L79)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-time-const-cs-vote-time-8-src-mq3-client-cgame-servercmds-ml-659114545"></a>
### CS_VOTE_TIME

```ml
const CS_VOTE_TIME = 8
```

Server configuration-string index for vote time; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L77)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-yes-const-cs-vote-yes-10-src-mq3-client-cgame-servercmds-ml-575820084"></a>
### CS_VOTE_YES

```ml
const CS_VOTE_YES = 10
```

Server configuration-string index for vote yes; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L81)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-warmup-const-cs-warmup-5-src-mq3-client-cgame-servercmds-ml-1571073864"></a>
### CS_WARMUP

```ml
const CS_WARMUP = 5
```

Server configuration-string index for warmup; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L71)

<a id="function-function-mq3-client-cgame-servercmds-executenewservercommands-function-executenewservercommands-state-latestsequence-commands-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-2143024408"></a>
### executeNewServerCommands

```ml
function executeNewServerCommands(state, latestSequence, commands, vcFiles, emit)
```

CG_ExecuteNewServerCommands. commands contains [sequence,argv] records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.serverCommandSequence`. |
| `latestSequence` | `dynamic` | — | Value used by `while state.serverCommandSequence<latestSequence`. |
| `commands` | `dynamic` | — | Value used by `for each item in commands if item[0]==state.serverCommandSequence then found=item[1]`. |
| `vcFiles` | `dynamic` | — | Value used by `if found!=void then nested=serverCommand(state,found,vcFiles,emit)`. |
| `emit` | `dynamic` | — | Value used by `if found!=void then nested=serverCommand(state,found,vcFiles,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L756)

<a id="constant-constant-mq3-client-cgame-servercmds-gender-female-const-gender-female-1-src-mq3-client-cgame-servercmds-ml-1968654108"></a>
### GENDER_FEMALE

```ml
const GENDER_FEMALE = 1
```

Player-model gender identifier selecting female sound variants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L43)

<a id="constant-constant-mq3-client-cgame-servercmds-gender-male-const-gender-male-0-src-mq3-client-cgame-servercmds-ml-714325869"></a>
### GENDER_MALE

```ml
const GENDER_MALE = 0
```

Player-model gender identifier selecting male sound variants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L41)

<a id="constant-constant-mq3-client-cgame-servercmds-gender-neuter-const-gender-neuter-2-src-mq3-client-cgame-servercmds-ml-397901631"></a>
### GENDER_NEUTER

```ml
const GENDER_NEUTER = 2
```

Player-model gender identifier selecting neuter sound variants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L45)

<a id="function-function-mq3-client-cgame-servercmds-getvoicechat-function-getvoicechat-list-id-cursor-src-mq3-client-cgame-servercmds-ml-1876510601"></a>
### getVoiceChat

```ml
function getVoiceChat(list, id, cursor)
```

CG_GetVoiceChat. cursor is an injected [0,1) random value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record read through `list.chats`. |
| `id` | `dynamic` | — | Value used by `if strings.equalsIgnoreCaseAscii(id,chat.id) and len(chat.variants)>0 then index=numeric.trunc32(cursor*len(chat.variants))`. |
| `cursor` | `dynamic` | — | Value used by `if strings.equalsIgnoreCaseAscii(id,chat.id) and len(chat.variants)>0 then index=numeric.trunc32(cursor*len(chat.variants))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L640)

<a id="constant-constant-mq3-client-cgame-servercmds-gt-1fctf-const-gt-1fctf-5-src-mq3-client-cgame-servercmds-ml-1346554622"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Native game-type identifier selecting one-flag capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L39)

<a id="constant-constant-mq3-client-cgame-servercmds-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-servercmds-ml-945969825"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when interpreting mode-specific server and flag-status updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L37)

<a id="function-function-mq3-client-cgame-servercmds-headmodelvoicechats-function-headmodelvoicechats-state-text-src-mq3-client-cgame-servercmds-ml-1303059158"></a>
### headModelVoiceChats

```ml
function headModelVoiceChats(state, text)
```

CG_HeadModelVoiceChats

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.voiceLists`. |
| `text` | `dynamic` | — | Text consumed or emitted by `headModelVoiceChats` in the client game servercmds path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L632)

- [mq3.client.cgame_servercmds.HeadVoice](Type-mq3-client-cgame-servercmds-headvoice-756147145.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-integer-function-integer-args-index-src-mq3-client-cgame-servercmds-ml-839205039"></a>
### integer

```ml
function integer(args, index)
```

Adapts `mq3.client.cgame_servercmds.atoi` to client game servercmds `integer`, returning its result for `arg(args,index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Argument 1 of `mq3.client.cgame_servercmds.atoi`; passed as `arg(args,index)`. |
| `index` | `dynamic` | — | Argument 1 of `mq3.client.cgame_servercmds.atoi`; passed as `arg(args,index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L440)

<a id="function-function-mq3-client-cgame-servercmds-iscolor-function-iscolor-data-index-src-mq3-client-cgame-servercmds-ml-1150838726"></a>
### isColor

```ml
function isColor(data, index)
```

Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for client game servercmds `isColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[index]`, `data[index+1]`. |
| `index` | `dynamic` | — | Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L553)

<a id="function-function-mq3-client-cgame-servercmds-loadvoicechats-function-loadvoicechats-state-files-soundfn-compress-src-mq3-client-cgame-servercmds-ml-1936144351"></a>
### loadVoiceChats

```ml
function loadVoiceChats(state, files, soundFn, compress)
```

CG_LoadVoiceChats

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.voiceLists`. |
| `files` | `dynamic` | — | Value used by `for each item in files if len(state.voiceLists)>=MAX_VOICEFILES then break end if`. |
| `soundFn` | `dynamic` | — | Callback invoked by `loadVoiceChats` for sound. |
| `compress` | `dynamic` | — | Value used by `parsed=parseVoiceChats(item[0],item[1],MAX_VOICECHATS,soundFn,compress)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L625)

<a id="function-function-mq3-client-cgame-servercmds-maprestart-function-maprestart-state-emit-src-mq3-client-cgame-servercmds-ml-1621185030"></a>
### mapRestart

```ml
function mapRestart(state, emit)
```

CG_MapRestart

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.fraglimitWarnings`, `state.timelimitWarnings`, `state.intermissionStarted`, `state.voteTime` and additional values. |
| `emit` | `dynamic` | — | Value used by `for each kind in ["init-local-entities","init-mark-polys","clear-particles"] add(effect,"state",kind,"","",0,emit) end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L578)

<a id="constant-constant-mq3-client-cgame-servercmds-max-clients-const-max-clients-64-src-mq3-client-cgame-servercmds-ml-829079533"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L16)

<a id="constant-constant-mq3-client-cgame-servercmds-max-headmodels-const-max-headmodels-64-src-mq3-client-cgame-servercmds-ml-965591725"></a>
### MAX_HEADMODELS

```ml
const MAX_HEADMODELS = 64
```

Capacity limit for the headmodels collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L26)

<a id="constant-constant-mq3-client-cgame-servercmds-max-models-const-max-models-256-src-mq3-client-cgame-servercmds-ml-1613809698"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```

Capacity limit for the models collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L18)

<a id="constant-constant-mq3-client-cgame-servercmds-max-say-text-const-max-say-text-150-src-mq3-client-cgame-servercmds-ml-208165361"></a>
### MAX_SAY_TEXT

```ml
const MAX_SAY_TEXT = 150
```

Maximum text length accepted for a chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L30)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicechatbuffer-const-max-voicechatbuffer-32-src-mq3-client-cgame-servercmds-ml-846184288"></a>
### MAX_VOICECHATBUFFER

```ml
const MAX_VOICECHATBUFFER = 32
```

Capacity limit for the voicechatbuffer collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L28)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicechats-const-max-voicechats-64-src-mq3-client-cgame-servercmds-ml-209228259"></a>
### MAX_VOICECHATS

```ml
const MAX_VOICECHATS = 64
```

Capacity limit for the voicechats collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L22)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicefiles-const-max-voicefiles-8-src-mq3-client-cgame-servercmds-ml-1514808955"></a>
### MAX_VOICEFILES

```ml
const MAX_VOICEFILES = 8
```

Capacity limit for the voicefiles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L20)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicesounds-const-max-voicesounds-64-src-mq3-client-cgame-servercmds-ml-2014906909"></a>
### MAX_VOICESOUNDS

```ml
const MAX_VOICESOUNDS = 64
```

Capacity limit for the voicesounds collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L24)

<a id="function-function-mq3-client-cgame-servercmds-parsescores-function-parsescores-state-args-src-mq3-client-cgame-servercmds-ml-813076988"></a>
### parseScores

```ml
function parseScores(state, args)
```

CG_ParseScores: the wire command has fourteen fields per score.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.numScores`, `state.teamScores`, `state.scores`, `state.clients[number].score` and additional values. |
| `args` | `dynamic` | — | Value used by `count=integer(args,1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L459)

<a id="function-function-mq3-client-cgame-servercmds-parseserverinfo-function-parseserverinfo-state-src-mq3-client-cgame-servercmds-ml-247223945"></a>
### parseServerinfo

```ml
function parseServerinfo(state)
```

CG_ParseServerinfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.gametype`, `state.dmflags`, `state.teamflags`, `state.fraglimit` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L486)

<a id="function-function-mq3-client-cgame-servercmds-parseteaminfo-function-parseteaminfo-state-args-src-mq3-client-cgame-servercmds-ml-270874704"></a>
### parseTeamInfo

```ml
function parseTeamInfo(state, args)
```

CG_ParseTeamInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.sortedTeamPlayers`. |
| `args` | `dynamic` | — | Value used by `count=integer(args,1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L473)

<a id="function-function-mq3-client-cgame-servercmds-parsevoicechats-function-parsevoicechats-filename-text-maxvoicechats-soundfn-compress-src-mq3-client-cgame-servercmds-ml-1467379550"></a>
### parseVoiceChats

```ml
function parseVoiceChats(filename, text, maxVoiceChats, soundFn, compress)
```

CG_ParseVoiceChats. soundFn(path,compress) may reject an unavailable sound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `parseVoiceChats` in the client game servercmds path. |
| `maxVoiceChats` | `dynamic` | — | Value used by `while at<len(tokens) and len(list.chats)<maxVoiceChats`. |
| `soundFn` | `dynamic` | — | Callback invoked by `parseVoiceChats` for sound. |
| `compress` | `dynamic` | — | Value used by `if soundFn!=void then sound=soundFn(path,compress) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L606)

<a id="function-function-mq3-client-cgame-servercmds-parsewarmup-function-parsewarmup-state-src-mq3-client-cgame-servercmds-ml-1027204707"></a>
### parseWarmup

```ml
function parseWarmup(state)
```

CG_ParseWarmup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.warmupCount`, `state.warmup`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L493)

<a id="function-function-mq3-client-cgame-servercmds-playbufferedvoicechats-function-playbufferedvoicechats-state-emit-src-mq3-client-cgame-servercmds-ml-118283994"></a>
### playBufferedVoiceChats

```ml
function playBufferedVoiceChats(state, emit)
```

CG_PlayBufferedVoiceChats

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.voiceBuffer[state.voiceChatBufferOut]`, `state.voiceChatBufferOut`, `state.voiceChatTime`. |
| `emit` | `dynamic` | — | Value used by `if value!=void then nested=playVoiceChat(state,value,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L683)

<a id="function-function-mq3-client-cgame-servercmds-playvoicechat-function-playvoicechat-state-vchat-emit-src-mq3-client-cgame-servercmds-ml-453736130"></a>
### playVoiceChat

```ml
function playVoiceChat(state, vchat, emit)
```

CG_PlayVoiceChat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.acceptOrderTime`, `state.acceptVoice`, `state.acceptTask`, `state.acceptLeader`. |
| `vchat` | `dynamic` | — | Record read through `vchat.sound`, `vchat.clientNum`, `vchat.cmd`, `vchat.voiceOnly` and additional values. |
| `emit` | `dynamic` | — | Value used by `if not state.noVoiceChats then add(effect,"audio","voice",vchat.sound,"",vchat.clientNum,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L674)

<a id="function-function-mq3-client-cgame-servercmds-removechatescapechar-function-removechatescapechar-text-src-mq3-client-cgame-servercmds-ml-246186897"></a>
### removeChatEscapeChar

```ml
function removeChatEscapeChar(text)
```

CG_RemoveChatEscapeChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `removeChatEscapeChar` in the client game servercmds path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L723)

<a id="function-function-mq3-client-cgame-servercmds-result-function-result-handled-src-mq3-client-cgame-servercmds-ml-1149019014"></a>
### result

```ml
function result(handled)
```

Creates a `mq3.client.cgame_servercmds.Result` record. Assigns `handled` from `handled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handled` | `dynamic` | — | Value used to initialize `Result.handled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L423)

- [mq3.client.cgame_servercmds.Result](Type-mq3-client-cgame-servercmds-result-442483030.md) — struct
<a id="constant-constant-mq3-client-cgame-servercmds-say-all-const-say-all-0-src-mq3-client-cgame-servercmds-ml-1798245949"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```

Chat routing mode that sends the message to all players.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L47)

<a id="constant-constant-mq3-client-cgame-servercmds-say-team-const-say-team-1-src-mq3-client-cgame-servercmds-ml-524018100"></a>
### SAY_TEAM

```ml
const SAY_TEAM = 1
```

Chat routing mode that sends the message only to the player's team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L49)

<a id="constant-constant-mq3-client-cgame-servercmds-say-tell-const-say-tell-2-src-mq3-client-cgame-servercmds-ml-923991127"></a>
### SAY_TELL

```ml
const SAY_TELL = 2
```

Chat routing mode that sends the message to one addressed player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L51)

- [mq3.client.cgame_servercmds.Score](Type-mq3-client-cgame-servercmds-score-1665700067.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-servercommand-function-servercommand-state-args-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-1303444715"></a>
### serverCommand

```ml
function serverCommand(state, args, vcFiles, emit)
```

CG_ServerCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.levelShot`. |
| `args` | `dynamic` | — | Command argument sequence by `serverCommand`. |
| `vcFiles` | `dynamic` | — | Value used by `else if cmd=="vchat" then nested=voiceChat(state,SAY_ALL,args,vcFiles,emit)`. |
| `emit` | `dynamic` | — | Value used by `if cmd=="cp" then add(effect,"hud","center-print",arg(args,1),"144",16,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L730)

<a id="function-function-mq3-client-cgame-servercmds-setconfigvalues-function-setconfigvalues-state-src-mq3-client-cgame-servercmds-ml-1480964065"></a>
### setConfigValues

```ml
function setConfigValues(state)
```

CG_SetConfigValues

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.scores1`, `state.scores2`, `state.levelStartTime`, `state.redflag` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L501)

<a id="function-function-mq3-client-cgame-servercmds-shaderstatechanged-function-shaderstatechanged-state-emit-src-mq3-client-cgame-servercmds-ml-622755154"></a>
### shaderStateChanged

```ml
function shaderStateChanged(state, emit)
```

CG_ShaderStateChanged

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.configstrings`. |
| `emit` | `dynamic` | — | Value used by `add(effect,"renderer","remap-shader",oldName,newName,atoi(offset),emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L511)

- [mq3.client.cgame_servercmds.State](Type-mq3-client-cgame-servercmds-state-253786656.md) — struct
<a id="constant-constant-mq3-client-cgame-servercmds-teamchat-height-const-teamchat-height-cgabi-teamchat-height-src-mq3-client-cgame-servercmds-ml-36421286"></a>
### TEAMCHAT_HEIGHT

```ml
const TEAMCHAT_HEIGHT = cgabi.TEAMCHAT_HEIGHT
```

Maximum number of team-chat lines retained by the overlay history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L32)

<a id="constant-constant-mq3-client-cgame-servercmds-teamchat-width-const-teamchat-width-cgabi-teamchat-width-src-mq3-client-cgame-servercmds-ml-988895255"></a>
### TEAMCHAT_WIDTH

```ml
const TEAMCHAT_WIDTH = cgabi.TEAMCHAT_WIDTH
```

Maximum visible character count retained for one team-chat line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L34)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-camp-const-teamtask-camp-7-src-mq3-client-cgame-servercmds-ml-415486762"></a>
### TEAMTASK_CAMP

```ml
const TEAMTASK_CAMP = 7
```

Team-order identifier assigning the player the camp tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L65)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-defense-const-teamtask-defense-2-src-mq3-client-cgame-servercmds-ml-2135632183"></a>
### TEAMTASK_DEFENSE

```ml
const TEAMTASK_DEFENSE = 2
```

Team-order identifier assigning the player the defense tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L55)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-escort-const-teamtask-escort-6-src-mq3-client-cgame-servercmds-ml-901979667"></a>
### TEAMTASK_ESCORT

```ml
const TEAMTASK_ESCORT = 6
```

Team-order identifier assigning the player the escort tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L63)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-follow-const-teamtask-follow-4-src-mq3-client-cgame-servercmds-ml-485565841"></a>
### TEAMTASK_FOLLOW

```ml
const TEAMTASK_FOLLOW = 4
```

Team-order identifier assigning the player the follow tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L59)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-offense-const-teamtask-offense-1-src-mq3-client-cgame-servercmds-ml-647632004"></a>
### TEAMTASK_OFFENSE

```ml
const TEAMTASK_OFFENSE = 1
```

Team-order identifier assigning the player the offense tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L53)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-patrol-const-teamtask-patrol-3-src-mq3-client-cgame-servercmds-ml-386167606"></a>
### TEAMTASK_PATROL

```ml
const TEAMTASK_PATROL = 3
```

Team-order identifier assigning the player the patrol tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L57)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-retrieve-const-teamtask-retrieve-5-src-mq3-client-cgame-servercmds-ml-1951001404"></a>
### TEAMTASK_RETRIEVE

```ml
const TEAMTASK_RETRIEVE = 5
```

Team-order identifier assigning the player the retrieve tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L61)

<a id="function-function-mq3-client-cgame-servercmds-validorder-function-validorder-name-src-mq3-client-cgame-servercmds-ml-2049881253"></a>
### validOrder

```ml
function validOrder(name)
```

CG_ValidOrder

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game servercmds resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L444)

<a id="function-function-mq3-client-cgame-servercmds-voicechat-function-voicechat-state-mode-args-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-1742502666"></a>
### voiceChat

```ml
function voiceChat(state, mode, args, vcFiles, emit)
```

CG_VoiceChat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.noTaunt`. |
| `mode` | `dynamic` | — | Value used by `return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)`. |
| `args` | `dynamic` | — | Value used by `cmd=arg(args,4)`. |
| `vcFiles` | `dynamic` | — | Value used by `return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)`. |
| `emit` | `dynamic` | — | Value used by `return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L716)

- [mq3.client.cgame_servercmds.VoiceChat](Type-mq3-client-cgame-servercmds-voicechat-1780850893.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-voicechatlistforclient-function-voicechatlistforclient-state-clientnum-vcfiles-src-mq3-client-cgame-servercmds-ml-305184640"></a>
### voiceChatListForClient

```ml
function voiceChatListForClient(state, clientNum, vcFiles)
```

CG_VoiceChatListForClient. vcFiles contains [path,text] pairs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`, `state.headVoices`, `state.voiceLists`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `vcFiles` | `dynamic` | — | Value used by `for each file in vcFiles if strings.equalsIgnoreCaseAscii(file[0],wanted) then index=headModelVoiceChats(state,file[1])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L659)

<a id="function-function-mq3-client-cgame-servercmds-voicechatlocal-function-voicechatlocal-state-mode-voiceonly-clientnum-color-cmd-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-753596985"></a>
### voiceChatLocal

```ml
function voiceChatLocal(state, mode, voiceOnly, clientNum, color, cmd, vcFiles, emit)
```

CG_VoiceChatLocal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game servercmds record/storage; this routine assigns `state.currentVoiceClient`. |
| `mode` | `dynamic` | — | Value used by `if variant==void or (mode!=SAY_TEAM and state.teamChatsOnly) then return effect end if`. |
| `voiceOnly` | `dynamic` | — | Value used by `vchat=BufferedVoice(clientNum,variant.sound,voiceOnly,cmd,message)`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `color` | `dynamic` | — | Color value used by the client game servercmds drawing or interpolation operation. |
| `cmd` | `dynamic` | — | Value used by `variant=getVoiceChat(list,cmd,state.randomCursor)`. |
| `vcFiles` | `dynamic` | — | Value used by `list=voiceChatListForClient(state,clientNum,vcFiles)`. |
| `emit` | `dynamic` | — | Value used by `return addBufferedVoiceChat(state,vchat,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L705)

- [mq3.client.cgame_servercmds.VoiceList](Type-mq3-client-cgame-servercmds-voicelist-1498240539.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-voicetokens-function-voicetokens-text-src-mq3-client-cgame-servercmds-ml-333654793"></a>
### voiceTokens

```ml
function voiceTokens(text)
```

COM_ParseExt subset used by .voice and .vc files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `voiceTokens` in the client game servercmds path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L588)

- [mq3.client.cgame_servercmds.VoiceVariant](Type-mq3-client-cgame-servercmds-voicevariant-662097924.md) — struct
