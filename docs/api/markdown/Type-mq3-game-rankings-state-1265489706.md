# `mq3.game.rankings.State`

[Home](README.md) · [Source file](File-src-mq3-game-rankings-ml-1165926525.md)

<a id="struct-struct-mq3-game-rankings-state-struct-state-src-mq3-game-rankings-ml-466280959"></a>
## State

```ml
struct State
```

`State` record for rankings, containing `warmupTime`, `time`, `framenum`, `maxclients` and `gametype` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L313)

## Members

<a id="field-field-mq3-game-rankings-state-actions-actions-src-mq3-game-rankings-ml-1140610154"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L335)

<a id="field-field-mq3-game-rankings-state-active-active-src-mq3-game-rankings-ml-2027326926"></a>
### active

```ml
active
```

Nonzero while the ranking service is active for this match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L349)

<a id="field-field-mq3-game-rankings-state-clients-clients-src-mq3-game-rankings-ml-1889683426"></a>
### clients

```ml
clients
```

Client records indexed by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L331)

<a id="field-field-mq3-game-rankings-state-cvars-cvars-src-mq3-game-rankings-ml-1409774674"></a>
### cvars

```ml
cvars
```

Console-variable registry or pending console-variable updates used by the module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L337)

<a id="field-field-mq3-game-rankings-state-fraglimit-fraglimit-src-mq3-game-rankings-ml-171425122"></a>
### fraglimit

```ml
fraglimit
```

Configured score/frag threshold that ends the match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L325)

<a id="field-field-mq3-game-rankings-state-framenum-framenum-src-mq3-game-rankings-ml-866937512"></a>
### framenum

```ml
framenum
```

Game frames processed since level initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L319)

<a id="field-field-mq3-game-rankings-state-gametype-gametype-src-mq3-game-rankings-ml-494580134"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for classifying the active match in ranking reports.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L323)

<a id="field-field-mq3-game-rankings-state-initialized-initialized-src-mq3-game-rankings-ml-1001048158"></a>
### initialized

```ml
initialized
```

Nonzero after the game subsystem completes initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L347)

<a id="field-field-mq3-game-rankings-state-intermissiontime-intermissiontime-src-mq3-game-rankings-ml-340699156"></a>
### intermissiontime

```ml
intermissiontime
```

Timestamp at which the intermission began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L329)

<a id="field-field-mq3-game-rankings-state-lastattacker-lastattacker-src-mq3-game-rankings-ml-890486432"></a>
### lastAttacker

```ml
lastAttacker
```

Attacker/client identifier retained from the last reported combat event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L343)

<a id="field-field-mq3-game-rankings-state-lastframe-lastframe-src-mq3-game-rankings-ml-1599107262"></a>
### lastFrame

```ml
lastFrame
```

Most recent frame number processed by ranking/reporting state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L339)

<a id="field-field-mq3-game-rankings-state-lastmod-lastmod-src-mq3-game-rankings-ml-598647974"></a>
### lastMod

```ml
lastMod
```

Damage-cause identifier retained from the last reported combat event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L345)

<a id="field-field-mq3-game-rankings-state-lastself-lastself-src-mq3-game-rankings-ml-1407621430"></a>
### lastSelf

```ml
lastSelf
```

Victim/client identifier retained from the last reported combat event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L341)

<a id="field-field-mq3-game-rankings-state-maxclients-maxclients-src-mq3-game-rankings-ml-2119153318"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L321)

<a id="field-field-mq3-game-rankings-state-rankbeginfn-rankbeginfn-src-mq3-game-rankings-ml-70186778"></a>
### rankBeginFn

```ml
rankBeginFn
```

Injected callback for rank begin; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L357)

<a id="field-field-mq3-game-rankings-state-rankpollfn-rankpollfn-src-mq3-game-rankings-ml-1970123684"></a>
### rankPollFn

```ml
rankPollFn
```

Injected callback for rank poll; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L359)

<a id="field-field-mq3-game-rankings-state-rankresetfn-rankresetfn-src-mq3-game-rankings-ml-1854991026"></a>
### rankResetFn

```ml
rankResetFn
```

Injected callback for rank reset; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L361)

<a id="field-field-mq3-game-rankings-state-reportintfn-reportintfn-src-mq3-game-rankings-ml-1465358110"></a>
### reportIntFn

```ml
reportIntFn
```

Injected callback for report int; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L351)

<a id="field-field-mq3-game-rankings-state-reports-reports-src-mq3-game-rankings-ml-377914150"></a>
### reports

```ml
reports
```

Ranking reports queued for or emitted to the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L333)

<a id="field-field-mq3-game-rankings-state-reportstrfn-reportstrfn-src-mq3-game-rankings-ml-1480674714"></a>
### reportStrFn

```ml
reportStrFn
```

Injected callback for report str; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L353)

<a id="field-field-mq3-game-rankings-state-statusfn-statusfn-src-mq3-game-rankings-ml-539936214"></a>
### statusFn

```ml
statusFn
```

Injected callback for status; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L355)

<a id="field-field-mq3-game-rankings-state-time-time-src-mq3-game-rankings-ml-936647872"></a>
### time

```ml
time
```

Current server time supplied to ranking calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L317)

<a id="field-field-mq3-game-rankings-state-timelimit-timelimit-src-mq3-game-rankings-ml-1493990510"></a>
### timelimit

```ml
timelimit
```

Configured match time limit in minutes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L327)

<a id="field-field-mq3-game-rankings-state-warmuptime-warmuptime-src-mq3-game-rankings-ml-145666624"></a>
### warmupTime

```ml
warmupTime
```

Warmup timing value supplied to ranking/match state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rankings.ml#L315)
