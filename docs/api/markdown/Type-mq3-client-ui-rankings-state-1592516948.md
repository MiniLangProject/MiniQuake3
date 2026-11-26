# `mq3.client.ui_rankings.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-rankings-ml-966722513.md)

<a id="struct-struct-mq3-client-ui-rankings-state-struct-state-src-mq3-client-ui-rankings-ml-1559170219"></a>
## State

```ml
struct State
```

Stores UI rankings state, including `menu`, `frame`, `login`, `logout`, `createAccount`, `spectate` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L75)

## Members

<a id="field-field-mq3-client-ui-rankings-state-actions-actions-src-mq3-client-ui-rankings-ml-1348978618"></a>
### actions

```ml
actions
```

Host requests queued while offering account login, logout, signup, and ranked-play choices, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L104)

<a id="field-field-mq3-client-ui-rankings-state-createaccount-createaccount-src-mq3-client-ui-rankings-ml-1815168778"></a>
### createAccount

```ml
createAccount
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L89)

<a id="field-field-mq3-client-ui-rankings-state-forcedoff-forcedoff-src-mq3-client-ui-rankings-ml-802101902"></a>
### forcedOff

```ml
forcedOff
```

When constructing this record, `create` supplies `false` for this member. Used by `Rankings_MenuEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L109)

<a id="field-field-mq3-client-ui-rankings-state-frame-frame-src-mq3-client-ui-rankings-ml-1084796842"></a>
### frame

```ml
frame
```

Decorative bitmap widget drawing the border around the rankings menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L80)

<a id="field-field-mq3-client-ui-rankings-state-leave-leave-src-mq3-client-ui-rankings-ml-1739050654"></a>
### leave

```ml
leave
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L98)

<a id="field-field-mq3-client-ui-rankings-state-login-login-src-mq3-client-ui-rankings-ml-458071686"></a>
### login

```ml
login
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L83)

<a id="field-field-mq3-client-ui-rankings-state-logout-logout-src-mq3-client-ui-rankings-ml-1168866062"></a>
### logout

```ml
logout
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L86)

<a id="field-field-mq3-client-ui-rankings-state-menu-menu-src-mq3-client-ui-rankings-ml-86835916"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `q.menu(true,false)` for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L78)

<a id="field-field-mq3-client-ui-rankings-state-popped-popped-src-mq3-client-ui-rankings-ml-1391054566"></a>
### popped

```ml
popped
```

Records a request to remove the ranked-play account menu from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L111)

<a id="field-field-mq3-client-ui-rankings-state-pushed-pushed-src-mq3-client-ui-rankings-ml-497347360"></a>
### pushed

```ml
pushed
```

Records that the ranked-play account menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L106)

<a id="field-field-mq3-client-ui-rankings-state-retailactive-retailactive-src-mq3-client-ui-rankings-ml-762642412"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the ranked-play account menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L114)

<a id="field-field-mq3-client-ui-rankings-state-setup-setup-src-mq3-client-ui-rankings-ml-1479331946"></a>
### setup

```ml
setup
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L95)

<a id="field-field-mq3-client-ui-rankings-state-spectate-spectate-src-mq3-client-ui-rankings-ml-367085280"></a>
### spectate

```ml
spectate
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L92)

<a id="field-field-mq3-client-ui-rankings-state-status-status-src-mq3-client-ui-rankings-ml-1183304126"></a>
### status

```ml
status
```

When constructing this record, `create` supplies `QGR_STATUS_NEW` for this member. Used by `Rankings_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L101)
