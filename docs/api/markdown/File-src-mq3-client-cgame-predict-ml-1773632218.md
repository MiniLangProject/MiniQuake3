# `src/mq3/client/cgame_predict.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_predict`](Package-mq3-client-cgame-predict-2054468138.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/jumppad.ml` as `jumppad` → [src/mq3/game/jumppad.ml](File-src-mq3-game-jumppad-ml-1270203041.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/pmove.ml` as `pmove` → [src/mq3/game/pmove.ml](File-src-mq3-game-pmove-ml-1046301421.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)

## Declarations

<a id="function-function-mq3-client-cgame-predict-addpredictableevent-function-addpredictableevent-ps-event-parm-src-mq3-client-cgame-predict-ml-634638465"></a>
### addPredictableEvent

```ml
function addPredictableEvent(ps, event, parm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `parm` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L105)

<a id="function-function-mq3-client-cgame-predict-adjusted-function-adjusted-host-origin-ground-fromtime-totime-src-mq3-client-cgame-predict-ml-1117556732"></a>
### adjusted

```ml
function adjusted(host, origin, ground, fromTime, toTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `ground` | `dynamic` | — |  |
| `fromTime` | `dynamic` | — |  |
| `toTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L163)

<a id="function-function-mq3-client-cgame-predict-buildsolidlist-function-buildsolidlist-state-current-next-nextframeteleport-thisframeteleport-src-mq3-client-cgame-predict-ml-1944321152"></a>
### buildSolidList

```ml
function buildSolidList(state, current, next, nextFrameTeleport, thisFrameTeleport)
```

CG_BuildSolidList.  Snapshot entities already carry the state selected by CG_SetNextSnap, so the native observer can classify them directly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |
| `next` | `dynamic` | — |  |
| `nextFrameTeleport` | `dynamic` | — |  |
| `thisFrameTeleport` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L39)

<a id="function-function-mq3-client-cgame-predict-cangrabitem-function-cangrabitem-gametype-ent-ps-src-mq3-client-cgame-predict-ml-2066719582"></a>
### canGrabItem

```ml
function canGrabItem(gametype, ent, ps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L110)

<a id="constant-constant-mq3-client-cgame-predict-cmd-backup-const-cmd-backup-64-src-mq3-client-cgame-predict-ml-832782479"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L16)

<a id="constant-constant-mq3-client-cgame-predict-contents-body-const-contents-body-33554432-src-mq3-client-cgame-predict-ml-1329298476"></a>
### CONTENTS_BODY

```ml
const CONTENTS_BODY = 33554432
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L19)

<a id="function-function-mq3-client-cgame-predict-copy3-function-copy3-value-src-mq3-client-cgame-predict-ml-137320633"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L35)

<a id="function-function-mq3-client-cgame-predict-create-function-create-src-mq3-client-cgame-predict-ml-247696686"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L28)

<a id="constant-constant-mq3-client-cgame-predict-ef-nodraw-const-ef-nodraw-128-src-mq3-client-cgame-predict-ml-1034047928"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L21)

<a id="function-function-mq3-client-cgame-predict-entity-function-entity-source-src-mq3-client-cgame-predict-ml-1769309689"></a>
### entity

```ml
function entity(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L32)

- [mq3.client.cgame_predict.Entity](Type-mq3-client-cgame-predict-entity-1308975735.md) — struct
<a id="function-function-mq3-client-cgame-predict-interpolateplayerstate-function-interpolateplayerstate-current-next-time-grabangles-latestcommand-nextframeteleport-src-mq3-client-cgame-predict-ml-165785488"></a>
### interpolatePlayerState

```ml
function interpolatePlayerState(current, next, time, grabAngles, latestCommand, nextFrameTeleport)
```

CG_InterpolatePlayerState.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — |  |
| `next` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `grabAngles` | `dynamic` | — |  |
| `latestCommand` | `dynamic` | — |  |
| `nextFrameTeleport` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L89)

<a id="function-function-mq3-client-cgame-predict-latest-function-latest-commands-src-mq3-client-cgame-predict-ml-1697280428"></a>
### latest

```ml
function latest(commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L162)

<a id="function-function-mq3-client-cgame-predict-lerpangle-function-lerpangle-first-second-fraction-src-mq3-client-cgame-predict-ml-274771106"></a>
### lerpAngle

```ml
function lerpAngle(first, second, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L83)

<a id="constant-constant-mq3-client-cgame-predict-mask-playersolid-const-mask-playersolid-33619969-src-mq3-client-cgame-predict-ml-1001955069"></a>
### MASK_PLAYERSOLID

```ml
const MASK_PLAYERSOLID = 33619969
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L18)

<a id="constant-constant-mq3-client-cgame-predict-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-predict-ml-253021662"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L20)

<a id="function-function-mq3-client-cgame-predict-pointcontents-function-pointcontents-state-host-point-passentitynum-src-mq3-client-cgame-predict-ml-2133033035"></a>
### pointContents

```ml
function pointContents(state, host, point, passEntityNum)
```

CG_PointContents.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `passEntityNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L70)

<a id="function-function-mq3-client-cgame-predict-predict-function-predict-state-current-next-time-oldtime-commands-demoplayback-nopredict-synchronousclients-nextframeteleport-thisframeteleport-gametype-predictitems-pmovefixed-pmovemsec-host-src-mq3-client-cgame-predict-ml-1875758669"></a>
### predict

```ml
function predict(state, current, next, time, oldTime, commands, demoPlayback, noPredict, synchronousClients, nextFrameTeleport, thisFrameTeleport, gametype, predictItems, pmoveFixed, pmoveMsec, host)
```

CG_PredictPlayerState.  This is deliberately an observer: all state is a deep copy and transition delivery is counted rather than emitted.  Retail cgame.qvm continues to own visible gameplay and event dispatch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |
| `next` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `oldTime` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |
| `demoPlayback` | `dynamic` | — |  |
| `noPredict` | `dynamic` | — |  |
| `synchronousClients` | `dynamic` | — |  |
| `nextFrameTeleport` | `dynamic` | — |  |
| `thisFrameTeleport` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `predictItems` | `dynamic` | — |  |
| `pmoveFixed` | `dynamic` | — |  |
| `pmoveMsec` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L170)

<a id="function-function-mq3-client-cgame-predict-predictionpoint-function-predictionpoint-p-point-src-mq3-client-cgame-predict-ml-555319654"></a>
### predictionPoint

```ml
function predictionPoint(p, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L159)

<a id="function-function-mq3-client-cgame-predict-predictiontrace-function-predictiontrace-p-start-finish-src-mq3-client-cgame-predict-ml-1279944035"></a>
### predictionTrace

```ml
function predictionTrace(p, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L156)

- [mq3.client.cgame_predict.RunContext](Type-mq3-client-cgame-predict-runcontext-629411760.md) — struct
<a id="function-function-mq3-client-cgame-predict-services-function-services-context-src-mq3-client-cgame-predict-ml-473591055"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L31)

- [mq3.client.cgame_predict.Services](Type-mq3-client-cgame-predict-services-648933540.md) — struct
<a id="constant-constant-mq3-client-cgame-predict-solid-bmodel-const-solid-bmodel-16777215-src-mq3-client-cgame-predict-ml-274043939"></a>
### SOLID_BMODEL

```ml
const SOLID_BMODEL = 16777215
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L17)

- [mq3.client.cgame_predict.State](Type-mq3-client-cgame-predict-state-1394042129.md) — struct
<a id="function-function-mq3-client-cgame-predict-touchitem-function-touchitem-state-value-time-gametype-predictitems-src-mq3-client-cgame-predict-ml-1840538280"></a>
### touchItem

```ml
function touchItem(state, value, time, gametype, predictItems)
```

CG_TouchItem.  The shared trajectory and item rules are the same native BG_PlayerTouchesItem/BG_CanItemBeGrabbed ports used by qagame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `predictItems` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L128)

<a id="function-function-mq3-client-cgame-predict-touchtriggerprediction-function-touchtriggerprediction-state-host-time-gametype-predictitems-mins-maxs-src-mq3-client-cgame-predict-ml-680916901"></a>
### touchTriggerPrediction

```ml
function touchTriggerPrediction(state, host, time, gametype, predictItems, mins, maxs)
```

CG_TouchTriggerPrediction.  Contact against inline trigger models remains an engine callback, while item, teleport and jump-pad effects are native here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `predictItems` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L141)

<a id="function-function-mq3-client-cgame-predict-trace-function-trace-state-host-start-mins-maxs-finish-skipnumber-mask-src-mq3-client-cgame-predict-ml-2057655358"></a>
### trace

```ml
function trace(state, host, start, mins, maxs, finish, skipNumber, mask)
```

CG_ClipMoveToEntities / CG_Trace.  Collision details stay owned by the engine callback; the original nearest/allsolid/startsolid merge is here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `skipNumber` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L53)

<a id="function-function-mq3-client-cgame-predict-validitem-function-validitem-index-src-mq3-client-cgame-predict-ml-2122961976"></a>
### validItem

```ml
function validItem(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L109)
