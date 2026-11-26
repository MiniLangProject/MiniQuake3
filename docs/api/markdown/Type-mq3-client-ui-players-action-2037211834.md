# `mq3.client.ui_players.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-action-struct-action-src-mq3-client-ui-players-ml-1067330465"></a>
## Action

```ml
struct Action
```

Stores UI players queued engine action, including `boundary`, `kind`, `name`, `detail`, `number`, `vector` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L90)

## Members

<a id="field-field-mq3-client-ui-players-action-boundary-boundary-src-mq3-client-ui-players-ml-1794609247"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while loading model parts and drawing the animated base-game player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L93)

<a id="field-field-mq3-client-ui-players-action-detail-detail-src-mq3-client-ui-players-ml-1338456657"></a>
### detail

```ml
detail
```

Additional text payload required by the selected host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L100)

<a id="field-field-mq3-client-ui-players-action-dispatched-dispatched-src-mq3-client-ui-players-ml-1714022577"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while loading model parts and drawing the animated base-game player preview; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L108)

<a id="field-field-mq3-client-ui-players-action-kind-kind-src-mq3-client-ui-players-ml-1924756559"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while loading model parts and drawing the animated base-game player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L96)

<a id="field-field-mq3-client-ui-players-action-name-name-src-mq3-client-ui-players-ml-882046233"></a>
### name

```ml
name
```

Model, skin, shader, or sound resource referenced while preparing the Baseq3 menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L98)

<a id="field-field-mq3-client-ui-players-action-number-number-src-mq3-client-ui-players-ml-621067397"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while loading model parts and drawing the animated base-game player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L103)

<a id="field-field-mq3-client-ui-players-action-vector-vector-src-mq3-client-ui-players-ml-1029500365"></a>
### vector

```ml
vector
```

Vector argument interpreted according to the queued operation's kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L105)
