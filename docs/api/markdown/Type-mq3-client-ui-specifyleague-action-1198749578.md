# `mq3.client.ui_specifyleague.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-specifyleague-ml-1420873104.md)

<a id="struct-struct-mq3-client-ui-specifyleague-action-struct-action-src-mq3-client-ui-specifyleague-ml-1166215549"></a>
## Action

```ml
struct Action
```

Stores UI specifyleague queued engine action, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L26)

## Members

<a id="field-field-mq3-client-ui-specifyleague-action-boundary-boundary-src-mq3-client-ui-specifyleague-ml-1903203231"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while accepting a league identifier for ranked play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L29)

<a id="field-field-mq3-client-ui-specifyleague-action-dispatched-dispatched-src-mq3-client-ui-specifyleague-ml-59690009"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while accepting a league identifier for ranked play; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L42)

<a id="field-field-mq3-client-ui-specifyleague-action-kind-kind-src-mq3-client-ui-specifyleague-ml-1832588591"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while accepting a league identifier for ranked play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L32)

<a id="field-field-mq3-client-ui-specifyleague-action-name-name-src-mq3-client-ui-specifyleague-ml-1289544721"></a>
### name

```ml
name
```

League-query label, selected-league cvar, menu target, or artwork resource named by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L34)

<a id="field-field-mq3-client-ui-specifyleague-action-number-number-src-mq3-client-ui-specifyleague-ml-1908032597"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while accepting a league identifier for ranked play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L39)

<a id="field-field-mq3-client-ui-specifyleague-action-text-text-src-mq3-client-ui-specifyleague-ml-1815433017"></a>
### text

```ml
text
```

Player name used for league lookup or selected league name written to the server setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_specifyleague.ml#L36)
