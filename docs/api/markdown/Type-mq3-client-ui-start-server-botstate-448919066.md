# `mq3.client.ui_start_server.BotState`

[Home](README.md) · [Source file](File-src-mq3-client-ui-start-server-ml-1691378486.md)

<a id="struct-struct-mq3-client-ui-start-server-botstate-struct-botstate-src-mq3-client-ui-start-server-ml-284878803"></a>
## BotState

```ml
struct BotState
```

Stores UI start server bot state record, including `bots`, `sorted`, `modelPage`, `numPages`, `selected`, `icons` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L134)

## Members

<a id="field-field-mq3-client-ui-start-server-botstate-actions-actions-src-mq3-client-ui-start-server-ml-507657167"></a>
### actions

```ml
actions
```

Host requests queued while choosing a map and game rules, configuring bot slots, and launching a server, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L155)

<a id="field-field-mq3-client-ui-start-server-botstate-active-active-src-mq3-client-ui-start-server-ml-1834364075"></a>
### active

```ml
active
```

When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,false)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L150)

<a id="field-field-mq3-client-ui-start-server-botstate-alreadyselected-alreadyselected-src-mq3-client-ui-start-server-ml-2037366951"></a>
### alreadySelected

```ml
alreadySelected
```

When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,false)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L152)

<a id="field-field-mq3-client-ui-start-server-botstate-bots-bots-src-mq3-client-ui-start-server-ml-1140067643"></a>
### bots

```ml
bots
```

When constructing this record, `botState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L136)

<a id="field-field-mq3-client-ui-start-server-botstate-icons-icons-src-mq3-client-ui-start-server-ml-2135068155"></a>
### icons

```ml
icons
```

When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,"")` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L146)

<a id="field-field-mq3-client-ui-start-server-botstate-modelpage-modelpage-src-mq3-client-ui-start-server-ml-870418315"></a>
### modelPage

```ml
modelPage
```

When constructing this record, `botState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L140)

<a id="field-field-mq3-client-ui-start-server-botstate-names-names-src-mq3-client-ui-start-server-ml-1130384603"></a>
### names

```ml
names
```

When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,"")` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L148)

<a id="field-field-mq3-client-ui-start-server-botstate-numpages-numpages-src-mq3-client-ui-start-server-ml-1054268467"></a>
### numPages

```ml
numPages
```

When constructing this record, `botState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L142)

<a id="field-field-mq3-client-ui-start-server-botstate-selected-selected-src-mq3-client-ui-start-server-ml-335867093"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L144)

<a id="field-field-mq3-client-ui-start-server-botstate-sorted-sorted-src-mq3-client-ui-start-server-ml-808093333"></a>
### sorted

```ml
sorted
```

When constructing this record, `botState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L138)
