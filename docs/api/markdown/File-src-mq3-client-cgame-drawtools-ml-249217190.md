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

Creates a `mq3.client.cgame_drawtools.DrawAction` record. Assigns `kind` from `kind`, `x` from `x`, `y` from `y`, `width` from `width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `DrawAction.kind`. |
| `x` | `dynamic` | — | Value used to initialize `DrawAction.x`. |
| `y` | `dynamic` | — | Value used to initialize `DrawAction.y`. |
| `width` | `dynamic` | — | Value used to initialize `DrawAction.width`. |
| `height` | `dynamic` | — | Value used to initialize `DrawAction.height`. |
| `s1` | `dynamic` | — | Value used to initialize `DrawAction.s1`. |
| `t1` | `dynamic` | — | Value used to initialize `DrawAction.t1`. |
| `s2` | `dynamic` | — | Value used to initialize `DrawAction.s2`. |
| `t2` | `dynamic` | — | Value used to initialize `DrawAction.t2`. |
| `shader` | `dynamic` | — | Value used to initialize `DrawAction.shader`. |
| `color` | `dynamic` | — | Value used to initialize `DrawAction.color`. |
| `dispatched` | `dynamic` | — | Value used to initialize `DrawAction.dispatched`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L168)

<a id="function-function-mq3-client-cgame-drawtools-adjustfrom640-function-adjustfrom640-state-x-y-width-height-src-mq3-client-cgame-drawtools-ml-1157175411"></a>
### adjustFrom640

```ml
function adjustFrom640(state, x, y, width, height)
```

CG_AdjustFrom640

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.screenXScale`, `state.screenYScale`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `adjustFrom640`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `adjustFrom640`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `adjustFrom640`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `adjustFrom640`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L204)

<a id="constant-constant-mq3-client-cgame-drawtools-armor-protection-const-armor-protection-0-66-src-mq3-client-cgame-drawtools-ml-865087687"></a>
### ARMOR_PROTECTION

```ml
const ARMOR_PROTECTION = 0.66
```

Fraction of incoming damage absorbed by armor before reducing health.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L28)

<a id="function-function-mq3-client-cgame-drawtools-bannerwidth-function-bannerwidth-text-src-mq3-client-cgame-drawtools-ml-1581049959"></a>
### bannerWidth

```ml
function bannerWidth(text)
```

Calls `mq3.client.cgame_drawtools.propMapB` from client game drawtools `bannerWidth`. The final path returns `width-PROPB_GAP_WIDTH`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `bannerWidth` in the client game drawtools path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L406)

<a id="constant-constant-mq3-client-cgame-drawtools-bigchar-height-const-bigchar-height-16-src-mq3-client-cgame-drawtools-ml-1282769148"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```

Bigchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L20)

<a id="constant-constant-mq3-client-cgame-drawtools-bigchar-width-const-bigchar-width-16-src-mq3-client-cgame-drawtools-ml-1437042070"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```

Bigchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L18)

<a id="function-function-mq3-client-cgame-drawtools-clear-function-clear-state-src-mq3-client-cgame-drawtools-ml-1560424467"></a>
### clear

```ml
function clear(state)
```

Updates `state.actions` during client game drawtools `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game drawtools record/storage; this routine assigns `state.actions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L178)

<a id="function-function-mq3-client-cgame-drawtools-colorforhealth-function-colorforhealth-state-src-mq3-client-cgame-drawtools-ml-368336973"></a>
### colorForHealth

```ml
function colorForHealth(state)
```

CG_ColorForHealth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.health`, `state.armor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L382)

<a id="function-function-mq3-client-cgame-drawtools-colorindex-function-colorindex-code-src-mq3-client-cgame-drawtools-ml-647676697"></a>
### colorIndex

```ml
function colorIndex(code)
```

Computes `(code-48)&7` for client game drawtools `colorIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Value used by `return (code-48)&7`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L281)

<a id="function-function-mq3-client-cgame-drawtools-colortable-function-colortable-index-src-mq3-client-cgame-drawtools-ml-827431890"></a>
### colorTable

```ml
function colorTable(index)
```

Calls `mq3.client.cgame_drawtools.copyColor` from client game drawtools `colorTable`. The final path returns `copyColor(table[index&7])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value used by `return copyColor(table[index&7])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L276)

<a id="function-function-mq3-client-cgame-drawtools-copycolor-function-copycolor-color-src-mq3-client-cgame-drawtools-ml-1669726899"></a>
### copyColor

```ml
function copyColor(color)
```

Evaluates client game drawtools `copyColor` and returns `void`, `[color[0],color[1],color[2],color[3]]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — | Sequence read at `color[0]`, `color[1]`, `color[2]`, `color[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L154)

<a id="function-function-mq3-client-cgame-drawtools-create-function-create-src-mq3-client-cgame-drawtools-ml-1293135386"></a>
### create

```ml
function create()
```

Creates a `mq3.client.cgame_drawtools.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L149)

- [mq3.client.cgame_drawtools.DrawAction](Type-mq3-client-cgame-drawtools-drawaction-325066084.md) — struct
<a id="function-function-mq3-client-cgame-drawtools-drawbannerstring-function-drawbannerstring-state-x-y-text-style-color-retailactive-src-mq3-client-cgame-drawtools-ml-1666138498"></a>
### drawBannerString

```ml
function drawBannerString(state, x, y, text, style, color, retailActive)
```

UI_DrawBannerString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game drawtools state passed to the helper calls in `drawBannerString`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawBannerString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawBannerString`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawBannerString` in the client game drawtools path. |
| `style` | `dynamic` | — | Value used by `format=style&UI_FORMATMASK`. |
| `color` | `dynamic` | — | Sequence read at `color[3]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L415)

<a id="function-function-mq3-client-cgame-drawtools-drawbannerstring2-function-drawbannerstring2-state-x-y-text-color-retailactive-src-mq3-client-cgame-drawtools-ml-34709427"></a>
### drawBannerString2

```ml
function drawBannerString2(state, x, y, text, color, retailActive)
```

UI_DrawBannerString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.screenXScale`, `state.screenXBias`, `state.charsetPropB`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawBannerString2`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawBannerString2`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawBannerString2` in the client game drawtools path. |
| `color` | `dynamic` | — | Color value used by the client game drawtools drawing or interpolation operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L399)

<a id="function-function-mq3-client-cgame-drawtools-drawbigstring-function-drawbigstring-state-x-y-text-alpha-retailactive-src-mq3-client-cgame-drawtools-ml-627332342"></a>
### drawBigString

```ml
function drawBigString(state, x, y, text, alpha, retailActive)
```

CG_DrawBigString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `text` | `dynamic` | — | Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L318)

<a id="function-function-mq3-client-cgame-drawtools-drawbigstringcolor-function-drawbigstringcolor-state-x-y-text-color-retailactive-src-mq3-client-cgame-drawtools-ml-602455381"></a>
### drawBigStringColor

```ml
function drawBigStringColor(state, x, y, text, color, retailActive)
```

CG_DrawBigStringColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `text` | `dynamic` | — | Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L326)

<a id="function-function-mq3-client-cgame-drawtools-drawchar-function-drawchar-state-x-y-width-height-ch-retailactive-src-mq3-client-cgame-drawtools-ml-1309834095"></a>
### drawChar

```ml
function drawChar(state, x, y, width, height, ch, retailActive)
```

CG_DrawChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.charsetShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawChar`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawChar`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawChar`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawChar`. |
| `ch` | `dynamic` | — | Value used by `value=ch&255`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L267)

<a id="function-function-mq3-client-cgame-drawtools-drawpic-function-drawpic-state-x-y-width-height-shader-retailactive-src-mq3-client-cgame-drawtools-ml-817431145"></a>
### drawPic

```ml
function drawPic(state, x, y, width, height, shader, retailActive)
```

CG_DrawPic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game drawtools state passed to the helper calls in `drawPic`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawPic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawPic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawPic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawPic`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L257)

<a id="function-function-mq3-client-cgame-drawtools-drawproportionalstring-function-drawproportionalstring-state-x-y-text-style-color-retailactive-src-mq3-client-cgame-drawtools-ml-189983750"></a>
### drawProportionalString

```ml
function drawProportionalString(state, x, y, text, style, color, retailActive)
```

UI_DrawProportionalString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.charsetProp`, `state.time`, `state.charsetPropGlow`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawProportionalString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawProportionalString`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawProportionalString` in the client game drawtools path. |
| `style` | `dynamic` | — | Value used by `scale=proportionalSizeScale(style)`. |
| `color` | `dynamic` | — | Sequence read at `color[3]`, `color[0]`, `color[1]`, `color[2]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L446)

<a id="function-function-mq3-client-cgame-drawtools-drawproportionalstring2-function-drawproportionalstring2-state-x-y-text-color-sizescale-charset-retailactive-src-mq3-client-cgame-drawtools-ml-139768112"></a>
### drawProportionalString2

```ml
function drawProportionalString2(state, x, y, text, color, sizeScale, charset, retailActive)
```

UI_DrawProportionalString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.screenXScale`, `state.screenXBias`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawProportionalString2`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawProportionalString2`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawProportionalString2` in the client game drawtools path. |
| `color` | `dynamic` | — | Color value used by the client game drawtools drawing or interpolation operation. |
| `sizeScale` | `dynamic` | — | Value used by `if ch==32 then aw=n.fmul(PROP_SPACE_WIDTH*1.0,n.fmul(state.screenXScale,sizeScale)) else if glyph[2]!=-1 then aw=n.fmul(glyph[2]*1.0,n.fmul(st...`. |
| `charset` | `dynamic` | — | Value used by `stretchPic(state,ax,ay,aw,ah,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256.0,(glyph[1]+PROP_HEIGHT)/256.0,charset,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L430)

<a id="function-function-mq3-client-cgame-drawtools-drawrect-function-drawrect-state-x-y-width-height-size-color-retailactive-src-mq3-client-cgame-drawtools-ml-209674800"></a>
### drawRect

```ml
function drawRect(state, x, y, width, height, size, color, retailActive)
```

CG_DrawRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game drawtools state passed to the helper calls in `drawRect`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawRect`. |
| `size` | `dynamic` | — | Value used by `drawTopBottom(state,x,y,width,height,size,retailActive)`. |
| `color` | `dynamic` | — | Color value used by the client game drawtools drawing or interpolation operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L248)

<a id="function-function-mq3-client-cgame-drawtools-drawsides-function-drawsides-state-x-y-width-height-size-retailactive-src-mq3-client-cgame-drawtools-ml-781270005"></a>
### drawSides

```ml
function drawSides(state, x, y, width, height, size, retailActive)
```

CG_DrawSides

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.screenXScale`, `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawSides`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawSides`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawSides`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawSides`. |
| `size` | `dynamic` | — | Value used by `scaled=n.fmul(size,state.screenXScale)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L225)

<a id="function-function-mq3-client-cgame-drawtools-drawsmallstring-function-drawsmallstring-state-x-y-text-alpha-retailactive-src-mq3-client-cgame-drawtools-ml-1734264192"></a>
### drawSmallString

```ml
function drawSmallString(state, x, y, text, alpha, retailActive)
```

CG_DrawSmallString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `text` | `dynamic` | — | Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L334)

<a id="function-function-mq3-client-cgame-drawtools-drawsmallstringcolor-function-drawsmallstringcolor-state-x-y-text-color-retailactive-src-mq3-client-cgame-drawtools-ml-1370177693"></a>
### drawSmallStringColor

```ml
function drawSmallStringColor(state, x, y, text, color, retailActive)
```

CG_DrawSmallStringColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `text` | `dynamic` | — | Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_drawtools.drawStringExt`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L342)

<a id="function-function-mq3-client-cgame-drawtools-drawstringext-function-drawstringext-state-x-y-text-setcolorvalue-forcecolor-shadow-charwidth-charheight-maxchars-retailactive-src-mq3-client-cgame-drawtools-ml-1190044036"></a>
### drawStringExt

```ml
function drawStringExt(state, x, y, text, setColorValue, forceColor, shadow, charWidth, charHeight, maxChars, retailActive)
```

CG_DrawStringExt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game drawtools state passed to the helper calls in `drawStringExt`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawStringExt`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawStringExt`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawStringExt` in the client game drawtools path. |
| `setColorValue` | `dynamic` | — | Sequence read at `setColorValue[3]`. |
| `forceColor` | `dynamic` | — | Value used by `if not forceColor then color=colorTable(colorIndex(data[index+1]))`. |
| `shadow` | `dynamic` | — | Value used by `if shadow then`. |
| `charWidth` | `dynamic` | — | Value used by `if isColor(data,index) then index=index+2 else drawChar(state,xx+2,y+2,charWidth,charHeight,data[index],retailActive)`. |
| `charHeight` | `dynamic` | — | Value used by `if isColor(data,index) then index=index+2 else drawChar(state,xx+2,y+2,charWidth,charHeight,data[index],retailActive)`. |
| `maxChars` | `dynamic` | — | Value used by `limit=maxChars`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L295)

<a id="function-function-mq3-client-cgame-drawtools-drawstrlen-function-drawstrlen-text-src-mq3-client-cgame-drawtools-ml-1721484479"></a>
### drawStrlen

```ml
function drawStrlen(text)
```

CG_DrawStrlen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `drawStrlen` in the client game drawtools path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L345)

<a id="function-function-mq3-client-cgame-drawtools-drawtopbottom-function-drawtopbottom-state-x-y-width-height-size-retailactive-src-mq3-client-cgame-drawtools-ml-568670501"></a>
### drawTopBottom

```ml
function drawTopBottom(state, x, y, width, height, size, retailActive)
```

CG_DrawTopBottom

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.screenYScale`, `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawTopBottom`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawTopBottom`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawTopBottom`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawTopBottom`. |
| `size` | `dynamic` | — | Value used by `scaled=n.fmul(size,state.screenYScale)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L236)

<a id="constant-constant-mq3-client-cgame-drawtools-fade-time-const-fade-time-200-src-mq3-client-cgame-drawtools-ml-1910280699"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```

Duration in milliseconds of the standard CGame presentation fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L26)

<a id="function-function-mq3-client-cgame-drawtools-fadecolor-function-fadecolor-state-startmsec-totalmsec-src-mq3-client-cgame-drawtools-ml-634649605"></a>
### fadeColor

```ml
function fadeColor(state, startMsec, totalMsec)
```

CG_FadeColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `startMsec` | `dynamic` | — | Value used by `if startMsec==0 then return void end if`. |
| `totalMsec` | `dynamic` | — | Value used by `if t>=totalMsec then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L368)

<a id="function-function-mq3-client-cgame-drawtools-fillrect-function-fillrect-state-x-y-width-height-color-retailactive-src-mq3-client-cgame-drawtools-ml-164111469"></a>
### fillRect

```ml
function fillRect(state, x, y, width, height, color, retailActive)
```

CG_FillRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `fillRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `fillRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `fillRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `fillRect`. |
| `color` | `dynamic` | — | Color value used by the client game drawtools drawing or interpolation operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L214)

<a id="function-function-mq3-client-cgame-drawtools-getcolorforhealth-function-getcolorforhealth-health-armor-src-mq3-client-cgame-drawtools-ml-1504742409"></a>
### getColorForHealth

```ml
function getColorForHealth(health, armor)
```

CG_GetColorForHealth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — | Value used by `if health<=0 then return [0.0,0.0,0.0,1.0] end if`. |
| `armor` | `dynamic` | — | Value used by `count=armor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L377)

<a id="function-function-mq3-client-cgame-drawtools-iscolor-function-iscolor-data-index-src-mq3-client-cgame-drawtools-ml-1850510632"></a>
### isColor

```ml
function isColor(data, index)
```

Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for client game drawtools `isColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[index]`, `data[index+1]`. |
| `index` | `dynamic` | — | Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L273)

<a id="constant-constant-mq3-client-cgame-drawtools-prop-gap-width-const-prop-gap-width-3-src-mq3-client-cgame-drawtools-ml-1760045056"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3
```

Prop font metric controlling gap width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L30)

<a id="constant-constant-mq3-client-cgame-drawtools-prop-height-const-prop-height-27-src-mq3-client-cgame-drawtools-ml-514636430"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```

Prop font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L34)

<a id="constant-constant-mq3-client-cgame-drawtools-prop-space-width-const-prop-space-width-8-src-mq3-client-cgame-drawtools-ml-631661845"></a>
### PROP_SPACE_WIDTH

```ml
const PROP_SPACE_WIDTH = 8
```

Prop font metric controlling space width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L32)

<a id="constant-constant-mq3-client-cgame-drawtools-propb-gap-width-const-propb-gap-width-4-src-mq3-client-cgame-drawtools-ml-1623984025"></a>
### PROPB_GAP_WIDTH

```ml
const PROPB_GAP_WIDTH = 4
```

Propb font metric controlling gap width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L36)

<a id="constant-constant-mq3-client-cgame-drawtools-propb-height-const-propb-height-36-src-mq3-client-cgame-drawtools-ml-376757412"></a>
### PROPB_HEIGHT

```ml
const PROPB_HEIGHT = 36
```

Propb font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L40)

<a id="constant-constant-mq3-client-cgame-drawtools-propb-space-width-const-propb-space-width-12-src-mq3-client-cgame-drawtools-ml-1143206730"></a>
### PROPB_SPACE_WIDTH

```ml
const PROPB_SPACE_WIDTH = 12
```

Propb font metric controlling space width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L38)

<a id="function-function-mq3-client-cgame-drawtools-propmap-function-propmap-src-mq3-client-cgame-drawtools-ml-839655592"></a>
### propMap

```ml
function propMap()
```

Evaluates client game drawtools `propMap` and returns `invalid+visible` according to its guard/selection conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L385)

<a id="function-function-mq3-client-cgame-drawtools-propmapb-function-propmapb-src-mq3-client-cgame-drawtools-ml-498657362"></a>
### propMapB

```ml
function propMapB()
```

Builds the client game drawtools `propMapB` sequence from `[[11,12,33],[49,12,31],[85,12,31],[120,12,30],[156,12,21],[183,12,21],[207,12,32],[13,55,30],[49,55,13],[66,55,29],[101,55,31],[135,55,21],[158,55,40],[204,55,32],[12,97,31],[48,97,31],[82,97,30],[...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L390)

<a id="function-function-mq3-client-cgame-drawtools-proportionalsizescale-function-proportionalsizescale-style-src-mq3-client-cgame-drawtools-ml-658122317"></a>
### proportionalSizeScale

```ml
function proportionalSizeScale(style)
```

UI_ProportionalSizeScale

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if (style&UI_SMALLFONT)!=0 then return 0.75 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L437)

<a id="function-function-mq3-client-cgame-drawtools-proportionalstringwidth-function-proportionalstringwidth-text-src-mq3-client-cgame-drawtools-ml-1717194727"></a>
### proportionalStringWidth

```ml
function proportionalStringWidth(text)
```

UI_ProportionalStringWidth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `proportionalStringWidth` in the client game drawtools path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L420)

<a id="function-function-mq3-client-cgame-drawtools-publish-function-publish-state-value-retailactive-src-mq3-client-cgame-drawtools-ml-2022545141"></a>
### publish

```ml
function publish(state, value, retailActive)
```

Updates `value.dispatched`, `state.actions`, `state.emitted`, `state.suppressed` during client game drawtools `publish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game drawtools record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`. |
| `value` | `dynamic` | — | Mutable client game drawtools record/storage; this routine assigns `value.dispatched`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L173)

<a id="constant-constant-mq3-client-cgame-drawtools-pulse-divisor-const-pulse-divisor-75-src-mq3-client-cgame-drawtools-ml-1416910461"></a>
### PULSE_DIVISOR

```ml
const PULSE_DIVISOR = 75
```

Time-scaling divisor used to compute the proportional-text pulse animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L42)

<a id="function-function-mq3-client-cgame-drawtools-setcolor-function-setcolor-state-color-retailactive-src-mq3-client-cgame-drawtools-ml-697143105"></a>
### setColor

```ml
function setColor(state, color, retailActive)
```

Adapts `mq3.client.cgame_drawtools.publish` to client game drawtools `setColor`, returning its result for `state, action("set-color",0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,"",color,false), retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.publish`. |
| `color` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("set-color",0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,"",color,false)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.publish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L183)

<a id="constant-constant-mq3-client-cgame-drawtools-smallchar-height-const-smallchar-height-16-src-mq3-client-cgame-drawtools-ml-791703038"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```

Smallchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L24)

<a id="constant-constant-mq3-client-cgame-drawtools-smallchar-width-const-smallchar-width-8-src-mq3-client-cgame-drawtools-ml-1473534361"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```

Smallchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L22)

- [mq3.client.cgame_drawtools.State](Type-mq3-client-cgame-drawtools-state-1348031665.md) — struct
<a id="function-function-mq3-client-cgame-drawtools-stretchpic-function-stretchpic-state-x-y-width-height-s1-t1-s2-t2-shader-retailactive-src-mq3-client-cgame-drawtools-ml-809731093"></a>
### stretchPic

```ml
function stretchPic(state, x, y, width, height, s1, t1, s2, t2, shader, retailActive)
```

Adapts `mq3.client.cgame_drawtools.publish` to client game drawtools `stretchPic`, returning its result for `state, action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false), retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.publish`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `width` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `height` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `s1` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `t1` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `s2` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `t2` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.publish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L196)

<a id="constant-constant-mq3-client-cgame-drawtools-team-blue-const-team-blue-2-src-mq3-client-cgame-drawtools-ml-1226821023"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L14)

<a id="constant-constant-mq3-client-cgame-drawtools-team-red-const-team-red-1-src-mq3-client-cgame-drawtools-ml-306145178"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L12)

<a id="constant-constant-mq3-client-cgame-drawtools-team-spectator-const-team-spectator-3-src-mq3-client-cgame-drawtools-ml-1324310784"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L16)

<a id="function-function-mq3-client-cgame-drawtools-teamcolor-function-teamcolor-team-src-mq3-client-cgame-drawtools-ml-612869473"></a>
### teamColor

```ml
function teamColor(team)
```

CG_TeamColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Value used by `if team==TEAM_RED then return [1.0,0.2,0.2,1.0] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L373)

<a id="function-function-mq3-client-cgame-drawtools-tileclear-function-tileclear-state-retailactive-src-mq3-client-cgame-drawtools-ml-968737396"></a>
### tileClear

```ml
function tileClear(state, retailActive)
```

CG_TileClear

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vidWidth`, `state.vidHeight`, `state.refX`, `state.refY` and additional values. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L359)

<a id="function-function-mq3-client-cgame-drawtools-tileclearbox-function-tileclearbox-state-x-y-width-height-shader-retailactive-src-mq3-client-cgame-drawtools-ml-1164393137"></a>
### tileClearBox

```ml
function tileClearBox(state, x, y, width, height, shader, retailActive)
```

CG_TileClearBox

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.stretchPic`. |
| `x` | `dynamic` | — | Argument 2, 6, 8 of `mq3.client.cgame_drawtools.stretchPic`; passed as `x*1.0`, `x/64.0`, `(x+width)/64.0`. |
| `y` | `dynamic` | — | Argument 3, 7, 9 of `mq3.client.cgame_drawtools.stretchPic`; passed as `y*1.0`, `y/64.0`, `(y+height)/64.0`. |
| `width` | `dynamic` | — | Argument 4, 8 of `mq3.client.cgame_drawtools.stretchPic`; passed as `width*1.0`, `(x+width)/64.0`. |
| `height` | `dynamic` | — | Argument 5, 9 of `mq3.client.cgame_drawtools.stretchPic`; passed as `height*1.0`, `(y+height)/64.0`. |
| `shader` | `dynamic` | — | Argument 10 of `mq3.client.cgame_drawtools.stretchPic`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.stretchPic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L355)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-center-const-ui-center-1-src-mq3-client-cgame-drawtools-ml-1034287850"></a>
### UI_CENTER

```ml
const UI_CENTER = 1
```

UI text-style flag selecting horizontally centered text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L46)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-dropshadow-const-ui-dropshadow-2048-src-mq3-client-cgame-drawtools-ml-1145801091"></a>
### UI_DROPSHADOW

```ml
const UI_DROPSHADOW = 2048
```

UI text-style flag selecting a shadow behind the text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L54)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-formatmask-const-ui-formatmask-7-src-mq3-client-cgame-drawtools-ml-1775778156"></a>
### UI_FORMATMASK

```ml
const UI_FORMATMASK = 7
```

UI text-style flag selecting the horizontal-alignment bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L50)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-inverse-const-ui-inverse-8192-src-mq3-client-cgame-drawtools-ml-2128088425"></a>
### UI_INVERSE

```ml
const UI_INVERSE = 8192
```

UI text-style flag selecting the subdued inverse text style.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L56)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-left-const-ui-left-0-src-mq3-client-cgame-drawtools-ml-1479203569"></a>
### UI_LEFT

```ml
const UI_LEFT = 0
```

UI text-style flag selecting left-aligned text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L44)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-pulse-const-ui-pulse-16384-src-mq3-client-cgame-drawtools-ml-2053768863"></a>
### UI_PULSE

```ml
const UI_PULSE = 16384
```

UI text-style flag selecting a pulsing text color or brightness.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L58)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-right-const-ui-right-2-src-mq3-client-cgame-drawtools-ml-1353759955"></a>
### UI_RIGHT

```ml
const UI_RIGHT = 2
```

UI text-style flag selecting right-aligned text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L48)

<a id="constant-constant-mq3-client-cgame-drawtools-ui-smallfont-const-ui-smallfont-16-src-mq3-client-cgame-drawtools-ml-229143798"></a>
### UI_SMALLFONT

```ml
const UI_SMALLFONT = 16
```

UI text-style flag selecting the small fixed-width font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_drawtools.ml#L52)
