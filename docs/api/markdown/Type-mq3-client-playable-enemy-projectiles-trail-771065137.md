# `mq3.client.playable_enemy_projectiles.Trail`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-projectiles-ml-602850091.md)

<a id="struct-struct-mq3-client-playable-enemy-projectiles-trail-struct-trail-src-mq3-client-playable-enemy-projectiles-ml-1455240549"></a>
## Trail

```ml
struct Trail
```

Stores playable enemy projectiles trail record, including `projectileId`, `start`, `endPoint`, `fromTime`, `toTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L47)

## Members

<a id="field-field-mq3-client-playable-enemy-projectiles-trail-endpoint-endpoint-src-mq3-client-playable-enemy-projectiles-ml-1104515755"></a>
### endPoint

```ml
endPoint
```

World-space endpoint of the trace, beam, or projectile presentation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L53)

<a id="field-field-mq3-client-playable-enemy-projectiles-trail-fromtime-fromtime-src-mq3-client-playable-enemy-projectiles-ml-733604331"></a>
### fromTime

```ml
fromTime
```

When constructing this record, `updateWithTrace` supplies `fromTime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L55)

<a id="field-field-mq3-client-playable-enemy-projectiles-trail-projectileid-projectileid-src-mq3-client-playable-enemy-projectiles-ml-426504417"></a>
### projectileId

```ml
projectileId
```

Stable projectile identifier used to associate movement, trails, and impact presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L49)

<a id="field-field-mq3-client-playable-enemy-projectiles-trail-start-start-src-mq3-client-playable-enemy-projectiles-ml-1550941661"></a>
### start

```ml
start
```

When constructing this record, `updateWithTrace` supplies `startPoint` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L51)

<a id="field-field-mq3-client-playable-enemy-projectiles-trail-totime-totime-src-mq3-client-playable-enemy-projectiles-ml-1515804525"></a>
### toTime

```ml
toTime
```

When constructing this record, `updateWithTrace` supplies `hitTime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L57)
