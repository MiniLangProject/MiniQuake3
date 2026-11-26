# `mq3.game.bot_voice_commands.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-voice-commands-ml-1061280133.md)

<a id="struct-struct-mq3-game-bot-voice-commands-state-struct-state-src-mq3-game-bot-voice-commands-ml-1041873415"></a>
## State

```ml
struct State
```

`State` record for bot voice commands, containing `gametype`, `missionpack`, `teamplay`, `now` and `randomValue` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L149)

## Members

<a id="field-field-mq3-game-bot-voice-commands-state-actions-actions-src-mq3-game-bot-voice-commands-ml-167981810"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L191)

<a id="field-field-mq3-game-bot-voice-commands-state-blueflag-blueflag-src-mq3-game-bot-voice-commands-ml-800960942"></a>
### blueFlag

```ml
blueFlag
```

Goal/entity reference for the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L163)

<a id="field-field-mq3-game-bot-voice-commands-state-blueobelisk-blueobelisk-src-mq3-game-bot-voice-commands-ml-1131671554"></a>
### blueObelisk

```ml
blueObelisk
```

Goal/entity reference for the blue team obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L169)

<a id="field-field-mq3-game-bot-voice-commands-state-clientteams-clientteams-src-mq3-game-bot-voice-commands-ml-424084218"></a>
### clientTeams

```ml
clientTeams
```

Team assignments indexed by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L181)

<a id="field-field-mq3-game-bot-voice-commands-state-easynames-easynames-src-mq3-game-bot-voice-commands-ml-1373319214"></a>
### easyNames

```ml
easyNames
```

Simplified names used to match bot/player command references.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L173)

<a id="field-field-mq3-game-bot-voice-commands-state-entityinfos-entityinfos-src-mq3-game-bot-voice-commands-ml-951029194"></a>
### entityInfos

```ml
entityInfos
```

Botlib entity-information records used for tactical queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L175)

<a id="field-field-mq3-game-bot-voice-commands-state-flagcarrier-flagcarrier-src-mq3-game-bot-voice-commands-ml-852662294"></a>
### flagCarrier

```ml
flagCarrier
```

Client/entity currently carrying the flag of interest.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L185)

<a id="field-field-mq3-game-bot-voice-commands-state-gametype-gametype-src-mq3-game-bot-voice-commands-ml-219679894"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for interpreting voice orders for the active team game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L151)

<a id="field-field-mq3-game-bot-voice-commands-state-hostactionfn-hostactionfn-src-mq3-game-bot-voice-commands-ml-478703214"></a>
### hostActionFn

```ml
hostActionFn
```

Injected callback for host action; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L193)

<a id="field-field-mq3-game-bot-voice-commands-state-missionpack-missionpack-src-mq3-game-bot-voice-commands-ml-1786432830"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L153)

<a id="field-field-mq3-game-bot-voice-commands-state-names-names-src-mq3-game-bot-voice-commands-ml-637759502"></a>
### names

```ml
names
```

Name strings indexed by the corresponding state-table entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L171)

<a id="field-field-mq3-game-bot-voice-commands-state-neutralflag-neutralflag-src-mq3-game-bot-voice-commands-ml-1286493738"></a>
### neutralFlag

```ml
neutralFlag
```

Goal/entity reference for the neutral flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L165)

<a id="field-field-mq3-game-bot-voice-commands-state-notleader-notleader-src-mq3-game-bot-voice-commands-ml-1435209562"></a>
### notLeader

```ml
notLeader
```

Markers identifying clients excluded from team-leader selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L183)

<a id="field-field-mq3-game-bot-voice-commands-state-now-now-src-mq3-game-bot-voice-commands-ml-1280996714"></a>
### now

```ml
now
```

Current clock value supplied to the bot decision step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L157)

<a id="field-field-mq3-game-bot-voice-commands-state-pointareas-pointareas-src-mq3-game-bot-voice-commands-ml-176144082"></a>
### pointAreas

```ml
pointAreas
```

AAS area results associated with sampled world points.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L177)

<a id="field-field-mq3-game-bot-voice-commands-state-randomvalue-randomvalue-src-mq3-game-bot-voice-commands-ml-68625174"></a>
### randomValue

```ml
randomValue
```

Deterministic random input supplied to the current bot decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L159)

<a id="field-field-mq3-game-bot-voice-commands-state-redflag-redflag-src-mq3-game-bot-voice-commands-ml-527134910"></a>
### redFlag

```ml
redFlag
```

Goal/entity reference for the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L161)

<a id="field-field-mq3-game-bot-voice-commands-state-redobelisk-redobelisk-src-mq3-game-bot-voice-commands-ml-658892758"></a>
### redObelisk

```ml
redObelisk
```

Goal/entity reference for the red team obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L167)

<a id="field-field-mq3-game-bot-voice-commands-state-taskpreferences-taskpreferences-src-mq3-game-bot-voice-commands-ml-1499476562"></a>
### taskPreferences

```ml
taskPreferences
```

Team-task preference values indexed by client or category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L179)

<a id="field-field-mq3-game-bot-voice-commands-state-teamplay-teamplay-src-mq3-game-bot-voice-commands-ml-1967631396"></a>
### teamplay

```ml
teamplay
```

Nonzero when the active game mode uses teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L155)

<a id="field-field-mq3-game-bot-voice-commands-state-timeindex-timeindex-src-mq3-game-bot-voice-commands-ml-551897838"></a>
### timeIndex

```ml
timeIndex
```

Next position in the supplied deterministic time sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L187)

<a id="field-field-mq3-game-bot-voice-commands-state-timevalues-timevalues-src-mq3-game-bot-voice-commands-ml-1459482088"></a>
### timeValues

```ml
timeValues
```

Deterministic clock values supplied to the bot/game adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L189)
