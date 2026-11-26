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

Evaluates client game players `absolute` and returns `0-value`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L530)

- [mq3.client.cgame_players.Action](Type-mq3-client-cgame-players-action-730062975.md) — struct
<a id="function-function-mq3-client-cgame-players-addpaintwitch-function-addpaintwitch-state-cent-torsoangles-src-mq3-client-cgame-players-ml-631502980"></a>
### addPainTwitch

```ml
function addPainTwitch(state, cent, torsoAngles)
```

CG_AddPainTwitch

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.painTime`, `cent.painDirection`. |
| `torsoAngles` | `dynamic` | — | Mutable sequence; this routine writes `torsoAngles[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L544)

<a id="function-function-mq3-client-cgame-players-addrefentitywithpowerups-function-addrefentitywithpowerups-state-cent-team-part-retailactive-src-mq3-client-cgame-players-ml-538786318"></a>
### addRefEntityWithPowerups

```ml
function addRefEntityWithPowerups(state, cent, team, part, retailActive)
```

CG_AddRefEntityWithPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.number`, `cent.origin`. |
| `team` | `dynamic` | — | Value used by `if team==TEAM_RED then shader="red-quad" end if`. |
| `part` | `dynamic` | — | Value used by `if bit(cent.powerups,PW_INVIS) then effect(state,"scene","model",cent.number,part,"invis",cent.origin,void,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L621)

<a id="function-function-mq3-client-cgame-players-anglemod-function-anglemod-value-src-mq3-client-cgame-players-ml-402215703"></a>
### angleMod

```ml
function angleMod(value)
```

Computes `(360.0/65536.0)*toFloat(n.trunc32(value*(65536.0/360.0))&65535)` for client game players `angleMod`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return (360.0/65536.0)*toFloat(n.trunc32(value*(65536.0/360.0))&65535)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L523)

<a id="function-function-mq3-client-cgame-players-anglesubtract-function-anglesubtract-a-b-src-mq3-client-cgame-players-ml-1735393397"></a>
### angleSubtract

```ml
function angleSubtract(a, b)
```

Evaluates client game players `angleSubtract` and returns `effect` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used by `effect=a-b`. |
| `b` | `dynamic` | — | Value used by `effect=a-b`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L527)

<a id="constant-constant-mq3-client-cgame-players-anim-togglebit-const-anim-togglebit-128-src-mq3-client-cgame-players-ml-1177731874"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```

Bit toggled when restarting an animation so repeated identifiers still trigger a transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L24)

<a id="function-function-mq3-client-cgame-players-animation-function-animation-firstframe-numframes-loopframes-framelerp-initiallerp-reversed-flipflop-src-mq3-client-cgame-players-ml-1920093542"></a>
### animation

```ml
function animation(firstFrame, numFrames, loopFrames, frameLerp, initialLerp, reversed, flipflop)
```

Creates a `mq3.client.cgame_players.Animation` record. Assigns `firstFrame` from `firstFrame`, `numFrames` from `numFrames`, `loopFrames` from `loopFrames`, `frameLerp` from `frameLerp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstFrame` | `dynamic` | — | Value used to initialize `Animation.firstFrame`. |
| `numFrames` | `dynamic` | — | Value used to initialize `Animation.numFrames`. |
| `loopFrames` | `dynamic` | — | Value used to initialize `Animation.loopFrames`. |
| `frameLerp` | `dynamic` | — | Value used to initialize `Animation.frameLerp`. |
| `initialLerp` | `dynamic` | — | Value used to initialize `Animation.initialLerp`. |
| `reversed` | `dynamic` | — | Value used to initialize `Animation.reversed`. |
| `flipflop` | `dynamic` | — | Value used to initialize `Animation.flipflop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L345)

- [mq3.client.cgame_players.Animation](Type-mq3-client-cgame-players-animation-967536349.md) — struct
<a id="extern_function-extern-function-mq3-client-cgame-players-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-players-ml-673233356"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game players.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L15)

<a id="function-function-mq3-client-cgame-players-bit-function-bit-value-index-src-mq3-client-cgame-players-ml-121605041"></a>
### bit

```ml
function bit(value, index)
```

Computes `(value & (1<<index))!=0` for client game players `bit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return (value & (1<<index))!=0`. |
| `index` | `dynamic` | — | Value used by `return (value & (1<<index))!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L376)

<a id="function-function-mq3-client-cgame-players-breathpuffs-function-breathpuffs-state-cent-headorigin-contents-retailactive-src-mq3-client-cgame-players-ml-393605896"></a>
### breathPuffs

```ml
function breathPuffs(state, cent, headOrigin, contents, retailActive)
```

CG_BreathPuffs

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`, `state.enableBreath`, `state.localClientNum`, `state.renderingThirdPerson` and additional values. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.clientNum`, `cent.number`, `cent.eFlags`. |
| `headOrigin` | `dynamic` | — | Value used by `effect(state,"scene","smoke-puff",cent.number,"breath",1500,headOrigin,[1.0,1.0,1.0,0.66],retailActive)`. |
| `contents` | `dynamic` | — | Value used by `if not state.enableBreath or (cent.number==state.localClientNum and not state.renderingThirdPerson) or (cent.eFlags & EF_DEAD)!=0 or (contents...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L560)

<a id="function-function-mq3-client-cgame-players-clearlerpframe-function-clearlerpframe-state-ci-lf-animationnumber-src-mq3-client-cgame-players-ml-1469924572"></a>
### clearLerpFrame

```ml
function clearLerpFrame(state, ci, lf, animationNumber)
```

CG_ClearLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `ci` | `dynamic` | — | Client presentation information, including model and player identity. |
| `lf` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `lf.frameTime`, `lf.oldFrameTime`, `lf.oldFrame`, `lf.frame`. |
| `animationNumber` | `dynamic` | — | Value used by `setLerpFrameAnimation(ci,lf,animationNumber)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L516)

<a id="function-function-mq3-client-cgame-players-clientinfo-function-clientinfo-src-mq3-client-cgame-players-ml-6606902"></a>
### clientInfo

```ml
function clientInfo()
```

Creates a `mq3.client.cgame_players.ClientInfo` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L349)

- [mq3.client.cgame_players.ClientInfo](Type-mq3-client-cgame-players-clientinfo-13962238.md) — struct
<a id="function-function-mq3-client-cgame-players-colorfromstring-function-colorfromstring-value-src-mq3-client-cgame-players-ml-1466996507"></a>
### colorFromString

```ml
function colorFromString(value)
```

CG_ColorFromString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `val=atoi(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L460)

<a id="function-function-mq3-client-cgame-players-copyclientinfomodel-function-copyclientinfomodel-sourceinfo-targetinfo-src-mq3-client-cgame-players-ml-315859084"></a>
### copyClientInfoModel

```ml
function copyClientInfoModel(sourceInfo, targetInfo)
```

CG_CopyClientInfoModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceInfo` | `dynamic` | — | Record read through `sourceInfo.footsteps`, `sourceInfo.gender`, `sourceInfo.headOffset`, `sourceInfo.fixedlegs` and additional values. |
| `targetInfo` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `targetInfo.footsteps`, `targetInfo.gender`, `targetInfo.headOffset`, `targetInfo.fixedlegs` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L471)

<a id="function-function-mq3-client-cgame-players-create-function-create-src-mq3-client-cgame-players-ml-1414907002"></a>
### create

```ml
function create()
```

Calls `mq3.client.cgame_players.clientInfo`, `mq3.client.cgame_players.State` from client game players `create`. The final path returns `State(0,0,0,0,false,1,true,false,1,0.3,false,false,clients,[],[])`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L358)

<a id="function-function-mq3-client-cgame-players-customsound-function-customsound-state-clientnum-soundname-retailactive-src-mq3-client-cgame-players-ml-549271645"></a>
### customSound

```ml
function customSound(state, clientNum, soundName, retailActive)
```

CG_CustomSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `soundName` | `dynamic` | — | Value used by `if strings.substr(soundName,0,1)!="*" then effect(state,"audio","register-sound",clientNum,soundName,"",void,void,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L385)

<a id="function-function-mq3-client-cgame-players-customsoundnames-function-customsoundnames-src-mq3-client-cgame-players-ml-1655145806"></a>
### customSoundNames

```ml
function customSoundNames()
```

Lists the custom sound names catalog for client game players in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L378)

<a id="function-function-mq3-client-cgame-players-dusttrail-function-dusttrail-state-cent-trace-retailactive-src-mq3-client-cgame-players-ml-1332648521"></a>
### dustTrail

```ml
function dustTrail(state, cent, trace, retailActive)
```

CG_DustTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.enableDust`, `state.time`. |
| `cent` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `cent.dustTrailTime`. |
| `trace` | `dynamic` | — | Record read through `trace.surfaceFlags`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L566)

<a id="constant-constant-mq3-client-cgame-players-ef-award-assist-const-ef-award-assist-131072-src-mq3-client-cgame-players-ml-687544033"></a>
### EF_AWARD_ASSIST

```ml
const EF_AWARD_ASSIST = 131072
```

Entity-state flag selecting award assist behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L99)

<a id="constant-constant-mq3-client-cgame-players-ef-award-cap-const-ef-award-cap-2048-src-mq3-client-cgame-players-ml-386074289"></a>
### EF_AWARD_CAP

```ml
const EF_AWARD_CAP = 2048
```

Entity-state flag selecting award cap behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L89)

<a id="constant-constant-mq3-client-cgame-players-ef-award-defend-const-ef-award-defend-65536-src-mq3-client-cgame-players-ml-433315194"></a>
### EF_AWARD_DEFEND

```ml
const EF_AWARD_DEFEND = 65536
```

Entity-state flag selecting award defend behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L97)

<a id="constant-constant-mq3-client-cgame-players-ef-award-excellent-const-ef-award-excellent-8-src-mq3-client-cgame-players-ml-1290080681"></a>
### EF_AWARD_EXCELLENT

```ml
const EF_AWARD_EXCELLENT = 8
```

Entity-state flag selecting award excellent behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L85)

<a id="constant-constant-mq3-client-cgame-players-ef-award-gauntlet-const-ef-award-gauntlet-64-src-mq3-client-cgame-players-ml-78098891"></a>
### EF_AWARD_GAUNTLET

```ml
const EF_AWARD_GAUNTLET = 64
```

Entity-state flag selecting award gauntlet behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L87)

<a id="constant-constant-mq3-client-cgame-players-ef-award-impressive-const-ef-award-impressive-32768-src-mq3-client-cgame-players-ml-2018840831"></a>
### EF_AWARD_IMPRESSIVE

```ml
const EF_AWARD_IMPRESSIVE = 32768
```

Entity-state flag selecting award impressive behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L95)

<a id="constant-constant-mq3-client-cgame-players-ef-connection-const-ef-connection-8192-src-mq3-client-cgame-players-ml-543849773"></a>
### EF_CONNECTION

```ml
const EF_CONNECTION = 8192
```

Entity-state flag selecting connection behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L93)

<a id="constant-constant-mq3-client-cgame-players-ef-dead-const-ef-dead-1-src-mq3-client-cgame-players-ml-1345519572"></a>
### EF_DEAD

```ml
const EF_DEAD = 1
```

Entity-state flag selecting dead behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L83)

<a id="constant-constant-mq3-client-cgame-players-ef-talk-const-ef-talk-4096-src-mq3-client-cgame-players-ml-667567494"></a>
### EF_TALK

```ml
const EF_TALK = 4096
```

Entity-state flag selecting talk behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L91)

<a id="function-function-mq3-client-cgame-players-effect-function-effect-state-boundary-kind-entitynum-name-value-origin-color-retailactive-src-mq3-client-cgame-players-ml-1479256876"></a>
### effect

```ml
function effect(state, boundary, kind, entityNum, name, value, origin, color, retailActive)
```

Updates `state.actions` during client game players `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game players resource. |
| `value` | `dynamic` | — | Value used by `item=Action(boundary,kind,entityNum,name,value,origin,color,not retailActive)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `color` | `dynamic` | — | Color value used by the client game players drawing or interpolation operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L372)

<a id="function-function-mq3-client-cgame-players-entity-function-entity-number-clientnum-src-mq3-client-cgame-players-ml-271671766"></a>
### entity

```ml
function entity(number, clientNum)
```

Creates a `mq3.client.cgame_players.Entity` record. Assigns `number` from `number`, `clientNum` from `clientNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value used to initialize `Entity.number`. |
| `clientNum` | `dynamic` | — | Value used to initialize `Entity.clientNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L353)

- [mq3.client.cgame_players.Entity](Type-mq3-client-cgame-players-entity-979347290.md) — struct
<a id="function-function-mq3-client-cgame-players-fileexists-function-fileexists-state-filename-src-mq3-client-cgame-players-ml-294918652"></a>
### fileExists

```ml
function fileExists(state, filename)
```

CG_FileExists

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.files`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L405)

<a id="function-function-mq3-client-cgame-players-findclientheadfile-function-findclientheadfile-state-ci-teamname-headmodelname-headskinname-base-ext-src-mq3-client-cgame-players-ml-2061008973"></a>
### findClientHeadFile

```ml
function findClientHeadFile(state, ci, teamName, headModelName, headSkinName, base, ext)
```

CG_FindClientHeadFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `findClientHeadFile`. |
| `ci` | `dynamic` | — | Client presentation information, including model and player identity. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |
| `headModelName` | `dynamic` | — | Value used by `model=headModelName`. |
| `headSkinName` | `dynamic` | — | Value used by `for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="model...`. |
| `base` | `dynamic` | — | Value used by `for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="model...`. |
| `ext` | `dynamic` | — | Value used by `for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="model...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L429)

<a id="function-function-mq3-client-cgame-players-findclientmodelfile-function-findclientmodelfile-state-ci-teamname-modelname-skinname-base-ext-src-mq3-client-cgame-players-ml-398292759"></a>
### findClientModelFile

```ml
function findClientModelFile(state, ci, teamName, modelName, skinName, base, ext)
```

CG_FindClientModelFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `findClientModelFile`. |
| `ci` | `dynamic` | — | Client presentation information, including model and player identity. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |
| `modelName` | `dynamic` | — | Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`. |
| `skinName` | `dynamic` | — | Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`. |
| `base` | `dynamic` | — | Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`. |
| `ext` | `dynamic` | — | Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L418)

<a id="constant-constant-mq3-client-cgame-players-flag-run-const-flag-run-33-src-mq3-client-cgame-players-ml-1695454033"></a>
### FLAG_RUN

```ml
const FLAG_RUN = 33
```

Player-carried flag animation slot for the run sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L57)

<a id="constant-constant-mq3-client-cgame-players-flag-stand-const-flag-stand-34-src-mq3-client-cgame-players-ml-558014166"></a>
### FLAG_STAND

```ml
const FLAG_STAND = 34
```

Player-carried flag animation slot for the stand sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L59)

<a id="constant-constant-mq3-client-cgame-players-flag-stand2run-const-flag-stand2run-35-src-mq3-client-cgame-players-ml-760433563"></a>
### FLAG_STAND2RUN

```ml
const FLAG_STAND2RUN = 35
```

Player-carried flag animation slot for the stand2 run sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L61)

<a id="constant-constant-mq3-client-cgame-players-gt-team-const-gt-team-3-src-mq3-client-cgame-players-ml-529721858"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when selecting team-dependent player models, colors, and effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L33)

<a id="function-function-mq3-client-cgame-players-hastetrail-function-hastetrail-state-cent-retailactive-src-mq3-client-cgame-players-ml-1380068130"></a>
### hasteTrail

```ml
function hasteTrail(state, cent, retailActive)
```

CG_HasteTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `cent.trailTime`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L553)

<a id="constant-constant-mq3-client-cgame-players-legs-back-const-legs-back-16-src-mq3-client-cgame-players-ml-1966084418"></a>
### LEGS_BACK

```ml
const LEGS_BACK = 16
```

Native lower-body animation slot for the back sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L41)

<a id="constant-constant-mq3-client-cgame-players-legs-backcr-const-legs-backcr-31-src-mq3-client-cgame-players-ml-686493213"></a>
### LEGS_BACKCR

```ml
const LEGS_BACKCR = 31
```

Native lower-body animation slot for the backcr sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L53)

<a id="constant-constant-mq3-client-cgame-players-legs-backwalk-const-legs-backwalk-32-src-mq3-client-cgame-players-ml-884296324"></a>
### LEGS_BACKWALK

```ml
const LEGS_BACKWALK = 32
```

Native lower-body animation slot for the backwalk sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L55)

<a id="constant-constant-mq3-client-cgame-players-legs-idle-const-legs-idle-22-src-mq3-client-cgame-players-ml-1058698473"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```

Native lower-body animation slot for the idle sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L47)

<a id="constant-constant-mq3-client-cgame-players-legs-idlecr-const-legs-idlecr-23-src-mq3-client-cgame-players-ml-893957874"></a>
### LEGS_IDLECR

```ml
const LEGS_IDLECR = 23
```

Native lower-body animation slot for the idlecr sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L49)

<a id="constant-constant-mq3-client-cgame-players-legs-land-const-legs-land-19-src-mq3-client-cgame-players-ml-416266907"></a>
### LEGS_LAND

```ml
const LEGS_LAND = 19
```

Native lower-body animation slot for the land sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L43)

<a id="constant-constant-mq3-client-cgame-players-legs-landb-const-legs-landb-21-src-mq3-client-cgame-players-ml-527838800"></a>
### LEGS_LANDB

```ml
const LEGS_LANDB = 21
```

Native lower-body animation slot for the landb sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L45)

<a id="constant-constant-mq3-client-cgame-players-legs-run-const-legs-run-15-src-mq3-client-cgame-players-ml-437793927"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```

Native lower-body animation slot for the run sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L39)

<a id="constant-constant-mq3-client-cgame-players-legs-turn-const-legs-turn-24-src-mq3-client-cgame-players-ml-1981595659"></a>
### LEGS_TURN

```ml
const LEGS_TURN = 24
```

Native lower-body animation slot for the turn sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L51)

<a id="constant-constant-mq3-client-cgame-players-legs-walk-const-legs-walk-14-src-mq3-client-cgame-players-ml-1614573708"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```

Native lower-body animation slot for the walk sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L37)

<a id="constant-constant-mq3-client-cgame-players-legs-walkcr-const-legs-walkcr-13-src-mq3-client-cgame-players-ml-2135999381"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```

Native lower-body animation slot for the walkcr sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L35)

<a id="function-function-mq3-client-cgame-players-lerpframe-function-lerpframe-src-mq3-client-cgame-players-ml-1812884570"></a>
### lerpFrame

```ml
function lerpFrame()
```

Creates a `mq3.client.cgame_players.LerpFrame` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L347)

- [mq3.client.cgame_players.LerpFrame](Type-mq3-client-cgame-players-lerpframe-13687381.md) — struct
<a id="function-function-mq3-client-cgame-players-lightverts-function-lightverts-normal-vertices-ambient-directed-lightdir-src-mq3-client-cgame-players-ml-1424465285"></a>
### lightVerts

```ml
function lightVerts(normal, vertices, ambient, directed, lightDir)
```

CG_LightVerts

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `vertices` | `dynamic` | — | Value used by `for each vertex in vertices color=[]`. |
| `ambient` | `dynamic` | — | Sequence read at `ambient[i]`. |
| `directed` | `dynamic` | — | Sequence read at `directed[i]`. |
| `lightDir` | `dynamic` | — | Sequence read at `lightDir[0]`, `lightDir[1]`, `lightDir[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L628)

<a id="function-function-mq3-client-cgame-players-loadclientinfo-function-loadclientinfo-state-ci-animationtext-retailactive-src-mq3-client-cgame-players-ml-2101696987"></a>
### loadClientInfo

```ml
function loadClientInfo(state, ci, animationText, retailActive)
```

CG_LoadClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `loadClientInfo`. |
| `ci` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `ci.modelName`, `ci.skinName`, `ci.headModelName`, `ci.headSkinName` and additional values. |
| `animationText` | `dynamic` | — | Value used by `ok=registerClientModelname(state,ci,ci.modelName,ci.skinName,ci.headModelName,ci.headSkinName,"",animationText,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L466)

<a id="function-function-mq3-client-cgame-players-loaddeferredplayers-function-loaddeferredplayers-state-animationtext-lowmemory-retailactive-src-mq3-client-cgame-players-ml-1943850992"></a>
### loadDeferredPlayers

```ml
function loadDeferredPlayers(state, animationText, lowMemory, retailActive)
```

CG_LoadDeferredPlayers

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `animationText` | `dynamic` | — | Value used by `for each ci in state.clients if ci.infoValid and ci.deferred then if lowMemory then ci.deferred=false else loadClientInfo(state,ci,animationTe...`. |
| `lowMemory` | `dynamic` | — | Value used by `for each ci in state.clients if ci.infoValid and ci.deferred then if lowMemory then ci.deferred=false else loadClientInfo(state,ci,animationTe...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L495)

<a id="constant-constant-mq3-client-cgame-players-max-animations-const-max-animations-31-src-mq3-client-cgame-players-ml-784920003"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```

Capacity limit for the animations collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L20)

<a id="constant-constant-mq3-client-cgame-players-max-clients-const-max-clients-64-src-mq3-client-cgame-players-ml-1546309671"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L18)

<a id="constant-constant-mq3-client-cgame-players-max-totalanimations-const-max-totalanimations-36-src-mq3-client-cgame-players-ml-1571840188"></a>
### MAX_TOTALANIMATIONS

```ml
const MAX_TOTALANIMATIONS = 36
```

Capacity limit for the totalanimations collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L22)

<a id="function-function-mq3-client-cgame-players-newclientinfo-function-newclientinfo-state-clientnum-config-animationtext-deferplayers-retailactive-src-mq3-client-cgame-players-ml-877308452"></a>
### newClientInfo

```ml
function newClientInfo(state, clientNum, config, animationText, deferPlayers, retailActive)
```

CG_NewClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `state.clients[clientNum]`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `config` | `dynamic` | — | Value used by `if config=="" then state.clients[clientNum]=clientInfo()`. |
| `animationText` | `dynamic` | — | Value used by `if not scanForExistingClientInfo(state,ci) then if deferPlayers then setDeferredClientInfo(state,ci) else loadClientInfo(state,ci,animationTex...`. |
| `deferPlayers` | `dynamic` | — | Value used by `if not scanForExistingClientInfo(state,ci) then if deferPlayers then setDeferredClientInfo(state,ci) else loadClientInfo(state,ci,animationTex...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L487)

<a id="constant-constant-mq3-client-cgame-players-pain-twitch-time-const-pain-twitch-time-cgabi-pain-twitch-time-src-mq3-client-cgame-players-ml-431845823"></a>
### PAIN_TWITCH_TIME

```ml
const PAIN_TWITCH_TIME = cgabi.PAIN_TWITCH_TIME
```

Duration in milliseconds of the player-model pain twitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L101)

<a id="function-function-mq3-client-cgame-players-parseanimationfile-function-parseanimationfile-filename-text-ci-src-mq3-client-cgame-players-ml-1207714408"></a>
### parseAnimationFile

```ml
function parseAnimationFile(filename, text, ci)
```

CG_ParseAnimationFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — | Accepted for compatibility with `parseAnimationFile`; the current implementation does not read it. |
| `text` | `dynamic` | — | Text whose length/content is inspected by `parseAnimationFile`. |
| `ci` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `ci.footsteps`, `ci.headOffset`, `ci.gender`, `ci.fixedlegs` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L396)

<a id="function-function-mq3-client-cgame-players-player-function-player-state-cent-localteam-shadowtrace-feetcontents-headcontents-splashtrace-retailactive-src-mq3-client-cgame-players-ml-716926067"></a>
### player

```ml
function player(state, cent, localTeam, shadowTrace, feetContents, headContents, splashTrace, retailActive)
```

CG_Player

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `state.actions`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.clientNum`, `cent.number`, `cent.origin`. |
| `localTeam` | `dynamic` | — | Value used by `playerSprites(state,cent,localTeam,retailActive)`. |
| `shadowTrace` | `dynamic` | — | Value used by `shadow=playerShadow(state,cent,shadowTrace,retailActive)`. |
| `feetContents` | `dynamic` | — | Value used by `playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive)`. |
| `headContents` | `dynamic` | — | Value used by `playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive)`. |
| `splashTrace` | `dynamic` | — | Value used by `playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L638)

<a id="function-function-mq3-client-cgame-players-playerangles-function-playerangles-state-cent-src-mq3-client-cgame-players-ml-820035417"></a>
### playerAngles

```ml
function playerAngles(state, cent)
```

CG_PlayerAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `playerAngles`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.eFlags`, `cent.angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L548)

<a id="function-function-mq3-client-cgame-players-playeranimation-function-playeranimation-state-cent-src-mq3-client-cgame-players-ml-150689595"></a>
### playerAnimation

```ml
function playerAnimation(state, cent)
```

CG_PlayerAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.noPlayerAnims`, `state.clients`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.clientNum`, `cent.legsAnim`, `cent.legs.yawing` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L520)

<a id="function-function-mq3-client-cgame-players-playerflag-function-playerflag-state-cent-skin-retailactive-src-mq3-client-cgame-players-ml-1890331057"></a>
### playerFlag

```ml
function playerFlag(state, cent, skin, retailActive)
```

CG_PlayerFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.legsAnim`, `cent.clientNum`, `cent.flag`, `cent.number` and additional values. |
| `skin` | `dynamic` | — | Value used by `effect(state,"scene","tagged-model",cent.number,"flag-flap",skin,cent.origin,void,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L578)

<a id="function-function-mq3-client-cgame-players-playerfloatsprite-function-playerfloatsprite-state-cent-shader-retailactive-src-mq3-client-cgame-players-ml-359507561"></a>
### playerFloatSprite

```ml
function playerFloatSprite(state, cent, shader, retailActive)
```

CG_PlayerFloatSprite

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `playerFloatSprite`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.number`, `cent.origin`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L594)

<a id="function-function-mq3-client-cgame-players-playerpowerups-function-playerpowerups-state-cent-retailactive-src-mq3-client-cgame-players-ml-935712766"></a>
### playerPowerups

```ml
function playerPowerups(state, cent, retailActive)
```

CG_PlayerPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`, `state.actions`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.number`, `cent.origin`, `cent.clientNum`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L588)

<a id="function-function-mq3-client-cgame-players-playershadow-function-playershadow-state-cent-trace-retailactive-src-mq3-client-cgame-players-ml-1260274557"></a>
### playerShadow

```ml
function playerShadow(state, cent, trace, retailActive)
```

CG_PlayerShadow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.shadows`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.number`. |
| `trace` | `dynamic` | — | Record read through `trace.fraction`, `trace.startsolid`, `trace.allsolid`, `trace.endpos`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L606)

<a id="function-function-mq3-client-cgame-players-playersplash-function-playersplash-state-cent-feetcontents-headcontents-trace-retailactive-src-mq3-client-cgame-players-ml-675782279"></a>
### playerSplash

```ml
function playerSplash(state, cent, feetContents, headContents, trace, retailActive)
```

CG_PlayerSplash

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.shadows`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.number`. |
| `feetContents` | `dynamic` | — | Value used by `if state.shadows==0 or (feetContents&56)==0 or (headContents&57)!=0 or trace.fraction==1.0 then return false end if`. |
| `headContents` | `dynamic` | — | Value used by `if state.shadows==0 or (feetContents&56)==0 or (headContents&57)!=0 or trace.fraction==1.0 then return false end if`. |
| `trace` | `dynamic` | — | Record read through `trace.fraction`, `trace.endpos`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L614)

<a id="function-function-mq3-client-cgame-players-playersprites-function-playersprites-state-cent-localteam-retailactive-src-mq3-client-cgame-players-ml-826919542"></a>
### playerSprites

```ml
function playerSprites(state, cent, localTeam, retailActive)
```

CG_PlayerSprites

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.clients`, `state.drawFriend`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.eFlags`, `cent.clientNum`. |
| `localTeam` | `dynamic` | — | Value used by `if (cent.eFlags & EF_DEAD)==0 and state.gametype>=GT_TEAM and state.clients[cent.clientNum].team==localTeam and state.drawFriend then return p...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L600)

<a id="function-function-mq3-client-cgame-players-playertokens-function-playertokens-state-cent-retailactive-src-mq3-client-cgame-players-ml-227006730"></a>
### playerTokens

```ml
function playerTokens(state, cent, retailActive)
```

CG_PlayerTokens

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `playerTokens`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.generic1`, `cent.number`, `cent.origin`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L583)

<a id="constant-constant-mq3-client-cgame-players-pw-battlesuit-const-pw-battlesuit-2-src-mq3-client-cgame-players-ml-1023941073"></a>
### PW_BATTLESUIT

```ml
const PW_BATTLESUIT = 2
```

Player powerup slot for battlesuit, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L67)

<a id="constant-constant-mq3-client-cgame-players-pw-blueflag-const-pw-blueflag-8-src-mq3-client-cgame-players-ml-2143538071"></a>
### PW_BLUEFLAG

```ml
const PW_BLUEFLAG = 8
```

Player powerup slot for blueflag, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L79)

<a id="constant-constant-mq3-client-cgame-players-pw-flight-const-pw-flight-6-src-mq3-client-cgame-players-ml-2076931001"></a>
### PW_FLIGHT

```ml
const PW_FLIGHT = 6
```

Player powerup slot for flight, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L75)

<a id="constant-constant-mq3-client-cgame-players-pw-haste-const-pw-haste-3-src-mq3-client-cgame-players-ml-1499826162"></a>
### PW_HASTE

```ml
const PW_HASTE = 3
```

Player powerup slot for haste, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L69)

<a id="constant-constant-mq3-client-cgame-players-pw-invis-const-pw-invis-4-src-mq3-client-cgame-players-ml-198089619"></a>
### PW_INVIS

```ml
const PW_INVIS = 4
```

Player powerup slot for invis, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L71)

<a id="constant-constant-mq3-client-cgame-players-pw-neutralflag-const-pw-neutralflag-9-src-mq3-client-cgame-players-ml-1272644696"></a>
### PW_NEUTRALFLAG

```ml
const PW_NEUTRALFLAG = 9
```

Player powerup slot for neutralflag, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L81)

<a id="constant-constant-mq3-client-cgame-players-pw-quad-const-pw-quad-1-src-mq3-client-cgame-players-ml-1354318808"></a>
### PW_QUAD

```ml
const PW_QUAD = 1
```

Player powerup slot for quad, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L65)

<a id="constant-constant-mq3-client-cgame-players-pw-redflag-const-pw-redflag-7-src-mq3-client-cgame-players-ml-568005518"></a>
### PW_REDFLAG

```ml
const PW_REDFLAG = 7
```

Player powerup slot for redflag, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L77)

<a id="constant-constant-mq3-client-cgame-players-pw-regen-const-pw-regen-5-src-mq3-client-cgame-players-ml-1775199660"></a>
### PW_REGEN

```ml
const PW_REGEN = 5
```

Player powerup slot for regen, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L73)

<a id="function-function-mq3-client-cgame-players-registerclientmodelname-function-registerclientmodelname-state-ci-modelname-skinname-headmodelname-headskinname-teamname-animationtext-retailactive-src-mq3-client-cgame-players-ml-636464989"></a>
### registerClientModelname

```ml
function registerClientModelname(state, ci, modelName, skinName, headModelName, headSkinName, teamName, animationText, retailActive)
```

CG_RegisterClientModelname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `registerClientModelname`. |
| `ci` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `ci.legsModel`, `ci.torsoModel`, `ci.headModel`, `ci.modelIcon` and additional values. |
| `modelName` | `dynamic` | — | Value used by `if headName=="" then headName=modelName end if`. |
| `skinName` | `dynamic` | — | Value used by `if not registerClientSkin(state,ci,teamName,modelName,skinName,headName,headSkinName,retailActive) then return false end if`. |
| `headModelName` | `dynamic` | — | Value used by `headName=headModelName`. |
| `headSkinName` | `dynamic` | — | Value used by `if not registerClientSkin(state,ci,teamName,modelName,skinName,headName,headSkinName,retailActive) then return false end if`. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |
| `animationText` | `dynamic` | — | Value used by `if not parseAnimationFile("models/players/"+modelName+"/animation.cfg",animationText,ci) then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L455)

<a id="function-function-mq3-client-cgame-players-registerclientskin-function-registerclientskin-state-ci-teamname-modelname-skinname-headmodelname-headskinname-retailactive-src-mq3-client-cgame-players-ml-464498642"></a>
### registerClientSkin

```ml
function registerClientSkin(state, ci, teamName, modelName, skinName, headModelName, headSkinName, retailActive)
```

CG_RegisterClientSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `registerClientSkin`. |
| `ci` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `ci.legsSkin`, `ci.torsoSkin`, `ci.headSkin`. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |
| `modelName` | `dynamic` | — | Value used by `legs=findClientModelFile(state,ci,teamName,modelName,skinName,"lower","skin")`. |
| `skinName` | `dynamic` | — | Value used by `legs=findClientModelFile(state,ci,teamName,modelName,skinName,"lower","skin")`. |
| `headModelName` | `dynamic` | — | Value used by `head=findClientHeadFile(state,ci,teamName,headModelName,headSkinName,"head","skin")`. |
| `headSkinName` | `dynamic` | — | Value used by `head=findClientHeadFile(state,ci,teamName,headModelName,headSkinName,"head","skin")`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L442)

<a id="function-function-mq3-client-cgame-players-resetplayerentity-function-resetplayerentity-state-cent-src-mq3-client-cgame-players-ml-1075845727"></a>
### resetPlayerEntity

```ml
function resetPlayerEntity(state, cent)
```

CG_ResetPlayerEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`, `state.time`. |
| `cent` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `cent.legs`, `cent.torso`, `cent.flag`, `cent.trailTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L642)

<a id="function-function-mq3-client-cgame-players-runlerpframe-function-runlerpframe-state-ci-lf-newanimation-speedscale-src-mq3-client-cgame-players-ml-618076660"></a>
### runLerpFrame

```ml
function runLerpFrame(state, ci, lf, newAnimation, speedScale)
```

CG_RunLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.animSpeed`, `state.time`. |
| `ci` | `dynamic` | — | Client presentation information, including model and player identity. |
| `lf` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `lf.oldFrame`, `lf.frame`, `lf.backlerp`, `lf.oldFrameTime` and additional values. |
| `newAnimation` | `dynamic` | — | Value used by `if newAnimation!=lf.animationNumber or lf.animation==void then setLerpFrameAnimation(ci,lf,newAnimation) end if`. |
| `speedScale` | `dynamic` | — | Value used by `f=n.trunc32((lf.frameTime-lf.animationTime)/anim.frameLerp*speedScale)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L508)

<a id="function-function-mq3-client-cgame-players-scanforexistingclientinfo-function-scanforexistingclientinfo-state-ci-src-mq3-client-cgame-players-ml-376449315"></a>
### scanForExistingClientInfo

```ml
function scanForExistingClientInfo(state, ci)
```

CG_ScanForExistingClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `ci` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `ci.deferred`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L475)

<a id="function-function-mq3-client-cgame-players-setdeferredclientinfo-function-setdeferredclientinfo-state-ci-src-mq3-client-cgame-players-ml-1418101867"></a>
### setDeferredClientInfo

```ml
function setDeferredClientInfo(state, ci)
```

CG_SetDeferredClientInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `ci` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `ci.deferred`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L479)

<a id="function-function-mq3-client-cgame-players-setlerpframeanimation-function-setlerpframeanimation-ci-lf-newanimation-src-mq3-client-cgame-players-ml-620178008"></a>
### setLerpFrameAnimation

```ml
function setLerpFrameAnimation(ci, lf, newAnimation)
```

CG_SetLerpFrameAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ci` | `dynamic` | — | Client presentation information, including model and player identity. Record read through `ci.animations`. |
| `lf` | `dynamic` | — | Mutable client game players record/storage; this routine assigns `lf.animationNumber`, `lf.animation`, `lf.animationTime`. |
| `newAnimation` | `dynamic` | — | Value assigned to `lf.animationNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L501)

- [mq3.client.cgame_players.State](Type-mq3-client-cgame-players-state-2106043254.md) — struct
<a id="function-function-mq3-client-cgame-players-swingangles-function-swingangles-frametime-destination-swingtolerance-clamptolerance-speed-angle-swinging-src-mq3-client-cgame-players-ml-1495101627"></a>
### swingAngles

```ml
function swingAngles(frameTime, destination, swingTolerance, clampTolerance, speed, angle, swinging)
```

CG_SwingAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frameTime` | `dynamic` | — | Value used by `move=frameTime*scale*speed`. |
| `destination` | `dynamic` | — | Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`. |
| `swingTolerance` | `dynamic` | — | Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`. |
| `clampTolerance` | `dynamic` | — | Value used by `if remaining>clampTolerance then angle=angleMod(destination-(clampTolerance-1)) else if remaining<0.0-clampTolerance then angle=angleMod(desti...`. |
| `speed` | `dynamic` | — | Value used by `move=frameTime*scale*speed`. |
| `angle` | `dynamic` | — | Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`. |
| `swinging` | `dynamic` | — | Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L539)

<a id="constant-constant-mq3-client-cgame-players-team-blue-const-team-blue-2-src-mq3-client-cgame-players-ml-1308482485"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L28)

<a id="constant-constant-mq3-client-cgame-players-team-red-const-team-red-1-src-mq3-client-cgame-players-ml-159116556"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L26)

<a id="constant-constant-mq3-client-cgame-players-team-spectator-const-team-spectator-3-src-mq3-client-cgame-players-ml-2009427666"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L30)

<a id="function-function-mq3-client-cgame-players-teamsuffix-function-teamsuffix-state-ci-src-mq3-client-cgame-players-ml-1465920139"></a>
### teamSuffix

```ml
function teamSuffix(state, ci)
```

Evaluates client game players `teamSuffix` and returns `"default"`, `"blue"`, `"red"` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`. |
| `ci` | `dynamic` | — | Client presentation information, including model and player identity. Record read through `ci.team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L409)

<a id="function-function-mq3-client-cgame-players-tokens-function-tokens-text-src-mq3-client-cgame-players-ml-1346406955"></a>
### tokens

```ml
function tokens(text)
```

Calls `decode`, `slice` from client game players `tokens`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `tokens` in the client game players path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L391)

<a id="constant-constant-mq3-client-cgame-players-torso-gesture-const-torso-gesture-6-src-mq3-client-cgame-players-ml-1410037685"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```

Native upper-body animation slot for the gesture sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L63)

- [mq3.client.cgame_players.Trace](Type-mq3-client-cgame-players-trace-110358062.md) — struct
<a id="function-function-mq3-client-cgame-players-trailitem-function-trailitem-state-cent-model-retailactive-src-mq3-client-cgame-players-ml-2010730007"></a>
### trailItem

```ml
function trailItem(state, cent, model, retailActive)
```

CG_TrailItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game players state passed to the helper calls in `trailItem`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.number`, `cent.origin`. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game players operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L572)

<a id="function-function-mq3-client-cgame-players-vertex-function-vertex-origin-src-mq3-client-cgame-players-ml-1059003556"></a>
### vertex

```ml
function vertex(origin)
```

Creates a `mq3.client.cgame_players.Vertex` record. Assigns `origin` from `origin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value used to initialize `Vertex.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L356)

- [mq3.client.cgame_players.Vertex](Type-mq3-client-cgame-players-vertex-2071140647.md) — struct
