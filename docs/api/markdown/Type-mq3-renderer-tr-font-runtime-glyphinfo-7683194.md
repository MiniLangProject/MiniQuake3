# `mq3.renderer.tr_font_runtime.GlyphInfo`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-font-runtime-ml-1181758530.md)

<a id="struct-struct-mq3-renderer-tr-font-runtime-glyphinfo-struct-glyphinfo-src-mq3-renderer-tr-font-runtime-ml-39804097"></a>
## GlyphInfo

```ml
struct GlyphInfo
```

Data record for `mq3.renderer.tr_font_runtime.GlyphInfo`; groups `height`, `top`, `bottom`, `pitch`, `xSkip`, `imageWidth`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L72)

## Members

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-bottom-bottom-src-mq3-renderer-tr-font-runtime-ml-1131843833"></a>
### bottom

```ml
bottom
```

Lower glyph bound retained in the rasterizer's 26.6 fixed-point units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L78)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-glyph-glyph-src-mq3-renderer-tr-font-runtime-ml-1762202915"></a>
### glyph

```ml
glyph
```

Registered shader handle used to draw this glyph atlas page.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L96)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-height-height-src-mq3-renderer-tr-font-runtime-ml-192967489"></a>
### height

```ml
height
```

Height of the rasterized glyph, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-imageheight-imageheight-src-mq3-renderer-tr-font-runtime-ml-453078179"></a>
### imageHeight

```ml
imageHeight
```

Height of the glyph region reserved in the font atlas, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L86)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-imagewidth-imagewidth-src-mq3-renderer-tr-font-runtime-ml-1497939269"></a>
### imageWidth

```ml
imageWidth
```

Width of the glyph region reserved in the font atlas, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L84)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-pitch-pitch-src-mq3-renderer-tr-font-runtime-ml-762573195"></a>
### pitch

```ml
pitch
```

Signed number of bytes between successive bitmap scanlines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L80)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-s-s-src-mq3-renderer-tr-font-runtime-ml-1269918487"></a>
### s

```ml
s
```

Horizontal normalized texture coordinate of the first corner of the glyph atlas region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L88)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-s2-s2-src-mq3-renderer-tr-font-runtime-ml-1121954777"></a>
### s2

```ml
s2
```

Horizontal normalized texture coordinate of the second corner of the glyph atlas region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L92)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-shadername-shadername-src-mq3-renderer-tr-font-runtime-ml-1427316931"></a>
### shaderName

```ml
shaderName
```

Font-atlas page name associated with the glyph's registered drawing shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L98)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-t-t-src-mq3-renderer-tr-font-runtime-ml-1157672547"></a>
### t

```ml
t
```

Vertical normalized texture coordinate of the first corner of the glyph atlas region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L90)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-t2-t2-src-mq3-renderer-tr-font-runtime-ml-1549122531"></a>
### t2

```ml
t2
```

Vertical normalized texture coordinate of the second corner of the glyph atlas region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-top-top-src-mq3-renderer-tr-font-runtime-ml-370539603"></a>
### top

```ml
top
```

Pixel bearing of the rendered glyph above its baseline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L76)

<a id="field-field-mq3-renderer-tr-font-runtime-glyphinfo-xskip-xskip-src-mq3-renderer-tr-font-runtime-ml-2093080931"></a>
### xSkip

```ml
xSkip
```

Horizontal pen advance used to lay out this glyph, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L82)
