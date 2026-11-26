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

Add bevels in collision.patchmesh.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planes`. |
| `facet` | `dynamic` | — | Record exposing `surface`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L466)

<a id="function-function-mq3-collision-patchmesh-addborder-function-addborder-facet-index-inward-noadjust-src-mq3-collision-patchmesh-ml-1216201770"></a>
### addBorder

```ml
function addBorder(facet, index, inward, noAdjust)
```

Add border in collision.patchmesh; updates `facet.borders`, `facet.inward`, `facet.noAdjust`.

Direct state writes: `facet.borders`, `facet.inward`, `facet.noAdjust`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `facet` | `dynamic` | — | Record exposing `borders`, `inward`, `noAdjust`. Updated in place: `borders`, `inward`, `noAdjust`. |
| `index` | `dynamic` | — | Index used in `(facet.borders + [index])`. |
| `inward` | `dynamic` | — | Inward used in `(facet.inward + [inward])`. |
| `noAdjust` | `dynamic` | — | No adjust used in `(facet.noAdjust + [noAdjust])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L441)

<a id="function-function-mq3-collision-patchmesh-addfacet-function-addfacet-patch-surface-borders-noadjust-points-src-mq3-collision-patchmesh-ml-1730105521"></a>
### addFacet

```ml
function addFacet(patch, surface, borders, noAdjust, points)
```

Add facet in collision.patchmesh; updates `patch.facets`.

Direct state writes: `patch.facets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `facets`. Updated in place: `facets`. |
| `surface` | `dynamic` | — | Initial `surface` field stored in the returned or constructed `mq3.collision.patchmesh.Facet` record. |
| `borders` | `dynamic` | — | Initial `borders` field stored in the returned or constructed `mq3.collision.patchmesh.Facet` record. |
| `noAdjust` | `dynamic` | — | Initial `noAdjust` field stored in the returned or constructed `mq3.collision.patchmesh.Facet` record. |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.patchmesh.CM_SetBorderInward`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L526)

<a id="function-function-mq3-collision-patchmesh-appendplane-function-appendplane-patch-p-src-mq3-collision-patchmesh-ml-1208545562"></a>
### appendPlane

```ml
function appendPlane(patch, p)
```

Append plane in collision.patchmesh; the normal completion returns `(len(patch.planes) - 1)`.

Direct state writes: `patch.planes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planes`, `planeCache`. Updated in place: `planes`. |
| `p` | `dynamic` | — | Plane record with a three-component normal and distance. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L231)

<a id="function-function-mq3-collision-patchmesh-closepoints-function-closepoints-a-b-src-mq3-collision-patchmesh-ml-96910257"></a>
### closePoints

```ml
function closePoints(a, b)
```

Close points in collision.patchmesh; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[axis]` and `n.fsub(a[axis], b[axis])`. |
| `b` | `dynamic` | — | B used in `b[axis]` and `n.fsub(a[axis], b[axis])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L96)

<a id="function-function-mq3-collision-patchmesh-cm-addfacetbevels-function-cm-addfacetbevels-patch-facet-src-mq3-collision-patchmesh-ml-183752337"></a>
### CM_AddFacetBevels

```ml
function CM_AddFacetBevels(patch, facet)
```

Return `mq3.collision.patchmesh.addBevels(patch, facet)` from `collision.patchmesh.CM_AddFacetBevels`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.addBevels`. |
| `facet` | `dynamic` | — | Facet passed as `facet` to `mq3.collision.patchmesh.addBevels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L517)

<a id="function-function-mq3-collision-patchmesh-cm-comparepoints-function-cm-comparepoints-a-b-src-mq3-collision-patchmesh-ml-2132540879"></a>
### CM_ComparePoints

```ml
function CM_ComparePoints(a, b)
```

Return `mq3.collision.patchmesh.closePoints(a, b)` from `collision.patchmesh.CM_ComparePoints`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.collision.patchmesh.closePoints`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.collision.patchmesh.closePoints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L106)

<a id="function-function-mq3-collision-patchmesh-cm-edgeplanenum-function-cm-edgeplanenum-patch-grid-gridplanes-i-j-k-src-mq3-collision-patchmesh-ml-1413263"></a>
### CM_EdgePlaneNum

```ml
function CM_EdgePlaneNum(patch, grid, gridPlanes, i, j, k)
```

Return `mq3.collision.patchmesh.edgePlane(patch, grid, gridPlanes, i, j, k)` from `collision.patchmesh.CM_EdgePlaneNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.edgePlane`. |
| `grid` | `dynamic` | — | Grid passed as `grid` to `mq3.collision.patchmesh.edgePlane`. |
| `gridPlanes` | `dynamic` | — | Grid planes passed as `gridPlanes` to `mq3.collision.patchmesh.edgePlane`. |
| `i` | `dynamic` | — | I passed as `i` to `mq3.collision.patchmesh.edgePlane`. |
| `j` | `dynamic` | — | J passed as `j` to `mq3.collision.patchmesh.edgePlane`. |
| `k` | `dynamic` | — | K passed as `k` to `mq3.collision.patchmesh.edgePlane`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L361)

<a id="function-function-mq3-collision-patchmesh-cm-findplane-function-cm-findplane-patch-a-b-c-src-mq3-collision-patchmesh-ml-263994070"></a>
### CM_FindPlane

```ml
function CM_FindPlane(patch, a, b, c)
```

Return `mq3.collision.patchmesh.findPlane(patch, a, b, c)` from `collision.patchmesh.CM_FindPlane`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.findPlane`. |
| `a` | `dynamic` | — | A passed as `a` to `mq3.collision.patchmesh.findPlane`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.collision.patchmesh.findPlane`. |
| `c` | `dynamic` | — | C passed as `c` to `mq3.collision.patchmesh.findPlane`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L300)

<a id="function-function-mq3-collision-patchmesh-cm-findplane2-function-cm-findplane2-patch-p-src-mq3-collision-patchmesh-ml-1980025122"></a>
### CM_FindPlane2

```ml
function CM_FindPlane2(patch, p)
```

Return `mq3.collision.patchmesh.findPlane2(patch, p)` from `collision.patchmesh.CM_FindPlane2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.findPlane2`. |
| `p` | `dynamic` | — | P passed as `p` to `mq3.collision.patchmesh.findPlane2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L272)

<a id="function-function-mq3-collision-patchmesh-cm-generatepatchcollide-function-cm-generatepatchcollide-width-height-points-src-mq3-collision-patchmesh-ml-2053195830"></a>
### CM_GeneratePatchCollide

```ml
function CM_GeneratePatchCollide(width, height, points)
```

Return `mq3.collision.patchmesh.generate(width, height, points)` from `collision.patchmesh.CM_GeneratePatchCollide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width passed as `width` to `mq3.collision.patchmesh.generate`. |
| `height` | `dynamic` | — | Height passed as `height` to `mq3.collision.patchmesh.generate`. |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.patchmesh.generate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L645)

<a id="function-function-mq3-collision-patchmesh-cm-gridplane-function-cm-gridplane-gridplanes-i-j-tri-src-mq3-collision-patchmesh-ml-1059460431"></a>
### CM_GridPlane

```ml
function CM_GridPlane(gridPlanes, i, j, tri)
```

Return `mq3.collision.patchmesh.gridPlane(gridPlanes, i, j, tri)` from `collision.patchmesh.CM_GridPlane`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gridPlanes` | `dynamic` | — | Grid planes passed as `gridPlanes` to `mq3.collision.patchmesh.gridPlane`. |
| `i` | `dynamic` | — | I passed as `i` to `mq3.collision.patchmesh.gridPlane`. |
| `j` | `dynamic` | — | J passed as `j` to `mq3.collision.patchmesh.gridPlane`. |
| `tri` | `dynamic` | — | Tri passed as `tri` to `mq3.collision.patchmesh.gridPlane`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L316)

<a id="function-function-mq3-collision-patchmesh-cm-needssubdivision-function-cm-needssubdivision-a-b-c-src-mq3-collision-patchmesh-ml-1064577692"></a>
### CM_NeedsSubdivision

```ml
function CM_NeedsSubdivision(a, b, c)
```

Return `mq3.collision.patchmesh.needsSubdivision(a, b, c)` from `collision.patchmesh.CM_NeedsSubdivision`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.collision.patchmesh.needsSubdivision`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.collision.patchmesh.needsSubdivision`. |
| `c` | `dynamic` | — | C passed as `c` to `mq3.collision.patchmesh.needsSubdivision`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L124)

<a id="function-function-mq3-collision-patchmesh-cm-patchcollidefromgrid-function-cm-patchcollidefromgrid-grid-patch-src-mq3-collision-patchmesh-ml-340964306"></a>
### CM_PatchCollideFromGrid

```ml
function CM_PatchCollideFromGrid(grid, patch)
```

Return `mq3.collision.patchmesh.fromGrid(grid, patch)` from `collision.patchmesh.CM_PatchCollideFromGrid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Grid passed as `grid` to `mq3.collision.patchmesh.fromGrid`. |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.fromGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L601)

<a id="function-function-mq3-collision-patchmesh-cm-planeequal-function-cm-planeequal-a-b-src-mq3-collision-patchmesh-ml-1602510597"></a>
### CM_PlaneEqual

```ml
function CM_PlaneEqual(a, b)
```

Return `mq3.collision.patchmesh.equalPlane(a, b)` from `collision.patchmesh.CM_PlaneEqual`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.collision.patchmesh.equalPlane`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.collision.patchmesh.equalPlane`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L255)

<a id="function-function-mq3-collision-patchmesh-cm-planefrompoints-function-cm-planefrompoints-a-b-c-src-mq3-collision-patchmesh-ml-2092711550"></a>
### CM_PlaneFromPoints

```ml
function CM_PlaneFromPoints(a, b, c)
```

Compute plane from points in collision.patchmesh; the normal completion returns `plane(normal, q.DotProduct(a, normal))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | B passed as `b` to `mq3.collision.winding.subtract`. |
| `b` | `dynamic` | — | A passed as `a` to `mq3.collision.winding.subtract`. |
| `c` | `dynamic` | — | A passed as `a` to `mq3.collision.winding.subtract`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L80)

<a id="function-function-mq3-collision-patchmesh-cm-pointonplaneside-function-cm-pointonplaneside-patch-point-index-src-mq3-collision-patchmesh-ml-1497581176"></a>
### CM_PointOnPlaneSide

```ml
function CM_PointOnPlaneSide(patch, point, index)
```

Compute point on plane side in collision.patchmesh; the normal completion returns `2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planes`. |
| `point` | `dynamic` | — | Left three-element vector. |
| `index` | `dynamic` | — | Zero-based index into `patch.planes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L606)

<a id="function-function-mq3-collision-patchmesh-cm-removedegeneratecolumns-function-cm-removedegeneratecolumns-grid-src-mq3-collision-patchmesh-ml-1902481284"></a>
### CM_RemoveDegenerateColumns

```ml
function CM_RemoveDegenerateColumns(grid)
```

Remove degenerate columns in collision.patchmesh; updates `grid.columns`.

Direct state writes: `grid.columns`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record exposing `columns`. Updated in place: `columns`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L181)

<a id="function-function-mq3-collision-patchmesh-cm-setborderinward-function-cm-setborderinward-patch-facet-points-src-mq3-collision-patchmesh-ml-403021494"></a>
### CM_SetBorderInward

```ml
function CM_SetBorderInward(patch, facet, points)
```

Return `mq3.collision.patchmesh.setInward(patch, facet, points)` from `collision.patchmesh.CM_SetBorderInward`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.setInward`. |
| `facet` | `dynamic` | — | Facet passed as `facet` to `mq3.collision.patchmesh.setInward`. |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.patchmesh.setInward`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L386)

<a id="function-function-mq3-collision-patchmesh-cm-setgridwrapwidth-function-cm-setgridwrapwidth-grid-src-mq3-collision-patchmesh-ml-1062104326"></a>
### CM_SetGridWrapWidth

```ml
function CM_SetGridWrapWidth(grid)
```

Set grid wrap width in collision.patchmesh; updates `grid.wrapWidth`.

Direct state writes: `grid.wrapWidth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record exposing `columns`. Updated in place: `wrapWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L138)

<a id="function-function-mq3-collision-patchmesh-cm-signbitsfornormal-function-cm-signbitsfornormal-normal-src-mq3-collision-patchmesh-ml-28179775"></a>
### CM_SignbitsForNormal

```ml
function CM_SignbitsForNormal(normal)
```

Return `mq3.collision.patchmesh.signbits(normal)` from `collision.patchmesh.CM_SignbitsForNormal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.patchmesh.signbits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L69)

<a id="function-function-mq3-collision-patchmesh-cm-snapvector-function-cm-snapvector-normal-src-mq3-collision-patchmesh-ml-437079303"></a>
### CM_SnapVector

```ml
function CM_SnapVector(normal)
```

Return `mq3.collision.patchmesh.snap(normal)` from `collision.patchmesh.CM_SnapVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.patchmesh.snap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L462)

<a id="function-function-mq3-collision-patchmesh-cm-subdivide-function-cm-subdivide-a-b-c-src-mq3-collision-patchmesh-ml-1965160822"></a>
### CM_Subdivide

```ml
function CM_Subdivide(a, b, c)
```

Compute subdivide in collision.patchmesh; the normal completion returns `[first, middle, last]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[axis]` and `n.fadd(a[axis], b[axis])`. |
| `b` | `dynamic` | — | B used in `b[axis]` and `n.fadd(a[axis], b[axis])`. |
| `c` | `dynamic` | — | C used in `c[axis]` and `n.fadd(b[axis], c[axis])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L129)

<a id="function-function-mq3-collision-patchmesh-cm-subdividegridcolumns-function-cm-subdividegridcolumns-grid-src-mq3-collision-patchmesh-ml-222614954"></a>
### CM_SubdivideGridColumns

```ml
function CM_SubdivideGridColumns(grid)
```

Update `grid.columns` in collision.patchmesh.

Direct state writes: `grid.columns`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record exposing `columns`. Updated in place: `columns`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L153)

<a id="function-function-mq3-collision-patchmesh-cm-transposegrid-function-cm-transposegrid-grid-src-mq3-collision-patchmesh-ml-1297350456"></a>
### CM_TransposeGrid

```ml
function CM_TransposeGrid(grid)
```

Update `grid.columns`, `grid.wrapWidth`, `grid.wrapHeight` in collision.patchmesh.

Direct state writes: `grid.columns`, `grid.wrapWidth`, `grid.wrapHeight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record exposing `columns`, `wrapWidth`, `wrapHeight`. Updated in place: `columns`, `wrapWidth`, `wrapHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L208)

<a id="function-function-mq3-collision-patchmesh-cm-validatefacet-function-cm-validatefacet-patch-facet-src-mq3-collision-patchmesh-ml-2093820405"></a>
### CM_ValidateFacet

```ml
function CM_ValidateFacet(patch, facet)
```

Return `mq3.collision.patchmesh.validFacet(patch, facet)` from `collision.patchmesh.CM_ValidateFacet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.validFacet`. |
| `facet` | `dynamic` | — | Facet passed as `facet` to `mq3.collision.patchmesh.validFacet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L410)

<a id="function-function-mq3-collision-patchmesh-edgeplane-function-edgeplane-patch-grid-gridplanes-i-j-k-src-mq3-collision-patchmesh-ml-1298515909"></a>
### edgePlane

```ml
function edgePlane(patch, grid, gridPlanes, i, j, k)
```

Compute edge plane in collision.patchmesh; the normal completion returns `findPlane(patch, a, b, up)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planes`. |
| `grid` | `dynamic` | — | Record exposing `columns`. |
| `gridPlanes` | `dynamic` | — | Grid planes passed as `gridPlanes` to `mq3.collision.patchmesh.gridPlane`. |
| `i` | `dynamic` | — | I passed as `i` to `mq3.collision.patchmesh.gridPlane`. |
| `j` | `dynamic` | — | J passed as `j` to `mq3.collision.patchmesh.gridPlane`. |
| `k` | `dynamic` | — | K operand used by `edgePlane`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L324)

<a id="function-function-mq3-collision-patchmesh-equalplane-function-equalplane-a-b-src-mq3-collision-patchmesh-ml-539817731"></a>
### equalPlane

```ml
function equalPlane(a, b)
```

Compute equal plane in collision.patchmesh; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `distance`, `normal`. |
| `b` | `dynamic` | — | P passed as `p` to `mq3.collision.patchmesh.inverted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L240)

- [mq3.collision.patchmesh.Facet](Type-mq3-collision-patchmesh-facet-1168872134.md) — struct
<a id="function-function-mq3-collision-patchmesh-facetwinding-function-facetwinding-patch-facet-skipsurface-src-mq3-collision-patchmesh-ml-1757811023"></a>
### facetWinding

```ml
function facetWinding(patch, facet, skipSurface)
```

Compute facet winding in collision.patchmesh; the normal completion returns `points`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planes`. |
| `facet` | `dynamic` | — | Record exposing `surface`, `borders`, `inward`. |
| `skipSurface` | `dynamic` | — | Skip surface used in `(skipSurface and (index == facet.surface))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L391)

<a id="function-function-mq3-collision-patchmesh-fail-function-fail-message-src-mq3-collision-patchmesh-ml-1666102397"></a>
### fail

```ml
function fail(message)
```

Create the collision.patchmesh error for `fail` with 3505 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("Patch: " + message)` and `error(3505, ("Patch: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L55)

<a id="function-function-mq3-collision-patchmesh-findplane-function-findplane-patch-a-b-c-src-mq3-collision-patchmesh-ml-1057434676"></a>
### findPlane

```ml
function findPlane(patch, a, b, c)
```

Find plane in collision.patchmesh; the normal completion returns `appendPlane(patch, candidate)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planeCache`, `planes`. |
| `a` | `dynamic` | — | A passed as `a` to `mq3.collision.patchmesh.CM_PlaneFromPoints`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.collision.patchmesh.CM_PlaneFromPoints`. |
| `c` | `dynamic` | — | C passed as `c` to `mq3.collision.patchmesh.CM_PlaneFromPoints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L278)

<a id="function-function-mq3-collision-patchmesh-findplane2-function-findplane2-patch-p-src-mq3-collision-patchmesh-ml-1934394006"></a>
### findPlane2

```ml
function findPlane2(patch, p)
```

Find plane 2 in collision.patchmesh; the normal completion returns `[appendPlane(patch, p), 0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planeCache`, `planes`. |
| `p` | `dynamic` | — | Plane record supplying the normal and distance to match; negative results denote no match or invalid bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L259)

<a id="function-function-mq3-collision-patchmesh-fromgrid-function-fromgrid-grid-patch-src-mq3-collision-patchmesh-ml-141539712"></a>
### fromGrid

```ml
function fromGrid(grid, patch)
```

Compute from grid in collision.patchmesh.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record exposing `columns`, `wrapHeight`, `wrapWidth`. |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.CM_FindPlane`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L539)

<a id="function-function-mq3-collision-patchmesh-generate-function-generate-width-height-points-src-mq3-collision-patchmesh-ml-1046301598"></a>
### generate

```ml
function generate(width, height, points)
```

Compute generate in collision.patchmesh; the normal completion returns `patch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width used in `(width & 1)` and `(i < width)`. |
| `height` | `dynamic` | — | Height used in `(height & 1)` and `(j < height)`. |
| `points` | `dynamic` | — | Points used in `len(points)` and `points[((j * width) + i)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L615)

- [mq3.collision.patchmesh.Grid](Type-mq3-collision-patchmesh-grid-1751794547.md) — struct
<a id="function-function-mq3-collision-patchmesh-gridplane-function-gridplane-gridplanes-i-j-tri-src-mq3-collision-patchmesh-ml-1999124427"></a>
### gridPlane

```ml
function gridPlane(gridPlanes, i, j, tri)
```

Compute grid plane in collision.patchmesh; the normal completion returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gridPlanes` | `dynamic` | — | Grid planes used in `gridPlanes[i]` and `gridPlanes[i][j]`. |
| `i` | `dynamic` | — | Zero-based index into `gridPlanes`. |
| `j` | `dynamic` | — | Zero-based index into `gridPlanes[i]`. |
| `tri` | `dynamic` | — | Zero-based index into `gridPlanes[i][j]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L306)

<a id="function-function-mq3-collision-patchmesh-hasplane-function-hasplane-patch-facet-p-src-mq3-collision-patchmesh-ml-292763333"></a>
### hasPlane

```ml
function hasPlane(patch, facet, p)
```

Test plane in collision.patchmesh; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record exposing `planes`. |
| `facet` | `dynamic` | — | Record exposing `surface`, `borders`. |
| `p` | `dynamic` | — | B passed as `b` to `mq3.collision.patchmesh.CM_PlaneEqual`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L427)

<a id="function-function-mq3-collision-patchmesh-inverted-function-inverted-p-subtractzero-src-mq3-collision-patchmesh-ml-1890574416"></a>
### inverted

```ml
function inverted(p, subtractZero)
```

Compute inverted in collision.patchmesh; the normal completion returns `plane(normal, n.bitsFloat((n.floatBits(p.distance) ^ 2147483648)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record exposing `normal`, `distance`. |
| `subtractZero` | `dynamic` | — | Subtract zero operand used by `inverted`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L88)

<a id="function-function-mq3-collision-patchmesh-needssubdivision-function-needssubdivision-a-b-c-src-mq3-collision-patchmesh-ml-1218565454"></a>
### needsSubdivision

```ml
function needsSubdivision(a, b, c)
```

Compute needs subdivision in collision.patchmesh; the normal completion returns `(q.VectorLength(delta) >= 16)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[axis]` and `n.fadd(a[axis], c[axis])`. |
| `b` | `dynamic` | — | B used in `b[axis]` and `n.fadd(a[axis], b[axis])`. |
| `c` | `dynamic` | — | C used in `c[axis]` and `n.fadd(a[axis], c[axis])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L111)

- [mq3.collision.patchmesh.Patch](Type-mq3-collision-patchmesh-patch-2007201987.md) — struct
<a id="function-function-mq3-collision-patchmesh-plane-function-plane-normal-distance-src-mq3-collision-patchmesh-ml-1445554744"></a>
### plane

```ml
function plane(normal, distance)
```

Create `mq3.collision.patchmesh.Plane` with normal=normal; distance=distance; signbits=CM_SignbitsForNormal(normal).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Initial `normal` field stored in the returned or constructed `mq3.collision.patchmesh.Plane` record. |
| `distance` | `dynamic` | — | Initial `distance` field stored in the returned or constructed `mq3.collision.patchmesh.Plane` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L73)

- [mq3.collision.patchmesh.Plane](Type-mq3-collision-patchmesh-plane-622815719.md) — struct
<a id="function-function-mq3-collision-patchmesh-setinward-function-setinward-patch-facet-points-src-mq3-collision-patchmesh-ml-720239596"></a>
### setInward

```ml
function setInward(patch, facet, points)
```

Set inward in collision.patchmesh.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.CM_PointOnPlaneSide`. |
| `facet` | `dynamic` | — | Record exposing `borders`, `inward`. |
| `points` | `dynamic` | — | Sequence traversed as `point` by the loop in `setInward`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L366)

<a id="function-function-mq3-collision-patchmesh-signbits-function-signbits-normal-src-mq3-collision-patchmesh-ml-175826603"></a>
### signbits

```ml
function signbits(normal)
```

Compute signbits in collision.patchmesh; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal used in `normal[axis]` and `(normal[axis] < 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L60)

<a id="function-function-mq3-collision-patchmesh-snap-function-snap-normal-src-mq3-collision-patchmesh-ml-771202603"></a>
### snap

```ml
function snap(normal)
```

Compute snap in collision.patchmesh; the normal completion returns `normal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal used in `normal[axis]` and `n.fsub(normal[axis], direction)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L450)

<a id="function-function-mq3-collision-patchmesh-subdividecolumns-function-subdividecolumns-grid-src-mq3-collision-patchmesh-ml-692477384"></a>
### subdivideColumns

```ml
function subdivideColumns(grid)
```

Compute subdivide columns in collision.patchmesh.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Grid passed as `grid` to `mq3.collision.patchmesh.CM_SetGridWrapWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L201)

<a id="function-function-mq3-collision-patchmesh-transpose-function-transpose-grid-src-mq3-collision-patchmesh-ml-335376498"></a>
### transpose

```ml
function transpose(grid)
```

Return `mq3.collision.patchmesh.CM_TransposeGrid(grid)` from `collision.patchmesh.transpose`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Grid passed as `grid` to `mq3.collision.patchmesh.CM_TransposeGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L225)

<a id="function-function-mq3-collision-patchmesh-validfacet-function-validfacet-patch-facet-src-mq3-collision-patchmesh-ml-742635009"></a>
### validFacet

```ml
function validFacet(patch, facet)
```

Validate facet in collision.patchmesh; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchmesh.facetWinding`. |
| `facet` | `dynamic` | — | Facet passed as `facet` to `mq3.collision.patchmesh.facetWinding`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L414)
