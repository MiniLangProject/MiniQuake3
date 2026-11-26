# `mq3.game.bot_team_helpers.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-team-helpers-ml-2010714111.md)

<a id="struct-struct-mq3-game-bot-team-helpers-state-struct-state-src-mq3-game-bot-team-helpers-ml-634697367"></a>
## State

```ml
struct State
```

`State` record for bot team helpers, containing `names`, `preferenceNames`, `preferences`, `configs` and `maxclients` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L22)

## Members

<a id="field-field-mq3-game-bot-team-helpers-state-clientfromnamefn-clientfromnamefn-src-mq3-game-bot-team-helpers-ml-452533266"></a>
### clientFromNameFn

```ml
clientFromNameFn
```

Injected callback for client from name; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L36)

<a id="field-field-mq3-game-bot-team-helpers-state-configs-configs-src-mq3-game-bot-team-helpers-ml-421642454"></a>
### configs

```ml
configs
```

Configuration records associated with tracked clients or bot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L30)

<a id="field-field-mq3-game-bot-team-helpers-state-context-context-src-mq3-game-bot-team-helpers-ml-1861925094"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot team lookup, ordering, and team-chat callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L76)

<a id="field-field-mq3-game-bot-team-helpers-state-ctfbothatbasefn-ctfbothatbasefn-src-mq3-game-bot-team-helpers-ml-1083502974"></a>
### ctfBothAtBaseFn

```ml
ctfBothAtBaseFn
```

Injected callback for capture the flag both at base; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L47)

<a id="field-field-mq3-game-bot-team-helpers-state-ctfbothnotatbasefn-ctfbothnotatbasefn-src-mq3-game-bot-team-helpers-ml-750392972"></a>
### ctfBothNotAtBaseFn

```ml
ctfBothNotAtBaseFn
```

Injected callback for capture the flag both not at base; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L56)

<a id="field-field-mq3-game-bot-team-helpers-state-ctfenemynotatbasefn-ctfenemynotatbasefn-src-mq3-game-bot-team-helpers-ml-570262446"></a>
### ctfEnemyNotAtBaseFn

```ml
ctfEnemyNotAtBaseFn
```

Injected callback for capture the flag enemy not at base; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L50)

<a id="field-field-mq3-game-bot-team-helpers-state-ctfownnotatbasefn-ctfownnotatbasefn-src-mq3-game-bot-team-helpers-ml-210870582"></a>
### ctfOwnNotAtBaseFn

```ml
ctfOwnNotAtBaseFn
```

Injected callback for capture the flag own not at base; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L53)

<a id="field-field-mq3-game-bot-team-helpers-state-defendfn-defendfn-src-mq3-game-bot-team-helpers-ml-1450291074"></a>
### defendFn

```ml
defendFn
```

Injected callback for defend; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L70)

<a id="field-field-mq3-game-bot-team-helpers-state-enterchatfn-enterchatfn-src-mq3-game-bot-team-helpers-ml-746476658"></a>
### enterChatFn

```ml
enterChatFn
```

Injected callback for enter chat; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L42)

<a id="field-field-mq3-game-bot-team-helpers-state-entityinuse-entityinuse-src-mq3-game-bot-team-helpers-ml-854779750"></a>
### entityInUse

```ml
entityInUse
```

Per-entity markers identifying allocated game entity slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L62)

<a id="field-field-mq3-game-bot-team-helpers-state-entitysvflags-entitysvflags-src-mq3-game-bot-team-helpers-ml-106392866"></a>
### entitySvFlags

```ml
entitySvFlags
```

Server entity flags indexed by entity number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L64)

<a id="field-field-mq3-game-bot-team-helpers-state-gametype-gametype-src-mq3-game-bot-team-helpers-ml-384558942"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for team orders and capture-the-flag helper decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L72)

<a id="field-field-mq3-game-bot-team-helpers-state-getchatmessagefn-getchatmessagefn-src-mq3-game-bot-team-helpers-ml-1694155496"></a>
### getChatMessageFn

```ml
getChatMessageFn
```

Injected callback for get chat message; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L38)

<a id="field-field-mq3-game-bot-team-helpers-state-getclientpmtypefn-getclientpmtypefn-src-mq3-game-bot-team-helpers-ml-853092594"></a>
### getClientPmTypeFn

```ml
getClientPmTypeFn
```

Injected callback for get client pm type; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L74)

<a id="field-field-mq3-game-bot-team-helpers-state-initialchatfn-initialchatfn-src-mq3-game-bot-team-helpers-ml-1433408278"></a>
### initialChatFn

```ml
initialChatFn
```

Injected callback for initial chat; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L58)

<a id="field-field-mq3-game-bot-team-helpers-state-maxclients-maxclients-src-mq3-game-bot-team-helpers-ml-1569623438"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L32)

<a id="field-field-mq3-game-bot-team-helpers-state-names-names-src-mq3-game-bot-team-helpers-ml-34429054"></a>
### names

```ml
names
```

Name strings indexed by the corresponding state-table entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L24)

<a id="field-field-mq3-game-bot-team-helpers-state-notleader-notleader-src-mq3-game-bot-team-helpers-ml-1934011266"></a>
### notLeader

```ml
notLeader
```

Markers identifying clients excluded from team-leader selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L66)

<a id="field-field-mq3-game-bot-team-helpers-state-orderalwaysfn-orderalwaysfn-src-mq3-game-bot-team-helpers-ml-808118470"></a>
### orderAlwaysFn

```ml
orderAlwaysFn
```

Injected callback for order always; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L60)

<a id="field-field-mq3-game-bot-team-helpers-state-preferencenames-preferencenames-src-mq3-game-bot-team-helpers-ml-1507573906"></a>
### preferenceNames

```ml
preferenceNames
```

Names of the supported bot team-task preferences.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L26)

<a id="field-field-mq3-game-bot-team-helpers-state-preferences-preferences-src-mq3-game-bot-team-helpers-ml-928156302"></a>
### preferences

```ml
preferences
```

Stored bot team-task preference values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L28)

<a id="field-field-mq3-game-bot-team-helpers-state-queueconsolemessagefn-queueconsolemessagefn-src-mq3-game-bot-team-helpers-ml-1211298538"></a>
### queueConsoleMessageFn

```ml
queueConsoleMessageFn
```

Injected callback for queue console message; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L40)

<a id="field-field-mq3-game-bot-team-helpers-state-sameteamfn-sameteamfn-src-mq3-game-bot-team-helpers-ml-1955920324"></a>
### sameTeamFn

```ml
sameTeamFn
```

Injected callback for same team; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L34)

<a id="field-field-mq3-game-bot-team-helpers-state-setlastorderedtaskfn-setlastorderedtaskfn-src-mq3-game-bot-team-helpers-ml-1205306270"></a>
### setLastOrderedTaskFn

```ml
setLastOrderedTaskFn
```

Injected callback for set last ordered task; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L68)

<a id="field-field-mq3-game-bot-team-helpers-state-sortbasefn-sortbasefn-src-mq3-game-bot-team-helpers-ml-1110460732"></a>
### sortBaseFn

```ml
sortBaseFn
```

Injected callback for sort base; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L78)

<a id="field-field-mq3-game-bot-team-helpers-state-teamfn-teamfn-src-mq3-game-bot-team-helpers-ml-1384637932"></a>
### teamFn

```ml
teamFn
```

Injected callback for team; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L44)
