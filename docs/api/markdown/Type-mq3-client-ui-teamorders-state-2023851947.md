# `mq3.client.ui_teamorders.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-teamorders-ml-1741634096.md)

<a id="struct-struct-mq3-client-ui-teamorders-state-struct-state-src-mq3-client-ui-teamorders-ml-581790927"></a>
## State

```ml
struct State
```

Stores UI teamorders state, including `menu`, `banner`, `frame`, `list`, `back`, `gametype` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L60)

## Members

<a id="field-field-mq3-client-ui-teamorders-state-actions-actions-src-mq3-client-ui-teamorders-ml-382698808"></a>
### actions

```ml
actions
```

Host requests queued while selecting a teammate and issuing a predefined team order, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L91)

<a id="field-field-mq3-client-ui-teamorders-state-back-back-src-mq3-client-ui-teamorders-ml-438222554"></a>
### back

```ml
back
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_TeamOrdersMenu_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L74)

<a id="field-field-mq3-client-ui-teamorders-state-banner-banner-src-mq3-client-ui-teamorders-ml-1643325680"></a>
### banner

```ml
banner
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_TeamOrdersMenu_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L66)

<a id="field-field-mq3-client-ui-teamorders-state-botnames-botnames-src-mq3-client-ui-teamorders-ml-1130188134"></a>
### botNames

```ml
botNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_TeamOrdersMenu_ListEvent` and `UI_TeamOrdersMenu_BuildBotList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L88)

<a id="field-field-mq3-client-ui-teamorders-state-bots-bots-src-mq3-client-ui-teamorders-ml-646163116"></a>
### bots

```ml
bots
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_TeamOrdersMenu_SetList` and `UI_TeamOrdersMenu_BuildBotList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L85)

<a id="field-field-mq3-client-ui-teamorders-state-frame-frame-src-mq3-client-ui-teamorders-ml-1831848872"></a>
### frame

```ml
frame
```

Decorative bitmap widget drawing the border around the team-orders menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L68)

<a id="field-field-mq3-client-ui-teamorders-state-gametype-gametype-src-mq3-client-ui-teamorders-ml-261291580"></a>
### gametype

```ml
gametype
```

Game-rule value parsed from server information to select capture-the-flag or general team orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L76)

<a id="field-field-mq3-client-ui-teamorders-state-list-list-src-mq3-client-ui-teamorders-ml-699702508"></a>
### list

```ml
list
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_TeamOrdersMenu_SetList` and `UI_TeamOrdersMenu_ListEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L71)

<a id="field-field-mq3-client-ui-teamorders-state-menu-menu-src-mq3-client-ui-teamorders-ml-486006710"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `qmenu.menu(false,false)` for this member. Used by `UI_TeamOrdersMenu_BackEvent` and `UI_TeamOrdersMenu_SetList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L63)

<a id="field-field-mq3-client-ui-teamorders-state-numbots-numbots-src-mq3-client-ui-teamorders-ml-2105337660"></a>
### numBots

```ml
numBots
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_TeamOrdersMenu_BuildBotList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L79)

<a id="field-field-mq3-client-ui-teamorders-state-popped-popped-src-mq3-client-ui-teamorders-ml-1182995508"></a>
### popped

```ml
popped
```

Records a request to remove the team-order command menu from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L95)

<a id="field-field-mq3-client-ui-teamorders-state-pushed-pushed-src-mq3-client-ui-teamorders-ml-268032306"></a>
### pushed

```ml
pushed
```

Records that the team-order command menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L93)

<a id="field-field-mq3-client-ui-teamorders-state-retailactive-retailactive-src-mq3-client-ui-teamorders-ml-930357910"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the team-order command menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L98)

<a id="field-field-mq3-client-ui-teamorders-state-selectedbot-selectedbot-src-mq3-client-ui-teamorders-ml-1028412676"></a>
### selectedBot

```ml
selectedBot
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_TeamOrdersMenu_ListEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L82)
