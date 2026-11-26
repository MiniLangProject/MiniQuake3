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

Calls `assetList.len`, `assetList.get`, `assetList.add` and additional helpers from map loading `addIcon`. The final path returns `assetList.len()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assetList` | `dynamic` | — | Record read through `assetList.len`, `assetList.get`, `assetList.add`. |
| `kindList` | `dynamic` | — | Record read through `kindList.add`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding map loading resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L134)

<a id="function-function-mq3-client-map-loading-collecticons-function-collecticons-screen-config-assets-kinds-clientnum-src-mq3-client-map-loading-ml-1920454487"></a>
### collectIcons

```ml
function collectIcons(screen, config, assets, kinds, clientNum)
```

Updates `screen.loadingInfo.itemIcons`, `screen.loadingInfo.playerIcons`, `screen.assets`, `screen.kinds` during map loading `collectIcons`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — | Mutable map loading record/storage; this routine assigns `screen.loadingInfo.itemIcons`, `screen.loadingInfo.playerIcons`, `screen.assets`, `screen.kinds`. |
| `config` | `dynamic` | — | Value used by `bits=bytes(configValue(config,bg.CS_ITEMS))`. |
| `assets` | `dynamic` | — | Sequence read at `assets[index]`. |
| `kinds` | `dynamic` | — | Sequence read at `kinds[index]`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L148)

<a id="function-function-mq3-client-map-loading-configvalue-function-configvalue-config-slot-src-mq3-client-map-loading-ml-811999674"></a>
### configValue

```ml
function configValue(config, slot)
```

Evaluates map loading `configValue` and returns `""`, `config[slot]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Sequence read at `config[slot]`. |
| `slot` | `dynamic` | — | Value used by `if config==void or slot>=len(config) or config[slot]==void then return "" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L115)

<a id="function-function-mq3-client-map-loading-create-function-create-archive-mapname-servername-localgame-src-mq3-client-map-loading-ml-920644562"></a>
### create

```ml
function create(archive, mapName, serverName, localGame)
```

Calls `mq3.platform.playable_window.milliseconds`, `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.renderer.shader_index.find` and additional helpers from map loading `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `serverName` | `dynamic` | — | Value used by `return Screen(archive,scripts,[name,"levelShotDetail","menu/art/font1_prop"],["shaderNoMip","shader","shaderNoMip"],mapName,serverName,localGa...`. |
| `localGame` | `dynamic` | — | Value used by `return Screen(archive,scripts,[name,"levelShotDetail","menu/art/font1_prop"],["shaderNoMip","shader","shaderNoMip"],mapName,serverName,localGa...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L61)

<a id="constant-constant-mq3-client-map-loading-first-texture-const-first-texture-3072-src-mq3-client-map-loading-ml-275960483"></a>
### FIRST_TEXTURE

```ml
const FIRST_TEXTURE = 3072
```

The map screen releases its textures before the match uploads its HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L21)

<a id="function-function-mq3-client-map-loading-hasimage-function-hasimage-screen-name-src-mq3-client-map-loading-ml-367595499"></a>
### hasImage

```ml
function hasImage(screen, name)
```

Calls `mq3.renderer.playable_materials.candidates`, `mq3.format.pk3.findEntry`, `mq3.renderer.shader_index.find` from map loading `hasImage`. The final path returns `shaderIndex.find(screen.scripts[0],name)!=void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — | Record read through `screen.archive`, `screen.scripts`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding map loading resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L123)

<a id="function-function-mq3-client-map-loading-layout-function-layout-screen-loadingtext-width-height-config-src-mq3-client-map-loading-ml-1929648182"></a>
### layout

```ml
function layout(screen, loadingText, width, height, config)
```

Calls `mq3.client.map_loading.configValue`, `mq3.shared.info.setValue`, `mq3.client.cgame_info.loadingString` and additional helpers from map loading `layout`. The final path returns `commands.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — | Record read through `screen.mapName`, `screen.loadingInfo`, `screen.localGame`, `screen.assets` and additional values. |
| `loadingText` | `dynamic` | — | Value used by `cgameInfo.loadingString(state,loadingText)`. |
| `width` | `dynamic` | — | Value assigned to `font.screenXScale`. |
| `height` | `dynamic` | — | Value assigned to `font.screenYScale`, `font.screenXScale`. |
| `config` | `dynamic` | — | Value used by `server=configValue(config,0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L184)

<a id="function-function-mq3-client-map-loading-quad-function-quad-commands-x-y-w-h-s1-t1-s2-t2-handle-src-mq3-client-map-loading-ml-1217876750"></a>
### quad

```ml
function quad(commands, x, y, w, h, s1, t1, s2, t2, handle)
```

Calls `commands.add`, `mq3.renderer.command_queue.Command` from map loading `quad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Record read through `commands.add`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `quad`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `quad`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `quad`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `quad`. |
| `s1` | `dynamic` | — | Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`. |
| `t1` | `dynamic` | — | Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`. |
| `s2` | `dynamic` | — | Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`. |
| `t2` | `dynamic` | — | Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `quad`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L85)

<a id="function-function-mq3-client-map-loading-release-function-release-screen-src-mq3-client-map-loading-ml-292518628"></a>
### release

```ml
function release(screen)
```

Updates `screen.catalog` during map loading `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — | Mutable map loading record/storage; this routine assigns `screen.catalog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L239)

- [mq3.client.map_loading.Screen](Type-mq3-client-map-loading-screen-1249177996.md) — struct
<a id="function-function-mq3-client-map-loading-show-function-show-screen-loadingtext-width-height-config-reupload-src-mq3-client-map-loading-ml-1970888018"></a>
### show

```ml
function show(screen, loadingText, width, height, config, reupload)
```

Updates `screen.catalog` during map loading `show`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — | Mutable map loading record/storage; this routine assigns `screen.catalog`. |
| `loadingText` | `dynamic` | — | Value used by `commands=layout(screen,loadingText,width,height,config)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `show`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `show`. |
| `config` | `dynamic` | — | Value used by `commands=layout(screen,loadingText,width,height,config)`. |
| `reupload` | `dynamic` | — | Value used by `reupload=true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L217)

<a id="function-function-mq3-client-map-loading-textline-function-textline-commands-font-x-y-text-small-src-mq3-client-map-loading-ml-2068984852"></a>
### textLine

```ml
function textLine(commands, font, x, y, text, small)
```

Calls `mq3.client.cgame_drawtools.clear`, `mq3.client.cgame_drawtools.drawProportionalString`, `mq3.client.map_loading.quad` and additional helpers from map loading `textLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Record read through `commands.add`. |
| `font` | `dynamic` | — | Record read through `font.actions`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `textLine`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `textLine`. |
| `text` | `dynamic` | — | Text consumed or emitted by `textLine` in the map loading path. |
| `small` | `dynamic` | — | Value used by `if small then style=style\|loadFont.UI_SMALLFONT end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L96)

<a id="constant-constant-mq3-client-map-loading-texture-count-const-texture-count-980-src-mq3-client-map-loading-ml-1223601870"></a>
### TEXTURE_COUNT

```ml
const TEXTURE_COUNT = 980
```

Texture-cache capacity reserved for the indexed map-loading screen renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L23)
