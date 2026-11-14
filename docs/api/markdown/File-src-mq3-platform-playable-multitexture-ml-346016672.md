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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L25)

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-gt0-const-alpha-test-gt0-1-src-mq3-platform-playable-multitexture-ml-1342109998"></a>
### ALPHA_TEST_GT0

```ml
const ALPHA_TEST_GT0 = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L23)

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-lt128-const-alpha-test-lt128-2-src-mq3-platform-playable-multitexture-ml-1619107939"></a>
### ALPHA_TEST_LT128

```ml
const ALPHA_TEST_LT128 = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L24)

<a id="constant-constant-mq3-platform-playable-multitexture-alpha-test-none-const-alpha-test-none-0-src-mq3-platform-playable-multitexture-ml-1497700613"></a>
### ALPHA_TEST_NONE

```ml
const ALPHA_TEST_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L22)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-add-const-blend-add-2-src-mq3-platform-playable-multitexture-ml-498732635"></a>
### BLEND_ADD

```ml
const BLEND_ADD = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L13)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-alpha-const-blend-alpha-1-src-mq3-platform-playable-multitexture-ml-691660838"></a>
### BLEND_ALPHA

```ml
const BLEND_ALPHA = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L12)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-dst-color-one-minus-dst-alpha-const-blend-dst-color-one-minus-dst-alpha-4-src-mq3-platform-playable-multitexture-ml-1221903261"></a>
### BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA

```ml
const BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L15)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-dynamic-light-const-blend-dynamic-light-5-src-mq3-platform-playable-multitexture-ml-1040163734"></a>
### BLEND_DYNAMIC_LIGHT

```ml
const BLEND_DYNAMIC_LIGHT = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L16)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-filter-const-blend-filter-3-src-mq3-platform-playable-multitexture-ml-1999902322"></a>
### BLEND_FILTER

```ml
const BLEND_FILTER = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L14)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-gl-state-const-blend-gl-state-256-src-mq3-platform-playable-multitexture-ml-2082211992"></a>
### BLEND_GL_STATE

```ml
const BLEND_GL_STATE = 256
```

Generic OpenGL blend state.  Low nibble is GLS_SRCBLEND_*, high nibble is GLS_DSTBLEND_* and bit 8 distinguishes it from the optimized legacy modes.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L21)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-mark-const-blend-mark-6-src-mq3-platform-playable-multitexture-ml-39465539"></a>
### BLEND_MARK

```ml
const BLEND_MARK = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L17)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-opaque-const-blend-opaque-0-src-mq3-platform-playable-multitexture-ml-1101995713"></a>
### BLEND_OPAQUE

```ml
const BLEND_OPAQUE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L11)

<a id="constant-constant-mq3-platform-playable-multitexture-blend-premultiplied-alpha-const-blend-premultiplied-alpha-7-src-mq3-platform-playable-multitexture-ml-1817005580"></a>
### BLEND_PREMULTIPLIED_ALPHA

```ml
const BLEND_PREMULTIPLIED_ALPHA = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L18)

<a id="function-function-mq3-platform-playable-multitexture-draw-function-draw-baseslot-lightmapslot-a-basea-lightmapa-lighta-b-baseb-lightmapb-lightb-c-basec-lightmapc-lightc-red-green-blue-src-mq3-platform-playable-multitexture-ml-1697416720"></a>
### draw

```ml
function draw(baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, b, baseB, lightmapB, lightB, c, baseC, lightmapC, lightC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseSlot` | `dynamic` | — |  |
| `lightmapSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `baseA` | `dynamic` | — |  |
| `lightmapA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `baseB` | `dynamic` | — |  |
| `lightmapB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `baseC` | `dynamic` | — |  |
| `lightmapC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L53)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-drawnative-extern-function-drawnative-baseslot-as-i32-lightmapslot-as-i32-x0-as-double-y0-as-double-depth0-as-double-u0-as-double-v0-as-double-lu0-as-double-lv0-as-double-light0-as-double-x1-as-double-y1-as-double-depth1-as-double-u1-as-double-v1-as-double-lu1-as-double-lv1-as-double-light1-as-double-x2-as-double-y2-as-double-depth2-as-double-u2-as-double-v2-as-double-lu2-as-double-lv2-as-double-light2-as-double-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-multitexture-returns-void-src-mq3-platform-playable-multitexture-ml-728383780"></a>
### drawNative

```ml
extern function drawNative(baseSlot as i32, lightmapSlot as i32, x0 as double, y0 as double, depth0 as double, u0 as double, v0 as double, lu0 as double, lv0 as double, light0 as double, x1 as double, y1 as double, depth1 as double, u1 as double, v1 as double, lu1 as double, lv1 as double, light1 as double, x2 as double, y2 as double, depth2 as double, u2 as double, v2 as double, lu2 as double, lv2 as double, light2 as double, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_multitexture" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseSlot` | `i32` | — |  |
| `lightmapSlot` | `i32` | — |  |
| `x0` | `double` | — |  |
| `y0` | `double` | — |  |
| `depth0` | `double` | — |  |
| `u0` | `double` | — |  |
| `v0` | `double` | — |  |
| `lu0` | `double` | — |  |
| `lv0` | `double` | — |  |
| `light0` | `double` | — |  |
| `x1` | `double` | — |  |
| `y1` | `double` | — |  |
| `depth1` | `double` | — |  |
| `u1` | `double` | — |  |
| `v1` | `double` | — |  |
| `lu1` | `double` | — |  |
| `lv1` | `double` | — |  |
| `light1` | `double` | — |  |
| `x2` | `double` | — |  |
| `y2` | `double` | — |  |
| `depth2` | `double` | — |  |
| `u2` | `double` | — |  |
| `v2` | `double` | — |  |
| `lu2` | `double` | — |  |
| `lv2` | `double` | — |  |
| `light2` | `double` | — |  |
| `red` | `i32` | — |  |
| `green` | `i32` | — |  |
| `blue` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L5)

<a id="function-function-mq3-platform-playable-multitexture-glblend-function-glblend-srcfactor-dstfactor-src-mq3-platform-playable-multitexture-ml-1058336815"></a>
### glBlend

```ml
function glBlend(srcFactor, dstFactor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `srcFactor` | `dynamic` | — |  |
| `dstFactor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L34)

<a id="function-function-mq3-platform-playable-multitexture-setalphatest-function-setalphatest-mode-src-mq3-platform-playable-multitexture-ml-2030045335"></a>
### setAlphaTest

```ml
function setAlphaTest(mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L36)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-setalphatestnative-extern-function-setalphatestnative-mode-as-i32-from-playable-window-dll-symbol-playable-window-set-alpha-test-returns-i32-src-mq3-platform-playable-multitexture-ml-1327730526"></a>
### setAlphaTestNative

```ml
extern function setAlphaTestNative(mode as i32) from "playable_window.dll" symbol "playable_window_set_alpha_test" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L7)

<a id="function-function-mq3-platform-playable-multitexture-setpolygonoffset-function-setpolygonoffset-enabled-src-mq3-platform-playable-multitexture-ml-200959405"></a>
### setPolygonOffset

```ml
function setPolygonOffset(enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L47)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-setpolygonoffsetnative-extern-function-setpolygonoffsetnative-enabled-as-i32-from-playable-window-dll-symbol-playable-window-set-polygon-offset-returns-i32-src-mq3-platform-playable-multitexture-ml-1985161575"></a>
### setPolygonOffsetNative

```ml
extern function setPolygonOffsetNative(enabled as i32) from "playable_window.dll" symbol "playable_window_set_polygon_offset" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L9)

<a id="function-function-mq3-platform-playable-multitexture-setstate-function-setstate-blendmode-depthequal-depthwrite-src-mq3-platform-playable-multitexture-ml-2031656859"></a>
### setState

```ml
function setState(blendMode, depthEqual, depthWrite)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `blendMode` | `dynamic` | — |  |
| `depthEqual` | `dynamic` | — |  |
| `depthWrite` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L27)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-setstatenative-extern-function-setstatenative-blendmode-as-i32-depthequal-as-i32-depthwrite-as-i32-from-playable-window-dll-symbol-playable-window-set-raster-state-returns-i32-src-mq3-platform-playable-multitexture-ml-1811046"></a>
### setStateNative

```ml
extern function setStateNative(blendMode as i32, depthEqual as i32, depthWrite as i32) from "playable_window.dll" symbol "playable_window_set_raster_state" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `blendMode` | `i32` | — |  |
| `depthEqual` | `i32` | — |  |
| `depthWrite` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L6)

<a id="function-function-mq3-platform-playable-multitexture-settextureclamp-function-settextureclamp-enabled-src-mq3-platform-playable-multitexture-ml-907514441"></a>
### setTextureClamp

```ml
function setTextureClamp(enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L41)

<a id="extern_function-extern-function-mq3-platform-playable-multitexture-settextureclampnative-extern-function-settextureclampnative-enabled-as-i32-from-playable-window-dll-symbol-playable-window-set-texture-clamp-returns-i32-src-mq3-platform-playable-multitexture-ml-295747140"></a>
### setTextureClampNative

```ml
extern function setTextureClampNative(enabled as i32) from "playable_window.dll" symbol "playable_window_set_texture_clamp" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_multitexture.ml#L8)
