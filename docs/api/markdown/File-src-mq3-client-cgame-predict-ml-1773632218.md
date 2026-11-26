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

Updates `ps.events[slot]`, `ps.eventParms[slot]`, `ps.eventSequence` during client game predict `addPredictableEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `ps.events[slot]`, `ps.eventParms[slot]`, `ps.eventSequence`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `parm` | `dynamic` | — | Value used by `ps.eventParms[slot]=parm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L147)

<a id="function-function-mq3-client-cgame-predict-adjusted-function-adjusted-host-origin-ground-fromtime-totime-src-mq3-client-cgame-predict-ml-1117556732"></a>
### adjusted

```ml
function adjusted(host, origin, ground, fromTime, toTime)
```

Calls `mq3.client.cgame_predict.copy3`, `host.moverAdjustFn` from client game predict `adjusted`. The final path returns `host.moverAdjustFn(host,origin,ground,fromTime,toTime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.moverAdjustFn`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `ground` | `dynamic` | — | Value used by `return host.moverAdjustFn(host,origin,ground,fromTime,toTime)`. |
| `fromTime` | `dynamic` | — | Value used by `return host.moverAdjustFn(host,origin,ground,fromTime,toTime)`. |
| `toTime` | `dynamic` | — | Value used by `return host.moverAdjustFn(host,origin,ground,fromTime,toTime)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L238)

<a id="function-function-mq3-client-cgame-predict-buildsolidlist-function-buildsolidlist-state-current-next-nextframeteleport-thisframeteleport-src-mq3-client-cgame-predict-ml-1944321152"></a>
### buildSolidList

```ml
function buildSolidList(state, current, next, nextFrameTeleport, thisFrameTeleport)
```

CG_BuildSolidList.  Snapshot entities already carry the state selected by CG_SetNextSnap, so the native observer can classify them directly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `state.solidEntities`, `state.triggerEntities`. |
| `current` | `dynamic` | — | Value used by `chosen=current`. |
| `next` | `dynamic` | — | Value used by `if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if`. |
| `nextFrameTeleport` | `dynamic` | — | Value used by `if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if`. |
| `thisFrameTeleport` | `dynamic` | — | Value used by `if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L55)

<a id="function-function-mq3-client-cgame-predict-cangrabitem-function-cangrabitem-gametype-ent-ps-src-mq3-client-cgame-predict-ml-2066719582"></a>
### canGrabItem

```ml
function canGrabItem(gametype, ent, ps)
```

Calls `mq3.client.cgame_predict.validItem`, `mq3.game.constants.itemType`, `mq3.game.constants.itemTag` and additional helpers from client game predict `canGrabItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `ent` | `dynamic` | — | Record read through `ent.modelindex`, `ent.modelindex2`. |
| `ps` | `dynamic` | — | Player-state record containing authoritative or predicted player data. Record read through `ps.ammo`, `ps.stats`, `ps.persistant`, `ps.powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L158)

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

Copies the X, Y and Z components into a fresh client game predict vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L46)

<a id="function-function-mq3-client-cgame-predict-create-function-create-src-mq3-client-cgame-predict-ml-247696686"></a>
### create

```ml
function create()
```

Creates a `mq3.client.cgame_predict.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L33)

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

Creates a `mq3.client.cgame_predict.Entity` record. Assigns `state` from `source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.origin`, `source.angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L41)

- [mq3.client.cgame_predict.Entity](Type-mq3-client-cgame-predict-entity-1308975735.md) — struct
<a id="function-function-mq3-client-cgame-predict-interpolateplayerstate-function-interpolateplayerstate-current-next-time-grabangles-latestcommand-nextframeteleport-src-mq3-client-cgame-predict-ml-165785488"></a>
### interpolatePlayerState

```ml
function interpolatePlayerState(current, next, time, grabAngles, latestCommand, nextFrameTeleport)
```

CG_InterpolatePlayerState.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — | Record read through `current.playerState`, `current.serverTime`, `current.playerState.bobCycle`, `current.playerState.origin` and additional values. |
| `next` | `dynamic` | — | Record read through `next.serverTime`, `next.playerState.bobCycle`, `next.playerState.origin`, `next.playerState.viewangles` and additional values. |
| `time` | `dynamic` | — | Value used by `fraction=n.f32((time-current.serverTime)*1.0/(next.serverTime-current.serverTime))`. |
| `grabAngles` | `dynamic` | — | Value used by `if grabAngles and latestCommand!=void then pmove.updateViewAngles(output,latestCommand) end if`. |
| `latestCommand` | `dynamic` | — | Value used by `if grabAngles and latestCommand!=void then pmove.updateViewAngles(output,latestCommand) end if`. |
| `nextFrameTeleport` | `dynamic` | — | Value used by `if nextFrameTeleport or next==void or next.serverTime<=current.serverTime then return output end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L127)

<a id="function-function-mq3-client-cgame-predict-latest-function-latest-commands-src-mq3-client-cgame-predict-ml-1697280428"></a>
### latest

```ml
function latest(commands)
```

Evaluates client game predict `latest` and returns `void`, `commands[len(commands)-1]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Sequence read at `commands[len(commands)-1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L231)

<a id="function-function-mq3-client-cgame-predict-lerpangle-function-lerpangle-first-second-fraction-src-mq3-client-cgame-predict-ml-274771106"></a>
### lerpAngle

```ml
function lerpAngle(first, second, fraction)
```

Calls `mq3.compat.numeric.f32` from client game predict `lerpAngle`. The final path returns `n.f32(first+fraction*delta)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Value used by `delta=second-first`. |
| `second` | `dynamic` | — | Value used by `delta=second-first`. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L115)

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
| `state` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `state.pointCount`. |
| `host` | `dynamic` | — | Record read through `host.worldPointFn`, `host.entityPointFn`. |
| `point` | `dynamic` | — | Value used by `contents=host.worldPointFn(host,point)`. |
| `passEntityNum` | `dynamic` | — | Value used by `if value.state.number==passEntityNum or value.state.solid!=SOLID_BMODEL then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L98)

<a id="function-function-mq3-client-cgame-predict-predict-function-predict-state-current-next-time-oldtime-commands-demoplayback-nopredict-synchronousclients-nextframeteleport-thisframeteleport-gametype-predictitems-pmovefixed-pmovemsec-host-src-mq3-client-cgame-predict-ml-1875758669"></a>
### predict

```ml
function predict(state, current, next, time, oldTime, commands, demoPlayback, noPredict, synchronousClients, nextFrameTeleport, thisFrameTeleport, gametype, predictItems, pmoveFixed, pmoveMsec, host)
```

CG_PredictPlayerState.  This is deliberately an observer: all state is a deep copy and transition delivery is counted rather than emitted.  Retail cgame.qvm continues to own visible gameplay and event dispatch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `state.hyperspace`, `state.packetBackupExceeded`, `state.valid`, `state.predicted` and additional values. |
| `current` | `dynamic` | — | Record read through `current.playerState`, `current.playerState.pm_flags`, `current.playerState.commandTime`, `current.playerState.persistant`. |
| `next` | `dynamic` | — | Value used by `build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)`. |
| `time` | `dynamic` | — | Value used by `if demoPlayback or (current.playerState.pm_flags&PMF_FOLLOW)!=0 then state.predicted=interpolatePlayerState(current,next,time,false,command,ne...`. |
| `oldTime` | `dynamic` | — | Value assigned to `state.predictedErrorTime`. |
| `commands` | `dynamic` | — | Sequence read at `commands[0]`. |
| `demoPlayback` | `dynamic` | — | Value used by `if demoPlayback or (current.playerState.pm_flags&PMF_FOLLOW)!=0 then state.predicted=interpolatePlayerState(current,next,time,false,command,ne...`. |
| `noPredict` | `dynamic` | — | Value used by `if noPredict or synchronousClients then state.predicted=interpolatePlayerState(current,next,time,true,command,nextFrameTeleport)`. |
| `synchronousClients` | `dynamic` | — | Value used by `if noPredict or synchronousClients then state.predicted=interpolatePlayerState(current,next,time,true,command,nextFrameTeleport)`. |
| `nextFrameTeleport` | `dynamic` | — | Value used by `build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)`. |
| `thisFrameTeleport` | `dynamic` | — | Value used by `build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `predictItems` | `dynamic` | — | Value used by `triggers=touchTriggerPrediction(state,host,time,gametype,predictItems,move.k.mins,move.k.maxs)`. |
| `pmoveFixed` | `dynamic` | — | Value assigned to `move.fixed`. |
| `pmoveMsec` | `dynamic` | — | Value used by `interval=pmoveMsec`. |
| `host` | `dynamic` | — | host record passed to the client game predict helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L261)

<a id="function-function-mq3-client-cgame-predict-predictionpoint-function-predictionpoint-p-point-src-mq3-client-cgame-predict-ml-555319654"></a>
### predictionPoint

```ml
function predictionPoint(p, point)
```

Calls `mq3.client.cgame_predict.pointContents` from client game predict `predictionPoint`. The final path returns `pointContents(run.observer,run.services,point,p.ps.clientNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record read through `p.context`, `p.ps.clientNum`. |
| `point` | `dynamic` | — | Value used by `return pointContents(run.observer,run.services,point,p.ps.clientNum)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L226)

<a id="function-function-mq3-client-cgame-predict-predictiontrace-function-predictiontrace-p-start-finish-src-mq3-client-cgame-predict-ml-1279944035"></a>
### predictionTrace

```ml
function predictionTrace(p, start, finish)
```

Calls `mq3.client.cgame_predict.trace` from client game predict `predictionTrace`. The final path returns `trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record read through `p.context`, `p.k.mins`, `p.k.maxs`, `p.ps.clientNum` and additional values. |
| `start` | `dynamic` | — | Value used by `return trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)`. |
| `finish` | `dynamic` | — | Value used by `return trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L220)

- [mq3.client.cgame_predict.RunContext](Type-mq3-client-cgame-predict-runcontext-629411760.md) — struct
<a id="function-function-mq3-client-cgame-predict-services-function-services-context-src-mq3-client-cgame-predict-ml-473591055"></a>
### services

```ml
function services(context)
```

Creates a `mq3.client.cgame_predict.Services` record. Assigns `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L38)

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
| `state` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `state.eFlags`, `state.predicted.stats[c.STAT_WEAPONS]`, `state.predicted.ammo[tag]`. |
| `value` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `value.state.eFlags`, `value.miscTime`. |
| `time` | `dynamic` | — | Value assigned to `value.miscTime`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `predictItems` | `dynamic` | — | Value used by `if not predictItems then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L181)

<a id="function-function-mq3-client-cgame-predict-touchtriggerprediction-function-touchtriggerprediction-state-host-time-gametype-predictitems-mins-maxs-src-mq3-client-cgame-predict-ml-680916901"></a>
### touchTriggerPrediction

```ml
function touchTriggerPrediction(state, host, time, gametype, predictItems, mins, maxs)
```

CG_TouchTriggerPrediction.  Contact against inline trigger models remains an engine callback, while item, teleport and jump-pad effects are native here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `state.hyperspace`. |
| `host` | `dynamic` | — | Record read through `host.triggerTouchFn`. |
| `time` | `dynamic` | — | Value used by `if ent.eType==c.ET_ITEM and not spectator then picked=touchItem(state,value,time,gametype,predictItems)`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `predictItems` | `dynamic` | — | Value used by `if ent.eType==c.ET_ITEM and not spectator then picked=touchItem(state,value,time,gametype,predictItems)`. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L201)

<a id="function-function-mq3-client-cgame-predict-trace-function-trace-state-host-start-mins-maxs-finish-skipnumber-mask-src-mq3-client-cgame-predict-ml-2057655358"></a>
### trace

```ml
function trace(state, host, start, mins, maxs, finish, skipNumber, mask)
```

CG_ClipMoveToEntities / CG_Trace.  Collision details stay owned by the engine callback; the original nearest/allsolid/startsolid merge is here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game predict record/storage; this routine assigns `state.traceCount`. |
| `host` | `dynamic` | — | Record read through `host.worldTraceFn`, `host.entityTraceFn`. |
| `start` | `dynamic` | — | Value used by `result=host.worldTraceFn(host,start,mins,maxs,finish,mask)`. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |
| `finish` | `dynamic` | — | Value used by `result=host.worldTraceFn(host,start,mins,maxs,finish,mask)`. |
| `skipNumber` | `dynamic` | — | Value used by `if value.state.number==skipNumber then continue end if`. |
| `mask` | `dynamic` | — | Value used by `result=host.worldTraceFn(host,start,mins,maxs,finish,mask)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L77)

<a id="function-function-mq3-client-cgame-predict-validitem-function-validitem-index-src-mq3-client-cgame-predict-ml-2122961976"></a>
### validItem

```ml
function validItem(index)
```

Computes `typeof(index)=="int" and index>0 and index<36` for client game predict `validItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value used by `return typeof(index)=="int" and index>0 and index<36`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L153)
