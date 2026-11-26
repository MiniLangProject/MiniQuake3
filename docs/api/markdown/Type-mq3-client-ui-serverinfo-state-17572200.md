# `mq3.client.ui_serverinfo.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-serverinfo-ml-1776030261.md)

<a id="struct-struct-mq3-client-ui-serverinfo-state-struct-state-src-mq3-client-ui-serverinfo-ml-1681558379"></a>
## State

```ml
struct State
```

Stores UI serverinfo state, including `menu`, `banner`, `framel`, `framer`, `back`, `add` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L52)

## Members

<a id="field-field-mq3-client-ui-serverinfo-state-actions-actions-src-mq3-client-ui-serverinfo-ml-870031110"></a>
### actions

```ml
actions
```

Host requests queued while displaying current server cvars and handling the dialog controls, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L88)

<a id="field-field-mq3-client-ui-serverinfo-state-add-add-src-mq3-client-ui-serverinfo-ml-1143410318"></a>
### add

```ml
add
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L70)

<a id="field-field-mq3-client-ui-serverinfo-state-back-back-src-mq3-client-ui-serverinfo-ml-96608632"></a>
### back

```ml
back
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L67)

<a id="field-field-mq3-client-ui-serverinfo-state-banner-banner-src-mq3-client-ui-serverinfo-ml-2120963386"></a>
### banner

```ml
banner
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L58)

<a id="field-field-mq3-client-ui-serverinfo-state-currentaddress-currentaddress-src-mq3-client-ui-serverinfo-ml-1714867248"></a>
### currentAddress

```ml
currentAddress
```

When constructing this record, `create` supplies an empty string for this member. Used by `Favorites_Add` and `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L82)

<a id="field-field-mq3-client-ui-serverinfo-state-favorites-favorites-src-mq3-client-ui-serverinfo-ml-812914450"></a>
### favorites

```ml
favorites
```

When constructing this record, `create` supplies an empty list for this member. Used by `Favorites_Add` and `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L85)

<a id="field-field-mq3-client-ui-serverinfo-state-framel-framel-src-mq3-client-ui-serverinfo-ml-2115887952"></a>
### framel

```ml
framel
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L61)

<a id="field-field-mq3-client-ui-serverinfo-state-framer-framer-src-mq3-client-ui-serverinfo-ml-843413512"></a>
### framer

```ml
framer
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L64)

<a id="field-field-mq3-client-ui-serverinfo-state-info-info-src-mq3-client-ui-serverinfo-ml-1372949618"></a>
### info

```ml
info
```

When constructing this record, `create` supplies an empty string for this member. Used by `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L73)

<a id="field-field-mq3-client-ui-serverinfo-state-menu-menu-src-mq3-client-ui-serverinfo-ml-2070717356"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member. Used by `ServerInfo_Event` and `ServerInfo_MenuKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L55)

<a id="field-field-mq3-client-ui-serverinfo-state-numlines-numlines-src-mq3-client-ui-serverinfo-ml-293647004"></a>
### numlines

```ml
numlines
```

When constructing this record, `create` supplies `0` for this member. Used by `ServerInfo_MenuDraw` and `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L79)

<a id="field-field-mq3-client-ui-serverinfo-state-pairs-pairs-src-mq3-client-ui-serverinfo-ml-1631209182"></a>
### pairs

```ml
pairs
```

When constructing this record, `create` supplies an empty list for this member. Used by `ServerInfo_MenuDraw` and `UI_ServerInfoMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L76)

<a id="field-field-mq3-client-ui-serverinfo-state-popped-popped-src-mq3-client-ui-serverinfo-ml-1708263850"></a>
### popped

```ml
popped
```

Records a request to remove the server-information dialog from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L92)

<a id="field-field-mq3-client-ui-serverinfo-state-pushed-pushed-src-mq3-client-ui-serverinfo-ml-869628776"></a>
### pushed

```ml
pushed
```

Records that the server-information dialog has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L90)

<a id="field-field-mq3-client-ui-serverinfo-state-retailactive-retailactive-src-mq3-client-ui-serverinfo-ml-1146212748"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the server-information dialog, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L95)
