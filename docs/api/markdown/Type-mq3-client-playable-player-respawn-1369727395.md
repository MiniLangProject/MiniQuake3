# `mq3.client.playable_player.Respawn`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-ml-625035251.md)

<a id="struct-struct-mq3-client-playable-player-respawn-struct-respawn-src-mq3-client-playable-player-ml-2031160737"></a>
## Respawn

```ml
struct Respawn
```

Stores playable player respawn record, including `respawned`, `spawnIndex`, `position`, `yaw`, `invulnerableUntil`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L93)

## Members

<a id="field-field-mq3-client-playable-player-respawn-invulnerableuntil-invulnerableuntil-src-mq3-client-playable-player-ml-2012135159"></a>
### invulnerableUntil

```ml
invulnerableUntil
```

When constructing this record, `pollRespawn` supplies `state.invulnerableUntil` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L103)

<a id="field-field-mq3-client-playable-player-respawn-position-position-src-mq3-client-playable-player-ml-1937255601"></a>
### position

```ml
position
```

When constructing this record, `pollRespawn` supplies `state.position` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L99)

<a id="field-field-mq3-client-playable-player-respawn-respawned-respawned-src-mq3-client-playable-player-ml-1693877487"></a>
### respawned

```ml
respawned
```

When constructing this record, `pollRespawn` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L95)

<a id="field-field-mq3-client-playable-player-respawn-spawnindex-spawnindex-src-mq3-client-playable-player-ml-329757933"></a>
### spawnIndex

```ml
spawnIndex
```

When constructing this record, `pollRespawn` supplies `state.spawnIndex` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L97)

<a id="field-field-mq3-client-playable-player-respawn-yaw-yaw-src-mq3-client-playable-player-ml-2084216919"></a>
### yaw

```ml
yaw
```

When constructing this record, `pollRespawn` supplies `state.yaw` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L101)
