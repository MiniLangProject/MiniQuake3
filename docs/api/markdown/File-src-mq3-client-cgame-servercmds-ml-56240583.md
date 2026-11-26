# `src/mq3/client/cgame_servercmds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_servercmds`](Package-mq3-client-cgame-servercmds-1183716955.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-servercmds-action-function-action-boundary-kind-value-value2-number-emit-src-mq3-client-cgame-servercmds-ml-712778282"></a>
### action

```ml
function action(boundary, kind, value, value2, number, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L77)

- [mq3.client.cgame_servercmds.Action](Type-mq3-client-cgame-servercmds-action-1170717877.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-add-function-add-effect-boundary-kind-value-value2-number-emit-src-mq3-client-cgame-servercmds-ml-534581999"></a>
### add

```ml
function add(effect, boundary, kind, value, value2, number, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L79)

<a id="function-function-mq3-client-cgame-servercmds-addbufferedvoicechat-function-addbufferedvoicechat-state-vchat-emit-src-mq3-client-cgame-servercmds-ml-855109622"></a>
### addBufferedVoiceChat

```ml
function addBufferedVoiceChat(state, vchat, emit)
```

CG_AddBufferedVoiceChat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vchat` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L281)

<a id="function-function-mq3-client-cgame-servercmds-addtoteamchat-function-addtoteamchat-state-text-src-mq3-client-cgame-servercmds-ml-1057302260"></a>
### addToTeamChat

```ml
function addToTeamChat(state, text)
```

CG_AddToTeamChat, including color carry and last-space wrapping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L179)

<a id="function-function-mq3-client-cgame-servercmds-arg-function-arg-args-index-src-mq3-client-cgame-servercmds-ml-455799667"></a>
### arg

```ml
function arg(args, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L80)

<a id="extern_function-extern-function-mq3-client-cgame-servercmds-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-servercmds-ml-2035448370"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L10)

- [mq3.client.cgame_servercmds.BufferedVoice](Type-mq3-client-cgame-servercmds-bufferedvoice-600835574.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-cachehead-function-cachehead-state-name-index-src-mq3-client-cgame-servercmds-ml-1209603924"></a>
### cacheHead

```ml
function cacheHead(state, name, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L252)

<a id="function-function-mq3-client-cgame-servercmds-client-function-client-src-mq3-client-cgame-servercmds-ml-1763235438"></a>
### client

```ml
function client()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L69)

- [mq3.client.cgame_servercmds.Client](Type-mq3-client-cgame-servercmds-client-547319872.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-cmdargv-function-cmdargv-args-index-src-mq3-client-cgame-servercmds-ml-64623187"></a>
### cmdArgv

```ml
function cmdArgv(args, index)
```

Cmd_Argv compatibility name retained for the original candidate inventory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L334)

<a id="function-function-mq3-client-cgame-servercmds-configstringmodified-function-configstringmodified-state-num-value-emit-src-mq3-client-cgame-servercmds-ml-659706539"></a>
### configStringModified

```ml
function configStringModified(state, num, value, emit)
```

CG_ConfigStringModified. The engine has already integrated the new value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L152)

<a id="function-function-mq3-client-cgame-servercmds-create-function-create-src-mq3-client-cgame-servercmds-ml-1267341318"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L70)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-flagstatus-const-cs-flagstatus-23-src-mq3-client-cgame-servercmds-ml-1727650702"></a>
### CS_FLAGSTATUS

```ml
const CS_FLAGSTATUS = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L52)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-intermission-const-cs-intermission-22-src-mq3-client-cgame-servercmds-ml-454244011"></a>
### CS_INTERMISSION

```ml
const CS_INTERMISSION = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L51)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-level-start-time-const-cs-level-start-time-21-src-mq3-client-cgame-servercmds-ml-2133037984"></a>
### CS_LEVEL_START_TIME

```ml
const CS_LEVEL_START_TIME = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L50)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-models-const-cs-models-32-src-mq3-client-cgame-servercmds-ml-444271308"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L54)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-music-const-cs-music-2-src-mq3-client-cgame-servercmds-ml-347748153"></a>
### CS_MUSIC

```ml
const CS_MUSIC = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L38)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-players-const-cs-players-544-src-mq3-client-cgame-servercmds-ml-1383695540"></a>
### CS_PLAYERS

```ml
const CS_PLAYERS = 544
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L56)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-scores1-const-cs-scores1-6-src-mq3-client-cgame-servercmds-ml-783345299"></a>
### CS_SCORES1

```ml
const CS_SCORES1 = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L40)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-scores2-const-cs-scores2-7-src-mq3-client-cgame-servercmds-ml-970956556"></a>
### CS_SCORES2

```ml
const CS_SCORES2 = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L41)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-serverinfo-const-cs-serverinfo-0-src-mq3-client-cgame-servercmds-ml-255752417"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L37)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-shaderstate-const-cs-shaderstate-24-src-mq3-client-cgame-servercmds-ml-998418065"></a>
### CS_SHADERSTATE

```ml
const CS_SHADERSTATE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L53)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-sounds-const-cs-sounds-288-src-mq3-client-cgame-servercmds-ml-1815120811"></a>
### CS_SOUNDS

```ml
const CS_SOUNDS = 288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L55)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-no-const-cs-teamvote-no-18-src-mq3-client-cgame-servercmds-ml-843035718"></a>
### CS_TEAMVOTE_NO

```ml
const CS_TEAMVOTE_NO = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L49)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-string-const-cs-teamvote-string-14-src-mq3-client-cgame-servercmds-ml-156650274"></a>
### CS_TEAMVOTE_STRING

```ml
const CS_TEAMVOTE_STRING = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L47)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-time-const-cs-teamvote-time-12-src-mq3-client-cgame-servercmds-ml-1178099664"></a>
### CS_TEAMVOTE_TIME

```ml
const CS_TEAMVOTE_TIME = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L46)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-teamvote-yes-const-cs-teamvote-yes-16-src-mq3-client-cgame-servercmds-ml-12278262"></a>
### CS_TEAMVOTE_YES

```ml
const CS_TEAMVOTE_YES = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L48)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-no-const-cs-vote-no-11-src-mq3-client-cgame-servercmds-ml-1394687077"></a>
### CS_VOTE_NO

```ml
const CS_VOTE_NO = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L45)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-string-const-cs-vote-string-9-src-mq3-client-cgame-servercmds-ml-1451531412"></a>
### CS_VOTE_STRING

```ml
const CS_VOTE_STRING = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L43)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-time-const-cs-vote-time-8-src-mq3-client-cgame-servercmds-ml-659114545"></a>
### CS_VOTE_TIME

```ml
const CS_VOTE_TIME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L42)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-vote-yes-const-cs-vote-yes-10-src-mq3-client-cgame-servercmds-ml-575820084"></a>
### CS_VOTE_YES

```ml
const CS_VOTE_YES = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L44)

<a id="constant-constant-mq3-client-cgame-servercmds-cs-warmup-const-cs-warmup-5-src-mq3-client-cgame-servercmds-ml-1571073864"></a>
### CS_WARMUP

```ml
const CS_WARMUP = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L39)

<a id="function-function-mq3-client-cgame-servercmds-executenewservercommands-function-executenewservercommands-state-latestsequence-commands-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-2143024408"></a>
### executeNewServerCommands

```ml
function executeNewServerCommands(state, latestSequence, commands, vcFiles, emit)
```

CG_ExecuteNewServerCommands. commands contains [sequence,argv] records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `latestSequence` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |
| `vcFiles` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L323)

<a id="constant-constant-mq3-client-cgame-servercmds-gender-female-const-gender-female-1-src-mq3-client-cgame-servercmds-ml-1968654108"></a>
### GENDER_FEMALE

```ml
const GENDER_FEMALE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L25)

<a id="constant-constant-mq3-client-cgame-servercmds-gender-male-const-gender-male-0-src-mq3-client-cgame-servercmds-ml-714325869"></a>
### GENDER_MALE

```ml
const GENDER_MALE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L24)

<a id="constant-constant-mq3-client-cgame-servercmds-gender-neuter-const-gender-neuter-2-src-mq3-client-cgame-servercmds-ml-397901631"></a>
### GENDER_NEUTER

```ml
const GENDER_NEUTER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L26)

<a id="function-function-mq3-client-cgame-servercmds-getvoicechat-function-getvoicechat-list-id-cursor-src-mq3-client-cgame-servercmds-ml-1876510601"></a>
### getVoiceChat

```ml
function getVoiceChat(list, id, cursor)
```

CG_GetVoiceChat. cursor is an injected [0,1) random value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `cursor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L245)

<a id="constant-constant-mq3-client-cgame-servercmds-gt-1fctf-const-gt-1fctf-5-src-mq3-client-cgame-servercmds-ml-1346554622"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L23)

<a id="constant-constant-mq3-client-cgame-servercmds-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-servercmds-ml-945969825"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L22)

<a id="function-function-mq3-client-cgame-servercmds-headmodelvoicechats-function-headmodelvoicechats-state-text-src-mq3-client-cgame-servercmds-ml-1303059158"></a>
### headModelVoiceChats

```ml
function headModelVoiceChats(state, text)
```

CG_HeadModelVoiceChats

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L240)

- [mq3.client.cgame_servercmds.HeadVoice](Type-mq3-client-cgame-servercmds-headvoice-756147145.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-integer-function-integer-args-index-src-mq3-client-cgame-servercmds-ml-839205039"></a>
### integer

```ml
function integer(args, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L81)

<a id="function-function-mq3-client-cgame-servercmds-iscolor-function-iscolor-data-index-src-mq3-client-cgame-servercmds-ml-1150838726"></a>
### isColor

```ml
function isColor(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L177)

<a id="function-function-mq3-client-cgame-servercmds-loadvoicechats-function-loadvoicechats-state-files-soundfn-compress-src-mq3-client-cgame-servercmds-ml-1936144351"></a>
### loadVoiceChats

```ml
function loadVoiceChats(state, files, soundFn, compress)
```

CG_LoadVoiceChats

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `soundFn` | `dynamic` | — |  |
| `compress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L235)

<a id="function-function-mq3-client-cgame-servercmds-maprestart-function-maprestart-state-emit-src-mq3-client-cgame-servercmds-ml-1621185030"></a>
### mapRestart

```ml
function mapRestart(state, emit)
```

CG_MapRestart

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L198)

<a id="constant-constant-mq3-client-cgame-servercmds-max-clients-const-max-clients-64-src-mq3-client-cgame-servercmds-ml-829079533"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L12)

<a id="constant-constant-mq3-client-cgame-servercmds-max-headmodels-const-max-headmodels-64-src-mq3-client-cgame-servercmds-ml-965591725"></a>
### MAX_HEADMODELS

```ml
const MAX_HEADMODELS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L17)

<a id="constant-constant-mq3-client-cgame-servercmds-max-models-const-max-models-256-src-mq3-client-cgame-servercmds-ml-1613809698"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L13)

<a id="constant-constant-mq3-client-cgame-servercmds-max-say-text-const-max-say-text-150-src-mq3-client-cgame-servercmds-ml-208165361"></a>
### MAX_SAY_TEXT

```ml
const MAX_SAY_TEXT = 150
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L19)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicechatbuffer-const-max-voicechatbuffer-32-src-mq3-client-cgame-servercmds-ml-846184288"></a>
### MAX_VOICECHATBUFFER

```ml
const MAX_VOICECHATBUFFER = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L18)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicechats-const-max-voicechats-64-src-mq3-client-cgame-servercmds-ml-209228259"></a>
### MAX_VOICECHATS

```ml
const MAX_VOICECHATS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L15)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicefiles-const-max-voicefiles-8-src-mq3-client-cgame-servercmds-ml-1514808955"></a>
### MAX_VOICEFILES

```ml
const MAX_VOICEFILES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L14)

<a id="constant-constant-mq3-client-cgame-servercmds-max-voicesounds-const-max-voicesounds-64-src-mq3-client-cgame-servercmds-ml-2014906909"></a>
### MAX_VOICESOUNDS

```ml
const MAX_VOICESOUNDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L16)

<a id="function-function-mq3-client-cgame-servercmds-parsescores-function-parsescores-state-args-src-mq3-client-cgame-servercmds-ml-813076988"></a>
### parseScores

```ml
function parseScores(state, args)
```

CG_ParseScores: the wire command has fourteen fields per score.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L97)

<a id="function-function-mq3-client-cgame-servercmds-parseserverinfo-function-parseserverinfo-state-src-mq3-client-cgame-servercmds-ml-247223945"></a>
### parseServerinfo

```ml
function parseServerinfo(state)
```

CG_ParseServerinfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L121)

<a id="function-function-mq3-client-cgame-servercmds-parseteaminfo-function-parseteaminfo-state-args-src-mq3-client-cgame-servercmds-ml-270874704"></a>
### parseTeamInfo

```ml
function parseTeamInfo(state, args)
```

CG_ParseTeamInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L109)

<a id="function-function-mq3-client-cgame-servercmds-parsevoicechats-function-parsevoicechats-filename-text-maxvoicechats-soundfn-compress-src-mq3-client-cgame-servercmds-ml-1467379550"></a>
### parseVoiceChats

```ml
function parseVoiceChats(filename, text, maxVoiceChats, soundFn, compress)
```

CG_ParseVoiceChats. soundFn(path,compress) may reject an unavailable sound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `maxVoiceChats` | `dynamic` | — |  |
| `soundFn` | `dynamic` | — |  |
| `compress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L220)

<a id="function-function-mq3-client-cgame-servercmds-parsewarmup-function-parsewarmup-state-src-mq3-client-cgame-servercmds-ml-1027204707"></a>
### parseWarmup

```ml
function parseWarmup(state)
```

CG_ParseWarmup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L127)

<a id="function-function-mq3-client-cgame-servercmds-playbufferedvoicechats-function-playbufferedvoicechats-state-emit-src-mq3-client-cgame-servercmds-ml-118283994"></a>
### playBufferedVoiceChats

```ml
function playBufferedVoiceChats(state, emit)
```

CG_PlayBufferedVoiceChats

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L276)

<a id="function-function-mq3-client-cgame-servercmds-playvoicechat-function-playvoicechat-state-vchat-emit-src-mq3-client-cgame-servercmds-ml-453736130"></a>
### playVoiceChat

```ml
function playVoiceChat(state, vchat, emit)
```

CG_PlayVoiceChat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vchat` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L269)

<a id="function-function-mq3-client-cgame-servercmds-removechatescapechar-function-removechatescapechar-text-src-mq3-client-cgame-servercmds-ml-246186897"></a>
### removeChatEscapeChar

```ml
function removeChatEscapeChar(text)
```

CG_RemoveChatEscapeChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L299)

<a id="function-function-mq3-client-cgame-servercmds-result-function-result-handled-src-mq3-client-cgame-servercmds-ml-1149019014"></a>
### result

```ml
function result(handled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handled` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L78)

- [mq3.client.cgame_servercmds.Result](Type-mq3-client-cgame-servercmds-result-442483030.md) — struct
<a id="constant-constant-mq3-client-cgame-servercmds-say-all-const-say-all-0-src-mq3-client-cgame-servercmds-ml-1798245949"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L27)

<a id="constant-constant-mq3-client-cgame-servercmds-say-team-const-say-team-1-src-mq3-client-cgame-servercmds-ml-524018100"></a>
### SAY_TEAM

```ml
const SAY_TEAM = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L28)

<a id="constant-constant-mq3-client-cgame-servercmds-say-tell-const-say-tell-2-src-mq3-client-cgame-servercmds-ml-923991127"></a>
### SAY_TELL

```ml
const SAY_TELL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L29)

- [mq3.client.cgame_servercmds.Score](Type-mq3-client-cgame-servercmds-score-1665700067.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-servercommand-function-servercommand-state-args-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-1303444715"></a>
### serverCommand

```ml
function serverCommand(state, args, vcFiles, emit)
```

CG_ServerCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `vcFiles` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L302)

<a id="function-function-mq3-client-cgame-servercmds-setconfigvalues-function-setconfigvalues-state-src-mq3-client-cgame-servercmds-ml-1480964065"></a>
### setConfigValues

```ml
function setConfigValues(state)
```

CG_SetConfigValues

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L134)

<a id="function-function-mq3-client-cgame-servercmds-shaderstatechanged-function-shaderstatechanged-state-emit-src-mq3-client-cgame-servercmds-ml-622755154"></a>
### shaderStateChanged

```ml
function shaderStateChanged(state, emit)
```

CG_ShaderStateChanged

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L142)

- [mq3.client.cgame_servercmds.State](Type-mq3-client-cgame-servercmds-state-253786656.md) — struct
<a id="constant-constant-mq3-client-cgame-servercmds-teamchat-height-const-teamchat-height-cgabi-teamchat-height-src-mq3-client-cgame-servercmds-ml-36421286"></a>
### TEAMCHAT_HEIGHT

```ml
const TEAMCHAT_HEIGHT = cgabi.TEAMCHAT_HEIGHT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L20)

<a id="constant-constant-mq3-client-cgame-servercmds-teamchat-width-const-teamchat-width-cgabi-teamchat-width-src-mq3-client-cgame-servercmds-ml-988895255"></a>
### TEAMCHAT_WIDTH

```ml
const TEAMCHAT_WIDTH = cgabi.TEAMCHAT_WIDTH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L21)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-camp-const-teamtask-camp-7-src-mq3-client-cgame-servercmds-ml-415486762"></a>
### TEAMTASK_CAMP

```ml
const TEAMTASK_CAMP = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L36)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-defense-const-teamtask-defense-2-src-mq3-client-cgame-servercmds-ml-2135632183"></a>
### TEAMTASK_DEFENSE

```ml
const TEAMTASK_DEFENSE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L31)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-escort-const-teamtask-escort-6-src-mq3-client-cgame-servercmds-ml-901979667"></a>
### TEAMTASK_ESCORT

```ml
const TEAMTASK_ESCORT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L35)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-follow-const-teamtask-follow-4-src-mq3-client-cgame-servercmds-ml-485565841"></a>
### TEAMTASK_FOLLOW

```ml
const TEAMTASK_FOLLOW = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L33)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-offense-const-teamtask-offense-1-src-mq3-client-cgame-servercmds-ml-647632004"></a>
### TEAMTASK_OFFENSE

```ml
const TEAMTASK_OFFENSE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L30)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-patrol-const-teamtask-patrol-3-src-mq3-client-cgame-servercmds-ml-386167606"></a>
### TEAMTASK_PATROL

```ml
const TEAMTASK_PATROL = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L32)

<a id="constant-constant-mq3-client-cgame-servercmds-teamtask-retrieve-const-teamtask-retrieve-5-src-mq3-client-cgame-servercmds-ml-1951001404"></a>
### TEAMTASK_RETRIEVE

```ml
const TEAMTASK_RETRIEVE = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L34)

<a id="function-function-mq3-client-cgame-servercmds-validorder-function-validorder-name-src-mq3-client-cgame-servercmds-ml-2049881253"></a>
### validOrder

```ml
function validOrder(name)
```

CG_ValidOrder

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L84)

<a id="function-function-mq3-client-cgame-servercmds-voicechat-function-voicechat-state-mode-args-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-1742502666"></a>
### voiceChat

```ml
function voiceChat(state, mode, args, vcFiles, emit)
```

CG_VoiceChat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `vcFiles` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L293)

- [mq3.client.cgame_servercmds.VoiceChat](Type-mq3-client-cgame-servercmds-voicechat-1780850893.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-voicechatlistforclient-function-voicechatlistforclient-state-clientnum-vcfiles-src-mq3-client-cgame-servercmds-ml-305184640"></a>
### voiceChatListForClient

```ml
function voiceChatListForClient(state, clientNum, vcFiles)
```

CG_VoiceChatListForClient. vcFiles contains [path,text] pairs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `vcFiles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L257)

<a id="function-function-mq3-client-cgame-servercmds-voicechatlocal-function-voicechatlocal-state-mode-voiceonly-clientnum-color-cmd-vcfiles-emit-src-mq3-client-cgame-servercmds-ml-753596985"></a>
### voiceChatLocal

```ml
function voiceChatLocal(state, mode, voiceOnly, clientNum, color, cmd, vcFiles, emit)
```

CG_VoiceChatLocal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |
| `vcFiles` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L287)

- [mq3.client.cgame_servercmds.VoiceList](Type-mq3-client-cgame-servercmds-voicelist-1498240539.md) — struct
<a id="function-function-mq3-client-cgame-servercmds-voicetokens-function-voicetokens-text-src-mq3-client-cgame-servercmds-ml-333654793"></a>
### voiceTokens

```ml
function voiceTokens(text)
```

COM_ParseExt subset used by .voice and .vc files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L207)

- [mq3.client.cgame_servercmds.VoiceVariant](Type-mq3-client-cgame-servercmds-voicevariant-662097924.md) — struct
