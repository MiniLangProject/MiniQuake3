# `mq3.client.playable_player.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-ml-625035251.md)

<a id="struct-struct-mq3-client-playable-player-state-struct-state-src-mq3-client-playable-player-ml-1473876903"></a>
## State

```ml
struct State
```

Stores playable player state, including `spawns`, `spawnIndex`, `position`, `yaw`, `health`, `maxHealth` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L37)

## Members

<a id="field-field-mq3-client-playable-player-state-alive-alive-src-mq3-client-playable-player-ml-1287953642"></a>
### alive

```ml
alive
```

True while the simulated player or target remains alive and can participate in gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L60)

<a id="field-field-mq3-client-playable-player-state-ammo-ammo-src-mq3-client-playable-player-ml-1398271650"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L56)

<a id="field-field-mq3-client-playable-player-state-armor-armor-src-mq3-client-playable-player-ml-1702245918"></a>
### armor

```ml
armor
```

Current local-player armor available to absorb incoming preview damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L54)

<a id="field-field-mq3-client-playable-player-state-deaths-deaths-src-mq3-client-playable-player-ml-327158476"></a>
### deaths

```ml
deaths
```

When constructing this record, `fromEntities` supplies `0` for this member. Used by `applyDamage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L63)

<a id="field-field-mq3-client-playable-player-state-health-health-src-mq3-client-playable-player-ml-253065050"></a>
### health

```ml
health
```

Current local-player health governing damage, death, and respawn in the playable preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L49)

<a id="field-field-mq3-client-playable-player-state-invulnerabilitymilliseconds-invulnerabilitymilliseconds-src-mq3-client-playable-player-ml-1542385590"></a>
### invulnerabilityMilliseconds

```ml
invulnerabilityMilliseconds
```

When constructing this record, `fromEntities` supplies `DEFAULT_INVULNERABILITY_MILLISECONDS` for this member. Used by `configure` and `pollRespawn` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L73)

<a id="field-field-mq3-client-playable-player-state-invulnerableuntil-invulnerableuntil-src-mq3-client-playable-player-ml-1056601702"></a>
### invulnerableUntil

```ml
invulnerableUntil
```

When constructing this record, `fromEntities` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L67)

<a id="field-field-mq3-client-playable-player-state-maxhealth-maxhealth-src-mq3-client-playable-player-ml-30539786"></a>
### maxHealth

```ml
maxHealth
```

When constructing this record, `fromEntities` supplies `DEFAULT_HEALTH` for this member. Used by `setStats` and `pollRespawn` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L52)

<a id="field-field-mq3-client-playable-player-state-position-position-src-mq3-client-playable-player-ml-1480306728"></a>
### position

```ml
position
```

When constructing this record, `fromEntities` supplies `[first.origin[0],first.origin[1],first.origin[2]]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L45)

<a id="field-field-mq3-client-playable-player-state-respawnat-respawnat-src-mq3-client-playable-player-ml-651642326"></a>
### respawnAt

```ml
respawnAt
```

Client simulation timestamp at which the entity becomes eligible to respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L65)

<a id="field-field-mq3-client-playable-player-state-respawnmilliseconds-respawnmilliseconds-src-mq3-client-playable-player-ml-1889100578"></a>
### respawnMilliseconds

```ml
respawnMilliseconds
```

When constructing this record, `fromEntities` supplies `DEFAULT_RESPAWN_MILLISECONDS` for this member. Used by `configure` and `applyDamage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L70)

<a id="field-field-mq3-client-playable-player-state-spawnindex-spawnindex-src-mq3-client-playable-player-ml-1856840372"></a>
### spawnIndex

```ml
spawnIndex
```

When constructing this record, `fromEntities` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L42)

<a id="field-field-mq3-client-playable-player-state-spawns-spawns-src-mq3-client-playable-player-ml-1254688846"></a>
### spawns

```ml
spawns
```

When constructing this record, `fromEntities` supplies `spawns` for this member. Used by `pollRespawn` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L40)

<a id="field-field-mq3-client-playable-player-state-weapon-weapon-src-mq3-client-playable-player-ml-1650307922"></a>
### weapon

```ml
weapon
```

Weapon classname restored and tracked with the local preview player loadout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L58)

<a id="field-field-mq3-client-playable-player-state-yaw-yaw-src-mq3-client-playable-player-ml-507045278"></a>
### yaw

```ml
yaw
```

When constructing this record, `fromEntities` supplies `first.yaw` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L47)
