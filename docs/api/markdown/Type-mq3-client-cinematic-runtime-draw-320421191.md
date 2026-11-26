# `mq3.client.cinematic_runtime.Draw`

[Home](README.md) · [Source file](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)

<a id="struct-struct-mq3-client-cinematic-runtime-draw-struct-draw-src-mq3-client-cinematic-runtime-ml-193940783"></a>
## Draw

```ml
struct Draw
```

Stores cinematic runtime draw record, including `handle`, `frame`, `extents`, `dirty`, `shader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L48)

## Members

<a id="field-field-mq3-client-cinematic-runtime-draw-dirty-dirty-src-mq3-client-cinematic-runtime-ml-1506134283"></a>
### dirty

```ml
dirty
```

When constructing this record, `draw` supplies `clip.dirty` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L57)

<a id="field-field-mq3-client-cinematic-runtime-draw-extents-extents-src-mq3-client-cinematic-runtime-ml-1180299495"></a>
### extents

```ml
extents
```

When constructing this record, `draw` supplies `clip.extents` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L55)

<a id="field-field-mq3-client-cinematic-runtime-draw-frame-frame-src-mq3-client-cinematic-runtime-ml-466812379"></a>
### frame

```ml
frame
```

Latest decoded RoQ video frame, including its pixel buffer and dimensions, queued for cinematic drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L53)

<a id="field-field-mq3-client-cinematic-runtime-draw-handle-handle-src-mq3-client-cinematic-runtime-ml-375467055"></a>
### handle

```ml
handle
```

When constructing this record, `draw` supplies `handle` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L50)

<a id="field-field-mq3-client-cinematic-runtime-draw-shader-shader-src-mq3-client-cinematic-runtime-ml-71736541"></a>
### shader

```ml
shader
```

True for cinematic texture playback, which preserves the supplied extents without virtual-screen scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L60)
