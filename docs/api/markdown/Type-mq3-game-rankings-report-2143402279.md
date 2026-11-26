# `mq3.game.rankings.Report`

[Home](README.md) · [Source file](File-src-mq3-game-rankings-ml-1165926525.md)

<a id="struct-struct-mq3-game-rankings-report-struct-report-src-mq3-game-rankings-ml-1561227663"></a>
## Report

```ml
struct Report
```

`Report` record for rankings, containing `stringValue`, `index1`, `index2`, `key` and `value` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L285)

## Members

<a id="field-field-mq3-game-rankings-report-accum-accum-src-mq3-game-rankings-ml-1577843085"></a>
### accum

```ml
accum
```

Nonzero when the ranking value accumulates instead of replacing its predecessor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L299)

<a id="field-field-mq3-game-rankings-report-index1-index1-src-mq3-game-rankings-ml-1592600751"></a>
### index1

```ml
index1
```

Primary player/client index associated with the ranking report.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L289)

<a id="field-field-mq3-game-rankings-report-index2-index2-src-mq3-game-rankings-ml-1369954617"></a>
### index2

```ml
index2
```

Secondary player/client index associated with the ranking report.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L291)

<a id="field-field-mq3-game-rankings-report-key-key-src-mq3-game-rankings-ml-1454395105"></a>
### key

```ml
key
```

QGR_KEY_* identifier naming the reported ranking metric.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L293)

<a id="field-field-mq3-game-rankings-report-stringvalue-stringvalue-src-mq3-game-rankings-ml-1581978069"></a>
### stringValue

```ml
stringValue
```

Nonzero when the ranking report carries text instead of an integer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L287)

<a id="field-field-mq3-game-rankings-report-text-text-src-mq3-game-rankings-ml-853679599"></a>
### text

```ml
text
```

Text ranking value supplied when stringValue is true.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L297)

<a id="field-field-mq3-game-rankings-report-value-value-src-mq3-game-rankings-ml-772561977"></a>
### value

```ml
value
```

Integer ranking value supplied when stringValue is false.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L295)
