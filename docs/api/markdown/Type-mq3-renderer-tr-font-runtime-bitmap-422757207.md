# `mq3.renderer.tr_font_runtime.Bitmap`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-font-runtime-ml-1181758530.md)

<a id="struct-struct-mq3-renderer-tr-font-runtime-bitmap-struct-bitmap-src-mq3-renderer-tr-font-runtime-ml-1950873683"></a>
## Bitmap

```ml
struct Bitmap
```

Data record for `mq3.renderer.tr_font_runtime.Bitmap`; groups `width`, `rows`, `pitch`, `pixelMode`, `buffer`, `numGrays`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L57)

## Members

<a id="field-field-mq3-renderer-tr-font-runtime-bitmap-buffer-buffer-src-mq3-renderer-tr-font-runtime-ml-939063262"></a>
### buffer

```ml
buffer
```

Rasterized glyph coverage bytes arranged by scanline pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L67)

<a id="field-field-mq3-renderer-tr-font-runtime-bitmap-numgrays-numgrays-src-mq3-renderer-tr-font-runtime-ml-1322369042"></a>
### numGrays

```ml
numGrays
```

Number of gray levels represented by the glyph bitmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L69)

<a id="field-field-mq3-renderer-tr-font-runtime-bitmap-pitch-pitch-src-mq3-renderer-tr-font-runtime-ml-293694258"></a>
### pitch

```ml
pitch
```

Signed number of bytes between successive bitmap scanlines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L63)

<a id="field-field-mq3-renderer-tr-font-runtime-bitmap-pixelmode-pixelmode-src-mq3-renderer-tr-font-runtime-ml-2076931110"></a>
### pixelMode

```ml
pixelMode
```

Rasterizer pixel format used by the glyph bitmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L65)

<a id="field-field-mq3-renderer-tr-font-runtime-bitmap-rows-rows-src-mq3-renderer-tr-font-runtime-ml-30788924"></a>
### rows

```ml
rows
```

Number of rasterized glyph scanlines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L61)

<a id="field-field-mq3-renderer-tr-font-runtime-bitmap-width-width-src-mq3-renderer-tr-font-runtime-ml-750354726"></a>
### width

```ml
width
```

Width of the rasterized coverage bitmap, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L59)
