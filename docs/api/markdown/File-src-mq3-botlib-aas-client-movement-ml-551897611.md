# `src/mq3/botlib/aas_client_movement.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_client_movement`](Package-mq3-botlib-aas-client-movement-1616453089.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-aas-client-movement-accelerate-function-accelerate-velocity-frametime-wishdir-wishspeed-acceleration-src-mq3-botlib-aas-client-movement-ml-1446573779"></a>
### accelerate

```ml
function accelerate(velocity, frametime, wishdir, wishspeed, acceleration)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `wishdir` | `dynamic` | — |  |
| `wishspeed` | `dynamic` | — |  |
| `acceleration` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L65)

<a id="function-function-mq3-botlib-aas-client-movement-add-function-add-a-b-src-mq3-botlib-aas-client-movement-ml-1646781965"></a>
### add

```ml
function add(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L47)

<a id="function-function-mq3-botlib-aas-client-movement-applyfriction-function-applyfriction-velocity-friction-stopspeed-frametime-src-mq3-botlib-aas-client-movement-ml-1546429386"></a>
### applyFriction

```ml
function applyFriction(velocity, friction, stopspeed, frametime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — |  |
| `friction` | `dynamic` | — |  |
| `stopspeed` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L70)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-botlib-aas-client-movement-ml-1811196485"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L16)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-jumppad-const-areacontents-jumppad-128-src-mq3-botlib-aas-client-movement-ml-1230745218"></a>
### AREACONTENTS_JUMPPAD

```ml
const AREACONTENTS_JUMPPAD = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L18)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-lava-const-areacontents-lava-2-src-mq3-botlib-aas-client-movement-ml-1882553625"></a>
### AREACONTENTS_LAVA

```ml
const AREACONTENTS_LAVA = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L14)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-slime-const-areacontents-slime-4-src-mq3-botlib-aas-client-movement-ml-1933532761"></a>
### AREACONTENTS_SLIME

```ml
const AREACONTENTS_SLIME = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L15)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-teleporter-const-areacontents-teleporter-64-src-mq3-botlib-aas-client-movement-ml-265606995"></a>
### AREACONTENTS_TELEPORTER

```ml
const AREACONTENTS_TELEPORTER = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L17)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-water-const-areacontents-water-1-src-mq3-botlib-aas-client-movement-ml-1015623792"></a>
### AREACONTENTS_WATER

```ml
const AREACONTENTS_WATER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L13)

- [mq3.botlib.aas_client_movement.AreaTrace](Type-mq3-botlib-aas-client-movement-areatrace-1425299197.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-callareacontents-function-callareacontents-s-area-src-mq3-botlib-aas-client-movement-ml-1099261200"></a>
### callAreaContents

```ml
function callAreaContents(s, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L59)

<a id="function-function-mq3-botlib-aas-client-movement-calltrace-function-calltrace-s-start-finish-presence-passentity-src-mq3-botlib-aas-client-movement-ml-1307358145"></a>
### callTrace

```ml
function callTrace(s, start, finish, presence, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L55)

<a id="function-function-mq3-botlib-aas-client-movement-calltraceareas-function-calltraceareas-s-start-finish-src-mq3-botlib-aas-client-movement-ml-1057466590"></a>
### callTraceAreas

```ml
function callTraceAreas(s, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L60)

<a id="function-function-mq3-botlib-aas-client-movement-cliptobbox-function-cliptobbox-start-finish-presence-mins-maxs-src-mq3-botlib-aas-client-movement-ml-1382210904"></a>
### clipToBBox

```ml
function clipToBBox(start, finish, presence, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L79)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-lava-const-contents-lava-8-src-mq3-botlib-aas-client-movement-ml-1206897427"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L10)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-slime-const-contents-slime-16-src-mq3-botlib-aas-client-movement-ml-781055658"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L11)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-solid-const-contents-solid-1-src-mq3-botlib-aas-client-movement-ml-773981070"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L9)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-water-const-contents-water-32-src-mq3-botlib-aas-client-movement-ml-2125360158"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L12)

<a id="function-function-mq3-botlib-aas-client-movement-copy-function-copy-v-src-mq3-botlib-aas-client-movement-ml-722481330"></a>
### copy

```ml
function copy(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L44)

<a id="function-function-mq3-botlib-aas-client-movement-dot-function-dot-a-b-src-mq3-botlib-aas-client-movement-ml-430374977"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L46)

<a id="function-function-mq3-botlib-aas-client-movement-fail-function-fail-message-src-mq3-botlib-aas-client-movement-ml-1724212401"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L43)

<a id="function-function-mq3-botlib-aas-client-movement-length-function-length-v-src-mq3-botlib-aas-client-movement-ml-1709830326"></a>
### length

```ml
function length(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L51)

<a id="function-function-mq3-botlib-aas-client-movement-ma-function-ma-a-value-b-src-mq3-botlib-aas-client-movement-ml-1146934318"></a>
### ma

```ml
function ma(a, value, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L50)

- [mq3.botlib.aas_client_movement.Movement](Type-mq3-botlib-aas-client-movement-movement-381824432.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-normalize-function-normalize-v-src-mq3-botlib-aas-client-movement-ml-561161676"></a>
### normalize

```ml
function normalize(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L52)

<a id="function-function-mq3-botlib-aas-client-movement-onground-function-onground-s-origin-presence-passentity-maxsteepness-src-mq3-botlib-aas-client-movement-ml-83464762"></a>
### onGround

```ml
function onGround(s, origin, presence, passEntity, maxSteepness)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |
| `maxSteepness` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L75)

<a id="function-function-mq3-botlib-aas-client-movement-pointarea-function-pointarea-s-point-src-mq3-botlib-aas-client-movement-ml-1839856683"></a>
### pointArea

```ml
function pointArea(s, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L57)

<a id="function-function-mq3-botlib-aas-client-movement-pointcontents-function-pointcontents-s-point-src-mq3-botlib-aas-client-movement-ml-1667568253"></a>
### pointContents

```ml
function pointContents(s, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L56)

<a id="function-function-mq3-botlib-aas-client-movement-pointpresence-function-pointpresence-s-point-src-mq3-botlib-aas-client-movement-ml-1953059447"></a>
### pointPresence

```ml
function pointPresence(s, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L58)

<a id="function-function-mq3-botlib-aas-client-movement-predict-function-predict-s-entnum-origin-presence-onground-velocity-cmdmove-cmdframes-maxframes-frametime-stopevents-stoparea-visualize-src-mq3-botlib-aas-client-movement-ml-1937713491"></a>
### predict

```ml
function predict(s, entnum, origin, presence, onground, velocity, cmdmove, cmdframes, maxframes, frametime, stopevents, stoparea, visualize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `onground` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `cmdmove` | `dynamic` | — |  |
| `cmdframes` | `dynamic` | — |  |
| `maxframes` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `stopevents` | `dynamic` | — |  |
| `stoparea` | `dynamic` | — |  |
| `visualize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L170)

<a id="function-function-mq3-botlib-aas-client-movement-predictwithbbox-function-predictwithbbox-s-entnum-origin-presence-onground-velocity-cmdmove-cmdframes-maxframes-frametime-stopevents-stoparea-mins-maxs-visualize-src-mq3-botlib-aas-client-movement-ml-1313482919"></a>
### predictWithBBox

```ml
function predictWithBBox(s, entnum, origin, presence, onground, velocity, cmdmove, cmdframes, maxframes, frametime, stopevents, stoparea, mins, maxs, visualize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `onground` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `cmdmove` | `dynamic` | — |  |
| `cmdframes` | `dynamic` | — |  |
| `maxframes` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `stopevents` | `dynamic` | — |  |
| `stoparea` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `visualize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L100)

<a id="function-function-mq3-botlib-aas-client-movement-result-function-result-success-origin-velocity-frametime-presence-event-contents-frames-trace-s-src-mq3-botlib-aas-client-movement-ml-1739020989"></a>
### result

```ml
function result(success, origin, velocity, frametime, presence, event, contents, frames, trace, s)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `success` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L92)

<a id="function-function-mq3-botlib-aas-client-movement-scale-function-scale-a-value-src-mq3-botlib-aas-client-movement-ml-1058685530"></a>
### scale

```ml
function scale(a, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L49)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterarea-const-se-enterarea-512-src-mq3-botlib-aas-client-movement-ml-1005566857"></a>
### SE_ENTERAREA

```ml
const SE_ENTERAREA = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L30)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterlava-const-se-enterlava-16-src-mq3-botlib-aas-client-movement-ml-477735594"></a>
### SE_ENTERLAVA

```ml
const SE_ENTERLAVA = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L25)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterslime-const-se-enterslime-8-src-mq3-botlib-aas-client-movement-ml-225594287"></a>
### SE_ENTERSLIME

```ml
const SE_ENTERSLIME = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L24)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterwater-const-se-enterwater-4-src-mq3-botlib-aas-client-movement-ml-1378136983"></a>
### SE_ENTERWATER

```ml
const SE_ENTERWATER = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L23)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-gap-const-se-gap-64-src-mq3-botlib-aas-client-movement-ml-602717491"></a>
### SE_GAP

```ml
const SE_GAP = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L27)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitboundingbox-const-se-hitboundingbox-2048-src-mq3-botlib-aas-client-movement-ml-1959395987"></a>
### SE_HITBOUNDINGBOX

```ml
const SE_HITBOUNDINGBOX = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L33)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitground-const-se-hitground-1-src-mq3-botlib-aas-client-movement-ml-1544433340"></a>
### SE_HITGROUND

```ml
const SE_HITGROUND = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L21)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitgroundarea-const-se-hitgroundarea-1024-src-mq3-botlib-aas-client-movement-ml-1337690424"></a>
### SE_HITGROUNDAREA

```ml
const SE_HITGROUNDAREA = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L31)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitgrounddamage-const-se-hitgrounddamage-32-src-mq3-botlib-aas-client-movement-ml-1114495570"></a>
### SE_HITGROUNDDAMAGE

```ml
const SE_HITGROUNDDAMAGE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L26)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-leaveground-const-se-leaveground-2-src-mq3-botlib-aas-client-movement-ml-1884836589"></a>
### SE_LEAVEGROUND

```ml
const SE_LEAVEGROUND = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L22)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-none-const-se-none-0-src-mq3-botlib-aas-client-movement-ml-1956650919"></a>
### SE_NONE

```ml
const SE_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L20)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-touchclusterportal-const-se-touchclusterportal-4096-src-mq3-botlib-aas-client-movement-ml-1538159722"></a>
### SE_TOUCHCLUSTERPORTAL

```ml
const SE_TOUCHCLUSTERPORTAL = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L32)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-touchjumppad-const-se-touchjumppad-128-src-mq3-botlib-aas-client-movement-ml-1142975398"></a>
### SE_TOUCHJUMPPAD

```ml
const SE_TOUCHJUMPPAD = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L28)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-touchteleporter-const-se-touchteleporter-256-src-mq3-botlib-aas-client-movement-ml-181160528"></a>
### SE_TOUCHTELEPORTER

```ml
const SE_TOUCHTELEPORTER = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L29)

<a id="function-function-mq3-botlib-aas-client-movement-services-function-services-context-src-mq3-botlib-aas-client-movement-ml-621644697"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L42)

- [mq3.botlib.aas_client_movement.Services](Type-mq3-botlib-aas-client-movement-services-1882790045.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-settings-function-settings-src-mq3-botlib-aas-client-movement-ml-1540414970"></a>
### settings

```ml
function settings()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L41)

- [mq3.botlib.aas_client_movement.Settings](Type-mq3-botlib-aas-client-movement-settings-1777184160.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-stopped-function-stopped-s-origin-velocity-frametime-presence-event-contents-frame-trace-area-src-mq3-botlib-aas-client-movement-ml-1437583332"></a>
### stopped

```ml
function stopped(s, origin, velocity, frametime, presence, event, contents, frame, trace, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L96)

<a id="function-function-mq3-botlib-aas-client-movement-sub-function-sub-a-b-src-mq3-botlib-aas-client-movement-ml-1937452215"></a>
### sub

```ml
function sub(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L48)

<a id="function-function-mq3-botlib-aas-client-movement-swimming-function-swimming-s-origin-src-mq3-botlib-aas-client-movement-ml-1975132065"></a>
### swimming

```ml
function swimming(s, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L62)

- [mq3.botlib.aas_client_movement.Trace](Type-mq3-botlib-aas-client-movement-trace-1657013622.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-zerotrace-function-zerotrace-src-mq3-botlib-aas-client-movement-ml-554723212"></a>
### zeroTrace

```ml
function zeroTrace()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L45)
