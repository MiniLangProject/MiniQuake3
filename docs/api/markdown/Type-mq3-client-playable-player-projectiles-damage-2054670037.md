# `mq3.client.playable_player_projectiles.Damage`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-projectiles-ml-210819166.md)

<a id="struct-struct-mq3-client-playable-player-projectiles-damage-struct-damage-src-mq3-client-playable-player-projectiles-ml-1015481039"></a>
## Damage

```ml
struct Damage
```

Stores playable player projectiles damage record, including `targetIndex`, `amount`, `direct`, `killed`, `awardedScore`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L93)

## Members

<a id="field-field-mq3-client-playable-player-projectiles-damage-amount-amount-src-mq3-client-playable-player-projectiles-ml-341507792"></a>
### amount

```ml
amount
```

When constructing this record, `applyDamage` supplies `amount` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L97)

<a id="field-field-mq3-client-playable-player-projectiles-damage-awardedscore-awardedscore-src-mq3-client-playable-player-projectiles-ml-1921053180"></a>
### awardedScore

```ml
awardedScore
```

When constructing this record, `applyDamage` supplies `awarded` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L103)

<a id="field-field-mq3-client-playable-player-projectiles-damage-direct-direct-src-mq3-client-playable-player-projectiles-ml-1660200230"></a>
### direct

```ml
direct
```

When constructing this record, `applyDamage` supplies `direct` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L99)

<a id="field-field-mq3-client-playable-player-projectiles-damage-killed-killed-src-mq3-client-playable-player-projectiles-ml-234050534"></a>
### killed

```ml
killed
```

When constructing this record, `applyDamage` supplies `killed` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L101)

<a id="field-field-mq3-client-playable-player-projectiles-damage-targetindex-targetindex-src-mq3-client-playable-player-projectiles-ml-1427640452"></a>
### targetIndex

```ml
targetIndex
```

Index identifying the selected target in the owning target collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L95)
