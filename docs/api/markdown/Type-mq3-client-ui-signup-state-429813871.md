# `mq3.client.ui_signup.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-signup-ml-530651668.md)

<a id="struct-struct-mq3-client-ui-signup-state-struct-state-src-mq3-client-ui-signup-ml-2061184619"></a>
## State

```ml
struct State
```

Stores UI signup state, including `menu`, `frame`, `name`, `nameBox`, `password`, `passwordBox` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L50)

## Members

<a id="field-field-mq3-client-ui-signup-state-actions-actions-src-mq3-client-ui-signup-ml-115475500"></a>
### actions

```ml
actions
```

Host requests queued while collecting and submitting a new ranked-play account, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L90)

<a id="field-field-mq3-client-ui-signup-state-again-again-src-mq3-client-ui-signup-ml-12466536"></a>
### again

```ml
again
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L69)

<a id="field-field-mq3-client-ui-signup-state-againbox-againbox-src-mq3-client-ui-signup-ml-1192532866"></a>
### againBox

```ml
againBox
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L72)

<a id="field-field-mq3-client-ui-signup-state-cancel-cancel-src-mq3-client-ui-signup-ml-1930154384"></a>
### cancel

```ml
cancel
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L84)

<a id="field-field-mq3-client-ui-signup-state-email-email-src-mq3-client-ui-signup-ml-1510952544"></a>
### email

```ml
email
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L75)

<a id="field-field-mq3-client-ui-signup-state-emailbox-emailbox-src-mq3-client-ui-signup-ml-1771661534"></a>
### emailBox

```ml
emailBox
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L78)

<a id="field-field-mq3-client-ui-signup-state-forcedoff-forcedoff-src-mq3-client-ui-signup-ml-928276360"></a>
### forcedOff

```ml
forcedOff
```

When constructing this record, `create` supplies `false` for this member. Used by `Signup_MenuEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L95)

<a id="field-field-mq3-client-ui-signup-state-frame-frame-src-mq3-client-ui-signup-ml-1056747452"></a>
### frame

```ml
frame
```

Decorative bitmap widget drawing the border around the account-signup menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L55)

<a id="field-field-mq3-client-ui-signup-state-menu-menu-src-mq3-client-ui-signup-ml-1674430598"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `q.menu(true,false)` for this member. Used by `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L53)

<a id="field-field-mq3-client-ui-signup-state-name-name-src-mq3-client-ui-signup-ml-1180139230"></a>
### name

```ml
name
```

Account name entered in the ranking-service login or signup form.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L57)

<a id="field-field-mq3-client-ui-signup-state-namebox-namebox-src-mq3-client-ui-signup-ml-1805715732"></a>
### nameBox

```ml
nameBox
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L60)

<a id="field-field-mq3-client-ui-signup-state-password-password-src-mq3-client-ui-signup-ml-2049635258"></a>
### password

```ml
password
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L63)

<a id="field-field-mq3-client-ui-signup-state-passwordbox-passwordbox-src-mq3-client-ui-signup-ml-1589074816"></a>
### passwordBox

```ml
passwordBox
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L66)

<a id="field-field-mq3-client-ui-signup-state-popped-popped-src-mq3-client-ui-signup-ml-735313536"></a>
### popped

```ml
popped
```

Records a request to remove the ranked-play account-signup dialog from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L97)

<a id="field-field-mq3-client-ui-signup-state-pushed-pushed-src-mq3-client-ui-signup-ml-853867674"></a>
### pushed

```ml
pushed
```

Records that the ranked-play account-signup dialog has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L92)

<a id="field-field-mq3-client-ui-signup-state-retailactive-retailactive-src-mq3-client-ui-signup-ml-2087168742"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the ranked-play account-signup dialog, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L100)

<a id="field-field-mq3-client-ui-signup-state-signup-signup-src-mq3-client-ui-signup-ml-14918112"></a>
### signup

```ml
signup
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L81)

<a id="field-field-mq3-client-ui-signup-state-status-status-src-mq3-client-ui-signup-ml-150257620"></a>
### status

```ml
status
```

When constructing this record, `create` supplies `rankings.QGR_STATUS_NEW` for this member. Used by `Signup_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L87)
