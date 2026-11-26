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

Set `velocity[axis]` to `n.fadd(velocity[axis],n.fmul(amount,wishdir[axis]))` in `mq3.botlib.aas_client_movement.accelerate`. Return paths include `velocity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — | Three-component movement velocity. Entries may be updated in place. |
| `frametime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `wishdir` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `wishspeed` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `acceleration` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L245)

<a id="function-function-mq3-botlib-aas-client-movement-add-function-add-a-b-src-mq3-botlib-aas-client-movement-ml-1646781965"></a>
### add

```ml
function add(a, b)
```

Return a new array `[n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]` for `add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L182)

<a id="function-function-mq3-botlib-aas-client-movement-applyfriction-function-applyfriction-velocity-friction-stopspeed-frametime-src-mq3-botlib-aas-client-movement-ml-1546429386"></a>
### applyFriction

```ml
function applyFriction(velocity, friction, stopspeed, frametime)
```

Set `velocity[0]` to `n.fmul(velocity[0],ratio)` and `velocity[1]` to `n.fmul(velocity[1],ratio)` in `mq3.botlib.aas_client_movement.applyFriction`. Return paths include `velocity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — | Three-component movement velocity. Entries may be updated in place. |
| `friction` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `stopspeed` | `dynamic` | — | Value used by `applyFriction` in `if control<stopspeed then control=stopspeed end if`. |
| `frametime` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L255)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-botlib-aas-client-movement-ml-1811196485"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```

AAS area-contents bit marking cluster portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L24)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-jumppad-const-areacontents-jumppad-128-src-mq3-botlib-aas-client-movement-ml-1230745218"></a>
### AREACONTENTS_JUMPPAD

```ml
const AREACONTENTS_JUMPPAD = 128
```

AAS area-contents bit marking jump pad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L28)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-lava-const-areacontents-lava-2-src-mq3-botlib-aas-client-movement-ml-1882553625"></a>
### AREACONTENTS_LAVA

```ml
const AREACONTENTS_LAVA = 2
```

AAS area-contents bit marking lava.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L20)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-slime-const-areacontents-slime-4-src-mq3-botlib-aas-client-movement-ml-1933532761"></a>
### AREACONTENTS_SLIME

```ml
const AREACONTENTS_SLIME = 4
```

AAS area-contents bit marking slime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L22)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-teleporter-const-areacontents-teleporter-64-src-mq3-botlib-aas-client-movement-ml-265606995"></a>
### AREACONTENTS_TELEPORTER

```ml
const AREACONTENTS_TELEPORTER = 64
```

AAS area-contents bit marking teleporter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L26)

<a id="constant-constant-mq3-botlib-aas-client-movement-areacontents-water-const-areacontents-water-1-src-mq3-botlib-aas-client-movement-ml-1015623792"></a>
### AREACONTENTS_WATER

```ml
const AREACONTENTS_WATER = 1
```

AAS area-contents bit marking water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L18)

- [mq3.botlib.aas_client_movement.AreaTrace](Type-mq3-botlib-aas-client-movement-areatrace-1425299197.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-callareacontents-function-callareacontents-s-area-src-mq3-botlib-aas-client-movement-ml-1099261200"></a>
### callAreaContents

```ml
function callAreaContents(s, area)
```

Use `s.areaContentsFn` to perform `callAreaContents`. Return paths include `s.areaContentsFn(s.context,area)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `areaContentsFn` and `context`. |
| `area` | `dynamic` | — | Value passed as argument 2 to `s.areaContentsFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L226)

<a id="function-function-mq3-botlib-aas-client-movement-calltrace-function-calltrace-s-start-finish-presence-passentity-src-mq3-botlib-aas-client-movement-ml-1307358145"></a>
### callTrace

```ml
function callTrace(s, start, finish, presence, passEntity)
```

Use `s.traceFn` to perform `callTrace`. Return paths include `s.traceFn(s.context,start,finish,presence,passEntity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `traceFn` and `context`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `s.traceFn`. |
| `finish` | `dynamic` | — | Value passed as argument 3 to `s.traceFn`. |
| `presence` | `dynamic` | — | Value passed as argument 4 to `s.traceFn`. |
| `passEntity` | `dynamic` | — | Value passed as argument 5 to `s.traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L210)

<a id="function-function-mq3-botlib-aas-client-movement-calltraceareas-function-calltraceareas-s-start-finish-src-mq3-botlib-aas-client-movement-ml-1057466590"></a>
### callTraceAreas

```ml
function callTraceAreas(s, start, finish)
```

Use `s.traceAreasFn` to perform `callTraceAreas`. Return paths include `s.traceAreasFn(s.context,start,finish,20)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `traceAreasFn` and `context`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `s.traceAreasFn`. |
| `finish` | `dynamic` | — | Value passed as argument 3 to `s.traceAreasFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L231)

<a id="function-function-mq3-botlib-aas-client-movement-cliptobbox-function-cliptobbox-start-finish-presence-mins-maxs-src-mq3-botlib-aas-client-movement-ml-1382210904"></a>
### clipToBBox

```ml
function clipToBBox(start, finish, presence, mins, maxs)
```

Build the `mq3.botlib.aas_client_movement.Trace` result for `clipToBBox`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `presence` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L276)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-lava-const-contents-lava-8-src-mq3-botlib-aas-client-movement-ml-1206897427"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```

Collision contents bit marking lava.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L12)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-slime-const-contents-slime-16-src-mq3-botlib-aas-client-movement-ml-781055658"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```

Collision contents bit marking slime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L14)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-solid-const-contents-solid-1-src-mq3-botlib-aas-client-movement-ml-773981070"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```

An eye is never valid in a solid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L10)

<a id="constant-constant-mq3-botlib-aas-client-movement-contents-water-const-contents-water-32-src-mq3-botlib-aas-client-movement-ml-2125360158"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```

Collision contents bit marking water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L16)

<a id="function-function-mq3-botlib-aas-client-movement-copy-function-copy-v-src-mq3-botlib-aas-client-movement-ml-722481330"></a>
### copy

```ml
function copy(v)
```

Copy `v[0]`, `v[1]` and `v[2]` into a new ordered array for aas client movement.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L172)

<a id="function-function-mq3-botlib-aas-client-movement-dot-function-dot-a-b-src-mq3-botlib-aas-client-movement-ml-430374977"></a>
### dot

```ml
function dot(a, b)
```

Return the result of `n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2]))` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L178)

<a id="function-function-mq3-botlib-aas-client-movement-fail-function-fail-message-src-mq3-botlib-aas-client-movement-ml-1724212401"></a>
### fail

```ml
function fail(message)
```

Construct error `7540` with diagnostic text `"AAS client movement: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L169)

<a id="function-function-mq3-botlib-aas-client-movement-length-function-length-v-src-mq3-botlib-aas-client-movement-ml-1709830326"></a>
### length

```ml
function length(v)
```

Forward `length` to `mq3.compat.numeric.fsqrt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L198)

<a id="function-function-mq3-botlib-aas-client-movement-ma-function-ma-a-value-b-src-mq3-botlib-aas-client-movement-ml-1146934318"></a>
### ma

```ml
function ma(a, value, b)
```

Forward `ma` to `mq3.botlib.aas_client_movement.add` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `value` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L195)

- [mq3.botlib.aas_client_movement.Movement](Type-mq3-botlib-aas-client-movement-movement-381824432.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-normalize-function-normalize-v-src-mq3-botlib-aas-client-movement-ml-561161676"></a>
### normalize

```ml
function normalize(v)
```

Apply `mq3.botlib.aas_client_movement.length` and `mq3.botlib.aas_client_movement.scale` while evaluating `normalize`. Return paths include `[magnitude,scale(v,n.fdiv(1.0,magnitude))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L201)

<a id="function-function-mq3-botlib-aas-client-movement-onground-function-onground-s-origin-presence-passentity-maxsteepness-src-mq3-botlib-aas-client-movement-ml-83464762"></a>
### onGround

```ml
function onGround(s, origin, presence, passEntity, maxSteepness)
```

Apply `mq3.botlib.aas_client_movement.copy` and `mq3.botlib.aas_client_movement.callTrace` while evaluating `onGround`. Return paths include `trace.normal[2]>=maxSteepness`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `traceFn` and `context`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presence` | `dynamic` | — | Value passed as argument 4 to `s.traceFn`. |
| `passEntity` | `dynamic` | — | Value passed as argument 5 to `s.traceFn`. |
| `maxSteepness` | `dynamic` | — | Operand used to evaluate the returned expression `trace.normal[2]>=maxSteepness`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L266)

<a id="function-function-mq3-botlib-aas-client-movement-pointarea-function-pointarea-s-point-src-mq3-botlib-aas-client-movement-ml-1839856683"></a>
### pointArea

```ml
function pointArea(s, point)
```

Use `s.pointAreaFn` to perform `pointArea`. Return paths include `s.pointAreaFn(s.context,point)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `pointAreaFn` and `context`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L218)

<a id="function-function-mq3-botlib-aas-client-movement-pointcontents-function-pointcontents-s-point-src-mq3-botlib-aas-client-movement-ml-1667568253"></a>
### pointContents

```ml
function pointContents(s, point)
```

Use `s.pointContentsFn` to perform `pointContents`. Return paths include `s.pointContentsFn(s.context,point)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `pointContentsFn` and `context`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L214)

<a id="function-function-mq3-botlib-aas-client-movement-pointpresence-function-pointpresence-s-point-src-mq3-botlib-aas-client-movement-ml-1953059447"></a>
### pointPresence

```ml
function pointPresence(s, point)
```

Use `s.pointPresenceFn` to perform `pointPresence`. Return paths include `s.pointPresenceFn(s.context,point)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `pointPresenceFn` and `context`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L222)

<a id="function-function-mq3-botlib-aas-client-movement-predict-function-predict-s-entnum-origin-presence-onground-velocity-cmdmove-cmdframes-maxframes-frametime-stopevents-stoparea-visualize-src-mq3-botlib-aas-client-movement-ml-1937713491"></a>
### predict

```ml
function predict(s, entnum, origin, presence, onground, velocity, cmdmove, cmdframes, maxframes, frametime, stopevents, stoparea, visualize)
```

Forward `predict` to `mq3.botlib.aas_client_movement.predictWithBBox` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `settings`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presence` | `dynamic` | — | Value passed as argument 4 to `s.traceFn`. |
| `onground` | `dynamic` | — | Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `cmdmove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `cmdframes` | `dynamic` | — | Value used by `predictWithBBox` in `if frame<cmdframes then`. |
| `maxframes` | `dynamic` | — | Value used by `predictWithBBox` in `while frame<maxframes`. |
| `frametime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `stopevents` | `dynamic` | — | Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`. |
| `stoparea` | `dynamic` | — | Value used by `stopped` in `if area>=0 then value.endarea=area end if`. |
| `visualize` | `dynamic` | — | Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L419)

<a id="function-function-mq3-botlib-aas-client-movement-predictwithbbox-function-predictwithbbox-s-entnum-origin-presence-onground-velocity-cmdmove-cmdframes-maxframes-frametime-stopevents-stoparea-mins-maxs-visualize-src-mq3-botlib-aas-client-movement-ml-1313482919"></a>
### predictWithBBox

```ml
function predictWithBBox(s, entnum, origin, presence, onground, velocity, cmdmove, cmdframes, maxframes, frametime, stopevents, stoparea, mins, maxs, visualize)
```

Build the `mq3.botlib.aas_client_movement.Movement` result for `predictWithBBox`. Return paths include `result(true,org,frameVelocity,frametime,presence,SE_NONE,0,frame,zeroTrace(),s)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `settings`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presence` | `dynamic` | — | Value passed as argument 4 to `s.traceFn`. |
| `onground` | `dynamic` | — | Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `cmdmove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `cmdframes` | `dynamic` | — | Value used by `predictWithBBox` in `if frame<cmdframes then`. |
| `maxframes` | `dynamic` | — | Value used by `predictWithBBox` in `while frame<maxframes`. |
| `frametime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `stopevents` | `dynamic` | — | Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`. |
| `stoparea` | `dynamic` | — | Value used by `stopped` in `if area>=0 then value.endarea=area end if`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `visualize` | `dynamic` | — | Not read by this implementation; retained in the `predictWithBBox` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L335)

<a id="function-function-mq3-botlib-aas-client-movement-result-function-result-success-origin-velocity-frametime-presence-event-contents-frames-trace-s-src-mq3-botlib-aas-client-movement-ml-1739020989"></a>
### result

```ml
function result(success, origin, velocity, frametime, presence, event, contents, frames, trace, s)
```

Build the `mq3.botlib.aas_client_movement.Movement` result for `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `success` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.success`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `frametime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fdiv`. |
| `presence` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.presencetype`. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `contents` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.endcontents`. |
| `frames` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.frames`. |
| `trace` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.trace`. |
| `s` | `dynamic` | — | S record; accesses `pointAreaFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L300)

<a id="function-function-mq3-botlib-aas-client-movement-scale-function-scale-a-value-src-mq3-botlib-aas-client-movement-ml-1058685530"></a>
### scale

```ml
function scale(a, value)
```

Return a new array `[n.fmul(a[0],value),n.fmul(a[1],value),n.fmul(a[2],value)]` for `scale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `value` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L190)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterarea-const-se-enterarea-512-src-mq3-botlib-aas-client-movement-ml-1005566857"></a>
### SE_ENTERAREA

```ml
const SE_ENTERAREA = 512
```

The given stoparea is entered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L51)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterlava-const-se-enterlava-16-src-mq3-botlib-aas-client-movement-ml-477735594"></a>
### SE_ENTERLAVA

```ml
const SE_ENTERLAVA = 16
```

Lava is entered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L41)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterslime-const-se-enterslime-8-src-mq3-botlib-aas-client-movement-ml-225594287"></a>
### SE_ENTERSLIME

```ml
const SE_ENTERSLIME = 8
```

Slime is entered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L39)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-enterwater-const-se-enterwater-4-src-mq3-botlib-aas-client-movement-ml-1378136983"></a>
### SE_ENTERWATER

```ml
const SE_ENTERWATER = 4
```

Water is entered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L37)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-gap-const-se-gap-64-src-mq3-botlib-aas-client-movement-ml-602717491"></a>
### SE_GAP

```ml
const SE_GAP = 64
```

There's a gap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L45)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitboundingbox-const-se-hitboundingbox-2048-src-mq3-botlib-aas-client-movement-ml-1959395987"></a>
### SE_HITBOUNDINGBOX

```ml
const SE_HITBOUNDINGBOX = 2048
```

Hit the specified bounding box.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L57)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitground-const-se-hitground-1-src-mq3-botlib-aas-client-movement-ml-1544433340"></a>
### SE_HITGROUND

```ml
const SE_HITGROUND = 1
```

The ground is hit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L33)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitgroundarea-const-se-hitgroundarea-1024-src-mq3-botlib-aas-client-movement-ml-1337690424"></a>
### SE_HITGROUNDAREA

```ml
const SE_HITGROUNDAREA = 1024
```

A ground face in the area is hit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L53)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-hitgrounddamage-const-se-hitgrounddamage-32-src-mq3-botlib-aas-client-movement-ml-1114495570"></a>
### SE_HITGROUNDDAMAGE

```ml
const SE_HITGROUNDDAMAGE = 32
```

The ground is hit with damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L43)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-leaveground-const-se-leaveground-2-src-mq3-botlib-aas-client-movement-ml-1884836589"></a>
### SE_LEAVEGROUND

```ml
const SE_LEAVEGROUND = 2
```

There's no ground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L35)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-none-const-se-none-0-src-mq3-botlib-aas-client-movement-ml-1956650919"></a>
### SE_NONE

```ml
const SE_NONE = 0
```

Zero movement-prediction event mask, requesting no event-specific stop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L31)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-touchclusterportal-const-se-touchclusterportal-4096-src-mq3-botlib-aas-client-movement-ml-1538159722"></a>
### SE_TOUCHCLUSTERPORTAL

```ml
const SE_TOUCHCLUSTERPORTAL = 4096
```

Touching a cluster portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L55)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-touchjumppad-const-se-touchjumppad-128-src-mq3-botlib-aas-client-movement-ml-1142975398"></a>
### SE_TOUCHJUMPPAD

```ml
const SE_TOUCHJUMPPAD = 128
```

Touching a jump pad area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L47)

<a id="constant-constant-mq3-botlib-aas-client-movement-se-touchteleporter-const-se-touchteleporter-256-src-mq3-botlib-aas-client-movement-ml-181160528"></a>
### SE_TOUCHTELEPORTER

```ml
const SE_TOUCHTELEPORTER = 256
```

Movement-prediction stop-event bit for touching a teleporter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L49)

<a id="function-function-mq3-botlib-aas-client-movement-services-function-services-context-src-mq3-botlib-aas-client-movement-ml-621644697"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.aas_client_movement.Services` record, initializing `context` from `context` and `settings` as `settings()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L166)

- [mq3.botlib.aas_client_movement.Services](Type-mq3-botlib-aas-client-movement-services-1882790045.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-settings-function-settings-src-mq3-botlib-aas-client-movement-ml-1540414970"></a>
### settings

```ml
function settings()
```

Create a `mq3.botlib.aas_client_movement.Settings` record, initializing `friction` as `6.0`, `stopspeed` as `100.0` and `gravity` as `800.0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L163)

- [mq3.botlib.aas_client_movement.Settings](Type-mq3-botlib-aas-client-movement-settings-1777184160.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-stopped-function-stopped-s-origin-velocity-frametime-presence-event-contents-frame-trace-area-src-mq3-botlib-aas-client-movement-ml-1437583332"></a>
### stopped

```ml
function stopped(s, origin, velocity, frametime, presence, event, contents, frame, trace, area)
```

Apply `mq3.botlib.aas_client_movement.result` while evaluating `stopped`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `pointAreaFn` and `context`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `frametime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fdiv`. |
| `presence` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.presencetype`. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `contents` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.endcontents`. |
| `frame` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.frames`. |
| `trace` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_client_movement.Movement.trace`. |
| `area` | `dynamic` | — | Value used by `stopped` in `if area>=0 then value.endarea=area end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L315)

<a id="function-function-mq3-botlib-aas-client-movement-sub-function-sub-a-b-src-mq3-botlib-aas-client-movement-ml-1937452215"></a>
### sub

```ml
function sub(a, b)
```

Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `sub`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L186)

<a id="function-function-mq3-botlib-aas-client-movement-swimming-function-swimming-s-origin-src-mq3-botlib-aas-client-movement-ml-1975132065"></a>
### swimming

```ml
function swimming(s, origin)
```

Apply `mq3.botlib.aas_client_movement.copy` and `mq3.botlib.aas_client_movement.pointContents` while evaluating `swimming`. Return paths include `(pointContents(s,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | S record; accesses `pointContentsFn` and `context`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L236)

- [mq3.botlib.aas_client_movement.Trace](Type-mq3-botlib-aas-client-movement-trace-1657013622.md) — struct
<a id="function-function-mq3-botlib-aas-client-movement-zerotrace-function-zerotrace-src-mq3-botlib-aas-client-movement-ml-554723212"></a>
### zeroTrace

```ml
function zeroTrace()
```

Create a `mq3.botlib.aas_client_movement.Trace` record, initializing `endpos` as `[0.0,0.0,0.0]` and `normal` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L174)
