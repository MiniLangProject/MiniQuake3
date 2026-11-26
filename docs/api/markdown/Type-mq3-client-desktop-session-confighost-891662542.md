# `mq3.client.desktop_session.ConfigHost`

[Home](README.md) · [Source file](File-src-mq3-client-desktop-session-ml-419426432.md)

<a id="struct-struct-mq3-client-desktop-session-confighost-struct-confighost-src-mq3-client-desktop-session-ml-93223487"></a>
## ConfigHost

```ml
struct ConfigHost
```

Stores desktop session config host record, including `dataRoot`, `context`, `bindingState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L26)

## Members

<a id="field-field-mq3-client-desktop-session-confighost-bindingstate-bindingstate-src-mq3-client-desktop-session-ml-862365813"></a>
### bindingState

```ml
bindingState
```

When constructing this record, `attach` supplies `bindings.create(context.cgameKeys)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L34)

<a id="field-field-mq3-client-desktop-session-confighost-context-context-src-mq3-client-desktop-session-ml-309829661"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for desktop client session setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L31)

<a id="field-field-mq3-client-desktop-session-confighost-dataroot-dataroot-src-mq3-client-desktop-session-ml-2040239901"></a>
### dataRoot

```ml
dataRoot
```

When constructing this record, `attach` supplies `session.dataRoot` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L28)
