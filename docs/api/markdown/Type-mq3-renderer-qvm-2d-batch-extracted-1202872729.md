# `mq3.renderer.qvm_2d_batch.Extracted`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-extracted-struct-extracted-src-mq3-renderer-qvm-2d-batch-ml-1135238349"></a>
## Extracted

```ml
struct Extracted
```

Data record for `mq3.renderer.qvm_2d_batch.Extracted`; groups `quads`, `setColors`, `ignoredCommands`, `sourceWidth`, `sourceHeight`, `targetWidth`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L112)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-ignoredcommands-ignoredcommands-src-mq3-renderer-qvm-2d-batch-ml-1675794081"></a>
### ignoredCommands

```ml
ignoredCommands
```

Number of commands not converted into two-dimensional primitives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L118)

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-quads-quads-src-mq3-renderer-qvm-2d-batch-ml-1059988797"></a>
### quads

```ml
quads
```

Two-dimensional textured rectangles extracted from renderer commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L114)

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-setcolors-setcolors-src-mq3-renderer-qvm-2d-batch-ml-1746679089"></a>
### setColors

```ml
setColors
```

Number of color-setting commands encountered while extracting quads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L116)

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-sourceheight-sourceheight-src-mq3-renderer-qvm-2d-batch-ml-1845951481"></a>
### sourceHeight

```ml
sourceHeight
```

Height of the source coordinate system or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L122)

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-sourcewidth-sourcewidth-src-mq3-renderer-qvm-2d-batch-ml-56514773"></a>
### sourceWidth

```ml
sourceWidth
```

Width of the source coordinate system or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L120)

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-targetheight-targetheight-src-mq3-renderer-qvm-2d-batch-ml-1433389401"></a>
### targetHeight

```ml
targetHeight
```

Height of the destination viewport or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L126)

<a id="field-field-mq3-renderer-qvm-2d-batch-extracted-targetwidth-targetwidth-src-mq3-renderer-qvm-2d-batch-ml-801669537"></a>
### targetWidth

```ml
targetWidth
```

Width of the destination viewport or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L124)
