# `src/mq3/client/baseq3_console_background.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.baseq3_console_background`](Package-mq3-client-baseq3-console-background-1791367883.md)

Reachable from entry: **yes**

## Imports

- `mq3/platform/playable_multitexture.ml` as `raster` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-baseq3-console-background-draw-function-draw-media-width-height-now-src-mq3-client-baseq3-console-background-ml-1023664707"></a>
### draw

```ml
function draw(media, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L53)

<a id="function-function-mq3-client-baseq3-console-background-drawlayer-function-drawlayer-layer-width-height-now-src-mq3-client-baseq3-console-background-ml-1499912194"></a>
### drawLayer

```ml
function drawLayer(layer, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `layer` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L44)

<a id="function-function-mq3-client-baseq3-console-background-fail-function-fail-message-src-mq3-client-baseq3-console-background-ml-1320637069"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L18)

- [mq3.client.baseq3_console_background.Layer](Type-mq3-client-baseq3-console-background-layer-1829146384.md) — struct
<a id="function-function-mq3-client-baseq3-console-background-load-function-load-archive-firsttextureslot-src-mq3-client-baseq3-console-background-ml-1284111481"></a>
### load

```ml
function load(archive, firstTextureSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L19)

- [mq3.client.baseq3_console_background.Media](Type-mq3-client-baseq3-console-background-media-1898967553.md) — struct
<a id="function-function-mq3-client-baseq3-console-background-point-function-point-x-y-src-mq3-client-baseq3-console-background-ml-633670739"></a>
### point

```ml
function point(x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L43)

- [mq3.client.baseq3_console_background.Point](Type-mq3-client-baseq3-console-background-point-1935872503.md) — struct
<a id="function-function-mq3-client-baseq3-console-background-release-function-release-media-src-mq3-client-baseq3-console-background-ml-1858720838"></a>
### release

```ml
function release(media)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L42)

<a id="constant-constant-mq3-client-baseq3-console-background-required-textures-const-required-textures-2-src-mq3-client-baseq3-console-background-ml-2127943845"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L12)

<a id="constant-constant-mq3-client-baseq3-console-background-shader-name-const-shader-name-console-src-mq3-client-baseq3-console-background-ml-1560070400"></a>
### SHADER_NAME

```ml
const SHADER_NAME = "console"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L11)

<a id="function-function-mq3-client-baseq3-console-background-upload-function-upload-media-src-mq3-client-baseq3-console-background-ml-986991424"></a>
### upload

```ml
function upload(media)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_console_background.ml#L37)
