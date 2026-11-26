# `mq3.client.playable_weapon_barrel.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-barrel-ml-1354311309.md)

<a id="struct-struct-mq3-client-playable-weapon-barrel-state-struct-state-src-mq3-client-playable-weapon-barrel-ml-428706059"></a>
## State

```ml
struct State
```

Stores playable weapon barrel state, including `angle`, `time`, `spinning`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L25)

## Members

<a id="field-field-mq3-client-playable-weapon-barrel-state-angle-angle-src-mq3-client-playable-weapon-barrel-ml-1608380010"></a>
### angle

```ml
angle
```

When constructing this record, `state` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L27)

<a id="field-field-mq3-client-playable-weapon-barrel-state-spinning-spinning-src-mq3-client-playable-weapon-barrel-ml-411614458"></a>
### spinning

```ml
spinning
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L32)

<a id="field-field-mq3-client-playable-weapon-barrel-state-time-time-src-mq3-client-playable-weapon-barrel-ml-1726498964"></a>
### time

```ml
time
```

Timestamp in milliseconds of the last transition between spinning and coasting, anchoring the stored barrel angle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L30)
