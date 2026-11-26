# `mq3.game.bot_command_matches.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-command-matches-ml-960564493.md)

<a id="struct-struct-mq3-game-bot-command-matches-state-struct-state-src-mq3-game-bot-command-matches-ml-68712543"></a>
## State

```ml
struct State
```

`State` record for bot command matches, containing `teamplay`, `missionpack`, `gametype`, `now` and `randomValue` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L362)

## Members

<a id="field-field-mq3-game-bot-command-matches-state-actions-actions-src-mq3-game-bot-command-matches-ml-1369271098"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L408)

<a id="field-field-mq3-game-bot-command-matches-state-blueflag-blueflag-src-mq3-game-bot-command-matches-ml-1100614830"></a>
### blueFlag

```ml
blueFlag
```

Goal/entity reference for the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L396)

<a id="field-field-mq3-game-bot-command-matches-state-blueobelisk-blueobelisk-src-mq3-game-bot-command-matches-ml-2107804106"></a>
### blueObelisk

```ml
blueObelisk
```

Goal/entity reference for the blue team obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L402)

<a id="field-field-mq3-game-bot-command-matches-state-configs-configs-src-mq3-game-bot-command-matches-ml-1491927942"></a>
### configs

```ml
configs
```

Configuration records associated with tracked clients or bot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L380)

<a id="field-field-mq3-game-bot-command-matches-state-entityinfos-entityinfos-src-mq3-game-bot-command-matches-ml-624627082"></a>
### entityInfos

```ml
entityInfos
```

Botlib entity-information records used for tactical queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L382)

<a id="field-field-mq3-game-bot-command-matches-state-gametype-gametype-src-mq3-game-bot-command-matches-ml-1984516542"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for matching text orders to supported team objectives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L368)

<a id="field-field-mq3-game-bot-command-matches-state-hostactionfn-hostactionfn-src-mq3-game-bot-command-matches-ml-1553501022"></a>
### hostActionFn

```ml
hostActionFn
```

Injected callback for host action; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L410)

<a id="field-field-mq3-game-bot-command-matches-state-itemgoals-itemgoals-src-mq3-game-bot-command-matches-ml-1147665854"></a>
### itemGoals

```ml
itemGoals
```

Pickup goals available to bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L386)

<a id="field-field-mq3-game-bot-command-matches-state-matchstate-matchstate-src-mq3-game-bot-command-matches-ml-289559678"></a>
### matchState

```ml
matchState
```

Shared match-processing state used by bot command/chat matching.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L406)

<a id="field-field-mq3-game-bot-command-matches-state-maxclients-maxclients-src-mq3-game-bot-command-matches-ml-471999566"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L374)

<a id="field-field-mq3-game-bot-command-matches-state-missionpack-missionpack-src-mq3-game-bot-command-matches-ml-51352966"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L366)

<a id="field-field-mq3-game-bot-command-matches-state-names-names-src-mq3-game-bot-command-matches-ml-745792110"></a>
### names

```ml
names
```

Name strings indexed by the corresponding state-table entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L376)

<a id="field-field-mq3-game-bot-command-matches-state-neutralflag-neutralflag-src-mq3-game-bot-command-matches-ml-637364994"></a>
### neutralFlag

```ml
neutralFlag
```

Goal/entity reference for the neutral flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L398)

<a id="field-field-mq3-game-bot-command-matches-state-neutralobelisk-neutralobelisk-src-mq3-game-bot-command-matches-ml-732246178"></a>
### neutralObelisk

```ml
neutralObelisk
```

Goal/entity reference for the neutral harvester obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L404)

<a id="field-field-mq3-game-bot-command-matches-state-notleader-notleader-src-mq3-game-bot-command-matches-ml-2013760202"></a>
### notleader

```ml
notleader
```

Markers identifying clients excluded from team-leader selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L392)

<a id="field-field-mq3-game-bot-command-matches-state-now-now-src-mq3-game-bot-command-matches-ml-409502698"></a>
### now

```ml
now
```

Current clock value supplied to the bot decision step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L370)

<a id="field-field-mq3-game-bot-command-matches-state-pointareas-pointareas-src-mq3-game-bot-command-matches-ml-812574258"></a>
### pointAreas

```ml
pointAreas
```

AAS area results associated with sampled world points.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L384)

<a id="field-field-mq3-game-bot-command-matches-state-preferencenames-preferencenames-src-mq3-game-bot-command-matches-ml-1734867642"></a>
### preferenceNames

```ml
preferenceNames
```

Names of the supported bot team-task preferences.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L390)

<a id="field-field-mq3-game-bot-command-matches-state-randomvalue-randomvalue-src-mq3-game-bot-command-matches-ml-1229546038"></a>
### randomValue

```ml
randomValue
```

Deterministic random input supplied to the current bot decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L372)

<a id="field-field-mq3-game-bot-command-matches-state-redflag-redflag-src-mq3-game-bot-command-matches-ml-590477214"></a>
### redFlag

```ml
redFlag
```

Goal/entity reference for the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L394)

<a id="field-field-mq3-game-bot-command-matches-state-redobelisk-redobelisk-src-mq3-game-bot-command-matches-ml-2057331462"></a>
### redObelisk

```ml
redObelisk
```

Goal/entity reference for the red team obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L400)

<a id="field-field-mq3-game-bot-command-matches-state-taskpreferences-taskpreferences-src-mq3-game-bot-command-matches-ml-1479984434"></a>
### taskPreferences

```ml
taskPreferences
```

Team-task preference values indexed by client or category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L388)

<a id="field-field-mq3-game-bot-command-matches-state-teamplay-teamplay-src-mq3-game-bot-command-matches-ml-1512696800"></a>
### teamplay

```ml
teamplay
```

Nonzero when the active game mode uses teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L364)

<a id="field-field-mq3-game-bot-command-matches-state-teams-teams-src-mq3-game-bot-command-matches-ml-931550750"></a>
### teams

```ml
teams
```

Team identifiers indexed by tracked clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L378)

<a id="field-field-mq3-game-bot-command-matches-state-tracevisiblefn-tracevisiblefn-src-mq3-game-bot-command-matches-ml-340540380"></a>
### traceVisibleFn

```ml
traceVisibleFn
```

Injected callback for trace visible; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L412)

<a id="field-field-mq3-game-bot-command-matches-state-traveltimefn-traveltimefn-src-mq3-game-bot-command-matches-ml-1639728908"></a>
### travelTimeFn

```ml
travelTimeFn
```

Injected callback for travel time; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L414)
