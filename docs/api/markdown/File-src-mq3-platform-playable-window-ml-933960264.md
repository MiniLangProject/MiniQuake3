# `src/mq3/platform/playable_window.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.playable_window`](Package-mq3-platform-playable-window-1147702748.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-platform-playable-window-appendscreenquad-function-appendscreenquad-batch-textureslot-positions-texcoords-color-src-mq3-platform-playable-window-ml-866657007"></a>
### appendScreenQuad

```ml
function appendScreenQuad(batch, textureSlot, positions, texCoords, color)
```

Updates `batch.count` in `mq3.platform.playable_window.appendScreenQuad`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.count`. |
| `textureSlot` | `dynamic` | — | Value forwarded as `textureSlot` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `positions` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `texCoords` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1001)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetriangle-function-appendsingletexturetriangle-batch-textureslot-a-uva-lighta-b-uvb-lightb-c-uvc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-1421759216"></a>
### appendSingleTextureTriangle

```ml
function appendSingleTextureTriangle(batch, textureSlot, a, uvA, lightA, b, uvB, lightB, c, uvC, lightC, red, green, blue)
```

Computes `appendSingleTextureTriangle` from `appendTriangleBatch(batch,textureSlot,-1,a,uvA,zero,lightA,b,uvB,zero,lightB,c,uvC,zero,lightC,red,green,blue)` using `mq3.platform.playable_window.appendTriangleBatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `textureSlot` | `dynamic` | — | Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `a` | `dynamic` | — | Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `uvA` | `dynamic` | — | Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `lightA` | `dynamic` | — | Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `uvB` | `dynamic` | — | Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `lightB` | `dynamic` | — | Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `c` | `dynamic` | — | Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `uvC` | `dynamic` | — | Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `lightC` | `dynamic` | — | Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatch`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1246)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetrianglecolored-function-appendsingletexturetrianglecolored-batch-textureslot-a-uva-lighta-colora-b-uvb-lightb-colorb-c-uvc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-421342993"></a>
### appendSingleTextureTriangleColored

```ml
function appendSingleTextureTriangleColored(batch, textureSlot, a, uvA, lightA, colorA, b, uvB, lightB, colorB, c, uvC, lightC, colorC, red, green, blue)
```

Appends a colored projected triangle without a lightmap stage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `textureSlot` | `dynamic` | — | Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `a` | `dynamic` | — | Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `uvA` | `dynamic` | — | Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightA` | `dynamic` | — | Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `colorA` | `dynamic` | — | Value forwarded as `colorA` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `uvB` | `dynamic` | — | Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightB` | `dynamic` | — | Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `colorB` | `dynamic` | — | Value forwarded as `colorB` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `c` | `dynamic` | — | Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `uvC` | `dynamic` | — | Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightC` | `dynamic` | — | Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `colorC` | `dynamic` | — | Value forwarded as `colorC` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatchColored`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1189)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetriangleposition-function-appendsingletexturetriangleposition-batch-textureslot-a-uva-lighta-b-uvb-lightb-c-uvc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-1405207142"></a>
### appendSingleTextureTrianglePosition

```ml
function appendSingleTextureTrianglePosition(batch, textureSlot, a, uvA, lightA, b, uvB, lightB, c, uvC, lightC, red, green, blue)
```

Appends a world-position triangle using opaque white vertex colors and one texture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `textureSlot` | `dynamic` | — | Value forwarded as `textureSlot` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `a` | `dynamic` | — | Value forwarded as `a` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `uvA` | `dynamic` | — | Value forwarded as `uvA` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `lightA` | `dynamic` | — | Value forwarded as `lightA` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `uvB` | `dynamic` | — | Value forwarded as `uvB` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `lightB` | `dynamic` | — | Value forwarded as `lightB` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `c` | `dynamic` | — | Value forwarded as `c` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `uvC` | `dynamic` | — | Value forwarded as `uvC` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `lightC` | `dynamic` | — | Value forwarded as `lightC` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1228)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetrianglepositioncolored-function-appendsingletexturetrianglepositioncolored-batch-textureslot-a-uva-lighta-colora-b-uvb-lightb-colorb-c-uvc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-1766193841"></a>
### appendSingleTextureTrianglePositionColored

```ml
function appendSingleTextureTrianglePositionColored(batch, textureSlot, a, uvA, lightA, colorA, b, uvB, lightB, colorB, c, uvC, lightC, colorC, red, green, blue)
```

Appends a colored world-position triangle without a lightmap stage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `textureSlot` | `dynamic` | — | Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `a` | `dynamic` | — | Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `uvA` | `dynamic` | — | Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `lightA` | `dynamic` | — | Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `colorA` | `dynamic` | — | Value forwarded as `colorA` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `uvB` | `dynamic` | — | Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `lightB` | `dynamic` | — | Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `colorB` | `dynamic` | — | Value forwarded as `colorB` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `c` | `dynamic` | — | Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `uvC` | `dynamic` | — | Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `lightC` | `dynamic` | — | Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `colorC` | `dynamic` | — | Value forwarded as `colorC` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1210)

<a id="function-function-mq3-platform-playable-window-appendtrianglebatch-function-appendtrianglebatch-batch-baseslot-lightmapslot-a-basea-lightmapa-lighta-b-baseb-lightmapb-lightb-c-basec-lightmapc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-1178100572"></a>
### appendTriangleBatch

```ml
function appendTriangleBatch(batch, baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, b, baseB, lightmapB, lightB, c, baseC, lightmapC, lightC, red, green, blue)
```

Appends a base/lightmap triangle using opaque white per-vertex colors and the supplied light values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `baseSlot` | `dynamic` | — | Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightmapSlot` | `dynamic` | — | Value forwarded as `lightmapSlot` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `a` | `dynamic` | — | Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `baseA` | `dynamic` | — | Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightmapA` | `dynamic` | — | Value forwarded as `lightmapA` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightA` | `dynamic` | — | Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `baseB` | `dynamic` | — | Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightmapB` | `dynamic` | — | Value forwarded as `lightmapB` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightB` | `dynamic` | — | Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `c` | `dynamic` | — | Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `baseC` | `dynamic` | — | Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightmapC` | `dynamic` | — | Value forwarded as `lightmapC` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `lightC` | `dynamic` | — | Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatchColored`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatchColored`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1168)

<a id="function-function-mq3-platform-playable-window-appendtrianglebatchcolored-function-appendtrianglebatchcolored-batch-baseslot-lightmapslot-a-basea-lightmapa-lighta-colora-b-baseb-lightmapb-lightb-colorb-c-basec-lightmapc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-2108897305"></a>
### appendTriangleBatchColored

```ml
function appendTriangleBatchColored(batch, baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, colorA, b, baseB, lightmapB, lightB, colorB, c, baseC, lightmapC, lightC, colorC, red, green, blue)
```

Updates `batch.count` in `mq3.platform.playable_window.appendTriangleBatchColored`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.count`. |
| `baseSlot` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`. |
| `lightmapSlot` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`. |
| `a` | `dynamic` | — | Value forwarded as `point` to `mq3.platform.playable_window.writeBatchVertex`. |
| `baseA` | `dynamic` | — | Value forwarded as `baseUV` to `mq3.platform.playable_window.writeBatchVertex`. |
| `lightmapA` | `dynamic` | — | Value forwarded as `lightmapUV` to `mq3.platform.playable_window.writeBatchVertex`. |
| `lightA` | `dynamic` | — | Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertex`. |
| `colorA` | `dynamic` | — | Value forwarded as `color` to `mq3.platform.playable_window.writeBatchColor`. |
| `b` | `dynamic` | — | Value forwarded as `point` to `mq3.platform.playable_window.writeBatchVertex`. |
| `baseB` | `dynamic` | — | Value forwarded as `baseUV` to `mq3.platform.playable_window.writeBatchVertex`. |
| `lightmapB` | `dynamic` | — | Value forwarded as `lightmapUV` to `mq3.platform.playable_window.writeBatchVertex`. |
| `lightB` | `dynamic` | — | Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertex`. |
| `colorB` | `dynamic` | — | Value forwarded as `color` to `mq3.platform.playable_window.writeBatchColor`. |
| `c` | `dynamic` | — | Value forwarded as `point` to `mq3.platform.playable_window.writeBatchVertex`. |
| `baseC` | `dynamic` | — | Value forwarded as `baseUV` to `mq3.platform.playable_window.writeBatchVertex`. |
| `lightmapC` | `dynamic` | — | Value forwarded as `lightmapUV` to `mq3.platform.playable_window.writeBatchVertex`. |
| `lightC` | `dynamic` | — | Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertex`. |
| `colorC` | `dynamic` | — | Value forwarded as `color` to `mq3.platform.playable_window.writeBatchColor`. |
| `red` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`. |
| `green` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`. |
| `blue` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1109)

<a id="function-function-mq3-platform-playable-window-appendtrianglebatchpositioncolored-function-appendtrianglebatchpositioncolored-batch-baseslot-lightmapslot-a-basea-lightmapa-lighta-colora-b-baseb-lightmapb-lightb-colorb-c-basec-lightmapc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-1435171049"></a>
### appendTriangleBatchPositionColored

```ml
function appendTriangleBatchPositionColored(batch, baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, colorA, b, baseB, lightmapB, lightB, colorB, c, baseC, lightmapC, lightC, colorC, red, green, blue)
```

Updates `batch.count` in `mq3.platform.playable_window.appendTriangleBatchPositionColored`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.count`. |
| `baseSlot` | `dynamic` | — | Value forwarded as `baseSlot` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `lightmapSlot` | `dynamic` | — | Value forwarded as `lightmapSlot` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `baseA` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapA` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightA` | `dynamic` | — | Value forwarded as `light0` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `colorA` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `baseB` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapB` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightB` | `dynamic` | — | Value forwarded as `light1` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `colorB` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `c` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `baseC` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapC` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightC` | `dynamic` | — | Value forwarded as `light2` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `colorC` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.writePositionTriangleNative`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.writePositionTriangleNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1140)

<a id="function-function-mq3-platform-playable-window-beginframe-function-beginframe-red-green-blue-src-mq3-platform-playable-window-ml-956363996"></a>
### beginFrame

```ml
function beginFrame(red, green, blue)
```

Returns `void` from `mq3.platform.playable_window.beginFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.beginNative`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.beginNative`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.beginNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L860)

<a id="extern_function-extern-function-mq3-platform-playable-window-beginnative-extern-function-beginnative-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-begin-frame-returns-void-src-mq3-platform-playable-window-ml-661196612"></a>
### beginNative

```ml
extern function beginNative(red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_begin_frame" returns void
```

Starts a native frame using the supplied RGB clear color.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L295)

<a id="function-function-mq3-platform-playable-window-cleardepth-function-cleardepth-depth-src-mq3-platform-playable-window-ml-1176117361"></a>
### clearDepth

```ml
function clearDepth(depth)
```

Returns `void` from `mq3.platform.playable_window.clearDepth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `dynamic` | — | Value forwarded as `depth` to `mq3.platform.playable_window.clearDepthNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L880)

<a id="extern_function-extern-function-mq3-platform-playable-window-cleardepthnative-extern-function-cleardepthnative-depth-as-double-from-playable-window-dll-symbol-playable-window-clear-depth-returns-void-src-mq3-platform-playable-window-ml-1792671676"></a>
### clearDepthNative

```ml
extern function clearDepthNative(depth as double) from "playable_window.dll" symbol "playable_window_clear_depth" returns void
```

Clears native depth storage to the supplied depth value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `double` | — | Depth value used to reset native depth storage. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L314)

<a id="function-function-mq3-platform-playable-window-clearstencil-function-clearstencil-area-src-mq3-platform-playable-window-ml-1367628373"></a>
### clearStencil

```ml
function clearStencil(area)
```

Computes `clearStencilNative(area.x,area.y,area.width,area.height)!=0` for `mq3.platform.playable_window.clearStencil`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `area` | `dynamic` | — | Record providing `area.x`, `area.y`, `area.width`, `area.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L891)

<a id="extern_function-extern-function-mq3-platform-playable-window-clearstencilnative-extern-function-clearstencilnative-x-as-i32-y-as-i32-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-clear-stencil-returns-i32-src-mq3-platform-playable-window-ml-1010906373"></a>
### clearStencilNative

```ml
extern function clearStencilNative(x as i32, y as i32, width as i32, height as i32) from "playable_window.dll" symbol "playable_window_clear_stencil" returns i32
```

Clears stencil coverage inside the specified viewport rectangle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `i32` | — | X component of the position. |
| `y` | `i32` | — | Y component of the position. |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |


**Returns:** 1 when the clear request is accepted; 0 for invalid state or bounds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L331)

<a id="function-function-mq3-platform-playable-window-configurejoystick-function-configurejoystick-enabled-threshold-ballscale-src-mq3-platform-playable-window-ml-298514001"></a>
### configureJoystick

```ml
function configureJoystick(enabled, threshold, ballScale)
```

Computes `configureJoystick` from `joystickConfigureNative(value,threshold,ballScale)!=0` using `mq3.platform.playable_window.joystickConfigureNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — | Input tested by `enabled`. |
| `threshold` | `dynamic` | — | Value forwarded as `threshold` to `mq3.platform.playable_window.joystickConfigureNative`. |
| `ballScale` | `dynamic` | — | Value forwarded as `ballScale` to `mq3.platform.playable_window.joystickConfigureNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L814)

<a id="function-function-mq3-platform-playable-window-configuremidi-function-configuremidi-enabled-device-channel-src-mq3-platform-playable-window-ml-1590219138"></a>
### configureMidi

```ml
function configureMidi(enabled, device, channel)
```

Returns `midiConfigureNative(value,device,channel)!=0` from `mq3.platform.playable_window.configureMidi`; earlier branches return `error(7492,"MIDI device or channel is invalid")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — | Input tested by `enabled`. |
| `device` | `dynamic` | — | Value forwarded as `device` to `mq3.platform.playable_window.midiConfigureNative`. |
| `channel` | `dynamic` | — | Value forwarded as `channel` to `mq3.platform.playable_window.midiConfigureNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L826)

<a id="extern_function-extern-function-mq3-platform-playable-window-create-extern-function-create-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-create-returns-i32-src-mq3-platform-playable-window-ml-139752994"></a>
### create

```ml
extern function create(width as i32, height as i32) from "playable_window.dll" symbol "playable_window_create" returns i32
```

Creates the preview surface, starts its Win32 UI thread, and attempts OpenGL initialization.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |


**Returns:** 1 when a window exists or creation succeeds; 0 on window/surface setup failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L11)

<a id="function-function-mq3-platform-playable-window-createtrianglebatch-function-createtrianglebatch-capacity-src-mq3-platform-playable-window-ml-507097746"></a>
### createTriangleBatch

```ml
function createTriangleBatch(capacity)
```

Builds `mq3.platform.playable_window.TriangleBatch` for `mq3.platform.playable_window.createTriangleBatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Initial value for `mq3.platform.playable_window.TriangleBatch.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L988)

<a id="function-function-mq3-platform-playable-window-currentdirectory-function-currentdirectory-src-mq3-platform-playable-window-ml-1960591630"></a>
### currentDirectory

```ml
function currentDirectory()
```

Returns `decode(slice(data,0,count))` from `mq3.platform.playable_window.currentDirectory`; earlier branches return `""`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L851)

<a id="extern_function-extern-function-mq3-platform-playable-window-currentdirectorynative-extern-function-currentdirectorynative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-system-current-directory-returns-i32-src-mq3-platform-playable-window-ml-895469215"></a>
### currentDirectoryNative

```ml
extern function currentDirectoryNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_system_current_directory" returns i32
```

Copies the process working directory as UTF-8 into caller-owned storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable NUL-terminated UTF-8 destination. |
| `capacity` | `i32` | — | Destination capacity in bytes, including its terminator. |


**Returns:** UTF-8 length from the native conversion helper, or 0 when the directory cannot be obtained.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L254)

<a id="function-function-mq3-platform-playable-window-currentuser-function-currentuser-src-mq3-platform-playable-window-ml-1530007242"></a>
### currentUser

```ml
function currentUser()
```

Returns `decode(slice(data,0,count))` from `mq3.platform.playable_window.currentUser`; earlier branches return `"player"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L849)

<a id="extern_function-extern-function-mq3-platform-playable-window-currentusernative-extern-function-currentusernative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-system-current-user-returns-i32-src-mq3-platform-playable-window-ml-949748037"></a>
### currentUserNative

```ml
extern function currentUserNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_system_current_user" returns i32
```

Copies the current Windows user name as UTF-8 into caller-owned storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable NUL-terminated UTF-8 destination. |
| `capacity` | `i32` | — | Destination capacity in bytes, including its terminator. |


**Returns:** UTF-8 length from the native conversion helper, or 0 when the name cannot be obtained.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L249)

<a id="function-function-mq3-platform-playable-window-decodeinputevent-function-decodeinputevent-data-src-mq3-platform-playable-window-ml-141507170"></a>
### decodeInputEvent

```ml
function decodeInputEvent(data)
```

Builds `mq3.platform.playable_window.InputEvent` for `mq3.platform.playable_window.decodeInputEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L789)

- [mq3.platform.playable_window.DisplayMode](Type-mq3-platform-playable-window-displaymode-2000521863.md) — struct
<a id="function-function-mq3-platform-playable-window-drawline-function-drawline-a-b-red-green-blue-src-mq3-platform-playable-window-ml-242342777"></a>
### drawLine

```ml
function drawLine(a, b, red, green, blue)
```

Returns `void` from `mq3.platform.playable_window.drawLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.x`, `a.y`. |
| `b` | `dynamic` | — | Record providing `b.x`, `b.y`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.lineNative`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.lineNative`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.lineNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L867)

<a id="function-function-mq3-platform-playable-window-drawtriangle-function-drawtriangle-textureslot-a-uva-lighta-b-uvb-lightb-c-uvc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-182816578"></a>
### drawTriangle

```ml
function drawTriangle(textureSlot, a, uvA, lightA, b, uvB, lightB, c, uvC, lightC, red, green, blue)
```

Returns `void` from `mq3.platform.playable_window.drawTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `dynamic` | — | Value forwarded as `textureSlot` to `mq3.platform.playable_window.triangleNative`. |
| `a` | `dynamic` | — | Record providing `a.x`, `a.y`, `a.depth`. |
| `uvA` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightA` | `dynamic` | — | Value forwarded as `light0` to `mq3.platform.playable_window.triangleNative`. |
| `b` | `dynamic` | — | Record providing `b.x`, `b.y`, `b.depth`. |
| `uvB` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightB` | `dynamic` | — | Value forwarded as `light1` to `mq3.platform.playable_window.triangleNative`. |
| `c` | `dynamic` | — | Record providing `c.x`, `c.y`, `c.depth`. |
| `uvC` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightC` | `dynamic` | — | Value forwarded as `light2` to `mq3.platform.playable_window.triangleNative`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.triangleNative`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.triangleNative`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.triangleNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L963)

<a id="function-function-mq3-platform-playable-window-drawtrianglecolored-function-drawtrianglecolored-textureslot-a-uva-colora-b-uvb-colorb-c-uvc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-2031714553"></a>
### drawTriangleColored

```ml
function drawTriangleColored(textureSlot, a, uvA, colorA, b, uvB, colorB, c, uvC, colorC, red, green, blue)
```

Submits a textured screen triangle with independent RGBA values at all three vertices.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `dynamic` | — | Value forwarded as `textureSlot` to `mq3.platform.playable_window.triangleColoredNative`. |
| `a` | `dynamic` | — | Record providing `a.x`, `a.y`, `a.depth`. |
| `uvA` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `colorA` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `b` | `dynamic` | — | Record providing `b.x`, `b.y`, `b.depth`. |
| `uvB` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `colorB` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `c` | `dynamic` | — | Record providing `c.x`, `c.y`, `c.depth`. |
| `uvC` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `colorC` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.playable_window.triangleColoredNative`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.playable_window.triangleColoredNative`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.playable_window.triangleColoredNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L981)

<a id="function-function-mq3-platform-playable-window-endframe-function-endframe-src-mq3-platform-playable-window-ml-1385904682"></a>
### endFrame

```ml
function endFrame()
```

Returns `void` from `mq3.platform.playable_window.endFrame`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L875)

<a id="function-function-mq3-platform-playable-window-executabledirectory-function-executabledirectory-src-mq3-platform-playable-window-ml-1985665692"></a>
### executableDirectory

```ml
function executableDirectory()
```

Returns `decode(slice(data,0,count))` from `mq3.platform.playable_window.executableDirectory`; earlier branches return `""`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L853)

<a id="extern_function-extern-function-mq3-platform-playable-window-executabledirectorynative-extern-function-executabledirectorynative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-system-executable-directory-returns-i32-src-mq3-platform-playable-window-ml-532801474"></a>
### executableDirectoryNative

```ml
extern function executableDirectoryNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_system_executable_directory" returns i32
```

Copies the executable's parent directory as UTF-8 into caller-owned storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable NUL-terminated UTF-8 destination. |
| `capacity` | `i32` | — | Destination capacity in bytes, including its terminator. |


**Returns:** UTF-8 length from the native conversion helper, or 0 when the path cannot be obtained.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L259)

<a id="function-function-mq3-platform-playable-window-finishstencilshadow-function-finishstencilshadow-area-src-mq3-platform-playable-window-ml-1231361199"></a>
### finishStencilShadow

```ml
function finishStencilShadow(area)
```

Calls `mq3.platform.playable_window.finishStencilShadowNative` with `(area.x,area.y,area.width,area.height)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `area` | `dynamic` | — | Record providing `area.x`, `area.y`, `area.width`, `area.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L897)

<a id="extern_function-extern-function-mq3-platform-playable-window-finishstencilshadownative-extern-function-finishstencilshadownative-x-as-i32-y-as-i32-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-finish-stencil-shadow-returns-i32-src-mq3-platform-playable-window-ml-852367844"></a>
### finishStencilShadowNative

```ml
extern function finishStencilShadowNative(x as i32, y as i32, width as i32, height as i32) from "playable_window.dll" symbol "playable_window_finish_stencil_shadow" returns i32
```

Applies shadow darkening to pixels selected by the completed stencil pass.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `i32` | — | X component of the position. |
| `y` | `i32` | — | Y component of the position. |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |


**Returns:** The number of affected pixels; -1 for invalid input, or 0 when no pixels are affected.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L342)

<a id="function-function-mq3-platform-playable-window-glactivate-function-glactivate-active-src-mq3-platform-playable-window-ml-188819456"></a>
### glActivate

```ml
function glActivate(active)
```

Returns `void` from `mq3.platform.playable_window.glActivate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `dynamic` | — | Input tested by `active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L732)

<a id="extern_function-extern-function-mq3-platform-playable-window-glactivatenative-extern-function-glactivatenative-active-as-i32-from-playable-window-dll-symbol-playable-window-gl-activate-returns-void-src-mq3-platform-playable-window-ml-1413591198"></a>
### glActivateNative

```ml
extern function glActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_gl_activate" returns void
```

Restores or minimizes the preview window and updates native input activation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `i32` | — | Nonzero activates the native window/input state; zero deactivates it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L98)

<a id="function-function-mq3-platform-playable-window-glavailable-function-glavailable-src-mq3-platform-playable-window-ml-139135802"></a>
### glAvailable

```ml
function glAvailable()
```

Computes `glAvailableNative()!=0` for `mq3.platform.playable_window.glAvailable`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L705)

<a id="extern_function-extern-function-mq3-platform-playable-window-glavailablenative-extern-function-glavailablenative-from-playable-window-dll-symbol-playable-window-gl-available-returns-i32-src-mq3-platform-playable-window-ml-189342940"></a>
### glAvailableNative

```ml
extern function glAvailableNative() from "playable_window.dll" symbol "playable_window_gl_available" returns i32
```

Reports whether the preview has an active OpenGL context.


**Returns:** The native OpenGL-active flag.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L53)

<a id="extern_function-extern-function-mq3-platform-playable-window-glcolorbitsnative-extern-function-glcolorbitsnative-from-playable-window-dll-symbol-playable-window-gl-color-bits-returns-i32-src-mq3-platform-playable-window-ml-222118299"></a>
### glColorBitsNative

```ml
extern function glColorBitsNative() from "playable_window.dll" symbol "playable_window_gl_color_bits" returns i32
```

Reports the selected native color-buffer precision.


**Returns:** The color precision in bits.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L59)

<a id="function-function-mq3-platform-playable-window-glconfiguration-function-glconfiguration-src-mq3-platform-playable-window-ml-1129057568"></a>
### glConfiguration

```ml
function glConfiguration()
```

Returns `[glPixelFormatNative(),glColorBitsNative(),glDepthBitsNative(),glStencilBitsNative(),glStereoNative()!=0,glFullscreenNative()!=0]` for `mq3.platform.playable_window.glConfiguration`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L707)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfiguredisplaynative-extern-function-glconfiguredisplaynative-fullscreen-as-i32-frequency-as-i32-swapinterval-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-display-returns-i32-src-mq3-platform-playable-window-ml-1770549501"></a>
### glConfigureDisplayNative

```ml
extern function glConfigureDisplayNative(fullscreen as i32, frequency as i32, swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure_display" returns i32
```

Stores fullscreen, refresh-frequency, and swap-interval preferences before window creation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fullscreen` | `i32` | — | Nonzero requests fullscreen mode; zero selects windowed mode. |
| `frequency` | `i32` | — | Requested display refresh frequency in hertz; zero keeps the default. |
| `swapInterval` | `i32` | — | Swap interval passed to the OpenGL presentation layer. |


**Returns:** 1 when accepted; 0 for a negative frequency or an already-created window.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L50)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfiguredrivernative-extern-function-glconfiguredrivernative-driver-as-ptr-driverlength-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-driver-returns-i32-src-mq3-platform-playable-window-ml-1020238202"></a>
### glConfigureDriverNative

```ml
extern function glConfigureDriverNative(driver as ptr, driverLength as i32) from "playable_window.dll" symbol "playable_window_gl_configure_driver" returns i32
```

Stores a UTF-8 OpenGL driver name before a native window exists.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `driver` | `ptr` | — | Pointer to the UTF-8 OpenGL driver name; paired with driverLength. |
| `driverLength` | `i32` | — | Length of the UTF-8 driver-name buffer in bytes. |


**Returns:** 1 when the driver request is stored; 0 for invalid text or an already-created window.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L37)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfigurenative-extern-function-glconfigurenative-driver-as-ptr-driverlength-as-i32-colorbits-as-i32-depthbits-as-i32-stencilbits-as-i32-stereo-as-i32-fullscreen-as-i32-frequency-as-i32-swapinterval-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-returns-i32-src-mq3-platform-playable-window-ml-2063077854"></a>
### glConfigureNative

```ml
extern function glConfigureNative(driver as ptr, driverLength as i32, colorBits as i32, depthBits as i32, stencilBits as i32, stereo as i32, fullscreen as i32, frequency as i32, swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure" returns i32
```

Configures the OpenGL driver, pixel format, and presentation settings before window creation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `driver` | `ptr` | — | Pointer to the UTF-8 OpenGL driver name; paired with driverLength. |
| `driverLength` | `i32` | — | Length of the UTF-8 driver-name buffer in bytes. |
| `colorBits` | `i32` | — | Requested color-buffer precision in bits. |
| `depthBits` | `i32` | — | Requested depth-buffer precision in bits. |
| `stencilBits` | `i32` | — | Requested stencil-buffer precision in bits. |
| `stereo` | `i32` | — | Nonzero enables the stereo pixel-format request. |
| `fullscreen` | `i32` | — | Nonzero requests fullscreen mode; zero selects windowed mode. |
| `frequency` | `i32` | — | Requested display refresh frequency in hertz; zero keeps the default. |
| `swapInterval` | `i32` | — | Swap interval passed to the OpenGL presentation layer. |


**Returns:** 1 when all three configuration steps succeed; 0 if any step rejects the request.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L32)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfigurepixelformatnative-extern-function-glconfigurepixelformatnative-colorbits-as-i32-depthbits-as-i32-stencilbits-as-i32-stereo-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-pixel-format-returns-i32-src-mq3-platform-playable-window-ml-2137394600"></a>
### glConfigurePixelFormatNative

```ml
extern function glConfigurePixelFormatNative(colorBits as i32, depthBits as i32, stencilBits as i32, stereo as i32) from "playable_window.dll" symbol "playable_window_gl_configure_pixel_format" returns i32
```

Stores requested OpenGL color/depth/stencil precision and stereo mode before window creation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colorBits` | `i32` | — | Requested color-buffer precision in bits. |
| `depthBits` | `i32` | — | Requested depth-buffer precision in bits. |
| `stencilBits` | `i32` | — | Requested stencil-buffer precision in bits. |
| `stereo` | `i32` | — | Nonzero enables the stereo pixel-format request. |


**Returns:** 1 when accepted; 0 for negative precision values or an already-created window.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L44)

<a id="extern_function-extern-function-mq3-platform-playable-window-gldepthbitsnative-extern-function-gldepthbitsnative-from-playable-window-dll-symbol-playable-window-gl-depth-bits-returns-i32-src-mq3-platform-playable-window-ml-1796591153"></a>
### glDepthBitsNative

```ml
extern function glDepthBitsNative() from "playable_window.dll" symbol "playable_window_gl_depth_bits" returns i32
```

Reports the selected native depth-buffer precision.


**Returns:** The depth precision in bits.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L62)

<a id="extern_function-extern-function-mq3-platform-playable-window-glendframenative-extern-function-glendframenative-from-playable-window-dll-symbol-playable-window-gl-end-frame-returns-void-src-mq3-platform-playable-window-ml-1697805802"></a>
### glEndFrameNative

```ml
extern function glEndFrameNative() from "playable_window.dll" symbol "playable_window_gl_end_frame" returns void
```

Presents the completed native OpenGL frame through its configured drawing backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L100)

<a id="extern_function-extern-function-mq3-platform-playable-window-glfullscreennative-extern-function-glfullscreennative-from-playable-window-dll-symbol-playable-window-gl-fullscreen-returns-i32-src-mq3-platform-playable-window-ml-1820404202"></a>
### glFullscreenNative

```ml
extern function glFullscreenNative() from "playable_window.dll" symbol "playable_window_gl_fullscreen" returns i32
```

Reports the stored native fullscreen setting.


**Returns:** Nonzero when fullscreen is requested.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L71)

<a id="function-function-mq3-platform-playable-window-glhasextension-function-glhasextension-name-src-mq3-platform-playable-window-ml-1631899235"></a>
### glHasExtension

```ml
function glHasExtension(name)
```

Returns `glHasExtensionNative(nativeBytesPtr(data),len(data))!=0` from `mq3.platform.playable_window.glHasExtension`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L716)

<a id="extern_function-extern-function-mq3-platform-playable-window-glhasextensionnative-extern-function-glhasextensionnative-name-as-ptr-length-as-i32-from-playable-window-dll-symbol-playable-window-gl-has-extension-returns-i32-src-mq3-platform-playable-window-ml-1208515674"></a>
### glHasExtensionNative

```ml
extern function glHasExtensionNative(name as ptr, length as i32) from "playable_window.dll" symbol "playable_window_gl_has_extension" returns i32
```

Tests an exact extension-name token in the active OpenGL extension string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `ptr` | — | Pointer to the extension-name bytes; no embedded terminator is required. |
| `length` | `i32` | — | Extension-name length in bytes; must be 1..255. |


**Returns:** 1 for an exact token match; 0 for no match, invalid name, or inactive OpenGL.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L82)

<a id="function-function-mq3-platform-playable-window-glinfo-function-glinfo-which-src-mq3-platform-playable-window-ml-866832449"></a>
### glInfo

```ml
function glInfo(which)
```

Returns `decode(slice(data,0,length))` from `mq3.platform.playable_window.glInfo`; earlier branches return `error(7493,"invalid OpenGL information selector")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `which` | `dynamic` | — | Value forwarded as `which` to `mq3.platform.playable_window.glInfoNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L710)

<a id="extern_function-extern-function-mq3-platform-playable-window-glinfonative-extern-function-glinfonative-which-as-i32-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-gl-info-returns-i32-src-mq3-platform-playable-window-ml-1307330102"></a>
### glInfoNative

```ml
extern function glInfoNative(which as i32, output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_gl_info" returns i32
```

Copies a selected OpenGL vendor, renderer, version, or extension string into a NUL-terminated buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `which` | `i32` | — | String selector: 0 vendor, 1 renderer, 2 version, or 3 extensions. |
| `output` | `bytes` | — | Writable UTF-8 buffer that receives a trailing NUL. |
| `capacity` | `i32` | — | Output capacity in bytes, including the trailing NUL. |


**Returns:** Bytes copied excluding the terminator, or -1 for an invalid selector/output buffer.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L77)

<a id="function-function-mq3-platform-playable-window-gllogcomment-function-gllogcomment-comment-src-mq3-platform-playable-window-ml-952223453"></a>
### glLogComment

```ml
function glLogComment(comment)
```

Returns `void` from `mq3.platform.playable_window.glLogComment`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `comment` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L735)

<a id="extern_function-extern-function-mq3-platform-playable-window-gllogcommentnative-extern-function-gllogcommentnative-comment-as-ptr-length-as-i32-from-playable-window-dll-symbol-playable-window-gl-log-comment-returns-void-src-mq3-platform-playable-window-ml-913254630"></a>
### glLogCommentNative

```ml
extern function glLogCommentNative(comment as ptr, length as i32) from "playable_window.dll" symbol "playable_window_gl_log_comment" returns void
```

Copies a bounded byte comment to the Windows debug-output stream.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `comment` | `ptr` | — | Read-only bytes passed to OutputDebugStringA. |
| `length` | `i32` | — | Comment byte length; the native boundary truncates to 1023 bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L104)

<a id="extern_function-extern-function-mq3-platform-playable-window-glpixelformatnative-extern-function-glpixelformatnative-from-playable-window-dll-symbol-playable-window-gl-pixel-format-returns-i32-src-mq3-platform-playable-window-ml-711409309"></a>
### glPixelFormatNative

```ml
extern function glPixelFormatNative() from "playable_window.dll" symbol "playable_window_gl_pixel_format" returns i32
```

Returns the selected Win32 OpenGL pixel-format identifier.


**Returns:** The current pixel-format identifier.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L56)

<a id="function-function-mq3-platform-playable-window-glrestoregamma-function-glrestoregamma-src-mq3-platform-playable-window-ml-781035014"></a>
### glRestoreGamma

```ml
function glRestoreGamma()
```

Returns `void` from `mq3.platform.playable_window.glRestoreGamma`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L729)

<a id="extern_function-extern-function-mq3-platform-playable-window-glrestoregammanative-extern-function-glrestoregammanative-from-playable-window-dll-symbol-playable-window-gl-restore-gamma-returns-void-src-mq3-platform-playable-window-ml-917573859"></a>
### glRestoreGammaNative

```ml
extern function glRestoreGammaNative() from "playable_window.dll" symbol "playable_window_gl_restore_gamma" returns void
```

Restores the saved display gamma ramp after a native gamma change.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L95)

<a id="function-function-mq3-platform-playable-window-glsetgamma-function-glsetgamma-red-green-blue-src-mq3-platform-playable-window-ml-867163020"></a>
### glSetGamma

```ml
function glSetGamma(red, green, blue)
```

Computes `glSetGamma` from `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0` using `mq3.platform.playable_window.glSetGammaNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — | Input used in the result expression `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0`. |
| `green` | `dynamic` | — | Input used in the result expression `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0`. |
| `blue` | `dynamic` | — | Input used in the result expression `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L724)

<a id="extern_function-extern-function-mq3-platform-playable-window-glsetgammanative-extern-function-glsetgammanative-red-as-ptr-green-as-ptr-blue-as-ptr-count-as-i32-from-playable-window-dll-symbol-playable-window-gl-set-gamma-returns-i32-src-mq3-platform-playable-window-ml-1105535118"></a>
### glSetGammaNative

```ml
extern function glSetGammaNative(red as ptr, green as ptr, blue as ptr, count as i32) from "playable_window.dll" symbol "playable_window_gl_set_gamma" returns i32
```

Expands three 256-entry byte ramps to Win32 gamma ramps and applies them to the display.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `ptr` | — | Pointer to at least 256 red-channel gamma bytes. |
| `green` | `ptr` | — | Pointer to at least 256 green-channel gamma bytes. |
| `blue` | `ptr` | — | Pointer to at least 256 blue-channel gamma bytes. |
| `count` | `i32` | — | Number of entries available in each ramp; at least 256. |


**Returns:** 1 when the gamma ramp is applied; 0 when unsupported, invalid, or rejected by Windows.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L93)

<a id="function-function-mq3-platform-playable-window-glsetswapinterval-function-glsetswapinterval-interval-src-mq3-platform-playable-window-ml-1497410187"></a>
### glSetSwapInterval

```ml
function glSetSwapInterval(interval)
```

Computes `glSwapIntervalNative(interval)!=0` for `mq3.platform.playable_window.glSetSwapInterval`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `interval` | `dynamic` | — | Value forwarded as `interval` to `mq3.platform.playable_window.glSwapIntervalNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L719)

<a id="extern_function-extern-function-mq3-platform-playable-window-glstencilbitsnative-extern-function-glstencilbitsnative-from-playable-window-dll-symbol-playable-window-gl-stencil-bits-returns-i32-src-mq3-platform-playable-window-ml-252426504"></a>
### glStencilBitsNative

```ml
extern function glStencilBitsNative() from "playable_window.dll" symbol "playable_window_gl_stencil_bits" returns i32
```

Reports the selected native stencil-buffer precision.


**Returns:** The stencil precision in bits.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L65)

<a id="extern_function-extern-function-mq3-platform-playable-window-glstereonative-extern-function-glstereonative-from-playable-window-dll-symbol-playable-window-gl-stereo-returns-i32-src-mq3-platform-playable-window-ml-942044879"></a>
### glStereoNative

```ml
extern function glStereoNative() from "playable_window.dll" symbol "playable_window_gl_stereo" returns i32
```

Reports the stored native stereo pixel-format setting.


**Returns:** Nonzero when stereo is requested.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L68)

<a id="extern_function-extern-function-mq3-platform-playable-window-glswapintervalnative-extern-function-glswapintervalnative-interval-as-i32-from-playable-window-dll-symbol-playable-window-gl-set-swap-interval-returns-i32-src-mq3-platform-playable-window-ml-546286852"></a>
### glSwapIntervalNative

```ml
extern function glSwapIntervalNative(interval as i32) from "playable_window.dll" symbol "playable_window_gl_set_swap_interval" returns i32
```

Stores the swap interval and applies it through the available WGL extension.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `interval` | `i32` | — | Requested OpenGL swap interval. |


**Returns:** Nonzero on success; without the extension only interval zero succeeds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L86)

<a id="function-function-mq3-platform-playable-window-hardwaredrawcalls-function-hardwaredrawcalls-src-mq3-platform-playable-window-ml-93168020"></a>
### hardwareDrawCalls

```ml
function hardwareDrawCalls()
```

Calls `mq3.platform.playable_window.hardwareDrawCallsNative` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L840)

<a id="extern_function-extern-function-mq3-platform-playable-window-hardwaredrawcallsnative-extern-function-hardwaredrawcallsnative-from-playable-window-dll-symbol-playable-window-hardware-draw-calls-returns-u32-src-mq3-platform-playable-window-ml-1119658376"></a>
### hardwareDrawCallsNative

```ml
extern function hardwareDrawCallsNative() from "playable_window.dll" symbol "playable_window_hardware_draw_calls" returns u32
```

Reads the native hardware draw-call counter.


**Returns:** The current hardware draw-call count.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L145)

<a id="function-function-mq3-platform-playable-window-hardwarerenderer-function-hardwarerenderer-src-mq3-platform-playable-window-ml-1321273354"></a>
### hardwareRenderer

```ml
function hardwareRenderer()
```

Computes `hardwareRendererNative()!=0` for `mq3.platform.playable_window.hardwareRenderer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L836)

<a id="extern_function-extern-function-mq3-platform-playable-window-hardwarerenderernative-extern-function-hardwarerenderernative-from-playable-window-dll-symbol-playable-window-hardware-renderer-returns-i32-src-mq3-platform-playable-window-ml-1018465581"></a>
### hardwareRendererNative

```ml
extern function hardwareRendererNative() from "playable_window.dll" symbol "playable_window_hardware_renderer" returns i32
```

Reports whether the hardware rendering path is active.


**Returns:** The hardware-renderer flag.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L139)

<a id="function-function-mq3-platform-playable-window-hardwaretriangles-function-hardwaretriangles-src-mq3-platform-playable-window-ml-604094932"></a>
### hardwareTriangles

```ml
function hardwareTriangles()
```

Calls `mq3.platform.playable_window.hardwareTrianglesNative` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L838)

<a id="extern_function-extern-function-mq3-platform-playable-window-hardwaretrianglesnative-extern-function-hardwaretrianglesnative-from-playable-window-dll-symbol-playable-window-hardware-triangles-returns-u32-src-mq3-platform-playable-window-ml-2117495383"></a>
### hardwareTrianglesNative

```ml
extern function hardwareTrianglesNative() from "playable_window.dll" symbol "playable_window_hardware_triangles" returns u32
```

Reads the native hardware triangle counter.


**Returns:** The current hardware triangle count.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L142)

<a id="constant-constant-mq3-platform-playable-window-input-char-const-input-char-2-src-mq3-platform-playable-window-ml-1872657919"></a>
### INPUT_CHAR

```ml
const INPUT_CHAR = 2
```

Native input record type carrying a text-input character.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L586)

<a id="constant-constant-mq3-platform-playable-window-input-key-const-input-key-1-src-mq3-platform-playable-window-ml-1271197402"></a>
### INPUT_KEY

```ml
const INPUT_KEY = 1
```

Native input record type carrying a key code and pressed state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L584)

<a id="constant-constant-mq3-platform-playable-window-input-mouse-const-input-mouse-3-src-mq3-platform-playable-window-ml-1661702192"></a>
### INPUT_MOUSE

```ml
const INPUT_MOUSE = 3
```

Native input record type carrying relative mouse movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L588)

<a id="function-function-mq3-platform-playable-window-inputactivate-function-inputactivate-active-src-mq3-platform-playable-window-ml-1783174170"></a>
### inputActivate

```ml
function inputActivate(active)
```

Returns `void` from `mq3.platform.playable_window.inputActivate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `dynamic` | — | Input tested by `active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L807)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputactivatenative-extern-function-inputactivatenative-active-as-i32-from-playable-window-dll-symbol-playable-window-input-activate-returns-void-src-mq3-platform-playable-window-ml-1935629015"></a>
### inputActivateNative

```ml
extern function inputActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_input_activate" returns void
```

Enables or disables native input capture and activation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `i32` | — | Nonzero activates the native window/input state; zero deactivates it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L268)

<a id="function-function-mq3-platform-playable-window-inputclear-function-inputclear-src-mq3-platform-playable-window-ml-2143596402"></a>
### inputClear

```ml
function inputClear()
```

Returns `void` from `mq3.platform.playable_window.inputClear`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L809)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputclearnative-extern-function-inputclearnative-from-playable-window-dll-symbol-playable-window-input-clear-states-returns-void-src-mq3-platform-playable-window-ml-1864012916"></a>
### inputClearNative

```ml
extern function inputClearNative() from "playable_window.dll" symbol "playable_window_input_clear_states" returns void
```

Clears tracked native key/button states and pending motion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L272)

- [mq3.platform.playable_window.InputEvent](Type-mq3-platform-playable-window-inputevent-591730886.md) — struct
<a id="function-function-mq3-platform-playable-window-inputevents-function-inputevents-maxevents-src-mq3-platform-playable-window-ml-237166257"></a>
### inputEvents

```ml
function inputEvents(maxEvents)
```

Computes `inputEvents` from `result.toArray()` using `std.ds.list.List.withCapacity`, `result.len`, `mq3.platform.playable_window.nextInputEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEvents` | `dynamic` | — | Argument 1 supplied to `std.ds.list.List.withCapacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L799)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputframenative-extern-function-inputframenative-from-playable-window-dll-symbol-playable-window-input-frame-returns-void-src-mq3-platform-playable-window-ml-1357265257"></a>
### inputFrameNative

```ml
extern function inputFrameNative() from "playable_window.dll" symbol "playable_window_input_frame" returns void
```

Polls native per-frame joystick/input state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L270)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputinitnative-extern-function-inputinitnative-from-playable-window-dll-symbol-playable-window-input-init-returns-i32-src-mq3-platform-playable-window-ml-1423645416"></a>
### inputInitNative

```ml
extern function inputInitNative() from "playable_window.dll" symbol "playable_window_input_init" returns i32
```

Initializes native keyboard/mouse input and starts configured joystick/MIDI devices.


**Returns:** The native MIDI-startup status returned after input setup.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L265)

<a id="function-function-mq3-platform-playable-window-inputkeydown-function-inputkeydown-key-src-mq3-platform-playable-window-ml-609053807"></a>
### inputKeyDown

```ml
function inputKeyDown(key)
```

The native Sys_QueEvent key-state table uses Quake keynums, including mouse and keypad keys. Keep legacy keyDown's Win32 virtual-key API separate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Value forwarded as `key` to `mq3.platform.playable_window.inputKeyDownNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L786)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputkeydownnative-extern-function-inputkeydownnative-key-as-i32-from-playable-window-dll-symbol-playable-window-input-key-down-returns-i32-src-mq3-platform-playable-window-ml-1227115757"></a>
### inputKeyDownNative

```ml
extern function inputKeyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_input_key_down" returns i32
```

Reads the native input subsystem's tracked key-down state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `i32` | — | Key code queried by the native input boundary. |


**Returns:** Nonzero while the requested tracked key is down.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L122)

<a id="function-function-mq3-platform-playable-window-joystickavailable-function-joystickavailable-src-mq3-platform-playable-window-ml-601026500"></a>
### joystickAvailable

```ml
function joystickAvailable()
```

Computes `joystickAvailableNative()!=0` for `mq3.platform.playable_window.joystickAvailable`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L821)

<a id="extern_function-extern-function-mq3-platform-playable-window-joystickavailablenative-extern-function-joystickavailablenative-from-playable-window-dll-symbol-playable-window-input-joystick-available-returns-i32-src-mq3-platform-playable-window-ml-1565860208"></a>
### joystickAvailableNative

```ml
extern function joystickAvailableNative() from "playable_window.dll" symbol "playable_window_input_joystick_available" returns i32
```

Tests whether an enabled joystick is available to native input.


**Returns:** Nonzero only when joystick input is enabled and a device is available.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L287)

<a id="extern_function-extern-function-mq3-platform-playable-window-joystickconfigurenative-extern-function-joystickconfigurenative-enabled-as-i32-threshold-as-double-ballscale-as-double-from-playable-window-dll-symbol-playable-window-input-configure-joystick-returns-i32-src-mq3-platform-playable-window-ml-899387052"></a>
### joystickConfigureNative

```ml
extern function joystickConfigureNative(enabled as i32, threshold as double, ballScale as double) from "playable_window.dll" symbol "playable_window_input_configure_joystick" returns i32
```

Stores joystick enable/dead-zone/trackball settings and restarts joystick discovery.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — | Nonzero enables the requested native feature. |
| `threshold` | `double` | — | Joystick axis dead-zone threshold. |
| `ballScale` | `double` | — | Scale applied to joystick trackball motion. |


**Returns:** The native joystick-startup status.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L278)

<a id="constant-constant-mq3-platform-playable-window-k-mouse1-const-k-mouse1-178-src-mq3-platform-playable-window-ml-1528143451"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```

Engine input key code for mouse button 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L530)

<a id="constant-constant-mq3-platform-playable-window-k-mouse2-const-k-mouse2-179-src-mq3-platform-playable-window-ml-640916586"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine input key code for mouse button 2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L532)

<a id="constant-constant-mq3-platform-playable-window-k-mouse3-const-k-mouse3-180-src-mq3-platform-playable-window-ml-1593607880"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = 180
```

Engine input key code for mouse button 3.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L534)

<a id="constant-constant-mq3-platform-playable-window-k-mouse4-const-k-mouse4-181-src-mq3-platform-playable-window-ml-2058743229"></a>
### K_MOUSE4

```ml
const K_MOUSE4 = 181
```

Engine input key code for mouse button 4.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L536)

<a id="constant-constant-mq3-platform-playable-window-k-mouse5-const-k-mouse5-182-src-mq3-platform-playable-window-ml-10688034"></a>
### K_MOUSE5

```ml
const K_MOUSE5 = 182
```

Engine input key code for mouse button 5.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L538)

<a id="constant-constant-mq3-platform-playable-window-k-mwheeldown-const-k-mwheeldown-183-src-mq3-platform-playable-window-ml-882956441"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```

Engine input key code for the downward mouse-wheel step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L540)

<a id="constant-constant-mq3-platform-playable-window-k-mwheelup-const-k-mwheelup-184-src-mq3-platform-playable-window-ml-309301978"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```

Engine input key code for the upward mouse-wheel step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L542)

<a id="function-function-mq3-platform-playable-window-keydown-function-keydown-key-src-mq3-platform-playable-window-ml-656679121"></a>
### keyDown

```ml
function keyDown(key)
```

Computes `keyDownNative(key)!=0` for `mq3.platform.playable_window.keyDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Value forwarded as `key` to `mq3.platform.playable_window.keyDownNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L782)

<a id="extern_function-extern-function-mq3-platform-playable-window-keydownnative-extern-function-keydownnative-key-as-i32-from-playable-window-dll-symbol-playable-window-key-down-returns-i32-src-mq3-platform-playable-window-ml-540220634"></a>
### keyDownNative

```ml
extern function keyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_key_down" returns i32
```

Queries an asynchronous Win32 virtual key while the preview window has foreground focus.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `i32` | — | Key code queried by the native input boundary. |


**Returns:** Nonzero while the key is down; 0 for invalid keys or lack of focus.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L118)

<a id="extern_function-extern-function-mq3-platform-playable-window-linenative-extern-function-linenative-x0-as-i32-y0-as-i32-x1-as-i32-y1-as-i32-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-line-returns-void-src-mq3-platform-playable-window-ml-1501879190"></a>
### lineNative

```ml
extern function lineNative(x0 as i32, y0 as i32, x1 as i32, y1 as i32, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_line" returns void
```

Draws a screen-space RGB line into the preview surface.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x0` | `i32` | — | X coordinate for vertex 0. |
| `y0` | `i32` | — | Y coordinate for vertex 0. |
| `x1` | `i32` | — | X coordinate for vertex 1. |
| `y1` | `i32` | — | Y coordinate for vertex 1. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L304)

- [mq3.platform.playable_window.LoadingPoint](Type-mq3-platform-playable-window-loadingpoint-395317548.md) — struct
<a id="function-function-mq3-platform-playable-window-loadingtitle-function-loadingtitle-progress-status-src-mq3-platform-playable-window-ml-1553333445"></a>
### loadingTitle

```ml
function loadingTitle(progress, status)
```

Computes `loadingTitle` from `"MiniQuake3 | Loading "+str(progress)+"% | "+status`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `progress` | `dynamic` | — | Input tested by `progress<0 or progress>100`. |
| `status` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L751)

<a id="extern_function-extern-function-mq3-platform-playable-window-midiconfigurenative-extern-function-midiconfigurenative-enabled-as-i32-device-as-i32-channel-as-i32-from-playable-window-dll-symbol-playable-window-input-configure-midi-returns-i32-src-mq3-platform-playable-window-ml-1825871092"></a>
### midiConfigureNative

```ml
extern function midiConfigureNative(enabled as i32, device as i32, channel as i32) from "playable_window.dll" symbol "playable_window_input_configure_midi" returns i32
```

Stores MIDI enable/device/channel settings and restarts MIDI input.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — | Nonzero enables the requested native feature. |
| `device` | `i32` | — | MIDI input device index. |
| `channel` | `i32` | — | MIDI input channel selector. |


**Returns:** The native MIDI-startup status.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L284)

<a id="function-function-mq3-platform-playable-window-mididevicecount-function-mididevicecount-src-mq3-platform-playable-window-ml-1234069370"></a>
### midiDeviceCount

```ml
function midiDeviceCount()
```

Calls `mq3.platform.playable_window.midiDeviceCountNative` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L832)

<a id="extern_function-extern-function-mq3-platform-playable-window-mididevicecountnative-extern-function-mididevicecountnative-from-playable-window-dll-symbol-playable-window-input-midi-device-count-returns-i32-src-mq3-platform-playable-window-ml-2032552218"></a>
### midiDeviceCountNative

```ml
extern function midiDeviceCountNative() from "playable_window.dll" symbol "playable_window_input_midi_device_count" returns i32
```

Queries the number of WinMM MIDI input devices.


**Returns:** The device count returned by midiInGetNumDevs.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L290)

<a id="function-function-mq3-platform-playable-window-milliseconds-function-milliseconds-src-mq3-platform-playable-window-ml-1415510138"></a>
### milliseconds

```ml
function milliseconds()
```

Calls `mq3.platform.playable_window.millisecondsNative` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L834)

<a id="extern_function-extern-function-mq3-platform-playable-window-millisecondsnative-extern-function-millisecondsnative-from-playable-window-dll-symbol-playable-window-milliseconds-returns-i32-src-mq3-platform-playable-window-ml-909369177"></a>
### millisecondsNative

```ml
extern function millisecondsNative() from "playable_window.dll" symbol "playable_window_milliseconds" returns i32
```

Reads the native preview clock used to timestamp input and frames.


**Returns:** Current native time in milliseconds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L136)

<a id="function-function-mq3-platform-playable-window-mousedelta-function-mousedelta-src-mq3-platform-playable-window-ml-388419990"></a>
### mouseDelta

```ml
function mouseDelta()
```

Returns `[mouseXNative(),mouseYNative()]` for `mq3.platform.playable_window.mouseDelta`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L804)

<a id="extern_function-extern-function-mq3-platform-playable-window-mousexnative-extern-function-mousexnative-from-playable-window-dll-symbol-playable-window-consume-mouse-dx-returns-i32-src-mq3-platform-playable-window-ml-655389808"></a>
### mouseXNative

```ml
extern function mouseXNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dx" returns i32
```

Atomically reads and clears accumulated horizontal mouse motion.


**Returns:** The horizontal motion accumulated since the previous call.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L130)

<a id="extern_function-extern-function-mq3-platform-playable-window-mouseynative-extern-function-mouseynative-from-playable-window-dll-symbol-playable-window-consume-mouse-dy-returns-i32-src-mq3-platform-playable-window-ml-1924332727"></a>
### mouseYNative

```ml
extern function mouseYNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dy" returns i32
```

Atomically reads and clears accumulated vertical mouse motion.


**Returns:** The vertical motion accumulated since the previous call.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L133)

<a id="constant-constant-mq3-platform-playable-window-native-texture-slots-const-native-texture-slots-4096-src-mq3-platform-playable-window-ml-1614148238"></a>
### NATIVE_TEXTURE_SLOTS

```ml
const NATIVE_TEXTURE_SLOTS = 4096
```

Matches PLAYABLE_TEXTURE_SLOTS in native/playable_win32.c.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L516)

<a id="function-function-mq3-platform-playable-window-nextinputevent-function-nextinputevent-src-mq3-platform-playable-window-ml-1794407954"></a>
### nextInputEvent

```ml
function nextInputEvent()
```

Returns `decodeInputEvent(data)` from `mq3.platform.playable_window.nextInputEvent`; earlier branches return `void`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L794)

<a id="extern_function-extern-function-mq3-platform-playable-window-nextinputeventnative-extern-function-nextinputeventnative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-next-input-event-returns-i32-src-mq3-platform-playable-window-ml-1680741248"></a>
### nextInputEventNative

```ml
extern function nextInputEventNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_next_input_event" returns i32
```

Removes the next native input event and writes its four integer fields to the output buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable storage for four 32-bit event fields. |
| `capacity` | `i32` | — | Output capacity in bytes; at least 16 bytes are needed for one event. |


**Returns:** 1 when an event is written; 0 if none is available or the buffer is invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L127)

<a id="function-function-mq3-platform-playable-window-open-function-open-width-height-src-mq3-platform-playable-window-ml-1833026823"></a>
### open

```ml
function open(width, height)
```

Creates the preview window, requires OpenGL and native input to initialize, and activates input.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.create`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L673)

<a id="function-function-mq3-platform-playable-window-openconfigured-function-openconfigured-width-height-drivername-colorbits-depthbits-stencilbits-stereo-fullscreen-frequency-swapinterval-src-mq3-platform-playable-window-ml-240403241"></a>
### openConfigured

```ml
function openConfigured(width, height, driverName, colorBits, depthBits, stencilBits, stereo, fullscreen, frequency, swapInterval)
```

Validates and applies driver/pixel-format/display preferences before opening the preview window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.create`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.create`. |
| `driverName` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `colorBits` | `dynamic` | — | Value forwarded as `colorBits` to `mq3.platform.playable_window.glConfigurePixelFormatNative`. |
| `depthBits` | `dynamic` | — | Value forwarded as `depthBits` to `mq3.platform.playable_window.glConfigurePixelFormatNative`. |
| `stencilBits` | `dynamic` | — | Value forwarded as `stencilBits` to `mq3.platform.playable_window.glConfigurePixelFormatNative`. |
| `stereo` | `dynamic` | — | Input tested by `stereo`. |
| `fullscreen` | `dynamic` | — | Input tested by `fullscreen`. |
| `frequency` | `dynamic` | — | Value forwarded as `frequency` to `mq3.platform.playable_window.glConfigureDisplayNative`. |
| `swapInterval` | `dynamic` | — | Value forwarded as `swapInterval` to `mq3.platform.playable_window.glConfigureDisplayNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L692)

<a id="function-function-mq3-platform-playable-window-poll-function-poll-src-mq3-platform-playable-window-ml-632154482"></a>
### poll

```ml
function poll()
```

Returns `void` from `mq3.platform.playable_window.poll`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L737)

<a id="extern_function-extern-function-mq3-platform-playable-window-pollnative-extern-function-pollnative-from-playable-window-dll-symbol-playable-window-poll-returns-void-src-mq3-platform-playable-window-ml-1383932472"></a>
### pollNative

```ml
extern function pollNative() from "playable_window.dll" symbol "playable_window_poll" returns void
```

Preserves the polling entry point while the dedicated native UI thread pumps window messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L106)

<a id="function-function-mq3-platform-playable-window-present-function-present-src-mq3-platform-playable-window-ml-1795214248"></a>
### present

```ml
function present()
```

Returns `void` from `mq3.platform.playable_window.present`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L871)

<a id="function-function-mq3-platform-playable-window-presentednonblack-function-presentednonblack-src-mq3-platform-playable-window-ml-1796306606"></a>
### presentedNonBlack

```ml
function presentedNonBlack()
```

Calls `mq3.platform.playable_window.presentedNonBlackNative` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L873)

<a id="extern_function-extern-function-mq3-platform-playable-window-presentednonblacknative-extern-function-presentednonblacknative-from-playable-window-dll-symbol-playable-window-presented-non-black-returns-i32-src-mq3-platform-playable-window-ml-616415493"></a>
### presentedNonBlackNative

```ml
extern function presentedNonBlackNative() from "playable_window.dll" symbol "playable_window_presented_non_black" returns i32
```

Counts non-black pixels in the last presented native image.


**Returns:** The detected non-black pixel count, or 0 when no image can be inspected.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L309)

<a id="extern_function-extern-function-mq3-platform-playable-window-presentnative-extern-function-presentnative-from-playable-window-dll-symbol-playable-window-present-returns-void-src-mq3-platform-playable-window-ml-955642860"></a>
### presentNative

```ml
extern function presentNative() from "playable_window.dll" symbol "playable_window_present" returns void
```

Presents the native preview surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L306)

<a id="function-function-mq3-platform-playable-window-processorid-function-processorid-src-mq3-platform-playable-window-ml-394440620"></a>
### processorId

```ml
function processorId()
```

Calls `mq3.platform.playable_window.processorIdNative` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L855)

<a id="extern_function-extern-function-mq3-platform-playable-window-processoridnative-extern-function-processoridnative-from-playable-window-dll-symbol-playable-system-processor-id-returns-i32-src-mq3-platform-playable-window-ml-1859186948"></a>
### processorIdNative

```ml
extern function processorIdNative() from "playable_window.dll" symbol "playable_system_processor_id" returns i32
```

Maps available CPU features to the legacy Quake processor identifier.


**Returns:** The legacy processor ID selected from the detected features, or 0 for the fallback.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L262)

<a id="function-function-mq3-platform-playable-window-releasetexture-function-releasetexture-slot-src-mq3-platform-playable-window-ml-539136030"></a>
### releaseTexture

```ml
function releaseTexture(slot)
```

Returns `void` from `mq3.platform.playable_window.releaseTexture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Value forwarded as `slot` to `mq3.platform.playable_window.releaseTextureNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L948)

<a id="extern_function-extern-function-mq3-platform-playable-window-releasetexturenative-extern-function-releasetexturenative-slot-as-i32-from-playable-window-dll-symbol-playable-window-release-texture-returns-void-src-mq3-platform-playable-window-ml-657460172"></a>
### releaseTextureNative

```ml
extern function releaseTextureNative(slot as i32) from "playable_window.dll" symbol "playable_window_release_texture" returns void
```

Releases the pixels and native renderer resources associated with a texture slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — | Texture slot selected by the native renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L373)

<a id="function-function-mq3-platform-playable-window-resettrianglebatch-function-resettrianglebatch-batch-src-mq3-platform-playable-window-ml-841705430"></a>
### resetTriangleBatch

```ml
function resetTriangleBatch(batch)
```

Updates `batch.count` in `mq3.platform.playable_window.resetTriangleBatch`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L994)

<a id="function-function-mq3-platform-playable-window-sampledepth-function-sampledepth-x-y-src-mq3-platform-playable-window-ml-333356729"></a>
### sampleDepth

```ml
function sampleDepth(x, y)
```

Calls `mq3.platform.playable_window.sampleDepthNative` with `(numeric.trunc32(x),numeric.trunc32(y))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |
| `y` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L884)

<a id="extern_function-extern-function-mq3-platform-playable-window-sampledepthnative-extern-function-sampledepthnative-x-as-i32-y-as-i32-from-playable-window-dll-symbol-playable-window-sample-depth-returns-double-src-mq3-platform-playable-window-ml-1772650221"></a>
### sampleDepthNative

```ml
extern function sampleDepthNative(x as i32, y as i32) from "playable_window.dll" symbol "playable_window_sample_depth" returns double
```

Reads a screen pixel's depth and converts stored depth to a camera-space distance.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `i32` | — | X component of the position. |
| `y` | `i32` | — | Y component of the position. |


**Returns:** The distance; FLT_MAX for untouched/far depth, or -1.0 for invalid coordinates/state.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L319)

<a id="function-function-mq3-platform-playable-window-setdepthrange-function-setdepthrange-scale-neardistance-src-mq3-platform-playable-window-ml-890709395"></a>
### setDepthRange

```ml
function setDepthRange(scale, nearDistance)
```

Computes `setDepthRangeNative(scale,nearDistance)!=0` for `mq3.platform.playable_window.setDepthRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scale` | `dynamic` | — | Value forwarded as `scale` to `mq3.platform.playable_window.setDepthRangeNative`. |
| `nearDistance` | `dynamic` | — | Value forwarded as `nearDistance` to `mq3.platform.playable_window.setDepthRangeNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L888)

<a id="extern_function-extern-function-mq3-platform-playable-window-setdepthrangenative-extern-function-setdepthrangenative-scale-as-double-neardistance-as-double-from-playable-window-dll-symbol-playable-window-set-depth-range-returns-i32-src-mq3-platform-playable-window-ml-1917269416"></a>
### setDepthRangeNative

```ml
extern function setDepthRangeNative(scale as double, nearDistance as double) from "playable_window.dll" symbol "playable_window_set_depth_range" returns i32
```

Configures the native depth scale and near clipping distance.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scale` | `double` | — | Finite depth scale greater than zero and at most one. |
| `nearDistance` | `double` | — | Positive near clipping distance used for perspective depth conversion. |


**Returns:** 1 for an accepted range; 0 for invalid depth parameters.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L324)

<a id="function-function-mq3-platform-playable-window-setmode-function-setmode-width-height-fullscreen-frequency-src-mq3-platform-playable-window-ml-1960927360"></a>
### setMode

```ml
function setMode(width, height, fullscreen, frequency)
```

Builds `mq3.platform.playable_window.DisplayMode` for `mq3.platform.playable_window.setMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.setModeNative`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.setModeNative`. |
| `fullscreen` | `dynamic` | — | Input tested by `fullscreen`. |
| `frequency` | `dynamic` | — | Value forwarded as `frequency` to `mq3.platform.playable_window.setModeNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L664)

<a id="extern_function-extern-function-mq3-platform-playable-window-setmodenative-extern-function-setmodenative-width-as-i32-height-as-i32-fullscreen-as-i32-frequency-as-i32-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-set-mode-returns-i32-src-mq3-platform-playable-window-ml-1843405907"></a>
### setModeNative

```ml
extern function setModeNative(width as i32, height as i32, fullscreen as i32, frequency as i32, output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_set_mode" returns i32
```

Changes the live Win32 display mode and writes the resulting width, height, and fullscreen flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |
| `fullscreen` | `i32` | — | Nonzero requests fullscreen mode; zero selects windowed mode. |
| `frequency` | `i32` | — | Requested display refresh frequency in hertz; zero keeps the default. |
| `output` | `bytes` | — | Writable storage for three 32-bit integers: width, height, fullscreen. |
| `capacity` | `i32` | — | Number of 32-bit output elements; must be at least 3. |


**Returns:** 1 when the mode changes; 0 for invalid dimensions, missing window/output, or a failed request.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L20)

<a id="function-function-mq3-platform-playable-window-setstencilpass-function-setstencilpass-pass-src-mq3-platform-playable-window-ml-1274830549"></a>
### setStencilPass

```ml
function setStencilPass(pass)
```

Computes `setStencilPassNative(pass)!=0` for `mq3.platform.playable_window.setStencilPass`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Value forwarded as `pass` to `mq3.platform.playable_window.setStencilPassNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L894)

<a id="extern_function-extern-function-mq3-platform-playable-window-setstencilpassnative-extern-function-setstencilpassnative-pass-as-i32-from-playable-window-dll-symbol-playable-window-set-stencil-pass-returns-i32-src-mq3-platform-playable-window-ml-728239421"></a>
### setStencilPassNative

```ml
extern function setStencilPassNative(pass as i32) from "playable_window.dll" symbol "playable_window_set_stencil_pass" returns i32
```

Selects the native stencil-shadow rendering pass.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `i32` | — | Stencil-pass selector used by the native shadow pipeline. |


**Returns:** 1 for an accepted pass selector; 0 for an invalid selector.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L335)

<a id="function-function-mq3-platform-playable-window-settexturesettings-function-settexturesettings-picmip-texturemode-src-mq3-platform-playable-window-ml-2106997232"></a>
### setTextureSettings

```ml
function setTextureSettings(picmip, textureMode)
```

Maps an OpenGL texture-filter name to its native mode index and applies picmip/filter settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `picmip` | `dynamic` | — | Value forwarded as `picmip` to `mq3.platform.playable_window.setTextureSettingsNative`. |
| `textureMode` | `dynamic` | — | Argument 1 supplied to `stringEqualsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L940)

<a id="extern_function-extern-function-mq3-platform-playable-window-settexturesettingsnative-extern-function-settexturesettingsnative-picmip-as-i32-mode-as-i32-from-playable-window-dll-symbol-playable-window-set-texture-settings-returns-void-src-mq3-platform-playable-window-ml-1791776138"></a>
### setTextureSettingsNative

```ml
extern function setTextureSettingsNative(picmip as i32, mode as i32) from "playable_window.dll" symbol "playable_window_set_texture_settings" returns void
```

Stores texture-picmip reduction and native filtering settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `picmip` | `i32` | — | Requested power-of-two texture size reduction. |
| `mode` | `i32` | — | Filter index 0..5 corresponding to the GL_NEAREST/GL_LINEAR and mipmap combinations. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L370)

<a id="function-function-mq3-platform-playable-window-settitle-function-settitle-title-src-mq3-platform-playable-window-ml-1251264284"></a>
### setTitle

```ml
function setTitle(title)
```

Computes `setTitle` from `setTitleNative(nativeBytesPtr(data),len(data))!=0` using `mq3.platform.playable_window.setTitleNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `title` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L742)

<a id="extern_function-extern-function-mq3-platform-playable-window-settitlenative-extern-function-settitlenative-title-as-ptr-length-as-i32-from-playable-window-dll-symbol-playable-window-set-title-utf8-returns-i32-src-mq3-platform-playable-window-ml-789368744"></a>
### setTitleNative

```ml
extern function setTitleNative(title as ptr, length as i32) from "playable_window.dll" symbol "playable_window_set_title_utf8" returns i32
```

Converts a bounded UTF-8 title to UTF-16 and applies it to the live preview window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `title` | `ptr` | — | Pointer to the UTF-8 window title, without embedded NUL bytes. |
| `length` | `i32` | — | UTF-8 title length in bytes; must be 1..255. |


**Returns:** Nonzero when SetWindowTextW succeeds; 0 for invalid text or a missing window.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L114)

<a id="function-function-mq3-platform-playable-window-shouldclose-function-shouldclose-src-mq3-platform-playable-window-ml-2097839008"></a>
### shouldClose

```ml
function shouldClose()
```

Computes `shouldCloseNative()!=0` for `mq3.platform.playable_window.shouldClose`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L739)

<a id="extern_function-extern-function-mq3-platform-playable-window-shouldclosenative-extern-function-shouldclosenative-from-playable-window-dll-symbol-playable-window-should-close-returns-i32-src-mq3-platform-playable-window-ml-163775701"></a>
### shouldCloseNative

```ml
extern function shouldCloseNative() from "playable_window.dll" symbol "playable_window_should_close" returns i32
```

Reads the native window-close request without consuming it.


**Returns:** Nonzero when closing has been requested.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L109)

<a id="function-function-mq3-platform-playable-window-showloading-function-showloading-progress-status-src-mq3-platform-playable-window-ml-1871681295"></a>
### showLoading

```ml
function showLoading(progress, status)
```

Updates the loading-window title and progress graphics while honoring close requests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `progress` | `dynamic` | — | Value forwarded as `progress` to `mq3.platform.playable_window.loadingTitle`. |
| `status` | `dynamic` | — | Value forwarded as `status` to `mq3.platform.playable_window.loadingTitle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L761)

<a id="function-function-mq3-platform-playable-window-shutdown-function-shutdown-src-mq3-platform-playable-window-ml-1657913210"></a>
### shutdown

```ml
function shutdown()
```

Returns `void` from `mq3.platform.playable_window.shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L877)

<a id="extern_function-extern-function-mq3-platform-playable-window-shutdownnative-extern-function-shutdownnative-from-playable-window-dll-symbol-playable-window-shutdown-returns-void-src-mq3-platform-playable-window-ml-1716055113"></a>
### shutdownNative

```ml
extern function shutdownNative() from "playable_window.dll" symbol "playable_window_shutdown" returns void
```

Destroys the preview window and releases native rendering/input resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L311)

<a id="function-function-mq3-platform-playable-window-submittrianglebatch-function-submittrianglebatch-batch-src-mq3-platform-playable-window-ml-1690429166"></a>
### submitTriangleBatch

```ml
function submitTriangleBatch(batch)
```

Computes `submitTriangleBatch` from `triangleBatchNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count)` using `mq3.platform.playable_window.triangleBatchNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.count`, `batch.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1252)

<a id="function-function-mq3-platform-playable-window-submitworldtrianglebatch-function-submitworldtrianglebatch-batch-projection-src-mq3-platform-playable-window-ml-1176095633"></a>
### submitWorldTriangleBatch

```ml
function submitWorldTriangleBatch(batch, projection)
```

Submits packed world triangles with the camera projection, adjusting vertical scaling before the native draw.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.count`, `batch.data`. |
| `projection` | `dynamic` | — | Record providing `projection.position`, `projection.right`, `projection.up`, `projection.forward`, `projection.verticalFocal`, `projection.focal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1261)

<a id="function-function-mq3-platform-playable-window-submitworldtrianglebatchviewport-function-submitworldtrianglebatchviewport-batch-projection-area-src-mq3-platform-playable-window-ml-1065097078"></a>
### submitWorldTriangleBatchViewport

```ml
function submitWorldTriangleBatchViewport(batch, projection, area)
```

Validates an explicit viewport and camera projection before submitting packed world triangles within it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.count`, `batch.data`. |
| `projection` | `dynamic` | — | Record providing `projection.position`, `projection.right`, `projection.up`, `projection.forward`, `projection.verticalFocal`, `projection.focal`. |
| `area` | `dynamic` | — | Record providing `area.x`, `area.y`, `area.width`, `area.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1290)

<a id="function-function-mq3-platform-playable-window-takevideorestart-function-takevideorestart-src-mq3-platform-playable-window-ml-822407430"></a>
### takeVideoRestart

```ml
function takeVideoRestart()
```

Computes `takeVideoRestartNative()!=0` for `mq3.platform.playable_window.takeVideoRestart`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L842)

<a id="extern_function-extern-function-mq3-platform-playable-window-takevideorestartnative-extern-function-takevideorestartnative-from-playable-window-dll-symbol-playable-window-take-video-restart-returns-i32-src-mq3-platform-playable-window-ml-630631836"></a>
### takeVideoRestartNative

```ml
extern function takeVideoRestartNative() from "playable_window.dll" symbol "playable_window_take_video_restart" returns i32
```

Atomically consumes the pending native video-restart request.


**Returns:** The previous request flag; the stored flag is reset to zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L239)

<a id="constant-constant-mq3-platform-playable-window-triangle-batch-max-count-const-triangle-batch-max-count-65536-src-mq3-platform-playable-window-ml-989129662"></a>
### TRIANGLE_BATCH_MAX_COUNT

```ml
const TRIANGLE_BATCH_MAX_COUNT = 65536
```

Maximum number of packed triangle records accepted by one native batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L592)

<a id="constant-constant-mq3-platform-playable-window-triangle-batch-record-bytes-const-triangle-batch-record-bytes-128-src-mq3-platform-playable-window-ml-1395760788"></a>
### TRIANGLE_BATCH_RECORD_BYTES

```ml
const TRIANGLE_BATCH_RECORD_BYTES = 128
```

Byte size of one packed triangle record consumed by the native drawing backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L590)

- [mq3.platform.playable_window.TriangleBatch](Type-mq3-platform-playable-window-trianglebatch-647964754.md) — struct
<a id="extern_function-extern-function-mq3-platform-playable-window-trianglebatchnative-extern-function-trianglebatchnative-records-as-ptr-bytecount-as-i32-trianglecount-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-batch-returns-i32-src-mq3-platform-playable-window-ml-1886429961"></a>
### triangleBatchNative

```ml
extern function triangleBatchNative(records as ptr, byteCount as i32, triangleCount as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_batch" returns i32
```

Draws a bounded array of packed screen-space triangle records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Read-only packed triangle array with 128-byte records. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `triangleCount` | `i32` | — | Number of packed triangle records to process. |


**Returns:** The submitted triangle count; 0 for invalid input or an empty batch.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L436)

<a id="extern_function-extern-function-mq3-platform-playable-window-trianglecolorednative-extern-function-trianglecolorednative-textureslot-as-i32-x0-as-double-y0-as-double-depth0-as-double-u0-as-double-v0-as-double-x1-as-double-y1-as-double-depth1-as-double-u1-as-double-v1-as-double-x2-as-double-y2-as-double-depth2-as-double-u2-as-double-v2-as-double-red0-as-i32-green0-as-i32-blue0-as-i32-alpha0-as-i32-red1-as-i32-green1-as-i32-blue1-as-i32-alpha1-as-i32-red2-as-i32-green2-as-i32-blue2-as-i32-alpha2-as-i32-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-colored-returns-void-src-mq3-platform-playable-window-ml-1818432715"></a>
### triangleColoredNative

```ml
extern function triangleColoredNative(textureSlot as i32, x0 as double, y0 as double, depth0 as double, u0 as double, v0 as double, x1 as double, y1 as double, depth1 as double, u1 as double, v1 as double, x2 as double, y2 as double, depth2 as double, u2 as double, v2 as double, red0 as i32, green0 as i32, blue0 as i32, alpha0 as i32, red1 as i32, green1 as i32, blue1 as i32, alpha1 as i32, red2 as i32, green2 as i32, blue2 as i32, alpha2 as i32, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_colored" returns void
```

Draws one textured triangle with per-vertex RGBA modulation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `i32` | — | Texture slot selected for this primitive. |
| `x0` | `double` | — | X coordinate for vertex 0. |
| `y0` | `double` | — | Y coordinate for vertex 0. |
| `depth0` | `double` | — | Depth for vertex 0. |
| `u0` | `double` | — | U texture coordinate for vertex 0. |
| `v0` | `double` | — | V texture coordinate for vertex 0. |
| `x1` | `double` | — | X coordinate for vertex 1. |
| `y1` | `double` | — | Y coordinate for vertex 1. |
| `depth1` | `double` | — | Depth for vertex 1. |
| `u1` | `double` | — | U texture coordinate for vertex 1. |
| `v1` | `double` | — | V texture coordinate for vertex 1. |
| `x2` | `double` | — | X coordinate for vertex 2. |
| `y2` | `double` | — | Y coordinate for vertex 2. |
| `depth2` | `double` | — | Depth for vertex 2. |
| `u2` | `double` | — | U texture coordinate for vertex 2. |
| `v2` | `double` | — | V texture coordinate for vertex 2. |
| `red0` | `i32` | — | Red component for vertex 0. |
| `green0` | `i32` | — | Green component for vertex 0. |
| `blue0` | `i32` | — | Blue component for vertex 0. |
| `alpha0` | `i32` | — | Alpha component for vertex 0. |
| `red1` | `i32` | — | Red component for vertex 1. |
| `green1` | `i32` | — | Green component for vertex 1. |
| `blue1` | `i32` | — | Blue component for vertex 1. |
| `alpha1` | `i32` | — | Alpha component for vertex 1. |
| `red2` | `i32` | — | Red component for vertex 2. |
| `green2` | `i32` | — | Green component for vertex 2. |
| `blue2` | `i32` | — | Blue component for vertex 2. |
| `alpha2` | `i32` | — | Alpha component for vertex 2. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L430)

<a id="extern_function-extern-function-mq3-platform-playable-window-trianglenative-extern-function-trianglenative-textureslot-as-i32-x0-as-double-y0-as-double-depth0-as-double-u0-as-double-v0-as-double-light0-as-double-x1-as-double-y1-as-double-depth1-as-double-u1-as-double-v1-as-double-light1-as-double-x2-as-double-y2-as-double-depth2-as-double-u2-as-double-v2-as-double-light2-as-double-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-returns-void-src-mq3-platform-playable-window-ml-1819333212"></a>
### triangleNative

```ml
extern function triangleNative(textureSlot as i32, x0 as double, y0 as double, depth0 as double, u0 as double, v0 as double, light0 as double, x1 as double, y1 as double, depth1 as double, u1 as double, v1 as double, light1 as double, x2 as double, y2 as double, depth2 as double, u2 as double, v2 as double, light2 as double, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle" returns void
```

Draws one textured triangle with per-vertex depth and lighting.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `i32` | — | Texture slot selected for this primitive. |
| `x0` | `double` | — | X coordinate for vertex 0. |
| `y0` | `double` | — | Y coordinate for vertex 0. |
| `depth0` | `double` | — | Depth for vertex 0. |
| `u0` | `double` | — | U texture coordinate for vertex 0. |
| `v0` | `double` | — | V texture coordinate for vertex 0. |
| `light0` | `double` | — | Light intensity for vertex 0. |
| `x1` | `double` | — | X coordinate for vertex 1. |
| `y1` | `double` | — | Y coordinate for vertex 1. |
| `depth1` | `double` | — | Depth for vertex 1. |
| `u1` | `double` | — | U texture coordinate for vertex 1. |
| `v1` | `double` | — | V texture coordinate for vertex 1. |
| `light1` | `double` | — | Light intensity for vertex 1. |
| `x2` | `double` | — | X coordinate for vertex 2. |
| `y2` | `double` | — | Y coordinate for vertex 2. |
| `depth2` | `double` | — | Depth for vertex 2. |
| `u2` | `double` | — | U texture coordinate for vertex 2. |
| `v2` | `double` | — | V texture coordinate for vertex 2. |
| `light2` | `double` | — | Light intensity for vertex 2. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L397)

<a id="function-function-mq3-platform-playable-window-updatespecularpass-function-updatespecularpass-batch-as-trianglebatch-normals-as-bytes-eye-as-array-src-mq3-platform-playable-window-ml-666298313"></a>
### updateSpecularPass

```ml
function updateSpecularPass(batch as TriangleBatch, normals as bytes, eye as array)
```

Recomputes packed specular vertex colors from 36-byte triangle-normal records and the eye position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `TriangleBatch` | — | Record providing `batch.data`, `batch.count`. |
| `normals` | `bytes` | — | Read-only packed float32 normals, 36 bytes per triangle in batch order. |
| `eye` | `array` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1076)

<a id="extern_function-extern-function-mq3-platform-playable-window-updatespecularpassnative-extern-function-updatespecularpassnative-data-as-ptr-bytecount-as-i32-normals-as-ptr-normalbytes-as-i32-triangles-as-i32-eyex-as-double-eyey-as-double-eyez-as-double-from-playable-window-dll-symbol-playable-window-update-specular-pass-returns-i32-src-mq3-platform-playable-window-ml-1076863331"></a>
### updateSpecularPassNative

```ml
extern function updateSpecularPassNative(data as ptr, byteCount as i32, normals as ptr, normalBytes as i32, triangles as i32, eyeX as double, eyeY as double, eyeZ as double) from "playable_window.dll" symbol "playable_window_update_specular_pass" returns i32
```

Updates per-vertex specular alpha in packed triangles using stored normals and the eye position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — | Writable 128-byte triangle records whose vertex colors/light values are updated. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `normals` | `ptr` | — | Read-only 36-byte records containing three float32 normals per triangle. |
| `normalBytes` | `i32` | — | Size of the packed normal buffer in bytes. |
| `triangles` | `i32` | — | Number of triangles associated with the face or processed range. |
| `eyeX` | `double` | — | X component of the view position. |
| `eyeY` | `double` | — | Y component of the view position. |
| `eyeZ` | `double` | — | Z component of the view position. |


**Returns:** 1 when the specular update succeeds; 0 for inconsistent native buffers.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L236)

<a id="function-function-mq3-platform-playable-window-updatestagevertex-function-updatestagevertex-batch-as-trianglebatch-triangle-as-int-vertex-as-int-position-as-array-uv-as-array-color-as-array-src-mq3-platform-playable-window-ml-508093948"></a>
### updateStageVertex

```ml
function updateStageVertex(batch as TriangleBatch, triangle as int, vertex as int, position as array, uv as array, color as array)
```

Replaces one packed shader-stage vertex using world position, UV coordinates, and RGBA modulation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `TriangleBatch` | — | Record providing `batch.data`. |
| `triangle` | `int` | — | Value forwarded as `triangle` to `mq3.platform.playable_window.updateStageVertexNative`. |
| `vertex` | `int` | — | Value forwarded as `vertex` to `mq3.platform.playable_window.updateStageVertexNative`. |
| `position` | `array` | — | Three-component vector read at indices 0, 1, and 2. |
| `uv` | `array` | — | Indexed input read at `0`, `1`. |
| `color` | `array` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1068)

<a id="extern_function-extern-function-mq3-platform-playable-window-updatestagevertexnative-extern-function-updatestagevertexnative-data-as-ptr-count-as-i32-triangle-as-i32-vertex-as-i32-x-as-double-y-as-double-z-as-double-u-as-double-v-as-double-red-as-i32-green-as-i32-blue-as-i32-alpha-as-i32-from-playable-window-dll-symbol-playable-window-update-stage-vertex-returns-i32-src-mq3-platform-playable-window-ml-43722136"></a>
### updateStageVertexNative

```ml
extern function updateStageVertexNative(data as ptr, count as i32, triangle as i32, vertex as i32, x as double, y as double, z as double, u as double, v as double, red as i32, green as i32, blue as i32, alpha as i32) from "playable_window.dll" symbol "playable_window_update_stage_vertex" returns i32
```

Updates a shader-stage vertex position, texture coordinates, and color in a packed triangle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — | Writable 128-byte triangle-record array. |
| `count` | `i32` | — | Destination-buffer capacity in bytes, despite the parameter name count. |
| `triangle` | `i32` | — | Zero-based triangle record index. |
| `vertex` | `i32` | — | Vertex index within the triangle. |
| `x` | `double` | — | X component of the position. |
| `y` | `double` | — | Y component of the position. |
| `z` | `double` | — | Z component of the position. |
| `u` | `double` | — | U texture coordinate of the vertex. |
| `v` | `double` | — | V texture coordinate of the vertex. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |
| `alpha` | `i32` | — | Alpha channel intensity supplied to the drawing operation. |


**Returns:** 1 when the update succeeds; 0 for an invalid destination or vertex.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L225)

<a id="function-function-mq3-platform-playable-window-uploadmaterialtexture-function-uploadmaterialtexture-slot-rgba-width-height-mipmapped-allowpicmip-src-mq3-platform-playable-window-ml-199329563"></a>
### uploadMaterialTexture

```ml
function uploadMaterialTexture(slot, rgba, width, height, mipmapped, allowPicmip)
```

Computes `uploadMaterialTexture` from `uploadMaterialTextureNative(slot,nativeBytesPtr(rgba),width,height,mip,picmip)!=0` using `mq3.platform.playable_window.uploadMaterialTextureNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Value forwarded as `slot` to `mq3.platform.playable_window.uploadMaterialTextureNative`. |
| `rgba` | `dynamic` | — | Input tested by `typeof(rgba)!="bytes"`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.uploadMaterialTextureNative`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.uploadMaterialTextureNative`. |
| `mipmapped` | `dynamic` | — | Input tested by `mipmapped`. |
| `allowPicmip` | `dynamic` | — | Input tested by `allowPicmip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L931)

<a id="extern_function-extern-function-mq3-platform-playable-window-uploadmaterialtexturenative-extern-function-uploadmaterialtexturenative-slot-as-i32-rgba-as-ptr-width-as-i32-height-as-i32-mipmapped-as-i32-allowpicmip-as-i32-from-playable-window-dll-symbol-playable-window-upload-material-texture-returns-i32-src-mq3-platform-playable-window-ml-651090063"></a>
### uploadMaterialTextureNative

```ml
extern function uploadMaterialTextureNative(slot as i32, rgba as ptr, width as i32, height as i32, mipmapped as i32, allowPicmip as i32) from "playable_window.dll" symbol "playable_window_upload_material_texture" returns i32
```

Uploads an RGBA material texture with optional mipmaps and configured picmip reduction.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — | Texture slot selected by the native renderer. |
| `rgba` | `ptr` | — | Read-only RGBA8 pixels, width * height * 4 bytes before any picmip reduction. |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |
| `mipmapped` | `i32` | — | Nonzero requests a mipmapped texture. |
| `allowPicmip` | `i32` | — | Nonzero permits the configured texture-picmip reduction. |


**Returns:** 1 when upload succeeds; 0 for invalid input or allocation/upload failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L366)

<a id="function-function-mq3-platform-playable-window-uploadtexture-function-uploadtexture-slot-rgba-width-height-src-mq3-platform-playable-window-ml-1617092781"></a>
### uploadTexture

```ml
function uploadTexture(slot, rgba, width, height)
```

Returns `uploadTextureNative(slot,nativeBytesPtr(rgba),width,height)!=0` from `mq3.platform.playable_window.uploadTexture`; earlier branches return `error(7483,"preview texture must be RGBA bytes")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Value forwarded as `slot` to `mq3.platform.playable_window.uploadTextureNative`. |
| `rgba` | `dynamic` | — | Input tested by `typeof(rgba)!="bytes"`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.uploadTextureNative`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.uploadTextureNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L903)

<a id="function-function-mq3-platform-playable-window-uploadtexturemipmapped-function-uploadtexturemipmapped-slot-rgba-width-height-mipmapped-src-mq3-platform-playable-window-ml-558754384"></a>
### uploadTextureMipmapped

```ml
function uploadTextureMipmapped(slot, rgba, width, height, mipmapped)
```

Computes `uploadTextureMipmapped` from `uploadTextureMipmappedNative(slot,nativeBytesPtr(rgba),width,height,value)!=0` using `mq3.platform.playable_window.uploadTextureMipmappedNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Value forwarded as `slot` to `mq3.platform.playable_window.uploadTextureMipmappedNative`. |
| `rgba` | `dynamic` | — | Input tested by `typeof(rgba)!="bytes"`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.uploadTextureMipmappedNative`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.uploadTextureMipmappedNative`. |
| `mipmapped` | `dynamic` | — | Input tested by `mipmapped`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L913)

<a id="extern_function-extern-function-mq3-platform-playable-window-uploadtexturemipmappednative-extern-function-uploadtexturemipmappednative-slot-as-i32-rgba-as-ptr-width-as-i32-height-as-i32-mipmapped-as-i32-from-playable-window-dll-symbol-playable-window-upload-texture-mipmapped-returns-i32-src-mq3-platform-playable-window-ml-579418564"></a>
### uploadTextureMipmappedNative

```ml
extern function uploadTextureMipmappedNative(slot as i32, rgba as ptr, width as i32, height as i32, mipmapped as i32) from "playable_window.dll" symbol "playable_window_upload_texture_mipmapped" returns i32
```

Uploads RGBA pixels to a native slot with explicit mipmap selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — | Texture slot selected by the native renderer. |
| `rgba` | `ptr` | — | Read-only RGBA8 pixels, width * height * 4 bytes before any picmip reduction. |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |
| `mipmapped` | `i32` | — | Nonzero requests a mipmapped texture. |


**Returns:** 1 when upload succeeds; 0 for invalid input or allocation/upload failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L357)

<a id="extern_function-extern-function-mq3-platform-playable-window-uploadtexturenative-extern-function-uploadtexturenative-slot-as-i32-rgba-as-ptr-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-upload-texture-returns-i32-src-mq3-platform-playable-window-ml-800287083"></a>
### uploadTextureNative

```ml
extern function uploadTextureNative(slot as i32, rgba as ptr, width as i32, height as i32) from "playable_window.dll" symbol "playable_window_upload_texture" returns i32
```

Copies RGBA pixels into a native texture slot with mipmapping enabled.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — | Texture slot selected by the native renderer. |
| `rgba` | `ptr` | — | Read-only RGBA8 pixels, width * height * 4 bytes before any picmip reduction. |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |


**Returns:** 1 when upload succeeds; 0 for invalid input or allocation/upload failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L349)

<a id="function-function-mq3-platform-playable-window-uploadtexturenomip-function-uploadtexturenomip-slot-rgba-width-height-src-mq3-platform-playable-window-ml-556825245"></a>
### uploadTextureNoMip

```ml
function uploadTextureNoMip(slot, rgba, width, height)
```

Calls `mq3.platform.playable_window.uploadTextureMipmapped` with `(slot,rgba,width,height,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Value forwarded as `slot` to `mq3.platform.playable_window.uploadTextureMipmapped`. |
| `rgba` | `dynamic` | — | Value forwarded as `rgba` to `mq3.platform.playable_window.uploadTextureMipmapped`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.platform.playable_window.uploadTextureMipmapped`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.platform.playable_window.uploadTextureMipmapped`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L923)

<a id="function-function-mq3-platform-playable-window-validviewportrectangle-function-validviewportrectangle-x-y-width-height-src-mq3-platform-playable-window-ml-1228611676"></a>
### validViewportRectangle

```ml
function validViewportRectangle(x, y, width, height)
```

Checks positive viewport dimensions and signed 32-bit bounds for the origin and far edges.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Signed screen-space viewport origin in pixels. |
| `y` | `dynamic` | — | Signed screen-space viewport origin in pixels. |
| `width` | `dynamic` | — | Positive viewport width; x + width must remain within signed 32-bit range. |
| `height` | `dynamic` | — | Positive viewport height; y + height must remain within signed 32-bit range. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1274)

<a id="function-function-mq3-platform-playable-window-viewport-function-viewport-x-y-width-height-src-mq3-platform-playable-window-ml-979740628"></a>
### viewport

```ml
function viewport(x, y, width, height)
```

Builds `mq3.platform.playable_window.Viewport` for `mq3.platform.playable_window.viewport`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Initial value for `mq3.platform.playable_window.Viewport.x`. |
| `y` | `dynamic` | — | Initial value for `mq3.platform.playable_window.Viewport.y`. |
| `width` | `dynamic` | — | Initial value for `mq3.platform.playable_window.Viewport.width`. |
| `height` | `dynamic` | — | Initial value for `mq3.platform.playable_window.Viewport.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1282)

- [mq3.platform.playable_window.Viewport](Type-mq3-platform-playable-window-viewport-170347776.md) — struct
<a id="constant-constant-mq3-platform-playable-window-vk-1-const-vk-1-49-src-mq3-platform-playable-window-ml-135874554"></a>
### VK_1

```ml
const VK_1 = 49
```

Windows virtual-key code for 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L566)

<a id="constant-constant-mq3-platform-playable-window-vk-2-const-vk-2-50-src-mq3-platform-playable-window-ml-1944671586"></a>
### VK_2

```ml
const VK_2 = 50
```

Windows virtual-key code for 2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L568)

<a id="constant-constant-mq3-platform-playable-window-vk-3-const-vk-3-51-src-mq3-platform-playable-window-ml-1315080067"></a>
### VK_3

```ml
const VK_3 = 51
```

Windows virtual-key code for 3.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L570)

<a id="constant-constant-mq3-platform-playable-window-vk-4-const-vk-4-52-src-mq3-platform-playable-window-ml-702669996"></a>
### VK_4

```ml
const VK_4 = 52
```

Windows virtual-key code for 4.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L572)

<a id="constant-constant-mq3-platform-playable-window-vk-5-const-vk-5-53-src-mq3-platform-playable-window-ml-633772509"></a>
### VK_5

```ml
const VK_5 = 53
```

Windows virtual-key code for 5.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L574)

<a id="constant-constant-mq3-platform-playable-window-vk-6-const-vk-6-54-src-mq3-platform-playable-window-ml-1324889350"></a>
### VK_6

```ml
const VK_6 = 54
```

Windows virtual-key code for 6.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L576)

<a id="constant-constant-mq3-platform-playable-window-vk-7-const-vk-7-55-src-mq3-platform-playable-window-ml-20839543"></a>
### VK_7

```ml
const VK_7 = 55
```

Windows virtual-key code for 7.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L578)

<a id="constant-constant-mq3-platform-playable-window-vk-8-const-vk-8-56-src-mq3-platform-playable-window-ml-693376464"></a>
### VK_8

```ml
const VK_8 = 56
```

Windows virtual-key code for 8.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L580)

<a id="constant-constant-mq3-platform-playable-window-vk-9-const-vk-9-57-src-mq3-platform-playable-window-ml-130175377"></a>
### VK_9

```ml
const VK_9 = 57
```

Windows virtual-key code for 9.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L582)

<a id="constant-constant-mq3-platform-playable-window-vk-a-const-vk-a-65-src-mq3-platform-playable-window-ml-1135225328"></a>
### VK_A

```ml
const VK_A = 65
```

Windows virtual-key code for A.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L552)

<a id="constant-constant-mq3-platform-playable-window-vk-d-const-vk-d-68-src-mq3-platform-playable-window-ml-237251081"></a>
### VK_D

```ml
const VK_D = 68
```

Windows virtual-key code for D.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L554)

<a id="constant-constant-mq3-platform-playable-window-vk-down-const-vk-down-40-src-mq3-platform-playable-window-ml-29903945"></a>
### VK_DOWN

```ml
const VK_DOWN = 40
```

Windows virtual-key code for down arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L550)

<a id="constant-constant-mq3-platform-playable-window-vk-e-const-vk-e-69-src-mq3-platform-playable-window-ml-578565452"></a>
### VK_E

```ml
const VK_E = 69
```

Windows virtual-key code for E.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L556)

<a id="constant-constant-mq3-platform-playable-window-vk-escape-const-vk-escape-27-src-mq3-platform-playable-window-ml-215516386"></a>
### VK_ESCAPE

```ml
const VK_ESCAPE = 27
```

Windows virtual-key code for Escape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L518)

<a id="constant-constant-mq3-platform-playable-window-vk-lbutton-const-vk-lbutton-1-src-mq3-platform-playable-window-ml-758947988"></a>
### VK_LBUTTON

```ml
const VK_LBUTTON = 1
```

Windows virtual-key code for left mouse button.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L520)

<a id="constant-constant-mq3-platform-playable-window-vk-mbutton-const-vk-mbutton-4-src-mq3-platform-playable-window-ml-639602633"></a>
### VK_MBUTTON

```ml
const VK_MBUTTON = 4
```

Windows virtual-key code for middle mouse button.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L524)

<a id="constant-constant-mq3-platform-playable-window-vk-q-const-vk-q-81-src-mq3-platform-playable-window-ml-459947422"></a>
### VK_Q

```ml
const VK_Q = 81
```

Windows virtual-key code for Q.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L558)

<a id="constant-constant-mq3-platform-playable-window-vk-rbutton-const-vk-rbutton-2-src-mq3-platform-playable-window-ml-361660889"></a>
### VK_RBUTTON

```ml
const VK_RBUTTON = 2
```

Windows virtual-key code for right mouse button.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L522)

<a id="constant-constant-mq3-platform-playable-window-vk-return-const-vk-return-13-src-mq3-platform-playable-window-ml-172514413"></a>
### VK_RETURN

```ml
const VK_RETURN = 13
```

Windows virtual-key code for Enter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L544)

<a id="constant-constant-mq3-platform-playable-window-vk-s-const-vk-s-83-src-mq3-platform-playable-window-ml-916277196"></a>
### VK_S

```ml
const VK_S = 83
```

Windows virtual-key code for S.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L560)

<a id="constant-constant-mq3-platform-playable-window-vk-shift-const-vk-shift-16-src-mq3-platform-playable-window-ml-916958736"></a>
### VK_SHIFT

```ml
const VK_SHIFT = 16
```

Windows virtual-key code for Shift.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L564)

<a id="constant-constant-mq3-platform-playable-window-vk-space-const-vk-space-32-src-mq3-platform-playable-window-ml-221536986"></a>
### VK_SPACE

```ml
const VK_SPACE = 32
```

Windows virtual-key code for Space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L546)

<a id="constant-constant-mq3-platform-playable-window-vk-up-const-vk-up-38-src-mq3-platform-playable-window-ml-1146138406"></a>
### VK_UP

```ml
const VK_UP = 38
```

Windows virtual-key code for up arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L548)

<a id="constant-constant-mq3-platform-playable-window-vk-w-const-vk-w-87-src-mq3-platform-playable-window-ml-1386868648"></a>
### VK_W

```ml
const VK_W = 87
```

Windows virtual-key code for W.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L562)

<a id="constant-constant-mq3-platform-playable-window-vk-xbutton1-const-vk-xbutton1-5-src-mq3-platform-playable-window-ml-760277378"></a>
### VK_XBUTTON1

```ml
const VK_XBUTTON1 = 5
```

Windows virtual-key code for first extended mouse button.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L526)

<a id="constant-constant-mq3-platform-playable-window-vk-xbutton2-const-vk-xbutton2-6-src-mq3-platform-playable-window-ml-1422864375"></a>
### VK_XBUTTON2

```ml
const VK_XBUTTON2 = 6
```

Windows virtual-key code for second extended mouse button.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L528)

<a id="function-function-mq3-platform-playable-window-windowstate-function-windowstate-src-mq3-platform-playable-window-ml-1955323936"></a>
### windowState

```ml
function windowState()
```

Builds `mq3.platform.playable_window.WindowState` for `mq3.platform.playable_window.windowState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L844)

- [mq3.platform.playable_window.WindowState](Type-mq3-platform-playable-window-windowstate-1074205599.md) — struct
<a id="extern_function-extern-function-mq3-platform-playable-window-windowstatenative-extern-function-windowstatenative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-window-state-returns-i32-src-mq3-platform-playable-window-ml-1833374613"></a>
### windowStateNative

```ml
extern function windowStateNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_window_state" returns i32
```

Copies focus, minimization, position, fullscreen, and activation information into a native integer record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable storage for seven 32-bit window-state fields. |
| `capacity` | `i32` | — | Number of 32-bit output fields; at least seven are required. |


**Returns:** 1 when the state record is written; 0 for an invalid output buffer.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L244)

<a id="extern_function-extern-function-mq3-platform-playable-window-worldtrianglebatchnative-extern-function-worldtrianglebatchnative-records-as-ptr-bytecount-as-i32-trianglecount-as-i32-positionx-as-double-positiony-as-double-positionz-as-double-rightx-as-double-righty-as-double-rightz-as-double-upx-as-double-upy-as-double-upz-as-double-forwardx-as-double-forwardy-as-double-forwardz-as-double-halfwidth-as-double-halfheight-as-double-focal-as-double-neardistance-as-double-from-playable-window-dll-symbol-playable-window-draw-world-triangle-batch-returns-i32-src-mq3-platform-playable-window-ml-132647626"></a>
### worldTriangleBatchNative

```ml
extern function worldTriangleBatchNative(records as ptr, byteCount as i32, triangleCount as i32, positionX as double, positionY as double, positionZ as double, rightX as double, rightY as double, rightZ as double, upX as double, upY as double, upZ as double, forwardX as double, forwardY as double, forwardZ as double, halfWidth as double, halfHeight as double, focal as double, nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch" returns i32
```

Transforms and draws packed world-space triangles using the supplied camera basis.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Read-only packed triangle array with 128-byte records. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `triangleCount` | `i32` | — | Number of packed triangle records to process. |
| `positionX` | `double` | — | X component of the camera position. |
| `positionY` | `double` | — | Y component of the camera position. |
| `positionZ` | `double` | — | Z component of the camera position. |
| `rightX` | `double` | — | X component of the camera right axis. |
| `rightY` | `double` | — | Y component of the camera right axis. |
| `rightZ` | `double` | — | Z component of the camera right axis. |
| `upX` | `double` | — | X component of the camera up axis. |
| `upY` | `double` | — | Y component of the camera up axis. |
| `upZ` | `double` | — | Z component of the camera up axis. |
| `forwardX` | `double` | — | X component of the camera forward axis. |
| `forwardY` | `double` | — | Y component of the camera forward axis. |
| `forwardZ` | `double` | — | Z component of the camera forward axis. |
| `halfWidth` | `double` | — | Half of the render-surface width in pixels. |
| `halfHeight` | `double` | — | Half of the render-surface height in pixels. |
| `focal` | `double` | — | Perspective focal length in pixels. |
| `nearDistance` | `double` | — | Near clipping distance in camera-space units. |


**Returns:** The submitted triangle count or native hardware result; 0 for invalid input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L489)

<a id="extern_function-extern-function-mq3-platform-playable-window-worldtrianglebatchviewportnative-extern-function-worldtrianglebatchviewportnative-records-as-ptr-bytecount-as-i32-trianglecount-as-i32-viewportx-as-i32-viewporty-as-i32-viewportwidth-as-i32-viewportheight-as-i32-positionx-as-double-positiony-as-double-positionz-as-double-rightx-as-double-righty-as-double-rightz-as-double-upx-as-double-upy-as-double-upz-as-double-forwardx-as-double-forwardy-as-double-forwardz-as-double-focal-as-double-neardistance-as-double-from-playable-window-dll-symbol-playable-window-draw-world-triangle-batch-viewport-returns-i32-src-mq3-platform-playable-window-ml-1329438064"></a>
### worldTriangleBatchViewportNative

```ml
extern function worldTriangleBatchViewportNative(records as ptr, byteCount as i32, triangleCount as i32, viewportX as i32, viewportY as i32, viewportWidth as i32, viewportHeight as i32, positionX as double, positionY as double, positionZ as double, rightX as double, rightY as double, rightZ as double, upX as double, upY as double, upZ as double, forwardX as double, forwardY as double, forwardZ as double, focal as double, nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch_viewport" returns i32
```

Transforms world-space triangles and draws them within an explicit viewport.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Read-only packed triangle array with 128-byte records. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `triangleCount` | `i32` | — | Number of packed triangle records to process. |
| `viewportX` | `i32` | — | Viewport x in pixels. |
| `viewportY` | `i32` | — | Viewport y in pixels. |
| `viewportWidth` | `i32` | — | Viewport width in pixels. |
| `viewportHeight` | `i32` | — | Viewport height in pixels. |
| `positionX` | `double` | — | X component of the camera position. |
| `positionY` | `double` | — | Y component of the camera position. |
| `positionZ` | `double` | — | Z component of the camera position. |
| `rightX` | `double` | — | X component of the camera right axis. |
| `rightY` | `double` | — | Y component of the camera right axis. |
| `rightZ` | `double` | — | Z component of the camera right axis. |
| `upX` | `double` | — | X component of the camera up axis. |
| `upY` | `double` | — | Y component of the camera up axis. |
| `upZ` | `double` | — | Z component of the camera up axis. |
| `forwardX` | `double` | — | X component of the camera forward axis. |
| `forwardY` | `double` | — | Y component of the camera forward axis. |
| `forwardZ` | `double` | — | Z component of the camera forward axis. |
| `focal` | `double` | — | Perspective focal length in pixels. |
| `nearDistance` | `double` | — | Near clipping distance in camera-space units. |


**Returns:** The native draw result, normally the submitted triangle count; 0 for invalid input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L513)

<a id="function-function-mq3-platform-playable-window-writebatchcolor-function-writebatchcolor-data-as-bytes-offset-as-int-color-as-array-src-mq3-platform-playable-window-ml-597248269"></a>
### writeBatchColor

```ml
function writeBatchColor(data as bytes, offset as int, color as array)
```

Updates `data[offset+channel]` in `mq3.platform.playable_window.writeBatchColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — | Mutable record or buffer; this call updates `data[offset+channel]`. |
| `offset` | `int` | — | Input used by `data[offset+channel]=value`. |
| `color` | `array` | — | Indexed input read at `channel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1084)

<a id="function-function-mq3-platform-playable-window-writebatchf32-function-writebatchf32-data-offset-value-src-mq3-platform-playable-window-ml-1944898670"></a>
### writeBatchF32

```ml
function writeBatchF32(data, offset, value)
```

Returns `void` from `mq3.platform.playable_window.writeBatchF32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.writeU32`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.writeU32`. |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.floatBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1038)

<a id="function-function-mq3-platform-playable-window-writebatchi32-function-writebatchi32-data-offset-value-src-mq3-platform-playable-window-ml-1921342464"></a>
### writeBatchI32

```ml
function writeBatchI32(data, offset, value)
```

Returns `void` from `mq3.platform.playable_window.writeBatchI32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.writeU32`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.writeU32`. |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.i32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1033)

<a id="function-function-mq3-platform-playable-window-writebatchpositionvertex-function-writebatchpositionvertex-data-as-bytes-offset-as-int-position-as-array-baseuv-as-array-lightmapuv-as-array-light-src-mq3-platform-playable-window-ml-85667454"></a>
### writeBatchPositionVertex

```ml
function writeBatchPositionVertex(data as bytes, offset as int, position as array, baseUV as array, lightmapUV as array, light)
```

Writes a world-position vertex and its texture/lightmap coordinates into native packed triangle storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — | Writable packed triangle bytes; the native helper replaces the 32-byte vertex at offset. |
| `offset` | `int` | — | Value forwarded as `offset` to `mq3.platform.playable_window.writeBatchVertexNative`. |
| `position` | `array` | — | Three-component vector read at indices 0, 1, and 2. |
| `baseUV` | `array` | — | Indexed input read at `0`, `1`. |
| `lightmapUV` | `array` | — | Indexed input read at `0`, `1`. |
| `light` | `dynamic` | — | Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertexNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1057)

<a id="function-function-mq3-platform-playable-window-writebatchvertex-function-writebatchvertex-data-offset-point-baseuv-lightmapuv-light-src-mq3-platform-playable-window-ml-763296878"></a>
### writeBatchVertex

```ml
function writeBatchVertex(data, offset, point, baseUV, lightmapUV, light)
```

Writes a projected vertex and its texture/lightmap coordinates into native packed triangle storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Writable packed triangle bytes; the native helper replaces the 32-byte vertex at offset. |
| `offset` | `dynamic` | — | Value forwarded as `offset` to `mq3.platform.playable_window.writeBatchVertexNative`. |
| `point` | `dynamic` | — | Record providing `point.x`, `point.y`, `point.depth`. |
| `baseUV` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapUV` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `light` | `dynamic` | — | Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertexNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1046)

<a id="extern_function-extern-function-mq3-platform-playable-window-writebatchvertexnative-extern-function-writebatchvertexnative-data-as-ptr-count-as-i32-offset-as-i32-x-as-double-y-as-double-z-as-double-u-as-double-v-as-double-lu-as-double-lv-as-double-light-as-double-from-playable-window-dll-symbol-playable-window-write-batch-vertex-returns-i32-src-mq3-platform-playable-window-ml-1991944481"></a>
### writeBatchVertexNative

```ml
extern function writeBatchVertexNative(data as ptr, count as i32, offset as i32, x as double, y as double, z as double, u as double, v as double, lu as double, lv as double, light as double) from "playable_window.dll" symbol "playable_window_write_batch_vertex" returns i32
```

Writes one position/texture/lightmap vertex into a packed triangle record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — | Writable packed vertex/triangle storage. |
| `count` | `i32` | — | Available destination bytes, despite the MiniLang parameter name count. |
| `offset` | `i32` | — | Destination byte offset of the eight-float vertex; 32 writable bytes are required. |
| `x` | `double` | — | X component of the position. |
| `y` | `double` | — | Y component of the position. |
| `z` | `double` | — | Z component of the position. |
| `u` | `double` | — | U texture coordinate of the vertex. |
| `v` | `double` | — | V texture coordinate of the vertex. |
| `lu` | `double` | — | U lightmap coordinate of the vertex. |
| `lv` | `double` | — | V lightmap coordinate of the vertex. |
| `light` | `double` | — | Light intensity of the vertex. |


**Returns:** 1 when written; 0 for invalid record bounds or vertex input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L159)

<a id="extern_function-extern-function-mq3-platform-playable-window-writepositiontrianglenative-extern-function-writepositiontrianglenative-data-as-ptr-count-as-i32-triangle-as-i32-baseslot-as-i32-lightmapslot-as-i32-red-as-i32-green-as-i32-blue-as-i32-x0-as-double-y0-as-double-z0-as-double-u0-as-double-v0-as-double-lu0-as-double-lv0-as-double-light0-as-double-r0-as-i64-g0-as-i64-b0-as-i64-a0-as-i64-x1-as-double-y1-as-double-z1-as-double-u1-as-double-v1-as-double-lu1-as-double-lv1-as-double-light1-as-double-r1-as-i64-g1-as-i64-b1-as-i64-a1-as-i64-x2-as-double-y2-as-double-z2-as-double-u2-as-double-v2-as-double-lu2-as-double-lv2-as-double-light2-as-double-r2-as-i64-g2-as-i64-b2-as-i64-a2-as-i64-from-playable-window-dll-symbol-playable-window-write-position-triangle-returns-i32-src-mq3-platform-playable-window-ml-2058768400"></a>
### writePositionTriangleNative

```ml
extern function writePositionTriangleNative(data as ptr, count as i32, triangle as i32, baseSlot as i32, lightmapSlot as i32, red as i32, green as i32, blue as i32, x0 as double, y0 as double, z0 as double, u0 as double, v0 as double, lu0 as double, lv0 as double, light0 as double, r0 as i64, g0 as i64, b0 as i64, a0 as i64, x1 as double, y1 as double, z1 as double, u1 as double, v1 as double, lu1 as double, lv1 as double, light1 as double, r1 as i64, g1 as i64, b1 as i64, a1 as i64, x2 as double, y2 as double, z2 as double, u2 as double, v2 as double, lu2 as double, lv2 as double, light2 as double, r2 as i64, g2 as i64, b2 as i64, a2 as i64) from "playable_window.dll" symbol "playable_window_write_position_triangle" returns i32
```

Writes a complete textured, lit triangle into the native packed-record buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — | Writable 128-byte triangle-record array. |
| `count` | `i32` | — | Destination-buffer capacity in bytes, despite the parameter name count. |
| `triangle` | `i32` | — | Zero-based triangle record index. |
| `baseSlot` | `i32` | — | Texture slot for the base material. |
| `lightmapSlot` | `i32` | — | Texture slot for the lightmap. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |
| `x0` | `double` | — | X coordinate for vertex 0. |
| `y0` | `double` | — | Y coordinate for vertex 0. |
| `z0` | `double` | — | Z coordinate for vertex 0. |
| `u0` | `double` | — | U texture coordinate for vertex 0. |
| `v0` | `double` | — | V texture coordinate for vertex 0. |
| `lu0` | `double` | — | U lightmap coordinate for vertex 0. |
| `lv0` | `double` | — | V lightmap coordinate for vertex 0. |
| `light0` | `double` | — | Light intensity for vertex 0. |
| `r0` | `i64` | — | Red component for vertex 0. |
| `g0` | `i64` | — | Green component for vertex 0. |
| `b0` | `i64` | — | Blue component for vertex 0. |
| `a0` | `i64` | — | Alpha component for vertex 0. |
| `x1` | `double` | — | X coordinate for vertex 1. |
| `y1` | `double` | — | Y coordinate for vertex 1. |
| `z1` | `double` | — | Z coordinate for vertex 1. |
| `u1` | `double` | — | U texture coordinate for vertex 1. |
| `v1` | `double` | — | V texture coordinate for vertex 1. |
| `lu1` | `double` | — | U lightmap coordinate for vertex 1. |
| `lv1` | `double` | — | V lightmap coordinate for vertex 1. |
| `light1` | `double` | — | Light intensity for vertex 1. |
| `r1` | `i64` | — | Red component for vertex 1. |
| `g1` | `i64` | — | Green component for vertex 1. |
| `b1` | `i64` | — | Blue component for vertex 1. |
| `a1` | `i64` | — | Alpha component for vertex 1. |
| `x2` | `double` | — | X coordinate for vertex 2. |
| `y2` | `double` | — | Y coordinate for vertex 2. |
| `z2` | `double` | — | Z coordinate for vertex 2. |
| `u2` | `double` | — | U texture coordinate for vertex 2. |
| `v2` | `double` | — | V texture coordinate for vertex 2. |
| `lu2` | `double` | — | U lightmap coordinate for vertex 2. |
| `lv2` | `double` | — | V lightmap coordinate for vertex 2. |
| `light2` | `double` | — | Light intensity for vertex 2. |
| `r2` | `i64` | — | Red component for vertex 2. |
| `g2` | `i64` | — | Green component for vertex 2. |
| `b2` | `i64` | — | Blue component for vertex 2. |
| `a2` | `i64` | — | Alpha component for vertex 2. |


**Returns:** 1 when written; 0 for invalid record bounds or triangle input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L206)

<a id="extern_function-extern-function-mq3-platform-playable-window-writescreenquadnative-extern-function-writescreenquadnative-records-as-ptr-bytecount-as-i32-triangleindex-as-i32-textureslot-as-i32-x0-as-double-y0-as-double-d0-as-double-u0-as-double-v0-as-double-x1-as-double-y1-as-double-d1-as-double-u1-as-double-v1-as-double-x2-as-double-y2-as-double-d2-as-double-u2-as-double-v2-as-double-x3-as-double-y3-as-double-d3-as-double-u3-as-double-v3-as-double-red-as-i32-green-as-i32-blue-as-i32-alpha-as-i32-from-playable-window-dll-symbol-playable-window-write-screen-quad-returns-i32-src-mq3-platform-playable-window-ml-1372235619"></a>
### writeScreenQuadNative

```ml
extern function writeScreenQuadNative(records as ptr, byteCount as i32, triangleIndex as i32, textureSlot as i32, x0 as double, y0 as double, d0 as double, u0 as double, v0 as double, x1 as double, y1 as double, d1 as double, u1 as double, v1 as double, x2 as double, y2 as double, d2 as double, u2 as double, v2 as double, x3 as double, y3 as double, d3 as double, u3 as double, v3 as double, red as i32, green as i32, blue as i32, alpha as i32) from "playable_window.dll" symbol "playable_window_write_screen_quad" returns i32
```

Writes a screen-space quad as two packed triangle records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Writable packed triangle array; two consecutive 128-byte records are replaced. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `triangleIndex` | `i32` | — | Zero-based destination triangle index. |
| `textureSlot` | `i32` | — | Texture slot selected for this primitive. |
| `x0` | `double` | — | X coordinate for vertex 0. |
| `y0` | `double` | — | Y coordinate for vertex 0. |
| `d0` | `double` | — | Depth for vertex 0. |
| `u0` | `double` | — | U texture coordinate for vertex 0. |
| `v0` | `double` | — | V texture coordinate for vertex 0. |
| `x1` | `double` | — | X coordinate for vertex 1. |
| `y1` | `double` | — | Y coordinate for vertex 1. |
| `d1` | `double` | — | Depth for vertex 1. |
| `u1` | `double` | — | U texture coordinate for vertex 1. |
| `v1` | `double` | — | V texture coordinate for vertex 1. |
| `x2` | `double` | — | X coordinate for vertex 2. |
| `y2` | `double` | — | Y coordinate for vertex 2. |
| `d2` | `double` | — | Depth for vertex 2. |
| `u2` | `double` | — | U texture coordinate for vertex 2. |
| `v2` | `double` | — | V texture coordinate for vertex 2. |
| `x3` | `double` | — | X coordinate for vertex 3. |
| `y3` | `double` | — | Y coordinate for vertex 3. |
| `d3` | `double` | — | Depth for vertex 3. |
| `u3` | `double` | — | U texture coordinate for vertex 3. |
| `v3` | `double` | — | V texture coordinate for vertex 3. |
| `red` | `i32` | — | Red channel intensity supplied to the drawing operation. |
| `green` | `i32` | — | Green channel intensity supplied to the drawing operation. |
| `blue` | `i32` | — | Blue channel intensity supplied to the drawing operation. |
| `alpha` | `i32` | — | Alpha channel intensity supplied to the drawing operation. |


**Returns:** 2 when both triangle records are written; 0 for invalid destination/input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L467)

<a id="function-function-mq3-platform-playable-window-writescreenrect-function-writescreenrect-batch-triangleindex-textureslot-x-y-width-height-s1-t1-s2-t2-scalex-scaley-color-src-mq3-platform-playable-window-ml-1268726077"></a>
### writeScreenRect

```ml
function writeScreenRect(batch, triangleIndex, textureSlot, x, y, width, height, s1, t1, s2, t2, scaleX, scaleY, color)
```

Rewrites two existing packed triangles as a scaled screen rectangle with the supplied UVs and RGBA color.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.count`, `batch.data`. |
| `triangleIndex` | `dynamic` | — | Value forwarded as `triangleIndex` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `textureSlot` | `dynamic` | — | Value forwarded as `textureSlot` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `x` | `dynamic` | — | Input used by `left=x*scaleX`. |
| `y` | `dynamic` | — | Input used by `top=y*scaleY`. |
| `width` | `dynamic` | — | Input used by `right=(x+width)*scaleX`. |
| `height` | `dynamic` | — | Input used by `bottom=(y+height)*scaleY`. |
| `s1` | `dynamic` | — | Value forwarded as `u0` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `t1` | `dynamic` | — | Value forwarded as `v0` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `s2` | `dynamic` | — | Value forwarded as `u1` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `t2` | `dynamic` | — | Value forwarded as `v2` to `mq3.platform.playable_window.writeScreenQuadNative`. |
| `scaleX` | `dynamic` | — | Input used by `left=x*scaleX`. |
| `scaleY` | `dynamic` | — | Input used by `top=y*scaleY`. |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L1023)
