# `mq3.client.ui_cinematics.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-cinematics-ml-559861938.md)

<a id="struct-struct-mq3-client-ui-cinematics-action-struct-action-src-mq3-client-ui-cinematics-ml-1415941963"></a>
## Action

```ml
struct Action
```

Stores UI cinematics queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L27)

## Members

<a id="field-field-mq3-client-ui-cinematics-action-boundary-boundary-src-mq3-client-ui-cinematics-ml-1465254255"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while selecting and launching unlocked cinematics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L30)

<a id="field-field-mq3-client-ui-cinematics-action-dispatched-dispatched-src-mq3-client-ui-cinematics-ml-55923197"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while selecting and launching unlocked cinematics; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L44)

<a id="field-field-mq3-client-ui-cinematics-action-kind-kind-src-mq3-client-ui-cinematics-ml-419048767"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while selecting and launching unlocked cinematics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L33)

<a id="field-field-mq3-client-ui-cinematics-action-name-name-src-mq3-client-ui-cinematics-ml-1047830245"></a>
### name

```ml
name
```

Cinematic-menu target, playback command, console variable, or artwork resource named by the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L36)

<a id="field-field-mq3-client-ui-cinematics-action-text-text-src-mq3-client-ui-cinematics-ml-65492189"></a>
### text

```ml
text
```

Playback command or nextmap value prepared for the selected cinematic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L38)

<a id="field-field-mq3-client-ui-cinematics-action-value-value-src-mq3-client-ui-cinematics-ml-1992488411"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while selecting and launching unlocked cinematics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L41)
