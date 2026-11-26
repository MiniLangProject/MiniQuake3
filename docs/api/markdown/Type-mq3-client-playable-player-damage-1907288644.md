# `mq3.client.playable_player.Damage`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-ml-625035251.md)

<a id="struct-struct-mq3-client-playable-player-damage-struct-damage-src-mq3-client-playable-player-ml-1549346311"></a>
## Damage

```ml
struct Damage
```

Stores playable player damage record, including `requested`, `saved`, `taken`, `killed`, `ignored`, `health` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L76)

## Members

<a id="field-field-mq3-client-playable-player-damage-armor-armor-src-mq3-client-playable-player-ml-869796892"></a>
### armor

```ml
armor
```

Player armor remaining after armor absorption for this damage attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L90)

<a id="field-field-mq3-client-playable-player-damage-health-health-src-mq3-client-playable-player-ml-844601608"></a>
### health

```ml
health
```

Player health remaining after this damage attempt, including an ignored or invulnerable hit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L88)

<a id="field-field-mq3-client-playable-player-damage-ignored-ignored-src-mq3-client-playable-player-ml-777001600"></a>
### ignored

```ml
ignored
```

When constructing this record, `applyDamage` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L86)

<a id="field-field-mq3-client-playable-player-damage-killed-killed-src-mq3-client-playable-player-ml-847646714"></a>
### killed

```ml
killed
```

When constructing this record, `applyDamage` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L84)

<a id="field-field-mq3-client-playable-player-damage-requested-requested-src-mq3-client-playable-player-ml-1019696352"></a>
### requested

```ml
requested
```

When constructing this record, `applyDamage` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L78)

<a id="field-field-mq3-client-playable-player-damage-saved-saved-src-mq3-client-playable-player-ml-912619532"></a>
### saved

```ml
saved
```

When constructing this record, `applyDamage` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L80)

<a id="field-field-mq3-client-playable-player-damage-taken-taken-src-mq3-client-playable-player-ml-108989692"></a>
### taken

```ml
taken
```

When constructing this record, `applyDamage` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L82)
