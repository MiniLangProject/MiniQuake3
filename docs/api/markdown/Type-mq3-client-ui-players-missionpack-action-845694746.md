# `mq3.client.ui_players_missionpack.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-action-struct-action-src-mq3-client-ui-players-missionpack-ml-1201989929"></a>
## Action

```ml
struct Action
```

Stores UI players missionpack queued engine action, including `boundary`, `kind`, `name`, `detail`, `number`, `vector` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L90)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-action-boundary-boundary-src-mq3-client-ui-players-missionpack-ml-483074423"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while loading team-aware model parts and drawing the Missionpack player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L93)

<a id="field-field-mq3-client-ui-players-missionpack-action-detail-detail-src-mq3-client-ui-players-missionpack-ml-1331520093"></a>
### detail

```ml
detail
```

Additional text payload required by the selected host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L101)

<a id="field-field-mq3-client-ui-players-missionpack-action-dispatched-dispatched-src-mq3-client-ui-players-missionpack-ml-1849969453"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while loading team-aware model parts and drawing the Missionpack player preview; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L109)

<a id="field-field-mq3-client-ui-players-missionpack-action-kind-kind-src-mq3-client-ui-players-missionpack-ml-264269415"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while loading team-aware model parts and drawing the Missionpack player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L96)

<a id="field-field-mq3-client-ui-players-missionpack-action-name-name-src-mq3-client-ui-players-missionpack-ml-991188565"></a>
### name

```ml
name
```

Model, skin, shader, or sound resource referenced while preparing the Missionpack menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L99)

<a id="field-field-mq3-client-ui-players-missionpack-action-number-number-src-mq3-client-ui-players-missionpack-ml-332645665"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while loading team-aware model parts and drawing the Missionpack player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L104)

<a id="field-field-mq3-client-ui-players-missionpack-action-vector-vector-src-mq3-client-ui-players-missionpack-ml-1394420121"></a>
### vector

```ml
vector
```

Vector argument interpreted according to the queued operation's kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L106)
