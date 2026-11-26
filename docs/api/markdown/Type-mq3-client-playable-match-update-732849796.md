# `mq3.client.playable_match.Update`

[Home](README.md) · [Source file](File-src-mq3-client-playable-match-ml-1136176865.md)

<a id="struct-struct-mq3-client-playable-match-update-struct-update-src-mq3-client-playable-match-ml-1606494283"></a>
## Update

```ml
struct Update
```

Stores playable match update record, including `phase`, `changed`, `message`, `playerScore`, `enemyScore`, `remainingSeconds` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L59)

## Members

<a id="field-field-mq3-client-playable-match-update-changed-changed-src-mq3-client-playable-match-ml-1019843440"></a>
### changed

```ml
changed
```

When constructing this record, `snapshot` supplies `changed` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L63)

<a id="field-field-mq3-client-playable-match-update-clock-clock-src-mq3-client-playable-match-ml-1778808132"></a>
### clock

```ml
clock
```

When constructing this record, `snapshot` supplies `clock(state,now)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L73)

<a id="field-field-mq3-client-playable-match-update-enemyscore-enemyscore-src-mq3-client-playable-match-ml-1941944316"></a>
### enemyScore

```ml
enemyScore
```

When constructing this record, `snapshot` supplies `enemyScore` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L69)

<a id="field-field-mq3-client-playable-match-update-message-message-src-mq3-client-playable-match-ml-1826492904"></a>
### message

```ml
message
```

When constructing this record, `snapshot` supplies `message` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L65)

<a id="field-field-mq3-client-playable-match-update-phase-phase-src-mq3-client-playable-match-ml-1674805092"></a>
### phase

```ml
phase
```

When constructing this record, `snapshot` supplies `state.phase` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L61)

<a id="field-field-mq3-client-playable-match-update-playerscore-playerscore-src-mq3-client-playable-match-ml-1140959900"></a>
### playerScore

```ml
playerScore
```

When constructing this record, `snapshot` supplies `playerScore` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L67)

<a id="field-field-mq3-client-playable-match-update-remainingseconds-remainingseconds-src-mq3-client-playable-match-ml-1112623018"></a>
### remainingSeconds

```ml
remainingSeconds
```

When constructing this record, `snapshot` supplies `remaining` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L71)
