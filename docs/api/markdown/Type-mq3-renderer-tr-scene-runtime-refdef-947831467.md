# `mq3.renderer.tr_scene_runtime.Refdef`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-scene-runtime-ml-1958871231.md)

<a id="struct-struct-mq3-renderer-tr-scene-runtime-refdef-struct-refdef-src-mq3-renderer-tr-scene-runtime-ml-17800315"></a>
## Refdef

```ml
struct Refdef
```

Data record for `mq3.renderer.tr_scene_runtime.Refdef`; groups `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L41)

## Members

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-areamask-areamask-src-mq3-renderer-tr-scene-runtime-ml-2009694797"></a>
### areamask

```ml
areamask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L63)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-areamaskmodified-areamaskmodified-src-mq3-renderer-tr-scene-runtime-ml-1320949935"></a>
### areamaskModified

```ml
areamaskModified
```

Whether area visibility differs from the previously rendered scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L65)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-dlights-dlights-src-mq3-renderer-tr-scene-runtime-ml-580621547"></a>
### dlights

```ml
dlights
```

Dynamic lights submitted to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L75)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-entities-entities-src-mq3-renderer-tr-scene-runtime-ml-946355821"></a>
### entities

```ml
entities
```

Entity records associated with the current world, scene, or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L73)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-floattime-floattime-src-mq3-renderer-tr-scene-runtime-ml-2136072323"></a>
### floatTime

```ml
floatTime
```

View time expressed in seconds for shader calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L69)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-fovx-fovx-src-mq3-renderer-tr-scene-runtime-ml-1086481073"></a>
### fovX

```ml
fovX
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L51)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-fovy-fovy-src-mq3-renderer-tr-scene-runtime-ml-1316468695"></a>
### fovY

```ml
fovY
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L53)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-height-height-src-mq3-renderer-tr-scene-runtime-ml-2073762613"></a>
### height

```ml
height
```

Height in pixels of the prepared scene viewport retained with its submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L49)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-numdrawsurfs-numdrawsurfs-src-mq3-renderer-tr-scene-runtime-ml-1848435261"></a>
### numDrawSurfs

```ml
numDrawSurfs
```

Number of draw surfaces currently queued.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L71)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-polys-polys-src-mq3-renderer-tr-scene-runtime-ml-1327669687"></a>
### polys

```ml
polys
```

Polygons submitted to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L77)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-rdflags-rdflags-src-mq3-renderer-tr-scene-runtime-ml-2000757651"></a>
### rdflags

```ml
rdflags
```

Bit mask of view-level rendering options such as no-world or hyperspace rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L61)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-text-text-src-mq3-renderer-tr-scene-runtime-ml-1269559437"></a>
### text

```ml
text
```

Strings retained for deform-text shader stages in this scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L67)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-time-time-src-mq3-renderer-tr-scene-runtime-ml-1234540125"></a>
### time

```ml
time
```

Prepared scene time in milliseconds retained with the frontend's submitted entities and lights.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-viewaxis-viewaxis-src-mq3-renderer-tr-scene-runtime-ml-66681287"></a>
### viewaxis

```ml
viewaxis
```

Camera orientation represented by three basis vectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-vieworg-vieworg-src-mq3-renderer-tr-scene-runtime-ml-1629362915"></a>
### vieworg

```ml
vieworg
```

Camera origin in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L55)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-width-width-src-mq3-renderer-tr-scene-runtime-ml-1616654643"></a>
### width

```ml
width
```

Width in pixels of the prepared scene viewport retained with its submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L47)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-x-x-src-mq3-renderer-tr-scene-runtime-ml-1096063231"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L43)

<a id="field-field-mq3-renderer-tr-scene-runtime-refdef-y-y-src-mq3-renderer-tr-scene-runtime-ml-464800523"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L45)
