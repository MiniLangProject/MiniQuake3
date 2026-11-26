# `mq3.game.rankings.Client`

[Home](README.md) · [Source file](File-src-mq3-game-rankings-ml-1165926525.md)

<a id="struct-struct-mq3-game-rankings-client-struct-client-src-mq3-game-rankings-ml-1386156627"></a>
## Client

```ml
struct Client
```

`Client` record for rankings, containing `present`, `inuse`, `bot`, `name` and `team` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L260)

## Members

<a id="field-field-mq3-game-rankings-client-bot-bot-src-mq3-game-rankings-ml-1527807122"></a>
### bot

```ml
bot
```

Nonzero when the represented client is an AI-controlled bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L266)

<a id="field-field-mq3-game-rankings-client-entertime-entertime-src-mq3-game-rankings-ml-677697350"></a>
### enterTime

```ml
enterTime
```

Game timestamp at which the client entered play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L276)

<a id="field-field-mq3-game-rankings-client-inuse-inuse-src-mq3-game-rankings-ml-1903705998"></a>
### inuse

```ml
inuse
```

Nonzero when this entity, client, or bot record currently represents a live allocated object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L264)

<a id="field-field-mq3-game-rankings-client-matchrating-matchrating-src-mq3-game-rankings-ml-420580054"></a>
### matchRating

```ml
matchRating
```

Rating value retained for the current player/match report.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L280)

<a id="field-field-mq3-game-rankings-client-matchtime-matchtime-src-mq3-game-rankings-ml-352736202"></a>
### matchTime

```ml
matchTime
```

Time value attributed to the current match in ranking reports.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L282)

<a id="field-field-mq3-game-rankings-client-name-name-src-mq3-game-rankings-ml-829689360"></a>
### name

```ml
name
```

Player name used by ranking and administrative messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L268)

<a id="field-field-mq3-game-rankings-client-present-present-src-mq3-game-rankings-ml-329451310"></a>
### present

```ml
present
```

Nonzero when the client is present in the ranking/session snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L262)

<a id="field-field-mq3-game-rankings-client-spectatorstate-spectatorstate-src-mq3-game-rankings-ml-100051310"></a>
### spectatorState

```ml
spectatorState
```

Spectator mode selected from the SPECTATOR_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L274)

<a id="field-field-mq3-game-rankings-client-status-status-src-mq3-game-rankings-ml-1130480846"></a>
### status

```ml
status
```

Current QGR_STATUS_* state returned by the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L272)

<a id="field-field-mq3-game-rankings-client-team-team-src-mq3-game-rankings-ml-65559024"></a>
### team

```ml
team
```

Team assignment associated with the client, bot, or action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L270)

<a id="field-field-mq3-game-rankings-client-weaponchangetime-weaponchangetime-src-mq3-game-rankings-ml-384295376"></a>
### weaponChangeTime

```ml
weaponChangeTime
```

Timestamp of the most recent weapon change.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L278)
