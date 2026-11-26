# `mq3.client.cgame_main.Score`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-score-struct-score-src-mq3-client-cgame-main-ml-1297758663"></a>
## Score

```ml
struct Score
```

Stores client game main score record, including `client`, `team`, `score`, `time`, `ping`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L165)

## Members

<a id="field-field-mq3-client-cgame-main-score-client-client-src-mq3-client-cgame-main-ml-586638869"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L167)

<a id="field-field-mq3-client-cgame-main-score-ping-ping-src-mq3-client-cgame-main-ml-564003419"></a>
### ping

```ml
ping
```

Player latency value retained in the client-game score entry, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L175)

<a id="field-field-mq3-client-cgame-main-score-score-score-src-mq3-client-cgame-main-ml-7550343"></a>
### score

```ml
score
```

Player score retained in the client-game scoreboard entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L171)

<a id="field-field-mq3-client-cgame-main-score-team-team-src-mq3-client-cgame-main-ml-1875830637"></a>
### team

```ml
team
```

Team grouping associated with this score row in the client-game UI feeder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L169)

<a id="field-field-mq3-client-cgame-main-score-time-time-src-mq3-client-cgame-main-ml-1672034053"></a>
### time

```ml
time
```

Elapsed player connection time reported by the server for scoreboard presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L173)
