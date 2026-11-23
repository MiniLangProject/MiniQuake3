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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `sourceSize` | `dynamic` | — |  |
| `targetSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L12)

<a id="function-function-mq3-renderer-qvm-viewport-fail-function-fail-message-src-mq3-renderer-qvm-viewport-ml-758355279"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L11)

<a id="function-function-mq3-renderer-qvm-viewport-prepare-function-prepare-refdef-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-viewport-ml-625616116"></a>
### prepare

```ml
function prepare(refdef, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — |  |
| `sourceWidth` | `dynamic` | — |  |
| `sourceHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L19)

- [mq3.renderer.qvm_viewport.Prepared](Type-mq3-renderer-qvm-viewport-prepared-444055731.md) — struct
<a id="function-function-mq3-renderer-qvm-viewport-validvector-function-validvector-value-src-mq3-renderer-qvm-viewport-ml-1724720243"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L17)
