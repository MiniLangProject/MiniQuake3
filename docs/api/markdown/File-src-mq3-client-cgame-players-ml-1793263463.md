# `src/mq3/client/cgame_players.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_players`](Package-mq3-client-cgame-players-120965641.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-players-absolute-function-absolute-value-src-mq3-client-cgame-players-ml-638778483"></a>
### absolute

```ml
function absolute(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L142)

- [mq3.client.cgame_players.Action](Type-mq3-client-cgame-players-action-730062975.md) — struct
<a id="function-function-mq3-client-cgame-players-addpaintwitch-function-addpaintwitch-state-cent-torsoangles-src-mq3-client-cgame-players-ml-631502980"></a>
### addPainTwitch

```ml
function addPainTwitch(state, cent, torsoAngles)
```

CG_AddPainTwitch

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `torsoAngles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L146)

<a id="function-function-mq3-client-cgame-players-addrefentitywithpowerups-function-addrefentitywithpowerups-state-cent-team-part-retailactive-src-mq3-client-cgame-players-ml-538786318"></a>
### addRefEntityWithPowerups

```ml
function addRefEntityWithPowerups(state, cent, team, part, retailActive)
```

CG_AddRefEntityWithPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L172)

<a id="function-function-mq3-client-cgame-players-anglemod-function-anglemod-value-src-mq3-client-cgame-players-ml-402215703"></a>
### angleMod

```ml
function angleMod(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L140)

<a id="function-function-mq3-client-cgame-players-anglesubtract-function-anglesubtract-a-b-src-mq3-client-cgame-players-ml-1735393397"></a>
### angleSubtract

```ml
function angleSubtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L141)

<a id="constant-constant-mq3-client-cgame-players-anim-togglebit-const-anim-togglebit-128-src-mq3-client-cgame-players-ml-1177731874"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L17)

<a id="function-function-mq3-client-cgame-players-animation-function-animation-firstframe-numframes-loopframes-framelerp-initiallerp-reversed-flipflop-src-mq3-client-cgame-players-ml-1920093542"></a>
### animation

```ml
function animation(firstFrame, numFrames, loopFrames, frameLerp, initialLerp, reversed, flipflop)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstFrame` | `dynamic` | — |  |
| `numFrames` | `dynamic` | — |  |
| `loopFrames` | `dynamic` | — |  |
| `frameLerp` | `dynamic` | — |  |
| `initialLerp` | `dynamic` | — |  |
| `reversed` | `dynamic` | — |  |
| `flipflop` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L66)

- [mq3.client.cgame_players.Animation](Type-mq3-client-cgame-players-animation-967536349.md) — struct
<a id="extern_function-extern-function-mq3-client-cgame-players-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-players-ml-673233356"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L12)

<a id="function-function-mq3-client-cgame-players-bit-function-bit-value-index-src-mq3-client-cgame-players-ml-121605041"></a>
### bit

```ml
function bit(value, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L76)

<a id="function-function-mq3-client-cgame-players-breathpuffs-function-breathpuffs-state-cent-headorigin-contents-retailactive-src-mq3-client-cgame-players-ml-393605896"></a>
### breathPuffs

```ml
function breathPuffs(state, cent, headOrigin, contents, retailActive)
```

CG_BreathPuffs

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `headOrigin` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L152)

<a id="function-function-mq3-client-cgame-players-clearlerpframe-function-clearlerpframe-state-ci-lf-animationnumber-src-mq3-client-cgame-players-ml-1469924572"></a>
### clearLerpFrame

```ml
function clearLerpFrame(state, ci, lf, animationNumber)
```

CG_ClearLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `lf` | `dynamic` | — |  |
| `animationNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L137)

<a id="function-function-mq3-client-cgame-players-clientinfo-function-clientinfo-src-mq3-client-cgame-players-ml-6606902"></a>
### clientInfo

```ml
function clientInfo()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L68)

- [mq3.client.cgame_players.ClientInfo](Type-mq3-client-cgame-players-clientinfo-13962238.md) — struct
<a id="function-function-mq3-client-cgame-players-colorfromstring-function-colorfromstring-value-src-mq3-client-cgame-players-ml-1466996507"></a>
### colorFromString

```ml
function colorFromString(value)
```

CG_ColorFromString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L113)

<a id="function-function-mq3-client-cgame-players-copyclientinfomodel-function-copyclientinfomodel-sourceinfo-targetinfo-src-mq3-client-cgame-players-ml-315859084"></a>
### copyClientInfoModel

```ml
function copyClientInfoModel(sourceInfo, targetInfo)
```

CG_CopyClientInfoModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceInfo` | `dynamic` | — |  |
| `targetInfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L118)

<a id="function-function-mq3-client-cgame-players-create-function-create-src-mq3-client-cgame-players-ml-1414907002"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L71)

<a id="function-function-mq3-client-cgame-players-customsound-function-customsound-state-clientnum-soundname-retailactive-src-mq3-client-cgame-players-ml-549271645"></a>
### customSound

```ml
function customSound(state, clientNum, soundName, retailActive)
```

CG_CustomSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `soundName` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L80)

<a id="function-function-mq3-client-cgame-players-customsoundnames-function-customsoundnames-src-mq3-client-cgame-players-ml-1655145806"></a>
### customSoundNames

```ml
function customSoundNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L77)

<a id="function-function-mq3-client-cgame-players-dusttrail-function-dusttrail-state-cent-trace-retailactive-src-mq3-client-cgame-players-ml-1332648521"></a>
### dustTrail

```ml
function dustTrail(state, cent, trace, retailActive)
```

CG_DustTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L154)

<a id="constant-constant-mq3-client-cgame-players-ef-award-assist-const-ef-award-assist-131072-src-mq3-client-cgame-players-ml-687544033"></a>
### EF_AWARD_ASSIST

```ml
const EF_AWARD_ASSIST = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L54)

<a id="constant-constant-mq3-client-cgame-players-ef-award-cap-const-ef-award-cap-2048-src-mq3-client-cgame-players-ml-386074289"></a>
### EF_AWARD_CAP

```ml
const EF_AWARD_CAP = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L49)

<a id="constant-constant-mq3-client-cgame-players-ef-award-defend-const-ef-award-defend-65536-src-mq3-client-cgame-players-ml-433315194"></a>
### EF_AWARD_DEFEND

```ml
const EF_AWARD_DEFEND = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L53)

<a id="constant-constant-mq3-client-cgame-players-ef-award-excellent-const-ef-award-excellent-8-src-mq3-client-cgame-players-ml-1290080681"></a>
### EF_AWARD_EXCELLENT

```ml
const EF_AWARD_EXCELLENT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L47)

<a id="constant-constant-mq3-client-cgame-players-ef-award-gauntlet-const-ef-award-gauntlet-64-src-mq3-client-cgame-players-ml-78098891"></a>
### EF_AWARD_GAUNTLET

```ml
const EF_AWARD_GAUNTLET = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L48)

<a id="constant-constant-mq3-client-cgame-players-ef-award-impressive-const-ef-award-impressive-32768-src-mq3-client-cgame-players-ml-2018840831"></a>
### EF_AWARD_IMPRESSIVE

```ml
const EF_AWARD_IMPRESSIVE = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L52)

<a id="constant-constant-mq3-client-cgame-players-ef-connection-const-ef-connection-8192-src-mq3-client-cgame-players-ml-543849773"></a>
### EF_CONNECTION

```ml
const EF_CONNECTION = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L51)

<a id="constant-constant-mq3-client-cgame-players-ef-dead-const-ef-dead-1-src-mq3-client-cgame-players-ml-1345519572"></a>
### EF_DEAD

```ml
const EF_DEAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L46)

<a id="constant-constant-mq3-client-cgame-players-ef-talk-const-ef-talk-4096-src-mq3-client-cgame-players-ml-667567494"></a>
### EF_TALK

```ml
const EF_TALK = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L50)

<a id="function-function-mq3-client-cgame-players-effect-function-effect-state-boundary-kind-entitynum-name-value-origin-color-retailactive-src-mq3-client-cgame-players-ml-1479256876"></a>
### effect

```ml
function effect(state, boundary, kind, entityNum, name, value, origin, color, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L75)

<a id="function-function-mq3-client-cgame-players-entity-function-entity-number-clientnum-src-mq3-client-cgame-players-ml-271671766"></a>
### entity

```ml
function entity(number, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L69)

- [mq3.client.cgame_players.Entity](Type-mq3-client-cgame-players-entity-979347290.md) — struct
<a id="function-function-mq3-client-cgame-players-fileexists-function-fileexists-state-filename-src-mq3-client-cgame-players-ml-294918652"></a>
### fileExists

```ml
function fileExists(state, filename)
```

CG_FileExists

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L93)

<a id="function-function-mq3-client-cgame-players-findclientheadfile-function-findclientheadfile-state-ci-teamname-headmodelname-headskinname-base-ext-src-mq3-client-cgame-players-ml-2061008973"></a>
### findClientHeadFile

```ml
function findClientHeadFile(state, ci, teamName, headModelName, headSkinName, base, ext)
```

CG_FindClientHeadFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |
| `headModelName` | `dynamic` | — |  |
| `headSkinName` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `ext` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L100)

<a id="function-function-mq3-client-cgame-players-findclientmodelfile-function-findclientmodelfile-state-ci-teamname-modelname-skinname-base-ext-src-mq3-client-cgame-players-ml-398292759"></a>
### findClientModelFile

```ml
function findClientModelFile(state, ci, teamName, modelName, skinName, base, ext)
```

CG_FindClientModelFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |
| `modelName` | `dynamic` | — |  |
| `skinName` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `ext` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L96)

<a id="constant-constant-mq3-client-cgame-players-flag-run-const-flag-run-33-src-mq3-client-cgame-players-ml-1695454033"></a>
### FLAG_RUN

```ml
const FLAG_RUN = 33
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L33)

<a id="constant-constant-mq3-client-cgame-players-flag-stand-const-flag-stand-34-src-mq3-client-cgame-players-ml-558014166"></a>
### FLAG_STAND

```ml
const FLAG_STAND = 34
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L34)

<a id="constant-constant-mq3-client-cgame-players-flag-stand2run-const-flag-stand2run-35-src-mq3-client-cgame-players-ml-760433563"></a>
### FLAG_STAND2RUN

```ml
const FLAG_STAND2RUN = 35
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L35)

<a id="constant-constant-mq3-client-cgame-players-gt-team-const-gt-team-3-src-mq3-client-cgame-players-ml-529721858"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L21)

<a id="function-function-mq3-client-cgame-players-hastetrail-function-hastetrail-state-cent-retailactive-src-mq3-client-cgame-players-ml-1380068130"></a>
### hasteTrail

```ml
function hasteTrail(state, cent, retailActive)
```

CG_HasteTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L150)

<a id="constant-constant-mq3-client-cgame-players-legs-back-const-legs-back-16-src-mq3-client-cgame-players-ml-1966084418"></a>
### LEGS_BACK

```ml
const LEGS_BACK = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L25)

<a id="constant-constant-mq3-client-cgame-players-legs-backcr-const-legs-backcr-31-src-mq3-client-cgame-players-ml-686493213"></a>
### LEGS_BACKCR

```ml
const LEGS_BACKCR = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L31)

<a id="constant-constant-mq3-client-cgame-players-legs-backwalk-const-legs-backwalk-32-src-mq3-client-cgame-players-ml-884296324"></a>
### LEGS_BACKWALK

```ml
const LEGS_BACKWALK = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L32)

<a id="constant-constant-mq3-client-cgame-players-legs-idle-const-legs-idle-22-src-mq3-client-cgame-players-ml-1058698473"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L28)

<a id="constant-constant-mq3-client-cgame-players-legs-idlecr-const-legs-idlecr-23-src-mq3-client-cgame-players-ml-893957874"></a>
### LEGS_IDLECR

```ml
const LEGS_IDLECR = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L29)

<a id="constant-constant-mq3-client-cgame-players-legs-land-const-legs-land-19-src-mq3-client-cgame-players-ml-416266907"></a>
### LEGS_LAND

```ml
const LEGS_LAND = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L26)

<a id="constant-constant-mq3-client-cgame-players-legs-landb-const-legs-landb-21-src-mq3-client-cgame-players-ml-527838800"></a>
### LEGS_LANDB

```ml
const LEGS_LANDB = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L27)

<a id="constant-constant-mq3-client-cgame-players-legs-run-const-legs-run-15-src-mq3-client-cgame-players-ml-437793927"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L24)

<a id="constant-constant-mq3-client-cgame-players-legs-turn-const-legs-turn-24-src-mq3-client-cgame-players-ml-1981595659"></a>
### LEGS_TURN

```ml
const LEGS_TURN = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L30)

<a id="constant-constant-mq3-client-cgame-players-legs-walk-const-legs-walk-14-src-mq3-client-cgame-players-ml-1614573708"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L23)

<a id="constant-constant-mq3-client-cgame-players-legs-walkcr-const-legs-walkcr-13-src-mq3-client-cgame-players-ml-2135999381"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L22)

<a id="function-function-mq3-client-cgame-players-lerpframe-function-lerpframe-src-mq3-client-cgame-players-ml-1812884570"></a>
### lerpFrame

```ml
function lerpFrame()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L67)

- [mq3.client.cgame_players.LerpFrame](Type-mq3-client-cgame-players-lerpframe-13687381.md) — struct
<a id="function-function-mq3-client-cgame-players-lightverts-function-lightverts-normal-vertices-ambient-directed-lightdir-src-mq3-client-cgame-players-ml-1424465285"></a>
### lightVerts

```ml
function lightVerts(normal, vertices, ambient, directed, lightDir)
```

CG_LightVerts

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `ambient` | `dynamic` | — |  |
| `directed` | `dynamic` | — |  |
| `lightDir` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L174)

<a id="function-function-mq3-client-cgame-players-loadclientinfo-function-loadclientinfo-state-ci-animationtext-retailactive-src-mq3-client-cgame-players-ml-2101696987"></a>
### loadClientInfo

```ml
function loadClientInfo(state, ci, animationText, retailActive)
```

CG_LoadClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `animationText` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L115)

<a id="function-function-mq3-client-cgame-players-loaddeferredplayers-function-loaddeferredplayers-state-animationtext-lowmemory-retailactive-src-mq3-client-cgame-players-ml-1943850992"></a>
### loadDeferredPlayers

```ml
function loadDeferredPlayers(state, animationText, lowMemory, retailActive)
```

CG_LoadDeferredPlayers

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `animationText` | `dynamic` | — |  |
| `lowMemory` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L128)

<a id="constant-constant-mq3-client-cgame-players-max-animations-const-max-animations-31-src-mq3-client-cgame-players-ml-784920003"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L15)

<a id="constant-constant-mq3-client-cgame-players-max-clients-const-max-clients-64-src-mq3-client-cgame-players-ml-1546309671"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L14)

<a id="constant-constant-mq3-client-cgame-players-max-totalanimations-const-max-totalanimations-36-src-mq3-client-cgame-players-ml-1571840188"></a>
### MAX_TOTALANIMATIONS

```ml
const MAX_TOTALANIMATIONS = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L16)

<a id="function-function-mq3-client-cgame-players-newclientinfo-function-newclientinfo-state-clientnum-config-animationtext-deferplayers-retailactive-src-mq3-client-cgame-players-ml-877308452"></a>
### newClientInfo

```ml
function newClientInfo(state, clientNum, config, animationText, deferPlayers, retailActive)
```

CG_NewClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `animationText` | `dynamic` | — |  |
| `deferPlayers` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L124)

<a id="constant-constant-mq3-client-cgame-players-pain-twitch-time-const-pain-twitch-time-cgabi-pain-twitch-time-src-mq3-client-cgame-players-ml-431845823"></a>
### PAIN_TWITCH_TIME

```ml
const PAIN_TWITCH_TIME = cgabi.PAIN_TWITCH_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L55)

<a id="function-function-mq3-client-cgame-players-parseanimationfile-function-parseanimationfile-filename-text-ci-src-mq3-client-cgame-players-ml-1207714408"></a>
### parseAnimationFile

```ml
function parseAnimationFile(filename, text, ci)
```

CG_ParseAnimationFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L86)

<a id="function-function-mq3-client-cgame-players-player-function-player-state-cent-localteam-shadowtrace-feetcontents-headcontents-splashtrace-retailactive-src-mq3-client-cgame-players-ml-716926067"></a>
### player

```ml
function player(state, cent, localTeam, shadowTrace, feetContents, headContents, splashTrace, retailActive)
```

CG_Player

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `localTeam` | `dynamic` | — |  |
| `shadowTrace` | `dynamic` | — |  |
| `feetContents` | `dynamic` | — |  |
| `headContents` | `dynamic` | — |  |
| `splashTrace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L176)

<a id="function-function-mq3-client-cgame-players-playerangles-function-playerangles-state-cent-src-mq3-client-cgame-players-ml-820035417"></a>
### playerAngles

```ml
function playerAngles(state, cent)
```

CG_PlayerAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L148)

<a id="function-function-mq3-client-cgame-players-playeranimation-function-playeranimation-state-cent-src-mq3-client-cgame-players-ml-150689595"></a>
### playerAnimation

```ml
function playerAnimation(state, cent)
```

CG_PlayerAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L139)

<a id="function-function-mq3-client-cgame-players-playerflag-function-playerflag-state-cent-skin-retailactive-src-mq3-client-cgame-players-ml-1890331057"></a>
### playerFlag

```ml
function playerFlag(state, cent, skin, retailActive)
```

CG_PlayerFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L158)

<a id="function-function-mq3-client-cgame-players-playerfloatsprite-function-playerfloatsprite-state-cent-shader-retailactive-src-mq3-client-cgame-players-ml-359507561"></a>
### playerFloatSprite

```ml
function playerFloatSprite(state, cent, shader, retailActive)
```

CG_PlayerFloatSprite

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L164)

<a id="function-function-mq3-client-cgame-players-playerpowerups-function-playerpowerups-state-cent-retailactive-src-mq3-client-cgame-players-ml-935712766"></a>
### playerPowerups

```ml
function playerPowerups(state, cent, retailActive)
```

CG_PlayerPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L162)

<a id="function-function-mq3-client-cgame-players-playershadow-function-playershadow-state-cent-trace-retailactive-src-mq3-client-cgame-players-ml-1260274557"></a>
### playerShadow

```ml
function playerShadow(state, cent, trace, retailActive)
```

CG_PlayerShadow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L168)

<a id="function-function-mq3-client-cgame-players-playersplash-function-playersplash-state-cent-feetcontents-headcontents-trace-retailactive-src-mq3-client-cgame-players-ml-675782279"></a>
### playerSplash

```ml
function playerSplash(state, cent, feetContents, headContents, trace, retailActive)
```

CG_PlayerSplash

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `feetContents` | `dynamic` | — |  |
| `headContents` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L170)

<a id="function-function-mq3-client-cgame-players-playersprites-function-playersprites-state-cent-localteam-retailactive-src-mq3-client-cgame-players-ml-826919542"></a>
### playerSprites

```ml
function playerSprites(state, cent, localTeam, retailActive)
```

CG_PlayerSprites

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `localTeam` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L166)

<a id="function-function-mq3-client-cgame-players-playertokens-function-playertokens-state-cent-retailactive-src-mq3-client-cgame-players-ml-227006730"></a>
### playerTokens

```ml
function playerTokens(state, cent, retailActive)
```

CG_PlayerTokens

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L160)

<a id="constant-constant-mq3-client-cgame-players-pw-battlesuit-const-pw-battlesuit-2-src-mq3-client-cgame-players-ml-1023941073"></a>
### PW_BATTLESUIT

```ml
const PW_BATTLESUIT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L38)

<a id="constant-constant-mq3-client-cgame-players-pw-blueflag-const-pw-blueflag-8-src-mq3-client-cgame-players-ml-2143538071"></a>
### PW_BLUEFLAG

```ml
const PW_BLUEFLAG = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L44)

<a id="constant-constant-mq3-client-cgame-players-pw-flight-const-pw-flight-6-src-mq3-client-cgame-players-ml-2076931001"></a>
### PW_FLIGHT

```ml
const PW_FLIGHT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L42)

<a id="constant-constant-mq3-client-cgame-players-pw-haste-const-pw-haste-3-src-mq3-client-cgame-players-ml-1499826162"></a>
### PW_HASTE

```ml
const PW_HASTE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L39)

<a id="constant-constant-mq3-client-cgame-players-pw-invis-const-pw-invis-4-src-mq3-client-cgame-players-ml-198089619"></a>
### PW_INVIS

```ml
const PW_INVIS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L40)

<a id="constant-constant-mq3-client-cgame-players-pw-neutralflag-const-pw-neutralflag-9-src-mq3-client-cgame-players-ml-1272644696"></a>
### PW_NEUTRALFLAG

```ml
const PW_NEUTRALFLAG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L45)

<a id="constant-constant-mq3-client-cgame-players-pw-quad-const-pw-quad-1-src-mq3-client-cgame-players-ml-1354318808"></a>
### PW_QUAD

```ml
const PW_QUAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L37)

<a id="constant-constant-mq3-client-cgame-players-pw-redflag-const-pw-redflag-7-src-mq3-client-cgame-players-ml-568005518"></a>
### PW_REDFLAG

```ml
const PW_REDFLAG = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L43)

<a id="constant-constant-mq3-client-cgame-players-pw-regen-const-pw-regen-5-src-mq3-client-cgame-players-ml-1775199660"></a>
### PW_REGEN

```ml
const PW_REGEN = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L41)

<a id="function-function-mq3-client-cgame-players-registerclientmodelname-function-registerclientmodelname-state-ci-modelname-skinname-headmodelname-headskinname-teamname-animationtext-retailactive-src-mq3-client-cgame-players-ml-636464989"></a>
### registerClientModelname

```ml
function registerClientModelname(state, ci, modelName, skinName, headModelName, headSkinName, teamName, animationText, retailActive)
```

CG_RegisterClientModelname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `modelName` | `dynamic` | — |  |
| `skinName` | `dynamic` | — |  |
| `headModelName` | `dynamic` | — |  |
| `headSkinName` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |
| `animationText` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L109)

<a id="function-function-mq3-client-cgame-players-registerclientskin-function-registerclientskin-state-ci-teamname-modelname-skinname-headmodelname-headskinname-retailactive-src-mq3-client-cgame-players-ml-464498642"></a>
### registerClientSkin

```ml
function registerClientSkin(state, ci, teamName, modelName, skinName, headModelName, headSkinName, retailActive)
```

CG_RegisterClientSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |
| `modelName` | `dynamic` | — |  |
| `skinName` | `dynamic` | — |  |
| `headModelName` | `dynamic` | — |  |
| `headSkinName` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L105)

<a id="function-function-mq3-client-cgame-players-resetplayerentity-function-resetplayerentity-state-cent-src-mq3-client-cgame-players-ml-1075845727"></a>
### resetPlayerEntity

```ml
function resetPlayerEntity(state, cent)
```

CG_ResetPlayerEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L178)

<a id="function-function-mq3-client-cgame-players-runlerpframe-function-runlerpframe-state-ci-lf-newanimation-speedscale-src-mq3-client-cgame-players-ml-618076660"></a>
### runLerpFrame

```ml
function runLerpFrame(state, ci, lf, newAnimation, speedScale)
```

CG_RunLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |
| `lf` | `dynamic` | — |  |
| `newAnimation` | `dynamic` | — |  |
| `speedScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L133)

<a id="function-function-mq3-client-cgame-players-scanforexistingclientinfo-function-scanforexistingclientinfo-state-ci-src-mq3-client-cgame-players-ml-376449315"></a>
### scanForExistingClientInfo

```ml
function scanForExistingClientInfo(state, ci)
```

CG_ScanForExistingClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L120)

<a id="function-function-mq3-client-cgame-players-setdeferredclientinfo-function-setdeferredclientinfo-state-ci-src-mq3-client-cgame-players-ml-1418101867"></a>
### setDeferredClientInfo

```ml
function setDeferredClientInfo(state, ci)
```

CG_SetDeferredClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L122)

<a id="function-function-mq3-client-cgame-players-setlerpframeanimation-function-setlerpframeanimation-ci-lf-newanimation-src-mq3-client-cgame-players-ml-620178008"></a>
### setLerpFrameAnimation

```ml
function setLerpFrameAnimation(ci, lf, newAnimation)
```

CG_SetLerpFrameAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ci` | `dynamic` | — |  |
| `lf` | `dynamic` | — |  |
| `newAnimation` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L131)

- [mq3.client.cgame_players.State](Type-mq3-client-cgame-players-state-2106043254.md) — struct
<a id="function-function-mq3-client-cgame-players-swingangles-function-swingangles-frametime-destination-swingtolerance-clamptolerance-speed-angle-swinging-src-mq3-client-cgame-players-ml-1495101627"></a>
### swingAngles

```ml
function swingAngles(frameTime, destination, swingTolerance, clampTolerance, speed, angle, swinging)
```

CG_SwingAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frameTime` | `dynamic` | — |  |
| `destination` | `dynamic` | — |  |
| `swingTolerance` | `dynamic` | — |  |
| `clampTolerance` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |
| `swinging` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L144)

<a id="constant-constant-mq3-client-cgame-players-team-blue-const-team-blue-2-src-mq3-client-cgame-players-ml-1308482485"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L19)

<a id="constant-constant-mq3-client-cgame-players-team-red-const-team-red-1-src-mq3-client-cgame-players-ml-159116556"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L18)

<a id="constant-constant-mq3-client-cgame-players-team-spectator-const-team-spectator-3-src-mq3-client-cgame-players-ml-2009427666"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L20)

<a id="function-function-mq3-client-cgame-players-teamsuffix-function-teamsuffix-state-ci-src-mq3-client-cgame-players-ml-1465920139"></a>
### teamSuffix

```ml
function teamSuffix(state, ci)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ci` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L94)

<a id="function-function-mq3-client-cgame-players-tokens-function-tokens-text-src-mq3-client-cgame-players-ml-1346406955"></a>
### tokens

```ml
function tokens(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L84)

<a id="constant-constant-mq3-client-cgame-players-torso-gesture-const-torso-gesture-6-src-mq3-client-cgame-players-ml-1410037685"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L36)

- [mq3.client.cgame_players.Trace](Type-mq3-client-cgame-players-trace-110358062.md) — struct
<a id="function-function-mq3-client-cgame-players-trailitem-function-trailitem-state-cent-model-retailactive-src-mq3-client-cgame-players-ml-2010730007"></a>
### trailItem

```ml
function trailItem(state, cent, model, retailActive)
```

CG_TrailItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L156)

<a id="function-function-mq3-client-cgame-players-vertex-function-vertex-origin-src-mq3-client-cgame-players-ml-1059003556"></a>
### vertex

```ml
function vertex(origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L70)

- [mq3.client.cgame_players.Vertex](Type-mq3-client-cgame-players-vertex-2071140647.md) — struct
