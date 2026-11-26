# `src/mq3/renderer/playable_light_grid.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_light_grid`](Package-mq3-renderer-playable-light-grid-2110974213.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-playable-light-grid-ceilnumber-function-ceilnumber-value-src-mq3-renderer-playable-light-grid-ml-1641469307"></a>
### ceilNumber

```ml
function ceilNumber(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L28)

<a id="constant-constant-mq3-renderer-playable-light-grid-default-x-const-default-x-64-src-mq3-renderer-playable-light-grid-ml-1244210619"></a>
### DEFAULT_X

```ml
const DEFAULT_X = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L13)

<a id="constant-constant-mq3-renderer-playable-light-grid-default-y-const-default-y-64-src-mq3-renderer-playable-light-grid-ml-1941577255"></a>
### DEFAULT_Y

```ml
const DEFAULT_Y = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L14)

<a id="constant-constant-mq3-renderer-playable-light-grid-default-z-const-default-z-128-src-mq3-renderer-playable-light-grid-ml-1424215250"></a>
### DEFAULT_Z

```ml
const DEFAULT_Z = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L15)

<a id="constant-constant-mq3-renderer-playable-light-grid-dlight-at-radius-const-dlight-at-radius-16-src-mq3-renderer-playable-light-grid-ml-638224006"></a>
### DLIGHT_AT_RADIUS

```ml
const DLIGHT_AT_RADIUS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L18)

<a id="constant-constant-mq3-renderer-playable-light-grid-dlight-minimum-radius-const-dlight-minimum-radius-16-src-mq3-renderer-playable-light-grid-ml-1953518714"></a>
### DLIGHT_MINIMUM_RADIUS

```ml
const DLIGHT_MINIMUM_RADIUS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L19)

<a id="function-function-mq3-renderer-playable-light-grid-emptysample-function-emptysample-src-mq3-renderer-playable-light-grid-ml-1167233900"></a>
### emptySample

```ml
function emptySample()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L48)

<a id="function-function-mq3-renderer-playable-light-grid-entitysample-function-entitysample-grid-point-src-mq3-renderer-playable-light-grid-ml-111244094"></a>
### entitySample

```ml
function entitySample(grid, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L85)

<a id="function-function-mq3-renderer-playable-light-grid-fail-function-fail-message-src-mq3-renderer-playable-light-grid-ml-1298975737"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L26)

<a id="function-function-mq3-renderer-playable-light-grid-floornumber-function-floornumber-value-src-mq3-renderer-playable-light-grid-ml-1393804989"></a>
### floorNumber

```ml
function floorNumber(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L27)

- [mq3.renderer.playable_light_grid.Grid](Type-mq3-renderer-playable-light-grid-grid-504861005.md) — struct
<a id="function-function-mq3-renderer-playable-light-grid-load-function-load-map-src-mq3-renderer-playable-light-grid-ml-505859590"></a>
### load

```ml
function load(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L36)

<a id="constant-constant-mq3-renderer-playable-light-grid-minlight-const-minlight-32-src-mq3-renderer-playable-light-grid-ml-851356866"></a>
### MINLIGHT

```ml
const MINLIGHT = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L17)

<a id="constant-constant-mq3-renderer-playable-light-grid-noworld-ambient-const-noworld-ambient-182-src-mq3-renderer-playable-light-grid-ml-1001962174"></a>
### NOWORLD_AMBIENT

```ml
const NOWORLD_AMBIENT = 182
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L20)

<a id="constant-constant-mq3-renderer-playable-light-grid-noworld-directed-const-noworld-directed-150-src-mq3-renderer-playable-light-grid-ml-553991675"></a>
### NOWORLD_DIRECTED

```ml
const NOWORLD_DIRECTED = 150
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L21)

<a id="function-function-mq3-renderer-playable-light-grid-noworldentitysample-function-noworldentitysample-grid-point-src-mq3-renderer-playable-light-grid-ml-1695513534"></a>
### noWorldEntitySample

```ml
function noWorldEntitySample(grid, point)
```

R_SetupEntityLighting uses identityLight*150 for both components when the refdef has RDF_NOWORLDMODEL, then applies the renderer's unconditional 32-unit minimum-light add. The software renderer uses identityLight 1.0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L92)

<a id="constant-constant-mq3-renderer-playable-light-grid-pi-const-pi-3-141593-src-mq3-renderer-playable-light-grid-ml-1224293179"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L16)

<a id="function-function-mq3-renderer-playable-light-grid-sample-function-sample-grid-point-src-mq3-renderer-playable-light-grid-ml-1394845694"></a>
### sample

```ml
function sample(grid, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L50)

- [mq3.renderer.playable_light_grid.Sample](Type-mq3-renderer-playable-light-grid-sample-1549436571.md) — struct
<a id="function-function-mq3-renderer-playable-light-grid-setdynamiclights-function-setdynamiclights-grid-lights-src-mq3-renderer-playable-light-grid-ml-912382849"></a>
### setDynamicLights

```ml
function setDynamicLights(grid, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L84)

<a id="function-function-mq3-renderer-playable-light-grid-shiftcolor-function-shiftcolor-red-green-blue-src-mq3-renderer-playable-light-grid-ml-503469160"></a>
### shiftColor

```ml
function shiftColor(red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L45)

<a id="function-function-mq3-renderer-playable-light-grid-vertexcolor-function-vertexcolor-value-normal-src-mq3-renderer-playable-light-grid-ml-1161803504"></a>
### vertexColor

```ml
function vertexColor(value, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L101)

<a id="function-function-mq3-renderer-playable-light-grid-vertexcolorinto-function-vertexcolorinto-value-normal-color-src-mq3-renderer-playable-light-grid-ml-99460487"></a>
### vertexColorInto

```ml
function vertexColorInto(value, normal, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L107)

<a id="function-function-mq3-renderer-playable-light-grid-vertexlight-function-vertexlight-value-normal-src-mq3-renderer-playable-light-grid-ml-1179622398"></a>
### vertexLight

```ml
function vertexLight(value, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L97)

<a id="function-function-mq3-renderer-playable-light-grid-withdynamiclights-function-withdynamiclights-value-point-lights-src-mq3-renderer-playable-light-grid-ml-169155582"></a>
### withDynamicLights

```ml
function withDynamicLights(value, point, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L70)

<a id="function-function-mq3-renderer-playable-light-grid-worldgridsize-function-worldgridsize-map-src-mq3-renderer-playable-light-grid-ml-2002278784"></a>
### worldGridSize

```ml
function worldGridSize(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L30)
