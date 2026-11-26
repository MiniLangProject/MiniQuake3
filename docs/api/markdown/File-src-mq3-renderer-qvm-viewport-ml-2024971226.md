# `src/mq3/renderer/qvm_viewport.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_viewport`](Package-mq3-renderer-qvm-viewport-485820300.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-renderer-qvm-viewport-edge-function-edge-value-sourcesize-targetsize-src-mq3-renderer-qvm-viewport-ml-22586465"></a>
### edge

```ml
function edge(value, sourceSize, targetSize)
```

Scale one viewport edge and truncate it toward zero, rejecting signed-32-bit overflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Signed edge coordinate in source pixels; negative offscreen edges are preserved. |
| `sourceSize` | `dynamic` | — | Positive source dimension in pixels, validated by prepare. |
| `targetSize` | `dynamic` | — | Positive target dimension in pixels, validated by prepare. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L24)

<a id="function-function-mq3-renderer-qvm-viewport-fail-function-fail-message-src-mq3-renderer-qvm-viewport-ml-758355279"></a>
### fail

```ml
function fail(message)
```

Creates error `7691` with message `"QVM viewport: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7691,"QVM viewport: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L19)

<a id="function-function-mq3-renderer-qvm-viewport-prepare-function-prepare-refdef-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-viewport-ml-625616116"></a>
### prepare

```ml
function prepare(refdef, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

Scale a QVM refdef rectangle into a native viewport and construct its camera projection. Scales the four edges independently without clipping offscreen portions, so an offscreen UI model keeps its original projection. Converts Quake's forward/left/up basis to the viewer's right-facing screen basis and uses separate horizontal and vertical fields of view. Returns Prepared or the viewport/projection error; the projection's near distance is one world unit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — | Source-pixel x/y/width/height, world-space vieworg, forward/left/up viewaxis, and fovX/fovY in degrees. |
| `sourceWidth` | `dynamic` | — | Positive width of the QVM drawable coordinate space in pixels. |
| `sourceHeight` | `dynamic` | — | Positive height of the QVM drawable coordinate space in pixels. |
| `targetWidth` | `dynamic` | — | Positive native framebuffer width in pixels. |
| `targetHeight` | `dynamic` | — | Positive native framebuffer height in pixels. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L44)

- [mq3.renderer.qvm_viewport.Prepared](Type-mq3-renderer-qvm-viewport-prepared-444055731.md) — struct
<a id="function-function-mq3-renderer-qvm-viewport-validvector-function-validvector-value-src-mq3-renderer-qvm-viewport-ml-1724720243"></a>
### validVector

```ml
function validVector(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.qvm_viewport.validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L31)
