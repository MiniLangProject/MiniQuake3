# `src/mq3/client/playable_menu.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_menu`](Package-mq3-client-playable-menu-1256261935.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-menu-action-function-action-index-src-mq3-client-playable-menu-ml-1708502212"></a>
### action

```ml
function action(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L32)

<a id="constant-constant-mq3-client-playable-menu-action-cinematics-const-action-cinematics-cinematics-src-mq3-client-playable-menu-ml-787634643"></a>
### ACTION_CINEMATICS

```ml
const ACTION_CINEMATICS = "cinematics"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L27)

<a id="constant-constant-mq3-client-playable-menu-action-demos-const-action-demos-demos-src-mq3-client-playable-menu-ml-1390165263"></a>
### ACTION_DEMOS

```ml
const ACTION_DEMOS = "demos"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L26)

<a id="constant-constant-mq3-client-playable-menu-action-exit-const-action-exit-exit-src-mq3-client-playable-menu-ml-1335161457"></a>
### ACTION_EXIT

```ml
const ACTION_EXIT = "exit"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L29)

<a id="constant-constant-mq3-client-playable-menu-action-mods-const-action-mods-mods-src-mq3-client-playable-menu-ml-278492086"></a>
### ACTION_MODS

```ml
const ACTION_MODS = "mods"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L28)

<a id="constant-constant-mq3-client-playable-menu-action-multiplayer-const-action-multiplayer-multiplayer-src-mq3-client-playable-menu-ml-100601951"></a>
### ACTION_MULTIPLAYER

```ml
const ACTION_MULTIPLAYER = "multiplayer"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L24)

<a id="constant-constant-mq3-client-playable-menu-action-none-const-action-none-src-mq3-client-playable-menu-ml-1480892577"></a>
### ACTION_NONE

```ml
const ACTION_NONE = ""
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L22)

<a id="constant-constant-mq3-client-playable-menu-action-setup-const-action-setup-setup-src-mq3-client-playable-menu-ml-2005480694"></a>
### ACTION_SETUP

```ml
const ACTION_SETUP = "setup"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L25)

<a id="constant-constant-mq3-client-playable-menu-action-single-player-const-action-single-player-single-player-src-mq3-client-playable-menu-ml-710829287"></a>
### ACTION_SINGLE_PLAYER

```ml
const ACTION_SINGLE_PLAYER = "single_player"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L23)

- [mq3.client.playable_menu.Asset](Type-mq3-client-playable-menu-asset-1847687973.md) — struct
<a id="constant-constant-mq3-client-playable-menu-banner-gap-width-const-banner-gap-width-4-src-mq3-client-playable-menu-ml-547943153"></a>
### BANNER_GAP_WIDTH

```ml
const BANNER_GAP_WIDTH = 4.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L16)

<a id="constant-constant-mq3-client-playable-menu-banner-height-const-banner-height-36-src-mq3-client-playable-menu-ml-2062733386"></a>
### BANNER_HEIGHT

```ml
const BANNER_HEIGHT = 36.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L15)

<a id="function-function-mq3-client-playable-menu-bannerglyph-function-bannerglyph-character-src-mq3-client-playable-menu-ml-578451945"></a>
### bannerGlyph

```ml
function bannerGlyph(character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L87)

<a id="function-function-mq3-client-playable-menu-bannerwidth-function-bannerwidth-text-scale-src-mq3-client-playable-menu-ml-1400172085"></a>
### bannerWidth

```ml
function bannerWidth(text, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L98)

- [mq3.client.playable_menu.Catalog](Type-mq3-client-playable-menu-catalog-1866962430.md) — struct
<a id="function-function-mq3-client-playable-menu-descriptor-function-descriptor-key-name-src-mq3-client-playable-menu-ml-64183908"></a>
### descriptor

```ml
function descriptor(key, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L53)

<a id="function-function-mq3-client-playable-menu-descriptors-function-descriptors-src-mq3-client-playable-menu-ml-1548885114"></a>
### descriptors

```ml
function descriptors()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L54)

<a id="function-function-mq3-client-playable-menu-draw-function-draw-width-height-src-mq3-client-playable-menu-ml-1253583109"></a>
### draw

```ml
function draw(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L171)

<a id="function-function-mq3-client-playable-menu-drawbanner-function-drawbanner-asset-text-centerx-y-scale-scalex-scaley-src-mq3-client-playable-menu-ml-1715345480"></a>
### drawBanner

```ml
function drawBanner(asset, text, centerX, y, scale, scaleX, scaleY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `centerX` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L115)

<a id="function-function-mq3-client-playable-menu-drawprop-function-drawprop-asset-text-centerx-y-scale-scalex-scaley-red-green-blue-src-mq3-client-playable-menu-ml-790729098"></a>
### drawProp

```ml
function drawProp(asset, text, centerX, y, scale, scaleX, scaleY, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `centerX` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L107)

<a id="function-function-mq3-client-playable-menu-drawquad-function-drawquad-slot-x-y-width-height-u0-v0-u1-v1-red-green-blue-src-mq3-client-playable-menu-ml-814589228"></a>
### drawQuad

```ml
function drawQuad(slot, x, y, width, height, u0, v0, u1, v1, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `u0` | `dynamic` | — |  |
| `v0` | `dynamic` | — |  |
| `u1` | `dynamic` | — |  |
| `v1` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L103)

<a id="function-function-mq3-client-playable-menu-drawretail-function-drawretail-catalog-width-height-now-src-mq3-client-playable-menu-ml-753609362"></a>
### drawRetail

```ml
function drawRetail(catalog, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L140)

<a id="function-function-mq3-client-playable-menu-drawretailstate-function-drawretailstate-catalog-value-width-height-now-src-mq3-client-playable-menu-ml-1141493269"></a>
### drawRetailState

```ml
function drawRetailState(catalog, value, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L125)

<a id="function-function-mq3-client-playable-menu-drawtext-function-drawtext-text-x-y-scale-red-green-blue-src-mq3-client-playable-menu-ml-2111565008"></a>
### drawText

```ml
function drawText(text, x, y, scale, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L166)

<a id="function-function-mq3-client-playable-menu-entryy-function-entryy-index-src-mq3-client-playable-menu-ml-750657792"></a>
### entryY

```ml
function entryY(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L124)

<a id="function-function-mq3-client-playable-menu-fail-function-fail-message-src-mq3-client-playable-menu-ml-1431429473"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L52)

<a id="function-function-mq3-client-playable-menu-find-function-find-catalog-key-src-mq3-client-playable-menu-ml-2011752040"></a>
### find

```ml
function find(catalog, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L67)

<a id="function-function-mq3-client-playable-menu-glyph-function-glyph-character-src-mq3-client-playable-menu-ml-201706149"></a>
### glyph

```ml
function glyph(character)
```

Dependency-free bitmap fallback for runs without the retail PK3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L143)

<a id="function-function-mq3-client-playable-menu-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-menu-ml-385709619"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L55)

<a id="function-function-mq3-client-playable-menu-menuentries-function-menuentries-src-mq3-client-playable-menu-ml-961688792"></a>
### menuEntries

```ml
function menuEntries()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L123)

<a id="function-function-mq3-client-playable-menu-point-function-point-x-y-src-mq3-client-playable-menu-ml-914531183"></a>
### point

```ml
function point(x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L102)

- [mq3.client.playable_menu.Point](Type-mq3-client-playable-menu-point-1076532699.md) — struct
<a id="constant-constant-mq3-client-playable-menu-prop-gap-width-const-prop-gap-width-3-src-mq3-client-playable-menu-ml-153713144"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L14)

<a id="constant-constant-mq3-client-playable-menu-prop-height-const-prop-height-27-src-mq3-client-playable-menu-ml-1648620784"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L13)

<a id="function-function-mq3-client-playable-menu-propglyph-function-propglyph-character-src-mq3-client-playable-menu-ml-870897763"></a>
### propGlyph

```ml
function propGlyph(character)
```

Exact atlas coordinates from q3_ui/ui_atoms.c for the uppercase alphabet.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L80)

<a id="function-function-mq3-client-playable-menu-release-function-release-catalog-src-mq3-client-playable-menu-ml-2028066343"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L77)

<a id="constant-constant-mq3-client-playable-menu-required-textures-const-required-textures-4-src-mq3-client-playable-menu-ml-93414391"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L10)

<a id="function-function-mq3-client-playable-menu-state-function-state-src-mq3-client-playable-menu-ml-587427068"></a>
### state

```ml
function state()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L31)

- [mq3.client.playable_menu.State](Type-mq3-client-playable-menu-state-1700260740.md) — struct
<a id="function-function-mq3-client-playable-menu-step-function-step-value-updown-downdown-enterdown-src-mq3-client-playable-menu-ml-1850430116"></a>
### step

```ml
function step(value, upDown, downDown, enterDown)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `upDown` | `dynamic` | — |  |
| `downDown` | `dynamic` | — |  |
| `enterDown` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L42)

<a id="function-function-mq3-client-playable-menu-textwidth-function-textwidth-text-scale-src-mq3-client-playable-menu-ml-704985287"></a>
### textWidth

```ml
function textWidth(text, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L94)

<a id="function-function-mq3-client-playable-menu-upload-function-upload-catalog-src-mq3-client-playable-menu-ml-223408997"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L72)

<a id="constant-constant-mq3-client-playable-menu-virtual-height-const-virtual-height-480-src-mq3-client-playable-menu-ml-437082411"></a>
### VIRTUAL_HEIGHT

```ml
const VIRTUAL_HEIGHT = 480.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L12)

<a id="constant-constant-mq3-client-playable-menu-virtual-width-const-virtual-width-640-src-mq3-client-playable-menu-ml-213320965"></a>
### VIRTUAL_WIDTH

```ml
const VIRTUAL_WIDTH = 640.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L11)
