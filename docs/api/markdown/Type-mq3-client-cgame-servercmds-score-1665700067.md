# `mq3.client.cgame_servercmds.Score`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-score-struct-score-src-mq3-client-cgame-servercmds-ml-1363566665"></a>
## Score

```ml
struct Score
```

Stores client game servercmds score record, including `client`, `score`, `ping`, `time`, `scoreFlags`, `powerups` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L108)

## Members

<a id="field-field-mq3-client-cgame-servercmds-score-accuracy-accuracy-src-mq3-client-cgame-servercmds-ml-459728729"></a>
### accuracy

```ml
accuracy
```

Percentage of successful weapon hits reported in the scoreboard data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L122)

<a id="field-field-mq3-client-cgame-servercmds-score-assist-assist-src-mq3-client-cgame-servercmds-ml-979755989"></a>
### assist

```ml
assist
```

When constructing this record, `parseScores` supplies `integer(args,base+11)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L132)

<a id="field-field-mq3-client-cgame-servercmds-score-captures-captures-src-mq3-client-cgame-servercmds-ml-1265314609"></a>
### captures

```ml
captures
```

Number of flag captures credited to this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L136)

<a id="field-field-mq3-client-cgame-servercmds-score-client-client-src-mq3-client-cgame-servercmds-ml-2031865653"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L110)

<a id="field-field-mq3-client-cgame-servercmds-score-defend-defend-src-mq3-client-cgame-servercmds-ml-1642773931"></a>
### defend

```ml
defend
```

When constructing this record, `parseScores` supplies `integer(args,base+10)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L130)

<a id="field-field-mq3-client-cgame-servercmds-score-excellent-excellent-src-mq3-client-cgame-servercmds-ml-277847835"></a>
### excellent

```ml
excellent
```

When constructing this record, `parseScores` supplies `integer(args,base+8)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L126)

<a id="field-field-mq3-client-cgame-servercmds-score-gauntlet-gauntlet-src-mq3-client-cgame-servercmds-ml-2133066663"></a>
### gauntlet

```ml
gauntlet
```

When constructing this record, `parseScores` supplies `integer(args,base+9)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L128)

<a id="field-field-mq3-client-cgame-servercmds-score-impressive-impressive-src-mq3-client-cgame-servercmds-ml-664209141"></a>
### impressive

```ml
impressive
```

When constructing this record, `parseScores` supplies `integer(args,base+7)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L124)

<a id="field-field-mq3-client-cgame-servercmds-score-perfect-perfect-src-mq3-client-cgame-servercmds-ml-1872979967"></a>
### perfect

```ml
perfect
```

True or nonzero when the player's result qualifies as a perfect game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L134)

<a id="field-field-mq3-client-cgame-servercmds-score-ping-ping-src-mq3-client-cgame-servercmds-ml-1573714411"></a>
### ping

```ml
ping
```

Player ping in milliseconds parsed from the server score command; -1 marks a connecting player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L114)

<a id="field-field-mq3-client-cgame-servercmds-score-powerups-powerups-src-mq3-client-cgame-servercmds-ml-417074813"></a>
### powerups

```ml
powerups
```

Powerup bitmask reported for this player by the server score command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L120)

<a id="field-field-mq3-client-cgame-servercmds-score-score-score-src-mq3-client-cgame-servercmds-ml-1912664507"></a>
### score

```ml
score
```

Player score parsed from the server score command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L112)

<a id="field-field-mq3-client-cgame-servercmds-score-scoreflags-scoreflags-src-mq3-client-cgame-servercmds-ml-72650725"></a>
### scoreFlags

```ml
scoreFlags
```

Flags supplied with the server's scoreboard entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L118)

<a id="field-field-mq3-client-cgame-servercmds-score-team-team-src-mq3-client-cgame-servercmds-ml-2094243533"></a>
### team

```ml
team
```

Team assigned to this parsed score entry from the corresponding client information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L138)

<a id="field-field-mq3-client-cgame-servercmds-score-time-time-src-mq3-client-cgame-servercmds-ml-1847551669"></a>
### time

```ml
time
```

Elapsed player connection time reported by the server for scoreboard presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L116)
