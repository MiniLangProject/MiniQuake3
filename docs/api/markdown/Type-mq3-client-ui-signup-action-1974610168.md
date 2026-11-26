# `mq3.client.ui_signup.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-signup-ml-530651668.md)

<a id="struct-struct-mq3-client-ui-signup-action-struct-action-src-mq3-client-ui-signup-ml-118753979"></a>
## Action

```ml
struct Action
```

Stores UI signup queued engine action, including `boundary`, `kind`, `name`, `text`, `text2`, `text3` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L30)

## Members

<a id="field-field-mq3-client-ui-signup-action-boundary-boundary-src-mq3-client-ui-signup-ml-1501817635"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while collecting and submitting a new ranked-play account.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L33)

<a id="field-field-mq3-client-ui-signup-action-dispatched-dispatched-src-mq3-client-ui-signup-ml-130643645"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while collecting and submitting a new ranked-play account; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L47)

<a id="field-field-mq3-client-ui-signup-action-kind-kind-src-mq3-client-ui-signup-ml-1673107491"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while collecting and submitting a new ranked-play account.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L36)

<a id="field-field-mq3-client-ui-signup-action-name-name-src-mq3-client-ui-signup-ml-1073698149"></a>
### name

```ml
name
```

Signup-menu target, account-creation label, or artwork resource referenced by the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L38)

<a id="field-field-mq3-client-ui-signup-action-text-text-src-mq3-client-ui-signup-ml-1400673829"></a>
### text

```ml
text
```

Sanitized account name supplied to the rankings account-creation request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L40)

<a id="field-field-mq3-client-ui-signup-action-text2-text2-src-mq3-client-ui-signup-ml-1658152647"></a>
### text2

```ml
text2
```

When constructing this record, `emit` supplies `text2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L42)

<a id="field-field-mq3-client-ui-signup-action-text3-text3-src-mq3-client-ui-signup-ml-1035758039"></a>
### text3

```ml
text3
```

When constructing this record, `emit` supplies `text3` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_signup.ml#L44)
