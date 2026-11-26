# `mq3.client.playable_player_shadows.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-shadows-ml-274754233.md)

<a id="struct-struct-mq3-client-playable-player-shadows-catalog-struct-catalog-src-mq3-client-playable-player-shadows-ml-1401556391"></a>
## Catalog

```ml
struct Catalog
```

Stores playable player shadows catalog record, including `imageName`, `image`, `textureSlot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_shadows.ml#L25)

## Members

<a id="field-field-mq3-client-playable-player-shadows-catalog-image-image-src-mq3-client-playable-player-shadows-ml-182533984"></a>
### image

```ml
image
```

When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_shadows.ml#L30)

<a id="field-field-mq3-client-playable-player-shadows-catalog-imagename-imagename-src-mq3-client-playable-player-shadows-ml-744193536"></a>
### imageName

```ml
imageName
```

Resolved shadow image path loaded into the catalog's native texture slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_shadows.ml#L27)

<a id="field-field-mq3-client-playable-player-shadows-catalog-textureslot-textureslot-src-mq3-client-playable-player-shadows-ml-1657052256"></a>
### textureSlot

```ml
textureSlot
```

Texture-cache slot assigned to the resource for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_shadows.ml#L32)
