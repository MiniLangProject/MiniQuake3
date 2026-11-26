# `mq3.client.playable_player_projectiles.Projectile`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-projectiles-ml-210819166.md)

<a id="struct-struct-mq3-client-playable-player-projectiles-projectile-struct-projectile-src-mq3-client-playable-player-projectiles-ml-1198758467"></a>
## Projectile

```ml
struct Projectile
```

Stores playable player projectiles projectile record, including `id`, `profile`, `origin`, `velocity`, `spawnedAt`, `expiresAt` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L58)

## Members

<a id="field-field-mq3-client-playable-player-projectiles-projectile-expiresat-expiresat-src-mq3-client-playable-player-projectiles-ml-1947440194"></a>
### expiresAt

```ml
expiresAt
```

When constructing this record, `spawnProfile` supplies `now+weaponProfile.lifetime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L72)

<a id="field-field-mq3-client-playable-player-projectiles-projectile-id-id-src-mq3-client-playable-player-projectiles-ml-170683784"></a>
### id

```ml
id
```

Stable effect identifier used to track or replace this projectile, particle, or mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L60)

<a id="field-field-mq3-client-playable-player-projectiles-projectile-origin-origin-src-mq3-client-playable-player-projectiles-ml-81566198"></a>
### origin

```ml
origin
```

Current world-space position from which the player's projectile advances its next movement step; updated after travel and collisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L65)

<a id="field-field-mq3-client-playable-player-projectiles-projectile-profile-profile-src-mq3-client-playable-player-projectiles-ml-1259552894"></a>
### profile

```ml
profile
```

When constructing this record, `spawnProfile` supplies `weaponProfile` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L62)

<a id="field-field-mq3-client-playable-player-projectiles-projectile-spawnedat-spawnedat-src-mq3-client-playable-player-projectiles-ml-2052467770"></a>
### spawnedAt

```ml
spawnedAt
```

When constructing this record, `spawnProfile` supplies `now` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L69)

<a id="field-field-mq3-client-playable-player-projectiles-projectile-stopped-stopped-src-mq3-client-playable-player-projectiles-ml-2074975818"></a>
### stopped

```ml
stopped
```

When constructing this record, `spawnProfile` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L74)

<a id="field-field-mq3-client-playable-player-projectiles-projectile-velocity-velocity-src-mq3-client-playable-player-projectiles-ml-2011710752"></a>
### velocity

```ml
velocity
```

Linear rate of change of position used by movement or effect integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L67)
