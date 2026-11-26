# `mq3.renderer.tr_scene_runtime.RefdefInput`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-scene-runtime-ml-1958871231.md)

<a id="struct-struct-mq3-renderer-tr-scene-runtime-refdefinput-struct-refdefinput-src-mq3-renderer-tr-scene-runtime-ml-1813401029"></a>
## RefdefInput

```ml
struct RefdefInput
```

Data record for `mq3.renderer.tr_scene_runtime.RefdefInput`; groups `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L14)

## Members

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-areamask-areamask-src-mq3-renderer-tr-scene-runtime-ml-1525843"></a>
### areamask

```ml
areamask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L36)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-fovx-fovx-src-mq3-renderer-tr-scene-runtime-ml-987098327"></a>
### fovX

```ml
fovX
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L24)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-fovy-fovy-src-mq3-renderer-tr-scene-runtime-ml-1308677205"></a>
### fovY

```ml
fovY
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L26)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-height-height-src-mq3-renderer-tr-scene-runtime-ml-630615779"></a>
### height

```ml
height
```

Height in pixels of the requested scene viewport before frontend preparation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L22)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-rdflags-rdflags-src-mq3-renderer-tr-scene-runtime-ml-355219697"></a>
### rdflags

```ml
rdflags
```

Bit mask of view-level rendering options such as no-world or hyperspace rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L34)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-text-text-src-mq3-renderer-tr-scene-runtime-ml-316767907"></a>
### text

```ml
text
```

Input strings made available to deform-text shader stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L38)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-time-time-src-mq3-renderer-tr-scene-runtime-ml-427703435"></a>
### time

```ml
time
```

Requested scene time in milliseconds before the frontend prepares its internal view state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L32)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-viewaxis-viewaxis-src-mq3-renderer-tr-scene-runtime-ml-1567799581"></a>
### viewaxis

```ml
viewaxis
```

Camera orientation represented by three basis vectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L30)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-vieworg-vieworg-src-mq3-renderer-tr-scene-runtime-ml-251855585"></a>
### vieworg

```ml
vieworg
```

Camera origin in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L28)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-width-width-src-mq3-renderer-tr-scene-runtime-ml-275155209"></a>
### width

```ml
width
```

Width in pixels of the requested scene viewport before frontend preparation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L20)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-x-x-src-mq3-renderer-tr-scene-runtime-ml-905949293"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L16)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdefinput-y-y-src-mq3-renderer-tr-scene-runtime-ml-950457249"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_scene_runtime.ml#L18)
