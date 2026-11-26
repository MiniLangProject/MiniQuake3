# `src/mq3/client/cgame_event.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_event`](Package-mq3-client-cgame-event-203656351.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)

## Declarations

<a id="function-function-mq3-client-cgame-event-action-function-action-boundary-kind-entity-channel-parm-origin-origin2-weapon-other-text-dispatched-src-mq3-client-cgame-event-ml-1910682404"></a>
### action

```ml
function action(boundary, kind, entity, channel, parm, origin, origin2, weapon, other, text, dispatched)
```

Creates a `mq3.client.cgame_event.Action` record. Assigns `boundary` from `boundary`, `kind` from `kind`, `entity` from `entity`, `channel` from `channel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — | Value used to initialize `Action.boundary`. |
| `kind` | `dynamic` | — | Value used to initialize `Action.kind`. |
| `entity` | `dynamic` | — | Value used to initialize `Action.entity`. |
| `channel` | `dynamic` | — | Value used to initialize `Action.channel`. |
| `parm` | `dynamic` | — | Value used to initialize `Action.parm`. |
| `origin` | `dynamic` | — | Value used to initialize `Action.origin`. |
| `origin2` | `dynamic` | — | Value used to initialize `Action.origin2`. |
| `weapon` | `dynamic` | — | Value used to initialize `Action.weapon`. |
| `other` | `dynamic` | — | Value used to initialize `Action.other`. |
| `text` | `dynamic` | — | Value used to initialize `Action.text`. |
| `dispatched` | `dynamic` | — | Value used to initialize `Action.dispatched`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L172)

- [mq3.client.cgame_event.Action](Type-mq3-client-cgame-event-action-1706863217.md) — struct
<a id="function-function-mq3-client-cgame-event-appendaction-function-appendaction-value-result-boundary-kind-entity-channel-parm-origin-origin2-weapon-other-text-emit-src-mq3-client-cgame-event-ml-1273572526"></a>
### appendAction

```ml
function appendAction(value, result, boundary, kind, entity, channel, parm, origin, origin2, weapon, other, text, emit)
```

Updates `value.audio`, `value.render`, `value.hud`, `value.stateActions` and additional values during client game event `appendAction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.audio`, `value.render`, `value.hud`, `value.stateActions` and additional values. |
| `result` | `dynamic` | — | Value used by `result=result+[item]`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `entity` | `dynamic` | — | Value used by `item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)`. |
| `channel` | `dynamic` | — | Value used by `item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)`. |
| `parm` | `dynamic` | — | Value used by `item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. |
| `weapon` | `dynamic` | — | Value used by `item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)`. |
| `other` | `dynamic` | — | Value used by `item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `appendAction` in the client game event path. |
| `emit` | `dynamic` | — | Value used by `item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L189)

<a id="function-function-mq3-client-cgame-event-audio-function-audio-value-result-kind-entity-channel-parm-origin-emit-src-mq3-client-cgame-event-ml-1193229795"></a>
### audio

```ml
function audio(value, result, kind, entity, channel, parm, origin, emit)
```

Adapts `mq3.client.cgame_event.appendAction` to client game event `audio`, returning its result for `value, result, "audio", kind, entity, channel, parm, origin, void, 0, 0, "", emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_event.appendAction`. |
| `result` | `dynamic` | — | Argument 2 of `mq3.client.cgame_event.appendAction`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_event.appendAction`. |
| `entity` | `dynamic` | — | Argument 5 of `mq3.client.cgame_event.appendAction`. |
| `channel` | `dynamic` | — | Argument 6 of `mq3.client.cgame_event.appendAction`. |
| `parm` | `dynamic` | — | Argument 7 of `mq3.client.cgame_event.appendAction`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_event.appendAction`. |
| `emit` | `dynamic` | — | Argument 13 of `mq3.client.cgame_event.appendAction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L357)

<a id="constant-constant-mq3-client-cgame-event-chan-auto-const-chan-auto-0-src-mq3-client-cgame-event-ml-1623963607"></a>
### CHAN_AUTO

```ml
const CHAN_AUTO = 0
```

Sound-channel selector allowing the mixer to choose an available channel automatically.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L26)

<a id="constant-constant-mq3-client-cgame-event-chan-body-const-chan-body-4-src-mq3-client-cgame-event-ml-482285279"></a>
### CHAN_BODY

```ml
const CHAN_BODY = 4
```

Sound channel used for an entity's body-related effects such as movement feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L32)

<a id="constant-constant-mq3-client-cgame-event-chan-item-const-chan-item-3-src-mq3-client-cgame-event-ml-1524241058"></a>
### CHAN_ITEM

```ml
const CHAN_ITEM = 3
```

Sound channel used for item-related sounds associated with an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L30)

<a id="constant-constant-mq3-client-cgame-event-chan-voice-const-chan-voice-2-src-mq3-client-cgame-event-ml-1196890077"></a>
### CHAN_VOICE

```ml
const CHAN_VOICE = 2
```

Sound channel used for an entity's voice and voice-chat playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L28)

<a id="function-function-mq3-client-cgame-event-checkevent-function-checkevent-value-es-servertime-retailactive-src-mq3-client-cgame-event-ml-1312482830"></a>
### checkEvent

```ml
function checkEvent(value, es, serverTime, retailActive)
```

CG_CheckEvents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.previousEvents[sourceEntity]`, `value.eventOnly[sourceEntity]`, `value.seenTime[sourceEntity]`, `value.records` and additional values. |
| `es` | `dynamic` | — | Record read through `es.number`, `es.event`, `es.eType`, `es.eFlags` and additional values. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L456)

<a id="function-function-mq3-client-cgame-event-clearboundaryqueues-function-clearboundaryqueues-value-src-mq3-client-cgame-event-ml-943721301"></a>
### clearBoundaryQueues

```ml
function clearBoundaryQueues(value)
```

Updates `value.audio`, `value.render`, `value.hud`, `value.stateActions` during client game event `clearBoundaryQueues`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.audio`, `value.render`, `value.hud`, `value.stateActions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L486)

<a id="function-function-mq3-client-cgame-event-create-function-create-maxentities-src-mq3-client-cgame-event-ml-675101583"></a>
### create

```ml
function create(maxEntities)
```

Creates a `mq3.client.cgame_event.State` record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — | Value used to initialize `State.previousEvents`, `State.eventOnly`, `State.seenTime`, `State.painTime`, `State.painDirection`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L156)

<a id="constant-constant-mq3-client-cgame-event-ef-kamikaze-const-ef-kamikaze-1048576-src-mq3-client-cgame-event-ml-1548906774"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 1048576
```

Entity-state flag selecting kamikaze behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L14)

<a id="constant-constant-mq3-client-cgame-event-ef-player-event-const-ef-player-event-16-src-mq3-client-cgame-event-ml-1991195286"></a>
### EF_PLAYER_EVENT

```ml
const EF_PLAYER_EVENT = 16
```

Entity-state flag selecting player event behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L12)

<a id="function-function-mq3-client-cgame-event-entityevent-function-entityevent-value-es-entity-position-event-emit-src-mq3-client-cgame-event-ml-136913388"></a>
### entityEvent

```ml
function entityEvent(value, es, entity, position, event, emit)
```

CG_EntityEvent.  Symbolic media names preserve the exact choice point; the active retail VM resolves them to registered handles and owns emission.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.stepChange`, `value.stepTime`, `value.painTime[entity]`, `value.landChange` and additional values. |
| `es` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `es.loopSound`. |
| `entity` | `dynamic` | — | Value used by `if event>=1 and event<=5 then result=audio(value,result,eventName(event),entity,CHAN_BODY,es.eventParm,position,emit)`. |
| `position` | `dynamic` | — | Value used by `if event>=1 and event<=5 then result=audio(value,result,eventName(event),entity,CHAN_BODY,es.eventParm,position,emit)`. |
| `event` | `dynamic` | — | Value assigned to `value.powerupActive`. |
| `emit` | `dynamic` | — | Value used by `if event>=1 and event<=5 then result=audio(value,result,eventName(event),entity,CHAN_BODY,es.eventParm,position,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L398)

<a id="constant-constant-mq3-client-cgame-event-et-events-const-et-events-13-src-mq3-client-cgame-event-ml-865218873"></a>
### ET_EVENTS

```ml
const ET_EVENTS = 13
```

Base entity-type value for event-only entities; the event identifier is added to this value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L16)

<a id="constant-constant-mq3-client-cgame-event-ev-event-bits-const-ev-event-bits-768-src-mq3-client-cgame-event-ml-1213798368"></a>
### EV_EVENT_BITS

```ml
const EV_EVENT_BITS = 768
```

Mask selecting the event-toggle bits used to distinguish repeated entity events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L10)

<a id="function-function-mq3-client-cgame-event-eventname-function-eventname-event-src-mq3-client-cgame-event-ml-1973641318"></a>
### eventName

```ml
function eventName(event)
```

Evaluates client game event `eventName` and returns `"EV_NONE"`, `"EV_FOOTSTEP"`, `"EV_FOOTSTEP_METAL"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L218)

<a id="function-function-mq3-client-cgame-event-itempickup-function-itempickup-value-itemnum-isweapon-weapontag-autoswitch-src-mq3-client-cgame-event-ml-123293999"></a>
### itemPickup

```ml
function itemPickup(value, itemNum, isWeapon, weaponTag, autoSwitch)
```

CG_ItemPickup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.itemPickup`, `value.itemPickupTime`, `value.itemPickupBlendTime`, `value.weaponSelectTime` and additional values. |
| `itemNum` | `dynamic` | — | Value assigned to `value.itemPickup`. |
| `isWeapon` | `dynamic` | — | Value used by `if isWeapon and autoSwitch and weaponTag!=2 then value.weaponSelectTime=value.time`. |
| `weaponTag` | `dynamic` | — | Value assigned to `value.weaponSelect`. |
| `autoSwitch` | `dynamic` | — | Value used by `if isWeapon and autoSwitch and weaponTag!=2 then value.weaponSelectTime=value.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L332)

<a id="constant-constant-mq3-client-cgame-event-max-clients-const-max-clients-64-src-mq3-client-cgame-event-ml-772537907"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L20)

<a id="constant-constant-mq3-client-cgame-event-max-step-change-const-max-step-change-cgabi-max-step-change-src-mq3-client-cgame-event-ml-444929043"></a>
### MAX_STEP_CHANGE

```ml
const MAX_STEP_CHANGE = cgabi.MAX_STEP_CHANGE
```

Largest vertical step displacement accepted by stair-step view smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L24)

<a id="function-function-mq3-client-cgame-event-obituary-function-obituary-value-es-position-emit-src-mq3-client-cgame-event-ml-1596065159"></a>
### obituary

```ml
function obituary(value, es, position, emit)
```

CG_Obituary is kept semantic here: the full target, attacker and means of death reach the HUD boundary, where configured player names/gender live.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_event.appendAction`. |
| `es` | `dynamic` | — | Record read through `es.otherEntityNum`, `es.eventParm`, `es.otherEntityNum2`. |
| `position` | `dynamic` | — | Argument 8 of `mq3.client.cgame_event.appendAction`. |
| `emit` | `dynamic` | — | Argument 13 of `mq3.client.cgame_event.appendAction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L344)

<a id="function-function-mq3-client-cgame-event-observesnapshot-function-observesnapshot-value-snapshot-retailactive-src-mq3-client-cgame-event-ml-908313664"></a>
### observeSnapshot

```ml
function observeSnapshot(value, snapshot, retailActive)
```

Updates `value.time`, `value.predictedClient`, `value.follow` during client game event `observeSnapshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.time`, `value.predictedClient`, `value.follow`. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.serverTime`, `snapshot.playerState.clientNum`, `snapshot.playerState.pm_flags`, `snapshot.entities`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L477)

<a id="function-function-mq3-client-cgame-event-painevent-function-painevent-value-entity-health-origin-emit-src-mq3-client-cgame-event-ml-1293288055"></a>
### painEvent

```ml
function painEvent(value, entity, health, origin, emit)
```

CG_PainEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game event record/storage; this routine assigns `value.painTime[entity]`, `value.painDirection[entity]`. |
| `entity` | `dynamic` | — | Value used by `if entity<0 or entity>=len(value.painTime) then return [] end if`. |
| `health` | `dynamic` | — | Value used by `return appendAction(value,[],"audio","custom:"+painSound(health),entity,CHAN_VOICE,health,origin,void,0,0,"",emit)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `emit` | `dynamic` | — | Value used by `return appendAction(value,[],"audio","custom:"+painSound(health),entity,CHAN_VOICE,health,origin,void,0,0,"",emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L319)

<a id="function-function-mq3-client-cgame-event-painsound-function-painsound-health-src-mq3-client-cgame-event-ml-1186138798"></a>
### painSound

```ml
function painSound(health)
```

Evaluates client game event `painSound` and returns `"*pain25_1.wav"`, `"*pain50_1.wav"`, `"*pain75_1.wav"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — | Value used by `if health<25 then return "*pain25_1.wav" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L309)

<a id="function-function-mq3-client-cgame-event-placestring-function-placestring-rank-src-mq3-client-cgame-event-ml-231557648"></a>
### placeString

```ml
function placeString(rank)
```

CG_PlaceString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rank` | `dynamic` | — | Value used by `if (rank&RANK_TIED_FLAG)!=0 then rank=rank&(~RANK_TIED_FLAG)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L201)

<a id="constant-constant-mq3-client-cgame-event-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-cgame-event-ml-60558789"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```

Bit marking that the stored rank is tied with another player's rank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L18)

- [mq3.client.cgame_event.Record](Type-mq3-client-cgame-event-record-1476129810.md) — struct
<a id="function-function-mq3-client-cgame-event-render-function-render-value-result-kind-es-position-emit-src-mq3-client-cgame-event-ml-1061631146"></a>
### render

```ml
function render(value, result, kind, es, position, emit)
```

Adapts `mq3.client.cgame_event.appendAction` to client game event `render`, returning its result for `value, result, "render", kind, es.number, 0, es.eventParm, position, es.origin2, es.weapon, es.otherEntityNum, "", emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_event.appendAction`. |
| `result` | `dynamic` | — | Argument 2 of `mq3.client.cgame_event.appendAction`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_event.appendAction`. |
| `es` | `dynamic` | — | Record read through `es.number`, `es.eventParm`, `es.origin2`, `es.weapon` and additional values. |
| `position` | `dynamic` | — | Argument 8 of `mq3.client.cgame_event.appendAction`. |
| `emit` | `dynamic` | — | Argument 13 of `mq3.client.cgame_event.appendAction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L365)

- [mq3.client.cgame_event.State](Type-mq3-client-cgame-event-state-229090580.md) — struct
<a id="function-function-mq3-client-cgame-event-stateaction-function-stateaction-value-result-kind-es-position-emit-src-mq3-client-cgame-event-ml-1873369636"></a>
### stateAction

```ml
function stateAction(value, result, kind, es, position, emit)
```

Adapts `mq3.client.cgame_event.appendAction` to client game event `stateAction`, returning its result for `value, result, "state", kind, es.number, 0, es.eventParm, position, es.origin2, es.weapon, es.otherEntityNum, "", emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_event.appendAction`. |
| `result` | `dynamic` | — | Argument 2 of `mq3.client.cgame_event.appendAction`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_event.appendAction`. |
| `es` | `dynamic` | — | Record read through `es.number`, `es.eventParm`, `es.origin2`, `es.weapon` and additional values. |
| `position` | `dynamic` | — | Argument 8 of `mq3.client.cgame_event.appendAction`. |
| `emit` | `dynamic` | — | Argument 13 of `mq3.client.cgame_event.appendAction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L373)

<a id="constant-constant-mq3-client-cgame-event-step-time-const-step-time-cgabi-step-time-src-mq3-client-cgame-event-ml-2077446203"></a>
### STEP_TIME

```ml
const STEP_TIME = cgabi.STEP_TIME
```

Duration in milliseconds of camera smoothing after stepping onto a ledge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L22)

<a id="function-function-mq3-client-cgame-event-useitem-function-useitem-value-es-position-event-emit-src-mq3-client-cgame-event-ml-1036319601"></a>
### useItem

```ml
function useItem(value, es, position, event, emit)
```

CG_UseItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.predictedClient`. |
| `es` | `dynamic` | — | Record read through `es.number`. |
| `position` | `dynamic` | — | Value used by `if es.number==value.predictedClient then result=appendAction(value,result,"hud","use-item",es.number,0,itemNum,position,void,0,0,"",emit) end if`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `emit` | `dynamic` | — | Value used by `if es.number==value.predictedClient then result=appendAction(value,result,"hud","use-item",es.number,0,itemNum,position,void,0,0,"",emit) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L381)
