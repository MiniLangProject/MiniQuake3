# `mq3.client.cgame_scoreboard.Score`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-scoreboard-ml-1090285247.md)

<a id="struct-struct-mq3-client-cgame-scoreboard-score-struct-score-src-mq3-client-cgame-scoreboard-ml-1800755089"></a>
## Score

```ml
struct Score
```

Stores client game scoreboard score record, including `client`, `score`, `ping`, `time`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L53)

## Members

<a id="field-field-mq3-client-cgame-scoreboard-score-client-client-src-mq3-client-cgame-scoreboard-ml-280153157"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L55)

<a id="field-field-mq3-client-cgame-scoreboard-score-ping-ping-src-mq3-client-cgame-scoreboard-ml-912821431"></a>
### ping

```ml
ping
```

Player latency displayed in the scoreboard, in milliseconds; -1 displays the connecting label.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L59)

<a id="field-field-mq3-client-cgame-scoreboard-score-score-score-src-mq3-client-cgame-scoreboard-ml-1037827975"></a>
### score

```ml
score
```

Numeric player score rendered in this scoreboard entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L57)

<a id="field-field-mq3-client-cgame-scoreboard-score-time-time-src-mq3-client-cgame-scoreboard-ml-355629173"></a>
### time

```ml
time
```

Elapsed player connection time reported by the server for scoreboard presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L61)
