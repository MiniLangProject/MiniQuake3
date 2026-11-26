# `mq3.client.ui_add_bots.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-add-bots-ml-1676535950.md)

<a id="struct-struct-mq3-client-ui-add-bots-state-struct-state-src-mq3-client-ui-add-bots-ml-1075193195"></a>
## State

```ml
struct State
```

Stores UI add bots state, including `data`, `numBots`, `delay`, `baseBotNum`, `selectedBotNum`, `sortedBotNums` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L71)

## Members

<a id="field-field-mq3-client-ui-add-bots-state-actions-actions-src-mq3-client-ui-add-bots-ml-1178385420"></a>
### actions

```ml
actions
```

Host requests queued while populating bot choices and issuing bot-addition commands, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L109)

<a id="field-field-mq3-client-ui-add-bots-state-basebotnum-basebotnum-src-mq3-client-ui-add-bots-ml-851352816"></a>
### baseBotNum

```ml
baseBotNum
```

When constructing this record, `create` supplies `0` for this member. Used by `setBotNames` and `upEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L83)

<a id="field-field-mq3-client-ui-add-bots-state-botnames-botnames-src-mq3-client-ui-add-bots-ml-1795827282"></a>
### botnames

```ml
botnames
```

When constructing this record, `create` supplies `["","","","","","",""]` for this member. Used by `setBotNames` and `fightEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L92)

<a id="field-field-mq3-client-ui-add-bots-state-cached-cached-src-mq3-client-ui-add-bots-ml-1830324964"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L116)

<a id="field-field-mq3-client-ui-add-bots-state-data-data-src-mq3-client-ui-add-bots-ml-106389048"></a>
### data

```ml
data
```

When constructing this record, `create` supplies `data` for this member. Used by `sortCompare` and `setBotNames` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L74)

<a id="field-field-mq3-client-ui-add-bots-state-delay-delay-src-mq3-client-ui-add-bots-ml-35331860"></a>
### delay

```ml
delay
```

When constructing this record, `create` supplies `1000` for this member. Used by `fightEvent` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L80)

<a id="field-field-mq3-client-ui-add-bots-state-menuevents-menuevents-src-mq3-client-ui-add-bots-ml-1729950508"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L118)

<a id="field-field-mq3-client-ui-add-bots-state-numbots-numbots-src-mq3-client-ui-add-bots-ml-1188950440"></a>
### numBots

```ml
numBots
```

When constructing this record, `create` supplies `0` for this member. Used by `getSortedBotNums` and `downEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L77)

<a id="field-field-mq3-client-ui-add-bots-state-pushed-pushed-src-mq3-client-ui-add-bots-ml-505887814"></a>
### pushed

```ml
pushed
```

Records that the Add Bots menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L114)

<a id="field-field-mq3-client-ui-add-bots-state-retailactive-retailactive-src-mq3-client-ui-add-bots-ml-1093535874"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the Add Bots menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L112)

<a id="field-field-mq3-client-ui-add-bots-state-selectedbotnum-selectedbotnum-src-mq3-client-ui-add-bots-ml-1250102800"></a>
### selectedBotNum

```ml
selectedBotNum
```

When constructing this record, `create` supplies `0` for this member. Used by `fightEvent` and `botEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L86)

<a id="field-field-mq3-client-ui-add-bots-state-skill-skill-src-mq3-client-ui-add-bots-ml-1940949732"></a>
### skill

```ml
skill
```

When constructing this record, `create` supplies `0` for this member. Used by `fightEvent` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L95)

<a id="field-field-mq3-client-ui-add-bots-state-sortedbotnums-sortedbotnums-src-mq3-client-ui-add-bots-ml-1600738392"></a>
### sortedBotNums

```ml
sortedBotNums
```

When constructing this record, `create` supplies an empty list for this member. Used by `getSortedBotNums` and `setBotNames` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L89)

<a id="field-field-mq3-client-ui-add-bots-state-team-team-src-mq3-client-ui-add-bots-ml-1658131742"></a>
### team

```ml
team
```

Selected index into the team-name menu used when constructing an addbot command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L97)

<a id="field-field-mq3-client-ui-add-bots-state-teamgrayed-teamgrayed-src-mq3-client-ui-add-bots-ml-1001487546"></a>
### teamGrayed

```ml
teamGrayed
```

When constructing this record, `create` supplies `true` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L103)

<a id="field-field-mq3-client-ui-add-bots-state-teamnames-teamnames-src-mq3-client-ui-add-bots-ml-1848959484"></a>
### teamNames

```ml
teamNames
```

When constructing this record, `create` supplies `["Free"]` for this member. Used by `fightEvent` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L100)

<a id="field-field-mq3-client-ui-add-bots-state-visiblecount-visiblecount-src-mq3-client-ui-add-bots-ml-750019858"></a>
### visibleCount

```ml
visibleCount
```

When constructing this record, `create` supplies `0` for this member. Used by `botEvent` and `draw` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_add_bots.ml#L106)
