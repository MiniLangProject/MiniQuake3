# `mq3.renderer.md3_entity.Frames`

[Home](README.md) · [Source file](File-src-mq3-renderer-md3-entity-ml-1460630353.md)

<a id="struct-struct-mq3-renderer-md3-entity-frames-struct-frames-src-mq3-renderer-md3-entity-ml-1459385055"></a>
## Frames

```ml
struct Frames
```

Data record for `mq3.renderer.md3_entity.Frames`; groups `frame`, `oldFrame`, `wrapped`, `repaired`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md3_entity.ml#L19)

## Members

<a id="field-field-mq3-renderer-md3-entity-frames-frame-frame-src-mq3-renderer-md3-entity-ml-2144503897"></a>
### frame

```ml
frame
```

Current model animation-frame index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md3_entity.ml#L21)

<a id="field-field-mq3-renderer-md3-entity-frames-oldframe-oldframe-src-mq3-renderer-md3-entity-ml-958933165"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md3_entity.ml#L23)

<a id="field-field-mq3-renderer-md3-entity-frames-repaired-repaired-src-mq3-renderer-md3-entity-ml-942348501"></a>
### repaired

```ml
repaired
```

Whether an invalid animation-frame selection was replaced by a safe fallback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md3_entity.ml#L27)

<a id="field-field-mq3-renderer-md3-entity-frames-wrapped-wrapped-src-mq3-renderer-md3-entity-ml-377119521"></a>
### wrapped

```ml
wrapped
```

Whether an animation-frame index was wrapped into the model's valid range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md3_entity.ml#L25)
