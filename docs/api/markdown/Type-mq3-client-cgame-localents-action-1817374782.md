# `mq3.client.cgame_localents.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-localents-ml-2123896286.md)

<a id="struct-struct-mq3-client-cgame-localents-action-struct-action-src-mq3-client-cgame-localents-ml-1856050307"></a>
## Action

```ml
struct Action
```

Stores client game localents queued engine action, including `boundary`, `kind`, `entity`, `origin`, `normal`, `scalar` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L173)

## Members

<a id="field-field-mq3-client-cgame-localents-action-boundary-boundary-src-mq3-client-cgame-localents-ml-153777439"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while advancing temporary fragments, puffs, marks, and other local effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L176)

<a id="field-field-mq3-client-cgame-localents-action-color-color-src-mq3-client-cgame-localents-ml-1036138107"></a>
### color

```ml
color
```

Color payload of the local-effect host action, such as faded shader RGBA or light RGB.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L189)

<a id="field-field-mq3-client-cgame-localents-action-data-data-src-mq3-client-cgame-localents-ml-571676523"></a>
### data

```ml
data
```

When constructing this record, `boundary` supplies `data` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L191)

<a id="field-field-mq3-client-cgame-localents-action-dispatched-dispatched-src-mq3-client-cgame-localents-ml-598611845"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while advancing temporary fragments, puffs, marks, and other local effects; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L194)

<a id="field-field-mq3-client-cgame-localents-action-entity-entity-src-mq3-client-cgame-localents-ml-440676153"></a>
### entity

```ml
entity
```

When constructing this record, `boundary` supplies `le.id` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L181)

<a id="field-field-mq3-client-cgame-localents-action-kind-kind-src-mq3-client-cgame-localents-ml-1666120175"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while advancing temporary fragments, puffs, marks, and other local effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L179)

<a id="field-field-mq3-client-cgame-localents-action-normal-normal-src-mq3-client-cgame-localents-ml-552047857"></a>
### normal

```ml
normal
```

Collision-surface normal supplied when a local effect requests a blood or burn mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L185)

<a id="field-field-mq3-client-cgame-localents-action-origin-origin-src-mq3-client-cgame-localents-ml-1820529823"></a>
### origin

```ml
origin
```

World-space location at which the local-entity update requests a render, mark, or sound effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L183)

<a id="field-field-mq3-client-cgame-localents-action-scalar-scalar-src-mq3-client-cgame-localents-ml-1010522951"></a>
### scalar

```ml
scalar
```

When constructing this record, `boundary` supplies `scalar` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L187)
