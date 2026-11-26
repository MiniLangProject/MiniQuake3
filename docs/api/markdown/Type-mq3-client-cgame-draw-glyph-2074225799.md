# `mq3.client.cgame_draw.Glyph`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-draw-ml-658265827.md)

<a id="struct-struct-mq3-client-cgame-draw-glyph-struct-glyph-src-mq3-client-cgame-draw-ml-1776965033"></a>
## Glyph

```ml
struct Glyph
```

Stores client game draw glyph record, including `xSkip`, `height`, `imageWidth`, `imageHeight`, `top`, `s` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L98)

## Members

<a id="field-field-mq3-client-cgame-draw-glyph-height-height-src-mq3-client-cgame-draw-ml-1841588257"></a>
### height

```ml
height
```

Unscaled font-metric height used to size the rendered HUD glyph quad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L102)

<a id="field-field-mq3-client-cgame-draw-glyph-imageheight-imageheight-src-mq3-client-cgame-draw-ml-1538605591"></a>
### imageHeight

```ml
imageHeight
```

Height of the glyph's image region in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L106)

<a id="field-field-mq3-client-cgame-draw-glyph-imagewidth-imagewidth-src-mq3-client-cgame-draw-ml-308068521"></a>
### imageWidth

```ml
imageWidth
```

Width of the glyph's image region in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L104)

<a id="field-field-mq3-client-cgame-draw-glyph-s-s-src-mq3-client-cgame-draw-ml-463046083"></a>
### s

```ml
s
```

Left texture coordinate of this glyph's region in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L110)

<a id="field-field-mq3-client-cgame-draw-glyph-s2-s2-src-mq3-client-cgame-draw-ml-2019896701"></a>
### s2

```ml
s2
```

Right texture coordinate of this glyph's region in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L114)

<a id="field-field-mq3-client-cgame-draw-glyph-shader-shader-src-mq3-client-cgame-draw-ml-1351000509"></a>
### shader

```ml
shader
```

Font atlas material used to render this glyph with its stored texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L118)

<a id="field-field-mq3-client-cgame-draw-glyph-t-t-src-mq3-client-cgame-draw-ml-1526177087"></a>
### t

```ml
t
```

Top texture coordinate of this glyph's region in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L112)

<a id="field-field-mq3-client-cgame-draw-glyph-t2-t2-src-mq3-client-cgame-draw-ml-582838687"></a>
### t2

```ml
t2
```

Bottom texture coordinate of this glyph's region in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L116)

<a id="field-field-mq3-client-cgame-draw-glyph-top-top-src-mq3-client-cgame-draw-ml-886813607"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L108)

<a id="field-field-mq3-client-cgame-draw-glyph-xskip-xskip-src-mq3-client-cgame-draw-ml-53514167"></a>
### xSkip

```ml
xSkip
```

Horizontal pen advance applied after drawing this font glyph.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L100)
