# `mq3.game.ai_team.State`

[Home](README.md) · [Source file](File-src-mq3-game-ai-team-ml-162745936.md)

<a id="struct-struct-mq3-game-ai-team-state-struct-state-src-mq3-game-ai-team-ml-2027203915"></a>
## State

```ml
struct State
```

`State` record for ai team, containing `helper`, `gametype`, `now`, `randomValue` and `maxclients` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L53)

## Members

<a id="field-field-mq3-game-ai-team-state-actions-actions-src-mq3-game-ai-team-ml-1357422708"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L71)

<a id="field-field-mq3-game-ai-team-state-clientstatefn-clientstatefn-src-mq3-game-ai-team-ml-1280521908"></a>
### clientStateFn

```ml
clientStateFn
```

Injected callback for client state; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L77)

<a id="field-field-mq3-game-ai-team-state-configs-configs-src-mq3-game-ai-team-ml-1256228352"></a>
### configs

```ml
configs
```

Configuration records associated with tracked clients or bot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L67)

<a id="field-field-mq3-game-ai-team-state-gametype-gametype-src-mq3-game-ai-team-ml-37233248"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for team-leader strategy and distribution of team objectives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L57)

<a id="field-field-mq3-game-ai-team-state-helper-helper-src-mq3-game-ai-team-ml-762530304"></a>
### helper

```ml
helper
```

Injected helper object used by the bot decision adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L55)

<a id="field-field-mq3-game-ai-team-state-maxclients-maxclients-src-mq3-game-ai-team-ml-559440680"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L63)

<a id="field-field-mq3-game-ai-team-state-missionpack-missionpack-src-mq3-game-ai-team-ml-815146096"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L75)

<a id="field-field-mq3-game-ai-team-state-names-names-src-mq3-game-ai-team-ml-191411792"></a>
### names

```ml
names
```

Name strings indexed by the corresponding state-table entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L65)

<a id="field-field-mq3-game-ai-team-state-now-now-src-mq3-game-ai-team-ml-1721138388"></a>
### now

```ml
now
```

Current clock value supplied to the bot decision step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L59)

<a id="field-field-mq3-game-ai-team-state-pointareafn-pointareafn-src-mq3-game-ai-team-ml-1302048056"></a>
### pointAreaFn

```ml
pointAreaFn
```

Injected callback for point area; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L79)

<a id="field-field-mq3-game-ai-team-state-randomvalue-randomvalue-src-mq3-game-ai-team-ml-269210368"></a>
### randomValue

```ml
randomValue
```

Deterministic random input supplied to the current bot decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L61)

<a id="field-field-mq3-game-ai-team-state-suppressed-suppressed-src-mq3-game-ai-team-ml-827469556"></a>
### suppressed

```ml
suppressed
```

Nonzero when an action was deliberately withheld from dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L73)

<a id="field-field-mq3-game-ai-team-state-traveltimefn-traveltimefn-src-mq3-game-ai-team-ml-1211211950"></a>
### travelTimeFn

```ml
travelTimeFn
```

Injected callback for travel time; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L81)

<a id="field-field-mq3-game-ai-team-state-traveltimes-traveltimes-src-mq3-game-ai-team-ml-1056909808"></a>
### travelTimes

```ml
travelTimes
```

AAS travel times used to compare candidate routes or goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L69)
