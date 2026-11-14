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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `texCoords` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L261)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetriangle-function-appendsingletexturetriangle-batch-textureslot-a-uva-lighta-b-uvb-lightb-c-uvc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-1421759216"></a>
### appendSingleTextureTriangle

```ml
function appendSingleTextureTriangle(batch, textureSlot, a, uvA, lightA, b, uvB, lightB, c, uvC, lightC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `uvA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `uvB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `uvC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L318)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetrianglecolored-function-appendsingletexturetrianglecolored-batch-textureslot-a-uva-lighta-colora-b-uvb-lightb-colorb-c-uvc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-421342993"></a>
### appendSingleTextureTriangleColored

```ml
function appendSingleTextureTriangleColored(batch, textureSlot, a, uvA, lightA, colorA, b, uvB, lightB, colorB, c, uvC, lightC, colorC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `uvA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `colorA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `uvB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `colorB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `uvC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `colorC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L309)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetriangleposition-function-appendsingletexturetriangleposition-batch-textureslot-a-uva-lighta-b-uvb-lightb-c-uvc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-1405207142"></a>
### appendSingleTextureTrianglePosition

```ml
function appendSingleTextureTrianglePosition(batch, textureSlot, a, uvA, lightA, b, uvB, lightB, c, uvC, lightC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `uvA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `uvB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `uvC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L315)

<a id="function-function-mq3-platform-playable-window-appendsingletexturetrianglepositioncolored-function-appendsingletexturetrianglepositioncolored-batch-textureslot-a-uva-lighta-colora-b-uvb-lightb-colorb-c-uvc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-1766193841"></a>
### appendSingleTextureTrianglePositionColored

```ml
function appendSingleTextureTrianglePositionColored(batch, textureSlot, a, uvA, lightA, colorA, b, uvB, lightB, colorB, c, uvC, lightC, colorC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `uvA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `colorA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `uvB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `colorB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `uvC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `colorC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L312)

<a id="function-function-mq3-platform-playable-window-appendtrianglebatch-function-appendtrianglebatch-batch-baseslot-lightmapslot-a-basea-lightmapa-lighta-b-baseb-lightmapb-lightb-c-basec-lightmapc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-1178100572"></a>
### appendTriangleBatch

```ml
function appendTriangleBatch(batch, baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, b, baseB, lightmapB, lightB, c, baseC, lightmapC, lightC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L306)

<a id="function-function-mq3-platform-playable-window-appendtrianglebatchcolored-function-appendtrianglebatchcolored-batch-baseslot-lightmapslot-a-basea-lightmapa-lighta-colora-b-baseb-lightmapb-lightb-colorb-c-basec-lightmapc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-2108897305"></a>
### appendTriangleBatchColored

```ml
function appendTriangleBatchColored(batch, baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, colorA, b, baseB, lightmapB, lightB, colorB, c, baseC, lightmapC, lightC, colorC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `baseSlot` | `dynamic` | — |  |
| `lightmapSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `baseA` | `dynamic` | — |  |
| `lightmapA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `colorA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `baseB` | `dynamic` | — |  |
| `lightmapB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `colorB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `baseC` | `dynamic` | — |  |
| `lightmapC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `colorC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L289)

<a id="function-function-mq3-platform-playable-window-appendtrianglebatchpositioncolored-function-appendtrianglebatchpositioncolored-batch-baseslot-lightmapslot-a-basea-lightmapa-lighta-colora-b-baseb-lightmapb-lightb-colorb-c-basec-lightmapc-lightc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-1435171049"></a>
### appendTriangleBatchPositionColored

```ml
function appendTriangleBatchPositionColored(batch, baseSlot, lightmapSlot, a, baseA, lightmapA, lightA, colorA, b, baseB, lightmapB, lightB, colorB, c, baseC, lightmapC, lightC, colorC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `baseSlot` | `dynamic` | — |  |
| `lightmapSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `baseA` | `dynamic` | — |  |
| `lightmapA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `colorA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `baseB` | `dynamic` | — |  |
| `lightmapB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `colorB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `baseC` | `dynamic` | — |  |
| `lightmapC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `colorC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L298)

<a id="function-function-mq3-platform-playable-window-beginframe-function-beginframe-red-green-blue-src-mq3-platform-playable-window-ml-956363996"></a>
### beginFrame

```ml
function beginFrame(red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L222)

<a id="extern_function-extern-function-mq3-platform-playable-window-beginnative-extern-function-beginnative-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-begin-frame-returns-void-src-mq3-platform-playable-window-ml-661196612"></a>
### beginNative

```ml
extern function beginNative(red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_begin_frame" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `i32` | — |  |
| `green` | `i32` | — |  |
| `blue` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L49)

<a id="function-function-mq3-platform-playable-window-cleardepth-function-cleardepth-depth-src-mq3-platform-playable-window-ml-1176117361"></a>
### clearDepth

```ml
function clearDepth(depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L230)

<a id="extern_function-extern-function-mq3-platform-playable-window-cleardepthnative-extern-function-cleardepthnative-depth-as-double-from-playable-window-dll-symbol-playable-window-clear-depth-returns-void-src-mq3-platform-playable-window-ml-1792671676"></a>
### clearDepthNative

```ml
extern function clearDepthNative(depth as double) from "playable_window.dll" symbol "playable_window_clear_depth" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L54)

<a id="function-function-mq3-platform-playable-window-clearstencil-function-clearstencil-area-src-mq3-platform-playable-window-ml-1367628373"></a>
### clearStencil

```ml
function clearStencil(area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L233)

<a id="extern_function-extern-function-mq3-platform-playable-window-clearstencilnative-extern-function-clearstencilnative-x-as-i32-y-as-i32-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-clear-stencil-returns-i32-src-mq3-platform-playable-window-ml-1010906373"></a>
### clearStencilNative

```ml
extern function clearStencilNative(x as i32, y as i32, width as i32, height as i32) from "playable_window.dll" symbol "playable_window_clear_stencil" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `i32` | — |  |
| `y` | `i32` | — |  |
| `width` | `i32` | — |  |
| `height` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L57)

<a id="function-function-mq3-platform-playable-window-configurejoystick-function-configurejoystick-enabled-threshold-ballscale-src-mq3-platform-playable-window-ml-298514001"></a>
### configureJoystick

```ml
function configureJoystick(enabled, threshold, ballScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — |  |
| `threshold` | `dynamic` | — |  |
| `ballScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L199)

<a id="function-function-mq3-platform-playable-window-configuremidi-function-configuremidi-enabled-device-channel-src-mq3-platform-playable-window-ml-1590219138"></a>
### configureMidi

```ml
function configureMidi(enabled, device, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `dynamic` | — |  |
| `device` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L206)

<a id="extern_function-extern-function-mq3-platform-playable-window-create-extern-function-create-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-create-returns-i32-src-mq3-platform-playable-window-ml-139752994"></a>
### create

```ml
extern function create(width as i32, height as i32) from "playable_window.dll" symbol "playable_window_create" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `i32` | — |  |
| `height` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L7)

<a id="function-function-mq3-platform-playable-window-createtrianglebatch-function-createtrianglebatch-capacity-src-mq3-platform-playable-window-ml-507097746"></a>
### createTriangleBatch

```ml
function createTriangleBatch(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L256)

<a id="function-function-mq3-platform-playable-window-currentdirectory-function-currentdirectory-src-mq3-platform-playable-window-ml-1960591630"></a>
### currentDirectory

```ml
function currentDirectory()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L219)

<a id="extern_function-extern-function-mq3-platform-playable-window-currentdirectorynative-extern-function-currentdirectorynative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-system-current-directory-returns-i32-src-mq3-platform-playable-window-ml-895469215"></a>
### currentDirectoryNative

```ml
extern function currentDirectoryNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_system_current_directory" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L38)

<a id="function-function-mq3-platform-playable-window-currentuser-function-currentuser-src-mq3-platform-playable-window-ml-1530007242"></a>
### currentUser

```ml
function currentUser()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L218)

<a id="extern_function-extern-function-mq3-platform-playable-window-currentusernative-extern-function-currentusernative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-system-current-user-returns-i32-src-mq3-platform-playable-window-ml-949748037"></a>
### currentUserNative

```ml
extern function currentUserNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_system_current_user" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L37)

<a id="function-function-mq3-platform-playable-window-decodeinputevent-function-decodeinputevent-data-src-mq3-platform-playable-window-ml-141507170"></a>
### decodeInputEvent

```ml
function decodeInputEvent(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L185)

<a id="function-function-mq3-platform-playable-window-drawline-function-drawline-a-b-red-green-blue-src-mq3-platform-playable-window-ml-242342777"></a>
### drawLine

```ml
function drawLine(a, b, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L223)

<a id="function-function-mq3-platform-playable-window-drawtriangle-function-drawtriangle-textureslot-a-uva-lighta-b-uvb-lightb-c-uvc-lightc-red-green-blue-src-mq3-platform-playable-window-ml-182816578"></a>
### drawTriangle

```ml
function drawTriangle(textureSlot, a, uvA, lightA, b, uvB, lightB, c, uvC, lightC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `uvA` | `dynamic` | — |  |
| `lightA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `uvB` | `dynamic` | — |  |
| `lightB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `uvC` | `dynamic` | — |  |
| `lightC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L247)

<a id="function-function-mq3-platform-playable-window-drawtrianglecolored-function-drawtrianglecolored-textureslot-a-uva-colora-b-uvb-colorb-c-uvc-colorc-red-green-blue-src-mq3-platform-playable-window-ml-2031714553"></a>
### drawTriangleColored

```ml
function drawTriangleColored(textureSlot, a, uvA, colorA, b, uvB, colorB, c, uvC, colorC, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `uvA` | `dynamic` | — |  |
| `colorA` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `uvB` | `dynamic` | — |  |
| `colorB` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `uvC` | `dynamic` | — |  |
| `colorC` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L251)

<a id="function-function-mq3-platform-playable-window-endframe-function-endframe-src-mq3-platform-playable-window-ml-1385904682"></a>
### endFrame

```ml
function endFrame()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L228)

<a id="function-function-mq3-platform-playable-window-executabledirectory-function-executabledirectory-src-mq3-platform-playable-window-ml-1985665692"></a>
### executableDirectory

```ml
function executableDirectory()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L220)

<a id="extern_function-extern-function-mq3-platform-playable-window-executabledirectorynative-extern-function-executabledirectorynative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-system-executable-directory-returns-i32-src-mq3-platform-playable-window-ml-532801474"></a>
### executableDirectoryNative

```ml
extern function executableDirectoryNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_system_executable_directory" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L39)

<a id="function-function-mq3-platform-playable-window-finishstencilshadow-function-finishstencilshadow-area-src-mq3-platform-playable-window-ml-1231361199"></a>
### finishStencilShadow

```ml
function finishStencilShadow(area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L235)

<a id="extern_function-extern-function-mq3-platform-playable-window-finishstencilshadownative-extern-function-finishstencilshadownative-x-as-i32-y-as-i32-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-finish-stencil-shadow-returns-i32-src-mq3-platform-playable-window-ml-852367844"></a>
### finishStencilShadowNative

```ml
extern function finishStencilShadowNative(x as i32, y as i32, width as i32, height as i32) from "playable_window.dll" symbol "playable_window_finish_stencil_shadow" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `i32` | — |  |
| `y` | `i32` | — |  |
| `width` | `i32` | — |  |
| `height` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L59)

<a id="function-function-mq3-platform-playable-window-glactivate-function-glactivate-active-src-mq3-platform-playable-window-ml-188819456"></a>
### glActivate

```ml
function glActivate(active)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L148)

<a id="extern_function-extern-function-mq3-platform-playable-window-glactivatenative-extern-function-glactivatenative-active-as-i32-from-playable-window-dll-symbol-playable-window-gl-activate-returns-void-src-mq3-platform-playable-window-ml-1413591198"></a>
### glActivateNative

```ml
extern function glActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_gl_activate" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L24)

<a id="function-function-mq3-platform-playable-window-glavailable-function-glavailable-src-mq3-platform-playable-window-ml-139135802"></a>
### glAvailable

```ml
function glAvailable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L135)

<a id="extern_function-extern-function-mq3-platform-playable-window-glavailablenative-extern-function-glavailablenative-from-playable-window-dll-symbol-playable-window-gl-available-returns-i32-src-mq3-platform-playable-window-ml-189342940"></a>
### glAvailableNative

```ml
extern function glAvailableNative() from "playable_window.dll" symbol "playable_window_gl_available" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L12)

<a id="extern_function-extern-function-mq3-platform-playable-window-glcolorbitsnative-extern-function-glcolorbitsnative-from-playable-window-dll-symbol-playable-window-gl-color-bits-returns-i32-src-mq3-platform-playable-window-ml-222118299"></a>
### glColorBitsNative

```ml
extern function glColorBitsNative() from "playable_window.dll" symbol "playable_window_gl_color_bits" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L14)

<a id="function-function-mq3-platform-playable-window-glconfiguration-function-glconfiguration-src-mq3-platform-playable-window-ml-1129057568"></a>
### glConfiguration

```ml
function glConfiguration()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L136)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfiguredisplaynative-extern-function-glconfiguredisplaynative-fullscreen-as-i32-frequency-as-i32-swapinterval-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-display-returns-i32-src-mq3-platform-playable-window-ml-1770549501"></a>
### glConfigureDisplayNative

```ml
extern function glConfigureDisplayNative(fullscreen as i32, frequency as i32, swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure_display" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fullscreen` | `i32` | — |  |
| `frequency` | `i32` | — |  |
| `swapInterval` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L11)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfiguredrivernative-extern-function-glconfiguredrivernative-driver-as-ptr-driverlength-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-driver-returns-i32-src-mq3-platform-playable-window-ml-1020238202"></a>
### glConfigureDriverNative

```ml
extern function glConfigureDriverNative(driver as ptr, driverLength as i32) from "playable_window.dll" symbol "playable_window_gl_configure_driver" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `driver` | `ptr` | — |  |
| `driverLength` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L9)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfigurenative-extern-function-glconfigurenative-driver-as-ptr-driverlength-as-i32-colorbits-as-i32-depthbits-as-i32-stencilbits-as-i32-stereo-as-i32-fullscreen-as-i32-frequency-as-i32-swapinterval-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-returns-i32-src-mq3-platform-playable-window-ml-2063077854"></a>
### glConfigureNative

```ml
extern function glConfigureNative(driver as ptr, driverLength as i32, colorBits as i32, depthBits as i32, stencilBits as i32, stereo as i32, fullscreen as i32, frequency as i32, swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `driver` | `ptr` | — |  |
| `driverLength` | `i32` | — |  |
| `colorBits` | `i32` | — |  |
| `depthBits` | `i32` | — |  |
| `stencilBits` | `i32` | — |  |
| `stereo` | `i32` | — |  |
| `fullscreen` | `i32` | — |  |
| `frequency` | `i32` | — |  |
| `swapInterval` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L8)

<a id="extern_function-extern-function-mq3-platform-playable-window-glconfigurepixelformatnative-extern-function-glconfigurepixelformatnative-colorbits-as-i32-depthbits-as-i32-stencilbits-as-i32-stereo-as-i32-from-playable-window-dll-symbol-playable-window-gl-configure-pixel-format-returns-i32-src-mq3-platform-playable-window-ml-2137394600"></a>
### glConfigurePixelFormatNative

```ml
extern function glConfigurePixelFormatNative(colorBits as i32, depthBits as i32, stencilBits as i32, stereo as i32) from "playable_window.dll" symbol "playable_window_gl_configure_pixel_format" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colorBits` | `i32` | — |  |
| `depthBits` | `i32` | — |  |
| `stencilBits` | `i32` | — |  |
| `stereo` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L10)

<a id="extern_function-extern-function-mq3-platform-playable-window-gldepthbitsnative-extern-function-gldepthbitsnative-from-playable-window-dll-symbol-playable-window-gl-depth-bits-returns-i32-src-mq3-platform-playable-window-ml-1796591153"></a>
### glDepthBitsNative

```ml
extern function glDepthBitsNative() from "playable_window.dll" symbol "playable_window_gl_depth_bits" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L15)

<a id="extern_function-extern-function-mq3-platform-playable-window-glendframenative-extern-function-glendframenative-from-playable-window-dll-symbol-playable-window-gl-end-frame-returns-void-src-mq3-platform-playable-window-ml-1697805802"></a>
### glEndFrameNative

```ml
extern function glEndFrameNative() from "playable_window.dll" symbol "playable_window_gl_end_frame" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L25)

<a id="extern_function-extern-function-mq3-platform-playable-window-glfullscreennative-extern-function-glfullscreennative-from-playable-window-dll-symbol-playable-window-gl-fullscreen-returns-i32-src-mq3-platform-playable-window-ml-1820404202"></a>
### glFullscreenNative

```ml
extern function glFullscreenNative() from "playable_window.dll" symbol "playable_window_gl_fullscreen" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L18)

<a id="function-function-mq3-platform-playable-window-glhasextension-function-glhasextension-name-src-mq3-platform-playable-window-ml-1631899235"></a>
### glHasExtension

```ml
function glHasExtension(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L141)

<a id="extern_function-extern-function-mq3-platform-playable-window-glhasextensionnative-extern-function-glhasextensionnative-name-as-ptr-length-as-i32-from-playable-window-dll-symbol-playable-window-gl-has-extension-returns-i32-src-mq3-platform-playable-window-ml-1208515674"></a>
### glHasExtensionNative

```ml
extern function glHasExtensionNative(name as ptr, length as i32) from "playable_window.dll" symbol "playable_window_gl_has_extension" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L20)

<a id="function-function-mq3-platform-playable-window-glinfo-function-glinfo-which-src-mq3-platform-playable-window-ml-866832449"></a>
### glInfo

```ml
function glInfo(which)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `which` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L137)

<a id="extern_function-extern-function-mq3-platform-playable-window-glinfonative-extern-function-glinfonative-which-as-i32-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-gl-info-returns-i32-src-mq3-platform-playable-window-ml-1307330102"></a>
### glInfoNative

```ml
extern function glInfoNative(which as i32, output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_gl_info" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `which` | `i32` | — |  |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L19)

<a id="function-function-mq3-platform-playable-window-gllogcomment-function-gllogcomment-comment-src-mq3-platform-playable-window-ml-952223453"></a>
### glLogComment

```ml
function glLogComment(comment)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `comment` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L149)

<a id="extern_function-extern-function-mq3-platform-playable-window-gllogcommentnative-extern-function-gllogcommentnative-comment-as-ptr-length-as-i32-from-playable-window-dll-symbol-playable-window-gl-log-comment-returns-void-src-mq3-platform-playable-window-ml-913254630"></a>
### glLogCommentNative

```ml
extern function glLogCommentNative(comment as ptr, length as i32) from "playable_window.dll" symbol "playable_window_gl_log_comment" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `comment` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L26)

<a id="extern_function-extern-function-mq3-platform-playable-window-glpixelformatnative-extern-function-glpixelformatnative-from-playable-window-dll-symbol-playable-window-gl-pixel-format-returns-i32-src-mq3-platform-playable-window-ml-711409309"></a>
### glPixelFormatNative

```ml
extern function glPixelFormatNative() from "playable_window.dll" symbol "playable_window_gl_pixel_format" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L13)

<a id="function-function-mq3-platform-playable-window-glrestoregamma-function-glrestoregamma-src-mq3-platform-playable-window-ml-781035014"></a>
### glRestoreGamma

```ml
function glRestoreGamma()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L147)

<a id="extern_function-extern-function-mq3-platform-playable-window-glrestoregammanative-extern-function-glrestoregammanative-from-playable-window-dll-symbol-playable-window-gl-restore-gamma-returns-void-src-mq3-platform-playable-window-ml-917573859"></a>
### glRestoreGammaNative

```ml
extern function glRestoreGammaNative() from "playable_window.dll" symbol "playable_window_gl_restore_gamma" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L23)

<a id="function-function-mq3-platform-playable-window-glsetgamma-function-glsetgamma-red-green-blue-src-mq3-platform-playable-window-ml-867163020"></a>
### glSetGamma

```ml
function glSetGamma(red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L143)

<a id="extern_function-extern-function-mq3-platform-playable-window-glsetgammanative-extern-function-glsetgammanative-red-as-ptr-green-as-ptr-blue-as-ptr-count-as-i32-from-playable-window-dll-symbol-playable-window-gl-set-gamma-returns-i32-src-mq3-platform-playable-window-ml-1105535118"></a>
### glSetGammaNative

```ml
extern function glSetGammaNative(red as ptr, green as ptr, blue as ptr, count as i32) from "playable_window.dll" symbol "playable_window_gl_set_gamma" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `ptr` | — |  |
| `green` | `ptr` | — |  |
| `blue` | `ptr` | — |  |
| `count` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L22)

<a id="function-function-mq3-platform-playable-window-glsetswapinterval-function-glsetswapinterval-interval-src-mq3-platform-playable-window-ml-1497410187"></a>
### glSetSwapInterval

```ml
function glSetSwapInterval(interval)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `interval` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L142)

<a id="extern_function-extern-function-mq3-platform-playable-window-glstencilbitsnative-extern-function-glstencilbitsnative-from-playable-window-dll-symbol-playable-window-gl-stencil-bits-returns-i32-src-mq3-platform-playable-window-ml-252426504"></a>
### glStencilBitsNative

```ml
extern function glStencilBitsNative() from "playable_window.dll" symbol "playable_window_gl_stencil_bits" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L16)

<a id="extern_function-extern-function-mq3-platform-playable-window-glstereonative-extern-function-glstereonative-from-playable-window-dll-symbol-playable-window-gl-stereo-returns-i32-src-mq3-platform-playable-window-ml-942044879"></a>
### glStereoNative

```ml
extern function glStereoNative() from "playable_window.dll" symbol "playable_window_gl_stereo" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L17)

<a id="extern_function-extern-function-mq3-platform-playable-window-glswapintervalnative-extern-function-glswapintervalnative-interval-as-i32-from-playable-window-dll-symbol-playable-window-gl-set-swap-interval-returns-i32-src-mq3-platform-playable-window-ml-546286852"></a>
### glSwapIntervalNative

```ml
extern function glSwapIntervalNative(interval as i32) from "playable_window.dll" symbol "playable_window_gl_set_swap_interval" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `interval` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L21)

<a id="constant-constant-mq3-platform-playable-window-input-char-const-input-char-2-src-mq3-platform-playable-window-ml-1872657919"></a>
### INPUT_CHAR

```ml
const INPUT_CHAR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L104)

<a id="constant-constant-mq3-platform-playable-window-input-key-const-input-key-1-src-mq3-platform-playable-window-ml-1271197402"></a>
### INPUT_KEY

```ml
const INPUT_KEY = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L103)

<a id="constant-constant-mq3-platform-playable-window-input-mouse-const-input-mouse-3-src-mq3-platform-playable-window-ml-1661702192"></a>
### INPUT_MOUSE

```ml
const INPUT_MOUSE = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L105)

<a id="function-function-mq3-platform-playable-window-inputactivate-function-inputactivate-active-src-mq3-platform-playable-window-ml-1783174170"></a>
### inputActivate

```ml
function inputActivate(active)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L197)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputactivatenative-extern-function-inputactivatenative-active-as-i32-from-playable-window-dll-symbol-playable-window-input-activate-returns-void-src-mq3-platform-playable-window-ml-1935629015"></a>
### inputActivateNative

```ml
extern function inputActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_input_activate" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L42)

<a id="function-function-mq3-platform-playable-window-inputclear-function-inputclear-src-mq3-platform-playable-window-ml-2143596402"></a>
### inputClear

```ml
function inputClear()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L198)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputclearnative-extern-function-inputclearnative-from-playable-window-dll-symbol-playable-window-input-clear-states-returns-void-src-mq3-platform-playable-window-ml-1864012916"></a>
### inputClearNative

```ml
extern function inputClearNative() from "playable_window.dll" symbol "playable_window_input_clear_states" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L44)

- [mq3.platform.playable_window.InputEvent](Type-mq3-platform-playable-window-inputevent-591730886.md) — struct
<a id="function-function-mq3-platform-playable-window-inputevents-function-inputevents-maxevents-src-mq3-platform-playable-window-ml-237166257"></a>
### inputEvents

```ml
function inputEvents(maxEvents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEvents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L192)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputframenative-extern-function-inputframenative-from-playable-window-dll-symbol-playable-window-input-frame-returns-void-src-mq3-platform-playable-window-ml-1357265257"></a>
### inputFrameNative

```ml
extern function inputFrameNative() from "playable_window.dll" symbol "playable_window_input_frame" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L43)

<a id="extern_function-extern-function-mq3-platform-playable-window-inputinitnative-extern-function-inputinitnative-from-playable-window-dll-symbol-playable-window-input-init-returns-i32-src-mq3-platform-playable-window-ml-1423645416"></a>
### inputInitNative

```ml
extern function inputInitNative() from "playable_window.dll" symbol "playable_window_input_init" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L41)

<a id="function-function-mq3-platform-playable-window-joystickavailable-function-joystickavailable-src-mq3-platform-playable-window-ml-601026500"></a>
### joystickAvailable

```ml
function joystickAvailable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L205)

<a id="extern_function-extern-function-mq3-platform-playable-window-joystickavailablenative-extern-function-joystickavailablenative-from-playable-window-dll-symbol-playable-window-input-joystick-available-returns-i32-src-mq3-platform-playable-window-ml-1565860208"></a>
### joystickAvailableNative

```ml
extern function joystickAvailableNative() from "playable_window.dll" symbol "playable_window_input_joystick_available" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L47)

<a id="extern_function-extern-function-mq3-platform-playable-window-joystickconfigurenative-extern-function-joystickconfigurenative-enabled-as-i32-threshold-as-double-ballscale-as-double-from-playable-window-dll-symbol-playable-window-input-configure-joystick-returns-i32-src-mq3-platform-playable-window-ml-899387052"></a>
### joystickConfigureNative

```ml
extern function joystickConfigureNative(enabled as i32, threshold as double, ballScale as double) from "playable_window.dll" symbol "playable_window_input_configure_joystick" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — |  |
| `threshold` | `double` | — |  |
| `ballScale` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L45)

<a id="constant-constant-mq3-platform-playable-window-k-mouse1-const-k-mouse1-178-src-mq3-platform-playable-window-ml-1528143451"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L76)

<a id="constant-constant-mq3-platform-playable-window-k-mouse2-const-k-mouse2-179-src-mq3-platform-playable-window-ml-640916586"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L77)

<a id="constant-constant-mq3-platform-playable-window-k-mouse3-const-k-mouse3-180-src-mq3-platform-playable-window-ml-1593607880"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = 180
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L78)

<a id="constant-constant-mq3-platform-playable-window-k-mouse4-const-k-mouse4-181-src-mq3-platform-playable-window-ml-2058743229"></a>
### K_MOUSE4

```ml
const K_MOUSE4 = 181
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L79)

<a id="constant-constant-mq3-platform-playable-window-k-mouse5-const-k-mouse5-182-src-mq3-platform-playable-window-ml-10688034"></a>
### K_MOUSE5

```ml
const K_MOUSE5 = 182
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L80)

<a id="constant-constant-mq3-platform-playable-window-k-mwheeldown-const-k-mwheeldown-183-src-mq3-platform-playable-window-ml-882956441"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L81)

<a id="constant-constant-mq3-platform-playable-window-k-mwheelup-const-k-mwheelup-184-src-mq3-platform-playable-window-ml-309301978"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L82)

<a id="function-function-mq3-platform-playable-window-keydown-function-keydown-key-src-mq3-platform-playable-window-ml-656679121"></a>
### keyDown

```ml
function keyDown(key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L184)

<a id="extern_function-extern-function-mq3-platform-playable-window-keydownnative-extern-function-keydownnative-key-as-i32-from-playable-window-dll-symbol-playable-window-key-down-returns-i32-src-mq3-platform-playable-window-ml-540220634"></a>
### keyDownNative

```ml
extern function keyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_key_down" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L30)

<a id="extern_function-extern-function-mq3-platform-playable-window-linenative-extern-function-linenative-x0-as-i32-y0-as-i32-x1-as-i32-y1-as-i32-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-line-returns-void-src-mq3-platform-playable-window-ml-1501879190"></a>
### lineNative

```ml
extern function lineNative(x0 as i32, y0 as i32, x1 as i32, y1 as i32, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_line" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x0` | `i32` | — |  |
| `y0` | `i32` | — |  |
| `x1` | `i32` | — |  |
| `y1` | `i32` | — |  |
| `red` | `i32` | — |  |
| `green` | `i32` | — |  |
| `blue` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L50)

- [mq3.platform.playable_window.LoadingPoint](Type-mq3-platform-playable-window-loadingpoint-395317548.md) — struct
<a id="function-function-mq3-platform-playable-window-loadingtitle-function-loadingtitle-progress-status-src-mq3-platform-playable-window-ml-1553333445"></a>
### loadingTitle

```ml
function loadingTitle(progress, status)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `progress` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L158)

<a id="extern_function-extern-function-mq3-platform-playable-window-midiconfigurenative-extern-function-midiconfigurenative-enabled-as-i32-device-as-i32-channel-as-i32-from-playable-window-dll-symbol-playable-window-input-configure-midi-returns-i32-src-mq3-platform-playable-window-ml-1825871092"></a>
### midiConfigureNative

```ml
extern function midiConfigureNative(enabled as i32, device as i32, channel as i32) from "playable_window.dll" symbol "playable_window_input_configure_midi" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | `i32` | — |  |
| `device` | `i32` | — |  |
| `channel` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L46)

<a id="function-function-mq3-platform-playable-window-mididevicecount-function-mididevicecount-src-mq3-platform-playable-window-ml-1234069370"></a>
### midiDeviceCount

```ml
function midiDeviceCount()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L211)

<a id="extern_function-extern-function-mq3-platform-playable-window-mididevicecountnative-extern-function-mididevicecountnative-from-playable-window-dll-symbol-playable-window-input-midi-device-count-returns-i32-src-mq3-platform-playable-window-ml-2032552218"></a>
### midiDeviceCountNative

```ml
extern function midiDeviceCountNative() from "playable_window.dll" symbol "playable_window_input_midi_device_count" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L48)

<a id="function-function-mq3-platform-playable-window-milliseconds-function-milliseconds-src-mq3-platform-playable-window-ml-1415510138"></a>
### milliseconds

```ml
function milliseconds()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L212)

<a id="extern_function-extern-function-mq3-platform-playable-window-millisecondsnative-extern-function-millisecondsnative-from-playable-window-dll-symbol-playable-window-milliseconds-returns-i32-src-mq3-platform-playable-window-ml-909369177"></a>
### millisecondsNative

```ml
extern function millisecondsNative() from "playable_window.dll" symbol "playable_window_milliseconds" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L34)

<a id="function-function-mq3-platform-playable-window-mousedelta-function-mousedelta-src-mq3-platform-playable-window-ml-388419990"></a>
### mouseDelta

```ml
function mouseDelta()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L196)

<a id="extern_function-extern-function-mq3-platform-playable-window-mousexnative-extern-function-mousexnative-from-playable-window-dll-symbol-playable-window-consume-mouse-dx-returns-i32-src-mq3-platform-playable-window-ml-655389808"></a>
### mouseXNative

```ml
extern function mouseXNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dx" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L32)

<a id="extern_function-extern-function-mq3-platform-playable-window-mouseynative-extern-function-mouseynative-from-playable-window-dll-symbol-playable-window-consume-mouse-dy-returns-i32-src-mq3-platform-playable-window-ml-1924332727"></a>
### mouseYNative

```ml
extern function mouseYNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dy" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L33)

<a id="function-function-mq3-platform-playable-window-nextinputevent-function-nextinputevent-src-mq3-platform-playable-window-ml-1794407954"></a>
### nextInputEvent

```ml
function nextInputEvent()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L189)

<a id="extern_function-extern-function-mq3-platform-playable-window-nextinputeventnative-extern-function-nextinputeventnative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-next-input-event-returns-i32-src-mq3-platform-playable-window-ml-1680741248"></a>
### nextInputEventNative

```ml
extern function nextInputEventNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_next_input_event" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L31)

<a id="function-function-mq3-platform-playable-window-open-function-open-width-height-src-mq3-platform-playable-window-ml-1833026823"></a>
### open

```ml
function open(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L115)

<a id="function-function-mq3-platform-playable-window-openconfigured-function-openconfigured-width-height-drivername-colorbits-depthbits-stencilbits-stereo-fullscreen-frequency-swapinterval-src-mq3-platform-playable-window-ml-240403241"></a>
### openConfigured

```ml
function openConfigured(width, height, driverName, colorBits, depthBits, stencilBits, stereo, fullscreen, frequency, swapInterval)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `driverName` | `dynamic` | — |  |
| `colorBits` | `dynamic` | — |  |
| `depthBits` | `dynamic` | — |  |
| `stencilBits` | `dynamic` | — |  |
| `stereo` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |
| `frequency` | `dynamic` | — |  |
| `swapInterval` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L123)

<a id="function-function-mq3-platform-playable-window-poll-function-poll-src-mq3-platform-playable-window-ml-632154482"></a>
### poll

```ml
function poll()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L150)

<a id="extern_function-extern-function-mq3-platform-playable-window-pollnative-extern-function-pollnative-from-playable-window-dll-symbol-playable-window-poll-returns-void-src-mq3-platform-playable-window-ml-1383932472"></a>
### pollNative

```ml
extern function pollNative() from "playable_window.dll" symbol "playable_window_poll" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L27)

<a id="function-function-mq3-platform-playable-window-present-function-present-src-mq3-platform-playable-window-ml-1795214248"></a>
### present

```ml
function present()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L226)

<a id="function-function-mq3-platform-playable-window-presentednonblack-function-presentednonblack-src-mq3-platform-playable-window-ml-1796306606"></a>
### presentedNonBlack

```ml
function presentedNonBlack()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L227)

<a id="extern_function-extern-function-mq3-platform-playable-window-presentednonblacknative-extern-function-presentednonblacknative-from-playable-window-dll-symbol-playable-window-presented-non-black-returns-i32-src-mq3-platform-playable-window-ml-616415493"></a>
### presentedNonBlackNative

```ml
extern function presentedNonBlackNative() from "playable_window.dll" symbol "playable_window_presented_non_black" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L52)

<a id="extern_function-extern-function-mq3-platform-playable-window-presentnative-extern-function-presentnative-from-playable-window-dll-symbol-playable-window-present-returns-void-src-mq3-platform-playable-window-ml-955642860"></a>
### presentNative

```ml
extern function presentNative() from "playable_window.dll" symbol "playable_window_present" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L51)

<a id="function-function-mq3-platform-playable-window-processorid-function-processorid-src-mq3-platform-playable-window-ml-394440620"></a>
### processorId

```ml
function processorId()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L221)

<a id="extern_function-extern-function-mq3-platform-playable-window-processoridnative-extern-function-processoridnative-from-playable-window-dll-symbol-playable-system-processor-id-returns-i32-src-mq3-platform-playable-window-ml-1859186948"></a>
### processorIdNative

```ml
extern function processorIdNative() from "playable_window.dll" symbol "playable_system_processor_id" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L40)

<a id="function-function-mq3-platform-playable-window-releasetexture-function-releasetexture-slot-src-mq3-platform-playable-window-ml-539136030"></a>
### releaseTexture

```ml
function releaseTexture(slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L246)

<a id="extern_function-extern-function-mq3-platform-playable-window-releasetexturenative-extern-function-releasetexturenative-slot-as-i32-from-playable-window-dll-symbol-playable-window-release-texture-returns-void-src-mq3-platform-playable-window-ml-657460172"></a>
### releaseTextureNative

```ml
extern function releaseTextureNative(slot as i32) from "playable_window.dll" symbol "playable_window_release_texture" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L62)

<a id="function-function-mq3-platform-playable-window-resettrianglebatch-function-resettrianglebatch-batch-src-mq3-platform-playable-window-ml-841705430"></a>
### resetTriangleBatch

```ml
function resetTriangleBatch(batch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L260)

<a id="function-function-mq3-platform-playable-window-sampledepth-function-sampledepth-x-y-src-mq3-platform-playable-window-ml-333356729"></a>
### sampleDepth

```ml
function sampleDepth(x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L231)

<a id="extern_function-extern-function-mq3-platform-playable-window-sampledepthnative-extern-function-sampledepthnative-x-as-i32-y-as-i32-from-playable-window-dll-symbol-playable-window-sample-depth-returns-double-src-mq3-platform-playable-window-ml-1772650221"></a>
### sampleDepthNative

```ml
extern function sampleDepthNative(x as i32, y as i32) from "playable_window.dll" symbol "playable_window_sample_depth" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `i32` | — |  |
| `y` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L55)

<a id="function-function-mq3-platform-playable-window-setdepthrange-function-setdepthrange-scale-neardistance-src-mq3-platform-playable-window-ml-890709395"></a>
### setDepthRange

```ml
function setDepthRange(scale, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scale` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L232)

<a id="extern_function-extern-function-mq3-platform-playable-window-setdepthrangenative-extern-function-setdepthrangenative-scale-as-double-neardistance-as-double-from-playable-window-dll-symbol-playable-window-set-depth-range-returns-i32-src-mq3-platform-playable-window-ml-1917269416"></a>
### setDepthRangeNative

```ml
extern function setDepthRangeNative(scale as double, nearDistance as double) from "playable_window.dll" symbol "playable_window_set_depth_range" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scale` | `double` | — |  |
| `nearDistance` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L56)

<a id="function-function-mq3-platform-playable-window-setstencilpass-function-setstencilpass-pass-src-mq3-platform-playable-window-ml-1274830549"></a>
### setStencilPass

```ml
function setStencilPass(pass)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L234)

<a id="extern_function-extern-function-mq3-platform-playable-window-setstencilpassnative-extern-function-setstencilpassnative-pass-as-i32-from-playable-window-dll-symbol-playable-window-set-stencil-pass-returns-i32-src-mq3-platform-playable-window-ml-728239421"></a>
### setStencilPassNative

```ml
extern function setStencilPassNative(pass as i32) from "playable_window.dll" symbol "playable_window_set_stencil_pass" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L58)

<a id="function-function-mq3-platform-playable-window-settitle-function-settitle-title-src-mq3-platform-playable-window-ml-1251264284"></a>
### setTitle

```ml
function setTitle(title)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `title` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L152)

<a id="extern_function-extern-function-mq3-platform-playable-window-settitlenative-extern-function-settitlenative-title-as-ptr-length-as-i32-from-playable-window-dll-symbol-playable-window-set-title-utf8-returns-i32-src-mq3-platform-playable-window-ml-789368744"></a>
### setTitleNative

```ml
extern function setTitleNative(title as ptr, length as i32) from "playable_window.dll" symbol "playable_window_set_title_utf8" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `title` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L29)

<a id="function-function-mq3-platform-playable-window-shouldclose-function-shouldclose-src-mq3-platform-playable-window-ml-2097839008"></a>
### shouldClose

```ml
function shouldClose()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L151)

<a id="extern_function-extern-function-mq3-platform-playable-window-shouldclosenative-extern-function-shouldclosenative-from-playable-window-dll-symbol-playable-window-should-close-returns-i32-src-mq3-platform-playable-window-ml-163775701"></a>
### shouldCloseNative

```ml
extern function shouldCloseNative() from "playable_window.dll" symbol "playable_window_should_close" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L28)

<a id="function-function-mq3-platform-playable-window-showloading-function-showloading-progress-status-src-mq3-platform-playable-window-ml-1871681295"></a>
### showLoading

```ml
function showLoading(progress, status)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `progress` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L165)

<a id="function-function-mq3-platform-playable-window-shutdown-function-shutdown-src-mq3-platform-playable-window-ml-1657913210"></a>
### shutdown

```ml
function shutdown()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L229)

<a id="extern_function-extern-function-mq3-platform-playable-window-shutdownnative-extern-function-shutdownnative-from-playable-window-dll-symbol-playable-window-shutdown-returns-void-src-mq3-platform-playable-window-ml-1716055113"></a>
### shutdownNative

```ml
extern function shutdownNative() from "playable_window.dll" symbol "playable_window_shutdown" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L53)

<a id="function-function-mq3-platform-playable-window-submittrianglebatch-function-submittrianglebatch-batch-src-mq3-platform-playable-window-ml-1690429166"></a>
### submitTriangleBatch

```ml
function submitTriangleBatch(batch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L322)

<a id="function-function-mq3-platform-playable-window-submitworldtrianglebatch-function-submitworldtrianglebatch-batch-projection-src-mq3-platform-playable-window-ml-1176095633"></a>
### submitWorldTriangleBatch

```ml
function submitWorldTriangleBatch(batch, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L328)

<a id="function-function-mq3-platform-playable-window-submitworldtrianglebatchviewport-function-submitworldtrianglebatchviewport-batch-projection-area-src-mq3-platform-playable-window-ml-1065097078"></a>
### submitWorldTriangleBatchViewport

```ml
function submitWorldTriangleBatchViewport(batch, projection, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L339)

<a id="function-function-mq3-platform-playable-window-takevideorestart-function-takevideorestart-src-mq3-platform-playable-window-ml-822407430"></a>
### takeVideoRestart

```ml
function takeVideoRestart()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L213)

<a id="extern_function-extern-function-mq3-platform-playable-window-takevideorestartnative-extern-function-takevideorestartnative-from-playable-window-dll-symbol-playable-window-take-video-restart-returns-i32-src-mq3-platform-playable-window-ml-630631836"></a>
### takeVideoRestartNative

```ml
extern function takeVideoRestartNative() from "playable_window.dll" symbol "playable_window_take_video_restart" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L35)

<a id="constant-constant-mq3-platform-playable-window-triangle-batch-max-count-const-triangle-batch-max-count-65536-src-mq3-platform-playable-window-ml-989129662"></a>
### TRIANGLE_BATCH_MAX_COUNT

```ml
const TRIANGLE_BATCH_MAX_COUNT = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L107)

<a id="constant-constant-mq3-platform-playable-window-triangle-batch-record-bytes-const-triangle-batch-record-bytes-128-src-mq3-platform-playable-window-ml-1395760788"></a>
### TRIANGLE_BATCH_RECORD_BYTES

```ml
const TRIANGLE_BATCH_RECORD_BYTES = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L106)

- [mq3.platform.playable_window.TriangleBatch](Type-mq3-platform-playable-window-trianglebatch-647964754.md) — struct
<a id="extern_function-extern-function-mq3-platform-playable-window-trianglebatchnative-extern-function-trianglebatchnative-records-as-ptr-bytecount-as-i32-trianglecount-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-batch-returns-i32-src-mq3-platform-playable-window-ml-1886429961"></a>
### triangleBatchNative

```ml
extern function triangleBatchNative(records as ptr, byteCount as i32, triangleCount as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_batch" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `byteCount` | `i32` | — |  |
| `triangleCount` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L65)

<a id="extern_function-extern-function-mq3-platform-playable-window-trianglecolorednative-extern-function-trianglecolorednative-textureslot-as-i32-x0-as-double-y0-as-double-depth0-as-double-u0-as-double-v0-as-double-x1-as-double-y1-as-double-depth1-as-double-u1-as-double-v1-as-double-x2-as-double-y2-as-double-depth2-as-double-u2-as-double-v2-as-double-red0-as-i32-green0-as-i32-blue0-as-i32-alpha0-as-i32-red1-as-i32-green1-as-i32-blue1-as-i32-alpha1-as-i32-red2-as-i32-green2-as-i32-blue2-as-i32-alpha2-as-i32-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-colored-returns-void-src-mq3-platform-playable-window-ml-1818432715"></a>
### triangleColoredNative

```ml
extern function triangleColoredNative(textureSlot as i32, x0 as double, y0 as double, depth0 as double, u0 as double, v0 as double, x1 as double, y1 as double, depth1 as double, u1 as double, v1 as double, x2 as double, y2 as double, depth2 as double, u2 as double, v2 as double, red0 as i32, green0 as i32, blue0 as i32, alpha0 as i32, red1 as i32, green1 as i32, blue1 as i32, alpha1 as i32, red2 as i32, green2 as i32, blue2 as i32, alpha2 as i32, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_colored" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `i32` | — |  |
| `x0` | `double` | — |  |
| `y0` | `double` | — |  |
| `depth0` | `double` | — |  |
| `u0` | `double` | — |  |
| `v0` | `double` | — |  |
| `x1` | `double` | — |  |
| `y1` | `double` | — |  |
| `depth1` | `double` | — |  |
| `u1` | `double` | — |  |
| `v1` | `double` | — |  |
| `x2` | `double` | — |  |
| `y2` | `double` | — |  |
| `depth2` | `double` | — |  |
| `u2` | `double` | — |  |
| `v2` | `double` | — |  |
| `red0` | `i32` | — |  |
| `green0` | `i32` | — |  |
| `blue0` | `i32` | — |  |
| `alpha0` | `i32` | — |  |
| `red1` | `i32` | — |  |
| `green1` | `i32` | — |  |
| `blue1` | `i32` | — |  |
| `alpha1` | `i32` | — |  |
| `red2` | `i32` | — |  |
| `green2` | `i32` | — |  |
| `blue2` | `i32` | — |  |
| `alpha2` | `i32` | — |  |
| `red` | `i32` | — |  |
| `green` | `i32` | — |  |
| `blue` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L64)

<a id="extern_function-extern-function-mq3-platform-playable-window-trianglenative-extern-function-trianglenative-textureslot-as-i32-x0-as-double-y0-as-double-depth0-as-double-u0-as-double-v0-as-double-light0-as-double-x1-as-double-y1-as-double-depth1-as-double-u1-as-double-v1-as-double-light1-as-double-x2-as-double-y2-as-double-depth2-as-double-u2-as-double-v2-as-double-light2-as-double-red-as-i32-green-as-i32-blue-as-i32-from-playable-window-dll-symbol-playable-window-draw-triangle-returns-void-src-mq3-platform-playable-window-ml-1819333212"></a>
### triangleNative

```ml
extern function triangleNative(textureSlot as i32, x0 as double, y0 as double, depth0 as double, u0 as double, v0 as double, light0 as double, x1 as double, y1 as double, depth1 as double, u1 as double, v1 as double, light1 as double, x2 as double, y2 as double, depth2 as double, u2 as double, v2 as double, light2 as double, red as i32, green as i32, blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureSlot` | `i32` | — |  |
| `x0` | `double` | — |  |
| `y0` | `double` | — |  |
| `depth0` | `double` | — |  |
| `u0` | `double` | — |  |
| `v0` | `double` | — |  |
| `light0` | `double` | — |  |
| `x1` | `double` | — |  |
| `y1` | `double` | — |  |
| `depth1` | `double` | — |  |
| `u1` | `double` | — |  |
| `v1` | `double` | — |  |
| `light1` | `double` | — |  |
| `x2` | `double` | — |  |
| `y2` | `double` | — |  |
| `depth2` | `double` | — |  |
| `u2` | `double` | — |  |
| `v2` | `double` | — |  |
| `light2` | `double` | — |  |
| `red` | `i32` | — |  |
| `green` | `i32` | — |  |
| `blue` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L63)

<a id="function-function-mq3-platform-playable-window-uploadtexture-function-uploadtexture-slot-rgba-width-height-src-mq3-platform-playable-window-ml-1617092781"></a>
### uploadTexture

```ml
function uploadTexture(slot, rgba, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L236)

<a id="function-function-mq3-platform-playable-window-uploadtexturemipmapped-function-uploadtexturemipmapped-slot-rgba-width-height-mipmapped-src-mq3-platform-playable-window-ml-558754384"></a>
### uploadTextureMipmapped

```ml
function uploadTextureMipmapped(slot, rgba, width, height, mipmapped)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `mipmapped` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L240)

<a id="extern_function-extern-function-mq3-platform-playable-window-uploadtexturemipmappednative-extern-function-uploadtexturemipmappednative-slot-as-i32-rgba-as-ptr-width-as-i32-height-as-i32-mipmapped-as-i32-from-playable-window-dll-symbol-playable-window-upload-texture-mipmapped-returns-i32-src-mq3-platform-playable-window-ml-579418564"></a>
### uploadTextureMipmappedNative

```ml
extern function uploadTextureMipmappedNative(slot as i32, rgba as ptr, width as i32, height as i32, mipmapped as i32) from "playable_window.dll" symbol "playable_window_upload_texture_mipmapped" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — |  |
| `rgba` | `ptr` | — |  |
| `width` | `i32` | — |  |
| `height` | `i32` | — |  |
| `mipmapped` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L61)

<a id="extern_function-extern-function-mq3-platform-playable-window-uploadtexturenative-extern-function-uploadtexturenative-slot-as-i32-rgba-as-ptr-width-as-i32-height-as-i32-from-playable-window-dll-symbol-playable-window-upload-texture-returns-i32-src-mq3-platform-playable-window-ml-800287083"></a>
### uploadTextureNative

```ml
extern function uploadTextureNative(slot as i32, rgba as ptr, width as i32, height as i32) from "playable_window.dll" symbol "playable_window_upload_texture" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `i32` | — |  |
| `rgba` | `ptr` | — |  |
| `width` | `i32` | — |  |
| `height` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L60)

<a id="function-function-mq3-platform-playable-window-uploadtexturenomip-function-uploadtexturenomip-slot-rgba-width-height-src-mq3-platform-playable-window-ml-556825245"></a>
### uploadTextureNoMip

```ml
function uploadTextureNoMip(slot, rgba, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L245)

<a id="function-function-mq3-platform-playable-window-viewport-function-viewport-x-y-width-height-src-mq3-platform-playable-window-ml-979740628"></a>
### viewport

```ml
function viewport(x, y, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L335)

- [mq3.platform.playable_window.Viewport](Type-mq3-platform-playable-window-viewport-170347776.md) — struct
<a id="constant-constant-mq3-platform-playable-window-vk-1-const-vk-1-49-src-mq3-platform-playable-window-ml-135874554"></a>
### VK_1

```ml
const VK_1 = 49
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L94)

<a id="constant-constant-mq3-platform-playable-window-vk-2-const-vk-2-50-src-mq3-platform-playable-window-ml-1944671586"></a>
### VK_2

```ml
const VK_2 = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L95)

<a id="constant-constant-mq3-platform-playable-window-vk-3-const-vk-3-51-src-mq3-platform-playable-window-ml-1315080067"></a>
### VK_3

```ml
const VK_3 = 51
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L96)

<a id="constant-constant-mq3-platform-playable-window-vk-4-const-vk-4-52-src-mq3-platform-playable-window-ml-702669996"></a>
### VK_4

```ml
const VK_4 = 52
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L97)

<a id="constant-constant-mq3-platform-playable-window-vk-5-const-vk-5-53-src-mq3-platform-playable-window-ml-633772509"></a>
### VK_5

```ml
const VK_5 = 53
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L98)

<a id="constant-constant-mq3-platform-playable-window-vk-6-const-vk-6-54-src-mq3-platform-playable-window-ml-1324889350"></a>
### VK_6

```ml
const VK_6 = 54
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L99)

<a id="constant-constant-mq3-platform-playable-window-vk-7-const-vk-7-55-src-mq3-platform-playable-window-ml-20839543"></a>
### VK_7

```ml
const VK_7 = 55
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L100)

<a id="constant-constant-mq3-platform-playable-window-vk-8-const-vk-8-56-src-mq3-platform-playable-window-ml-693376464"></a>
### VK_8

```ml
const VK_8 = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L101)

<a id="constant-constant-mq3-platform-playable-window-vk-9-const-vk-9-57-src-mq3-platform-playable-window-ml-130175377"></a>
### VK_9

```ml
const VK_9 = 57
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L102)

<a id="constant-constant-mq3-platform-playable-window-vk-a-const-vk-a-65-src-mq3-platform-playable-window-ml-1135225328"></a>
### VK_A

```ml
const VK_A = 65
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L87)

<a id="constant-constant-mq3-platform-playable-window-vk-d-const-vk-d-68-src-mq3-platform-playable-window-ml-237251081"></a>
### VK_D

```ml
const VK_D = 68
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L88)

<a id="constant-constant-mq3-platform-playable-window-vk-down-const-vk-down-40-src-mq3-platform-playable-window-ml-29903945"></a>
### VK_DOWN

```ml
const VK_DOWN = 40
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L86)

<a id="constant-constant-mq3-platform-playable-window-vk-e-const-vk-e-69-src-mq3-platform-playable-window-ml-578565452"></a>
### VK_E

```ml
const VK_E = 69
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L89)

<a id="constant-constant-mq3-platform-playable-window-vk-escape-const-vk-escape-27-src-mq3-platform-playable-window-ml-215516386"></a>
### VK_ESCAPE

```ml
const VK_ESCAPE = 27
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L70)

<a id="constant-constant-mq3-platform-playable-window-vk-lbutton-const-vk-lbutton-1-src-mq3-platform-playable-window-ml-758947988"></a>
### VK_LBUTTON

```ml
const VK_LBUTTON = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L71)

<a id="constant-constant-mq3-platform-playable-window-vk-mbutton-const-vk-mbutton-4-src-mq3-platform-playable-window-ml-639602633"></a>
### VK_MBUTTON

```ml
const VK_MBUTTON = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L73)

<a id="constant-constant-mq3-platform-playable-window-vk-q-const-vk-q-81-src-mq3-platform-playable-window-ml-459947422"></a>
### VK_Q

```ml
const VK_Q = 81
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L90)

<a id="constant-constant-mq3-platform-playable-window-vk-rbutton-const-vk-rbutton-2-src-mq3-platform-playable-window-ml-361660889"></a>
### VK_RBUTTON

```ml
const VK_RBUTTON = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L72)

<a id="constant-constant-mq3-platform-playable-window-vk-return-const-vk-return-13-src-mq3-platform-playable-window-ml-172514413"></a>
### VK_RETURN

```ml
const VK_RETURN = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L83)

<a id="constant-constant-mq3-platform-playable-window-vk-s-const-vk-s-83-src-mq3-platform-playable-window-ml-916277196"></a>
### VK_S

```ml
const VK_S = 83
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L91)

<a id="constant-constant-mq3-platform-playable-window-vk-shift-const-vk-shift-16-src-mq3-platform-playable-window-ml-916958736"></a>
### VK_SHIFT

```ml
const VK_SHIFT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L93)

<a id="constant-constant-mq3-platform-playable-window-vk-space-const-vk-space-32-src-mq3-platform-playable-window-ml-221536986"></a>
### VK_SPACE

```ml
const VK_SPACE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L84)

<a id="constant-constant-mq3-platform-playable-window-vk-up-const-vk-up-38-src-mq3-platform-playable-window-ml-1146138406"></a>
### VK_UP

```ml
const VK_UP = 38
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L85)

<a id="constant-constant-mq3-platform-playable-window-vk-w-const-vk-w-87-src-mq3-platform-playable-window-ml-1386868648"></a>
### VK_W

```ml
const VK_W = 87
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L92)

<a id="constant-constant-mq3-platform-playable-window-vk-xbutton1-const-vk-xbutton1-5-src-mq3-platform-playable-window-ml-760277378"></a>
### VK_XBUTTON1

```ml
const VK_XBUTTON1 = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L74)

<a id="constant-constant-mq3-platform-playable-window-vk-xbutton2-const-vk-xbutton2-6-src-mq3-platform-playable-window-ml-1422864375"></a>
### VK_XBUTTON2

```ml
const VK_XBUTTON2 = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L75)

<a id="function-function-mq3-platform-playable-window-windowstate-function-windowstate-src-mq3-platform-playable-window-ml-1955323936"></a>
### windowState

```ml
function windowState()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L214)

- [mq3.platform.playable_window.WindowState](Type-mq3-platform-playable-window-windowstate-1074205599.md) — struct
<a id="extern_function-extern-function-mq3-platform-playable-window-windowstatenative-extern-function-windowstatenative-output-as-bytes-capacity-as-i32-from-playable-window-dll-symbol-playable-window-window-state-returns-i32-src-mq3-platform-playable-window-ml-1833374613"></a>
### windowStateNative

```ml
extern function windowStateNative(output as bytes, capacity as i32) from "playable_window.dll" symbol "playable_window_window_state" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L36)

<a id="extern_function-extern-function-mq3-platform-playable-window-worldtrianglebatchnative-extern-function-worldtrianglebatchnative-records-as-ptr-bytecount-as-i32-trianglecount-as-i32-positionx-as-double-positiony-as-double-positionz-as-double-rightx-as-double-righty-as-double-rightz-as-double-upx-as-double-upy-as-double-upz-as-double-forwardx-as-double-forwardy-as-double-forwardz-as-double-halfwidth-as-double-halfheight-as-double-focal-as-double-neardistance-as-double-from-playable-window-dll-symbol-playable-window-draw-world-triangle-batch-returns-i32-src-mq3-platform-playable-window-ml-132647626"></a>
### worldTriangleBatchNative

```ml
extern function worldTriangleBatchNative(records as ptr, byteCount as i32, triangleCount as i32, positionX as double, positionY as double, positionZ as double, rightX as double, rightY as double, rightZ as double, upX as double, upY as double, upZ as double, forwardX as double, forwardY as double, forwardZ as double, halfWidth as double, halfHeight as double, focal as double, nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `byteCount` | `i32` | — |  |
| `triangleCount` | `i32` | — |  |
| `positionX` | `double` | — |  |
| `positionY` | `double` | — |  |
| `positionZ` | `double` | — |  |
| `rightX` | `double` | — |  |
| `rightY` | `double` | — |  |
| `rightZ` | `double` | — |  |
| `upX` | `double` | — |  |
| `upY` | `double` | — |  |
| `upZ` | `double` | — |  |
| `forwardX` | `double` | — |  |
| `forwardY` | `double` | — |  |
| `forwardZ` | `double` | — |  |
| `halfWidth` | `double` | — |  |
| `halfHeight` | `double` | — |  |
| `focal` | `double` | — |  |
| `nearDistance` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L67)

<a id="extern_function-extern-function-mq3-platform-playable-window-worldtrianglebatchviewportnative-extern-function-worldtrianglebatchviewportnative-records-as-ptr-bytecount-as-i32-trianglecount-as-i32-viewportx-as-i32-viewporty-as-i32-viewportwidth-as-i32-viewportheight-as-i32-positionx-as-double-positiony-as-double-positionz-as-double-rightx-as-double-righty-as-double-rightz-as-double-upx-as-double-upy-as-double-upz-as-double-forwardx-as-double-forwardy-as-double-forwardz-as-double-focal-as-double-neardistance-as-double-from-playable-window-dll-symbol-playable-window-draw-world-triangle-batch-viewport-returns-i32-src-mq3-platform-playable-window-ml-1329438064"></a>
### worldTriangleBatchViewportNative

```ml
extern function worldTriangleBatchViewportNative(records as ptr, byteCount as i32, triangleCount as i32, viewportX as i32, viewportY as i32, viewportWidth as i32, viewportHeight as i32, positionX as double, positionY as double, positionZ as double, rightX as double, rightY as double, rightZ as double, upX as double, upY as double, upZ as double, forwardX as double, forwardY as double, forwardZ as double, focal as double, nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch_viewport" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `byteCount` | `i32` | — |  |
| `triangleCount` | `i32` | — |  |
| `viewportX` | `i32` | — |  |
| `viewportY` | `i32` | — |  |
| `viewportWidth` | `i32` | — |  |
| `viewportHeight` | `i32` | — |  |
| `positionX` | `double` | — |  |
| `positionY` | `double` | — |  |
| `positionZ` | `double` | — |  |
| `rightX` | `double` | — |  |
| `rightY` | `double` | — |  |
| `rightZ` | `double` | — |  |
| `upX` | `double` | — |  |
| `upY` | `double` | — |  |
| `upZ` | `double` | — |  |
| `forwardX` | `double` | — |  |
| `forwardY` | `double` | — |  |
| `forwardZ` | `double` | — |  |
| `focal` | `double` | — |  |
| `nearDistance` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L68)

<a id="function-function-mq3-platform-playable-window-writebatchcolor-function-writebatchcolor-data-offset-color-src-mq3-platform-playable-window-ml-2042225640"></a>
### writeBatchColor

```ml
function writeBatchColor(data, offset, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L286)

<a id="function-function-mq3-platform-playable-window-writebatchf32-function-writebatchf32-data-offset-value-src-mq3-platform-playable-window-ml-1944898670"></a>
### writeBatchF32

```ml
function writeBatchF32(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L275)

<a id="function-function-mq3-platform-playable-window-writebatchi32-function-writebatchi32-data-offset-value-src-mq3-platform-playable-window-ml-1921342464"></a>
### writeBatchI32

```ml
function writeBatchI32(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L274)

<a id="function-function-mq3-platform-playable-window-writebatchpositionvertex-function-writebatchpositionvertex-data-offset-position-baseuv-lightmapuv-light-src-mq3-platform-playable-window-ml-581163841"></a>
### writeBatchPositionVertex

```ml
function writeBatchPositionVertex(data, offset, position, baseUV, lightmapUV, light)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `baseUV` | `dynamic` | — |  |
| `lightmapUV` | `dynamic` | — |  |
| `light` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L281)

<a id="function-function-mq3-platform-playable-window-writebatchvertex-function-writebatchvertex-data-offset-point-baseuv-lightmapuv-light-src-mq3-platform-playable-window-ml-763296878"></a>
### writeBatchVertex

```ml
function writeBatchVertex(data, offset, point, baseUV, lightmapUV, light)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `baseUV` | `dynamic` | — |  |
| `lightmapUV` | `dynamic` | — |  |
| `light` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L276)

<a id="extern_function-extern-function-mq3-platform-playable-window-writescreenquadnative-extern-function-writescreenquadnative-records-as-ptr-bytecount-as-i32-triangleindex-as-i32-textureslot-as-i32-x0-as-double-y0-as-double-d0-as-double-u0-as-double-v0-as-double-x1-as-double-y1-as-double-d1-as-double-u1-as-double-v1-as-double-x2-as-double-y2-as-double-d2-as-double-u2-as-double-v2-as-double-x3-as-double-y3-as-double-d3-as-double-u3-as-double-v3-as-double-red-as-i32-green-as-i32-blue-as-i32-alpha-as-i32-from-playable-window-dll-symbol-playable-window-write-screen-quad-returns-i32-src-mq3-platform-playable-window-ml-1372235619"></a>
### writeScreenQuadNative

```ml
extern function writeScreenQuadNative(records as ptr, byteCount as i32, triangleIndex as i32, textureSlot as i32, x0 as double, y0 as double, d0 as double, u0 as double, v0 as double, x1 as double, y1 as double, d1 as double, u1 as double, v1 as double, x2 as double, y2 as double, d2 as double, u2 as double, v2 as double, x3 as double, y3 as double, d3 as double, u3 as double, v3 as double, red as i32, green as i32, blue as i32, alpha as i32) from "playable_window.dll" symbol "playable_window_write_screen_quad" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `byteCount` | `i32` | — |  |
| `triangleIndex` | `i32` | — |  |
| `textureSlot` | `i32` | — |  |
| `x0` | `double` | — |  |
| `y0` | `double` | — |  |
| `d0` | `double` | — |  |
| `u0` | `double` | — |  |
| `v0` | `double` | — |  |
| `x1` | `double` | — |  |
| `y1` | `double` | — |  |
| `d1` | `double` | — |  |
| `u1` | `double` | — |  |
| `v1` | `double` | — |  |
| `x2` | `double` | — |  |
| `y2` | `double` | — |  |
| `d2` | `double` | — |  |
| `u2` | `double` | — |  |
| `v2` | `double` | — |  |
| `x3` | `double` | — |  |
| `y3` | `double` | — |  |
| `d3` | `double` | — |  |
| `u3` | `double` | — |  |
| `v3` | `double` | — |  |
| `red` | `i32` | — |  |
| `green` | `i32` | — |  |
| `blue` | `i32` | — |  |
| `alpha` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L66)

<a id="function-function-mq3-platform-playable-window-writescreenrect-function-writescreenrect-batch-triangleindex-textureslot-x-y-width-height-s1-t1-s2-t2-scalex-scaley-color-src-mq3-platform-playable-window-ml-1268726077"></a>
### writeScreenRect

```ml
function writeScreenRect(batch, triangleIndex, textureSlot, x, y, width, height, s1, t1, s2, t2, scaleX, scaleY, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `triangleIndex` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L268)
