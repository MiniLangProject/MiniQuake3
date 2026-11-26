# `mq3.client.playable_menu.Asset`

[Home](README.md) · [Source file](File-src-mq3-client-playable-menu-ml-1211516485.md)

<a id="struct-struct-mq3-client-playable-menu-asset-struct-asset-src-mq3-client-playable-menu-ml-1274510229"></a>
## Asset

```ml
struct Asset
```

Stores playable menu asset record, including `key`, `imageName`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L25)

## Members

<a id="field-field-mq3-client-playable-menu-asset-image-image-src-mq3-client-playable-menu-ml-611638847"></a>
### image

```ml
image
```

When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L33)

<a id="field-field-mq3-client-playable-menu-asset-imagename-imagename-src-mq3-client-playable-menu-ml-2120901743"></a>
### imageName

```ml
imageName
```

Resolved menu artwork path associated with the loaded image and native texture slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L30)

<a id="field-field-mq3-client-playable-menu-asset-key-key-src-mq3-client-playable-menu-ml-801702171"></a>
### key

```ml
key
```

When constructing this record, `load` supplies `item[0]` for this member. Used by `find` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L28)

<a id="field-field-mq3-client-playable-menu-asset-slot-slot-src-mq3-client-playable-menu-ml-1868735159"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_menu.ml#L35)
