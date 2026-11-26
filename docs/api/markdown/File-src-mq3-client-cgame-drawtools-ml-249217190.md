# `src/mq3/client/cgame_drawtools.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_drawtools`](Package-mq3-client-cgame-drawtools-753909514.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)

## Declarations

<a id="function-function-mq3-client-cgame-drawtools-action-function-action-kind-x-y-width-height-s1-t1-s2-t2-shader-color-dispatched-src-mq3-client-cgame-drawtools-ml-2062423875"></a>
### action

```ml
function action(kind, x, y, width, height, s1, t1, s2, t2, shader, color, dispatched)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `dispatched` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L43)

<a id="function-function-mq3-client-cgame-drawtools-adjustfrom640-function-adjustfrom640-state-x-y-width-height-src-mq3-client-cgame-drawtools-ml-1157175411"></a>
### adjustFrom640

```ml
function adjustFrom640(state, x, y, width, height)
```

CG_AdjustFrom640

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L52)

<a id="constant-constant-mq3-client-cgame-drawtools-armor-protection-const-armor-protection-0-66-src-mq3-client-cgame-drawtools-ml-865087687"></a>
### ARMOR_PROTECTION

```ml
const ARMOR_PROTECTION = 0.66
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L19)

<a id="function-function-mq3-client-cgame-drawtools-bannerwidth-function-bannerwidth-text-src-mq3-client-cgame-drawtools-ml-1581049959"></a>
### bannerWidth

```ml
function bannerWidth(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L142)

<a id="constant-constant-mq3-client-cgame-drawtools-bigchar-height-const-bigchar-height-16-src-mq3-client-cgame-drawtools-ml-1282769148"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L15)

<a id="constant-constant-mq3-client-cgame-drawtools-bigchar-width-const-bigchar-width-16-src-mq3-client-cgame-drawtools-ml-1437042070"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L14)

<a id="function-function-mq3-client-cgame-drawtools-clear-function-clear-state-src-mq3-client-cgame-drawtools-ml-1560424467"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L47)

<a id="function-function-mq3-client-cgame-drawtools-colorforhealth-function-colorforhealth-state-src-mq3-client-cgame-drawtools-ml-368336973"></a>
### colorForHealth

```ml
function colorForHealth(state)
```

CG_ColorForHealth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L128)

<a id="function-function-mq3-client-cgame-drawtools-colorindex-function-colorindex-code-src-mq3-client-cgame-drawtools-ml-647676697"></a>
### colorIndex

```ml
function colorIndex(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L79)

<a id="function-function-mq3-client-cgame-drawtools-colortable-function-colortable-index-src-mq3-client-cgame-drawtools-ml-827431890"></a>
### colorTable

```ml
function colorTable(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L76)

<a id="function-function-mq3-client-cgame-drawtools-copycolor-function-copycolor-color-src-mq3-client-cgame-drawtools-ml-1669726899"></a>
### copyColor

```ml
function copyColor(color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L42)

<a id="function-function-mq3-client-cgame-drawtools-create-function-create-src-mq3-client-cgame-drawtools-ml-1293135386"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L39)

- [mq3.client.cgame_drawtools.DrawAction](Type-mq3-client-cgame-drawtools-drawaction-325066084.md) — struct
<a id="function-function-mq3-client-cgame-drawtools-drawbannerstring-function-drawbannerstring-state-x-y-text-style-color-retailactive-src-mq3-client-cgame-drawtools-ml-1666138498"></a>
### drawBannerString

```ml
function drawBannerString(state, x, y, text, style, color, retailActive)
```

UI_DrawBannerString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L144)

<a id="function-function-mq3-client-cgame-drawtools-drawbannerstring2-function-drawbannerstring2-state-x-y-text-color-retailactive-src-mq3-client-cgame-drawtools-ml-34709427"></a>
### drawBannerString2

```ml
function drawBannerString2(state, x, y, text, color, retailActive)
```

UI_DrawBannerString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L137)

<a id="function-function-mq3-client-cgame-drawtools-drawbigstring-function-drawbigstring-state-x-y-text-alpha-retailactive-src-mq3-client-cgame-drawtools-ml-627332342"></a>
### drawBigString

```ml
function drawBigString(state, x, y, text, alpha, retailActive)
```

CG_DrawBigString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L99)

<a id="function-function-mq3-client-cgame-drawtools-drawbigstringcolor-function-drawbigstringcolor-state-x-y-text-color-retailactive-src-mq3-client-cgame-drawtools-ml-602455381"></a>
### drawBigStringColor

```ml
function drawBigStringColor(state, x, y, text, color, retailActive)
```

CG_DrawBigStringColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L101)

<a id="function-function-mq3-client-cgame-drawtools-drawchar-function-drawchar-state-x-y-width-height-ch-retailactive-src-mq3-client-cgame-drawtools-ml-1309834095"></a>
### drawChar

```ml
function drawChar(state, x, y, width, height, ch, retailActive)
```

CG_DrawChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L72)

<a id="function-function-mq3-client-cgame-drawtools-drawpic-function-drawpic-state-x-y-width-height-shader-retailactive-src-mq3-client-cgame-drawtools-ml-817431145"></a>
### drawPic

```ml
function drawPic(state, x, y, width, height, shader, retailActive)
```

CG_DrawPic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L69)

<a id="function-function-mq3-client-cgame-drawtools-drawproportionalstring-function-drawproportionalstring-state-x-y-text-style-color-retailactive-src-mq3-client-cgame-drawtools-ml-189983750"></a>
### drawProportionalString

```ml
function drawProportionalString(state, x, y, text, style, color, retailActive)
```

UI_DrawProportionalString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L158)

<a id="function-function-mq3-client-cgame-drawtools-drawproportionalstring2-function-drawproportionalstring2-state-x-y-text-color-sizescale-charset-retailactive-src-mq3-client-cgame-drawtools-ml-139768112"></a>
### drawProportionalString2

```ml
function drawProportionalString2(state, x, y, text, color, sizeScale, charset, retailActive)
```

UI_DrawProportionalString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `sizeScale` | `dynamic` | — |  |
| `charset` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L150)

<a id="function-function-mq3-client-cgame-drawtools-drawrect-function-drawrect-state-x-y-width-height-size-color-retailactive-src-mq3-client-cgame-drawtools-ml-209674800"></a>
### drawRect

```ml
function drawRect(state, x, y, width, height, size, color, retailActive)
```

CG_DrawRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L67)

<a id="function-function-mq3-client-cgame-drawtools-drawsides-function-drawsides-state-x-y-width-height-size-retailactive-src-mq3-client-cgame-drawtools-ml-781270005"></a>
### drawSides

```ml
function drawSides(state, x, y, width, height, size, retailActive)
```

CG_DrawSides

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L59)

<a id="function-function-mq3-client-cgame-drawtools-drawsmallstring-function-drawsmallstring-state-x-y-text-alpha-retailactive-src-mq3-client-cgame-drawtools-ml-1734264192"></a>
### drawSmallString

```ml
function drawSmallString(state, x, y, text, alpha, retailActive)
```

CG_DrawSmallString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L103)

<a id="function-function-mq3-client-cgame-drawtools-drawsmallstringcolor-function-drawsmallstringcolor-state-x-y-text-color-retailactive-src-mq3-client-cgame-drawtools-ml-1370177693"></a>
### drawSmallStringColor

```ml
function drawSmallStringColor(state, x, y, text, color, retailActive)
```

CG_DrawSmallStringColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L105)

<a id="function-function-mq3-client-cgame-drawtools-drawstringext-function-drawstringext-state-x-y-text-setcolorvalue-forcecolor-shadow-charwidth-charheight-maxchars-retailactive-src-mq3-client-cgame-drawtools-ml-1190044036"></a>
### drawStringExt

```ml
function drawStringExt(state, x, y, text, setColorValue, forceColor, shadow, charWidth, charHeight, maxChars, retailActive)
```

CG_DrawStringExt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `setColorValue` | `dynamic` | — |  |
| `forceColor` | `dynamic` | — |  |
| `shadow` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |
| `charHeight` | `dynamic` | — |  |
| `maxChars` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L82)

<a id="function-function-mq3-client-cgame-drawtools-drawstrlen-function-drawstrlen-text-src-mq3-client-cgame-drawtools-ml-1721484479"></a>
### drawStrlen

```ml
function drawStrlen(text)
```

CG_DrawStrlen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L107)

<a id="function-function-mq3-client-cgame-drawtools-drawtopbottom-function-drawtopbottom-state-x-y-width-height-size-retailactive-src-mq3-client-cgame-drawtools-ml-568670501"></a>
### drawTopBottom

```ml
function drawTopBottom(state, x, y, width, height, size, retailActive)
```

CG_DrawTopBottom

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L63)

<a id="constant-constant-mq3-client-cgame-drawtools-fade-time-const-fade-time-200-src-mq3-client-cgame-drawtools-ml-1910280699"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L18)

<a id="function-function-mq3-client-cgame-drawtools-fadecolor-function-fadecolor-state-startmsec-totalmsec-src-mq3-client-cgame-drawtools-ml-634649605"></a>
### fadeColor

```ml
function fadeColor(state, startMsec, totalMsec)
```

CG_FadeColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `startMsec` | `dynamic` | — |  |
| `totalMsec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L118)

<a id="function-function-mq3-client-cgame-drawtools-fillrect-function-fillrect-state-x-y-width-height-color-retailactive-src-mq3-client-cgame-drawtools-ml-164111469"></a>
### fillRect

```ml
function fillRect(state, x, y, width, height, color, retailActive)
```

CG_FillRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L55)

<a id="function-function-mq3-client-cgame-drawtools-getcolorforhealth-function-getcolorforhealth-health-armor-src-mq3-client-cgame-drawtools-ml-1504742409"></a>
### getColorForHealth

```ml
function getColorForHealth(health, armor)
```

CG_GetColorForHealth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L124)

<a id="function-function-mq3-client-cgame-drawtools-iscolor-function-iscolor-data-index-src-mq3-client-cgame-drawtools-ml-1850510632"></a>
### isColor

```ml
function isColor(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L75)

<a id="constant-constant-mq3-client-cgame-drawtools-prop-gap-width-const-prop-gap-width-3-src-mq3-client-cgame-drawtools-ml-1760045056"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L20)

<a id="constant-constant-mq3-client-cgame-drawtools-prop-height-const-prop-height-27-src-mq3-client-cgame-drawtools-ml-514636430"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L22)

<a id="constant-constant-mq3-client-cgame-drawtools-prop-space-width-const-prop-space-width-8-src-mq3-client-cgame-drawtools-ml-631661845"></a>
### PROP_SPACE_WIDTH

```ml
const PROP_SPACE_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L21)

<a id="constant-constant-mq3-client-cgame-drawtools-propb-gap-width-const-propb-gap-width-4-src-mq3-client-cgame-drawtools-ml-1623984025"></a>
### PROPB_GAP_WIDTH

```ml
const PROPB_GAP_WIDTH = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L23)

<a id="constant-constant-mq3-client-cgame-drawtools-propb-height-const-propb-height-36-src-mq3-client-cgame-drawtools-ml-376757412"></a>
### PROPB_HEIGHT

```ml
const PROPB_HEIGHT = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L25)

<a id="constant-constant-mq3-client-cgame-drawtools-propb-space-width-const-propb-space-width-12-src-mq3-client-cgame-drawtools-ml-1143206730"></a>
### PROPB_SPACE_WIDTH

```ml
const PROPB_SPACE_WIDTH = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L24)

<a id="function-function-mq3-client-cgame-drawtools-propmap-function-propmap-src-mq3-client-cgame-drawtools-ml-839655592"></a>
### propMap

```ml
function propMap()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L130)

<a id="function-function-mq3-client-cgame-drawtools-propmapb-function-propmapb-src-mq3-client-cgame-drawtools-ml-498657362"></a>
### propMapB

```ml
function propMapB()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L134)

<a id="function-function-mq3-client-cgame-drawtools-proportionalsizescale-function-proportionalsizescale-style-src-mq3-client-cgame-drawtools-ml-658122317"></a>
### proportionalSizeScale

```ml
function proportionalSizeScale(style)
```

UI_ProportionalSizeScale

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L156)

<a id="function-function-mq3-client-cgame-drawtools-proportionalstringwidth-function-proportionalstringwidth-text-src-mq3-client-cgame-drawtools-ml-1717194727"></a>
### proportionalStringWidth

```ml
function proportionalStringWidth(text)
```

UI_ProportionalStringWidth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L148)

<a id="function-function-mq3-client-cgame-drawtools-publish-function-publish-state-value-retailactive-src-mq3-client-cgame-drawtools-ml-2022545141"></a>
### publish

```ml
function publish(state, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L44)

<a id="constant-constant-mq3-client-cgame-drawtools-pulse-divisor-const-pulse-divisor-75-src-mq3-client-cgame-drawtools-ml-1416910461"></a>
### PULSE_DIVISOR

```ml
const PULSE_DIVISOR = 75
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L26)

<a id="function-function-mq3-client-cgame-drawtools-setcolor-function-setcolor-state-color-retailactive-src-mq3-client-cgame-drawtools-ml-697143105"></a>
### setColor

```ml
function setColor(state, color, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L48)

<a id="constant-constant-mq3-client-cgame-drawtools-smallchar-height-const-smallchar-height-16-src-mq3-client-cgame-drawtools-ml-791703038"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L17)

<a id="constant-constant-mq3-client-cgame-drawtools-smallchar-width-const-smallchar-width-8-src-mq3-client-cgame-drawtools-ml-1473534361"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L16)

- [mq3.client.cgame_drawtools.State](Type-mq3-client-cgame-drawtools-state-1348031665.md) — struct
<a id="function-function-mq3-client-cgame-drawtools-stretchpic-function-stretchpic-state-x-y-width-height-s1-t1-s2-t2-shader-retailactive-src-mq3-client-cgame-drawtools-ml-809731093"></a>
### stretchPic

```ml
function stretchPic(state, x, y, width, height, s1, t1, s2, t2, shader, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L49)

<a id="constant-constant-mq3-client-cgame-drawtools-team-blue-const-team-blue-2-src-mq3-client-cgame-drawtools-ml-1226821023"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L12)

<a id="constant-constant-mq3-client-cgame-drawtools-team-red-const-team-red-1-src-mq3-client-cgame-drawtools-ml-306145178"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L11)

<a id="constant-constant-mq3-client-cgame-drawtools-team-spectator-const-team-spectator-3-src-mq3-client-cgame-drawtools-ml-1324310784"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L13)

<a id="function-function-mq3-client-cgame-drawtools-teamcolor-function-teamcolor-team-src-mq3-client-cgame-drawtools-ml-612869473"></a>
### teamColor

```ml
function teamColor(team)
```

CG_TeamColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L122)

<a id="function-function-mq3-client-cgame-drawtools-tileclear-function-tileclear-state-retailactive-src-mq3-client-cgame-drawtools-ml-968737396"></a>
### tileClear

```ml
function tileClear(state, retailActive)
```

CG_TileClear

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L112)

<a id="function-function-mq3-client-cgame-drawtools-tileclearbox-function-tileclearbox-state-x-y-width-height-shader-retailactive-src-mq3-client-cgame-drawtools-ml-1164393137"></a>
### tileClearBox

```ml
function tileClearBox(state, x, y, width, height, shader, retailActive)
```

CG_TileClearBox

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L110)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-center-const-ui-center-1-src-mq3-client-cgame-drawtools-ml-1034287850"></a>
### UI_CENTER

```ml
const UI_CENTER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L28)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-dropshadow-const-ui-dropshadow-2048-src-mq3-client-cgame-drawtools-ml-1145801091"></a>
### UI_DROPSHADOW

```ml
const UI_DROPSHADOW = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L32)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-formatmask-const-ui-formatmask-7-src-mq3-client-cgame-drawtools-ml-1775778156"></a>
### UI_FORMATMASK

```ml
const UI_FORMATMASK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L30)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-inverse-const-ui-inverse-8192-src-mq3-client-cgame-drawtools-ml-2128088425"></a>
### UI_INVERSE

```ml
const UI_INVERSE = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L33)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-left-const-ui-left-0-src-mq3-client-cgame-drawtools-ml-1479203569"></a>
### UI_LEFT

```ml
const UI_LEFT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L27)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-pulse-const-ui-pulse-16384-src-mq3-client-cgame-drawtools-ml-2053768863"></a>
### UI_PULSE

```ml
const UI_PULSE = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L34)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-right-const-ui-right-2-src-mq3-client-cgame-drawtools-ml-1353759955"></a>
### UI_RIGHT

```ml
const UI_RIGHT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L29)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-smallfont-const-ui-smallfont-16-src-mq3-client-cgame-drawtools-ml-229143798"></a>
### UI_SMALLFONT

```ml
const UI_SMALLFONT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L31)
