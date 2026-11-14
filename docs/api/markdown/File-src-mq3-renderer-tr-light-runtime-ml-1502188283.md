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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L38)

- [mq3.renderer.tr_light_runtime.Dlight](Type-mq3-renderer-tr-light-runtime-dlight-1093256819.md) — struct
<a id="constant-constant-mq3-renderer-tr-light-runtime-dlight-at-radius-const-dlight-at-radius-16-src-mq3-renderer-tr-light-runtime-ml-450040424"></a>
### DLIGHT_AT_RADIUS

```ml
const DLIGHT_AT_RADIUS = 16.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L16)

<a id="constant-constant-mq3-renderer-tr-light-runtime-dlight-minimum-radius-const-dlight-minimum-radius-16-src-mq3-renderer-tr-light-runtime-ml-1080138420"></a>
### DLIGHT_MINIMUM_RADIUS

```ml
const DLIGHT_MINIMUM_RADIUS = 16.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L17)

<a id="function-function-mq3-renderer-tr-light-runtime-dot3-function-dot3-a-b-src-mq3-renderer-tr-light-runtime-ml-816332313"></a>
### dot3

```ml
function dot3(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L29)

<a id="function-function-mq3-renderer-tr-light-runtime-entity-function-entity-origin-src-mq3-renderer-tr-light-runtime-ml-547343524"></a>
### entity

```ml
function entity(origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L34)

<a id="function-function-mq3-renderer-tr-light-runtime-identityaxis-function-identityaxis-src-mq3-renderer-tr-light-runtime-ml-624492502"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L27)

<a id="function-function-mq3-renderer-tr-light-runtime-length3-function-length3-a-src-mq3-renderer-tr-light-runtime-ml-1447699833"></a>
### length3

```ml
function length3(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-light-runtime-lightorigin-function-lightorigin-ent-src-mq3-renderer-tr-light-runtime-ml-2147061177"></a>
### lightOrigin

```ml
function lightOrigin(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L56)

- [mq3.renderer.tr_light_runtime.LightResult](Type-mq3-renderer-tr-light-runtime-lightresult-37242048.md) — struct
<a id="function-function-mq3-renderer-tr-light-runtime-loglight-function-loglight-ent-src-mq3-renderer-tr-light-runtime-ml-338840365"></a>
### LogLight

```ml
function LogLight(ent)
```

Preserves the original function's else-if quirk: Z is tested only when Y did not replace the current maximum.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L63)

<a id="function-function-mq3-renderer-tr-light-runtime-ma3-function-ma3-a-s-b-src-mq3-renderer-tr-light-runtime-ml-650815124"></a>
### ma3

```ml
function ma3(a, s, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L31)

<a id="function-function-mq3-renderer-tr-light-runtime-normalize3-function-normalize3-a-src-mq3-renderer-tr-light-runtime-ml-669152239"></a>
### normalize3

```ml
function normalize3(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L33)

<a id="function-function-mq3-renderer-tr-light-runtime-orientation-function-orientation-origin-axis-src-mq3-renderer-tr-light-runtime-ml-302084961"></a>
### orientation

```ml
function orientation(origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L37)

- [mq3.renderer.tr_light_runtime.Orientation](Type-mq3-renderer-tr-light-runtime-orientation-498460619.md) — struct
<a id="function-function-mq3-renderer-tr-light-runtime-packambient-function-packambient-value-src-mq3-renderer-tr-light-runtime-ml-1443147391"></a>
### packAmbient

```ml
function packAmbient(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L70)

<a id="function-function-mq3-renderer-tr-light-runtime-r-dlightbmodel-function-r-dlightbmodel-model-lights-orient-smpframe-currententity-src-mq3-renderer-tr-light-runtime-ml-195708460"></a>
### R_DlightBmodel

```ml
function R_DlightBmodel(model, lights, orient, smpFrame, currentEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `orient` | `dynamic` | — |  |
| `smpFrame` | `dynamic` | — |  |
| `currentEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L46)

<a id="function-function-mq3-renderer-tr-light-runtime-r-lightforpoint-function-r-lightforpoint-grid-point-ambientscale-directedscale-src-mq3-renderer-tr-light-runtime-ml-1833908096"></a>
### R_LightForPoint

```ml
function R_LightForPoint(grid, point, ambientScale, directedScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `ambientScale` | `dynamic` | — |  |
| `directedScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L87)

<a id="function-function-mq3-renderer-tr-light-runtime-r-setupentitylighting-function-r-setupentitylighting-refdef-grid-ent-identitylight-identitylightbyte-sundirection-ambientscale-directedscale-debuglight-src-mq3-renderer-tr-light-runtime-ml-978347097"></a>
### R_SetupEntityLighting

```ml
function R_SetupEntityLighting(refdef, grid, ent, identityLight, identityLightByte, sunDirection, ambientScale, directedScale, debugLight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `identityLight` | `dynamic` | — |  |
| `identityLightByte` | `dynamic` | — |  |
| `sunDirection` | `dynamic` | — |  |
| `ambientScale` | `dynamic` | — |  |
| `directedScale` | `dynamic` | — |  |
| `debugLight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L74)

<a id="function-function-mq3-renderer-tr-light-runtime-r-setupentitylightinggrid-function-r-setupentitylightinggrid-grid-ent-ambientscale-directedscale-src-mq3-renderer-tr-light-runtime-ml-1431937891"></a>
### R_SetupEntityLightingGrid

```ml
function R_SetupEntityLightingGrid(grid, ent, ambientScale, directedScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `ambientScale` | `dynamic` | — |  |
| `directedScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L57)

<a id="function-function-mq3-renderer-tr-light-runtime-r-transformdlights-function-r-transformdlights-count-lights-orient-src-mq3-renderer-tr-light-runtime-ml-798038163"></a>
### R_TransformDlights

```ml
function R_TransformDlights(count, lights, orient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `orient` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L40)

<a id="constant-constant-mq3-renderer-tr-light-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-light-runtime-ml-1963859620"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L12)

- [mq3.renderer.tr_light_runtime.Refdef](Type-mq3-renderer-tr-light-runtime-refdef-1826625023.md) — struct
- [mq3.renderer.tr_light_runtime.RefEntity](Type-mq3-renderer-tr-light-runtime-refentity-33327011.md) — struct
<a id="constant-constant-mq3-renderer-tr-light-runtime-rf-first-person-const-rf-first-person-4-src-mq3-renderer-tr-light-runtime-ml-1136774629"></a>
### RF_FIRST_PERSON

```ml
const RF_FIRST_PERSON = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L10)

<a id="constant-constant-mq3-renderer-tr-light-runtime-rf-lighting-origin-const-rf-lighting-origin-128-src-mq3-renderer-tr-light-runtime-ml-140856232"></a>
### RF_LIGHTING_ORIGIN

```ml
const RF_LIGHTING_ORIGIN = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L11)

<a id="function-function-mq3-renderer-tr-light-runtime-scale3-function-scale3-a-s-src-mq3-renderer-tr-light-runtime-ml-275333226"></a>
### scale3

```ml
function scale3(a, s)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L30)

<a id="constant-constant-mq3-renderer-tr-light-runtime-sf-face-const-sf-face-1-src-mq3-renderer-tr-light-runtime-ml-653856"></a>
### SF_FACE

```ml
const SF_FACE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-tr-light-runtime-sf-grid-const-sf-grid-2-src-mq3-renderer-tr-light-runtime-ml-85917039"></a>
### SF_GRID

```ml
const SF_GRID = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L14)

<a id="constant-constant-mq3-renderer-tr-light-runtime-sf-triangles-const-sf-triangles-3-src-mq3-renderer-tr-light-runtime-ml-1462969698"></a>
### SF_TRIANGLES

```ml
const SF_TRIANGLES = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L15)

<a id="function-function-mq3-renderer-tr-light-runtime-sub3-function-sub3-a-b-src-mq3-renderer-tr-light-runtime-ml-1893492249"></a>
### sub3

```ml
function sub3(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L28)

- [mq3.renderer.tr_light_runtime.Surface](Type-mq3-renderer-tr-light-runtime-surface-240110498.md) — struct
