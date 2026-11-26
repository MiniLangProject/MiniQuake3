# `mq3.client.playable_player_projectiles.Trail`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-projectiles-ml-210819166.md)

<a id="struct-struct-mq3-client-playable-player-projectiles-trail-struct-trail-src-mq3-client-playable-player-projectiles-ml-1786872957"></a>
## Trail

```ml
struct Trail
```

Stores playable player projectiles trail record, including `projectileId`, `style`, `start`, `endPoint`, `fromTime`, `toTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L77)

## Members

<a id="field-field-mq3-client-playable-player-projectiles-trail-endpoint-endpoint-src-mq3-client-playable-player-projectiles-ml-1948688899"></a>
### endPoint

```ml
endPoint
```

World-space endpoint of the trace, beam, or projectile presentation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L86)

<a id="field-field-mq3-client-playable-player-projectiles-trail-fromtime-fromtime-src-mq3-client-playable-player-projectiles-ml-448324275"></a>
### fromTime

```ml
fromTime
```

When constructing this record, `updateWithTrace` supplies `cursorTime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L88)

<a id="field-field-mq3-client-playable-player-projectiles-trail-projectileid-projectileid-src-mq3-client-playable-player-projectiles-ml-1962667557"></a>
### projectileId

```ml
projectileId
```

Stable projectile identifier used to associate movement, trails, and impact presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L79)

<a id="field-field-mq3-client-playable-player-projectiles-trail-start-start-src-mq3-client-playable-player-projectiles-ml-1622950757"></a>
### start

```ml
start
```

When constructing this record, `updateWithTrace` supplies `startPoint` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L84)

<a id="field-field-mq3-client-playable-player-projectiles-trail-style-style-src-mq3-client-playable-player-projectiles-ml-1856886433"></a>
### style

```ml
style
```

Projectile style carried by this traveled segment so trail rendering can select the matching effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L82)

<a id="field-field-mq3-client-playable-player-projectiles-trail-totime-totime-src-mq3-client-playable-player-projectiles-ml-2077591573"></a>
### toTime

```ml
toTime
```

When constructing this record, `updateWithTrace` supplies `hitTime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L90)
