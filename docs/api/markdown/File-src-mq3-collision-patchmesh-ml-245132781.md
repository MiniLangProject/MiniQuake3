# `src/mq3/collision/patchmesh.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.patchmesh`](Package-mq3-collision-patchmesh-2028174155.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/native_planes.ml` as `nativePlanes` → [src/mq3/collision/native_planes.ml](File-src-mq3-collision-native-planes-ml-1748346301.md)
- `mq3/collision/winding.ml` as `w` → [src/mq3/collision/winding.ml](File-src-mq3-collision-winding-ml-1357853358.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-collision-patchmesh-addbevels-function-addbevels-patch-facet-src-mq3-collision-patchmesh-ml-1167482049"></a>
### addBevels

```ml
function addBevels(patch, facet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L307)

<a id="function-function-mq3-collision-patchmesh-addborder-function-addborder-facet-index-inward-noadjust-src-mq3-collision-patchmesh-ml-1216201770"></a>
### addBorder

```ml
function addBorder(facet, index, inward, noAdjust)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `facet` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `inward` | `dynamic` | — |  |
| `noAdjust` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L289)

<a id="function-function-mq3-collision-patchmesh-addfacet-function-addfacet-patch-surface-borders-noadjust-points-src-mq3-collision-patchmesh-ml-1730105521"></a>
### addFacet

```ml
function addFacet(patch, surface, borders, noAdjust, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `borders` | `dynamic` | — |  |
| `noAdjust` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L356)

<a id="function-function-mq3-collision-patchmesh-appendplane-function-appendplane-patch-p-src-mq3-collision-patchmesh-ml-1208545562"></a>
### appendPlane

```ml
function appendPlane(patch, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L154)

<a id="function-function-mq3-collision-patchmesh-closepoints-function-closepoints-a-b-src-mq3-collision-patchmesh-ml-96910257"></a>
### closePoints

```ml
function closePoints(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L59)

<a id="function-function-mq3-collision-patchmesh-cm-addfacetbevels-function-cm-addfacetbevels-patch-facet-src-mq3-collision-patchmesh-ml-183752337"></a>
### CM_AddFacetBevels

```ml
function CM_AddFacetBevels(patch, facet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L355)

<a id="function-function-mq3-collision-patchmesh-cm-comparepoints-function-cm-comparepoints-a-b-src-mq3-collision-patchmesh-ml-2132540879"></a>
### CM_ComparePoints

```ml
function CM_ComparePoints(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L66)

<a id="function-function-mq3-collision-patchmesh-cm-edgeplanenum-function-cm-edgeplanenum-patch-grid-gridplanes-i-j-k-src-mq3-collision-patchmesh-ml-1413263"></a>
### CM_EdgePlaneNum

```ml
function CM_EdgePlaneNum(patch, grid, gridPlanes, i, j, k)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `gridPlanes` | `dynamic` | — |  |
| `i` | `dynamic` | — |  |
| `j` | `dynamic` | — |  |
| `k` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L238)

<a id="function-function-mq3-collision-patchmesh-cm-findplane-function-cm-findplane-patch-a-b-c-src-mq3-collision-patchmesh-ml-263994070"></a>
### CM_FindPlane

```ml
function CM_FindPlane(patch, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L201)

<a id="function-function-mq3-collision-patchmesh-cm-findplane2-function-cm-findplane2-patch-p-src-mq3-collision-patchmesh-ml-1980025122"></a>
### CM_FindPlane2

```ml
function CM_FindPlane2(patch, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L183)

<a id="function-function-mq3-collision-patchmesh-cm-generatepatchcollide-function-cm-generatepatchcollide-width-height-points-src-mq3-collision-patchmesh-ml-2053195830"></a>
### CM_GeneratePatchCollide

```ml
function CM_GeneratePatchCollide(width, height, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L457)

<a id="function-function-mq3-collision-patchmesh-cm-gridplane-function-cm-gridplane-gridplanes-i-j-tri-src-mq3-collision-patchmesh-ml-1059460431"></a>
### CM_GridPlane

```ml
function CM_GridPlane(gridPlanes, i, j, tri)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gridPlanes` | `dynamic` | — |  |
| `i` | `dynamic` | — |  |
| `j` | `dynamic` | — |  |
| `tri` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L207)

<a id="function-function-mq3-collision-patchmesh-cm-needssubdivision-function-cm-needssubdivision-a-b-c-src-mq3-collision-patchmesh-ml-1064577692"></a>
### CM_NeedsSubdivision

```ml
function CM_NeedsSubdivision(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L76)

<a id="function-function-mq3-collision-patchmesh-cm-patchcollidefromgrid-function-cm-patchcollidefromgrid-grid-patch-src-mq3-collision-patchmesh-ml-340964306"></a>
### CM_PatchCollideFromGrid

```ml
function CM_PatchCollideFromGrid(grid, patch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L425)

<a id="function-function-mq3-collision-patchmesh-cm-planeequal-function-cm-planeequal-a-b-src-mq3-collision-patchmesh-ml-1602510597"></a>
### CM_PlaneEqual

```ml
function CM_PlaneEqual(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L172)

<a id="function-function-mq3-collision-patchmesh-cm-planefrompoints-function-cm-planefrompoints-a-b-c-src-mq3-collision-patchmesh-ml-2092711550"></a>
### CM_PlaneFromPoints

```ml
function CM_PlaneFromPoints(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L49)

<a id="function-function-mq3-collision-patchmesh-cm-pointonplaneside-function-cm-pointonplaneside-patch-point-index-src-mq3-collision-patchmesh-ml-1497581176"></a>
### CM_PointOnPlaneSide

```ml
function CM_PointOnPlaneSide(patch, point, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L426)

<a id="function-function-mq3-collision-patchmesh-cm-removedegeneratecolumns-function-cm-removedegeneratecolumns-grid-src-mq3-collision-patchmesh-ml-1902481284"></a>
### CM_RemoveDegenerateColumns

```ml
function CM_RemoveDegenerateColumns(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L117)

<a id="function-function-mq3-collision-patchmesh-cm-setborderinward-function-cm-setborderinward-patch-facet-points-src-mq3-collision-patchmesh-ml-403021494"></a>
### CM_SetBorderInward

```ml
function CM_SetBorderInward(patch, facet, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L255)

<a id="function-function-mq3-collision-patchmesh-cm-setgridwrapwidth-function-cm-setgridwrapwidth-grid-src-mq3-collision-patchmesh-ml-1062104326"></a>
### CM_SetGridWrapWidth

```ml
function CM_SetGridWrapWidth(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L82)

<a id="function-function-mq3-collision-patchmesh-cm-signbitsfornormal-function-cm-signbitsfornormal-normal-src-mq3-collision-patchmesh-ml-28179775"></a>
### CM_SignbitsForNormal

```ml
function CM_SignbitsForNormal(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L45)

<a id="function-function-mq3-collision-patchmesh-cm-snapvector-function-cm-snapvector-normal-src-mq3-collision-patchmesh-ml-437079303"></a>
### CM_SnapVector

```ml
function CM_SnapVector(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L306)

<a id="function-function-mq3-collision-patchmesh-cm-subdivide-function-cm-subdivide-a-b-c-src-mq3-collision-patchmesh-ml-1965160822"></a>
### CM_Subdivide

```ml
function CM_Subdivide(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L77)

<a id="function-function-mq3-collision-patchmesh-cm-subdividegridcolumns-function-cm-subdividegridcolumns-grid-src-mq3-collision-patchmesh-ml-222614954"></a>
### CM_SubdivideGridColumns

```ml
function CM_SubdivideGridColumns(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L93)

<a id="function-function-mq3-collision-patchmesh-cm-transposegrid-function-cm-transposegrid-grid-src-mq3-collision-patchmesh-ml-1297350456"></a>
### CM_TransposeGrid

```ml
function CM_TransposeGrid(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L138)

<a id="function-function-mq3-collision-patchmesh-cm-validatefacet-function-cm-validatefacet-patch-facet-src-mq3-collision-patchmesh-ml-2093820405"></a>
### CM_ValidateFacet

```ml
function CM_ValidateFacet(patch, facet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L272)

<a id="function-function-mq3-collision-patchmesh-edgeplane-function-edgeplane-patch-grid-gridplanes-i-j-k-src-mq3-collision-patchmesh-ml-1298515909"></a>
### edgePlane

```ml
function edgePlane(patch, grid, gridPlanes, i, j, k)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `gridPlanes` | `dynamic` | — |  |
| `i` | `dynamic` | — |  |
| `j` | `dynamic` | — |  |
| `k` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L208)

<a id="function-function-mq3-collision-patchmesh-equalplane-function-equalplane-a-b-src-mq3-collision-patchmesh-ml-539817731"></a>
### equalPlane

```ml
function equalPlane(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L160)

- [mq3.collision.patchmesh.Facet](Type-mq3-collision-patchmesh-facet-1168872134.md) — struct
<a id="function-function-mq3-collision-patchmesh-facetwinding-function-facetwinding-patch-facet-skipsurface-src-mq3-collision-patchmesh-ml-1757811023"></a>
### facetWinding

```ml
function facetWinding(patch, facet, skipSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |
| `skipSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L256)

<a id="function-function-mq3-collision-patchmesh-fail-function-fail-message-src-mq3-collision-patchmesh-ml-1666102397"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L35)

<a id="function-function-mq3-collision-patchmesh-findplane-function-findplane-patch-a-b-c-src-mq3-collision-patchmesh-ml-1057434676"></a>
### findPlane

```ml
function findPlane(patch, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L184)

<a id="function-function-mq3-collision-patchmesh-findplane2-function-findplane2-patch-p-src-mq3-collision-patchmesh-ml-1934394006"></a>
### findPlane2

```ml
function findPlane2(patch, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L173)

<a id="function-function-mq3-collision-patchmesh-fromgrid-function-fromgrid-grid-patch-src-mq3-collision-patchmesh-ml-141539712"></a>
### fromGrid

```ml
function fromGrid(grid, patch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L366)

<a id="function-function-mq3-collision-patchmesh-generate-function-generate-width-height-points-src-mq3-collision-patchmesh-ml-1046301598"></a>
### generate

```ml
function generate(width, height, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L431)

- [mq3.collision.patchmesh.Grid](Type-mq3-collision-patchmesh-grid-1751794547.md) — struct
<a id="function-function-mq3-collision-patchmesh-gridplane-function-gridplane-gridplanes-i-j-tri-src-mq3-collision-patchmesh-ml-1999124427"></a>
### gridPlane

```ml
function gridPlane(gridPlanes, i, j, tri)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gridPlanes` | `dynamic` | — |  |
| `i` | `dynamic` | — |  |
| `j` | `dynamic` | — |  |
| `tri` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L202)

<a id="function-function-mq3-collision-patchmesh-hasplane-function-hasplane-patch-facet-p-src-mq3-collision-patchmesh-ml-292763333"></a>
### hasPlane

```ml
function hasPlane(patch, facet, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L282)

<a id="function-function-mq3-collision-patchmesh-inverted-function-inverted-p-subtractzero-src-mq3-collision-patchmesh-ml-1890574416"></a>
### inverted

```ml
function inverted(p, subtractZero)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `subtractZero` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L54)

<a id="function-function-mq3-collision-patchmesh-needssubdivision-function-needssubdivision-a-b-c-src-mq3-collision-patchmesh-ml-1218565454"></a>
### needsSubdivision

```ml
function needsSubdivision(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L67)

- [mq3.collision.patchmesh.Patch](Type-mq3-collision-patchmesh-patch-2007201987.md) — struct
<a id="function-function-mq3-collision-patchmesh-plane-function-plane-normal-distance-src-mq3-collision-patchmesh-ml-1445554744"></a>
### plane

```ml
function plane(normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L46)

- [mq3.collision.patchmesh.Plane](Type-mq3-collision-patchmesh-plane-622815719.md) — struct
<a id="function-function-mq3-collision-patchmesh-setinward-function-setinward-patch-facet-points-src-mq3-collision-patchmesh-ml-720239596"></a>
### setInward

```ml
function setInward(patch, facet, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L239)

<a id="function-function-mq3-collision-patchmesh-signbits-function-signbits-normal-src-mq3-collision-patchmesh-ml-175826603"></a>
### signbits

```ml
function signbits(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L38)

<a id="function-function-mq3-collision-patchmesh-snap-function-snap-normal-src-mq3-collision-patchmesh-ml-771202603"></a>
### snap

```ml
function snap(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L296)

<a id="function-function-mq3-collision-patchmesh-subdividecolumns-function-subdividecolumns-grid-src-mq3-collision-patchmesh-ml-692477384"></a>
### subdivideColumns

```ml
function subdivideColumns(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L135)

<a id="function-function-mq3-collision-patchmesh-transpose-function-transpose-grid-src-mq3-collision-patchmesh-ml-335376498"></a>
### transpose

```ml
function transpose(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L153)

<a id="function-function-mq3-collision-patchmesh-validfacet-function-validfacet-patch-facet-src-mq3-collision-patchmesh-ml-742635009"></a>
### validFacet

```ml
function validFacet(patch, facet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `facet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/patchmesh.ml#L273)
