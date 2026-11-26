# `mq3.renderer.playable_flares.Flare`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-flares-ml-2125885383.md)

<a id="struct-struct-mq3-renderer-playable-flares-flare-struct-flare-src-mq3-renderer-playable-flares-ml-767693545"></a>
## Flare

```ml
struct Flare
```

Data record for `mq3.renderer.playable_flares.Flare`; groups `faceIndex`, `textureIndex`, `fogIndex`, `origin`, `color`, `normal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L27)

## Members

<a id="field-field-mq3-renderer-playable-flares-flare-color-color-src-mq3-renderer-playable-flares-ml-1041136067"></a>
### color

```ml
color
```

BSP-authored tint of the flare surface before view-dependent fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L37)

<a id="field-field-mq3-renderer-playable-flares-flare-faceindex-faceindex-src-mq3-renderer-playable-flares-ml-895810663"></a>
### faceIndex

```ml
faceIndex
```

Index of the source BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L29)

<a id="field-field-mq3-renderer-playable-flares-flare-fogindex-fogindex-src-mq3-renderer-playable-flares-ml-1469461375"></a>
### fogIndex

```ml
fogIndex
```

Index of the fog volume affecting the surface or primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L33)

<a id="field-field-mq3-renderer-playable-flares-flare-normal-normal-src-mq3-renderer-playable-flares-ml-565684749"></a>
### normal

```ml
normal
```

Map-authored flare-facing direction used to scale visibility from the current eye position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L39)

<a id="field-field-mq3-renderer-playable-flares-flare-origin-origin-src-mq3-renderer-playable-flares-ml-754343067"></a>
### origin

```ml
origin
```

Map-authored world position from which the flare is projected into the view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L35)

<a id="field-field-mq3-renderer-playable-flares-flare-textureindex-textureindex-src-mq3-renderer-playable-flares-ml-2130020817"></a>
### textureIndex

```ml
textureIndex
```

Index identifying the texture or BSP shader assigned to the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L31)
