# `src/mq3/client/baseq3_hud.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.baseq3_hud`](Package-mq3-client-baseq3-hud-419540686.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_hud.ml` as `textHud` → [src/mq3/client/playable_hud.ml](File-src-mq3-client-playable-hud-ml-310363425.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-baseq3-hud-ammoiconkey-function-ammoiconkey-weapon-src-mq3-client-baseq3-hud-ml-1531413600"></a>
### ammoIconKey

```ml
function ammoIconKey(weapon)
```

Calls `mq3.client.baseq3_hud.weaponIconKey` from base Quake III HUD `ammoIconKey`. The final path returns `"ammo_machinegun"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `icon=weaponIconKey(weapon)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L358)

- [mq3.client.baseq3_hud.Asset](Type-mq3-client-baseq3-hud-asset-1903594512.md) — struct
- [mq3.client.baseq3_hud.Catalog](Type-mq3-client-baseq3-hud-catalog-869376479.md) — struct
<a id="constant-constant-mq3-client-baseq3-hud-char-height-const-char-height-48-src-mq3-client-baseq3-hud-ml-1694780625"></a>
### CHAR_HEIGHT

```ml
const CHAR_HEIGHT = 48
```

Height of a standard character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L18)

<a id="constant-constant-mq3-client-baseq3-hud-char-width-const-char-width-32-src-mq3-client-baseq3-hud-ml-1004076810"></a>
### CHAR_WIDTH

```ml
const CHAR_WIDTH = 32
```

Width of a standard character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L16)

<a id="function-function-mq3-client-baseq3-hud-clampfield-function-clampfield-value-width-src-mq3-client-baseq3-hud-ml-1727776595"></a>
### clampField

```ml
function clampField(value, width)
```

Evaluates base Quake III HUD `clampField` and returns `0`, `maximum`, `minimum` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>maximum`, `if value<minimum` before the calculation continues. |
| `width` | `dynamic` | — | Width in the coordinate space used by `clampField`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L210)

<a id="function-function-mq3-client-baseq3-hud-descriptor-function-descriptor-key-name-src-mq3-client-baseq3-hud-ml-1139469552"></a>
### descriptor

```ml
function descriptor(key, name)
```

Builds the base Quake III HUD `descriptor` sequence from `[key,name]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding base Quake III HUD entry. |
| `name` | `dynamic` | — | Name used to select or register the corresponding base Quake III HUD resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L126)

<a id="function-function-mq3-client-baseq3-hud-descriptors-function-descriptors-src-mq3-client-baseq3-hud-ml-1000064720"></a>
### descriptors

```ml
function descriptors()
```

The first eleven entries match cgs.media.numberShaders[0..STAT_MINUS]. The remaining artwork is the stock Baseq3 HUD and common q3dm1 pickup set. Baseq3's status bar uses a distinct icona_* picture for each ammo type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L131)

<a id="function-function-mq3-client-baseq3-hud-draw-function-draw-catalog-value-width-height-now-src-mq3-client-baseq3-hud-ml-963806433"></a>
### draw

```ml
function draw(catalog, value, width, height, now)
```

Calls `mq3.client.baseq3_hud.layout`, `mq3.client.baseq3_hud.drawAsset`, `mq3.client.baseq3_hud.find` and additional helpers from base Quake III HUD `draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `value` | `dynamic` | — | Record read through `value.ammo`, `value.weapon`, `value.health`, `value.armor` and additional values. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L429)

<a id="function-function-mq3-client-baseq3-hud-drawasset-function-drawasset-asset-x-y-w-h-placement-red-green-blue-src-mq3-client-baseq3-hud-ml-1372339469"></a>
### drawAsset

```ml
function drawAsset(asset, x, y, w, h, placement, red, green, blue)
```

Calls `mq3.client.baseq3_hud.point`, `mq3.platform.playable_window.drawTriangle` from base Quake III HUD `drawAsset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.slot`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawAsset`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawAsset`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `drawAsset`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `drawAsset`. |
| `placement` | `dynamic` | — | Record read through `placement.scaleX`, `placement.scaleY`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L293)

<a id="function-function-mq3-client-baseq3-hud-drawfield-function-drawfield-catalog-x-y-width-value-placement-red-green-blue-src-mq3-client-baseq3-hud-ml-1917472318"></a>
### drawField

```ml
function drawField(catalog, x, y, width, value, placement, red, green, blue)
```

Calls `mq3.client.baseq3_hud.clampField`, `slice`, `mq3.client.baseq3_hud.fieldStart` and additional helpers from base Quake III HUD `drawField`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawField`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawField`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawField`. |
| `value` | `dynamic` | — | Value used by `text=str(clampField(value,width))`. |
| `placement` | `dynamic` | — | Value used by `drawAsset(find(catalog,numberKey(text[index])),cursor,y,CHAR_WIDTH,CHAR_HEIGHT,placement,red,green,blue)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L328)

<a id="function-function-mq3-client-baseq3-hud-drawweaponselect-function-drawweaponselect-catalog-value-placement-now-src-mq3-client-baseq3-hud-ml-614241213"></a>
### drawWeaponSelect

```ml
function drawWeaponSelect(catalog, value, placement, now)
```

Calls `std.string.toLowerAscii`, `mq3.client.baseq3_hud.drawAsset`, `mq3.client.baseq3_hud.find` and additional helpers from base Quake III HUD `drawWeaponSelect`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `value` | `dynamic` | — | Record read through `value.weaponSelectTime`, `value.ownedWeapons`, `value.weaponAmmo`, `value.weapon`. |
| `placement` | `dynamic` | — | Record read through `placement.scaleX`, `placement.scaleY`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L408)

<a id="function-function-mq3-client-baseq3-hud-fail-function-fail-message-src-mq3-client-baseq3-hud-ml-1778910915"></a>
### fail

```ml
function fail(message)
```

Creates the base Quake III HUD error `7580` with diagnostic text `"Baseq3 HUD: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"Baseq3 HUD: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L121)

<a id="constant-constant-mq3-client-baseq3-hud-feedback-time-const-feedback-time-3000-src-mq3-client-baseq3-hud-ml-123637804"></a>
### FEEDBACK_TIME

```ml
const FEEDBACK_TIME = 3000
```

Duration in milliseconds of temporary HUD feedback emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L30)

<a id="function-function-mq3-client-baseq3-hud-fieldstart-function-fieldstart-x-width-value-src-mq3-client-baseq3-hud-ml-1729389185"></a>
### fieldStart

```ml
function fieldStart(x, width, value)
```

Calls `mq3.client.baseq3_hud.clampField` from base Quake III HUD `fieldStart`. The final path returns `x+2.0+CHAR_WIDTH*(width-length)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `fieldStart`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `fieldStart`. |
| `value` | `dynamic` | — | Value used by `text=str(clampField(value,width))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L313)

<a id="function-function-mq3-client-baseq3-hud-find-function-find-catalog-key-src-mq3-client-baseq3-hud-ml-1044500850"></a>
### find

```ml
function find(catalog, key)
```

Searches the base Quake III HUD collection for find, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding base Quake III HUD entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L180)

<a id="function-function-mq3-client-baseq3-hud-findkey-function-findkey-value-values-src-mq3-client-baseq3-hud-ml-1135976111"></a>
### findKey

```ml
function findKey(value, values)
```

Evaluates base Quake III HUD `findKey` and returns `true`, `false` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value==item` before the calculation continues. |
| `values` | `dynamic` | — | Value used by `for each item in values if value==item then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L383)

<a id="function-function-mq3-client-baseq3-hud-frag-function-frag-value-now-src-mq3-client-baseq3-hud-ml-343427499"></a>
### frag

```ml
function frag(value, now)
```

Updates `value.fragTime` during base Quake III HUD `frag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable base Quake III HUD record/storage; this routine assigns `value.fragTime`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L259)

<a id="constant-constant-mq3-client-baseq3-hud-icon-size-const-icon-size-48-src-mq3-client-baseq3-hud-ml-744732053"></a>
### ICON_SIZE

```ml
const ICON_SIZE = 48
```

Default square HUD icon size in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L20)

<a id="function-function-mq3-client-baseq3-hud-layout-function-layout-width-height-src-mq3-client-baseq3-hud-ml-1137833851"></a>
### layout

```ml
function layout(width, height)
```

Calls `mq3.client.baseq3_hud.Layout` from base Quake III HUD `layout`. The final path returns `Layout(width/VIRTUAL_WIDTH,height/VIRTUAL_HEIGHT,0.0,185.0,370.0,432.0,432.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `layout`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `layout`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L267)

- [mq3.client.baseq3_hud.Layout](Type-mq3-client-baseq3-hud-layout-1169061062.md) — struct
<a id="function-function-mq3-client-baseq3-hud-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-baseq3-hud-ml-1980994191"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.client.baseq3_hud.descriptors`, `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.renderer.playable_materials.mappedImageName` and additional helpers from base Quake III HUD `load`. The final path returns `Catalog(assets,firstTextureSlot,len(assets))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L159)

<a id="function-function-mq3-client-baseq3-hud-numberkey-function-numberkey-character-src-mq3-client-baseq3-hud-ml-313708671"></a>
### numberKey

```ml
function numberKey(character)
```

Evaluates base Quake III HUD `numberKey` and returns `"number_minus"`, `"number_"+character` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Value used by `if character=="-" then return "number_minus" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L304)

<a id="function-function-mq3-client-baseq3-hud-pickup-function-pickup-value-classname-name-now-src-mq3-client-baseq3-hud-ml-1011651941"></a>
### pickup

```ml
function pickup(value, classname, name, now)
```

Updates `value.pickupClass`, `value.pickupName`, `value.pickupTime` during base Quake III HUD `pickup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable base Quake III HUD record/storage; this routine assigns `value.pickupClass`, `value.pickupName`, `value.pickupTime`. |
| `classname` | `dynamic` | — | Value assigned to `value.pickupClass`. |
| `name` | `dynamic` | — | Value assigned to `value.pickupName`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L251)

<a id="function-function-mq3-client-baseq3-hud-pickupiconkey-function-pickupiconkey-classname-src-mq3-client-baseq3-hud-ml-705887563"></a>
### pickupIconKey

```ml
function pickupIconKey(classname)
```

Calls `std.string.toLowerAscii`, `mq3.client.baseq3_hud.findKey`, `std.string.startsWith` and additional helpers from base Quake III HUD `pickupIconKey`. The final path returns `weaponIconKey(name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `name=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L372)

<a id="function-function-mq3-client-baseq3-hud-point-function-point-x-y-src-mq3-client-baseq3-hud-ml-1206141515"></a>
### point

```ml
function point(x, y)
```

Creates a `mq3.client.baseq3_hud.Point` record. Assigns `x` from `x`, `y` from `y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `Point.x`. |
| `y` | `dynamic` | — | Value used to initialize `Point.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L281)

- [mq3.client.baseq3_hud.Point](Type-mq3-client-baseq3-hud-point-463638582.md) — struct
<a id="function-function-mq3-client-baseq3-hud-release-function-release-catalog-src-mq3-client-baseq3-hud-ml-1346631033"></a>
### release

```ml
function release(catalog)
```

Calls `mq3.platform.playable_window.releaseTexture` from base Quake III HUD `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L201)

<a id="constant-constant-mq3-client-baseq3-hud-required-textures-const-required-textures-39-src-mq3-client-baseq3-hud-ml-676279149"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 39
```

Number of texture slots required by the module's fixed media layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L28)

<a id="constant-constant-mq3-client-baseq3-hud-selected-weapon-icon-size-const-selected-weapon-icon-size-48-src-mq3-client-baseq3-hud-ml-758517533"></a>
### SELECTED_WEAPON_ICON_SIZE

```ml
const SELECTED_WEAPON_ICON_SIZE = 48
```

Enlarged icon size used to emphasize the currently selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L36)

<a id="function-function-mq3-client-baseq3-hud-selectweapons-function-selectweapons-value-weapons-ammo-selected-now-src-mq3-client-baseq3-hud-ml-602613561"></a>
### selectWeapons

```ml
function selectWeapons(value, weapons, ammo, selected, now)
```

Mirrors CG_Weapon_f/CG_NextWeapon_f feedback: the selection strip is only visible briefly after a real selection change. Callers pass owned weapon classnames in weapon-id order and the matching ammo counts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable base Quake III HUD record/storage; this routine assigns `value.ownedWeapons`, `value.weaponAmmo`, `value.weapon`, `value.weaponSelectTime`. |
| `weapons` | `dynamic` | — | Sequence whose length/content is inspected by `selectWeapons`. |
| `ammo` | `dynamic` | — | Sequence whose length/content is inspected by `selectWeapons`. |
| `selected` | `dynamic` | — | Value assigned to `value.weapon`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L240)

<a id="function-function-mq3-client-baseq3-hud-state-function-state-health-armor-ammo-weapon-score-kills-deaths-src-mq3-client-baseq3-hud-ml-841264169"></a>
### state

```ml
function state(health, armor, ammo, weapon, score, kills, deaths)
```

Creates a `mq3.client.baseq3_hud.State` record. Assigns `health` from `health`, `armor` from `armor`, `ammo` from `ammo`, `weapon` from `weapon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — | Value used to initialize `State.health`. |
| `armor` | `dynamic` | — | Value used to initialize `State.armor`. |
| `ammo` | `dynamic` | — | Value used to initialize `State.ammo`. |
| `weapon` | `dynamic` | — | Value used to initialize `State.weapon`. |
| `score` | `dynamic` | — | Value used to initialize `State.score`. |
| `kills` | `dynamic` | — | Value used to initialize `State.kills`. |
| `deaths` | `dynamic` | — | Value used to initialize `State.deaths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L228)

- [mq3.client.baseq3_hud.State](Type-mq3-client-baseq3-hud-state-2145107605.md) — struct
<a id="constant-constant-mq3-client-baseq3-hud-status-head-size-const-status-head-size-60-src-mq3-client-baseq3-hud-ml-536192599"></a>
### STATUS_HEAD_SIZE

```ml
const STATUS_HEAD_SIZE = 60
```

CG_DrawStatusBarHead uses ICON_SIZE * 1.25 and anchors it to y=480-size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L24)

<a id="constant-constant-mq3-client-baseq3-hud-status-head-y-const-status-head-y-420-src-mq3-client-baseq3-hud-ml-1924340223"></a>
### STATUS_HEAD_Y

```ml
const STATUS_HEAD_Y = 420
```

Virtual-screen Y coordinate used to place the HUD status-head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L26)

<a id="function-function-mq3-client-baseq3-hud-statusheadx-function-statusheadx-placement-src-mq3-client-baseq3-hud-ml-874533231"></a>
### statusHeadX

```ml
function statusHeadX(placement)
```

Computes `placement.healthX+CHAR_WIDTH*3.0+TEXT_ICON_SPACE` for base Quake III HUD `statusHeadX`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `placement` | `dynamic` | — | Record read through `placement.healthX`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L274)

<a id="constant-constant-mq3-client-baseq3-hud-text-icon-space-const-text-icon-space-4-src-mq3-client-baseq3-hud-ml-81053137"></a>
### TEXT_ICON_SPACE

```ml
const TEXT_ICON_SPACE = 4
```

Horizontal gap between text and its adjacent HUD icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L22)

<a id="function-function-mq3-client-baseq3-hud-upload-function-upload-catalog-src-mq3-client-baseq3-hud-ml-1623179587"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip`, `mq3.client.baseq3_hud.release` from base Quake III HUD `upload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L189)

<a id="constant-constant-mq3-client-baseq3-hud-virtual-height-const-virtual-height-480-src-mq3-client-baseq3-hud-ml-1484978981"></a>
### VIRTUAL_HEIGHT

```ml
const VIRTUAL_HEIGHT = 480
```

Height of the native UI's virtual coordinate space before scaling to the display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L14)

<a id="constant-constant-mq3-client-baseq3-hud-virtual-width-const-virtual-width-640-src-mq3-client-baseq3-hud-ml-842036159"></a>
### VIRTUAL_WIDTH

```ml
const VIRTUAL_WIDTH = 640
```

Width of the native UI's virtual coordinate space before scaling to the display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L12)

<a id="constant-constant-mq3-client-baseq3-hud-weapon-icon-size-const-weapon-icon-size-40-src-mq3-client-baseq3-hud-ml-2116396419"></a>
### WEAPON_ICON_SIZE

```ml
const WEAPON_ICON_SIZE = 40
```

Normal weapon-icon size in virtual HUD coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L34)

<a id="constant-constant-mq3-client-baseq3-hud-weapon-select-time-const-weapon-select-time-1400-src-mq3-client-baseq3-hud-ml-481400418"></a>
### WEAPON_SELECT_TIME

```ml
const WEAPON_SELECT_TIME = 1400
```

Milliseconds for which the weapon-selection HUD remains visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L32)

<a id="function-function-mq3-client-baseq3-hud-weapondisplayname-function-weapondisplayname-weapon-src-mq3-client-baseq3-hud-ml-1650421822"></a>
### weaponDisplayName

```ml
function weaponDisplayName(weapon)
```

Calls `mq3.client.baseq3_hud.weaponIconKey` from base Quake III HUD `weaponDisplayName`. The final path returns `"MACHINEGUN"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `key=weaponIconKey(weapon)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L390)

<a id="function-function-mq3-client-baseq3-hud-weaponiconkey-function-weaponiconkey-weapon-src-mq3-client-baseq3-hud-ml-1886802692"></a>
### weaponIconKey

```ml
function weaponIconKey(weapon)
```

Calls `std.string.toLowerAscii`, `std.string.startsWith` from base Quake III HUD `weaponIconKey`. The final path returns `"weapon_bfg"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `name=strings.toLowerAscii(weapon)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L342)
