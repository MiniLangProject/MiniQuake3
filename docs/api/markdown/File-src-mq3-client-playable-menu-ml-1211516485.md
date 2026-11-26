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

Evaluates playable menu `action` and returns `ACTION_SINGLE_PLAYER`, `ACTION_MULTIPLAYER`, `ACTION_SETUP` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value tested by `index==0`, `if index==1` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L39)

<a id="constant-constant-mq3-client-playable-menu-action-cinematics-const-action-cinematics-cinematics-src-mq3-client-playable-menu-ml-787634643"></a>
### ACTION_CINEMATICS

```ml
const ACTION_CINEMATICS = "cinematics"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L31)

<a id="constant-constant-mq3-client-playable-menu-action-demos-const-action-demos-demos-src-mq3-client-playable-menu-ml-1390165263"></a>
### ACTION_DEMOS

```ml
const ACTION_DEMOS = "demos"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L30)

<a id="constant-constant-mq3-client-playable-menu-action-exit-const-action-exit-exit-src-mq3-client-playable-menu-ml-1335161457"></a>
### ACTION_EXIT

```ml
const ACTION_EXIT = "exit"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L33)

<a id="constant-constant-mq3-client-playable-menu-action-mods-const-action-mods-mods-src-mq3-client-playable-menu-ml-278492086"></a>
### ACTION_MODS

```ml
const ACTION_MODS = "mods"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L32)

<a id="constant-constant-mq3-client-playable-menu-action-multiplayer-const-action-multiplayer-multiplayer-src-mq3-client-playable-menu-ml-100601951"></a>
### ACTION_MULTIPLAYER

```ml
const ACTION_MULTIPLAYER = "multiplayer"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L28)

<a id="constant-constant-mq3-client-playable-menu-action-none-const-action-none-src-mq3-client-playable-menu-ml-1480892577"></a>
### ACTION_NONE

```ml
const ACTION_NONE = ""
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L26)

<a id="constant-constant-mq3-client-playable-menu-action-setup-const-action-setup-setup-src-mq3-client-playable-menu-ml-2005480694"></a>
### ACTION_SETUP

```ml
const ACTION_SETUP = "setup"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L29)

<a id="constant-constant-mq3-client-playable-menu-action-single-player-const-action-single-player-single-player-src-mq3-client-playable-menu-ml-710829287"></a>
### ACTION_SINGLE_PLAYER

```ml
const ACTION_SINGLE_PLAYER = "single_player"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L27)

- [mq3.client.playable_menu.Asset](Type-mq3-client-playable-menu-asset-1847687973.md) — struct
<a id="constant-constant-mq3-client-playable-menu-banner-gap-width-const-banner-gap-width-4-src-mq3-client-playable-menu-ml-1954981853"></a>
### BANNER_GAP_WIDTH

```ml
const BANNER_GAP_WIDTH = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L16)

<a id="constant-constant-mq3-client-playable-menu-banner-height-const-banner-height-36-src-mq3-client-playable-menu-ml-170641064"></a>
### BANNER_HEIGHT

```ml
const BANNER_HEIGHT = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L15)

<a id="function-function-mq3-client-playable-menu-bannerglyph-function-bannerglyph-character-src-mq3-client-playable-menu-ml-578451945"></a>
### bannerGlyph

```ml
function bannerGlyph(character)
```

Evaluates playable menu `bannerGlyph` and returns `[0,0,12]`, `glyphs[index]`, `[0,0,-1]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Value used by `if character==" " then return [0,0,12] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L119)

<a id="function-function-mq3-client-playable-menu-bannerwidth-function-bannerwidth-text-scale-src-mq3-client-playable-menu-ml-1400172085"></a>
### bannerWidth

```ml
function bannerWidth(text, scale)
```

Calls `mq3.client.playable_menu.bannerGlyph` from playable menu `bannerWidth`. The final path returns `width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Sequence read at `text[index]`. |
| `scale` | `dynamic` | — | Value used by `if glyph[2]>=0 then width=width+(glyph[2]+BANNER_GAP_WIDTH)*scale end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L136)

- [mq3.client.playable_menu.Catalog](Type-mq3-client-playable-menu-catalog-1866962430.md) — struct
<a id="function-function-mq3-client-playable-menu-descriptor-function-descriptor-key-name-src-mq3-client-playable-menu-ml-64183908"></a>
### descriptor

```ml
function descriptor(key, name)
```

Builds the playable menu `descriptor` sequence from `[key,name]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable menu entry. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable menu resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L70)

<a id="function-function-mq3-client-playable-menu-descriptors-function-descriptors-src-mq3-client-playable-menu-ml-1548885114"></a>
### descriptors

```ml
function descriptors()
```

Builds the playable menu `descriptors` sequence from `[descriptor("font","menu/art/font1_prop"),descriptor("glow","menu/art/font1_prop_glo"),descriptor("banner","menu/art/font2_prop"),descriptor("cursor","menu/art/3_cursor2")]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L72)

<a id="function-function-mq3-client-playable-menu-draw-function-draw-width-height-src-mq3-client-playable-menu-ml-1253583109"></a>
### draw

```ml
function draw(width, height)
```

Calls `mq3.client.playable_menu.drawText` from playable menu `draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L270)

<a id="function-function-mq3-client-playable-menu-drawbanner-function-drawbanner-asset-text-centerx-y-scale-scalex-scaley-src-mq3-client-playable-menu-ml-1715345480"></a>
### drawBanner

```ml
function drawBanner(asset, text, centerX, y, scale, scaleX, scaleY)
```

Calls `mq3.client.playable_menu.bannerWidth`, `mq3.client.playable_menu.bannerGlyph`, `mq3.client.playable_menu.drawQuad` from playable menu `drawBanner`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.slot`. |
| `text` | `dynamic` | — | Sequence read at `text[index]`. |
| `centerX` | `dynamic` | — | Value used by `x=(centerX-bannerWidth(text,scale)/2.0)*scaleX`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawBanner`. |
| `scale` | `dynamic` | — | Value used by `x=(centerX-bannerWidth(text,scale)/2.0)*scaleX`. |
| `scaleX` | `dynamic` | — | Value used by `x=(centerX-bannerWidth(text,scale)/2.0)*scaleX`. |
| `scaleY` | `dynamic` | — | Value used by `if glyph[2]>0 then drawQuad(asset.slot,x,y*scaleY,width*scaleX,BANNER_HEIGHT*scale*scaleY,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/25...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L188)

<a id="function-function-mq3-client-playable-menu-drawprop-function-drawprop-asset-text-centerx-y-scale-scalex-scaley-red-green-blue-src-mq3-client-playable-menu-ml-790729098"></a>
### drawProp

```ml
function drawProp(asset, text, centerX, y, scale, scaleX, scaleY, red, green, blue)
```

Calls `mq3.client.playable_menu.textWidth`, `mq3.client.playable_menu.propGlyph`, `mq3.client.playable_menu.drawQuad` from playable menu `drawProp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.slot`. |
| `text` | `dynamic` | — | Sequence read at `text[index]`. |
| `centerX` | `dynamic` | — | Value used by `x=(centerX-textWidth(text,scale)/2.0)*scaleX`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawProp`. |
| `scale` | `dynamic` | — | Value used by `x=(centerX-textWidth(text,scale)/2.0)*scaleX`. |
| `scaleX` | `dynamic` | — | Value used by `x=(centerX-textWidth(text,scale)/2.0)*scaleX`. |
| `scaleY` | `dynamic` | — | Value used by `if glyph[2]>0 then drawQuad(asset.slot,x,y*scaleY,width*scaleX,PROP_HEIGHT*scale*scaleY,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256....`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L172)

<a id="function-function-mq3-client-playable-menu-drawquad-function-drawquad-slot-x-y-width-height-u0-v0-u1-v1-red-green-blue-src-mq3-client-playable-menu-ml-814589228"></a>
### drawQuad

```ml
function drawQuad(slot, x, y, width, height, u0, v0, u1, v1, red, green, blue)
```

Calls `mq3.client.playable_menu.point`, `mq3.platform.playable_window.drawTriangle` from playable menu `drawQuad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawQuad`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawQuad`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawQuad`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawQuad`. |
| `u0` | `dynamic` | — | Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`. |
| `v0` | `dynamic` | — | Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`. |
| `u1` | `dynamic` | — | Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`. |
| `v1` | `dynamic` | — | Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L157)

<a id="function-function-mq3-client-playable-menu-drawretail-function-drawretail-catalog-width-height-now-src-mq3-client-playable-menu-ml-753609362"></a>
### drawRetail

```ml
function drawRetail(catalog, width, height, now)
```

Adapts `mq3.client.playable_menu.drawRetailState` to playable menu `drawRetail`, returning its result for `catalog, state(), width, height, now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Forwarded to `mq3.client.playable_menu.drawRetailState`. |
| `width` | `dynamic` | — | Argument 3 of `mq3.client.playable_menu.drawRetailState`. |
| `height` | `dynamic` | — | Argument 4 of `mq3.client.playable_menu.drawRetailState`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_menu.drawRetailState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L227)

<a id="function-function-mq3-client-playable-menu-drawretailstate-function-drawretailstate-catalog-value-width-height-now-src-mq3-client-playable-menu-ml-1141493269"></a>
### drawRetailState

```ml
function drawRetailState(catalog, value, width, height, now)
```

Calls `mq3.client.playable_menu.draw`, `mq3.platform.playable_multitexture.setState`, `mq3.client.playable_menu.drawQuad` and additional helpers from playable menu `drawRetailState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `value` | `dynamic` | — | Record read through `value.selected`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawRetailState`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawRetailState`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L207)

<a id="function-function-mq3-client-playable-menu-drawtext-function-drawtext-text-x-y-scale-red-green-blue-src-mq3-client-playable-menu-ml-2111565008"></a>
### drawText

```ml
function drawText(text, x, y, scale, red, green, blue)
```

Calls `mq3.client.playable_menu.glyph`, `mq3.platform.playable_window.lineNative` from playable menu `drawText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Sequence read at `text[index]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawText`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawText`. |
| `scale` | `dynamic` | — | Value used by `for row=0 to 6 for column=0 to 4 if (rows[row]&(1<<(4-column)))!=0 then x0=cursor+column*scale`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L262)

<a id="function-function-mq3-client-playable-menu-entryy-function-entryy-index-src-mq3-client-playable-menu-ml-750657792"></a>
### entryY

```ml
function entryY(index)
```

Computes `134.0+34.0*index` for playable menu `entryY`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value used by `return 134.0+34.0*index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L200)

<a id="function-function-mq3-client-playable-menu-fail-function-fail-message-src-mq3-client-playable-menu-ml-1431429473"></a>
### fail

```ml
function fail(message)
```

Creates the playable menu error `7590` with diagnostic text `"Baseq3 menu: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"Baseq3 menu: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L66)

<a id="function-function-mq3-client-playable-menu-find-function-find-catalog-key-src-mq3-client-playable-menu-ml-2011752040"></a>
### find

```ml
function find(catalog, key)
```

Searches the playable menu collection for find, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable menu entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L92)

<a id="function-function-mq3-client-playable-menu-glyph-function-glyph-character-src-mq3-client-playable-menu-ml-201706149"></a>
### glyph

```ml
function glyph(character)
```

Dependency-free bitmap fallback for runs without the retail PK3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Value used by `if character=="A" then return [14,17,17,31,17,17,17] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L231)

<a id="function-function-mq3-client-playable-menu-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-menu-ml-385709619"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.client.playable_menu.descriptors`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_menu.Asset` and additional helpers from playable menu `load`. The final path returns `Catalog(assets,firstTextureSlot,len(assets))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L77)

<a id="function-function-mq3-client-playable-menu-menuentries-function-menuentries-src-mq3-client-playable-menu-ml-961688792"></a>
### menuEntries

```ml
function menuEntries()
```

Lists the 7 playable menu menu entries strings in their declared order, beginning with `"SINGLE PLAYER"`, `"MULTIPLAYER"`, `"SETUP"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L197)

<a id="function-function-mq3-client-playable-menu-point-function-point-x-y-src-mq3-client-playable-menu-ml-914531183"></a>
### point

```ml
function point(x, y)
```

Creates a `mq3.client.playable_menu.Point` record. Assigns `x` from `x`, `y` from `y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `Point.x`. |
| `y` | `dynamic` | — | Value used to initialize `Point.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L143)

- [mq3.client.playable_menu.Point](Type-mq3-client-playable-menu-point-1076532699.md) — struct
<a id="constant-constant-mq3-client-playable-menu-prop-gap-width-const-prop-gap-width-3-src-mq3-client-playable-menu-ml-479879238"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L14)

<a id="constant-constant-mq3-client-playable-menu-prop-height-const-prop-height-27-src-mq3-client-playable-menu-ml-2055187678"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L13)

<a id="function-function-mq3-client-playable-menu-propglyph-function-propglyph-character-src-mq3-client-playable-menu-ml-870897763"></a>
### propGlyph

```ml
function propGlyph(character)
```

Exact atlas coordinates from q3_ui/ui_atoms.c for the uppercase alphabet.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Value used by `if character==" " then return [0,0,8] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L110)

<a id="function-function-mq3-client-playable-menu-release-function-release-catalog-src-mq3-client-playable-menu-ml-2028066343"></a>
### release

```ml
function release(catalog)
```

Calls `mq3.platform.playable_window.releaseTexture` from playable menu `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L106)

<a id="constant-constant-mq3-client-playable-menu-required-textures-const-required-textures-4-src-mq3-client-playable-menu-ml-93414391"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L10)

<a id="function-function-mq3-client-playable-menu-state-function-state-src-mq3-client-playable-menu-ml-587427068"></a>
### state

```ml
function state()
```

Creates a `mq3.client.playable_menu.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L36)

- [mq3.client.playable_menu.State](Type-mq3-client-playable-menu-state-1700260740.md) — struct
<a id="function-function-mq3-client-playable-menu-step-function-step-value-updown-downdown-enterdown-src-mq3-client-playable-menu-ml-1850430116"></a>
### step

```ml
function step(value, upDown, downDown, enterDown)
```

Updates `value.selected`, `value.lastUp`, `value.lastDown`, `value.lastEnter` during playable menu `step`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable playable menu record/storage; this routine assigns `value.selected`, `value.lastUp`, `value.lastDown`, `value.lastEnter`. |
| `upDown` | `dynamic` | — | Value assigned to `value.lastUp`. |
| `downDown` | `dynamic` | — | Value assigned to `value.lastDown`. |
| `enterDown` | `dynamic` | — | Value assigned to `value.lastEnter`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L54)

<a id="function-function-mq3-client-playable-menu-textwidth-function-textwidth-text-scale-src-mq3-client-playable-menu-ml-704985287"></a>
### textWidth

```ml
function textWidth(text, scale)
```

Calls `mq3.client.playable_menu.propGlyph` from playable menu `textWidth`. The final path returns `width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Sequence read at `text[index]`. |
| `scale` | `dynamic` | — | Value used by `if glyph[2]>=0 then width=width+(glyph[2]+PROP_GAP_WIDTH)*scale end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L129)

<a id="function-function-mq3-client-playable-menu-upload-function-upload-catalog-src-mq3-client-playable-menu-ml-223408997"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip`, `mq3.client.playable_menu.release` from playable menu `upload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L99)

<a id="constant-constant-mq3-client-playable-menu-virtual-height-const-virtual-height-480-src-mq3-client-playable-menu-ml-1168059983"></a>
### VIRTUAL_HEIGHT

```ml
const VIRTUAL_HEIGHT = 480
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L12)

<a id="constant-constant-mq3-client-playable-menu-virtual-width-const-virtual-width-640-src-mq3-client-playable-menu-ml-1982404257"></a>
### VIRTUAL_WIDTH

```ml
const VIRTUAL_WIDTH = 640
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L11)
