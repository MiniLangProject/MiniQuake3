# `mq3.client.baseq3_match_display.ScoreRow`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)

<a id="struct-struct-mq3-client-baseq3-match-display-scorerow-struct-scorerow-src-mq3-client-baseq3-match-display-ml-746744919"></a>
## ScoreRow

```ml
struct ScoreRow
```

Stores base Quake III match display score row record, including `name`, `score`, `deaths`, `localPlayer`, `red`, `green` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L76)

## Members

<a id="field-field-mq3-client-baseq3-match-display-scorerow-blue-blue-src-mq3-client-baseq3-match-display-ml-366352545"></a>
### blue

```ml
blue
```

Blue color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L90)

<a id="field-field-mq3-client-baseq3-match-display-scorerow-deaths-deaths-src-mq3-client-baseq3-match-display-ml-392419619"></a>
### deaths

```ml
deaths
```

When constructing this record, `scoreRows` supplies `playerDeaths` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L82)

<a id="field-field-mq3-client-baseq3-match-display-scorerow-green-green-src-mq3-client-baseq3-match-display-ml-85904457"></a>
### green

```ml
green
```

Green color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L88)

<a id="field-field-mq3-client-baseq3-match-display-scorerow-localplayer-localplayer-src-mq3-client-baseq3-match-display-ml-759227241"></a>
### localPlayer

```ml
localPlayer
```

When constructing this record, `scoreRows` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L84)

<a id="field-field-mq3-client-baseq3-match-display-scorerow-name-name-src-mq3-client-baseq3-match-display-ml-1991392055"></a>
### name

```ml
name
```

Player display name printed in this match-score row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L78)

<a id="field-field-mq3-client-baseq3-match-display-scorerow-red-red-src-mq3-client-baseq3-match-display-ml-1797601093"></a>
### red

```ml
red
```

Red color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L86)

<a id="field-field-mq3-client-baseq3-match-display-scorerow-score-score-src-mq3-client-baseq3-match-display-ml-1510576881"></a>
### score

```ml
score
```

Player score displayed in this match scoreboard row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_match_display.ml#L80)
