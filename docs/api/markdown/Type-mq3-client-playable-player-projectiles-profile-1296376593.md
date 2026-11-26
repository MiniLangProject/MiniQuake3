# `mq3.client.playable_player_projectiles.Profile`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-projectiles-ml-210819166.md)

<a id="struct-struct-mq3-client-playable-player-projectiles-profile-struct-profile-src-mq3-client-playable-player-projectiles-ml-214416051"></a>
## Profile

```ml
struct Profile
```

Stores playable player projectiles profile record, including `classname`, `style`, `speed`, `lifetime`, `directDamage`, `splashDamage` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L31)

## Members

<a id="field-field-mq3-client-playable-player-projectiles-profile-classname-classname-src-mq3-client-playable-player-projectiles-ml-487877844"></a>
### classname

```ml
classname
```

Weapon classname selecting the projectile's simulation and presentation profile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L33)

<a id="field-field-mq3-client-playable-player-projectiles-profile-directdamage-directdamage-src-mq3-client-playable-player-projectiles-ml-2078439544"></a>
### directDamage

```ml
directDamage
```

When constructing this record, `profile` supplies `100` for this member. Used by `damageAtImpact` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L43)

<a id="field-field-mq3-client-playable-player-projectiles-profile-eflags-eflags-src-mq3-client-playable-player-projectiles-ml-1943209992"></a>
### eFlags

```ml
eFlags
```

When constructing this record, `profile` supplies `0` for this member. Used by `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L55)

<a id="field-field-mq3-client-playable-player-projectiles-profile-gravity-gravity-src-mq3-client-playable-player-projectiles-ml-1751801328"></a>
### gravity

```ml
gravity
```

When constructing this record, `profile` supplies `false` for this member. Used by `stepEndpoint` and `velocityAfter` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L52)

<a id="field-field-mq3-client-playable-player-projectiles-profile-lifetime-lifetime-src-mq3-client-playable-player-projectiles-ml-1884846834"></a>
### lifetime

```ml
lifetime
```

When constructing this record, `profile` supplies `15000` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L40)

<a id="field-field-mq3-client-playable-player-projectiles-profile-speed-speed-src-mq3-client-playable-player-projectiles-ml-1607116804"></a>
### speed

```ml
speed
```

When constructing this record, `profile` supplies `900.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L38)

<a id="field-field-mq3-client-playable-player-projectiles-profile-splashdamage-splashdamage-src-mq3-client-playable-player-projectiles-ml-1614378848"></a>
### splashDamage

```ml
splashDamage
```

When constructing this record, `profile` supplies `100` for this member. Used by `damageAtImpact` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L46)

<a id="field-field-mq3-client-playable-player-projectiles-profile-splashradius-splashradius-src-mq3-client-playable-player-projectiles-ml-967752362"></a>
### splashRadius

```ml
splashRadius
```

When constructing this record, `profile` supplies `120.0` for this member. Used by `damageAtImpact` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L49)

<a id="field-field-mq3-client-playable-player-projectiles-profile-style-style-src-mq3-client-playable-player-projectiles-ml-386625340"></a>
### style

```ml
style
```

Projectile presentation style selected by the weapon profile and copied into trail and impact records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L36)
