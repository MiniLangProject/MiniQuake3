# `mq3.client.cinematic_runtime.Upload`

[Home](README.md) · [Source file](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)

<a id="struct-struct-mq3-client-cinematic-runtime-upload-struct-upload-src-mq3-client-cinematic-runtime-ml-418370339"></a>
## Upload

```ml
struct Upload
```

Stores cinematic runtime upload record, including `handle`, `frame`, `dirty`, `shader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L63)

## Members

<a id="field-field-mq3-client-cinematic-runtime-upload-dirty-dirty-src-mq3-client-cinematic-runtime-ml-752354420"></a>
### dirty

```ml
dirty
```

When constructing this record, `upload` supplies `clip.dirty` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L69)

<a id="field-field-mq3-client-cinematic-runtime-upload-frame-frame-src-mq3-client-cinematic-runtime-ml-2059939260"></a>
### frame

```ml
frame
```

Latest decoded RoQ video frame whose pixels and dimensions are supplied to the texture upload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L67)

<a id="field-field-mq3-client-cinematic-runtime-upload-handle-handle-src-mq3-client-cinematic-runtime-ml-1508171272"></a>
### handle

```ml
handle
```

When constructing this record, `upload` supplies `handle` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L65)

<a id="field-field-mq3-client-cinematic-runtime-upload-shader-shader-src-mq3-client-cinematic-runtime-ml-1778940430"></a>
### shader

```ml
shader
```

True when the decoded frame belongs to a cinematic opened for shader-texture playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L71)
