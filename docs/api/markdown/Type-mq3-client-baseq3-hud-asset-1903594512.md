# `mq3.client.baseq3_hud.Asset`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-hud-ml-1439544244.md)

<a id="struct-struct-mq3-client-baseq3-hud-asset-struct-asset-src-mq3-client-baseq3-hud-ml-353854391"></a>
## Asset

```ml
struct Asset
```

Stores base Quake III HUD asset record, including `key`, `imageName`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L39)

## Members

<a id="field-field-mq3-client-baseq3-hud-asset-image-image-src-mq3-client-baseq3-hud-ml-136392077"></a>
### image

```ml
image
```

When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L47)

<a id="field-field-mq3-client-baseq3-hud-asset-imagename-imagename-src-mq3-client-baseq3-hud-ml-1831798613"></a>
### imageName

```ml
imageName
```

Resolved artwork path for a status-bar digit, icon, or other base-game HUD asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L44)

<a id="field-field-mq3-client-baseq3-hud-asset-key-key-src-mq3-client-baseq3-hud-ml-316863833"></a>
### key

```ml
key
```

When constructing this record, `load` supplies `item[0]` for this member. Used by `find` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L42)

<a id="field-field-mq3-client-baseq3-hud-asset-slot-slot-src-mq3-client-baseq3-hud-ml-630902233"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_hud.ml#L49)
