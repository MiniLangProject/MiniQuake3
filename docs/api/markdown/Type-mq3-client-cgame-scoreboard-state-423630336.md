# `mq3.client.cgame_scoreboard.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-scoreboard-ml-1090285247.md)

<a id="struct-struct-mq3-client-cgame-scoreboard-state-struct-state-src-mq3-client-cgame-scoreboard-ml-1851794095"></a>
## State

```ml
struct State
```

Stores client game scoreboard state, including `time`, `scoresRequestTime`, `showScores`, `numScores`, `scoreFadeTime`, `paused` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L85)

## Members

<a id="field-field-mq3-client-cgame-scoreboard-state-clientnum-clientnum-src-mq3-client-cgame-scoreboard-ml-2019267186"></a>
### clientNum

```ml
clientNum
```

Local client slot used to highlight and retain the corresponding scoreboard row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L109)

<a id="field-field-mq3-client-cgame-scoreboard-state-clients-clients-src-mq3-client-cgame-scoreboard-ml-703222186"></a>
### clients

```ml
clients
```

Client identity and team records used to render scoreboard entries by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L126)

<a id="field-field-mq3-client-cgame-scoreboard-state-deferredplayerloading-deferredplayerloading-src-mq3-client-cgame-scoreboard-ml-399212262"></a>
### deferredPlayerLoading

```ml
deferredPlayerLoading
```

True while player media is scheduled for deferred registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L120)

<a id="field-field-mq3-client-cgame-scoreboard-state-gametype-gametype-src-mq3-client-cgame-scoreboard-ml-861570102"></a>
### gametype

```ml
gametype
```

Game-rule identifier selecting tournament, team, and single-player scoreboard behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L99)

<a id="field-field-mq3-client-cgame-scoreboard-state-killername-killername-src-mq3-client-cgame-scoreboard-ml-1832421054"></a>
### killerName

```ml
killerName
```

Display name of the player responsible for the local player's latest death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L105)

<a id="field-field-mq3-client-cgame-scoreboard-state-motd-motd-src-mq3-client-cgame-scoreboard-ml-606121774"></a>
### motd

```ml
motd
```

When constructing this record, `state` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L122)

<a id="field-field-mq3-client-cgame-scoreboard-state-numscores-numscores-src-mq3-client-cgame-scoreboard-ml-79344994"></a>
### numScores

```ml
numScores
```

Number of valid scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L93)

<a id="field-field-mq3-client-cgame-scoreboard-state-paused-paused-src-mq3-client-cgame-scoreboard-ml-942436662"></a>
### paused

```ml
paused
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L97)

<a id="field-field-mq3-client-cgame-scoreboard-state-playerscore-playerscore-src-mq3-client-cgame-scoreboard-ml-980720806"></a>
### playerScore

```ml
playerScore
```

Viewed player's score displayed in the placement message above the scoreboard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L116)

<a id="field-field-mq3-client-cgame-scoreboard-state-playerteam-playerteam-src-mq3-client-cgame-scoreboard-ml-1324242254"></a>
### playerTeam

```ml
playerTeam
```

When constructing this record, `state` supplies `TEAM_FREE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L111)

<a id="field-field-mq3-client-cgame-scoreboard-state-pmtype-pmtype-src-mq3-client-cgame-scoreboard-ml-2033365612"></a>
### pmType

```ml
pmType
```

Viewed player's movement mode, used to show the scoreboard after death and during intermission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L101)

<a id="field-field-mq3-client-cgame-scoreboard-state-rank-rank-src-mq3-client-cgame-scoreboard-ml-317885294"></a>
### rank

```ml
rank
```

Zero-based player rank, including the tied-rank flag, used to compose the scoreboard's placement message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L114)

<a id="field-field-mq3-client-cgame-scoreboard-state-readymask-readymask-src-mq3-client-cgame-scoreboard-ml-586216758"></a>
### readyMask

```ml
readyMask
```

Client-slot bitset that marks scoreboard rows with READY during intermission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L118)

<a id="field-field-mq3-client-cgame-scoreboard-state-scorefadetime-scorefadetime-src-mq3-client-cgame-scoreboard-ml-508177790"></a>
### scoreFadeTime

```ml
scoreFadeTime
```

Timestamp used to fade the scoreboard after its display request ends.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L95)

<a id="field-field-mq3-client-cgame-scoreboard-state-scores-scores-src-mq3-client-cgame-scoreboard-ml-1106914160"></a>
### scores

```ml
scores
```

Scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L124)

<a id="field-field-mq3-client-cgame-scoreboard-state-scoresrequesttime-scoresrequesttime-src-mq3-client-cgame-scoreboard-ml-840711418"></a>
### scoresRequestTime

```ml
scoresRequestTime
```

Timestamp of the most recent request for updated server scores.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L89)

<a id="field-field-mq3-client-cgame-scoreboard-state-showscores-showscores-src-mq3-client-cgame-scoreboard-ml-1501316422"></a>
### showScores

```ml
showScores
```

True while the player explicitly requests the scoreboard overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L91)

<a id="field-field-mq3-client-cgame-scoreboard-state-teamscores-teamscores-src-mq3-client-cgame-scoreboard-ml-399523806"></a>
### teamScores

```ml
teamScores
```

Current score totals indexed by the two competing teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L107)

<a id="field-field-mq3-client-cgame-scoreboard-state-time-time-src-mq3-client-cgame-scoreboard-ml-1743179620"></a>
### time

```ml
time
```

Client-game timestamp in milliseconds used when drawing and fading the scoreboard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L87)

<a id="field-field-mq3-client-cgame-scoreboard-state-warmup-warmup-src-mq3-client-cgame-scoreboard-ml-30996026"></a>
### warmup

```ml
warmup
```

Warmup deadline or state supplied by the server's warmup configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L103)
