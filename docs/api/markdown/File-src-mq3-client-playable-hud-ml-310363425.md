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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L20)

<a id="function-function-mq3-client-playable-hud-draw-function-draw-hud-width-height-src-mq3-client-playable-hud-ml-1175246730"></a>
### draw

```ml
function draw(hud, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hud` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L123)

<a id="function-function-mq3-client-playable-hud-drawcrosshair-function-drawcrosshair-width-height-size-red-green-blue-src-mq3-client-playable-hud-ml-385066736"></a>
### drawCrosshair

```ml
function drawCrosshair(width, height, size, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L113)

<a id="function-function-mq3-client-playable-hud-drawtext-function-drawtext-text-x-y-scale-red-green-blue-src-mq3-client-playable-hud-ml-983030460"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L95)

<a id="function-function-mq3-client-playable-hud-glyph-function-glyph-character-src-mq3-client-playable-hud-ml-1610811959"></a>
### glyph

```ml
function glyph(character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L43)

<a id="constant-constant-mq3-client-playable-hud-glyph-height-const-glyph-height-7-src-mq3-client-playable-hud-ml-1486185732"></a>
### GLYPH_HEIGHT

```ml
const GLYPH_HEIGHT = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L9)

<a id="constant-constant-mq3-client-playable-hud-glyph-width-const-glyph-width-5-src-mq3-client-playable-hud-ml-2045999156"></a>
### GLYPH_WIDTH

```ml
const GLYPH_WIDTH = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L8)

- [mq3.client.playable_hud.HudLayout](Type-mq3-client-playable-hud-hudlayout-191041016.md) — struct
- [mq3.client.playable_hud.HudState](Type-mq3-client-playable-hud-hudstate-2065924275.md) — struct
<a id="function-function-mq3-client-playable-hud-layout-function-layout-width-height-src-mq3-client-playable-hud-ml-63113727"></a>
### layout

```ml
function layout(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L36)

<a id="function-function-mq3-client-playable-hud-line-function-line-x0-y0-x1-y1-red-green-blue-src-mq3-client-playable-hud-ml-1773714084"></a>
### line

```ml
function line(x0, y0, x1, y1, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x0` | `dynamic` | — |  |
| `y0` | `dynamic` | — |  |
| `x1` | `dynamic` | — |  |
| `y1` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L15)

<a id="function-function-mq3-client-playable-hud-setvalues-function-setvalues-hud-health-armor-ammo-src-mq3-client-playable-hud-ml-73132914"></a>
### setValues

```ml
function setValues(hud, health, armor, ammo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hud` | `dynamic` | — |  |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L30)

<a id="function-function-mq3-client-playable-hud-state-function-state-health-armor-ammo-status-helptext-src-mq3-client-playable-hud-ml-452691587"></a>
### state

```ml
function state(health, armor, ammo, status, helpText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |
| `helpText` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L26)

<a id="function-function-mq3-client-playable-hud-textwidth-function-textwidth-text-scale-src-mq3-client-playable-hud-ml-871692809"></a>
### textWidth

```ml
function textWidth(text, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L89)

<a id="constant-constant-mq3-client-playable-hud-value-max-const-value-max-999-src-mq3-client-playable-hud-ml-1355337966"></a>
### VALUE_MAX

```ml
const VALUE_MAX = 999
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L10)
