# `mq3.client.ui_login.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-login-ml-820831293.md)

<a id="struct-struct-mq3-client-ui-login-state-struct-state-src-mq3-client-ui-login-ml-974655723"></a>
## State

```ml
struct State
```

Stores UI login state, including `menu`, `frame`, `name`, `nameBox`, `password`, `passwordBox` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L41)

## Members

<a id="field-field-mq3-client-ui-login-state-actions-actions-src-mq3-client-ui-login-ml-70217454"></a>
### actions

```ml
actions
```

Host requests queued while submitting account credentials or closing the login dialog, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L66)

<a id="field-field-mq3-client-ui-login-state-cancel-cancel-src-mq3-client-ui-login-ml-1836811258"></a>
### cancel

```ml
cancel
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Login_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L63)

<a id="field-field-mq3-client-ui-login-state-forcedoff-forcedoff-src-mq3-client-ui-login-ml-530483986"></a>
### forcedOff

```ml
forcedOff
```

When constructing this record, `create` supplies `false` for this member. Used by `Login_MenuEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L71)

<a id="field-field-mq3-client-ui-login-state-frame-frame-src-mq3-client-ui-login-ml-872263302"></a>
### frame

```ml
frame
```

Decorative bitmap widget drawing the border around the login menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L46)

<a id="field-field-mq3-client-ui-login-state-login-login-src-mq3-client-ui-login-ml-958800850"></a>
### login

```ml
login
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Login_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L60)

<a id="field-field-mq3-client-ui-login-state-menu-menu-src-mq3-client-ui-login-ml-1940835296"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `q.menu(true,false)` for this member. Used by `Login_MenuEvent` and `Login_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L44)

<a id="field-field-mq3-client-ui-login-state-name-name-src-mq3-client-ui-login-ml-244179744"></a>
### name

```ml
name
```

Account name entered in the ranking-service login or signup form.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L48)

<a id="field-field-mq3-client-ui-login-state-namebox-namebox-src-mq3-client-ui-login-ml-855876486"></a>
### nameBox

```ml
nameBox
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Login_MenuEvent` and `Login_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L51)

<a id="field-field-mq3-client-ui-login-state-password-password-src-mq3-client-ui-login-ml-406137492"></a>
### password

```ml
password
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Login_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L54)

<a id="field-field-mq3-client-ui-login-state-passwordbox-passwordbox-src-mq3-client-ui-login-ml-1775645834"></a>
### passwordBox

```ml
passwordBox
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Login_MenuEvent` and `Login_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L57)

<a id="field-field-mq3-client-ui-login-state-popped-popped-src-mq3-client-ui-login-ml-713651722"></a>
### popped

```ml
popped
```

Records a request to remove the ranked-play login dialog from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L73)

<a id="field-field-mq3-client-ui-login-state-pushed-pushed-src-mq3-client-ui-login-ml-540079612"></a>
### pushed

```ml
pushed
```

Records that the ranked-play login dialog has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L68)

<a id="field-field-mq3-client-ui-login-state-retailactive-retailactive-src-mq3-client-ui-login-ml-1204890656"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the ranked-play login dialog, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_login.ml#L76)
