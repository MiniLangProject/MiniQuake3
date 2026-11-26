# `mq3.renderer.portal_clip.FaceCache`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-clip-ml-347930170.md)

<a id="struct-struct-mq3-renderer-portal-clip-facecache-struct-facecache-src-mq3-renderer-portal-clip-ml-1054593203"></a>
## FaceCache

```ml
struct FaceCache
```

A face's vertices, including each patch LOD variant, are immutable within its world. Only the selection and the portal plane vary between views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_clip.ml#L84)

## Members

<a id="field-field-mq3-renderer-portal-clip-facecache-byface-byface-src-mq3-renderer-portal-clip-ml-226591396"></a>
### byFace

```ml
byFace
```

Portal-clipped geometry cached by original BSP face index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_clip.ml#L92)

<a id="field-field-mq3-renderer-portal-clip-facecache-dist-dist-src-mq3-renderer-portal-clip-ml-1074223300"></a>
### dist

```ml
dist
```

Signed plane distance measured along its normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_clip.ml#L90)

<a id="field-field-mq3-renderer-portal-clip-facecache-normal-normal-src-mq3-renderer-portal-clip-ml-1462692438"></a>
### normal

```ml
normal
```

Clipping-plane normal associated with the cached portal-clipped face set.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_clip.ml#L88)

<a id="field-field-mq3-renderer-portal-clip-facecache-world-world-src-mq3-renderer-portal-clip-ml-1095998608"></a>
### world

```ml
world
```

Loaded world geometry and associated scene state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_clip.ml#L86)
