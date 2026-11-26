# `mq3.client.playable_ambient_sounds.Speaker`

[Home](README.md) · [Source file](File-src-mq3-client-playable-ambient-sounds-ml-1265245123.md)

<a id="struct-struct-mq3-client-playable-ambient-sounds-speaker-struct-speaker-src-mq3-client-playable-ambient-sounds-ml-382059215"></a>
## Speaker

```ml
struct Speaker
```

Stores playable ambient sounds speaker record, including `noise`, `origin`, `globalSound`, `sound`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L14)

## Members

<a id="field-field-mq3-client-playable-ambient-sounds-speaker-globalsound-globalsound-src-mq3-client-playable-ambient-sounds-ml-1258294886"></a>
### globalSound

```ml
globalSound
```

Sound resource selected for the global event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L21)

<a id="field-field-mq3-client-playable-ambient-sounds-speaker-noise-noise-src-mq3-client-playable-ambient-sounds-ml-460671910"></a>
### noise

```ml
noise
```

When constructing this record, `loopDefinitions` supplies `path` for this member. Used by `load` and `globalLoops` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L17)

<a id="field-field-mq3-client-playable-ambient-sounds-speaker-origin-origin-src-mq3-client-playable-ambient-sounds-ml-689417110"></a>
### origin

```ml
origin
```

Map-space source position used to spatialize an ambient speaker's sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L19)

<a id="field-field-mq3-client-playable-ambient-sounds-speaker-sound-sound-src-mq3-client-playable-ambient-sounds-ml-643532554"></a>
### sound

```ml
sound
```

Decoded WAV sound data resolved for this map speaker; absent until its asset loads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L23)
