# `src/mq3/client/baseq3_hud.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.baseq3_hud`](Package-mq3-client-baseq3-hud-419540686.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_hud.ml` as `textHud` → [src/mq3/client/playable_hud.ml](File-src-mq3-client-playable-hud-ml-310363425.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-baseq3-hud-ammoiconkey-function-ammoiconkey-weapon-src-mq3-client-baseq3-hud-ml-1531413600"></a>
### ammoIconKey

```ml
function ammoIconKey(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L193)

- [mq3.client.baseq3_hud.Asset](Type-mq3-client-baseq3-hud-asset-1903594512.md) — struct
- [mq3.client.baseq3_hud.Catalog](Type-mq3-client-baseq3-hud-catalog-869376479.md) — struct
<a id="constant-constant-mq3-client-baseq3-hud-char-height-const-char-height-48-src-mq3-client-baseq3-hud-ml-1694780625"></a>
### CHAR_HEIGHT

```ml
const CHAR_HEIGHT = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L14)

<a id="constant-constant-mq3-client-baseq3-hud-char-width-const-char-width-32-src-mq3-client-baseq3-hud-ml-1004076810"></a>
### CHAR_WIDTH

```ml
const CHAR_WIDTH = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L13)

<a id="function-function-mq3-client-baseq3-hud-clampfield-function-clampfield-value-width-src-mq3-client-baseq3-hud-ml-1727776595"></a>
### clampField

```ml
function clampField(value, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L104)

<a id="function-function-mq3-client-baseq3-hud-descriptor-function-descriptor-key-name-src-mq3-client-baseq3-hud-ml-1139469552"></a>
### descriptor

```ml
function descriptor(key, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L34)

<a id="function-function-mq3-client-baseq3-hud-descriptors-function-descriptors-src-mq3-client-baseq3-hud-ml-1000064720"></a>
### descriptors

```ml
function descriptors()
```

The first eleven entries match cgs.media.numberShaders[0..STAT_MINUS]. The remaining artwork is the stock Baseq3 HUD and common q3dm1 pickup set. Baseq3's status bar uses a distinct icona_* picture for each ammo type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L39)

<a id="function-function-mq3-client-baseq3-hud-draw-function-draw-catalog-value-width-height-now-src-mq3-client-baseq3-hud-ml-963806433"></a>
### draw

```ml
function draw(catalog, value, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L246)

<a id="function-function-mq3-client-baseq3-hud-drawasset-function-drawasset-asset-x-y-w-h-placement-red-green-blue-src-mq3-client-baseq3-hud-ml-1372339469"></a>
### drawAsset

```ml
function drawAsset(asset, x, y, w, h, placement, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `placement` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L148)

<a id="function-function-mq3-client-baseq3-hud-drawfield-function-drawfield-catalog-x-y-width-value-placement-red-green-blue-src-mq3-client-baseq3-hud-ml-1917472318"></a>
### drawField

```ml
function drawField(catalog, x, y, width, value, placement, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `placement` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L167)

<a id="function-function-mq3-client-baseq3-hud-drawweaponselect-function-drawweaponselect-catalog-value-placement-now-src-mq3-client-baseq3-hud-ml-614241213"></a>
### drawWeaponSelect

```ml
function drawWeaponSelect(catalog, value, placement, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `placement` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L231)

<a id="function-function-mq3-client-baseq3-hud-fail-function-fail-message-src-mq3-client-baseq3-hud-ml-1778910915"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L32)

<a id="constant-constant-mq3-client-baseq3-hud-feedback-time-const-feedback-time-3000-src-mq3-client-baseq3-hud-ml-123637804"></a>
### FEEDBACK_TIME

```ml
const FEEDBACK_TIME = 3000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L21)

<a id="function-function-mq3-client-baseq3-hud-fieldstart-function-fieldstart-x-width-value-src-mq3-client-baseq3-hud-ml-1729389185"></a>
### fieldStart

```ml
function fieldStart(x, width, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L162)

<a id="function-function-mq3-client-baseq3-hud-find-function-find-catalog-key-src-mq3-client-baseq3-hud-ml-1044500850"></a>
### find

```ml
function find(catalog, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L81)

<a id="function-function-mq3-client-baseq3-hud-findkey-function-findkey-value-values-src-mq3-client-baseq3-hud-ml-1135976111"></a>
### findKey

```ml
function findKey(value, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L213)

<a id="function-function-mq3-client-baseq3-hud-frag-function-frag-value-now-src-mq3-client-baseq3-hud-ml-343427499"></a>
### frag

```ml
function frag(value, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L132)

<a id="constant-constant-mq3-client-baseq3-hud-icon-size-const-icon-size-48-src-mq3-client-baseq3-hud-ml-744732053"></a>
### ICON_SIZE

```ml
const ICON_SIZE = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L15)

<a id="function-function-mq3-client-baseq3-hud-layout-function-layout-width-height-src-mq3-client-baseq3-hud-ml-1137833851"></a>
### layout

```ml
function layout(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L137)

- [mq3.client.baseq3_hud.Layout](Type-mq3-client-baseq3-hud-layout-1169061062.md) — struct
<a id="function-function-mq3-client-baseq3-hud-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-baseq3-hud-ml-1980994191"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L63)

<a id="function-function-mq3-client-baseq3-hud-numberkey-function-numberkey-character-src-mq3-client-baseq3-hud-ml-313708671"></a>
### numberKey

```ml
function numberKey(character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L157)

<a id="function-function-mq3-client-baseq3-hud-pickup-function-pickup-value-classname-name-now-src-mq3-client-baseq3-hud-ml-1011651941"></a>
### pickup

```ml
function pickup(value, classname, name, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L127)

<a id="function-function-mq3-client-baseq3-hud-pickupiconkey-function-pickupiconkey-classname-src-mq3-client-baseq3-hud-ml-705887563"></a>
### pickupIconKey

```ml
function pickupIconKey(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L205)

<a id="function-function-mq3-client-baseq3-hud-point-function-point-x-y-src-mq3-client-baseq3-hud-ml-1206141515"></a>
### point

```ml
function point(x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L146)

- [mq3.client.baseq3_hud.Point](Type-mq3-client-baseq3-hud-point-463638582.md) — struct
<a id="function-function-mq3-client-baseq3-hud-release-function-release-catalog-src-mq3-client-baseq3-hud-ml-1346631033"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L98)

<a id="constant-constant-mq3-client-baseq3-hud-required-textures-const-required-textures-39-src-mq3-client-baseq3-hud-ml-676279149"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 39
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L20)

<a id="constant-constant-mq3-client-baseq3-hud-selected-weapon-icon-size-const-selected-weapon-icon-size-48-src-mq3-client-baseq3-hud-ml-758517533"></a>
### SELECTED_WEAPON_ICON_SIZE

```ml
const SELECTED_WEAPON_ICON_SIZE = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L24)

<a id="function-function-mq3-client-baseq3-hud-selectweapons-function-selectweapons-value-weapons-ammo-selected-now-src-mq3-client-baseq3-hud-ml-602613561"></a>
### selectWeapons

```ml
function selectWeapons(value, weapons, ammo, selected, now)
```

Mirrors CG_Weapon_f/CG_NextWeapon_f feedback: the selection strip is only visible briefly after a real selection change. Callers pass owned weapon classnames in weapon-id order and the matching ammo counts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `weapons` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |
| `selected` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L121)

<a id="function-function-mq3-client-baseq3-hud-state-function-state-health-armor-ammo-weapon-score-kills-deaths-src-mq3-client-baseq3-hud-ml-841264169"></a>
### state

```ml
function state(health, armor, ammo, weapon, score, kills, deaths)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |
| `kills` | `dynamic` | — |  |
| `deaths` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L114)

- [mq3.client.baseq3_hud.State](Type-mq3-client-baseq3-hud-state-2145107605.md) — struct
<a id="constant-constant-mq3-client-baseq3-hud-status-head-size-const-status-head-size-60-src-mq3-client-baseq3-hud-ml-536192599"></a>
### STATUS_HEAD_SIZE

```ml
const STATUS_HEAD_SIZE = 60
```

CG_DrawStatusBarHead uses ICON_SIZE * 1.25 and anchors it to y=480-size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L18)

<a id="constant-constant-mq3-client-baseq3-hud-status-head-y-const-status-head-y-420-src-mq3-client-baseq3-hud-ml-1924340223"></a>
### STATUS_HEAD_Y

```ml
const STATUS_HEAD_Y = 420
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L19)

<a id="function-function-mq3-client-baseq3-hud-statusheadx-function-statusheadx-placement-src-mq3-client-baseq3-hud-ml-874533231"></a>
### statusHeadX

```ml
function statusHeadX(placement)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `placement` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L142)

<a id="constant-constant-mq3-client-baseq3-hud-text-icon-space-const-text-icon-space-4-src-mq3-client-baseq3-hud-ml-81053137"></a>
### TEXT_ICON_SPACE

```ml
const TEXT_ICON_SPACE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L16)

<a id="function-function-mq3-client-baseq3-hud-upload-function-upload-catalog-src-mq3-client-baseq3-hud-ml-1623179587"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L88)

<a id="constant-constant-mq3-client-baseq3-hud-virtual-height-const-virtual-height-480-src-mq3-client-baseq3-hud-ml-1484978981"></a>
### VIRTUAL_HEIGHT

```ml
const VIRTUAL_HEIGHT = 480
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L12)

<a id="constant-constant-mq3-client-baseq3-hud-virtual-width-const-virtual-width-640-src-mq3-client-baseq3-hud-ml-842036159"></a>
### VIRTUAL_WIDTH

```ml
const VIRTUAL_WIDTH = 640
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L11)

<a id="constant-constant-mq3-client-baseq3-hud-weapon-icon-size-const-weapon-icon-size-40-src-mq3-client-baseq3-hud-ml-2116396419"></a>
### WEAPON_ICON_SIZE

```ml
const WEAPON_ICON_SIZE = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L23)

<a id="constant-constant-mq3-client-baseq3-hud-weapon-select-time-const-weapon-select-time-1400-src-mq3-client-baseq3-hud-ml-481400418"></a>
### WEAPON_SELECT_TIME

```ml
const WEAPON_SELECT_TIME = 1400
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L22)

<a id="function-function-mq3-client-baseq3-hud-weapondisplayname-function-weapondisplayname-weapon-src-mq3-client-baseq3-hud-ml-1650421822"></a>
### weaponDisplayName

```ml
function weaponDisplayName(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L218)

<a id="function-function-mq3-client-baseq3-hud-weaponiconkey-function-weaponiconkey-weapon-src-mq3-client-baseq3-hud-ml-1886802692"></a>
### weaponIconKey

```ml
function weaponIconKey(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L179)
