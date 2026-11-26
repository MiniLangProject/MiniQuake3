# `mq3.client.playable_weapon_sounds.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-sounds-ml-1233645377.md)

<a id="struct-struct-mq3-client-playable-weapon-sounds-catalog-struct-catalog-src-mq3-client-playable-weapon-sounds-ml-1858359215"></a>
## Catalog

```ml
struct Catalog
```

Stores playable weapon sounds catalog record, including `weapons`, `clips`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_sounds.ml#L45)

## Members

<a id="field-field-mq3-client-playable-weapon-sounds-catalog-clips-clips-src-mq3-client-playable-weapon-sounds-ml-790343768"></a>
### clips

```ml
clips
```

When constructing this record, `load` supplies `clips` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_sounds.ml#L50)

<a id="field-field-mq3-client-playable-weapon-sounds-catalog-weapons-weapons-src-mq3-client-playable-weapon-sounds-ml-766906456"></a>
### weapons

```ml
weapons
```

When constructing this record, `load` supplies `weapons` for this member. Used by `find` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_sounds.ml#L48)
