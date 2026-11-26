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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `parm` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `dispatched` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L30)

- [mq3.client.cgame_event.Action](Type-mq3-client-cgame-event-action-1706863217.md) — struct
<a id="function-function-mq3-client-cgame-event-appendaction-function-appendaction-value-result-boundary-kind-entity-channel-parm-origin-origin2-weapon-other-text-emit-src-mq3-client-cgame-event-ml-1273572526"></a>
### appendAction

```ml
function appendAction(value, result, boundary, kind, entity, channel, parm, origin, origin2, weapon, other, text, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `parm` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L33)

<a id="function-function-mq3-client-cgame-event-audio-function-audio-value-result-kind-entity-channel-parm-origin-emit-src-mq3-client-cgame-event-ml-1193229795"></a>
### audio

```ml
function audio(value, result, kind, entity, channel, parm, origin, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `parm` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L173)

<a id="constant-constant-mq3-client-cgame-event-chan-auto-const-chan-auto-0-src-mq3-client-cgame-event-ml-1623963607"></a>
### CHAN_AUTO

```ml
const CHAN_AUTO = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L17)

<a id="constant-constant-mq3-client-cgame-event-chan-body-const-chan-body-4-src-mq3-client-cgame-event-ml-482285279"></a>
### CHAN_BODY

```ml
const CHAN_BODY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L20)

<a id="constant-constant-mq3-client-cgame-event-chan-item-const-chan-item-3-src-mq3-client-cgame-event-ml-1524241058"></a>
### CHAN_ITEM

```ml
const CHAN_ITEM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L19)

<a id="constant-constant-mq3-client-cgame-event-chan-voice-const-chan-voice-2-src-mq3-client-cgame-event-ml-1196890077"></a>
### CHAN_VOICE

```ml
const CHAN_VOICE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L18)

<a id="function-function-mq3-client-cgame-event-checkevent-function-checkevent-value-es-servertime-retailactive-src-mq3-client-cgame-event-ml-1312482830"></a>
### checkEvent

```ml
function checkEvent(value, es, serverTime, retailActive)
```

CG_CheckEvents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `es` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L243)

<a id="function-function-mq3-client-cgame-event-clearboundaryqueues-function-clearboundaryqueues-value-src-mq3-client-cgame-event-ml-943721301"></a>
### clearBoundaryQueues

```ml
function clearBoundaryQueues(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L267)

<a id="function-function-mq3-client-cgame-event-create-function-create-maxentities-src-mq3-client-cgame-event-ml-675101583"></a>
### create

```ml
function create(maxEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L26)

<a id="constant-constant-mq3-client-cgame-event-ef-kamikaze-const-ef-kamikaze-1048576-src-mq3-client-cgame-event-ml-1548906774"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 1048576
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L11)

<a id="constant-constant-mq3-client-cgame-event-ef-player-event-const-ef-player-event-16-src-mq3-client-cgame-event-ml-1991195286"></a>
### EF_PLAYER_EVENT

```ml
const EF_PLAYER_EVENT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L10)

<a id="function-function-mq3-client-cgame-event-entityevent-function-entityevent-value-es-entity-position-event-emit-src-mq3-client-cgame-event-ml-136913388"></a>
### entityEvent

```ml
function entityEvent(value, es, entity, position, event, emit)
```

CG_EntityEvent.  Symbolic media names preserve the exact choice point; the active retail VM resolves them to registered handles and owns emission.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `es` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L189)

<a id="constant-constant-mq3-client-cgame-event-et-events-const-et-events-13-src-mq3-client-cgame-event-ml-865218873"></a>
### ET_EVENTS

```ml
const ET_EVENTS = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L12)

<a id="constant-constant-mq3-client-cgame-event-ev-event-bits-const-ev-event-bits-768-src-mq3-client-cgame-event-ml-1213798368"></a>
### EV_EVENT_BITS

```ml
const EV_EVENT_BITS = 768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L9)

<a id="function-function-mq3-client-cgame-event-eventname-function-eventname-event-src-mq3-client-cgame-event-ml-1973641318"></a>
### eventName

```ml
function eventName(event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L59)

<a id="function-function-mq3-client-cgame-event-itempickup-function-itempickup-value-itemnum-isweapon-weapontag-autoswitch-src-mq3-client-cgame-event-ml-123293999"></a>
### itemPickup

```ml
function itemPickup(value, itemNum, isWeapon, weaponTag, autoSwitch)
```

CG_ItemPickup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `itemNum` | `dynamic` | — |  |
| `isWeapon` | `dynamic` | — |  |
| `weaponTag` | `dynamic` | — |  |
| `autoSwitch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L161)

<a id="constant-constant-mq3-client-cgame-event-max-clients-const-max-clients-64-src-mq3-client-cgame-event-ml-772537907"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L14)

<a id="constant-constant-mq3-client-cgame-event-max-step-change-const-max-step-change-cgabi-max-step-change-src-mq3-client-cgame-event-ml-444929043"></a>
### MAX_STEP_CHANGE

```ml
const MAX_STEP_CHANGE = cgabi.MAX_STEP_CHANGE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L16)

<a id="function-function-mq3-client-cgame-event-obituary-function-obituary-value-es-position-emit-src-mq3-client-cgame-event-ml-1596065159"></a>
### obituary

```ml
function obituary(value, es, position, emit)
```

CG_Obituary is kept semantic here: the full target, attacker and means of death reach the HUD boundary, where configured player names/gender live.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `es` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L169)

<a id="function-function-mq3-client-cgame-event-observesnapshot-function-observesnapshot-value-snapshot-retailactive-src-mq3-client-cgame-event-ml-908313664"></a>
### observeSnapshot

```ml
function observeSnapshot(value, snapshot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L260)

<a id="function-function-mq3-client-cgame-event-painevent-function-painevent-value-entity-health-origin-emit-src-mq3-client-cgame-event-ml-1293288055"></a>
### painEvent

```ml
function painEvent(value, entity, health, origin, emit)
```

CG_PainEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `health` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L153)

<a id="function-function-mq3-client-cgame-event-painsound-function-painsound-health-src-mq3-client-cgame-event-ml-1186138798"></a>
### painSound

```ml
function painSound(health)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L148)

<a id="function-function-mq3-client-cgame-event-placestring-function-placestring-rank-src-mq3-client-cgame-event-ml-231557648"></a>
### placeString

```ml
function placeString(rank)
```

CG_PlaceString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rank` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L44)

<a id="constant-constant-mq3-client-cgame-event-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-cgame-event-ml-60558789"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L13)

- [mq3.client.cgame_event.Record](Type-mq3-client-cgame-event-record-1476129810.md) — struct
<a id="function-function-mq3-client-cgame-event-render-function-render-value-result-kind-es-position-emit-src-mq3-client-cgame-event-ml-1061631146"></a>
### render

```ml
function render(value, result, kind, es, position, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `es` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L174)

- [mq3.client.cgame_event.State](Type-mq3-client-cgame-event-state-229090580.md) — struct
<a id="function-function-mq3-client-cgame-event-stateaction-function-stateaction-value-result-kind-es-position-emit-src-mq3-client-cgame-event-ml-1873369636"></a>
### stateAction

```ml
function stateAction(value, result, kind, es, position, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `es` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L175)

<a id="constant-constant-mq3-client-cgame-event-step-time-const-step-time-cgabi-step-time-src-mq3-client-cgame-event-ml-2077446203"></a>
### STEP_TIME

```ml
const STEP_TIME = cgabi.STEP_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L15)

<a id="function-function-mq3-client-cgame-event-useitem-function-useitem-value-es-position-event-emit-src-mq3-client-cgame-event-ml-1036319601"></a>
### useItem

```ml
function useItem(value, es, position, event, emit)
```

CG_UseItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `es` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L178)
