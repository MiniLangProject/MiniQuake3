# `mq3.client.original_ui_session.Services`

[Home](README.md) · [Source file](File-src-mq3-client-original-ui-session-ml-619334882.md)

<a id="struct-struct-mq3-client-original-ui-session-services-struct-services-src-mq3-client-original-ui-session-ml-936759007"></a>
## Services

```ml
struct Services
```

Stores original UI session host-service callbacks, including `context`, `catcherFn`, `keyEventFn`, `mouseEventFn`, `refreshFn`, `menuFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L123)

## Members

<a id="field-field-mq3-client-original-ui-session-services-catcherfn-catcherfn-src-mq3-client-original-ui-session-ml-205306345"></a>
### catcherFn

```ml
catcherFn
```

Host callback for the catcher operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L128)

<a id="field-field-mq3-client-original-ui-session-services-commandcountfn-commandcountfn-src-mq3-client-original-ui-session-ml-1358241993"></a>
### commandCountFn

```ml
commandCountFn
```

Host callback for the command count operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L141)

<a id="field-field-mq3-client-original-ui-session-services-connectfn-connectfn-src-mq3-client-original-ui-session-ml-1520293933"></a>
### connectFn

```ml
connectFn
```

Host callback for the connect operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L146)

<a id="field-field-mq3-client-original-ui-session-services-context-context-src-mq3-client-original-ui-session-ml-425294853"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for the original UI session bridge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L126)

<a id="field-field-mq3-client-original-ui-session-services-keyeventfn-keyeventfn-src-mq3-client-original-ui-session-ml-413004603"></a>
### keyEventFn

```ml
keyEventFn
```

Host callback for the key event operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L131)

<a id="field-field-mq3-client-original-ui-session-services-menufn-menufn-src-mq3-client-original-ui-session-ml-579555015"></a>
### menuFn

```ml
menuFn
```

Host callback for the menu operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L138)

<a id="field-field-mq3-client-original-ui-session-services-mouseeventfn-mouseeventfn-src-mq3-client-original-ui-session-ml-726155447"></a>
### mouseEventFn

```ml
mouseEventFn
```

Host callback for the mouse event operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L134)

<a id="field-field-mq3-client-original-ui-session-services-refreshfn-refreshfn-src-mq3-client-original-ui-session-ml-1133504797"></a>
### refreshFn

```ml
refreshFn
```

Host callback for the refresh operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L136)

<a id="field-field-mq3-client-original-ui-session-services-stateeventfn-stateeventfn-src-mq3-client-original-ui-session-ml-2126567319"></a>
### stateEventFn

```ml
stateEventFn
```

Host callback for the state event operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/original_ui_session.ml#L144)
