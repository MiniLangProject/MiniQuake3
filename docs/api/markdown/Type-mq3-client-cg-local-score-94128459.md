# `mq3.client.cg_local.Score`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-score-struct-score-src-mq3-client-cg-local-ml-1390219249"></a>
## Score

```ml
struct Score
```

Stores client game local score record, including `client`, `score`, `ping`, `time`, `scoreFlags`, `powerUps` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L349)

## Members

<a id="field-field-mq3-client-cg-local-score-accuracy-accuracy-src-mq3-client-cg-local-ml-90660813"></a>
### accuracy

```ml
accuracy
```

Percentage of successful weapon hits reported in the scoreboard data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L363)

<a id="field-field-mq3-client-cg-local-score-assistcount-assistcount-src-mq3-client-cg-local-ml-1496239999"></a>
### assistCount

```ml
assistCount
```

Number of assist awards reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L373)

<a id="field-field-mq3-client-cg-local-score-captures-captures-src-mq3-client-cg-local-ml-1590020565"></a>
### captures

```ml
captures
```

Number of flag captures credited to this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L375)

<a id="field-field-mq3-client-cg-local-score-client-client-src-mq3-client-cg-local-ml-1555683161"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L351)

<a id="field-field-mq3-client-cg-local-score-defendcount-defendcount-src-mq3-client-cg-local-ml-775359843"></a>
### defendCount

```ml
defendCount
```

Number of defense awards reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L371)

<a id="field-field-mq3-client-cg-local-score-excellentcount-excellentcount-src-mq3-client-cg-local-ml-1007233385"></a>
### excellentCount

```ml
excellentCount
```

Number of excellent awards reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L367)

<a id="field-field-mq3-client-cg-local-score-guantletcount-guantletcount-src-mq3-client-cg-local-ml-489560159"></a>
### guantletCount

```ml
guantletCount
```

Number of gauntlet awards reported for this player; spelling follows the native record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L369)

<a id="field-field-mq3-client-cg-local-score-impressivecount-impressivecount-src-mq3-client-cg-local-ml-1390244187"></a>
### impressiveCount

```ml
impressiveCount
```

Number of impressive awards reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L365)

<a id="field-field-mq3-client-cg-local-score-perfect-perfect-src-mq3-client-cg-local-ml-570474467"></a>
### perfect

```ml
perfect
```

True or nonzero when the player's result qualifies as a perfect game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L377)

<a id="field-field-mq3-client-cg-local-score-ping-ping-src-mq3-client-cg-local-ml-1481015183"></a>
### ping

```ml
ping
```

Player ping value in the shared client-game scoreboard record, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L355)

<a id="field-field-mq3-client-cg-local-score-powerups-powerups-src-mq3-client-cg-local-ml-124518321"></a>
### powerUps

```ml
powerUps
```

Powerup bitset supplied with the scoreboard entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L361)

<a id="field-field-mq3-client-cg-local-score-score-score-src-mq3-client-cg-local-ml-411286207"></a>
### score

```ml
score
```

Player score stored in the shared client-game score-list entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L353)

<a id="field-field-mq3-client-cg-local-score-scoreflags-scoreflags-src-mq3-client-cg-local-ml-778485993"></a>
### scoreFlags

```ml
scoreFlags
```

Flags supplied with the server's scoreboard entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L359)

<a id="field-field-mq3-client-cg-local-score-team-team-src-mq3-client-cg-local-ml-1067821601"></a>
### team

```ml
team
```

Team identifier retained in the native-compatible scoreboard entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L379)

<a id="field-field-mq3-client-cg-local-score-time-time-src-mq3-client-cg-local-ml-963949209"></a>
### time

```ml
time
```

Elapsed player connection time reported by the server for scoreboard presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L357)
