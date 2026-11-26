# `mq3.server.rankings.RankedPlayer`

[Home](README.md) · [Source file](File-src-mq3-server-rankings-ml-1338987992.md)

<a id="struct-struct-mq3-server-rankings-rankedplayer-struct-rankedplayer-src-mq3-server-rankings-ml-1837278485"></a>
## RankedPlayer

```ml
struct RankedPlayer
```

RankedPlayer record for server.rankings, containing `context`, `gameId`, `match`, `playerId`, `token`, `status`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L72)

## Members

<a id="field-field-mq3-server-rankings-rankedplayer-context-context-src-mq3-server-rankings-ml-1127414967"></a>
### context

```ml
context
```

Open ranking-service context handle owned by this player, or zero after cleanup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L74)

<a id="field-field-mq3-server-rankings-rankedplayer-finalstatus-finalstatus-src-mq3-server-rankings-ml-458403439"></a>
### finalStatus

```ml
finalStatus
```

Status retained after the player leaves the ranked match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L86)

<a id="field-field-mq3-server-rankings-rankedplayer-gameid-gameid-src-mq3-server-rankings-ml-455963485"></a>
### gameId

```ml
gameId
```

Ranking-service game identifier associated with the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L76)

<a id="field-field-mq3-server-rankings-rankedplayer-match-match-src-mq3-server-rankings-ml-145333655"></a>
### match

```ml
match
```

Ranking-service match handle associated with the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L78)

<a id="field-field-mq3-server-rankings-rankedplayer-name-name-src-mq3-server-rankings-ml-218136565"></a>
### name

```ml
name
```

Player name registered with the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L90)

<a id="field-field-mq3-server-rankings-rankedplayer-playerid-playerid-src-mq3-server-rankings-ml-1647856199"></a>
### playerId

```ml
playerId
```

Persistent player identifier returned by the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L80)

<a id="field-field-mq3-server-rankings-rankedplayer-rank-rank-src-mq3-server-rankings-ml-1828147847"></a>
### rank

```ml
rank
```

Rank value assigned to the player by the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L88)

<a id="field-field-mq3-server-rankings-rankedplayer-status-status-src-mq3-server-rankings-ml-1275673591"></a>
### status

```ml
status
```

Current ranking-client authentication or participation status.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L84)

<a id="field-field-mq3-server-rankings-rankedplayer-token-token-src-mq3-server-rankings-ml-654005703"></a>
### token

```ml
token
```

Authentication token returned by the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L82)
