# `mq3.client.baseq3_console_background.Layer`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-console-background-ml-1394936477.md)

<a id="struct-struct-mq3-client-baseq3-console-background-layer-struct-layer-src-mq3-client-baseq3-console-background-ml-1626591899"></a>
## Layer

```ml
struct Layer
```

Stores base Quake III console background layer record, including `stage`, `imageName`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L17)

## Members

<a id="field-field-mq3-client-baseq3-console-background-layer-image-image-src-mq3-client-baseq3-console-background-ml-2064580862"></a>
### image

```ml
image
```

When constructing this record, `load` supplies `stage.images[0]` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L25)

<a id="field-field-mq3-client-baseq3-console-background-layer-imagename-imagename-src-mq3-client-baseq3-console-background-ml-2065878118"></a>
### imageName

```ml
imageName
```

Resolved image path for one stage of the retail console-background shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L22)

<a id="field-field-mq3-client-baseq3-console-background-layer-slot-slot-src-mq3-client-baseq3-console-background-ml-102155850"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L27)

<a id="field-field-mq3-client-baseq3-console-background-layer-stage-stage-src-mq3-client-baseq3-console-background-ml-1176593950"></a>
### stage

```ml
stage
```

When constructing this record, `load` supplies `stage` for this member. Used by `drawLayer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L20)
