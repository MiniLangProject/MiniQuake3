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

Computes `boxCull(bounds,frustum)==CULL_OUT` for `mq3.renderer.tr_world_runtime.boundsOutside`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_world_runtime.boxCull`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.boxCull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L153)

<a id="function-function-mq3-renderer-tr-world-runtime-boxcull-function-boxcull-bounds-frustum-src-mq3-renderer-tr-world-runtime-ml-39396059"></a>
### boxCull

```ml
function boxCull(bounds, frustum)
```

Classifies a box against all frustum planes, stopping when any plane rejects it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_world_runtime.boxOnPlaneSide`. |
| `frustum` | `dynamic` | — | Sequence traversed as `plane` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L53)

<a id="function-function-mq3-renderer-tr-world-runtime-boxonplaneside-function-boxonplaneside-bounds-plane-src-mq3-renderer-tr-world-runtime-ml-1487526049"></a>
### boxOnPlaneSide

```ml
function boxOnPlaneSide(bounds, plane)
```

Classifies an axis-aligned box as inside, outside, or crossing one plane using extreme support corners.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`. |
| `plane` | `dynamic` | — | Record providing `plane.normal`, `plane.dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L44)

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

Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.tr_world_runtime.dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L39)

- [mq3.renderer.tr_world_runtime.DrawSurface](Type-mq3-renderer-tr-world-runtime-drawsurface-299049956.md) — struct
<a id="function-function-mq3-renderer-tr-world-runtime-expandbounds-function-expandbounds-bounds-mins-maxs-src-mq3-renderer-tr-world-runtime-ml-1348843865"></a>
### expandBounds

```ml
function expandBounds(bounds, mins, maxs)
```

Updates `bounds[0][axis]`, `bounds[1][axis]` in `mq3.renderer.tr_world_runtime.expandBounds`; returns `bounds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Mutable record or buffer; this call updates `bounds[0][axis]`, `bounds[1][axis]`. |
| `mins` | `dynamic` | — | Indexed input read at `axis`. |
| `maxs` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L231)

<a id="function-function-mq3-renderer-tr-world-runtime-fail-function-fail-message-src-mq3-renderer-tr-world-runtime-ml-892235471"></a>
### fail

```ml
function fail(message)
```

Creates error `7793` with message `"tr_world: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7793,"tr_world: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L35)

- [mq3.renderer.tr_world_runtime.MarkResult](Type-mq3-renderer-tr-world-runtime-markresult-1501242355.md) — struct
- [mq3.renderer.tr_world_runtime.Node](Type-mq3-renderer-tr-world-runtime-node-1276201439.md) — struct
- [mq3.renderer.tr_world_runtime.Plane](Type-mq3-renderer-tr-world-runtime-plane-178518151.md) — struct
<a id="function-function-mq3-renderer-tr-world-runtime-r-addbrushmodelsurfaces-function-r-addbrushmodelsurfaces-surfaces-surfaceindexes-bounds-lights-needdlights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1282834186"></a>
### R_AddBrushModelSurfaces

```ml
function R_AddBrushModelSurfaces(surfaces, surfaceIndexes, bounds, lights, needDlights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

Rejects an off-frustum brush model and collects each remaining drawable world-surface result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surfaces` | `dynamic` | — | Indexed input read at `index`. |
| `surfaceIndexes` | `dynamic` | — | Indexed input read at `index`. |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_world_runtime.boundsOutside`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `needDlights` | `dynamic` | — | Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `viewCount` | `dynamic` | — | Value forwarded as `viewCount` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `noCull` | `dynamic` | — | Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `noCurves` | `dynamic` | — | Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `facePlaneCull` | `dynamic` | — | Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.boundsOutside`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L166)

<a id="function-function-mq3-renderer-tr-world-runtime-r-addworldsurface-function-r-addworldsurface-surface-surfaceindex-dlightbits-lights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1564394417"></a>
### R_AddWorldSurface

```ml
function R_AddWorldSurface(surface, surfaceIndex, dlightBits, lights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

Builds `mq3.renderer.tr_world_runtime.DrawSurface` after updating `surface.viewCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Mutable record or buffer; this call updates `surface.viewCount`. |
| `surfaceIndex` | `dynamic` | — | Initial value for `mq3.renderer.tr_world_runtime.DrawSurface.surfaceIndex`. |
| `dlightBits` | `dynamic` | — | Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_DlightSurface`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_DlightSurface`. |
| `viewCount` | `dynamic` | — | Value assigned to `surface.viewCount`. |
| `noCull` | `dynamic` | — | Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.R_CullSurface`. |
| `noCurves` | `dynamic` | — | Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_CullSurface`. |
| `facePlaneCull` | `dynamic` | — | Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.R_CullSurface`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.R_CullSurface`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.R_CullSurface`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L143)

<a id="function-function-mq3-renderer-tr-world-runtime-r-addworldsurfaces-function-r-addworldsurfaces-cache-camera-config-src-mq3-renderer-tr-world-runtime-ml-1546764547"></a>
### R_AddWorldSurfaces

```ml
function R_AddWorldSurfaces(cache, camera, config)
```

Productive world entry: the retained selector performs the same leaf/PVS, frustum, backface and surface de-duplication before BSP triangle expansion.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.world_surface_selection.prepareCached`. |
| `camera` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.world_surface_selection.prepareCached`. |
| `config` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.world_surface_selection.prepareCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L278)

<a id="function-function-mq3-renderer-tr-world-runtime-r-clusterpvs-function-r-clusterpvs-world-cluster-src-mq3-renderer-tr-world-runtime-ml-1173839248"></a>
### R_ClusterPVS

```ml
function R_ClusterPVS(world, cluster)
```

Returns `slice(world.vis,cluster*world.clusterBytes,world.clusterBytes)` from `mq3.renderer.tr_world_runtime.R_ClusterPVS`; earlier branches return `bytes(0)`, `world.novis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.vis`, `world.numClusters`, `world.novis`, `world.clusterBytes`. |
| `cluster` | `dynamic` | — | Input tested by `world.vis==void or cluster<0 or cluster>=world.numClusters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L186)

<a id="function-function-mq3-renderer-tr-world-runtime-r-cullgrid-function-r-cullgrid-surface-nocurves-worldentity-frustum-src-mq3-renderer-tr-world-runtime-ml-2108707363"></a>
### R_CullGrid

```ml
function R_CullGrid(surface, noCurves, worldEntity, frustum)
```

Rejects disabled curves or patch grids whose sphere and, when needed, box lie outside the frustum.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.localOrigin`, `surface.meshRadius`, `surface.bounds`. |
| `noCurves` | `dynamic` | — | Input tested by `noCurves`. |
| `worldEntity` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.sphereCull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L73)

<a id="function-function-mq3-renderer-tr-world-runtime-r-cullsurface-function-r-cullsurface-surface-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1145776463"></a>
### R_CullSurface

```ml
function R_CullSurface(surface, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

Computes `R_CullSurface` from `distance>surface.plane.dist+8.0` using `mq3.renderer.tr_world_runtime.R_CullGrid`, `mq3.renderer.tr_world_runtime.R_CullTriSurf`, `mq3.renderer.tr_world_runtime.dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.kind`, `surface.cullType`, `surface.plane`. |
| `noCull` | `dynamic` | — | Input tested by `noCull`. |
| `noCurves` | `dynamic` | — | Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_CullGrid`. |
| `facePlaneCull` | `dynamic` | — | Input tested by `surface.kind!="face" or surface.cullType==CT_TWO_SIDED or not facePlaneCull`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.tr_world_runtime.dot`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.R_CullGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L86)

<a id="function-function-mq3-renderer-tr-world-runtime-r-culltrisurf-function-r-culltrisurf-surface-frustum-src-mq3-renderer-tr-world-runtime-ml-533547113"></a>
### R_CullTriSurf

```ml
function R_CullTriSurf(surface, frustum)
```

Computes `boxCull(surface.bounds,frustum)==CULL_OUT` for `mq3.renderer.tr_world_runtime.R_CullTriSurf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.bounds`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.boxCull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L67)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlightface-function-r-dlightface-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-954389206"></a>
### R_DlightFace

```ml
function R_DlightFace(surface, dlightBits, lights)
```

Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightFace`; returns `dlightBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Mutable record or buffer; this call updates `surface.dlightBits`. |
| `dlightBits` | `dynamic` | — | Value assigned to `surface.dlightBits`. |
| `lights` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L100)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlightgrid-function-r-dlightgrid-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-1394621282"></a>
### R_DlightGrid

```ml
function R_DlightGrid(surface, dlightBits, lights)
```

Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightGrid`; returns `dlightBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Mutable record or buffer; this call updates `surface.dlightBits`. |
| `dlightBits` | `dynamic` | — | Value assigned to `surface.dlightBits`. |
| `lights` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L108)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlightsurface-function-r-dlightsurface-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-2033887026"></a>
### R_DlightSurface

```ml
function R_DlightSurface(surface, dlightBits, lights)
```

Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightSurface`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Mutable record or buffer; this call updates `surface.dlightBits`. |
| `dlightBits` | `dynamic` | — | Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_DlightFace`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_DlightFace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L125)

<a id="function-function-mq3-renderer-tr-world-runtime-r-dlighttrisurf-function-r-dlighttrisurf-surface-dlightbits-lights-src-mq3-renderer-tr-world-runtime-ml-1064100454"></a>
### R_DlightTrisurf

```ml
function R_DlightTrisurf(surface, dlightBits, lights)
```

Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightTrisurf`; returns `dlightBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Mutable record or buffer; this call updates `surface.dlightBits`. |
| `dlightBits` | `dynamic` | — | Value assigned to `surface.dlightBits`. |
| `lights` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L120)

<a id="function-function-mq3-renderer-tr-world-runtime-r-inpvs-function-r-inpvs-world-p1-p2-src-mq3-renderer-tr-world-runtime-ml-1834913803"></a>
### R_inPVS

```ml
function R_inPVS(world, p1, p2)
```

Computes `R_inPVS` from `(mask[cluster>>3]&(1<<(cluster&7)))!=0` using `mq3.renderer.tr_world_runtime.R_PointInLeaf`, `mq3.renderer.tr_world_runtime.R_ClusterPVS`, `or`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.nodes`. |
| `p1` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.tr_world_runtime.R_PointInLeaf`. |
| `p2` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.tr_world_runtime.R_PointInLeaf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L195)

<a id="function-function-mq3-renderer-tr-world-runtime-r-markleaves-function-r-markleaves-world-pvsorigin-areamask-lockpvs-novis-areamaskmodified-showclustermodified-src-mq3-renderer-tr-world-runtime-ml-137000151"></a>
### R_MarkLeaves

```ml
function R_MarkLeaves(world, pvsOrigin, areaMask, lockPvs, noVis, areaMaskModified, showClusterModified)
```

Builds `mq3.renderer.tr_world_runtime.MarkResult` after updating `world.visCount`, `world.viewCluster`, `node.visframe`, `world.nodes[parent].visframe`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Mutable record or buffer; this call updates `world.visCount`, `world.viewCluster`, `world.nodes[parent].visframe`. |
| `pvsOrigin` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.tr_world_runtime.R_PointInLeaf`. |
| `areaMask` | `dynamic` | — | Indexed input read at `node.area>>3`. |
| `lockPvs` | `dynamic` | — | Input tested by `lockPvs`. |
| `noVis` | `dynamic` | — | Input tested by `noVis or cluster==-1`. |
| `areaMaskModified` | `dynamic` | — | Input tested by `world.viewCluster==cluster and not areaMaskModified and not showClusterModified`. |
| `showClusterModified` | `dynamic` | — | Input tested by `world.viewCluster==cluster and not areaMaskModified and not showClusterModified`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L208)

<a id="function-function-mq3-renderer-tr-world-runtime-r-pointinleaf-function-r-pointinleaf-world-point-src-mq3-renderer-tr-world-runtime-ml-1683161484"></a>
### R_PointInLeaf

```ml
function R_PointInLeaf(world, point)
```

Walks BSP child planes to locate a point's leaf, with index/cycle guards for malformed trees.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.nodes`, `world.planes`. |
| `point` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.tr_world_runtime.dot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L175)

<a id="function-function-mq3-renderer-tr-world-runtime-r-recursiveworldnode-function-r-recursiveworldnode-world-nodeindex-planebits-dlightbits-lights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-src-mq3-renderer-tr-world-runtime-ml-1434659151"></a>
### R_RecursiveWorldNode

```ml
function R_RecursiveWorldNode(world, nodeIndex, planeBits, dlightBits, lights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum)
```

Starts BSP visibility traversal with empty draw results and expanding bounds, then recurses from the supplied node.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `nodeIndex` | `dynamic` | — | Value forwarded as `nodeIndex` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `planeBits` | `dynamic` | — | Value forwarded as `planeBits` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `dlightBits` | `dynamic` | — | Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `viewCount` | `dynamic` | — | Value forwarded as `viewCount` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `noCull` | `dynamic` | — | Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `noCurves` | `dynamic` | — | Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `facePlaneCull` | `dynamic` | — | Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.recurseNode`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.recurseNode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L268)

<a id="function-function-mq3-renderer-tr-world-runtime-recursenode-function-recursenode-world-nodeindex-planebits-dlightbits-lights-viewcount-nocull-nocurves-faceplanecull-vieworigin-frustum-result-src-mq3-renderer-tr-world-runtime-ml-868631652"></a>
### recurseNode

```ml
function recurseNode(world, nodeIndex, planeBits, dlightBits, lights, viewCount, noCull, noCurves, facePlaneCull, viewOrigin, frustum, result)
```

Updates `result.leafs`, `result.draws` in `mq3.renderer.tr_world_runtime.recurseNode`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.nodes`, `world.visCount`, `world.surfaces`, `world.planes`. |
| `nodeIndex` | `dynamic` | — | Input used by `node=world.nodes[nodeIndex]`. |
| `planeBits` | `dynamic` | — | Input used by `bits=planeBits`. |
| `dlightBits` | `dynamic` | — | Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `viewCount` | `dynamic` | — | Value forwarded as `viewCount` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `noCull` | `dynamic` | — | Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `noCurves` | `dynamic` | — | Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `facePlaneCull` | `dynamic` | — | Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`. |
| `result` | `dynamic` | — | Mutable record or buffer; this call updates `result.leafs`, `result.draws`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L245)

<a id="function-function-mq3-renderer-tr-world-runtime-spherecull-function-spherecull-origin-radius-frustum-src-mq3-renderer-tr-world-runtime-ml-11174358"></a>
### sphereCull

```ml
function sphereCull(origin, radius, frustum)
```

Classifies a bounding sphere against all frustum planes using signed distance and radius.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.tr_world_runtime.dot`. |
| `radius` | `dynamic` | — | Input tested by `distance<0.0-radius`. |
| `frustum` | `dynamic` | — | Sequence traversed as `plane` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L60)

- [mq3.renderer.tr_world_runtime.Surface](Type-mq3-renderer-tr-world-runtime-surface-1206481274.md) — struct
- [mq3.renderer.tr_world_runtime.Traversal](Type-mq3-renderer-tr-world-runtime-traversal-403890391.md) — struct
- [mq3.renderer.tr_world_runtime.World](Type-mq3-renderer-tr-world-runtime-world-531993437.md) — struct
