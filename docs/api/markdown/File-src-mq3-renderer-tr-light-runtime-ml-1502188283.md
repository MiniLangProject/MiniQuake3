# `src/mq3/renderer/tr_light_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_light_runtime`](Package-mq3-renderer-tr-light-runtime-2023312739.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/renderer/playable_light_grid.ml` as `grids` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)

## Declarations

- [mq3.renderer.tr_light_runtime.Bmodel](Type-mq3-renderer-tr-light-runtime-bmodel-1441177740.md) — struct
<a id="function-function-mq3-renderer-tr-light-runtime-dlight-function-dlight-origin-radius-color-src-mq3-renderer-tr-light-runtime-ml-1324098011"></a>
### dlight

```ml
function dlight(origin, radius, color)
```

Constructs `mq3.renderer.tr_light_runtime.Dlight` with `transformed` = `[0.0,0.0,0.0]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.tr_light_runtime.Dlight.origin`. |
| `radius` | `dynamic` | — | Initial value for `mq3.renderer.tr_light_runtime.Dlight.radius`. |
| `color` | `dynamic` | — | Initial value for `mq3.renderer.tr_light_runtime.Dlight.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L139)

- [mq3.renderer.tr_light_runtime.Dlight](Type-mq3-renderer-tr-light-runtime-dlight-1093256819.md) — struct
<a id="constant-constant-mq3-renderer-tr-light-runtime-dlight-at-radius-const-dlight-at-radius-16-src-mq3-renderer-tr-light-runtime-ml-1219406766"></a>
### DLIGHT_AT_RADIUS

```ml
const DLIGHT_AT_RADIUS = 16
```

Dynamic-light contribution used at a distance equal to the light's radius.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-light-runtime-dlight-minimum-radius-const-dlight-minimum-radius-16-src-mq3-renderer-tr-light-runtime-ml-1959686938"></a>
### DLIGHT_MINIMUM_RADIUS

```ml
const DLIGHT_MINIMUM_RADIUS = 16
```

Lower bound applied to dynamic-light radius calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L25)

<a id="function-function-mq3-renderer-tr-light-runtime-dot3-function-dot3-a-b-src-mq3-renderer-tr-light-runtime-ml-816332313"></a>
### dot3

```ml
function dot3(a, b)
```

Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.tr_light_runtime.dot3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L110)

<a id="function-function-mq3-renderer-tr-light-runtime-entity-function-entity-origin-src-mq3-renderer-tr-light-runtime-ml-547343524"></a>
### entity

```ml
function entity(origin)
```

Constructs `mq3.renderer.tr_light_runtime.RefEntity` with `lightingOrigin` = `[0.0,0.0,0.0]`, `axis` = `identityAxis()`, `renderfx` = `0`, `lightingCalculated` = `false` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.tr_light_runtime.RefEntity.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L128)

<a id="function-function-mq3-renderer-tr-light-runtime-identityaxis-function-identityaxis-src-mq3-renderer-tr-light-runtime-ml-624492502"></a>
### identityAxis

```ml
function identityAxis()
```

Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.tr_light_runtime.identityAxis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L102)

<a id="function-function-mq3-renderer-tr-light-runtime-length3-function-length3-a-src-mq3-renderer-tr-light-runtime-ml-1447699833"></a>
### length3

```ml
function length3(a)
```

Calls `mq3.compat.transcendental.sqrt` with `(a[0]*a[0]+a[1]*a[1]+a[2]*a[2])` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L122)

<a id="function-function-mq3-renderer-tr-light-runtime-lightorigin-function-lightorigin-ent-src-mq3-renderer-tr-light-runtime-ml-2147061177"></a>
### lightOrigin

```ml
function lightOrigin(ent)
```

Returns `ent.origin` from `mq3.renderer.tr_light_runtime.lightOrigin`; earlier branches return `ent.lightingOrigin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Record providing `ent.renderfx`, `ent.lightingOrigin`, `ent.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L169)

- [mq3.renderer.tr_light_runtime.LightResult](Type-mq3-renderer-tr-light-runtime-lightresult-37242048.md) — struct
<a id="function-function-mq3-renderer-tr-light-runtime-loglight-function-loglight-ent-src-mq3-renderer-tr-light-runtime-ml-338840365"></a>
### LogLight

```ml
function LogLight(ent)
```

Preserves the original function's else-if quirk: Z is tested only when Y did not replace the current maximum.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Record providing `ent.renderfx`, `ent.ambientLight`, `ent.directedLight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L182)

<a id="function-function-mq3-renderer-tr-light-runtime-ma3-function-ma3-a-s-b-src-mq3-renderer-tr-light-runtime-ml-650815124"></a>
### ma3

```ml
function ma3(a, s, b)
```

Returns `[a[0]+s*b[0],a[1]+s*b[1],a[2]+s*b[2]]` for `mq3.renderer.tr_light_runtime.ma3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `s` | `dynamic` | — | Input used in the result expression `[a[0]+s*b[0],a[1]+s*b[1],a[2]+s*b[2]]`. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L119)

<a id="function-function-mq3-renderer-tr-light-runtime-normalize3-function-normalize3-a-src-mq3-renderer-tr-light-runtime-ml-669152239"></a>
### normalize3

```ml
function normalize3(a)
```

Updates `a[0]`, `a[1]`, `a[2]` in `mq3.renderer.tr_light_runtime.normalize3`; returns `length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Mutable record or buffer; this call updates `a[0]`, `a[1]`, `a[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L125)

<a id="function-function-mq3-renderer-tr-light-runtime-orientation-function-orientation-origin-axis-src-mq3-renderer-tr-light-runtime-ml-302084961"></a>
### orientation

```ml
function orientation(origin, axis)
```

Constructs `mq3.renderer.tr_light_runtime.Orientation` from `origin`, `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.tr_light_runtime.Orientation.origin`. |
| `axis` | `dynamic` | — | Initial value for `mq3.renderer.tr_light_runtime.Orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L134)

- [mq3.renderer.tr_light_runtime.Orientation](Type-mq3-renderer-tr-light-runtime-orientation-498460619.md) — struct
<a id="function-function-mq3-renderer-tr-light-runtime-packambient-function-packambient-value-src-mq3-renderer-tr-light-runtime-ml-1443147391"></a>
### packAmbient

```ml
function packAmbient(value)
```

Returns `red|(green<<8)|(blue<<16)|(255<<24)` from `mq3.renderer.tr_light_runtime.packAmbient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L191)

<a id="function-function-mq3-renderer-tr-light-runtime-r-dlightbmodel-function-r-dlightbmodel-model-lights-orient-smpframe-currententity-src-mq3-renderer-tr-light-runtime-ml-195708460"></a>
### R_DlightBmodel

```ml
function R_DlightBmodel(model, lights, orient, smpFrame, currentEntity)
```

Updates `currentEntity.needDlights` in `mq3.renderer.tr_light_runtime.R_DlightBmodel`; returns `mask`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record providing `model.bounds`, `model.surfaces`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.tr_light_runtime.R_TransformDlights`. |
| `orient` | `dynamic` | — | Value forwarded as `orient` to `mq3.renderer.tr_light_runtime.R_TransformDlights`. |
| `smpFrame` | `dynamic` | — | Input used by `surface.dlightBits[smpFrame]=mask`. |
| `currentEntity` | `dynamic` | — | Mutable record or buffer; this call updates `currentEntity.needDlights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L157)

<a id="function-function-mq3-renderer-tr-light-runtime-r-lightforpoint-function-r-lightforpoint-grid-point-ambientscale-directedscale-src-mq3-renderer-tr-light-runtime-ml-1833908096"></a>
### R_LightForPoint

```ml
function R_LightForPoint(grid, point, ambientScale, directedScale)
```

Builds `mq3.renderer.tr_light_runtime.LightResult` for `mq3.renderer.tr_light_runtime.R_LightForPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.valid`. |
| `point` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.tr_light_runtime.entity`. |
| `ambientScale` | `dynamic` | — | Value forwarded as `ambientScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`. |
| `directedScale` | `dynamic` | — | Value forwarded as `directedScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L223)

<a id="function-function-mq3-renderer-tr-light-runtime-r-setupentitylighting-function-r-setupentitylighting-refdef-grid-ent-identitylight-identitylightbyte-sundirection-ambientscale-directedscale-debuglight-src-mq3-renderer-tr-light-runtime-ml-978347097"></a>
### R_SetupEntityLighting

```ml
function R_SetupEntityLighting(refdef, grid, ent, identityLight, identityLightByte, sunDirection, ambientScale, directedScale, debugLight)
```

Updates `ent.lightingCalculated`, `ent.ambientLight`, `ent.directedLight`, `ent.lightDir`, `ent.ambientLight[channel]` in `mq3.renderer.tr_light_runtime.R_SetupEntityLighting`; returns `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — | Record providing `refdef.rdflags`, `refdef.dlights`. |
| `grid` | `dynamic` | — | Record providing `grid.valid`. |
| `ent` | `dynamic` | — | Mutable record or buffer; this call updates `ent.lightingCalculated`, `ent.ambientLight`, `ent.directedLight`, `ent.lightDir`, `ent.ambientLight[channel]`. |
| `identityLight` | `dynamic` | — | Input used by `else amount=identityLight*150.0`. |
| `identityLightByte` | `dynamic` | — | Value assigned to `ent.ambientLight[channel]`. |
| `sunDirection` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `ambientScale` | `dynamic` | — | Value forwarded as `ambientScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`. |
| `directedScale` | `dynamic` | — | Value forwarded as `directedScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`. |
| `debugLight` | `dynamic` | — | Input tested by `debugLight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L205)

<a id="function-function-mq3-renderer-tr-light-runtime-r-setupentitylightinggrid-function-r-setupentitylightinggrid-grid-ent-ambientscale-directedscale-src-mq3-renderer-tr-light-runtime-ml-1431937891"></a>
### R_SetupEntityLightingGrid

```ml
function R_SetupEntityLightingGrid(grid, ent, ambientScale, directedScale)
```

Updates `ent.ambientLight`, `ent.directedLight`, `ent.lightDir` in `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`; returns `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_light_grid.sample`. |
| `ent` | `dynamic` | — | Mutable record or buffer; this call updates `ent.ambientLight`, `ent.directedLight`, `ent.lightDir`. |
| `ambientScale` | `dynamic` | — | Value forwarded as `s` to `mq3.renderer.tr_light_runtime.scale3`. |
| `directedScale` | `dynamic` | — | Value forwarded as `s` to `mq3.renderer.tr_light_runtime.scale3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L175)

<a id="function-function-mq3-renderer-tr-light-runtime-r-transformdlights-function-r-transformdlights-count-lights-orient-src-mq3-renderer-tr-light-runtime-ml-798038163"></a>
### R_TransformDlights

```ml
function R_TransformDlights(count, lights, orient)
```

Updates `lights[index].transformed` in `mq3.renderer.tr_light_runtime.R_TransformDlights`; returns `lights`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Input used by `limit=count`. |
| `lights` | `dynamic` | — | Mutable record or buffer; this call updates `lights[index].transformed`. |
| `orient` | `dynamic` | — | Record providing `orient.origin`, `orient.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L145)

<a id="constant-constant-mq3-renderer-tr-light-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-light-runtime-ml-1963859620"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```

View flag that renders submitted entities without the BSP world model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L15)

- [mq3.renderer.tr_light_runtime.Refdef](Type-mq3-renderer-tr-light-runtime-refdef-1826625023.md) — struct
- [mq3.renderer.tr_light_runtime.RefEntity](Type-mq3-renderer-tr-light-runtime-refentity-33327011.md) — struct
<a id="constant-constant-mq3-renderer-tr-light-runtime-rf-first-person-const-rf-first-person-4-src-mq3-renderer-tr-light-runtime-ml-1136774629"></a>
### RF_FIRST_PERSON

```ml
const RF_FIRST_PERSON = 4
```

Entity-rendering flag that draws the entity only in first-person views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L11)

<a id="constant-constant-mq3-renderer-tr-light-runtime-rf-lighting-origin-const-rf-lighting-origin-128-src-mq3-renderer-tr-light-runtime-ml-140856232"></a>
### RF_LIGHTING_ORIGIN

```ml
const RF_LIGHTING_ORIGIN = 128
```

Entity-rendering flag selecting the supplied alternate lighting origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L13)

<a id="function-function-mq3-renderer-tr-light-runtime-scale3-function-scale3-a-s-src-mq3-renderer-tr-light-runtime-ml-275333226"></a>
### scale3

```ml
function scale3(a, s)
```

Returns `[a[0]*s,a[1]*s,a[2]*s]` for `mq3.renderer.tr_light_runtime.scale3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `s` | `dynamic` | — | Input used in the result expression `[a[0]*s,a[1]*s,a[2]*s]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L114)

<a id="constant-constant-mq3-renderer-tr-light-runtime-sf-face-const-sf-face-1-src-mq3-renderer-tr-light-runtime-ml-653856"></a>
### SF_FACE

```ml
const SF_FACE = 1
```

Surface-dispatch tag identifying a planar BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-tr-light-runtime-sf-grid-const-sf-grid-2-src-mq3-renderer-tr-light-runtime-ml-85917039"></a>
### SF_GRID

```ml
const SF_GRID = 2
```

Surface-dispatch tag identifying a tessellated curved-patch grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-light-runtime-sf-triangles-const-sf-triangles-3-src-mq3-renderer-tr-light-runtime-ml-1462969698"></a>
### SF_TRIANGLES

```ml
const SF_TRIANGLES = 3
```

Surface-dispatch tag identifying indexed triangle geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L21)

<a id="function-function-mq3-renderer-tr-light-runtime-sub3-function-sub3-a-b-src-mq3-renderer-tr-light-runtime-ml-1893492249"></a>
### sub3

```ml
function sub3(a, b)
```

Returns `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `mq3.renderer.tr_light_runtime.sub3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L106)

- [mq3.renderer.tr_light_runtime.Surface](Type-mq3-renderer-tr-light-runtime-surface-240110498.md) — struct
