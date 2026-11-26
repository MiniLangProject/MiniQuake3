# `mq3.client.cgame_main.HudAssets`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-hudassets-struct-hudassets-src-mq3-client-cgame-main-ml-462334615"></a>
## HudAssets

```ml
struct HudAssets
```

Stores client game main hud assets record, including `textFont`, `smallFont`, `bigFont`, `gradientBar`, `cursor`, `fadeClamp` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L178)

## Members

<a id="field-field-mq3-client-cgame-main-hudassets-bigfont-bigfont-src-mq3-client-cgame-main-ml-57326949"></a>
### bigFont

```ml
bigFont
```

When constructing this record, `hudAssets` supplies an empty string for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L187)

<a id="field-field-mq3-client-cgame-main-hudassets-cursor-cursor-src-mq3-client-cgame-main-ml-1246771633"></a>
### cursor

```ml
cursor
```

When constructing this record, `hudAssets` supplies an empty string for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L193)

<a id="field-field-mq3-client-cgame-main-hudassets-fadeamount-fadeamount-src-mq3-client-cgame-main-ml-625653953"></a>
### fadeAmount

```ml
fadeAmount
```

Alpha increment applied by each menu fade update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L199)

<a id="field-field-mq3-client-cgame-main-hudassets-fadeclamp-fadeclamp-src-mq3-client-cgame-main-ml-819557433"></a>
### fadeClamp

```ml
fadeClamp
```

Target alpha limit used by the menu's fade animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L195)

<a id="field-field-mq3-client-cgame-main-hudassets-fadecycle-fadecycle-src-mq3-client-cgame-main-ml-622672989"></a>
### fadeCycle

```ml
fadeCycle
```

Interval controlling how often the menu fade alpha is advanced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L197)

<a id="field-field-mq3-client-cgame-main-hudassets-gradientbar-gradientbar-src-mq3-client-cgame-main-ml-126895617"></a>
### gradientBar

```ml
gradientBar
```

When constructing this record, `hudAssets` supplies an empty string for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L190)

<a id="field-field-mq3-client-cgame-main-hudassets-shadowcolor-shadowcolor-src-mq3-client-cgame-main-ml-2063879145"></a>
### shadowColor

```ml
shadowColor
```

When constructing this record, `hudAssets` supplies an empty list for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L208)

<a id="field-field-mq3-client-cgame-main-hudassets-shadowfadeclamp-shadowfadeclamp-src-mq3-client-cgame-main-ml-1171509681"></a>
### shadowFadeClamp

```ml
shadowFadeClamp
```

When constructing this record, `hudAssets` supplies `0.0` for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L211)

<a id="field-field-mq3-client-cgame-main-hudassets-shadowx-shadowx-src-mq3-client-cgame-main-ml-1069806589"></a>
### shadowX

```ml
shadowX
```

When constructing this record, `hudAssets` supplies `0.0` for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L202)

<a id="field-field-mq3-client-cgame-main-hudassets-shadowy-shadowy-src-mq3-client-cgame-main-ml-1912595921"></a>
### shadowY

```ml
shadowY
```

When constructing this record, `hudAssets` supplies `0.0` for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L205)

<a id="field-field-mq3-client-cgame-main-hudassets-smallfont-smallfont-src-mq3-client-cgame-main-ml-2076342577"></a>
### smallFont

```ml
smallFont
```

When constructing this record, `hudAssets` supplies an empty string for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L184)

<a id="field-field-mq3-client-cgame-main-hudassets-textfont-textfont-src-mq3-client-cgame-main-ml-1199995409"></a>
### textFont

```ml
textFont
```

When constructing this record, `hudAssets` supplies an empty string for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L181)
