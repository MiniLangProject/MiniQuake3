# `mq3.client.playable_weapon_sounds.Clip`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-sounds-ml-1233645377.md)

<a id="struct-struct-mq3-client-playable-weapon-sounds-clip-struct-clip-src-mq3-client-playable-weapon-sounds-ml-1170679935"></a>
## Clip

```ml
struct Clip
```

Stores playable weapon sounds clip record, including `path`, `sound`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_sounds.ml#L26)

## Members

<a id="field-field-mq3-client-playable-weapon-sounds-clip-path-path-src-mq3-client-playable-weapon-sounds-ml-574162591"></a>
### path

```ml
path
```

When constructing this record, `decodeClip` supplies `path` for this member. Used by `findClip` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_sounds.ml#L29)

<a id="field-field-mq3-client-playable-weapon-sounds-clip-sound-sound-src-mq3-client-playable-weapon-sounds-ml-1178753901"></a>
### sound

```ml
sound
```

Decoded WAV sound data associated with this weapon audio asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_sounds.ml#L31)
