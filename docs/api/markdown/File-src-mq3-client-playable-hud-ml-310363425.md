# `src/mq3/client/playable_hud.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_hud`](Package-mq3-client-playable-hud-1565631025.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-client-playable-hud-clampvalue-function-clampvalue-value-src-mq3-client-playable-hud-ml-627235653"></a>
### clampValue

```ml
function clampValue(value)
```

Clamps the HUD numeric value to zero through VALUE_MAX before drawing its digits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0`, `if value>VALUE_MAX` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L59)

<a id="function-function-mq3-client-playable-hud-draw-function-draw-hud-width-height-src-mq3-client-playable-hud-ml-1175246730"></a>
### draw

```ml
function draw(hud, width, height)
```

Calls `mq3.client.playable_hud.layout`, `mq3.client.playable_hud.drawCrosshair`, `mq3.client.playable_hud.drawText` from playable HUD `draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hud` | `dynamic` | — | Record read through `hud.health`, `hud.armor`, `hud.ammo`, `hud.status` and additional values. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L200)

<a id="function-function-mq3-client-playable-hud-drawcrosshair-function-drawcrosshair-width-height-size-red-green-blue-src-mq3-client-playable-hud-ml-385066736"></a>
### drawCrosshair

```ml
function drawCrosshair(width, height, size, red, green, blue)
```

Calls `mq3.client.playable_hud.line` from playable HUD `drawCrosshair`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawCrosshair`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawCrosshair`. |
| `size` | `dynamic` | — | Value tested by `size<2` before the calculation continues. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L186)

<a id="function-function-mq3-client-playable-hud-drawtext-function-drawtext-text-x-y-scale-red-green-blue-src-mq3-client-playable-hud-ml-983030460"></a>
### drawText

```ml
function drawText(text, x, y, scale, red, green, blue)
```

Draws HUD glyphs as horizontal line segments at the requested origin, scale and RGB color, rejecting nonpositive scale.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Sequence read at `text[index]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawText`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawText`. |
| `scale` | `dynamic` | — | Value tested by `scale<=0` before the calculation continues. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L161)

<a id="function-function-mq3-client-playable-hud-glyph-function-glyph-character-src-mq3-client-playable-hud-ml-1610811959"></a>
### glyph

```ml
function glyph(character)
```

Evaluates playable HUD `glyph` and returns `[14,17,17,31,17,17,17]`, `[30,17,17,30,17,17,30]`, `[14,17,16,16,16,17,14]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Value used by `if character=="A" then return [14,17,17,31,17,17,17] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L98)

<a id="constant-constant-mq3-client-playable-hud-glyph-height-const-glyph-height-7-src-mq3-client-playable-hud-ml-1486185732"></a>
### GLYPH_HEIGHT

```ml
const GLYPH_HEIGHT = 7
```

Vertical cell height of the compact bitmap HUD font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L11)

<a id="constant-constant-mq3-client-playable-hud-glyph-width-const-glyph-width-5-src-mq3-client-playable-hud-ml-2045999156"></a>
### GLYPH_WIDTH

```ml
const GLYPH_WIDTH = 5
```

Horizontal cell width of the compact bitmap HUD font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L9)

- [mq3.client.playable_hud.HudLayout](Type-mq3-client-playable-hud-hudlayout-191041016.md) — struct
- [mq3.client.playable_hud.HudState](Type-mq3-client-playable-hud-hudstate-2065924275.md) — struct
<a id="function-function-mq3-client-playable-hud-layout-function-layout-width-height-src-mq3-client-playable-hud-ml-63113727"></a>
### layout

```ml
function layout(width, height)
```

Calls `mq3.client.playable_hud.HudLayout` from playable HUD `layout`. The final path returns `HudLayout(18,height-25*scale,height-16*scale,16,38,5*scale)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `layout`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `layout`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L89)

<a id="function-function-mq3-client-playable-hud-line-function-line-x0-y0-x1-y1-red-green-blue-src-mq3-client-playable-hud-ml-1773714084"></a>
### line

```ml
function line(x0, y0, x1, y1, red, green, blue)
```

Calls `mq3.platform.playable_window.lineNative`, `mq3.compat.numeric.trunc32` from playable HUD `line`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x0` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `y0` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `x1` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `y1` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L52)

<a id="function-function-mq3-client-playable-hud-setvalues-function-setvalues-hud-health-armor-ammo-src-mq3-client-playable-hud-ml-73132914"></a>
### setValues

```ml
function setValues(hud, health, armor, ammo)
```

Updates `hud.health`, `hud.armor`, `hud.ammo` during playable HUD `setValues`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hud` | `dynamic` | — | Mutable playable HUD record/storage; this routine assigns `hud.health`, `hud.armor`, `hud.ammo`. |
| `health` | `dynamic` | — | Value used by `hud.health=clampValue(health)`. |
| `armor` | `dynamic` | — | Value used by `hud.armor=clampValue(armor)`. |
| `ammo` | `dynamic` | — | Value used by `hud.ammo=clampValue(ammo)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L80)

<a id="function-function-mq3-client-playable-hud-state-function-state-health-armor-ammo-status-helptext-src-mq3-client-playable-hud-ml-452691587"></a>
### state

```ml
function state(health, armor, ammo, status, helpText)
```

Creates a `mq3.client.playable_hud.HudState` record. Assigns `status` from `status`, `helpText` from `helpText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — | Value used to initialize `HudState.health`. |
| `armor` | `dynamic` | — | Value used to initialize `HudState.armor`. |
| `ammo` | `dynamic` | — | Value used to initialize `HudState.ammo`. |
| `status` | `dynamic` | — | Value used to initialize `HudState.status`. |
| `helpText` | `dynamic` | — | Value used to initialize `HudState.helpText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L71)

<a id="function-function-mq3-client-playable-hud-textwidth-function-textwidth-text-scale-src-mq3-client-playable-hud-ml-871692809"></a>
### textWidth

```ml
function textWidth(text, scale)
```

Evaluates playable HUD `textWidth` and returns `error(7492,"HUD text scale must be positive")`, `0`, `len(text)*(GLYPH_WIDTH+1)*scale-scale` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text whose length/content is inspected by `textWidth`. |
| `scale` | `dynamic` | — | Value tested by `scale<=0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L147)

<a id="constant-constant-mq3-client-playable-hud-value-max-const-value-max-999-src-mq3-client-playable-hud-ml-1355337966"></a>
### VALUE_MAX

```ml
const VALUE_MAX = 999
```

Largest numeric value accepted by the compact HUD number display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_hud.ml#L13)
