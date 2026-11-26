# `mq3.client.cgame_view.Boundary`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-view-ml-1544499938.md)

<a id="struct-struct-mq3-client-cgame-view-boundary-struct-boundary-src-mq3-client-cgame-view-ml-2007533197"></a>
## Boundary

```ml
struct Boundary
```

Stores client game view boundary record, including `domain`, `kind`, `entity`, `sound`, `value`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L161)

## Members

<a id="field-field-mq3-client-cgame-view-boundary-dispatched-dispatched-src-mq3-client-cgame-view-ml-201261297"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while building the camera view and submitting scene-related work; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L176)

<a id="field-field-mq3-client-cgame-view-boundary-domain-domain-src-mq3-client-cgame-view-ml-1921435667"></a>
### domain

```ml
domain
```

When constructing this record, `boundary` supplies `domain` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L163)

<a id="field-field-mq3-client-cgame-view-boundary-entity-entity-src-mq3-client-cgame-view-ml-904403629"></a>
### entity

```ml
entity
```

When constructing this record, `boundary` supplies `entity` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L168)

<a id="field-field-mq3-client-cgame-view-boundary-kind-kind-src-mq3-client-cgame-view-ml-1505974463"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while building the camera view and submitting scene-related work.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L166)

<a id="field-field-mq3-client-cgame-view-boundary-sound-sound-src-mq3-client-cgame-view-ml-673305283"></a>
### sound

```ml
sound
```

Sound resource carried by a view or announcer audio action at the host dispatch boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L170)

<a id="field-field-mq3-client-cgame-view-boundary-value-value-src-mq3-client-cgame-view-ml-599061307"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while building the camera view and submitting scene-related work.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L173)
