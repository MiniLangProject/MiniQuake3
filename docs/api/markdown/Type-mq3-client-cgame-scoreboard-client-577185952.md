# `mq3.client.cgame_scoreboard.Client`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-scoreboard-ml-1090285247.md)

<a id="struct-struct-mq3-client-cgame-scoreboard-client-struct-client-src-mq3-client-cgame-scoreboard-ml-679682891"></a>
## Client

```ml
struct Client
```

Stores client game scoreboard client record, including `name`, `team`, `powerups`, `botSkill`, `handicap`, `wins` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L64)

## Members

<a id="field-field-mq3-client-cgame-scoreboard-client-botskill-botskill-src-mq3-client-cgame-scoreboard-ml-532776510"></a>
### botSkill

```ml
botSkill
```

Bot difficulty level; zero denotes a human player and native bot levels range from one to five.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L72)

<a id="field-field-mq3-client-cgame-scoreboard-client-handicap-handicap-src-mq3-client-cgame-scoreboard-ml-1986075178"></a>
### handicap

```ml
handicap
```

Player handicap setting used by the user-info and team-display paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L74)

<a id="field-field-mq3-client-cgame-scoreboard-client-infovalid-infovalid-src-mq3-client-cgame-scoreboard-ml-1719534102"></a>
### infoValid

```ml
infoValid
```

True when the client-information entry has been populated from valid server data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L80)

<a id="field-field-mq3-client-cgame-scoreboard-client-losses-losses-src-mq3-client-cgame-scoreboard-ml-674387976"></a>
### losses

```ml
losses
```

Tournament losses reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L78)

<a id="field-field-mq3-client-cgame-scoreboard-client-name-name-src-mq3-client-cgame-scoreboard-ml-1917914060"></a>
### name

```ml
name
```

Player name shown in a scoreboard row alongside score and team information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L66)

<a id="field-field-mq3-client-cgame-scoreboard-client-powerups-powerups-src-mq3-client-cgame-scoreboard-ml-982158772"></a>
### powerups

```ml
powerups
```

Player powerup bitmask consulted while drawing scoreboard status and flag indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L70)

<a id="field-field-mq3-client-cgame-scoreboard-client-score-score-src-mq3-client-cgame-scoreboard-ml-62012270"></a>
### score

```ml
score
```

Player score retained in the scoreboard client-information record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L82)

<a id="field-field-mq3-client-cgame-scoreboard-client-team-team-src-mq3-client-cgame-scoreboard-ml-1264694708"></a>
### team

```ml
team
```

Client team membership used to place the player in a team or spectator scoreboard section.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L68)

<a id="field-field-mq3-client-cgame-scoreboard-client-wins-wins-src-mq3-client-cgame-scoreboard-ml-1438496704"></a>
### wins

```ml
wins
```

Tournament victories reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L76)
