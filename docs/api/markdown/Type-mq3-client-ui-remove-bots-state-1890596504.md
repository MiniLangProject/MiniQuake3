# `mq3.client.ui_remove_bots.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-remove-bots-ml-93642479.md)

<a id="struct-struct-mq3-client-ui-remove-bots-state-struct-state-src-mq3-client-ui-remove-bots-ml-1279388575"></a>
## State

```ml
struct State
```

Stores UI remove bots state, including `playerInfos`, `numBots`, `baseBotNum`, `selectedBotNum`, `botnames`, `botClientNums` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L60)

## Members

<a id="field-field-mq3-client-ui-remove-bots-state-actions-actions-src-mq3-client-ui-remove-bots-ml-114540434"></a>
### actions

```ml
actions
```

Host requests queued while selecting an active bot and issuing its removal command, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L84)

<a id="field-field-mq3-client-ui-remove-bots-state-basebotnum-basebotnum-src-mq3-client-ui-remove-bots-ml-1849199942"></a>
### baseBotNum

```ml
baseBotNum
```

When constructing this record, `create` supplies `0` for this member. Used by `setBotNames` and `deleteEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L69)

<a id="field-field-mq3-client-ui-remove-bots-state-botclientnums-botclientnums-src-mq3-client-ui-remove-bots-ml-1263074058"></a>
### botClientNums

```ml
botClientNums
```

When constructing this record, `create` supplies an empty list for this member. Used by `getBots` and `setBotNames` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L78)

<a id="field-field-mq3-client-ui-remove-bots-state-botnames-botnames-src-mq3-client-ui-remove-bots-ml-505730192"></a>
### botnames

```ml
botnames
```

When constructing this record, `create` supplies `["","","","","","",""]` for this member. Used by `setBotNames` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L75)

<a id="field-field-mq3-client-ui-remove-bots-state-cached-cached-src-mq3-client-ui-remove-bots-ml-1061713702"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L91)

<a id="field-field-mq3-client-ui-remove-bots-state-menuevents-menuevents-src-mq3-client-ui-remove-bots-ml-693066758"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L93)

<a id="field-field-mq3-client-ui-remove-bots-state-numbots-numbots-src-mq3-client-ui-remove-bots-ml-1209209782"></a>
### numBots

```ml
numBots
```

When constructing this record, `create` supplies `0` for this member. Used by `getBots` and `setBotNames` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L66)

<a id="field-field-mq3-client-ui-remove-bots-state-playerinfos-playerinfos-src-mq3-client-ui-remove-bots-ml-1918166566"></a>
### playerInfos

```ml
playerInfos
```

When constructing this record, `create` supplies an empty list for this member. Used by `getBots` and `setBotNames` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L63)

<a id="field-field-mq3-client-ui-remove-bots-state-pushed-pushed-src-mq3-client-ui-remove-bots-ml-1181680896"></a>
### pushed

```ml
pushed
```

Records that the Remove Bots menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L89)

<a id="field-field-mq3-client-ui-remove-bots-state-retailactive-retailactive-src-mq3-client-ui-remove-bots-ml-1908950780"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the Remove Bots menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L87)

<a id="field-field-mq3-client-ui-remove-bots-state-selectedbotnum-selectedbotnum-src-mq3-client-ui-remove-bots-ml-792049398"></a>
### selectedBotNum

```ml
selectedBotNum
```

When constructing this record, `create` supplies `0` for this member. Used by `deleteEvent` and `botEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L72)

<a id="field-field-mq3-client-ui-remove-bots-state-visiblecount-visiblecount-src-mq3-client-ui-remove-bots-ml-1569367416"></a>
### visibleCount

```ml
visibleCount
```

When constructing this record, `create` supplies `0` for this member. Used by `botEvent` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L81)
