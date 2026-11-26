# `mq3.client.cgame_weapons.Barrel`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-weapons-ml-1641558282.md)

<a id="struct-struct-mq3-client-cgame-weapons-barrel-struct-barrel-src-mq3-client-cgame-weapons-ml-1654939739"></a>
## Barrel

```ml
struct Barrel
```

Stores client game weapons barrel record, including `angle`, `time`, `spinning`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L195)

## Members

<a id="field-field-mq3-client-cgame-weapons-barrel-angle-angle-src-mq3-client-cgame-weapons-ml-2123130313"></a>
### angle

```ml
angle
```

When constructing this record, `barrel` supplies `0.0` for this member. Used by `machinegunSpinAngle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L198)

<a id="field-field-mq3-client-cgame-weapons-barrel-spinning-spinning-src-mq3-client-cgame-weapons-ml-1952013129"></a>
### spinning

```ml
spinning
```

When constructing this record, `barrel` supplies `false` for this member. Used by `machinegunSpinAngle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L204)

<a id="field-field-mq3-client-cgame-weapons-barrel-time-time-src-mq3-client-cgame-weapons-ml-280196447"></a>
### time

```ml
time
```

Timestamp in milliseconds of the last weapon-barrel spin-state change, paired with the stored angle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L201)
