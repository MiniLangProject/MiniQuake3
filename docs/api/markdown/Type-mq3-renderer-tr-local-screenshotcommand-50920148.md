# `mq3.renderer.tr_local.ScreenshotCommand`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-local-ml-841068495.md)

<a id="struct-struct-mq3-renderer-tr-local-screenshotcommand-struct-screenshotcommand-src-mq3-renderer-tr-local-ml-893080199"></a>
## ScreenshotCommand

```ml
struct ScreenshotCommand
```

Data record for `mq3.renderer.tr_local.ScreenshotCommand`; groups `commandId`, `x`, `y`, `width`, `height`, `fileName`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L166)

## Members

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-commandid-commandid-src-mq3-renderer-tr-local-ml-976438818"></a>
### commandId

```ml
commandId
```

Renderer command identifier selecting the backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L168)

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-filename-filename-src-mq3-renderer-tr-local-ml-323487204"></a>
### fileName

```ml
fileName
```

Output path of the screenshot or generated file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L178)

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-height-height-src-mq3-renderer-tr-local-ml-2064125152"></a>
### height

```ml
height
```

Height in pixels of the framebuffer rectangle captured by this screenshot command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L176)

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-jpeg-jpeg-src-mq3-renderer-tr-local-ml-754459150"></a>
### jpeg

```ml
jpeg
```

Whether screenshot output uses JPEG encoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L180)

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-width-width-src-mq3-renderer-tr-local-ml-1168540850"></a>
### width

```ml
width
```

Width in pixels of the framebuffer rectangle captured by this screenshot command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L174)

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-x-x-src-mq3-renderer-tr-local-ml-1203120110"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L170)

<a id="field-field-mq3-renderer-tr-local-screenshotcommand-y-y-src-mq3-renderer-tr-local-ml-1440727026"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L172)
