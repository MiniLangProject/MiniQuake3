# `src/mq3/client/map_loading.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.map_loading`](Package-mq3-client-map-loading-1733085862.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cgame_drawtools.ml` as `loadFont` → [src/mq3/client/cgame_drawtools.ml](File-src-mq3-client-cgame-drawtools-ml-249217190.md)
- `mq3/client/cgame_info.ml` as `cgameInfo` → [src/mq3/client/cgame_info.ml](File-src-mq3-client-cgame-info-ml-1413900769.md)
- `mq3/client/ui_connect.ml` as `loadConnect` → [src/mq3/client/ui_connect.ml](File-src-mq3-client-ui-connect-ml-1918938180.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/game/bg_public.ml` as `bg` → [src/mq3/game/bg_public.ml](File-src-mq3-game-bg-public-ml-2091356861.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/command_queue.ml` as `q2commands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/qvm_2d_batch.ml` as `qvm2d` → [src/mq3/renderer/qvm_2d_batch.ml](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-map-loading-addicon-function-addicon-assetlist-kindlist-name-src-mq3-client-map-loading-ml-257064069"></a>
### addIcon

```ml
function addIcon(assetList, kindList, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assetList` | `dynamic` | — |  |
| `kindList` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L70)

<a id="function-function-mq3-client-map-loading-collecticons-function-collecticons-screen-config-assets-kinds-clientnum-src-mq3-client-map-loading-ml-1920454487"></a>
### collectIcons

```ml
function collectIcons(screen, config, assets, kinds, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L78)

<a id="function-function-mq3-client-map-loading-configvalue-function-configvalue-config-slot-src-mq3-client-map-loading-ml-811999674"></a>
### configValue

```ml
function configValue(config, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L58)

<a id="function-function-mq3-client-map-loading-create-function-create-archive-mapname-servername-localgame-src-mq3-client-map-loading-ml-920644562"></a>
### create

```ml
function create(archive, mapName, serverName, localGame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `serverName` | `dynamic` | — |  |
| `localGame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L25)

<a id="constant-constant-mq3-client-map-loading-first-texture-const-first-texture-3072-src-mq3-client-map-loading-ml-275960483"></a>
### FIRST_TEXTURE

```ml
const FIRST_TEXTURE = 3072
```

The map screen releases its textures before the match uploads its HUD.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L21)

<a id="function-function-mq3-client-map-loading-hasimage-function-hasimage-screen-name-src-mq3-client-map-loading-ml-367595499"></a>
### hasImage

```ml
function hasImage(screen, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L63)

<a id="function-function-mq3-client-map-loading-layout-function-layout-screen-loadingtext-width-height-config-src-mq3-client-map-loading-ml-1929648182"></a>
### layout

```ml
function layout(screen, loadingText, width, height, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — |  |
| `loadingText` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L108)

<a id="function-function-mq3-client-map-loading-quad-function-quad-commands-x-y-w-h-s1-t1-s2-t2-handle-src-mq3-client-map-loading-ml-1217876750"></a>
### quad

```ml
function quad(commands, x, y, w, h, s1, t1, s2, t2, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L38)

<a id="function-function-mq3-client-map-loading-release-function-release-screen-src-mq3-client-map-loading-ml-292518628"></a>
### release

```ml
function release(screen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L154)

- [mq3.client.map_loading.Screen](Type-mq3-client-map-loading-screen-1249177996.md) — struct
<a id="function-function-mq3-client-map-loading-show-function-show-screen-loadingtext-width-height-config-reupload-src-mq3-client-map-loading-ml-1970888018"></a>
### show

```ml
function show(screen, loadingText, width, height, config, reupload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — |  |
| `loadingText` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `reupload` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L134)

<a id="function-function-mq3-client-map-loading-textline-function-textline-commands-font-x-y-text-small-src-mq3-client-map-loading-ml-2068984852"></a>
### textLine

```ml
function textLine(commands, font, x, y, text, small)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |
| `font` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `small` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L42)

<a id="constant-constant-mq3-client-map-loading-texture-count-const-texture-count-980-src-mq3-client-map-loading-ml-1223601870"></a>
### TEXTURE_COUNT

```ml
const TEXTURE_COUNT = 980
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/map_loading.ml#L22)
