# `mq3.botlib.aas_debug.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-debug-ml-718446593.md)

<a id="struct-struct-mq3-botlib-aas-debug-action-struct-action-src-mq3-botlib-aas-debug-ml-1524586743"></a>
## Action

```ml
struct Action
```

`Action` record for aas debug, containing `boundary`, `kind`, `id`, `color` and `points` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L70)

## Members

<a id="field-field-mq3-botlib-aas-debug-action-boundary-boundary-src-mq3-botlib-aas-debug-ml-1199954447"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L72)

<a id="field-field-mq3-botlib-aas-debug-action-color-color-src-mq3-botlib-aas-debug-ml-822143935"></a>
### color

```ml
color
```

Color components associated with the vertex or debug primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L78)

<a id="field-field-mq3-botlib-aas-debug-action-dispatched-dispatched-src-mq3-botlib-aas-debug-ml-2022434785"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L84)

<a id="field-field-mq3-botlib-aas-debug-action-id-id-src-mq3-botlib-aas-debug-ml-1310384569"></a>
### id

```ml
id
```

Handle of the debug line or polygon affected by the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L76)

<a id="field-field-mq3-botlib-aas-debug-action-kind-kind-src-mq3-botlib-aas-debug-ml-1242844295"></a>
### kind

```ml
kind
```

Discriminator selecting a navigation debug-drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L74)

<a id="field-field-mq3-botlib-aas-debug-action-points-points-src-mq3-botlib-aas-debug-ml-36505113"></a>
### points

```ml
points
```

XYZ points defining the debug shape, polygon, or winding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L80)

<a id="field-field-mq3-botlib-aas-debug-action-values-values-src-mq3-botlib-aas-debug-ml-1900303727"></a>
### values

```ml
values
```

Additional scalar drawing parameters associated with the debug action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L82)
