# `mq3.renderer.tr_flares_runtime.Flare`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-flares-runtime-ml-1405723862.md)

<a id="struct-struct-mq3-renderer-tr-flares-runtime-flare-struct-flare-src-mq3-renderer-tr-flares-runtime-ml-1773348609"></a>
## Flare

```ml
struct Flare
```

Data record for `mq3.renderer.tr_flares_runtime.Flare`; groups `slot`, `addedFrame`, `inPortal`, `frameSceneNum`, `surface`, `fogNum`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L15)

## Members

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-addedframe-addedframe-src-mq3-renderer-tr-flares-runtime-ml-1845541323"></a>
### addedFrame

```ml
addedFrame
```

Most recent frame in which this flare was submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L19)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-color-color-src-mq3-renderer-tr-flares-runtime-ml-1377987041"></a>
### color

```ml
color
```

Source flare tint retained separately from its visibility-dependent draw intensity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L41)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-drawintensity-drawintensity-src-mq3-renderer-tr-flares-runtime-ml-2097165353"></a>
### drawIntensity

```ml
drawIntensity
```

Current flare intensity after visibility fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L33)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-eyez-eyez-src-mq3-renderer-tr-flares-runtime-ml-31743839"></a>
### eyeZ

```ml
eyeZ
```

View-space depth used when testing flare visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L39)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-fadetime-fadetime-src-mq3-renderer-tr-flares-runtime-ml-377024359"></a>
### fadeTime

```ml
fadeTime
```

Timestamp of the last visibility transition used to fade a flare.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L29)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-fognum-fognum-src-mq3-renderer-tr-flares-runtime-ml-2058058937"></a>
### fogNum

```ml
fogNum
```

Fog volume number encoded or used by the draw surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L27)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-framescenenum-framescenenum-src-mq3-renderer-tr-flares-runtime-ml-89785925"></a>
### frameSceneNum

```ml
frameSceneNum
```

Sequence number of the scene within the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L23)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-inportal-inportal-src-mq3-renderer-tr-flares-runtime-ml-964808235"></a>
### inPortal

```ml
inPortal
```

Whether the flare belongs to a portal view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L21)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-normal-normal-src-mq3-renderer-tr-flares-runtime-ml-154600475"></a>
### normal

```ml
normal
```

Optional facing normal used to attenuate a flare according to its angle to the viewer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L45)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-origin-origin-src-mq3-renderer-tr-flares-runtime-ml-996275389"></a>
### origin

```ml
origin
```

World-space source position retained for flare projection, fogging, and visibility updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L43)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-slot-slot-src-mq3-renderer-tr-flares-runtime-ml-1660324129"></a>
### slot

```ml
slot
```

Slot reserved for this record in its resource table or buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L17)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-surface-surface-src-mq3-renderer-tr-flares-runtime-ml-1658850921"></a>
### surface

```ml
surface
```

Surface record, handle, or identifier associated with the drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L25)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-visible-visible-src-mq3-renderer-tr-flares-runtime-ml-1045378029"></a>
### visible

```ml
visible
```

Whether the flare passed its most recent visibility test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L31)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-windowx-windowx-src-mq3-renderer-tr-flares-runtime-ml-1451075333"></a>
### windowX

```ml
windowX
```

Horizontal screen coordinate of the projected flare, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L35)

<a id="field-field-mq3-renderer-tr-flares-runtime-flare-windowy-windowy-src-mq3-renderer-tr-flares-runtime-ml-829916037"></a>
### windowY

```ml
windowY
```

Vertical screen coordinate of the projected flare, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L37)
