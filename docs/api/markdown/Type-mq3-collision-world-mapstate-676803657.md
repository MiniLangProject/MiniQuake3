# `mq3.collision.world.MapState`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-mapstate-struct-mapstate-src-mq3-collision-world-ml-1273020551"></a>
## MapState

```ml
struct MapState
```

MapState record for collision.world, containing `world`, `name`, `checksum`, `lastChecksum`, `curves`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L158)

## Members

<a id="field-field-mq3-collision-world-mapstate-checksum-checksum-src-mq3-collision-world-ml-2111735888"></a>
### checksum

```ml
checksum
```

Checksum used to validate or identify the represented data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L164)

<a id="field-field-mq3-collision-world-mapstate-curves-curves-src-mq3-collision-world-ml-1294631170"></a>
### curves

```ml
curves
```

True when collision tests include curved patch surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L168)

<a id="field-field-mq3-collision-world-mapstate-lastchecksum-lastchecksum-src-mq3-collision-world-ml-1825247572"></a>
### lastChecksum

```ml
lastChecksum
```

Checksum returned for the most recently loaded collision map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L166)

<a id="field-field-mq3-collision-world-mapstate-name-name-src-mq3-collision-world-ml-1743693572"></a>
### name

```ml
name
```

Map name used to identify the cached collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L162)

<a id="field-field-mq3-collision-world-mapstate-world-world-src-mq3-collision-world-ml-727005214"></a>
### world

```ml
world
```

Collision or navigation world used by this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L160)
