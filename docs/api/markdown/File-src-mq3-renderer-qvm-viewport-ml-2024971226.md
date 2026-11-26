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

Returns `numeric.trunc32(scaled)` from `mq3.renderer.qvm_viewport.edge`; earlier branches return `fail("scaled viewport edge exceeds native integer range")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used by `scaled=value*targetSize/sourceSize`. |
| `sourceSize` | `dynamic` | — | Input used by `scaled=value*targetSize/sourceSize`. |
| `targetSize` | `dynamic` | — | Input used by `scaled=value*targetSize/sourceSize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L19)

<a id="function-function-mq3-renderer-qvm-viewport-fail-function-fail-message-src-mq3-renderer-qvm-viewport-ml-758355279"></a>
### fail

```ml
function fail(message)
```

Creates error `7691` with message `"QVM viewport: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7691,"QVM viewport: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L14)

<a id="function-function-mq3-renderer-qvm-viewport-prepare-function-prepare-refdef-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-viewport-ml-625616116"></a>
### prepare

```ml
function prepare(refdef, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

Builds `mq3.renderer.qvm_viewport.Prepared` using `mq3.platform.playable_window.viewport`, `mq3.client.playable_viewer.focalLength`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — | Record providing `refdef.width`, `refdef.height`, `refdef.x`, `refdef.y`, `refdef.vieworg`, `refdef.viewaxis`. |
| `sourceWidth` | `dynamic` | — | Value forwarded as `sourceSize` to `mq3.renderer.qvm_viewport.edge`. |
| `sourceHeight` | `dynamic` | — | Value forwarded as `sourceSize` to `mq3.renderer.qvm_viewport.edge`. |
| `targetWidth` | `dynamic` | — | Value forwarded as `targetSize` to `mq3.renderer.qvm_viewport.edge`. |
| `targetHeight` | `dynamic` | — | Value forwarded as `targetSize` to `mq3.renderer.qvm_viewport.edge`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L34)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_viewport.ml#L26)
