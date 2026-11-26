# `mq3.client.cgame_drawtools.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-drawtools-ml-249217190.md)

<a id="struct-struct-mq3-client-cgame-drawtools-state-struct-state-src-mq3-client-cgame-drawtools-ml-1769520787"></a>
## State

```ml
struct State
```

Stores client game drawtools state, including `screenXScale`, `screenYScale`, `screenXBias`, `vidWidth`, `vidHeight`, `refX` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L91)

## Members

<a id="field-field-mq3-client-cgame-drawtools-state-actions-actions-src-mq3-client-cgame-drawtools-ml-1432977076"></a>
### actions

```ml
actions
```

Host requests queued while drawing scaled text, pictures, and rectangles for CGame, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L139)

<a id="field-field-mq3-client-cgame-drawtools-state-armor-armor-src-mq3-client-cgame-drawtools-ml-172977844"></a>
### armor

```ml
armor
```

Armor contribution used with health to calculate the HUD health color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L121)

<a id="field-field-mq3-client-cgame-drawtools-state-backtileshader-backtileshader-src-mq3-client-cgame-drawtools-ml-666991960"></a>
### backTileShader

```ml
backTileShader
```

Shader resource selected for back tile rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L127)

<a id="field-field-mq3-client-cgame-drawtools-state-charsetprop-charsetprop-src-mq3-client-cgame-drawtools-ml-576300348"></a>
### charsetProp

```ml
charsetProp
```

When constructing this record, `create` supplies `"charsetProp"` for this member. Used by `drawProportionalString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L130)

<a id="field-field-mq3-client-cgame-drawtools-state-charsetpropb-charsetpropb-src-mq3-client-cgame-drawtools-ml-374708942"></a>
### charsetPropB

```ml
charsetPropB
```

When constructing this record, `create` supplies `"charsetPropB"` for this member. Used by `drawBannerString2` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L136)

<a id="field-field-mq3-client-cgame-drawtools-state-charsetpropglow-charsetpropglow-src-mq3-client-cgame-drawtools-ml-115881400"></a>
### charsetPropGlow

```ml
charsetPropGlow
```

When constructing this record, `create` supplies `"charsetPropGlow"` for this member. Used by `drawProportionalString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L133)

<a id="field-field-mq3-client-cgame-drawtools-state-charsetshader-charsetshader-src-mq3-client-cgame-drawtools-ml-1429834124"></a>
### charsetShader

```ml
charsetShader
```

Shader resource selected for charset rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L125)

<a id="field-field-mq3-client-cgame-drawtools-state-emitted-emitted-src-mq3-client-cgame-drawtools-ml-471202704"></a>
### emitted

```ml
emitted
```

When constructing this record, `create` supplies `0` for this member. Used by `publish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L142)

<a id="field-field-mq3-client-cgame-drawtools-state-health-health-src-mq3-client-cgame-drawtools-ml-305330956"></a>
### health

```ml
health
```

Local-player health combined with armor when choosing the HUD health color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L119)

<a id="field-field-mq3-client-cgame-drawtools-state-refheight-refheight-src-mq3-client-cgame-drawtools-ml-554936536"></a>
### refHeight

```ml
refHeight
```

When constructing this record, `create` supplies `480` for this member. Used by `tileClear` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L115)

<a id="field-field-mq3-client-cgame-drawtools-state-refwidth-refwidth-src-mq3-client-cgame-drawtools-ml-1951742282"></a>
### refWidth

```ml
refWidth
```

When constructing this record, `create` supplies `640` for this member. Used by `tileClear` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L112)

<a id="field-field-mq3-client-cgame-drawtools-state-refx-refx-src-mq3-client-cgame-drawtools-ml-1440396858"></a>
### refX

```ml
refX
```

When constructing this record, `create` supplies `0` for this member. Used by `tileClear` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L106)

<a id="field-field-mq3-client-cgame-drawtools-state-refy-refy-src-mq3-client-cgame-drawtools-ml-1621701016"></a>
### refY

```ml
refY
```

When constructing this record, `create` supplies `0` for this member. Used by `tileClear` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L109)

<a id="field-field-mq3-client-cgame-drawtools-state-screenxbias-screenxbias-src-mq3-client-cgame-drawtools-ml-951510228"></a>
### screenXBias

```ml
screenXBias
```

Horizontal centering offset used when the actual display is wider than the virtual UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L97)

<a id="field-field-mq3-client-cgame-drawtools-state-screenxscale-screenxscale-src-mq3-client-cgame-drawtools-ml-590424316"></a>
### screenXScale

```ml
screenXScale
```

Horizontal virtual-screen scaling factor derived from the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L93)

<a id="field-field-mq3-client-cgame-drawtools-state-screenyscale-screenyscale-src-mq3-client-cgame-drawtools-ml-1385656710"></a>
### screenYScale

```ml
screenYScale
```

Vertical virtual-screen scaling factor derived from the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L95)

<a id="field-field-mq3-client-cgame-drawtools-state-suppressed-suppressed-src-mq3-client-cgame-drawtools-ml-217800700"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while drawing scaled text, pictures, and rectangles for CGame because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L145)

<a id="field-field-mq3-client-cgame-drawtools-state-time-time-src-mq3-client-cgame-drawtools-ml-1859605258"></a>
### time

```ml
time
```

Client-game time in milliseconds used by drawing helpers for text blinking and color fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L117)

<a id="field-field-mq3-client-cgame-drawtools-state-vidheight-vidheight-src-mq3-client-cgame-drawtools-ml-1186877480"></a>
### vidHeight

```ml
vidHeight
```

When constructing this record, `create` supplies `480` for this member. Used by `tileClear` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L103)

<a id="field-field-mq3-client-cgame-drawtools-state-vidwidth-vidwidth-src-mq3-client-cgame-drawtools-ml-1627563838"></a>
### vidWidth

```ml
vidWidth
```

When constructing this record, `create` supplies `640` for this member. Used by `tileClear` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L100)

<a id="field-field-mq3-client-cgame-drawtools-state-whiteshader-whiteshader-src-mq3-client-cgame-drawtools-ml-474201524"></a>
### whiteShader

```ml
whiteShader
```

Shader resource selected for white rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L123)
