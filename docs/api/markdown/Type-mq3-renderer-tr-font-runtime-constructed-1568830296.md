# `mq3.renderer.tr_font_runtime.Constructed`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-font-runtime-ml-1181758530.md)

<a id="struct-struct-mq3-renderer-tr-font-runtime-constructed-struct-constructed-src-mq3-renderer-tr-font-runtime-ml-2018594377"></a>
## Constructed

```ml
struct Constructed
```

Data record for `mq3.renderer.tr_font_runtime.Constructed`; groups `glyph`, `x`, `y`, `maxHeight`, `placed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L108)

## Members

<a id="field-field-mq3-renderer-tr-font-runtime-constructed-glyph-glyph-src-mq3-renderer-tr-font-runtime-ml-347264541"></a>
### glyph

```ml
glyph
```

Glyph metadata updated with the atlas coordinates and image dimensions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L110)

<a id="field-field-mq3-renderer-tr-font-runtime-constructed-maxheight-maxheight-src-mq3-renderer-tr-font-runtime-ml-433747089"></a>
### maxHeight

```ml
maxHeight
```

Tallest glyph currently placed in the active atlas row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L116)

<a id="field-field-mq3-renderer-tr-font-runtime-constructed-placed-placed-src-mq3-renderer-tr-font-runtime-ml-1352626207"></a>
### placed

```ml
placed
```

Whether the glyph was successfully placed in the font atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L118)

<a id="field-field-mq3-renderer-tr-font-runtime-constructed-x-x-src-mq3-renderer-tr-font-runtime-ml-211921669"></a>
### x

```ml
x
```

Horizontal atlas packing cursor returned after the glyph-placement attempt, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L112)

<a id="field-field-mq3-renderer-tr-font-runtime-constructed-y-y-src-mq3-renderer-tr-font-runtime-ml-601515305"></a>
### y

```ml
y
```

Vertical atlas packing cursor returned after the glyph-placement attempt, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L114)
