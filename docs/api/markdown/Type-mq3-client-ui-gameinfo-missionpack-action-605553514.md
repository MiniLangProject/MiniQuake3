# `mq3.client.ui_gameinfo_missionpack.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-gameinfo-missionpack-ml-695041638.md)

<a id="struct-struct-mq3-client-ui-gameinfo-missionpack-action-struct-action-src-mq3-client-ui-gameinfo-missionpack-ml-1864131535"></a>
## Action

```ml
struct Action
```

Stores UI gameinfo missionpack queued engine action, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L57)

## Members

<a id="field-field-mq3-client-ui-gameinfo-missionpack-action-boundary-boundary-src-mq3-client-ui-gameinfo-missionpack-ml-93135743"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while loading Missionpack arena and bot definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L60)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-action-dispatched-dispatched-src-mq3-client-ui-gameinfo-missionpack-ml-2147266153"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while loading Missionpack arena and bot definitions; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L73)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-action-kind-kind-src-mq3-client-ui-gameinfo-missionpack-ml-1039933871"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while loading Missionpack arena and bot definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L63)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-action-name-name-src-mq3-client-ui-gameinfo-missionpack-ml-1537417169"></a>
### name

```ml
name
```

Arena or bot-definition filename referenced by the Missionpack filesystem request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L65)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-action-number-number-src-mq3-client-ui-gameinfo-missionpack-ml-14667701"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while loading Missionpack arena and bot definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L70)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-action-text-text-src-mq3-client-ui-gameinfo-missionpack-ml-390658889"></a>
### text

```ml
text
```

Definition-file category attached to the Missionpack read request: arena or bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L67)
