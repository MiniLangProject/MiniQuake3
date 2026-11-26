# `mq3.game.g_local.ClientSession`

[Home](README.md) · [Source file](File-src-mq3-game-g-local-ml-1293969097.md)

<a id="struct-struct-mq3-game-g-local-clientsession-struct-clientsession-src-mq3-game-g-local-ml-1503162687"></a>
## ClientSession

```ml
struct ClientSession
```

`ClientSession` record for g local, containing `sessionTeam`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L129)

## Members

<a id="field-field-mq3-game-g-local-clientsession-losses-losses-src-mq3-game-g-local-ml-6504400"></a>
### losses

```ml
losses
```

Tournament losses retained in the client session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L141)

<a id="field-field-mq3-game-g-local-clientsession-sessionteam-sessionteam-src-mq3-game-g-local-ml-198051122"></a>
### sessionTeam

```ml
sessionTeam
```

Team assignment retained in the client session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L131)

<a id="field-field-mq3-game-g-local-clientsession-spectatorclient-spectatorclient-src-mq3-game-g-local-ml-1740732150"></a>
### spectatorClient

```ml
spectatorClient
```

Client slot being followed by a spectator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L137)

<a id="field-field-mq3-game-g-local-clientsession-spectatorstate-spectatorstate-src-mq3-game-g-local-ml-189522694"></a>
### spectatorState

```ml
spectatorState
```

Spectator mode selected from the SPECTATOR_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L135)

<a id="field-field-mq3-game-g-local-clientsession-spectatortime-spectatortime-src-mq3-game-g-local-ml-200402038"></a>
### spectatorTime

```ml
spectatorTime
```

Timestamp used to order spectators waiting to enter play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L133)

<a id="field-field-mq3-game-g-local-clientsession-teamleader-teamleader-src-mq3-game-g-local-ml-1490182798"></a>
### teamLeader

```ml
teamLeader
```

Nonzero when this client is the designated leader of its team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L143)

<a id="field-field-mq3-game-g-local-clientsession-wins-wins-src-mq3-game-g-local-ml-856329464"></a>
### wins

```ml
wins
```

Tournament wins retained in the client session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L139)
