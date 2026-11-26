# `mq3.client.playable_player.Spawn`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-ml-625035251.md)

<a id="struct-struct-mq3-client-playable-player-spawn-struct-spawn-src-mq3-client-playable-player-ml-1447274131"></a>
## Spawn

```ml
struct Spawn
```

Stores playable player spawn record, including `origin`, `yaw`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L30)

## Members

<a id="field-field-mq3-client-playable-player-spawn-origin-origin-src-mq3-client-playable-player-ml-268294372"></a>
### origin

```ml
origin
```

World-space spawn position copied into the player's state when selecting a spawn point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L32)

<a id="field-field-mq3-client-playable-player-spawn-yaw-yaw-src-mq3-client-playable-player-ml-2051380736"></a>
### yaw

```ml
yaw
```

When constructing this record, `collectSpawns` supplies `yaw` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L34)
