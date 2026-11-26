# `src/mq3/renderer/tr_world_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_world_runtime`](Package-mq3-renderer-tr-world-runtime-1492145195.md)

Reachable from entry: **no**

## Imports

- `mq3/renderer/world_surface_selection.ml` as `selection` → [src/mq3/renderer/world_surface_selection.ml](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

## Declarations

<a id="function-function-mq3-renderer-tr-world-runtime-boundsoutside-function-boundsoutside-bounds-frustum-src-mq3-renderer-tr-world-runtime-ml-261661297"></a>
### boundsOutside

```ml
function boundsOutside(bounds, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L85)

<a id="function-function-mq3-renderer-tr-world-runtime-boxcull-function-boxcull-bounds-frustum-src-mq3-renderer-tr-world-runtime-ml-39396059"></a>
### boxCull

```ml
function boxCull(bounds, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L34)

<a id="function-function-mq3-renderer-tr-world-runtime-boxonplaneside-function-boxonplaneside-bounds-plane-src-mq3-renderer-tr-world-runtime-ml-1487526049"></a>
### boxOnPlaneSide

```ml
function boxOnPlaneSide(bounds, plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L28)

<a id="constant-constant-mq3-renderer-tr-world-runtime-contents-node-const-contents-node-1-src-mq3-renderer-tr-world-runtime-ml-1641656829"></a>
### CONTENTS_NODE

```ml
const CONTENTS_NODE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L10)

<a id="constant-constant-mq3-renderer-tr-world-runtime-contents-solid-const-contents-solid-1-src-mq3-renderer-tr-world-runtime-ml-359723650"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L11)

<a id="constant-constant-mq3-renderer-tr-world-runtime-ct-back-sided-const-ct-back-sided-1-src-mq3-renderer-tr-world-runtime-ml-1077533372"></a>
### CT_BACK_SIDED

```ml
const CT_BACK_SIDED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-tr-world-runtime-ct-front-sided-const-ct-front-sided-0-src-mq3-renderer-tr-world-runtime-ml-467848413"></a>
### CT_FRONT_SIDED

```ml
const CT_FRONT_SIDED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L12)

<a id="constant-constant-mq3-renderer-tr-world-runtime-ct-two-sided-const-ct-two-sided-2-src-mq3-renderer-tr-world-runtime-ml-8554833"></a>
### CT_TWO_SIDED

```ml
const CT_TWO_SIDED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L14)

<a id="constant-constant-mq3-renderer-tr-world-runtime-cull-clip-const-cull-clip-1-src-mq3-renderer-tr-world-runtime-ml-2081231456"></a>
### CULL_CLIP

```ml
const CULL_CLIP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L8)

<a id="constant-constant-mq3-renderer-tr-world-runtime-cull-in-const-cull-in-0-src-mq3-renderer-tr-world-runtime-ml-94011709"></a>
### CULL_IN

```ml
const CULL_IN = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L7)

<a id="constant-constant-mq3-renderer-tr-world-runtime-cull-out-const-cull-out-2-src-mq3-renderer-tr-world-runtime-ml-58517223"></a>
### CULL_OUT

```ml
const CULL_OUT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L9)

- [mq3.renderer.tr_world_runtime.Dlight](Type-mq3-renderer-tr-world-runtime-dlight-1642492651.md) — struct
<a id="function-function-mq3-renderer-tr-world-runtime-dot-function-dot-a-b-src-mq3-renderer-tr-world-runtime-ml-1470481443"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L26)

- [mq3.renderer.tr_world_runtime.DrawSurface](Type-mq3-renderer-tr-world-runtime-drawsurface-299049956.md) — struct
<a id="function-function-mq3-renderer-tr-world-runtime-expandbounds-function-expandbounds-bounds-mins-maxs-src-mq3-renderer-tr-world-runtime-ml-1348843865"></a>
### expandBounds

```ml
function expandBounds(bounds, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L129)

<a id="function-function-mq3-renderer-tr-world-runtime-fail-function-fail-message-src-mq3-renderer-tr-world-runtime-ml-892235471"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L25)

- [mq3.renderer.tr_world_runtime.MarkResult](Type-mq3-renderer-tr-world-runtime-markresult-1501242355.md) — struct
- [mq3.renderer.tr_world_runtime.Node](Type-mq3-renderer-tr-world-runtime-node-1276201439.md) — struct
- [mq3.renderer.tr_world_runtime.Plane](Type-mq3-renderer-tr-world-runtime-plane-178518151.md) — struct
<a id="function-function-mq3-renderer-tr-world-runtime-r-addbrushmodelsurfaces-function-r-addbrushmodelsurfaces-surfaces-surfaceindexes-bounds-lights-needdlights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1282834186"></a>
### R_AddBrushModelSurfaces

```ml
function R_AddBrushModelSurfaces(surfaces, surfaceIndexes, bounds, lights, needDlights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surfaces` | `dynamic` | — |  |
| `surfaceIndexes` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `needDlights` | `dynamic` | — |  |
| `viewCount` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |
| `noCurves` | `dynamic` | — |  |
| `facePlaneCull` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L86)

<a id="function-function-mq3-renderer-tr-world-runtime-r-addworldsurface-function-r-addworldsurface-surface-surfaceindex-dlightbits-lights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1564394417"></a>
### R_AddWorldSurface

```ml
function R_AddWorldSurface(surface, surfaceIndex, dlightBits, lights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `viewCount` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |
| `noCurves` | `dynamic` | — |  |
| `facePlaneCull` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L78)

<a id="function-function-mq3-renderer-tr-world-runtime-r-addworldsurfaces-function-r-addworldsurfaces-cache-camera-config-src-mq3-renderer-tr-world-runtime-ml-1546764547"></a>
### R_AddWorldSurfaces

```ml
function R_AddWorldSurfaces(cache, camera, config)
```

Productive world entry: the retained selector performs the same leaf/PVS, frustum, backface and surface de-duplication before BSP triangle expansion.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L148)

<a id="function-function-mq3-renderer-tr-world-runtime-r-clusterpvs-function-r-clusterpvs-world-cluster-src-mq3-renderer-tr-world-runtime-ml-1173839248"></a>
### R_ClusterPVS

```ml
function R_ClusterPVS(world, cluster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L100)

<a id="function-function-mq3-renderer-tr-world-runtime-r-cullgrid-function-r-cullgrid-surface-nocurves-worldentity-frustum-src-mq3-renderer-tr-world-runtime-ml-2108707363"></a>
### R_CullGrid

```ml
function R_CullGrid(surface, noCurves, worldEntity, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `noCurves` | `dynamic` | — |  |
| `worldEntity` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L42)

<a id="function-function-mq3-renderer-tr-world-runtime-r-cullsurface-function-r-cullsurface-surface-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1145776463"></a>
### R_CullSurface

```ml
function R_CullSurface(surface, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |
| `noCurves` | `dynamic` | — |  |
| `facePlaneCull` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L48)

<a id="function-function-mq3-renderer-tr-world-runtime-r-culltrisurf-function-r-culltrisurf-surface-frustum-src-mq3-renderer-tr-world-runtime-ml-533547113"></a>
### R_CullTriSurf

```ml
function R_CullTriSurf(surface, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L41)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlightface-function-r-dlightface-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-954389206"></a>
### R_DlightFace

```ml
function R_DlightFace(surface, dlightBits, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L58)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlightgrid-function-r-dlightgrid-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-1394621282"></a>
### R_DlightGrid

```ml
function R_DlightGrid(surface, dlightBits, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L62)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlightsurface-function-r-dlightsurface-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-2033887026"></a>
### R_DlightSurface

```ml
function R_DlightSurface(surface, dlightBits, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L71)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlighttrisurf-function-r-dlighttrisurf-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-1064100454"></a>
### R_DlightTrisurf

```ml
function R_DlightTrisurf(surface, dlightBits, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L70)

<a id="function-function-mq3-renderer-tr-world-runtime-r-inpvs-function-r-inpvs-world-p1-p2-src-mq3-renderer-tr-world-runtime-ml-1834913803"></a>
### R_inPVS

```ml
function R_inPVS(world, p1, p2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L105)

<a id="function-function-mq3-renderer-tr-world-runtime-r-markleaves-function-r-markleaves-world-pvsorigin-areamask-lockpvs-novis-areamaskmodified-showclustermodified-src-mq3-renderer-tr-world-runtime-ml-137000151"></a>
### R_MarkLeaves

```ml
function R_MarkLeaves(world, pvsOrigin, areaMask, lockPvs, noVis, areaMaskModified, showClusterModified)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `pvsOrigin` | `dynamic` | — |  |
| `areaMask` | `dynamic` | — |  |
| `lockPvs` | `dynamic` | — |  |
| `noVis` | `dynamic` | — |  |
| `areaMaskModified` | `dynamic` | — |  |
| `showClusterModified` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L110)

<a id="function-function-mq3-renderer-tr-world-runtime-r-pointinleaf-function-r-pointinleaf-world-point-src-mq3-renderer-tr-world-runtime-ml-1683161484"></a>
### R_PointInLeaf

```ml
function R_PointInLeaf(world, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L92)

<a id="function-function-mq3-renderer-tr-world-runtime-r-recursiveworldnode-function-r-recursiveworldnode-world-nodeindex-planebits-dlightbits-lights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1434659151"></a>
### R_RecursiveWorldNode

```ml
function R_RecursiveWorldNode(world, nodeIndex, planeBits, dlightBits, lights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `nodeIndex` | `dynamic` | — |  |
| `planeBits` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `viewCount` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |
| `noCurves` | `dynamic` | — |  |
| `facePlaneCull` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L141)

<a id="function-function-mq3-renderer-tr-world-runtime-recursenode-function-recursenode-world-nodeindex-planebits-dlightbits-lights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-result-src-mq3-renderer-tr-world-runtime-ml-868631652"></a>
### recurseNode

```ml
function recurseNode(world, nodeIndex, planeBits, dlightBits, lights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `nodeIndex` | `dynamic` | — |  |
| `planeBits` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `viewCount` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |
| `noCurves` | `dynamic` | — |  |
| `facePlaneCull` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L130)

<a id="function-function-mq3-renderer-tr-world-runtime-spherecull-function-spherecull-origin-radius-frustum-src-mq3-renderer-tr-world-runtime-ml-11174358"></a>
### sphereCull

```ml
function sphereCull(origin, radius, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L37)

- [mq3.renderer.tr_world_runtime.Surface](Type-mq3-renderer-tr-world-runtime-surface-1206481274.md) — struct
- [mq3.renderer.tr_world_runtime.Traversal](Type-mq3-renderer-tr-world-runtime-traversal-403890391.md) — struct
- [mq3.renderer.tr_world_runtime.World](Type-mq3-renderer-tr-world-runtime-world-531993437.md) — struct
