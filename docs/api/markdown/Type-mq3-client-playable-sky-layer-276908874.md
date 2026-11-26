# `mq3.client.playable_sky.Layer`

[Home](README.md) · [Source file](File-src-mq3-client-playable-sky-ml-624488737.md)

<a id="struct-struct-mq3-client-playable-sky-layer-struct-layer-src-mq3-client-playable-sky-ml-1629622043"></a>
## Layer

```ml
struct Layer
```

Stores playable sky layer record, including `imageName`, `image`, `slot`, `scaleU`, `scaleV`, `scrollU` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L69)

## Members

<a id="field-field-mq3-client-playable-sky-layer-additive-additive-src-mq3-client-playable-sky-ml-703990226"></a>
### additive

```ml
additive
```

When constructing this record, `layerFromStage` supplies `additive` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L90)

<a id="field-field-mq3-client-playable-sky-layer-image-image-src-mq3-client-playable-sky-ml-453533658"></a>
### image

```ml
image
```

When constructing this record, `layerFromStage` supplies `image` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L74)

<a id="field-field-mq3-client-playable-sky-layer-imagename-imagename-src-mq3-client-playable-sky-ml-1430708666"></a>
### imageName

```ml
imageName
```

Resolved image path for this textured sky layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L71)

<a id="field-field-mq3-client-playable-sky-layer-scaleu-scaleu-src-mq3-client-playable-sky-ml-1736240452"></a>
### scaleU

```ml
scaleU
```

When constructing this record, `layerFromStage` supplies `scaleU` for this member. Used by `vertex` and `mappedVertex` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L79)

<a id="field-field-mq3-client-playable-sky-layer-scalev-scalev-src-mq3-client-playable-sky-ml-338273626"></a>
### scaleV

```ml
scaleV
```

When constructing this record, `layerFromStage` supplies `scaleV` for this member. Used by `vertex` and `mappedVertex` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L82)

<a id="field-field-mq3-client-playable-sky-layer-scrollu-scrollu-src-mq3-client-playable-sky-ml-945318554"></a>
### scrollU

```ml
scrollU
```

When constructing this record, `layerFromStage` supplies `scrollU` for this member. Used by `vertex` and `mappedVertex` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L85)

<a id="field-field-mq3-client-playable-sky-layer-scrollv-scrollv-src-mq3-client-playable-sky-ml-975907198"></a>
### scrollV

```ml
scrollV
```

When constructing this record, `layerFromStage` supplies `scrollV` for this member. Used by `vertex` and `mappedVertex` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L88)

<a id="field-field-mq3-client-playable-sky-layer-slot-slot-src-mq3-client-playable-sky-ml-1395196614"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L76)
