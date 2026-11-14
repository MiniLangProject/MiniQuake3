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

## Declarations

<a id="function-function-mq3-collision-world-abs-function-abs-a-src-mq3-collision-world-ml-894168649"></a>
### abs

```ml
function abs(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L104)

<a id="function-function-mq3-collision-world-boxbrushes-function-boxbrushes-world-mins-maxs-capacity-src-mq3-collision-world-ml-34143928"></a>
### boxBrushes

```ml
function boxBrushes(world, mins, maxs, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L835)

<a id="function-function-mq3-collision-world-boxleafnums-function-boxleafnums-world-mins-maxs-capacity-src-mq3-collision-world-ml-1364229036"></a>
### boxLeafnums

```ml
function boxLeafnums(world, mins, maxs, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L824)

<a id="function-function-mq3-collision-world-boxside-function-boxside-mins-maxs-plane-src-mq3-collision-world-ml-2057846594"></a>
### boxSide

```ml
function boxSide(mins, maxs, plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L463)

<a id="function-function-mq3-collision-world-boxtrace-function-boxtrace-world-start-finish-mins-maxs-model-mask-capsule-src-mq3-collision-world-ml-1329755983"></a>
### boxTrace

```ml
function boxTrace(world, start, finish, mins, maxs, model, mask, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L931)

<a id="function-function-mq3-collision-world-boxtracenocurves-function-boxtracenocurves-world-start-finish-mins-maxs-model-mask-capsule-src-mq3-collision-world-ml-1235806715"></a>
### boxTraceNoCurves

```ml
function boxTraceNoCurves(world, start, finish, mins, maxs, model, mask, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L927)

- [mq3.collision.world.Brush](Type-mq3-collision-world-brush-1147632650.md) — struct
<a id="function-function-mq3-collision-world-capsuletarget-function-capsuletarget-world-model-src-mq3-collision-world-ml-367239423"></a>
### capsuleTarget

```ml
function capsuleTarget(world, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L575)

<a id="function-function-mq3-collision-world-checkmodel-function-checkmodel-world-model-src-mq3-collision-world-ml-618104487"></a>
### checkModel

```ml
function checkModel(world, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L279)

<a id="function-function-mq3-collision-world-checktracemodel-function-checktracemodel-world-model-capsule-src-mq3-collision-world-ml-99911634"></a>
### checkTraceModel

```ml
function checkTraceModel(world, model, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L287)

<a id="function-function-mq3-collision-world-checktree-function-checktree-nodes-src-mq3-collision-world-ml-1579198055"></a>
### checkTree

```ml
function checkTree(nodes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nodes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L204)

<a id="function-function-mq3-collision-world-cm-boundbrush-function-cm-boundbrush-sides-src-mq3-collision-world-ml-1912966852"></a>
### CM_BoundBrush

```ml
function CM_BoundBrush(sides)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sides` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L148)

<a id="function-function-mq3-collision-world-cm-boxtrace-function-cm-boxtrace-world-start-finish-mins-maxs-model-mask-capsule-src-mq3-collision-world-ml-723231945"></a>
### CM_BoxTrace

```ml
function CM_BoxTrace(world, start, finish, mins, maxs, model, mask, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L947)

<a id="function-function-mq3-collision-world-cm-checksum-function-cm-checksum-map-src-mq3-collision-world-ml-1813192756"></a>
### CM_Checksum

```ml
function CM_Checksum(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L200)

<a id="function-function-mq3-collision-world-cm-clearmap-function-cm-clearmap-state-src-mq3-collision-world-ml-91541271"></a>
### CM_ClearMap

```ml
function CM_ClearMap(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L321)

<a id="function-function-mq3-collision-world-cm-cliphandletomodel-function-cm-cliphandletomodel-world-handle-src-mq3-collision-world-ml-159196456"></a>
### CM_ClipHandleToModel

```ml
function CM_ClipHandleToModel(world, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L299)

<a id="function-function-mq3-collision-world-cm-entitystring-function-cm-entitystring-world-src-mq3-collision-world-ml-1821168140"></a>
### CM_EntityString

```ml
function CM_EntityString(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L316)

<a id="function-function-mq3-collision-world-cm-initboxhull-function-cm-initboxhull-world-src-mq3-collision-world-ml-376592762"></a>
### CM_InitBoxHull

```ml
function CM_InitBoxHull(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L274)

<a id="function-function-mq3-collision-world-cm-inlinemodel-function-cm-inlinemodel-world-index-src-mq3-collision-world-ml-274116902"></a>
### CM_InlineModel

```ml
function CM_InlineModel(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L313)

<a id="function-function-mq3-collision-world-cm-leafarea-function-cm-leafarea-world-leaf-src-mq3-collision-world-ml-2142355562"></a>
### CM_LeafArea

```ml
function CM_LeafArea(world, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L318)

<a id="function-function-mq3-collision-world-cm-leafcluster-function-cm-leafcluster-world-leaf-src-mq3-collision-world-ml-2020439662"></a>
### CM_LeafCluster

```ml
function CM_LeafCluster(world, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L317)

<a id="function-function-mq3-collision-world-cm-loadmap-function-cm-loadmap-state-name-data-clientload-src-mq3-collision-world-ml-459322635"></a>
### CM_LoadMap

```ml
function CM_LoadMap(state, name, data, clientload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `clientload` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L322)

<a id="function-function-mq3-collision-world-cm-lumpchecksum-function-cm-lumpchecksum-map-lump-src-mq3-collision-world-ml-1325910914"></a>
### CM_LumpChecksum

```ml
function CM_LumpChecksum(map, lump)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L199)

<a id="function-function-mq3-collision-world-cm-modelbounds-function-cm-modelbounds-world-model-src-mq3-collision-world-ml-303618195"></a>
### CM_ModelBounds

```ml
function CM_ModelBounds(world, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L307)

<a id="function-function-mq3-collision-world-cm-numclusters-function-cm-numclusters-world-src-mq3-collision-world-ml-1462329550"></a>
### CM_NumClusters

```ml
function CM_NumClusters(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L314)

<a id="function-function-mq3-collision-world-cm-numinlinemodels-function-cm-numinlinemodels-world-src-mq3-collision-world-ml-1298426822"></a>
### CM_NumInlineModels

```ml
function CM_NumInlineModels(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L315)

<a id="function-function-mq3-collision-world-cm-positiontest-function-cm-positiontest-work-src-mq3-collision-world-ml-1610616775"></a>
### CM_PositionTest

```ml
function CM_PositionTest(work)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L938)

<a id="function-function-mq3-collision-world-cm-tempboxmodel-function-cm-tempboxmodel-world-mins-maxs-capsule-src-mq3-collision-world-ml-2040554205"></a>
### CM_TempBoxModel

```ml
function CM_TempBoxModel(world, mins, maxs, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L277)

<a id="function-function-mq3-collision-world-cm-testboundingboxincapsule-function-cm-testboundingboxincapsule-work-model-src-mq3-collision-world-ml-941002064"></a>
### CM_TestBoundingBoxInCapsule

```ml
function CM_TestBoundingBoxInCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L730)

<a id="function-function-mq3-collision-world-cm-testboxinbrush-function-cm-testboxinbrush-work-value-src-mq3-collision-world-ml-812838618"></a>
### CM_TestBoxInBrush

```ml
function CM_TestBoxInBrush(work, value)
```

Public spellings retained by the original qcommon collision API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L936)

<a id="function-function-mq3-collision-world-cm-testcapsuleincapsule-function-cm-testcapsuleincapsule-work-model-src-mq3-collision-world-ml-1693043276"></a>
### CM_TestCapsuleInCapsule

```ml
function CM_TestCapsuleInCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L729)

<a id="function-function-mq3-collision-world-cm-testinleaf-function-cm-testinleaf-work-leaf-src-mq3-collision-world-ml-1131045019"></a>
### CM_TestInLeaf

```ml
function CM_TestInLeaf(work, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L937)

<a id="function-function-mq3-collision-world-cm-trace-function-cm-trace-world-start-finish-mins-maxs-model-mask-capsule-curves-src-mq3-collision-world-ml-135742467"></a>
### CM_Trace

```ml
function CM_Trace(world, start, finish, mins, maxs, model, mask, capsule, curves)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L946)

<a id="function-function-mq3-collision-world-cm-traceboundingboxthroughcapsule-function-cm-traceboundingboxthroughcapsule-work-model-src-mq3-collision-world-ml-1143486242"></a>
### CM_TraceBoundingBoxThroughCapsule

```ml
function CM_TraceBoundingBoxThroughCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L734)

<a id="function-function-mq3-collision-world-cm-tracecapsulethroughcapsule-function-cm-tracecapsulethroughcapsule-work-model-src-mq3-collision-world-ml-374259786"></a>
### CM_TraceCapsuleThroughCapsule

```ml
function CM_TraceCapsuleThroughCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L733)

<a id="function-function-mq3-collision-world-cm-tracethroughleaf-function-cm-tracethroughleaf-work-leaf-src-mq3-collision-world-ml-1352420925"></a>
### CM_TraceThroughLeaf

```ml
function CM_TraceThroughLeaf(work, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L939)

<a id="function-function-mq3-collision-world-cm-tracethroughpatch-function-cm-tracethroughpatch-work-surface-src-mq3-collision-world-ml-1346315238"></a>
### CM_TraceThroughPatch

```ml
function CM_TraceThroughPatch(work, surface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L940)

<a id="function-function-mq3-collision-world-cm-tracethroughsphere-function-cm-tracethroughsphere-work-origin-radius-start-finish-src-mq3-collision-world-ml-1645171458"></a>
### CM_TraceThroughSphere

```ml
function CM_TraceThroughSphere(work, origin, radius, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L731)

<a id="function-function-mq3-collision-world-cm-tracethroughtree-function-cm-tracethroughtree-work-src-mq3-collision-world-ml-571723797"></a>
### CM_TraceThroughTree

```ml
function CM_TraceThroughTree(work)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L945)

<a id="function-function-mq3-collision-world-cm-tracethroughverticalcylinder-function-cm-tracethroughverticalcylinder-work-origin-radius-halfheight-start-finish-src-mq3-collision-world-ml-2022447718"></a>
### CM_TraceThroughVerticalCylinder

```ml
function CM_TraceThroughVerticalCylinder(work, origin, radius, halfheight, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `halfheight` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L732)

<a id="function-function-mq3-collision-world-cm-transformedboxtrace-function-cm-transformedboxtrace-world-start-finish-mins-maxs-model-mask-origin-angles-capsule-src-mq3-collision-world-ml-2047533957"></a>
### CM_TransformedBoxTrace

```ml
function CM_TransformedBoxTrace(world, start, finish, mins, maxs, model, mask, origin, angles, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L948)

<a id="function-function-mq3-collision-world-cmod-loadbrushes-function-cmod-loadbrushes-map-sides-shaders-src-mq3-collision-world-ml-1026799518"></a>
### CMod_LoadBrushes

```ml
function CMod_LoadBrushes(map, sides, shaders)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `sides` | `dynamic` | — |  |
| `shaders` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L152)

<a id="function-function-mq3-collision-world-cmod-loadbrushsides-function-cmod-loadbrushsides-map-planes-shaders-src-mq3-collision-world-ml-1159698651"></a>
### CMod_LoadBrushSides

```ml
function CMod_LoadBrushSides(map, planes, shaders)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `planes` | `dynamic` | — |  |
| `shaders` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L145)

<a id="function-function-mq3-collision-world-cmod-loadentitystring-function-cmod-loadentitystring-map-src-mq3-collision-world-ml-2044767076"></a>
### CMod_LoadEntityString

```ml
function CMod_LoadEntityString(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L193)

<a id="function-function-mq3-collision-world-cmod-loadleafbrushes-function-cmod-loadleafbrushes-map-src-mq3-collision-world-ml-188990492"></a>
### CMod_LoadLeafBrushes

```ml
function CMod_LoadLeafBrushes(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L155)

<a id="function-function-mq3-collision-world-cmod-loadleafs-function-cmod-loadleafs-map-leafbrushes-leafsurfaces-src-mq3-collision-world-ml-452037304"></a>
### CMod_LoadLeafs

```ml
function CMod_LoadLeafs(map, leafBrushes, leafSurfaces)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `leafBrushes` | `dynamic` | — |  |
| `leafSurfaces` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L161)

<a id="function-function-mq3-collision-world-cmod-loadleafsurfaces-function-cmod-loadleafsurfaces-map-src-mq3-collision-world-ml-878967716"></a>
### CMod_LoadLeafSurfaces

```ml
function CMod_LoadLeafSurfaces(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L158)

<a id="function-function-mq3-collision-world-cmod-loadnodes-function-cmod-loadnodes-map-planes-src-mq3-collision-world-ml-371944467"></a>
### CMod_LoadNodes

```ml
function CMod_LoadNodes(map, planes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `planes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L165)

<a id="function-function-mq3-collision-world-cmod-loadpatches-function-cmod-loadpatches-map-shaders-curves-src-mq3-collision-world-ml-1660563942"></a>
### CMod_LoadPatches

```ml
function CMod_LoadPatches(map, shaders, curves)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `shaders` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L195)

<a id="function-function-mq3-collision-world-cmod-loadplanes-function-cmod-loadplanes-map-src-mq3-collision-world-ml-1582397518"></a>
### CMod_LoadPlanes

```ml
function CMod_LoadPlanes(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L141)

<a id="function-function-mq3-collision-world-cmod-loadshaders-function-cmod-loadshaders-map-src-mq3-collision-world-ml-758872580"></a>
### CMod_LoadShaders

```ml
function CMod_LoadShaders(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L137)

<a id="function-function-mq3-collision-world-cmod-loadsubmodels-function-cmod-loadsubmodels-map-src-mq3-collision-world-ml-1756385656"></a>
### CMod_LoadSubmodels

```ml
function CMod_LoadSubmodels(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L169)

<a id="function-function-mq3-collision-world-cmod-loadvisibility-function-cmod-loadvisibility-map-src-mq3-collision-world-ml-610872384"></a>
### CMod_LoadVisibility

```ml
function CMod_LoadVisibility(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L194)

<a id="function-function-mq3-collision-world-createrotationmatrix-function-createrotationmatrix-angles-src-mq3-collision-world-ml-1316376898"></a>
### CreateRotationMatrix

```ml
function CreateRotationMatrix(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L949)

<a id="function-function-mq3-collision-world-enumerateleaves-function-enumerateleaves-world-mins-maxs-src-mq3-collision-world-ml-569522512"></a>
### enumerateLeaves

```ml
function enumerateLeaves(world, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L805)

<a id="function-function-mq3-collision-world-fail-function-fail-message-src-mq3-collision-world-ml-1876503333"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L92)

<a id="function-function-mq3-collision-world-inlinemodel-function-inlinemodel-world-index-src-mq3-collision-world-ml-1510907838"></a>
### inlineModel

```ml
function inlineModel(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L309)

<a id="function-function-mq3-collision-world-interpolate-function-interpolate-a-b-fraction-src-mq3-collision-world-ml-1595775597"></a>
### interpolate

```ml
function interpolate(a, b, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L517)

- [mq3.collision.world.Leaf](Type-mq3-collision-world-leaf-658400430.md) — struct
- [mq3.collision.world.LeafList](Type-mq3-collision-world-leaflist-1057216602.md) — struct
<a id="function-function-mq3-collision-world-load-function-load-data-src-mq3-collision-world-ml-698594602"></a>
### load

```ml
function load(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L336)

<a id="function-function-mq3-collision-world-loadbrushworld-function-loadbrushworld-data-src-mq3-collision-world-ml-1246927618"></a>
### loadBrushWorld

```ml
function loadBrushWorld(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L332)

- [mq3.collision.world.LoadResult](Type-mq3-collision-world-loadresult-813987899.md) — struct
<a id="function-function-mq3-collision-world-loadworld-function-loadworld-data-curves-src-mq3-collision-world-ml-902656670"></a>
### loadWorld

```ml
function loadWorld(data, curves)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L235)

<a id="function-function-mq3-collision-world-makebox-function-makebox-mins-maxs-src-mq3-collision-world-ml-1266402242"></a>
### makeBox

```ml
function makeBox(mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L248)

<a id="function-function-mq3-collision-world-mapstate-function-mapstate-curves-src-mq3-collision-world-ml-2127125190"></a>
### mapState

```ml
function mapState(curves)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `curves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L320)

- [mq3.collision.world.MapState](Type-mq3-collision-world-mapstate-676803657.md) — struct
<a id="function-function-mq3-collision-world-markcapsulepositionhit-function-markcapsulepositionhit-work-src-mq3-collision-world-ml-874545067"></a>
### markCapsulePositionHit

```ml
function markCapsulePositionHit(work)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L589)

<a id="function-function-mq3-collision-world-max-function-max-a-b-src-mq3-collision-world-ml-760584533"></a>
### max

```ml
function max(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L100)

<a id="function-function-mq3-collision-world-min-function-min-a-b-src-mq3-collision-world-ml-512261601"></a>
### min

```ml
function min(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L96)

<a id="function-function-mq3-collision-world-modelbounds-function-modelbounds-world-model-src-mq3-collision-world-ml-1489723531"></a>
### modelBounds

```ml
function modelBounds(world, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L291)

<a id="function-function-mq3-collision-world-modelbrushes-function-modelbrushes-world-point-model-src-mq3-collision-world-ml-1286212657"></a>
### modelBrushes

```ml
function modelBrushes(world, point, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L356)

- [mq3.collision.world.Node](Type-mq3-collision-world-node-1268744198.md) — struct
<a id="function-function-mq3-collision-world-planemetadata-function-planemetadata-normal-src-mq3-collision-world-ml-1130076203"></a>
### planeMetadata

```ml
function planeMetadata(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L121)

<a id="function-function-mq3-collision-world-planetype-function-planetype-normal-src-mq3-collision-world-ml-836707049"></a>
### planeType

```ml
function planeType(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L114)

<a id="function-function-mq3-collision-world-pointcontents-function-pointcontents-world-point-model-src-mq3-collision-world-ml-1782986297"></a>
### pointContents

```ml
function pointContents(world, point, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L362)

<a id="function-function-mq3-collision-world-pointleafnum-function-pointleafnum-world-point-src-mq3-collision-world-ml-173991548"></a>
### pointLeafnum

```ml
function pointLeafnum(world, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L340)

<a id="function-function-mq3-collision-world-positiontest-function-positiontest-work-src-mq3-collision-world-ml-1615063919"></a>
### positionTest

```ml
function positionTest(work)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L484)

<a id="function-function-mq3-collision-world-real-function-real-data-offset-src-mq3-collision-world-ml-287112597"></a>
### real

```ml
function real(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L108)

<a id="function-function-mq3-collision-world-reciprocalcapsulework-function-reciprocalcapsulework-work-model-src-mq3-collision-world-ml-856703692"></a>
### reciprocalCapsuleWork

```ml
function reciprocalCapsuleWork(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L612)

- [mq3.collision.world.Result](Type-mq3-collision-world-result-1342673267.md) — struct
<a id="function-function-mq3-collision-world-rotatepoint-function-rotatepoint-point-matrix-src-mq3-collision-world-ml-230305295"></a>
### RotatePoint

```ml
function RotatePoint(point, matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L950)

<a id="function-function-mq3-collision-world-rotatepoint-function-rotatepoint-point-matrix-src-mq3-collision-world-ml-1131526671"></a>
### rotatePoint

```ml
function rotatePoint(point, matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L866)

<a id="function-function-mq3-collision-world-rotationmatrix-function-rotationmatrix-angles-src-mq3-collision-world-ml-1220461446"></a>
### rotationMatrix

```ml
function rotationMatrix(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L858)

<a id="function-function-mq3-collision-world-setplanesignbits-function-setplanesignbits-normal-src-mq3-collision-world-ml-1817958217"></a>
### SetPlaneSignbits

```ml
function SetPlaneSignbits(normal)
```

BSPC's local SetPlaneSignbits and the qcommon loader use the same bit order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L131)

- [mq3.collision.world.Shader](Type-mq3-collision-world-shader-931638211.md) — struct
<a id="function-function-mq3-collision-world-shadername-function-shadername-data-offset-src-mq3-collision-world-ml-129016117"></a>
### shaderName

```ml
function shaderName(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L134)

- [mq3.collision.world.Submodels](Type-mq3-collision-world-submodels-309237442.md) — struct
- [mq3.collision.world.Surface](Type-mq3-collision-world-surface-1666971561.md) — struct
<a id="function-function-mq3-collision-world-tempboxmodel-function-tempboxmodel-world-mins-maxs-capsule-src-mq3-collision-world-ml-121849499"></a>
### tempBoxModel

```ml
function tempBoxModel(world, mins, maxs, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L259)

- [mq3.collision.world.Temporary](Type-mq3-collision-world-temporary-686486401.md) — struct
<a id="function-function-mq3-collision-world-testboundingboxincapsule-function-testboundingboxincapsule-work-model-src-mq3-collision-world-ml-687257532"></a>
### testBoundingBoxInCapsule

```ml
function testBoundingBoxInCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L623)

<a id="function-function-mq3-collision-world-testcapsuleincapsule-function-testcapsuleincapsule-work-model-src-mq3-collision-world-ml-1889349704"></a>
### testCapsuleInCapsule

```ml
function testCapsuleInCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L594)

<a id="function-function-mq3-collision-world-testinbrush-function-testinbrush-work-b-src-mq3-collision-world-ml-911063321"></a>
### testInBrush

```ml
function testInBrush(work, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L395)

<a id="function-function-mq3-collision-world-throughleaf-function-throughleaf-work-leaf-positiontest-src-mq3-collision-world-ml-469372154"></a>
### throughLeaf

```ml
function throughLeaf(work, leaf, positionTest)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |
| `positionTest` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L428)

<a id="function-function-mq3-collision-world-throughtree-function-throughtree-work-src-mq3-collision-world-ml-157451657"></a>
### throughTree

```ml
function throughTree(work)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L525)

<a id="function-function-mq3-collision-world-trace-function-trace-world-start-finish-mins-maxs-model-mask-capsule-curves-src-mq3-collision-world-ml-1323450997"></a>
### trace

```ml
function trace(world, start, finish, mins, maxs, model, mask, capsule, curves)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L854)

<a id="function-function-mq3-collision-world-traceboundingboxthroughcapsule-function-traceboundingboxthroughcapsule-work-model-src-mq3-collision-world-ml-1494781132"></a>
### traceBoundingBoxThroughCapsule

```ml
function traceBoundingBoxThroughCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L723)

<a id="function-function-mq3-collision-world-tracecapsulethroughcapsule-function-tracecapsulethroughcapsule-work-model-src-mq3-collision-world-ml-888031324"></a>
### traceCapsuleThroughCapsule

```ml
function traceCapsuleThroughCapsule(work, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L704)

<a id="function-function-mq3-collision-world-tracethroughsphere-function-tracethroughsphere-work-origin-radius-start-finish-src-mq3-collision-world-ml-1779553718"></a>
### traceThroughSphere

```ml
function traceThroughSphere(work, origin, radius, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L629)

<a id="function-function-mq3-collision-world-tracethroughverticalcylinder-function-tracethroughverticalcylinder-work-origin-radius-halfheight-start-finish-src-mq3-collision-world-ml-1720086476"></a>
### traceThroughVerticalCylinder

```ml
function traceThroughVerticalCylinder(work, origin, radius, halfheight, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `halfheight` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L664)

<a id="function-function-mq3-collision-world-tracewithsphere-function-tracewithsphere-world-start-finish-mins-maxs-model-mask-capsule-curves-sphere-src-mq3-collision-world-ml-2147135662"></a>
### traceWithSphere

```ml
function traceWithSphere(world, start, finish, mins, maxs, model, mask, capsule, curves, sphere)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |
| `sphere` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L801)

<a id="function-function-mq3-collision-world-tracewithsphereorigin-function-tracewithsphereorigin-world-start-finish-mins-maxs-model-mask-capsule-curves-sphere-modelorigin-src-mq3-collision-world-ml-1204920617"></a>
### traceWithSphereOrigin

```ml
function traceWithSphereOrigin(world, start, finish, mins, maxs, model, mask, capsule, curves, sphere, modelOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |
| `sphere` | `dynamic` | — |  |
| `modelOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L736)

<a id="function-function-mq3-collision-world-transformedpointcontents-function-transformedpointcontents-world-point-model-origin-angles-src-mq3-collision-world-ml-16528947"></a>
### transformedPointContents

```ml
function transformedPointContents(world, point, model, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L874)

<a id="function-function-mq3-collision-world-transformedtrace-function-transformedtrace-world-start-finish-mins-maxs-model-mask-origin-angles-capsule-curves-src-mq3-collision-world-ml-1375918085"></a>
### transformedTrace

```ml
function transformedTrace(world, start, finish, mins, maxs, model, mask, origin, angles, capsule, curves)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `curves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L888)

<a id="function-function-mq3-collision-world-transpose-function-transpose-matrix-src-mq3-collision-world-ml-444074477"></a>
### transpose

```ml
function transpose(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L870)

<a id="function-function-mq3-collision-world-transposematrix-function-transposematrix-matrix-src-mq3-collision-world-ml-1249328507"></a>
### TransposeMatrix

```ml
function TransposeMatrix(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L951)

<a id="function-function-mq3-collision-world-vector32-function-vector32-value-src-mq3-collision-world-ml-1909705747"></a>
### vector32

```ml
function vector32(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/world.ml#L917)

- [mq3.collision.world.Work](Type-mq3-collision-world-work-490237871.md) — struct
- [mq3.collision.world.World](Type-mq3-collision-world-world-1490011094.md) — struct
