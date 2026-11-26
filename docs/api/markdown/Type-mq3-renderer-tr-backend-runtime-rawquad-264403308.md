# `mq3.renderer.tr_backend_runtime.RawQuad`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-rawquad-struct-rawquad-src-mq3-renderer-tr-backend-runtime-ml-1559931507"></a>
## RawQuad

```ml
struct RawQuad
```

Data record for `mq3.renderer.tr_backend_runtime.RawQuad`; groups `positions`, `texCoords`, `client`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L181)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-rawquad-client-client-src-mq3-renderer-tr-backend-runtime-ml-572531960"></a>
### client

```ml
client
```

Cinematic client or scratch-image slot associated with the raw image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L187)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawquad-positions-positions-src-mq3-renderer-tr-backend-runtime-ml-706047634"></a>
### positions

```ml
positions
```

Four screen-space corners used to draw an uploaded raw image or cinematic frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L183)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawquad-texcoords-texcoords-src-mq3-renderer-tr-backend-runtime-ml-2114623434"></a>
### texCoords

```ml
texCoords
```

Texture corners used to sample an uploaded raw image or cinematic frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L185)
