# `mq3.client.ui_rankstatus.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-rankstatus-ml-1210092028.md)

<a id="struct-struct-mq3-client-ui-rankstatus-state-struct-state-src-mq3-client-ui-rankstatus-ml-1350790095"></a>
## State

```ml
struct State
```

Stores UI rankstatus state, including `menu`, `frame`, `message`, `ok`, `status`, `messageText` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L31)

## Members

<a id="field-field-mq3-client-ui-rankstatus-state-actions-actions-src-mq3-client-ui-rankstatus-ml-1422858224"></a>
### actions

```ml
actions
```

Host requests queued while displaying ranked-account status and dismissing its message, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L50)

<a id="field-field-mq3-client-ui-rankstatus-state-forcedoff-forcedoff-src-mq3-client-ui-rankstatus-ml-267017028"></a>
### forcedOff

```ml
forcedOff
```

When constructing this record, `create` supplies `false` for this member. Used by `UI_RankStatusMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L57)

<a id="field-field-mq3-client-ui-rankstatus-state-frame-frame-src-mq3-client-ui-rankstatus-ml-299350448"></a>
### frame

```ml
frame
```

Decorative bitmap widget drawing the border around the ranking-status menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L36)

<a id="field-field-mq3-client-ui-rankstatus-state-menu-menu-src-mq3-client-ui-rankstatus-ml-80883130"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `q.menu(true,false)` for this member. Used by `RankStatus_MenuEvent` and `RankStatus_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L34)

<a id="field-field-mq3-client-ui-rankstatus-state-message-message-src-mq3-client-ui-rankstatus-ml-1022884512"></a>
### message

```ml
message
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `RankStatus_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L39)

<a id="field-field-mq3-client-ui-rankstatus-state-messagetext-messagetext-src-mq3-client-ui-rankstatus-ml-1191452712"></a>
### messageText

```ml
messageText
```

When constructing this record, `create` supplies an empty string for this member. Used by `RankStatus_MenuInit` and `UI_RankStatusMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L47)

<a id="field-field-mq3-client-ui-rankstatus-state-ok-ok-src-mq3-client-ui-rankstatus-ml-1145981104"></a>
### ok

```ml
ok
```

True when the operation completed successfully and its result can be consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L41)

<a id="field-field-mq3-client-ui-rankstatus-state-popped-popped-src-mq3-client-ui-rankstatus-ml-1795393836"></a>
### popped

```ml
popped
```

Records a request to remove the ranked-play status dialog from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L54)

<a id="field-field-mq3-client-ui-rankstatus-state-pushed-pushed-src-mq3-client-ui-rankstatus-ml-1800178470"></a>
### pushed

```ml
pushed
```

Records that the ranked-play status dialog has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L52)

<a id="field-field-mq3-client-ui-rankstatus-state-retailactive-retailactive-src-mq3-client-ui-rankstatus-ml-541964810"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the ranked-play status dialog, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L60)

<a id="field-field-mq3-client-ui-rankstatus-state-status-status-src-mq3-client-ui-rankstatus-ml-2103220616"></a>
### status

```ml
status
```

When constructing this record, `create` supplies `0` for this member. Used by `RankStatus_MenuEvent` and `UI_RankStatusMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L44)
