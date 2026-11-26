# `mq3.client.playable_app.PlayerTexture`

[Home](README.md) · [Source file](File-src-mq3-client-playable-app-ml-15784959.md)

<a id="struct-struct-mq3-client-playable-app-playertexture-struct-playertexture-src-mq3-client-playable-app-ml-1933266213"></a>
## PlayerTexture

```ml
struct PlayerTexture
```

Stores playable app player texture record, including `part`, `surface`, `imageName`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_app.ml#L118)

## Members

<a id="field-field-mq3-client-playable-app-playertexture-image-image-src-mq3-client-playable-app-ml-370562149"></a>
### image

```ml
image
```

When constructing this record, `appendSkinTextures` supplies `binding.image` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_app.ml#L126)

<a id="field-field-mq3-client-playable-app-playertexture-imagename-imagename-src-mq3-client-playable-app-ml-1143341125"></a>
### imageName

```ml
imageName
```

Virtual image path associated with a loaded player-model texture slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_app.ml#L124)

<a id="field-field-mq3-client-playable-app-playertexture-part-part-src-mq3-client-playable-app-ml-545748875"></a>
### part

```ml
part
```

When constructing this record, `appendSkinTextures` supplies `part` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_app.ml#L120)

<a id="field-field-mq3-client-playable-app-playertexture-slot-slot-src-mq3-client-playable-app-ml-1679070045"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_app.ml#L128)

<a id="field-field-mq3-client-playable-app-playertexture-surface-surface-src-mq3-client-playable-app-ml-1684489169"></a>
### surface

```ml
surface
```

When constructing this record, `appendSkinTextures` supplies `binding.surface` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_app.ml#L122)
