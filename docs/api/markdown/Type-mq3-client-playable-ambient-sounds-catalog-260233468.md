# `mq3.client.playable_ambient_sounds.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-ambient-sounds-ml-1265245123.md)

<a id="struct-struct-mq3-client-playable-ambient-sounds-catalog-struct-catalog-src-mq3-client-playable-ambient-sounds-ml-887638243"></a>
## Catalog

```ml
struct Catalog
```

Stores playable ambient sounds catalog record, including `speakers`, `uniqueSounds`, `skipped`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L26)

## Members

<a id="field-field-mq3-client-playable-ambient-sounds-catalog-skipped-skipped-src-mq3-client-playable-ambient-sounds-ml-1118050124"></a>
### skipped

```ml
skipped
```

When constructing this record, `load` supplies `skipped` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L33)

<a id="field-field-mq3-client-playable-ambient-sounds-catalog-speakers-speakers-src-mq3-client-playable-ambient-sounds-ml-73820140"></a>
### speakers

```ml
speakers
```

When constructing this record, `load` supplies `loaded` for this member. Used by `globalLoops` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L29)

<a id="field-field-mq3-client-playable-ambient-sounds-catalog-uniquesounds-uniquesounds-src-mq3-client-playable-ambient-sounds-ml-443311594"></a>
### uniqueSounds

```ml
uniqueSounds
```

Sound resources selected for the unique event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L31)
