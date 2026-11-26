# `mq3.client.original_ui_session.State`

[Home](README.md) · [Source file](File-src-mq3-client-original-ui-session-ml-619334882.md)

<a id="struct-struct-mq3-client-original-ui-session-state-struct-state-src-mq3-client-original-ui-session-ml-1611295623"></a>
## State

```ml
struct State
```

Stores original UI session state, including `services`, `inputContext`, `keyDownFn`, `mouseDeltaFn`, `bindings`, `down` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L149)

## Members

<a id="field-field-mq3-client-original-ui-session-state-bindings-bindings-src-mq3-client-original-ui-session-ml-1878325876"></a>
### bindings

```ml
bindings
```

Key-to-command associations available to the UI controls editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L162)

<a id="field-field-mq3-client-original-ui-session-state-down-down-src-mq3-client-original-ui-session-ml-1841479852"></a>
### down

```ml
down
```

When constructing this record, `create` supplies `array(len(mapped),false)` for this member. Used by `frame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L165)

<a id="field-field-mq3-client-original-ui-session-state-framecount-framecount-src-mq3-client-original-ui-session-ml-42652964"></a>
### frameCount

```ml
frameCount
```

When constructing this record, `create` supplies `0` for this member. Used by `finishOriginalUiFrame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L168)

<a id="field-field-mq3-client-original-ui-session-state-inputcontext-inputcontext-src-mq3-client-original-ui-session-ml-1394010390"></a>
### inputContext

```ml
inputContext
```

When constructing this record, `create` supplies `inputContext` for this member. Used by `frame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L154)

<a id="field-field-mq3-client-original-ui-session-state-keydownfn-keydownfn-src-mq3-client-original-ui-session-ml-108936904"></a>
### keyDownFn

```ml
keyDownFn
```

Host callback for the key down operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L157)

<a id="field-field-mq3-client-original-ui-session-state-mousedeltafn-mousedeltafn-src-mq3-client-original-ui-session-ml-532425870"></a>
### mouseDeltaFn

```ml
mouseDeltaFn
```

Host callback for the mouse delta operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L160)

<a id="field-field-mq3-client-original-ui-session-state-services-services-src-mq3-client-original-ui-session-ml-1173422724"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L151)
