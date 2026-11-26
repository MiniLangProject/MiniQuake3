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

Returns `result` from `mq3.renderer.playable_light_grid.ceilNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.playable_light_grid.floorNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L73)

<a id="constant-constant-mq3-renderer-playable-light-grid-default-x-const-default-x-64-src-mq3-renderer-playable-light-grid-ml-1244210619"></a>
### DEFAULT_X

```ml
const DEFAULT_X = 64
```

Default light-grid cell spacing along the world X axis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L14)

<a id="constant-constant-mq3-renderer-playable-light-grid-default-y-const-default-y-64-src-mq3-renderer-playable-light-grid-ml-1941577255"></a>
### DEFAULT_Y

```ml
const DEFAULT_Y = 64
```

Default light-grid cell spacing along the world Y axis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L16)

<a id="constant-constant-mq3-renderer-playable-light-grid-default-z-const-default-z-128-src-mq3-renderer-playable-light-grid-ml-1424215250"></a>
### DEFAULT_Z

```ml
const DEFAULT_Z = 128
```

Default light-grid cell spacing along the world Z axis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L18)

<a id="constant-constant-mq3-renderer-playable-light-grid-dlight-at-radius-const-dlight-at-radius-16-src-mq3-renderer-playable-light-grid-ml-638224006"></a>
### DLIGHT_AT_RADIUS

```ml
const DLIGHT_AT_RADIUS = 16
```

Dynamic-light contribution used at a distance equal to the light's radius.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L24)

<a id="constant-constant-mq3-renderer-playable-light-grid-dlight-minimum-radius-const-dlight-minimum-radius-16-src-mq3-renderer-playable-light-grid-ml-1953518714"></a>
### DLIGHT_MINIMUM_RADIUS

```ml
const DLIGHT_MINIMUM_RADIUS = 16
```

Lower bound applied to dynamic-light radius calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L26)

<a id="function-function-mq3-renderer-playable-light-grid-emptysample-function-emptysample-src-mq3-renderer-playable-light-grid-ml-1167233900"></a>
### emptySample

```ml
function emptySample()
```

Constructs `mq3.renderer.playable_light_grid.Sample` with `ambient` = `[0.0,0.0,0.0]`, `directed` = `[0.0,0.0,0.0]`, `direction` = `[0.0,0.0,1.0]`, `totalFactor` = `0.0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L102)

<a id="function-function-mq3-renderer-playable-light-grid-entitysample-function-entitysample-grid-point-src-mq3-renderer-playable-light-grid-ml-111244094"></a>
### entitySample

```ml
function entitySample(grid, point)
```

Builds `value.ambient[channel]` in `mq3.renderer.playable_light_grid.entitySample`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.dynamicLights`. |
| `point` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.playable_light_grid.sample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L152)

<a id="function-function-mq3-renderer-playable-light-grid-fail-function-fail-message-src-mq3-renderer-playable-light-grid-ml-1298975737"></a>
### fail

```ml
function fail(message)
```

Creates error `7660` with message `"playable light grid: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7660,"playable light grid: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L67)

<a id="function-function-mq3-renderer-playable-light-grid-floornumber-function-floornumber-value-src-mq3-renderer-playable-light-grid-ml-1393804989"></a>
### floorNumber

```ml
function floorNumber(value)
```

Returns `result` from `mq3.renderer.playable_light_grid.floorNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L70)

- [mq3.renderer.playable_light_grid.Grid](Type-mq3-renderer-playable-light-grid-grid-504861005.md) — struct
<a id="function-function-mq3-renderer-playable-light-grid-load-function-load-map-src-mq3-renderer-playable-light-grid-ml-505859590"></a>
### load

```ml
function load(map)
```

Builds `mq3.renderer.playable_light_grid.Grid` for `mq3.renderer.playable_light_grid.load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`, `map.lengths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L85)

<a id="constant-constant-mq3-renderer-playable-light-grid-minlight-const-minlight-32-src-mq3-renderer-playable-light-grid-ml-851356866"></a>
### MINLIGHT

```ml
const MINLIGHT = 32
```

Minimum ambient contribution enforced for entities requesting minimum lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L22)

<a id="constant-constant-mq3-renderer-playable-light-grid-noworld-ambient-const-noworld-ambient-182-src-mq3-renderer-playable-light-grid-ml-1001962174"></a>
### NOWORLD_AMBIENT

```ml
const NOWORLD_AMBIENT = 182
```

Fallback ambient-light contribution when rendering without a world light grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L28)

<a id="constant-constant-mq3-renderer-playable-light-grid-noworld-directed-const-noworld-directed-150-src-mq3-renderer-playable-light-grid-ml-553991675"></a>
### NOWORLD_DIRECTED

```ml
const NOWORLD_DIRECTED = 150
```

Fallback directional-light contribution when rendering without a world light grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L30)

<a id="function-function-mq3-renderer-playable-light-grid-noworldentitysample-function-noworldentitysample-grid-point-src-mq3-renderer-playable-light-grid-ml-1695513534"></a>
### noWorldEntitySample

```ml
function noWorldEntitySample(grid, point)
```

R_SetupEntityLighting uses identityLight*150 for both components when the refdef has RDF_NOWORLDMODEL, then applies the renderer's unconditional 32-unit minimum-light add. The software renderer uses identityLight 1.0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.dynamicLights`. |
| `point` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.playable_light_grid.withDynamicLights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L161)

<a id="constant-constant-mq3-renderer-playable-light-grid-pi-const-pi-3-141593-src-mq3-renderer-playable-light-grid-ml-1224293179"></a>
### PI

```ml
const PI = 3.141593
```

Ratio of a circle's circumference to its diameter, used for angle conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L20)

<a id="function-function-mq3-renderer-playable-light-grid-sample-function-sample-grid-point-src-mq3-renderer-playable-light-grid-ml-1394845694"></a>
### sample

```ml
function sample(grid, point)
```

Builds `mq3.renderer.playable_light_grid.Sample` after updating `ambient[channel]`, `directed[channel]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.valid`, `grid.origin`, `grid.inverse`, `grid.bounds`, `grid.offset`, `grid.length`. |
| `point` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L107)

- [mq3.renderer.playable_light_grid.Sample](Type-mq3-renderer-playable-light-grid-sample-1549436571.md) — struct
<a id="function-function-mq3-renderer-playable-light-grid-setdynamiclights-function-setdynamiclights-grid-lights-src-mq3-renderer-playable-light-grid-ml-912382849"></a>
### setDynamicLights

```ml
function setDynamicLights(grid, lights)
```

Updates `grid.dynamicLights` in `mq3.renderer.playable_light_grid.setDynamicLights`; returns `grid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Mutable record or buffer; this call updates `grid.dynamicLights`. |
| `lights` | `dynamic` | — | Value assigned to `grid.dynamicLights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L148)

<a id="function-function-mq3-renderer-playable-light-grid-shiftcolor-function-shiftcolor-red-green-blue-src-mq3-renderer-playable-light-grid-ml-503469160"></a>
### shiftColor

```ml
function shiftColor(red, green, blue)
```

Calls `mq3.renderer.bsp_render_data.colorShiftLighting` with `(red,green,blue,2)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`. |
| `green` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`. |
| `blue` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L98)

<a id="function-function-mq3-renderer-playable-light-grid-vertexcolor-function-vertexcolor-value-normal-src-mq3-renderer-playable-light-grid-ml-1161803504"></a>
### vertexColor

```ml
function vertexColor(value, normal)
```

Computes `vertexColor` from `color+[255]` using `mq3.shared.math.DotProduct`, `mq3.compat.numeric.trunc32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.direction`, `value.ambient`, `value.directed`. |
| `normal` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L176)

<a id="function-function-mq3-renderer-playable-light-grid-vertexcolorinto-function-vertexcolorinto-value-normal-color-src-mq3-renderer-playable-light-grid-ml-99460487"></a>
### vertexColorInto

```ml
function vertexColorInto(value, normal, color)
```

Updates `color[0]`, `color[1]`, `color[2]`, `color[3]`, `color[channel]` in `mq3.renderer.playable_light_grid.vertexColorInto`; returns `color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.direction`, `value.ambient`, `value.directed`. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.playable_light_grid.vertexColor`. |
| `color` | `dynamic` | — | Mutable record or buffer; this call updates `color[0]`, `color[1]`, `color[2]`, `color[3]`, `color[channel]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L186)

<a id="function-function-mq3-renderer-playable-light-grid-vertexlight-function-vertexlight-value-normal-src-mq3-renderer-playable-light-grid-ml-1179622398"></a>
### vertexLight

```ml
function vertexLight(value, normal)
```

Combines ambient and directional grid lighting against a vertex normal and clamps the resulting brightness.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.direction`, `value.ambient`, `value.directed`. |
| `normal` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L169)

<a id="function-function-mq3-renderer-playable-light-grid-withdynamiclights-function-withdynamiclights-value-point-lights-src-mq3-renderer-playable-light-grid-ml-169155582"></a>
### withDynamicLights

```ml
function withDynamicLights(value, point, lights)
```

Builds `mq3.renderer.playable_light_grid.Sample` after updating `directed[channel]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.ambient`, `value.directed`, `value.direction`, `value.totalFactor`. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `lights` | `dynamic` | — | Sequence traversed as `light` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L131)

<a id="function-function-mq3-renderer-playable-light-grid-worldgridsize-function-worldgridsize-map-src-mq3-renderer-playable-light-grid-ml-2002278784"></a>
### worldGridSize

```ml
function worldGridSize(map)
```

Computes `worldGridSize` from `[DEFAULT_X,DEFAULT_Y,DEFAULT_Z]` using `mq3.format.bsp.entities`, `stringEqualsIgnoreCaseAscii`, `mq3.compat.textnumbers.vector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Argument 1 supplied to `mq3.format.bsp.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_light_grid.ml#L77)
