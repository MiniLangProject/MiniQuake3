# `mq3.client.cgame_ents.Boundary`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-ents-ml-1890303843.md)

<a id="struct-struct-mq3-client-cgame-ents-boundary-struct-boundary-src-mq3-client-cgame-ents-ml-874842343"></a>
## Boundary

```ml
struct Boundary
```

Stores client game ents boundary record, including `boundary`, `kind`, `entity`, `origin`, `velocity`, `render` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L97)

## Members

<a id="field-field-mq3-client-cgame-ents-boundary-boundary-boundary-src-mq3-client-cgame-ents-ml-183317985"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while presenting snapshot entities through scene and sound services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L100)

<a id="field-field-mq3-client-cgame-ents-boundary-dispatched-dispatched-src-mq3-client-cgame-ents-ml-1673981455"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while presenting snapshot entities through scene and sound services; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L119)

<a id="field-field-mq3-client-cgame-ents-boundary-entity-entity-src-mq3-client-cgame-ents-ml-1162537351"></a>
### entity

```ml
entity
```

When constructing this record, `boundary` supplies `entity` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L105)

<a id="field-field-mq3-client-cgame-ents-boundary-kind-kind-src-mq3-client-cgame-ents-ml-927452953"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while presenting snapshot entities through scene and sound services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L103)

<a id="field-field-mq3-client-cgame-ents-boundary-origin-origin-src-mq3-client-cgame-ents-ml-1848490417"></a>
### origin

```ml
origin
```

World-space position accompanying a snapshot entity's scene or sound request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L107)

<a id="field-field-mq3-client-cgame-ents-boundary-render-render-src-mq3-client-cgame-ents-ml-1533362533"></a>
### render

```ml
render
```

When constructing this record, `boundary` supplies `renderValue` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L111)

<a id="field-field-mq3-client-cgame-ents-boundary-sound-sound-src-mq3-client-cgame-ents-ml-1248906121"></a>
### sound

```ml
sound
```

Sound resource carried by an entity audio action at the host dispatch boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L113)

<a id="field-field-mq3-client-cgame-ents-boundary-value-value-src-mq3-client-cgame-ents-ml-645178977"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while presenting snapshot entities through scene and sound services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L116)

<a id="field-field-mq3-client-cgame-ents-boundary-velocity-velocity-src-mq3-client-cgame-ents-ml-18550887"></a>
### velocity

```ml
velocity
```

Linear rate of change of position used by movement or effect integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L109)
