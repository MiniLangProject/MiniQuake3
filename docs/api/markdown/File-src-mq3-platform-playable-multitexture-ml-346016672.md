# `src/mq3/platform/playable_multitexture.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.playable_multitexture`](Package-mq3-platform-playable-multitexture-1590472260.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-ge128-const-alpha-test-ge128-3-src-mq3-platform-playable-multitexture-ml-1928124332"></a>
### ALPHA_TEST_GE128

```ml
const ALPHA_TEST_GE128 = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L69)

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-gt0-const-alpha-test-gt0-1-src-mq3-platform-playable-multitexture-ml-1342109998"></a>
### ALPHA_TEST_GT0

```ml
const ALPHA_TEST_GT0 = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L67)

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-lt128-const-alpha-test-lt128-2-src-mq3-platform-playable-multitexture-ml-1619107939"></a>
### ALPHA_TEST_LT128

```ml
const ALPHA_TEST_LT128 = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L68)

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-none-const-alpha-test-none-0-src-mq3-platform-playable-multitexture-ml-1497700613"></a>
### ALPHA_TEST_NONE

```ml
const ALPHA_TEST_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L66)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-add-const-blend-add-2-src-mq3-platform-playable-multitexture-ml-498732635"></a>
### BLEND_ADD

```ml
const BLEND_ADD = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L57)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-alpha-const-blend-alpha-1-src-mq3-platform-playable-multitexture-ml-691660838"></a>
### BLEND_ALPHA

```ml
const BLEND_ALPHA = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L56)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-dst-color-one-minus-dst-alpha-const-blend-dst-color-one-minus-dst-alpha-4-src-mq3-platform-playable-multitexture-ml-1221903261"></a>
### BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA

```ml
const BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L59)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-dynamic-light-const-blend-dynamic-light-5-src-mq3-platform-playable-multitexture-ml-1040163734"></a>
### BLEND_DYNAMIC_LIGHT

```ml
const BLEND_DYNAMIC_LIGHT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L60)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-filter-const-blend-filter-3-src-mq3-platform-playable-multitexture-ml-1999902322"></a>
### BLEND_FILTER

```ml
const BLEND_FILTER = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L58)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-gl-state-const-blend-gl-state-256-src-mq3-platform-playable-multitexture-ml-2082211992"></a>
### BLEND_GL_STATE

```ml
const BLEND_GL_STATE = 256
```

Generic OpenGL blend state.  Low nibble is GLS_SRCBLEND_*, high nibble is GLS_DSTBLEND_* and bit 8 distinguishes it from the optimized legacy modes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L65)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-mark-const-blend-mark-6-src-mq3-platform-playable-multitexture-ml-39465539"></a>
### BLEND_MARK

```ml
const BLEND_MARK = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L61)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-opaque-const-blend-opaque-0-src-mq3-platform-playable-multitexture-ml-1101995713"></a>
### BLEND_OPAQUE

```ml
const BLEND_OPAQUE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L55)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-premultiplied-alpha-const-blend-premultiplied-alpha-7-src-mq3-platform-playable-multitexture-ml-1817005580"></a>
### BLEND_PREMULTIPLIED_ALPHA

```ml
const BLEND_PREMULTIPLIED_ALPHA = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L62)

<a id="function-function-mq3-platform-playable-multitexture-draw-function-draw-baseslot-lightmapslot-a-basea-lightmapa-lighta-b-baseb-lightmapb-lightb-c-basec-lightmapc-lightc-red-green-blue-src-mq3-platform-playable-multitexture-ml-1697416720"></a>
### draw

```ml
function draw(baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, b, baseB, lightmapB, lightB, c, baseC, lightmapC, lightC, red, green, blue)
```

Expands three projected vertices and their base/lightmap UVs into the native multitexture triangle call.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseSlot` | `dynamic` | — | Value forwarded as `baseSlot` to `mq3.platform.playable_multitexture.drawNative`. |
| `lightmapSlot` | `dynamic` | — | Value forwarded as `lightmapSlot` to `mq3.platform.playable_multitexture.drawNative`. |
| `a` | `dynamic` | — | Record providing `a.x`, `a.y`, `a.depth`. |
| `baseA` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapA` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightA` | `dynamic` | — | Value forwarded as `light0` to `mq3.platform.playable_multitexture.drawNative`. |
| `b` | `dynamic` | — | Record providing `b.x`, `b.y`, `b.depth`. |
| `baseB` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapB` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightB` | `dynamic` | — | Value forwarded as `light1` to `mq3.platform.playable_multitexture.drawNative`. |
| `c` | `dynamic` | — | Record providing `c.x`, `c.y`, `c.depth`. |
| `baseC` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapC` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightC` | `dynamic` | — | Value forwarded as `light2` to `mq3.platform.playable_multitexture.drawNative`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_multitexture.drawNative`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_multitexture.drawNative`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_multitexture.drawNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L128)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-drawnative-extern-function-drawnative-baseslot-as-i32-lightmapslot-as-i32-x0-as-double-y0-as-double-depth0-as-double-u0-as-double-v0-as-double-lu0-as-double-lv0-as-double-light0-as-double-x1-as-double-y1-as-double-depth1-as-double-u1-as-double-v1-as-double-lu1-as-double-lv1-as-double-light1-as-double-x2-as-double-y2-as-double-depth2-as-double-u2-as-double-v2-as-double-lu2-as-double-lv2-as-double-light2-as-double-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-multitexture-returns-void-src-mq3-platform-playable-multitexture-ml-728383780"></a>
### drawNative

```ml
extern function drawNative(baseSlot as i32, lightmapSlot as i32, x0 as double, y0 as double, depth0 as double, u0 as double, v0 as double, lu0 as double, lv0 as double, light0 as double, x1 as double, y1 as double, depth1 as double, u1 as double, v1 as double, lu1 as double, lv1 as double, light1 as double, x2 as double, y2 as double, depth2 as double, u2 as double, v2 as double, lu2 as double, lv2 as double, light2 as double, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_multitexture" returns void
```

Draws one triangle with separate base-texture and lightmap coordinates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseSlot` | `i32` | — | Texture slot for the base material. |
| `lightmapSlot` | `i32` | — | Texture slot for the lightmap. |
| `x0` | `double` | — | X coordinate for vertex 0. |
| `y0` | `double` | — | Y coordinate for vertex 0. |
| `depth0` | `double` | — | Depth for vertex 0. |
| `u0` | `double` | — | U texture coordinate for vertex 0. |
| `v0` | `double` | — | V texture coordinate for vertex 0. |
| `lu0` | `double` | — | U lightmap coordinate for vertex 0. |
| `lv0` | `double` | — | V lightmap coordinate for vertex 0. |
| `light0` | `double` | — | Light intensity for vertex 0. |
| `x1` | `double` | — | X coordinate for vertex 1. |
| `y1` | `double` | — | Y coordinate for vertex 1. |
| `depth1` | `double` | — | Depth for vertex 1. |
| `u1` | `double` | — | U texture coordinate for vertex 1. |
| `v1` | `double` | — | V texture coordinate for vertex 1. |
| `lu1` | `double` | — | U lightmap coordinate for vertex 1. |
| `lv1` | `double` | — | V lightmap coordinate for vertex 1. |
| `light1` | `double` | — | Light intensity for vertex 1. |
| `x2` | `double` | — | X coordinate for vertex 2. |
| `y2` | `double` | — | Y coordinate for vertex 2. |
| `depth2` | `double` | — | Depth for vertex 2. |
| `u2` | `double` | — | U texture coordinate for vertex 2. |
| `v2` | `double` | — | V texture coordinate for vertex 2. |
| `lu2` | `double` | — | U lightmap coordinate for vertex 2. |
| `lv2` | `double` | — | V lightmap coordinate for vertex 2. |
| `light2` | `double` | — | Light intensity for vertex 2. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L35)

<a id="function-function-mq3-platform-playable-multitexture-glblend-function-glblend-srcfactor-dstfactor-src-mq3-platform-playable-multitexture-ml-1058336815"></a>
### glBlend

```ml
function glBlend(srcFactor, dstFactor)
```

Computes `BLEND_GL_STATE|srcFactor|dstFactor` for `mq3.platform.playable_multitexture.glBlend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `srcFactor` | `dynamic` | — | Input used in the result expression `BLEND_GL_STATE\|srcFactor\|dstFactor`. |
| `dstFactor` | `dynamic` | — | Input used in the result expression `BLEND_GL_STATE\|srcFactor\|dstFactor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L85)

<a id="function-function-mq3-platform-playable-multitexture-setalphatest-function-setalphatest-mode-src-mq3-platform-playable-multitexture-ml-2030045335"></a>
### setAlphaTest

```ml
function setAlphaTest(mode)
```

Returns `void` from `mq3.platform.playable_multitexture.setAlphaTest`; earlier branches return `error(7488,"invalid preview alpha-test state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.platform.playable_multitexture.setAlphaTestNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L89)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-setalphatestnative-extern-function-setalphatestnative-mode-as-i32-from-playable-window-dll-symbol-playable-window-set-alpha-test-returns-i32-src-mq3-platform-playable-multitexture-ml-1327730526"></a>
### setAlphaTestNative

```ml
extern function setAlphaTestNative(mode as i32) from "playable_window.dll" symbol "playable_window_set_alpha_test" returns i32
```

Selects the native alpha-test mode used by subsequent primitives.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `i32` | — | 0 disables alpha testing; 1 tests >0, 2 tests <128, and 3 tests >=128. |


**Returns:** 1 when the alpha-test mode is accepted; 0 for an invalid mode.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L45)

<a id="function-function-mq3-platform-playable-multitexture-setpolygonoffset-function-setpolygonoffset-enabled-src-mq3-platform-playable-multitexture-ml-200959405"></a>
### setPolygonOffset

```ml
function setPolygonOffset(enabled)
```

Returns `void` from `mq3.platform.playable_multitexture.setPolygonOffset`; earlier branches return `error(7488,"invalid preview polygon-offset state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — | Input tested by `enabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L104)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-setpolygonoffsetnative-extern-function-setpolygonoffsetnative-enabled-as-i32-from-playable-window-dll-symbol-playable-window-set-polygon-offset-returns-i32-src-mq3-platform-playable-multitexture-ml-1985161575"></a>
### setPolygonOffsetNative

```ml
extern function setPolygonOffsetNative(enabled as i32) from "playable_window.dll" symbol "playable_window_set_polygon_offset" returns i32
```

Enables or disables polygon offset for native depth rendering.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — | Nonzero enables the requested native feature. |


**Returns:** 1 when the polygon-offset request is accepted; 0 for invalid input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L53)

<a id="function-function-mq3-platform-playable-multitexture-setstate-function-setstate-blendmode-depthequal-depthwrite-src-mq3-platform-playable-multitexture-ml-2031656859"></a>
### setState

```ml
function setState(blendMode, depthEqual, depthWrite)
```

Converts depth flags to native integers and applies the blend/depth raster state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `blendMode` | `dynamic` | — | Value forwarded as `blendMode` to `mq3.platform.playable_multitexture.setStateNative`. |
| `depthEqual` | `dynamic` | — | Input tested by `depthEqual`. |
| `depthWrite` | `dynamic` | — | Input tested by `depthWrite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L75)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-setstatenative-extern-function-setstatenative-blendmode-as-i32-depthequal-as-i32-depthwrite-as-i32-from-playable-window-dll-symbol-playable-window-set-raster-state-returns-i32-src-mq3-platform-playable-multitexture-ml-1811046"></a>
### setStateNative

```ml
extern function setStateNative(blendMode as i32, depthEqual as i32, depthWrite as i32) from "playable_window.dll" symbol "playable_window_set_raster_state" returns i32
```

Applies native blending, equal-depth testing, and depth-write settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `blendMode` | `i32` | — | Preview blend-mode constant or encoded generic source/destination blend factors. |
| `depthEqual` | `i32` | — | 0 for the normal depth comparison; 1 for the equal-depth pass. |
| `depthWrite` | `i32` | — | 1 enables depth writes; 0 disables them. |


**Returns:** 1 when the raster state is accepted; 0 for invalid settings.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L41)

<a id="function-function-mq3-platform-playable-multitexture-settextureclamp-function-settextureclamp-enabled-src-mq3-platform-playable-multitexture-ml-907514441"></a>
### setTextureClamp

```ml
function setTextureClamp(enabled)
```

Returns `void` from `mq3.platform.playable_multitexture.setTextureClamp`; earlier branches return `error(7488,"invalid preview texture clamp state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — | Input tested by `enabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L96)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-settextureclampnative-extern-function-settextureclampnative-enabled-as-i32-from-playable-window-dll-symbol-playable-window-set-texture-clamp-returns-i32-src-mq3-platform-playable-multitexture-ml-295747140"></a>
### setTextureClampNative

```ml
extern function setTextureClampNative(enabled as i32) from "playable_window.dll" symbol "playable_window_set_texture_clamp" returns i32
```

Selects clamp-to-edge versus repeating texture coordinates for native drawing.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — | Nonzero enables the requested native feature. |


**Returns:** 1 when the clamp mode is accepted; 0 for an invalid mode.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_multitexture.ml#L49)
