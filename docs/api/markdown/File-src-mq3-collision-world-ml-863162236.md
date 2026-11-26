# `src/mq3/collision/world.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.world`](Package-mq3-collision-world-908419296.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/brush.ml` as `brush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/collision/patchmesh.ml` as `mesh` → [src/mq3/collision/patchmesh.ml](File-src-mq3-collision-patchmesh-ml-245132781.md)
- `mq3/collision/patchtrace.ml` as `patches` → [src/mq3/collision/patchtrace.ml](File-src-mq3-collision-patchtrace-ml-877086175.md)
- `mq3/collision/visibility.ml` as `vis` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `mq3/qcommon/md4.ml` as `md4` → [src/mq3/qcommon/md4.ml](File-src-mq3-qcommon-md4-ml-1589067711.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency
- `std/ds/list.ml` as `worldTraceLists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-collision-world-abs-function-abs-a-src-mq3-collision-world-ml-894168649"></a>
### abs

```ml
function abs(a)
```

Return `mq3.compat.numeric.bitsFloat((n.floatBits(a) & 2147483647))` from `collision.world.abs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L276)

<a id="function-function-mq3-collision-world-boxbrushes-function-boxbrushes-world-mins-maxs-capacity-src-mq3-collision-world-ml-34143928"></a>
### boxBrushes

```ml
function boxBrushes(world, mins, maxs, capacity)
```

Compute box brushes in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `brushes`, `leaves`. |
| `mins` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `maxs` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `capacity` | `dynamic` | — | B passed as `b` to `mq3.collision.world.min`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1272)

<a id="function-function-mq3-collision-world-boxleafnums-function-boxleafnums-world-mins-maxs-capacity-src-mq3-collision-world-ml-1364229036"></a>
### boxLeafnums

```ml
function boxLeafnums(world, mins, maxs, capacity)
```

Compute box leafnums in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `visibility`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.enumerateLeaves`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.enumerateLeaves`. |
| `capacity` | `dynamic` | — | B passed as `b` to `mq3.collision.world.min`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1255)

<a id="function-function-mq3-collision-world-boxside-function-boxside-mins-maxs-plane-src-mq3-collision-world-ml-2057846594"></a>
### boxSide

```ml
function boxSide(mins, maxs, plane)
```

Compute box side in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — | Mins used in `mins[axis]` and `(normal * mins[axis])`. |
| `maxs` | `dynamic` | — | Maxs used in `maxs[axis]` and `(normal * maxs[axis])`. |
| `plane` | `dynamic` | — | Record exposing `normal`, `distance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L785)

<a id="function-function-mq3-collision-world-boxtrace-function-boxtrace-world-start-finish-mins-maxs-model-mask-capsule-src-mq3-collision-world-ml-1329755983"></a>
### boxTrace

```ml
function boxTrace(world, start, finish, mins, maxs, model, mask, capsule)
```

Return `mq3.collision.world.trace(world, start, finish, mins, maxs, model, mask, capsule, true)` from `collision.world.boxTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.trace`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.trace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.trace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.trace`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.trace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.trace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1475)

<a id="function-function-mq3-collision-world-boxtracenocurves-function-boxtracenocurves-world-start-finish-mins-maxs-model-mask-capsule-src-mq3-collision-world-ml-1235806715"></a>
### boxTraceNoCurves

```ml
function boxTraceNoCurves(world, start, finish, mins, maxs, model, mask, capsule)
```

Return `mq3.collision.world.trace(world, start, finish, mins, maxs, model, mask, capsule, false)` from `collision.world.boxTraceNoCurves`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.trace`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.trace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.trace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.trace`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.trace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.trace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1462)

- [mq3.collision.world.Brush](Type-mq3-collision-world-brush-1147632650.md) — struct
<a id="function-function-mq3-collision-world-brushpointcontents-function-brushpointcontents-point-b-src-mq3-collision-world-ml-1966375118"></a>
### brushPointContents

```ml
function brushPointContents(point, b)
```

Compute brush point contents in collision.world; the normal completion returns `b.contents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Left three-element vector. |
| `b` | `dynamic` | — | Record exposing `planes`, `contents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L674)

<a id="function-function-mq3-collision-world-capsuletarget-function-capsuletarget-world-model-src-mq3-collision-world-ml-367239423"></a>
### capsuleTarget

```ml
function capsuleTarget(world, model)
```

Compute capsule target in collision.world; the normal completion returns `[bounds, center, lo, hi, radius, halfheight, top, bottom]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `temporary`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.modelBounds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L897)

<a id="function-function-mq3-collision-world-checkmodel-function-checkmodel-world-model-src-mq3-collision-world-ml-618104487"></a>
### checkModel

```ml
function checkModel(world, model)
```

Check model in collision.world; the normal completion returns `fail("invalid model handle")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`, `temporary`. |
| `model` | `dynamic` | — | Model used in `(model >= 0)` and `(model < len(world.models))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L533)

<a id="function-function-mq3-collision-world-checktracemodel-function-checktracemodel-world-model-capsule-src-mq3-collision-world-ml-99911634"></a>
### checkTraceModel

```ml
function checkTraceModel(world, model, capsule)
```

Return `mq3.collision.world.checkModel(world, model)` from `collision.world.checkTraceModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.checkModel`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.checkModel`. |
| `capsule` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L545)

<a id="function-function-mq3-collision-world-checktree-function-checktree-nodes-src-mq3-collision-world-ml-1579198055"></a>
### checkTree

```ml
function checkTree(nodes)
```

Check tree in collision.world; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nodes` | `dynamic` | — | Nodes used in `len(nodes)` and `nodes[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L430)

<a id="function-function-mq3-collision-world-cm-boundbrush-function-cm-boundbrush-sides-src-mq3-collision-world-ml-1912966852"></a>
### CM_BoundBrush

```ml
function CM_BoundBrush(sides)
```

Apply `mq3.collision.world.fail` for bound brush in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sides` | `dynamic` | — | Sides used in `sides[0]` and `sides[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L341)

<a id="function-function-mq3-collision-world-cm-boxtrace-function-cm-boxtrace-world-start-finish-mins-maxs-model-mask-capsule-src-mq3-collision-world-ml-723231945"></a>
### CM_BoxTrace

```ml
function CM_BoxTrace(world, start, finish, mins, maxs, model, mask, capsule)
```

Return `mq3.collision.world.boxTrace(world, start, finish, mins, maxs, model, mask, capsule)` from `collision.world.CM_BoxTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.boxTrace`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.boxTrace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.boxTrace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.boxTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.boxTrace`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.boxTrace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.boxTrace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1525)

<a id="function-function-mq3-collision-world-cm-checksum-function-cm-checksum-map-src-mq3-collision-world-ml-1813192756"></a>
### CM_Checksum

```ml
function CM_Checksum(map)
```

Compute checksum in collision.world; the normal completion returns `md4.blockChecksum(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.collision.world.CM_LumpChecksum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L424)

<a id="function-function-mq3-collision-world-cm-clearmap-function-cm-clearmap-state-src-mq3-collision-world-ml-91541271"></a>
### CM_ClearMap

```ml
function CM_ClearMap(state)
```

Clear map in collision.world; updates `state.world`, `state.name`, `state.checksum`.

Direct state writes: `state.world`, `state.name`, `state.checksum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `world`, `name`, `checksum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L612)

<a id="function-function-mq3-collision-world-cm-cliphandletomodel-function-cm-cliphandletomodel-world-handle-src-mq3-collision-world-ml-159196456"></a>
### CM_ClipHandleToModel

```ml
function CM_ClipHandleToModel(world, handle)
```

Compute clip handle to model in collision.world; the normal completion returns `fail("bad clip handle")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`, `temporary`. |
| `handle` | `dynamic` | — | Zero-based index into `world.models`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L563)

<a id="function-function-mq3-collision-world-cm-entitystring-function-cm-entitystring-world-src-mq3-collision-world-ml-1821168140"></a>
### CM_EntityString

```ml
function CM_EntityString(world)
```

Compute entity string in collision.world; the normal completion returns `world.entityString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `entityString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L595)

<a id="function-function-mq3-collision-world-cm-initboxhull-function-cm-initboxhull-world-src-mq3-collision-world-ml-376592762"></a>
### CM_InitBoxHull

```ml
function CM_InitBoxHull(world)
```

Update `world.temporary` in collision.world.

Direct state writes: `world.temporary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `brushes`, `surfaces`. Updated in place: `temporary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L520)

<a id="function-function-mq3-collision-world-cm-inlinemodel-function-cm-inlinemodel-world-index-src-mq3-collision-world-ml-274116902"></a>
### CM_InlineModel

```ml
function CM_InlineModel(world, index)
```

Return `mq3.collision.world.inlineModel(world, index)` from `collision.world.CM_InlineModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.inlineModel`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.collision.world.inlineModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L586)

<a id="function-function-mq3-collision-world-cm-leafarea-function-cm-leafarea-world-leaf-src-mq3-collision-world-ml-2142355562"></a>
### CM_LeafArea

```ml
function CM_LeafArea(world, leaf)
```

Compute leaf area in collision.world; the normal completion returns `vis.leafArea(world.visibility, leaf)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `visibility`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.visibility.leafArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L603)

<a id="function-function-mq3-collision-world-cm-leafcluster-function-cm-leafcluster-world-leaf-src-mq3-collision-world-ml-2020439662"></a>
### CM_LeafCluster

```ml
function CM_LeafCluster(world, leaf)
```

Compute leaf cluster in collision.world; the normal completion returns `vis.leafCluster(world.visibility, leaf)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `visibility`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.visibility.leafCluster`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L599)

<a id="function-function-mq3-collision-world-cm-loadmap-function-cm-loadmap-state-name-data-clientload-src-mq3-collision-world-ml-459322635"></a>
### CM_LoadMap

```ml
function CM_LoadMap(state, name, data, clientload)
```

Load map in collision.world; the normal completion returns `LoadResult(world, checksum, false)`.

Direct state writes: `state.name`, `state.world`, `state.checksum`, `state.lastChecksum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `world`, `name`, `lastChecksum`, `curves`. Updated in place: `name`, `world`, `checksum`, `lastChecksum`. |
| `name` | `dynamic` | — | Name used in `(name == "")` and `(name == void)`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.collision.world.loadWorld`. |
| `clientload` | `dynamic` | — | Clientload used in `(((state.world != void) and (state.name == name)) and clientload)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L620)

<a id="function-function-mq3-collision-world-cm-lumpchecksum-function-cm-lumpchecksum-map-lump-src-mq3-collision-world-ml-1325910914"></a>
### CM_LumpChecksum

```ml
function CM_LumpChecksum(map, lump)
```

Compute lump checksum in collision.world; the normal completion returns `md4.blockChecksum(slice(map.data, map.offsets[lump], map.lengths[lump]))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `data`, `offsets`, `lengths`. |
| `lump` | `dynamic` | — | Zero-based index into `map.offsets`, `map.lengths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L421)

<a id="function-function-mq3-collision-world-cm-modelbounds-function-cm-modelbounds-world-model-src-mq3-collision-world-ml-303618195"></a>
### CM_ModelBounds

```ml
function CM_ModelBounds(world, model)
```

Return `mq3.collision.world.modelBounds(world, model)` from `collision.world.CM_ModelBounds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.modelBounds`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.modelBounds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L574)

<a id="function-function-mq3-collision-world-cm-numclusters-function-cm-numclusters-world-src-mq3-collision-world-ml-1462329550"></a>
### CM_NumClusters

```ml
function CM_NumClusters(world)
```

Compute num clusters in collision.world; the normal completion returns `world.visibility.numClusters`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `visibility`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L589)

<a id="function-function-mq3-collision-world-cm-numinlinemodels-function-cm-numinlinemodels-world-src-mq3-collision-world-ml-1298426822"></a>
### CM_NumInlineModels

```ml
function CM_NumInlineModels(world)
```

Compute num inline models in collision.world; the normal completion returns `len(world.models)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L592)

<a id="function-function-mq3-collision-world-cm-positiontest-function-cm-positiontest-work-src-mq3-collision-world-ml-1610616775"></a>
### CM_PositionTest

```ml
function CM_PositionTest(work)
```

Return `mq3.collision.world.positionTest(work)` from `collision.world.CM_PositionTest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.positionTest`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1489)

<a id="function-function-mq3-collision-world-cm-tempboxmodel-function-cm-tempboxmodel-world-mins-maxs-capsule-src-mq3-collision-world-ml-2040554205"></a>
### CM_TempBoxModel

```ml
function CM_TempBoxModel(world, mins, maxs, capsule)
```

Return `mq3.collision.world.tempBoxModel(world, mins, maxs, capsule)` from `collision.world.CM_TempBoxModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.tempBoxModel`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.tempBoxModel`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.tempBoxModel`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.tempBoxModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L528)

<a id="function-function-mq3-collision-world-cm-testboundingboxincapsule-function-cm-testboundingboxincapsule-work-model-src-mq3-collision-world-ml-941002064"></a>
### CM_TestBoundingBoxInCapsule

```ml
function CM_TestBoundingBoxInCapsule(work, model)
```

Return `mq3.collision.world.testBoundingBoxInCapsule(work, model)` from `collision.world.CM_TestBoundingBoxInCapsule`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.testBoundingBoxInCapsule`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.testBoundingBoxInCapsule`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1090)

<a id="function-function-mq3-collision-world-cm-testboxinbrush-function-cm-testboxinbrush-work-value-src-mq3-collision-world-ml-812838618"></a>
### CM_TestBoxInBrush

```ml
function CM_TestBoxInBrush(work, value)
```

Public spellings retained by the original qcommon collision API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.testInBrush`. |
| `value` | `dynamic` | — | B passed as `b` to `mq3.collision.world.testInBrush`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1482)

<a id="function-function-mq3-collision-world-cm-testcapsuleincapsule-function-cm-testcapsuleincapsule-work-model-src-mq3-collision-world-ml-1693043276"></a>
### CM_TestCapsuleInCapsule

```ml
function CM_TestCapsuleInCapsule(work, model)
```

Return `mq3.collision.world.testCapsuleInCapsule(work, model)` from `collision.world.CM_TestCapsuleInCapsule`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.testCapsuleInCapsule`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.testCapsuleInCapsule`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1086)

<a id="function-function-mq3-collision-world-cm-testinleaf-function-cm-testinleaf-work-leaf-src-mq3-collision-world-ml-1131045019"></a>
### CM_TestInLeaf

```ml
function CM_TestInLeaf(work, leaf)
```

Return `mq3.collision.world.throughLeaf(work, leaf, true)` from `collision.world.CM_TestInLeaf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.throughLeaf`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.world.throughLeaf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1486)

<a id="function-function-mq3-collision-world-cm-trace-function-cm-trace-world-start-finish-mins-maxs-model-mask-capsule-curves-src-mq3-collision-world-ml-135742467"></a>
### CM_Trace

```ml
function CM_Trace(world, start, finish, mins, maxs, model, mask, capsule, curves)
```

Return `mq3.collision.world.trace(world, start, finish, mins, maxs, model, mask, capsule, curves)` from `collision.world.CM_Trace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.trace`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.trace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.trace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.trace`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.trace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.trace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.trace`. |
| `curves` | `dynamic` | — | Curves passed as `curves` to `mq3.collision.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1515)

<a id="function-function-mq3-collision-world-cm-traceboundingboxthroughcapsule-function-cm-traceboundingboxthroughcapsule-work-model-src-mq3-collision-world-ml-1143486242"></a>
### CM_TraceBoundingBoxThroughCapsule

```ml
function CM_TraceBoundingBoxThroughCapsule(work, model)
```

Return `mq3.collision.world.traceBoundingBoxThroughCapsule(work, model)` from `collision.world.CM_TraceBoundingBoxThroughCapsule`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.traceBoundingBoxThroughCapsule`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.traceBoundingBoxThroughCapsule`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1113)

<a id="function-function-mq3-collision-world-cm-tracecapsulethroughcapsule-function-cm-tracecapsulethroughcapsule-work-model-src-mq3-collision-world-ml-374259786"></a>
### CM_TraceCapsuleThroughCapsule

```ml
function CM_TraceCapsuleThroughCapsule(work, model)
```

Return `mq3.collision.world.traceCapsuleThroughCapsule(work, model)` from `collision.world.CM_TraceCapsuleThroughCapsule`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.traceCapsuleThroughCapsule`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.traceCapsuleThroughCapsule`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1109)

<a id="function-function-mq3-collision-world-cm-tracethroughleaf-function-cm-tracethroughleaf-work-leaf-src-mq3-collision-world-ml-1352420925"></a>
### CM_TraceThroughLeaf

```ml
function CM_TraceThroughLeaf(work, leaf)
```

Return `mq3.collision.world.throughLeaf(work, leaf, false)` from `collision.world.CM_TraceThroughLeaf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.throughLeaf`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.world.throughLeaf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1493)

<a id="function-function-mq3-collision-world-cm-tracethroughpatch-function-cm-tracethroughpatch-work-surface-src-mq3-collision-world-ml-1346315238"></a>
### CM_TraceThroughPatch

```ml
function CM_TraceThroughPatch(work, surface)
```

Trace through patch in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `trace`, `world`. |
| `surface` | `dynamic` | — | Record exposing `patch`, `flags`, `contents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1497)

<a id="function-function-mq3-collision-world-cm-tracethroughsphere-function-cm-tracethroughsphere-work-origin-radius-start-finish-src-mq3-collision-world-ml-1645171458"></a>
### CM_TraceThroughSphere

```ml
function CM_TraceThroughSphere(work, origin, radius, start, finish)
```

Return `mq3.collision.world.traceThroughSphere(work, origin, radius, start, finish)` from `collision.world.CM_TraceThroughSphere`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.traceThroughSphere`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.collision.world.traceThroughSphere`. |
| `radius` | `dynamic` | — | Radius passed as `radius` to `mq3.collision.world.traceThroughSphere`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.traceThroughSphere`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.traceThroughSphere`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1097)

<a id="function-function-mq3-collision-world-cm-tracethroughtree-function-cm-tracethroughtree-work-src-mq3-collision-world-ml-571723797"></a>
### CM_TraceThroughTree

```ml
function CM_TraceThroughTree(work)
```

Return `mq3.collision.world.throughTree(work)` from `collision.world.CM_TraceThroughTree`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.throughTree`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1504)

<a id="function-function-mq3-collision-world-cm-tracethroughverticalcylinder-function-cm-tracethroughverticalcylinder-work-origin-radius-halfheight-start-finish-src-mq3-collision-world-ml-2022447718"></a>
### CM_TraceThroughVerticalCylinder

```ml
function CM_TraceThroughVerticalCylinder(work, origin, radius, halfheight, start, finish)
```

Return `mq3.collision.world.traceThroughVerticalCylinder(work, origin, radius, halfheight, start, finish)` from `collision.world.CM_TraceThroughVerticalCylinder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.world.traceThroughVerticalCylinder`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.collision.world.traceThroughVerticalCylinder`. |
| `radius` | `dynamic` | — | Radius passed as `radius` to `mq3.collision.world.traceThroughVerticalCylinder`. |
| `halfheight` | `dynamic` | — | Halfheight passed as `halfheight` to `mq3.collision.world.traceThroughVerticalCylinder`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.traceThroughVerticalCylinder`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.traceThroughVerticalCylinder`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1105)

<a id="function-function-mq3-collision-world-cm-transformedboxtrace-function-cm-transformedboxtrace-world-start-finish-mins-maxs-model-mask-origin-angles-capsule-src-mq3-collision-world-ml-2047533957"></a>
### CM_TransformedBoxTrace

```ml
function CM_TransformedBoxTrace(world, start, finish, mins, maxs, model, mask, origin, angles, capsule)
```

Return `mq3.collision.world.transformedTrace(world, start, finish, mins, maxs, model, mask, origin, angles, capsule, true)` from `collision.world.CM_TransformedBoxTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.transformedTrace`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.transformedTrace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.transformedTrace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.transformedTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.transformedTrace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.transformedTrace`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.collision.world.transformedTrace`. |
| `angles` | `dynamic` | — | Angles passed as `angles` to `mq3.collision.world.transformedTrace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1537)

<a id="function-function-mq3-collision-world-cmod-loadbrushes-function-cmod-loadbrushes-map-sides-shaders-src-mq3-collision-world-ml-1026799518"></a>
### CMod_LoadBrushes

```ml
function CMod_LoadBrushes(map, sides, shaders)
```

Compute c mod load brushes in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |
| `sides` | `dynamic` | — | Sides used in `len(sides)` and `((first + count) > len(sides))`. |
| `shaders` | `dynamic` | — | Shaders used in `len(shaders)` and `shaders[shaderNumber]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L349)

<a id="function-function-mq3-collision-world-cmod-loadbrushsides-function-cmod-loadbrushsides-map-planes-shaders-src-mq3-collision-world-ml-1159698651"></a>
### CMod_LoadBrushSides

```ml
function CMod_LoadBrushSides(map, planes, shaders)
```

Compute c mod load brush sides in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |
| `planes` | `dynamic` | — | Planes used in `len(planes)` and `planes[planeNumber]`. |
| `shaders` | `dynamic` | — | Shaders used in `len(shaders)` and `shaders[shaderNumber]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L336)

<a id="function-function-mq3-collision-world-cmod-loadentitystring-function-cmod-loadentitystring-map-src-mq3-collision-world-ml-2044767076"></a>
### CMod_LoadEntityString

```ml
function CMod_LoadEntityString(map)
```

Return `decode(slice(map.data, map.offsets[0], map.lengths[0]))` from `collision.world.CMod_LoadEntityString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `data`, `offsets`, `lengths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L406)

<a id="function-function-mq3-collision-world-cmod-loadleafbrushes-function-cmod-loadleafbrushes-map-src-mq3-collision-world-ml-188990492"></a>
### CMod_LoadLeafBrushes

```ml
function CMod_LoadLeafBrushes(map)
```

Compute c mod load leaf brushes in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `data`, `offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L354)

<a id="function-function-mq3-collision-world-cmod-loadleafs-function-cmod-loadleafs-map-leafbrushes-leafsurfaces-src-mq3-collision-world-ml-452037304"></a>
### CMod_LoadLeafs

```ml
function CMod_LoadLeafs(map, leafBrushes, leafSurfaces)
```

Compute c mod load leafs in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |
| `leafBrushes` | `dynamic` | — | Leaf brushes used in `len(leafBrushes)` and `((firstBrush + brushCount) > len(leafBrushes))`. |
| `leafSurfaces` | `dynamic` | — | Leaf surfaces used in `len(leafSurfaces)` and `((firstSurface + surfaceCount) > len(leafSurfaces))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L366)

<a id="function-function-mq3-collision-world-cmod-loadleafsurfaces-function-cmod-loadleafsurfaces-map-src-mq3-collision-world-ml-878967716"></a>
### CMod_LoadLeafSurfaces

```ml
function CMod_LoadLeafSurfaces(map)
```

Compute c mod load leaf surfaces in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `data`, `offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L359)

<a id="function-function-mq3-collision-world-cmod-loadnodes-function-cmod-loadnodes-map-planes-src-mq3-collision-world-ml-371944467"></a>
### CMod_LoadNodes

```ml
function CMod_LoadNodes(map, planes)
```

Compute c mod load nodes in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |
| `planes` | `dynamic` | — | Planes used in `len(planes)` and `planes[planeNumber]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L373)

<a id="function-function-mq3-collision-world-cmod-loadpatches-function-cmod-loadpatches-map-shaders-curves-src-mq3-collision-world-ml-1660563942"></a>
### CMod_LoadPatches

```ml
function CMod_LoadPatches(map, shaders, curves)
```

Compute c mod load patches in collision.world; the normal completion returns `surfaces`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |
| `shaders` | `dynamic` | — | Shaders used in `len(shaders)` and `shaders[shaderNumber]`. |
| `curves` | `dynamic` | — | Curves operand used by `CMod_LoadPatches`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L414)

<a id="function-function-mq3-collision-world-cmod-loadplanes-function-cmod-loadplanes-map-src-mq3-collision-world-ml-1582397518"></a>
### CMod_LoadPlanes

```ml
function CMod_LoadPlanes(map)
```

Compute c mod load planes in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L328)

<a id="function-function-mq3-collision-world-cmod-loadshaders-function-cmod-loadshaders-map-src-mq3-collision-world-ml-758872580"></a>
### CMod_LoadShaders

```ml
function CMod_LoadShaders(map)
```

Compute c mod load shaders in collision.world; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L322)

<a id="function-function-mq3-collision-world-cmod-loadsubmodels-function-cmod-loadsubmodels-map-src-mq3-collision-world-ml-1756385656"></a>
### CMod_LoadSubmodels

```ml
function CMod_LoadSubmodels(map)
```

Compute c mod load submodels in collision.world; the normal completion returns `Submodels(models, bounds)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L379)

<a id="function-function-mq3-collision-world-cmod-loadvisibility-function-cmod-loadvisibility-map-src-mq3-collision-world-ml-610872384"></a>
### CMod_LoadVisibility

```ml
function CMod_LoadVisibility(map)
```

Return `mq3.collision.visibility.load(map)` from `collision.world.CMod_LoadVisibility`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.collision.visibility.load`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L409)

<a id="function-function-mq3-collision-world-createrotationmatrix-function-createrotationmatrix-angles-src-mq3-collision-world-ml-1316376898"></a>
### CreateRotationMatrix

```ml
function CreateRotationMatrix(angles)
```

Return `mq3.collision.world.rotationMatrix(angles)` from `collision.world.CreateRotationMatrix`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Angles passed as `angles` to `mq3.collision.world.rotationMatrix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1540)

<a id="function-function-mq3-collision-world-enumerateleaves-function-enumerateleaves-world-mins-maxs-src-mq3-collision-world-ml-569522512"></a>
### enumerateLeaves

```ml
function enumerateLeaves(world, mins, maxs)
```

Compute enumerate leaves in collision.world; the normal completion returns `leaves.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `nodes`. |
| `mins` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `maxs` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1231)

<a id="function-function-mq3-collision-world-fail-function-fail-message-src-mq3-collision-world-ml-1876503333"></a>
### fail

```ml
function fail(message)
```

Create the collision.world error for `fail` with 3503 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("Collision: " + message)` and `error(3503, ("Collision: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L256)

<a id="function-function-mq3-collision-world-inlinemodel-function-inlinemodel-world-index-src-mq3-collision-world-ml-1510907838"></a>
### inlineModel

```ml
function inlineModel(world, index)
```

Compute inline model in collision.world; the normal completion returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`. |
| `index` | `dynamic` | — | Index used in `(index < 0)` and `(index >= len(world.models))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L579)

<a id="function-function-mq3-collision-world-interpolate-function-interpolate-a-b-fraction-src-mq3-collision-world-ml-1595775597"></a>
### interpolate

```ml
function interpolate(a, b, fraction)
```

Interpolate world in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[axis]` and `n.fsub(b[axis], a[axis])`. |
| `b` | `dynamic` | — | B used in `b[axis]` and `n.fsub(b[axis], a[axis])`. |
| `fraction` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L843)

- [mq3.collision.world.Leaf](Type-mq3-collision-world-leaf-658400430.md) — struct
- [mq3.collision.world.LeafList](Type-mq3-collision-world-leaflist-1057216602.md) — struct
<a id="function-function-mq3-collision-world-load-function-load-data-src-mq3-collision-world-ml-698594602"></a>
### load

```ml
function load(data)
```

Return `mq3.collision.world.loadWorld(data, true)` from `collision.world.load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.collision.world.loadWorld`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L638)

<a id="function-function-mq3-collision-world-loadbrushworld-function-loadbrushworld-data-src-mq3-collision-world-ml-1246927618"></a>
### loadBrushWorld

```ml
function loadBrushWorld(data)
```

Return `mq3.collision.world.loadWorld(data, false)` from `collision.world.loadBrushWorld`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.collision.world.loadWorld`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L632)

- [mq3.collision.world.LoadResult](Type-mq3-collision-world-loadresult-813987899.md) — struct
<a id="function-function-mq3-collision-world-loadworld-function-loadworld-data-curves-src-mq3-collision-world-ml-902656670"></a>
### loadWorld

```ml
function loadWorld(data, curves)
```

Load world in collision.world; the normal completion returns `world`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.bsp.load`. |
| `curves` | `dynamic` | — | Curves passed as `curves` to `mq3.collision.world.CMod_LoadPatches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L463)

<a id="function-function-mq3-collision-world-makebox-function-makebox-mins-maxs-src-mq3-collision-world-ml-1266402242"></a>
### makeBox

```ml
function makeBox(mins, maxs)
```

Compute make box in collision.world; the normal completion returns `Brush(planes, void, 33554432, mins, maxs)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — | Initial `mins` field stored in the returned or constructed `mq3.collision.world.Brush` record. |
| `maxs` | `dynamic` | — | Initial `maxs` field stored in the returned or constructed `mq3.collision.world.Brush` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L479)

<a id="function-function-mq3-collision-world-mapstate-function-mapstate-curves-src-mq3-collision-world-ml-2127125190"></a>
### mapState

```ml
function mapState(curves)
```

Create `mq3.collision.world.MapState` with world=void; name=""; checksum=0; lastChecksum=0; curves=curves.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `curves` | `dynamic` | — | Initial `curves` field stored in the returned or constructed `mq3.collision.world.MapState` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L607)

- [mq3.collision.world.MapState](Type-mq3-collision-world-mapstate-676803657.md) — struct
<a id="function-function-mq3-collision-world-markcapsulepositionhit-function-markcapsulepositionhit-work-src-mq3-collision-world-ml-874545067"></a>
### markCapsulePositionHit

```ml
function markCapsulePositionHit(work)
```

Compute mark capsule position hit in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L913)

<a id="function-function-mq3-collision-world-max-function-max-a-b-src-mq3-collision-world-ml-760584533"></a>
### max

```ml
function max(a, b)
```

Compute max in collision.world; the normal completion returns `b`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `(a > b)`. |
| `b` | `dynamic` | — | B used in `(a > b)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L270)

<a id="function-function-mq3-collision-world-min-function-min-a-b-src-mq3-collision-world-ml-512261601"></a>
### min

```ml
function min(a, b)
```

Compute min in collision.world; the normal completion returns `b`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `(a < b)`. |
| `b` | `dynamic` | — | B used in `(a < b)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L263)

<a id="function-function-mq3-collision-world-modelbounds-function-modelbounds-world-model-src-mq3-collision-world-ml-1489723531"></a>
### modelBounds

```ml
function modelBounds(world, model)
```

Compute model bounds in collision.world; the normal completion returns `[arrays.slice(bounds[0], 0, 3), arrays.slice(bounds[1], 0, 3)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `temporary`, `models`, `bounds`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.checkModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L552)

<a id="function-function-mq3-collision-world-modelbrushes-function-modelbrushes-world-point-model-src-mq3-collision-world-ml-1286212657"></a>
### modelBrushes

```ml
function modelBrushes(world, point, model)
```

Compute model brushes in collision.world; the normal completion returns `world.models[model].brushes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`, `leaves`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.pointLeafnum`. |
| `model` | `dynamic` | — | Zero-based index into `world.models`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L665)

- [mq3.collision.world.Node](Type-mq3-collision-world-node-1268744198.md) — struct
<a id="function-function-mq3-collision-world-planemetadata-function-planemetadata-normal-src-mq3-collision-world-ml-1130076203"></a>
### planeMetadata

```ml
function planeMetadata(normal)
```

Compute plane metadata in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.world.planeType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L300)

<a id="function-function-mq3-collision-world-planetype-function-planetype-normal-src-mq3-collision-world-ml-836707049"></a>
### planeType

```ml
function planeType(normal)
```

Compute plane type in collision.world; the normal completion returns `3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal used in `normal[axis]` and `(normal[axis] == 1.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L291)

<a id="function-function-mq3-collision-world-pointcontents-function-pointcontents-world-point-model-src-mq3-collision-world-ml-1782986297"></a>
### pointContents

```ml
function pointContents(world, point, model)
```

Compute point contents in collision.world; the normal completion returns `n.i32(contents)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`, `temporary`, `brushes`. |
| `point` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.checkModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L684)

<a id="function-function-mq3-collision-world-pointleafnum-function-pointleafnum-world-point-src-mq3-collision-world-ml-173991548"></a>
### pointLeafnum

```ml
function pointLeafnum(world, point)
```

Compute point leafnum in collision.world; the normal completion returns `(- 1 - num)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `nodes`. |
| `point` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L645)

<a id="function-function-mq3-collision-world-positiontest-function-positiontest-work-src-mq3-collision-world-ml-1615063919"></a>
### positionTest

```ml
function positionTest(work)
```

Compute position test in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `start`, `mins`, `maxs`, `world`, `trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L806)

<a id="function-function-mq3-collision-world-real-function-real-data-offset-src-mq3-collision-world-ml-287112597"></a>
### real

```ml
function real(data, offset)
```

Compute real in collision.world; the normal completion returns `n.bitsFloat(bits)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readU32`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L283)

<a id="function-function-mq3-collision-world-reciprocalcapsulework-function-reciprocalcapsulework-work-model-src-mq3-collision-world-ml-856703692"></a>
### reciprocalCapsuleWork

```ml
function reciprocalCapsuleWork(work, model)
```

Update `work.capsule`, `work.radius`, `work.halfheight`, `work.capsuleOffset` in collision.world; the normal completion returns `work.world.temporary.brush`.

Direct state writes: `work.capsule`, `work.radius`, `work.halfheight`, `work.capsuleOffset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `world`, `start`, `finish`, `mins`, `maxs`. Updated in place: `capsule`, `radius`, `halfheight`, `capsuleOffset`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.capsuleTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L944)

- [mq3.collision.world.Result](Type-mq3-collision-world-result-1342673267.md) — struct
<a id="function-function-mq3-collision-world-rotatepoint-function-rotatepoint-point-matrix-src-mq3-collision-world-ml-230305295"></a>
### RotatePoint

```ml
function RotatePoint(point, matrix)
```

Return `mq3.collision.world.rotatePoint(point, matrix)` from `collision.world.RotatePoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.rotatePoint`. |
| `matrix` | `dynamic` | — | Matrix passed as `matrix` to `mq3.collision.world.rotatePoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1544)

<a id="function-function-mq3-collision-world-rotatepoint-function-rotatepoint-point-matrix-src-mq3-collision-world-ml-1131526671"></a>
### rotatePoint

```ml
function rotatePoint(point, matrix)
```

Compute collision.world.rotatePoint as `[q.DotProduct(matrix[0], point), q.DotProduct(matrix[1], point), q.DotProduct(matrix[2], point)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Right three-element vector. |
| `matrix` | `dynamic` | — | Matrix used in `matrix[0]` and `matrix[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1319)

<a id="function-function-mq3-collision-world-rotationmatrix-function-rotationmatrix-angles-src-mq3-collision-world-ml-1220461446"></a>
### rotationMatrix

```ml
function rotationMatrix(angles)
```

Compute rotation matrix in collision.world; the normal completion returns `matrix`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Three-element [pitch, yaw, roll] array in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1308)

<a id="function-function-mq3-collision-world-setplanesignbits-function-setplanesignbits-normal-src-mq3-collision-world-ml-1817958217"></a>
### SetPlaneSignbits

```ml
function SetPlaneSignbits(normal)
```

BSPC's local SetPlaneSignbits and the qcommon loader use the same bit order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal used in `normal[axis]` and `(normal[axis] < 0.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L311)

- [mq3.collision.world.Shader](Type-mq3-collision-world-shader-931638211.md) — struct
<a id="function-function-mq3-collision-world-shadername-function-shadername-data-offset-src-mq3-collision-world-ml-129016117"></a>
### shaderName

```ml
function shaderName(data, offset)
```

Compute shader name in collision.world; the normal completion returns `decode(slice(data, offset, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[(offset + count)]` and `slice(data, offset, count)`. |
| `offset` | `dynamic` | — | Offset used in `(offset + count)` and `data[(offset + count)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L317)

- [mq3.collision.world.Submodels](Type-mq3-collision-world-submodels-309237442.md) — struct
- [mq3.collision.world.Surface](Type-mq3-collision-world-surface-1666971561.md) — struct
<a id="function-function-mq3-collision-world-tempboxmodel-function-tempboxmodel-world-mins-maxs-capsule-src-mq3-collision-world-ml-121849499"></a>
### tempBoxModel

```ml
function tempBoxModel(world, mins, maxs, capsule)
```

Compute temp box model in collision.world; the normal completion returns `qcommonHeaders.BOX_MODEL_HANDLE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `temporary`. |
| `mins` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `maxs` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `capsule` | `dynamic` | — | Capsule operand used by `tempBoxModel`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L496)

- [mq3.collision.world.Temporary](Type-mq3-collision-world-temporary-686486401.md) — struct
<a id="function-function-mq3-collision-world-testboundingboxincapsule-function-testboundingboxincapsule-work-model-src-mq3-collision-world-ml-687257532"></a>
### testBoundingBoxInCapsule

```ml
function testBoundingBoxInCapsule(work, model)
```

Compute test bounding box in capsule in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `mask`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.reciprocalCapsuleWork`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L958)

<a id="function-function-mq3-collision-world-testcapsuleincapsule-function-testcapsuleincapsule-work-model-src-mq3-collision-world-ml-1889349704"></a>
### testCapsuleInCapsule

```ml
function testCapsuleInCapsule(work, model)
```

Compute test capsule in capsule in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `world`, `start`, `capsuleOffset`, `radius`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.capsuleTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L921)

<a id="function-function-mq3-collision-world-testinbrush-function-testinbrush-work-b-src-mq3-collision-world-ml-911063321"></a>
### testInBrush

```ml
function testInBrush(work, b)
```

Compute test in brush in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `boundsMin`, `boundsMax`, `start`, `capsule`, `radius`, `capsuleOffset`, `mins` and further fields. |
| `b` | `dynamic` | — | Record exposing `maxs`, `mins`, `planes`, `contents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L711)

<a id="function-function-mq3-collision-world-throughleaf-function-throughleaf-work-leaf-positiontest-src-mq3-collision-world-ml-469372154"></a>
### throughLeaf

```ml
function throughLeaf(work, leaf, positionTest)
```

Compute through leaf in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `seen`, `visitSerial`, `world`, `mask`, `capsule`, `trace`, `start` and further fields. |
| `leaf` | `dynamic` | — | Record exposing `brushes`, `surfaces`. |
| `positionTest` | `dynamic` | — | Position test operand used by `throughLeaf`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L744)

<a id="function-function-mq3-collision-world-throughtree-function-throughtree-work-src-mq3-collision-world-ml-157451657"></a>
### throughTree

```ml
function throughTree(work)
```

Compute through tree in collision.world.

Validation failures include `Collision: invalid BSP trace interval`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `start`, `finish`, `trace`, `world`, `isPoint`, `maxs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L855)

<a id="function-function-mq3-collision-world-trace-function-trace-world-start-finish-mins-maxs-model-mask-capsule-curves-src-mq3-collision-world-ml-1323450997"></a>
### trace

```ml
function trace(world, start, finish, mins, maxs, model, mask, capsule, curves)
```

Return `mq3.collision.world.traceWithSphere(world, start, finish, mins, maxs, model, mask, capsule, curves, void)` from `collision.world.trace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.traceWithSphere`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.traceWithSphere`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.traceWithSphere`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.traceWithSphere`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.traceWithSphere`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.traceWithSphere`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.traceWithSphere`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.traceWithSphere`. |
| `curves` | `dynamic` | — | Curves passed as `curves` to `mq3.collision.world.traceWithSphere`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1302)

<a id="function-function-mq3-collision-world-traceboundingboxthroughcapsule-function-traceboundingboxthroughcapsule-work-model-src-mq3-collision-world-ml-1494781132"></a>
### traceBoundingBoxThroughCapsule

```ml
function traceBoundingBoxThroughCapsule(work, model)
```

Trace bounding box through capsule in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `mask`, `trace`, `start`, `finish`, `mins`, `maxs`, `radius` and further fields. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.reciprocalCapsuleWork`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1077)

<a id="function-function-mq3-collision-world-tracecapsulethroughcapsule-function-tracecapsulethroughcapsule-work-model-src-mq3-collision-world-ml-888031324"></a>
### traceCapsuleThroughCapsule

```ml
function traceCapsuleThroughCapsule(work, model)
```

Trace capsule through capsule in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `world`, `boundsMin`, `boundsMax`, `start`, `capsuleOffset`, `finish`, `radius` and further fields. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.capsuleTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1055)

<a id="extern_function-extern-function-mq3-collision-world-tracesegmentstep-extern-function-tracesegmentstep-records-as-ptr-capacity-as-i32-offset-as-i32-axis-as-i32-nx-as-double-ny-as-double-nz-as-double-planedistance-as-double-extent-as-double-from-miniquake3-qvm-dll-symbol-mq3-trace-segment-step-returns-i32-src-mq3-collision-world-ml-807354913"></a>
### traceSegmentStep

```ml
extern function traceSegmentStep(records as ptr, capacity as i32, offset as i32, axis as i32, nx as double, ny as double, nz as double, planeDistance as double, extent as double) from "miniquake3_qvm.dll" symbol "mq3_trace_segment_step" returns i32
```

Classify or split one packed BSP trace segment against a plane, writing child-segment fractions in place.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Writable packed segment-record buffer. |
| `capacity` | `i32` | — | Record-buffer byte capacity. |
| `offset` | `i32` | — | Byte offset with room for the 64-byte segment workspace. |
| `axis` | `i32` | — | Axial plane index 0..2, or 3 for the supplied general normal. |
| `nx` | `double` | — | General plane-normal X component. |
| `ny` | `double` | — | General plane-normal Y component. |
| `nz` | `double` | — | General plane-normal Z component. |
| `planeDistance` | `double` | — | Plane distance from the origin. |
| `extent` | `double` | — | Box extent projected onto the plane. |


**Returns:** 0 or 1 for a single side, 2 or 3 for a split traversal order, or -1 for an invalid workspace or axis.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L29)

<a id="function-function-mq3-collision-world-tracethroughsphere-function-tracethroughsphere-work-origin-radius-start-finish-src-mq3-collision-world-ml-1779553718"></a>
### traceThroughSphere

```ml
function traceThroughSphere(work, origin, radius, start, finish)
```

Trace through sphere in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `trace`, `modelOrigin`. |
| `origin` | `dynamic` | — | Point passed as `point` to `mq3.collision.brush.distanceFromLineSquared`. |
| `radius` | `dynamic` | — | Left floating-point operand. |
| `start` | `dynamic` | — | Line start passed as `lineStart` to `mq3.collision.brush.distanceFromLineSquared`. |
| `finish` | `dynamic` | — | Line end passed as `lineEnd` to `mq3.collision.brush.distanceFromLineSquared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L970)

<a id="function-function-mq3-collision-world-tracethroughverticalcylinder-function-tracethroughverticalcylinder-work-origin-radius-halfheight-start-finish-src-mq3-collision-world-ml-1720086476"></a>
### traceThroughVerticalCylinder

```ml
function traceThroughVerticalCylinder(work, origin, radius, halfheight, start, finish)
```

Trace through vertical cylinder in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `trace`, `modelOrigin`. |
| `origin` | `dynamic` | — | Origin used in `origin[0]` and `origin[1]`. |
| `radius` | `dynamic` | — | Left floating-point operand. |
| `halfheight` | `dynamic` | — | Right floating-point operand. |
| `start` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorMA`. |
| `finish` | `dynamic` | — | Finish used in `finish[0]` and `finish[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1012)

<a id="function-function-mq3-collision-world-tracetransformedbox-function-tracetransformedbox-world-start-finish-mins-maxs-mask-origin-src-mq3-collision-world-ml-1144927587"></a>
### traceTransformedBox

```ml
function traceTransformedBox(world, start, finish, mins, maxs, mask, origin)
```

Trace transformed box in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `temporary`. |
| `start` | `dynamic` | — | Start used in `start[0]` and `start[1]`. |
| `finish` | `dynamic` | — | Finish used in `finish[0]` and `finish[1]`. |
| `mins` | `dynamic` | — | Mins used in `mins[0]` and `mins[1]`. |
| `maxs` | `dynamic` | — | Maxs used in `maxs[0]` and `maxs[1]`. |
| `mask` | `dynamic` | — | Mask used in `(target.contents & mask)` and `((target.contents & mask) != 0)`. |
| `origin` | `dynamic` | — | Origin used in `origin[0]` and `origin[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1369)

<a id="extern_function-extern-function-mq3-collision-world-tracetransformedboxnative-extern-function-tracetransformedboxnative-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-lx-as-double-ly-as-double-lz-as-double-hx-as-double-hy-as-double-hz-as-double-ox-as-double-oy-as-double-oz-as-double-tx-as-double-ty-as-double-tz-as-double-ux-as-double-uy-as-double-uz-as-double-matchesmask-as-i32-output-as-bytes-from-miniquake3-qvm-dll-symbol-mq3-trace-transformed-box-returns-i32-src-mq3-collision-world-ml-1602816569"></a>
### traceTransformedBoxNative

```ml
extern function traceTransformedBoxNative(ax as double, ay as double, az as double, bx as double, by as double, bz as double, lx as double, ly as double, lz as double, hx as double, hy as double, hz as double, ox as double, oy as double, oz as double, tx as double, ty as double, tz as double, ux as double, uy as double, uz as double, matchesMask as i32, output as bytes) from "miniquake3_qvm.dll" symbol "mq3_trace_transformed_box" returns i32
```

Trace a moving box against an origin-translated temporary box and store five binary32 trace values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ax` | `double` | — | X component of the sweep start. |
| `ay` | `double` | — | Y component of the sweep start. |
| `az` | `double` | — | Z component of the sweep start. |
| `bx` | `double` | — | X component of the sweep end. |
| `by` | `double` | — | Y component of the sweep end. |
| `bz` | `double` | — | Z component of the sweep end. |
| `lx` | `double` | — | X component of the moving box minimum. |
| `ly` | `double` | — | Y component of the moving box minimum. |
| `lz` | `double` | — | Z component of the moving box minimum. |
| `hx` | `double` | — | X component of the moving box maximum. |
| `hy` | `double` | — | Y component of the moving box maximum. |
| `hz` | `double` | — | Z component of the moving box maximum. |
| `ox` | `double` | — | X component of the model origin. |
| `oy` | `double` | — | Y component of the model origin. |
| `oz` | `double` | — | Z component of the model origin. |
| `tx` | `double` | — | X component of the stationary box minimum. |
| `ty` | `double` | — | Y component of the stationary box minimum. |
| `tz` | `double` | — | Z component of the stationary box minimum. |
| `ux` | `double` | — | X component of the stationary box maximum. |
| `uy` | `double` | — | Y component of the stationary box maximum. |
| `uz` | `double` | — | Z component of the stationary box maximum. |
| `matchesMask` | `i32` | — | Nonzero when the temporary box contents match the trace mask. |
| `output` | `bytes` | — | Writable buffer for five binary32 values (20 bytes). |


**Returns:** The native trace status; nonnegative results write the output, while a negative result rejects invalid input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L55)

<a id="function-function-mq3-collision-world-tracewithsphere-function-tracewithsphere-world-start-finish-mins-maxs-model-mask-capsule-curves-sphere-src-mq3-collision-world-ml-2147135662"></a>
### traceWithSphere

```ml
function traceWithSphere(world, start, finish, mins, maxs, model, mask, capsule, curves, sphere)
```

Return `mq3.collision.world.traceWithSphereOrigin(world, start, finish, mins, maxs, model, mask, capsule, curves, sphere, [0.0, 0.0, 0.0])` from `collision.world.traceWithSphere`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.traceWithSphereOrigin`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.traceWithSphereOrigin`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.traceWithSphereOrigin`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.traceWithSphereOrigin`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.traceWithSphereOrigin`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.traceWithSphereOrigin`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.traceWithSphereOrigin`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.traceWithSphereOrigin`. |
| `curves` | `dynamic` | — | Curves passed as `curves` to `mq3.collision.world.traceWithSphereOrigin`. |
| `sphere` | `dynamic` | — | Sphere passed as `sphere` to `mq3.collision.world.traceWithSphereOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1223)

<a id="function-function-mq3-collision-world-tracewithsphereorigin-function-tracewithsphereorigin-world-start-finish-mins-maxs-model-mask-capsule-curves-sphere-modelorigin-src-mq3-collision-world-ml-1204920617"></a>
### traceWithSphereOrigin

```ml
function traceWithSphereOrigin(world, start, finish, mins, maxs, model, mask, capsule, curves, sphere, modelOrigin)
```

Trace with sphere origin in collision.world; the normal completion returns `Result(work.trace, endpos)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `patchesReady`, `models`, `temporary`, `brushes`, `surfaces`. |
| `start` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `finish` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `mins` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `maxs` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.checkTraceModel`. |
| `mask` | `dynamic` | — | Initial `mask` field stored in the returned or constructed `mq3.collision.world.Work` record. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.checkTraceModel`. |
| `curves` | `dynamic` | — | Initial `curves` field stored in the returned or constructed `mq3.collision.world.Work` record. |
| `sphere` | `dynamic` | — | Sphere used in `sphere[0]` and `sphere[1]`. |
| `modelOrigin` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1127)

<a id="function-function-mq3-collision-world-transformedpointcontents-function-transformedpointcontents-world-point-model-origin-angles-src-mq3-collision-world-ml-16528947"></a>
### transformedPointContents

```ml
function transformedPointContents(world, point, model, origin, angles)
```

Compute transformed point contents in collision.world; the normal completion returns `pointContents(world, localPoint, model)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World passed as `world` to `mq3.collision.world.pointContents`. |
| `point` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.pointContents`. |
| `origin` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `angles` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1335)

<a id="function-function-mq3-collision-world-transformedtrace-function-transformedtrace-world-start-finish-mins-maxs-model-mask-origin-angles-capsule-curves-src-mq3-collision-world-ml-1375918085"></a>
### transformedTrace

```ml
function transformedTrace(world, start, finish, mins, maxs, model, mask, origin, angles, capsule, curves)
```

Compute transformed trace in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`, `patchesReady`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.traceTransformedBox`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.traceTransformedBox`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.traceTransformedBox`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.traceTransformedBox`. |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.collision.world.traceWithSphereOrigin`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.traceTransformedBox`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.collision.world.traceTransformedBox`. |
| `angles` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.traceWithSphereOrigin`. |
| `curves` | `dynamic` | — | Curves passed as `curves` to `mq3.collision.world.traceWithSphereOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1407)

<a id="function-function-mq3-collision-world-transpose-function-transpose-matrix-src-mq3-collision-world-ml-444074477"></a>
### transpose

```ml
function transpose(matrix)
```

Compute collision.world.transpose as `[[matrix[0][0], matrix[1][0], matrix[2][0]], [matrix[0][1], matrix[1][1], matrix[2][1]], [matrix[0][2], matrix[1][2], matrix[2][2]]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Matrix used in `matrix[0]` and `matrix[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1325)

<a id="function-function-mq3-collision-world-transposematrix-function-transposematrix-matrix-src-mq3-collision-world-ml-1249328507"></a>
### TransposeMatrix

```ml
function TransposeMatrix(matrix)
```

Return `mq3.collision.world.transpose(matrix)` from `collision.world.TransposeMatrix`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Matrix passed as `matrix` to `mq3.collision.world.transpose`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1547)

<a id="function-function-mq3-collision-world-vector32-function-vector32-value-src-mq3-collision-world-ml-1909705747"></a>
### vector32

```ml
function vector32(value)
```

Compute vector 32 in collision.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `len(value)` and `value[axis]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1443)

- [mq3.collision.world.Work](Type-mq3-collision-world-work-490237871.md) — struct
- [mq3.collision.world.World](Type-mq3-collision-world-world-1490011094.md) — struct
<a id="extern_function-extern-function-mq3-collision-world-writevmboxtracenative-extern-function-writevmboxtracenative-data-as-bytes-capacity-as-i32-mask-as-u32-base-as-i32-model-as-i32-contents-as-u32-tx-as-double-ty-as-double-tz-as-double-ux-as-double-uy-as-double-uz-as-double-from-miniquake3-qvm-dll-symbol-mq3-cgame-transformed-box-trace-returns-i32-src-mq3-collision-world-ml-1334309275"></a>
### writeVmBoxTraceNative

```ml
extern function writeVmBoxTraceNative(data as bytes, capacity as i32, mask as u32, base as i32, model as i32, contents as u32, tx as double, ty as double, tz as double, ux as double, uy as double, uz as double) from "miniquake3_qvm.dll" symbol "mq3_cgame_transformed_box_trace" returns i32
```

Read a QVM transformed-box trace request and write its temporary-box result directly to VM memory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — | Mutable QVM data memory. |
| `capacity` | `i32` | — | VM memory size in bytes. |
| `mask` | `u32` | — | VM address mask. |
| `base` | `i32` | — | Byte offset of the syscall argument frame. |
| `model` | `i32` | — | Temporary collision-model handle. |
| `contents` | `u32` | — | Temporary box content flags. |
| `tx` | `double` | — | X component of the stationary box minimum. |
| `ty` | `double` | — | Y component of the stationary box minimum. |
| `tz` | `double` | — | Z component of the stationary box minimum. |
| `ux` | `double` | — | X component of the stationary box maximum. |
| `uy` | `double` | — | Y component of the stationary box maximum. |
| `uz` | `double` | — | Z component of the stationary box maximum. |


**Returns:** 1 when the 56-byte trace was written; 0 leaves VM memory unchanged so the checked MiniLang path can handle the request.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L70)

<a id="function-function-mq3-collision-world-writevmtemporaryboxtrace-function-writevmtemporaryboxtrace-world-vm-base-src-mq3-collision-world-ml-1854150410"></a>
### writeVmTemporaryBoxTrace

```ml
function writeVmTemporaryBoxTrace(world, vm, base)
```

Write vm temporary box trace in collision.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record exposing `models`, `temporary`. |
| `vm` | `dynamic` | — | Record exposing `data`, `mask`. |
| `base` | `dynamic` | — | Byte offset of the syscall argument frame. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L1353)
