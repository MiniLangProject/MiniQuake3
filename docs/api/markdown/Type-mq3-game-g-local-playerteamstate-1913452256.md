# `mq3.game.g_local.PlayerTeamState`

[Home](README.md) · [Source file](File-src-mq3-game-g-local-ml-1293969097.md)

<a id="struct-struct-mq3-game-g-local-playerteamstate-struct-playerteamstate-src-mq3-game-g-local-ml-1413449183"></a>
## PlayerTeamState

```ml
struct PlayerTeamState
```

Managed mirrors for the records which are independent from the much larger live Entity/Client/Level aggregates.  Opaque engine records are retained as ordinary values, just as the other MiniLang game facades do.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L102)

## Members

<a id="field-field-mq3-game-g-local-playerteamstate-assists-assists-src-mq3-game-g-local-ml-1331264510"></a>
### assists

```ml
assists
```

Number of capture assists credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L118)

<a id="field-field-mq3-game-g-local-playerteamstate-basedefense-basedefense-src-mq3-game-g-local-ml-1287385702"></a>
### basedefense

```ml
basedefense
```

Count of base-defense awards credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L110)

<a id="field-field-mq3-game-g-local-playerteamstate-captures-captures-src-mq3-game-g-local-ml-318016348"></a>
### captures

```ml
captures
```

Number of flag captures credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L108)

<a id="field-field-mq3-game-g-local-playerteamstate-carrierdefense-carrierdefense-src-mq3-game-g-local-ml-1333490574"></a>
### carrierdefense

```ml
carrierdefense
```

Count of flag-carrier defense awards credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L112)

<a id="field-field-mq3-game-g-local-playerteamstate-flagrecovery-flagrecovery-src-mq3-game-g-local-ml-1786906656"></a>
### flagrecovery

```ml
flagrecovery
```

Number of own-flag recoveries credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L114)

<a id="field-field-mq3-game-g-local-playerteamstate-flagsince-flagsince-src-mq3-game-g-local-ml-1518704498"></a>
### flagsince

```ml
flagsince
```

Timestamp at which the player started carrying the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L124)

<a id="field-field-mq3-game-g-local-playerteamstate-fragcarrier-fragcarrier-src-mq3-game-g-local-ml-452487426"></a>
### fragcarrier

```ml
fragcarrier
```

Number of enemy flag-carrier kills credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L116)

<a id="field-field-mq3-game-g-local-playerteamstate-lastfraggedcarrier-lastfraggedcarrier-src-mq3-game-g-local-ml-764500158"></a>
### lastfraggedcarrier

```ml
lastfraggedcarrier
```

Timestamp at which this player last killed an enemy flag carrier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L126)

<a id="field-field-mq3-game-g-local-playerteamstate-lasthurtcarrier-lasthurtcarrier-src-mq3-game-g-local-ml-1306006038"></a>
### lasthurtcarrier

```ml
lasthurtcarrier
```

Timestamp at which this player last damaged the flag carrier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L120)

<a id="field-field-mq3-game-g-local-playerteamstate-lastreturnedflag-lastreturnedflag-src-mq3-game-g-local-ml-1371694068"></a>
### lastreturnedflag

```ml
lastreturnedflag
```

Timestamp at which the player last returned its team flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L122)

<a id="field-field-mq3-game-g-local-playerteamstate-location-location-src-mq3-game-g-local-ml-651151388"></a>
### location

```ml
location
```

Team-location identifier associated with the player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L106)

<a id="field-field-mq3-game-g-local-playerteamstate-state-state-src-mq3-game-g-local-ml-176458138"></a>
### state

```ml
state
```

Team participation state selected from TEAM_BEGIN and TEAM_ACTIVE.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L104)
