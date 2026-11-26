# `mq3.client.playable_match.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-match-ml-1136176865.md)

<a id="struct-struct-mq3-client-playable-match-state-struct-state-src-mq3-client-playable-match-ml-474937499"></a>
## State

```ml
struct State
```

Stores playable match state, including `phase`, `fragLimit`, `timeLimitMilliseconds`, `warmupMilliseconds`, `warmupStart`, `matchStart` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L33)

## Members

<a id="field-field-mq3-client-playable-match-state-fraglimit-fraglimit-src-mq3-client-playable-match-ml-936822006"></a>
### fragLimit

```ml
fragLimit
```

When constructing this record, `create` supplies `fragLimit` for this member. Used by `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L38)

<a id="field-field-mq3-client-playable-match-state-intermissionat-intermissionat-src-mq3-client-playable-match-ml-892471632"></a>
### intermissionAt

```ml
intermissionAt
```

When constructing this record, `create` supplies `0` for this member. Used by `start` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L53)

<a id="field-field-mq3-client-playable-match-state-matchstart-matchstart-src-mq3-client-playable-match-ml-564491532"></a>
### matchStart

```ml
matchStart
```

When constructing this record, `create` supplies `0` for this member. Used by `start` and `clock` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L50)

<a id="field-field-mq3-client-playable-match-state-phase-phase-src-mq3-client-playable-match-ml-883865042"></a>
### phase

```ml
phase
```

When constructing this record, `create` supplies `PHASE_WAITING` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L35)

<a id="field-field-mq3-client-playable-match-state-timelimitmilliseconds-timelimitmilliseconds-src-mq3-client-playable-match-ml-644166162"></a>
### timeLimitMilliseconds

```ml
timeLimitMilliseconds
```

When constructing this record, `create` supplies `timeLimitMinutes*60000` for this member. Used by `snapshot` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L41)

<a id="field-field-mq3-client-playable-match-state-warmupmilliseconds-warmupmilliseconds-src-mq3-client-playable-match-ml-2096763666"></a>
### warmupMilliseconds

```ml
warmupMilliseconds
```

When constructing this record, `create` supplies `warmupMilliseconds` for this member. Used by `start` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L44)

<a id="field-field-mq3-client-playable-match-state-warmupstart-warmupstart-src-mq3-client-playable-match-ml-2042524298"></a>
### warmupStart

```ml
warmupStart
```

When constructing this record, `create` supplies `0` for this member. Used by `start` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L47)

<a id="field-field-mq3-client-playable-match-state-winner-winner-src-mq3-client-playable-match-ml-353275620"></a>
### winner

```ml
winner
```

When constructing this record, `create` supplies `WINNER_NONE` for this member. Used by `start` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L56)
