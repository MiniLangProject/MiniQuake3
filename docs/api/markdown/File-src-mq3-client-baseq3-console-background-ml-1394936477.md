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

Calls `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp`, `mq3.client.baseq3_console_background.drawLayer` and additional helpers from base Quake III console background `draw`. The final path returns `len(media.layers)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.layers`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L78)

<a id="function-function-mq3-client-baseq3-console-background-drawlayer-function-drawlayer-layer-width-height-now-src-mq3-client-baseq3-console-background-ml-1499912194"></a>
### drawLayer

```ml
function drawLayer(layer, width, height, now)
```

Calls `mq3.platform.playable_multitexture.setState`, `mq3.client.baseq3_console_background.point`, `mq3.renderer.playable_materials.transformUVAt` and additional helpers from base Quake III console background `drawLayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `layer` | `dynamic` | — | Record read through `layer.stage.blend`, `layer.stage`, `layer.slot`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawLayer`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawLayer`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L64)

<a id="function-function-mq3-client-baseq3-console-background-fail-function-fail-message-src-mq3-client-baseq3-console-background-ml-1320637069"></a>
### fail

```ml
function fail(message)
```

Creates the base Quake III console background error `7745` with diagnostic text `"Baseq3 console background: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"Baseq3 console background: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L23)

- [mq3.client.baseq3_console_background.Layer](Type-mq3-client-baseq3-console-background-layer-1829146384.md) — struct
<a id="function-function-mq3-client-baseq3-console-background-load-function-load-archive-firsttextureslot-src-mq3-client-baseq3-console-background-ml-1284111481"></a>
### load

```ml
function load(archive, firstTextureSlot)
```

Calls `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.renderer.shader_parser.parseIndexed`, `mq3.renderer.playable_materials.loadRuntimeStage` and additional helpers from base Quake III console background `load`. The final path returns `Media(SHADER_NAME,layers,firstTextureSlot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L27)

- [mq3.client.baseq3_console_background.Media](Type-mq3-client-baseq3-console-background-media-1898967553.md) — struct
<a id="function-function-mq3-client-baseq3-console-background-point-function-point-x-y-src-mq3-client-baseq3-console-background-ml-633670739"></a>
### point

```ml
function point(x, y)
```

Creates a `mq3.client.baseq3_console_background.Point` record. Assigns `x` from `x`, `y` from `y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `Point.x`. |
| `y` | `dynamic` | — | Value used to initialize `Point.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L58)

- [mq3.client.baseq3_console_background.Point](Type-mq3-client-baseq3-console-background-point-1935872503.md) — struct
<a id="function-function-mq3-client-baseq3-console-background-release-function-release-media-src-mq3-client-baseq3-console-background-ml-1858720838"></a>
### release

```ml
function release(media)
```

Calls `mq3.platform.playable_window.releaseTexture` from base Quake III console background `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.layers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L54)

<a id="constant-constant-mq3-client-baseq3-console-background-required-textures-const-required-textures-2-src-mq3-client-baseq3-console-background-ml-2127943845"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L12)

<a id="constant-constant-mq3-client-baseq3-console-background-shader-name-const-shader-name-console-src-mq3-client-baseq3-console-background-ml-1560070400"></a>
### SHADER_NAME

```ml
const SHADER_NAME = "console"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L11)

<a id="function-function-mq3-client-baseq3-console-background-upload-function-upload-media-src-mq3-client-baseq3-console-background-ml-986991424"></a>
### upload

```ml
function upload(media)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip`, `mq3.client.baseq3_console_background.release` from base Quake III console background `upload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.layers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L47)
