# `mq3.client.playable_weapon_sounds.Definition`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-sounds-ml-1233645377.md)

<a id="struct-struct-mq3-client-playable-weapon-sounds-definition-struct-definition-src-mq3-client-playable-weapon-sounds-ml-1297309571"></a>
## Definition

```ml
struct Definition
```

Stores playable weapon sounds definition record, including `weapon`, `classname`, `firePaths`, `impactPaths`, `pickupPath`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L12)

## Members

<a id="field-field-mq3-client-playable-weapon-sounds-definition-classname-classname-src-mq3-client-playable-weapon-sounds-ml-28966960"></a>
### classname

```ml
classname
```

Weapon classname used to resolve the corresponding firing, reload, and other weapon sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L16)

<a id="field-field-mq3-client-playable-weapon-sounds-definition-firepaths-firepaths-src-mq3-client-playable-weapon-sounds-ml-1087193472"></a>
### firePaths

```ml
firePaths
```

When constructing this record, `definitions` supplies `["sound/weapons/melee/fstrun.wav"]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L19)

<a id="field-field-mq3-client-playable-weapon-sounds-definition-impactpaths-impactpaths-src-mq3-client-playable-weapon-sounds-ml-1268469932"></a>
### impactPaths

```ml
impactPaths
```

When constructing this record, `definitions` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L21)

<a id="field-field-mq3-client-playable-weapon-sounds-definition-pickuppath-pickuppath-src-mq3-client-playable-weapon-sounds-ml-1102628726"></a>
### pickupPath

```ml
pickupPath
```

When constructing this record, `definitions` supplies `PICKUP_PATH` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L23)

<a id="field-field-mq3-client-playable-weapon-sounds-definition-weapon-weapon-src-mq3-client-playable-weapon-sounds-ml-1922103548"></a>
### weapon

```ml
weapon
```

Weapon classname associated with this firing, impact, and pickup sound definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L14)
