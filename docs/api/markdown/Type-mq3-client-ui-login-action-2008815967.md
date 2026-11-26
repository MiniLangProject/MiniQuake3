# `mq3.client.ui_login.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-login-ml-820831293.md)

<a id="struct-struct-mq3-client-ui-login-action-struct-action-src-mq3-client-ui-login-ml-1415126807"></a>
## Action

```ml
struct Action
```

Stores UI login queued engine action, including `boundary`, `kind`, `name`, `text`, `text2`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L22)

## Members

<a id="field-field-mq3-client-ui-login-action-boundary-boundary-src-mq3-client-ui-login-ml-1296092637"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while submitting account credentials or closing the login dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L25)

<a id="field-field-mq3-client-ui-login-action-dispatched-dispatched-src-mq3-client-ui-login-ml-752733735"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while submitting account credentials or closing the login dialog; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L38)

<a id="field-field-mq3-client-ui-login-action-kind-kind-src-mq3-client-ui-login-ml-252623845"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while submitting account credentials or closing the login dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L28)

<a id="field-field-mq3-client-ui-login-action-name-name-src-mq3-client-ui-login-ml-757420803"></a>
### name

```ml
name
```

Login-menu target, account-operation label, or artwork resource referenced by the host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L30)

<a id="field-field-mq3-client-ui-login-action-text-text-src-mq3-client-ui-login-ml-435391871"></a>
### text

```ml
text
```

Sanitized account name passed to the rankings login operation; menu and asset actions leave it empty.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L33)

<a id="field-field-mq3-client-ui-login-action-text2-text2-src-mq3-client-ui-login-ml-1507399197"></a>
### text2

```ml
text2
```

When constructing this record, `emit` supplies `text2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L35)
