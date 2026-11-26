# `mq3.client.cgame_main.Client`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-client-struct-client-src-mq3-client-cgame-main-ml-1743989117"></a>
## Client

```ml
struct Client
```

Stores client game main client record, including `infoValid`, `team`, `name`, `powerups`, `botSkill`, `handicap` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L140)

## Members

<a id="field-field-mq3-client-cgame-main-client-botskill-botskill-src-mq3-client-cgame-main-ml-1767920128"></a>
### botSkill

```ml
botSkill
```

Bot difficulty level; zero denotes a human player and native bot levels range from one to five.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L150)

<a id="field-field-mq3-client-cgame-main-client-handicap-handicap-src-mq3-client-cgame-main-ml-589278516"></a>
### handicap

```ml
handicap
```

Player handicap setting used by the user-info and team-display paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L152)

<a id="field-field-mq3-client-cgame-main-client-infovalid-infovalid-src-mq3-client-cgame-main-ml-1847957412"></a>
### infoValid

```ml
infoValid
```

True when the client-information entry has been populated from valid server data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L142)

<a id="field-field-mq3-client-cgame-main-client-losses-losses-src-mq3-client-cgame-main-ml-1694821542"></a>
### losses

```ml
losses
```

Tournament losses reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L158)

<a id="field-field-mq3-client-cgame-main-client-name-name-src-mq3-client-cgame-main-ml-364899486"></a>
### name

```ml
name
```

Configured player name retained with the client-game startup and client-information state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L146)

<a id="field-field-mq3-client-cgame-main-client-powerups-powerups-src-mq3-client-cgame-main-ml-2085722274"></a>
### powerups

```ml
powerups
```

Player powerup bitmask retained with the client-game client-information record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L148)

<a id="field-field-mq3-client-cgame-main-client-score-score-src-mq3-client-cgame-main-ml-1413037324"></a>
### score

```ml
score
```

Reported player score retained with the client-game client-information entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L162)

<a id="field-field-mq3-client-cgame-main-client-team-team-src-mq3-client-cgame-main-ml-750952818"></a>
### team

```ml
team
```

Client team affiliation used by scoreboard feeders and player-status text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L144)

<a id="field-field-mq3-client-cgame-main-client-teamleader-teamleader-src-mq3-client-cgame-main-ml-1750156316"></a>
### teamLeader

```ml
teamLeader
```

True when this client is the designated leader of its team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L160)

<a id="field-field-mq3-client-cgame-main-client-teamtask-teamtask-src-mq3-client-cgame-main-ml-696274964"></a>
### teamTask

```ml
teamTask
```

Team-order role identifying the player's current tactical assignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L154)

<a id="field-field-mq3-client-cgame-main-client-wins-wins-src-mq3-client-cgame-main-ml-1283288714"></a>
### wins

```ml
wins
```

Tournament victories reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L156)
