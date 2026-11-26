# `mq3.botlib.aas_reachability.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-reachability-ml-713478871.md)

<a id="struct-struct-mq3-botlib-aas-reachability-action-struct-action-src-mq3-botlib-aas-reachability-ml-78661459"></a>
## Action

```ml
struct Action
```

`Action` record for aas reachability, containing `boundary`, `kind`, `source`, `destination` and `detail` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L138)

## Members

<a id="field-field-mq3-botlib-aas-reachability-action-boundary-boundary-src-mq3-botlib-aas-reachability-ml-429280181"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L140)

<a id="field-field-mq3-botlib-aas-reachability-action-destination-destination-src-mq3-botlib-aas-reachability-ml-488709601"></a>
### destination

```ml
destination
```

Destination area or entity associated with the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L146)

<a id="field-field-mq3-botlib-aas-reachability-action-detail-detail-src-mq3-botlib-aas-reachability-ml-1189206527"></a>
### detail

```ml
detail
```

Additional diagnostic information about the generated movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L148)

<a id="field-field-mq3-botlib-aas-reachability-action-dispatched-dispatched-src-mq3-botlib-aas-reachability-ml-525415535"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L150)

<a id="field-field-mq3-botlib-aas-reachability-action-kind-kind-src-mq3-botlib-aas-reachability-ml-1637541165"></a>
### kind

```ml
kind
```

Discriminator identifying the recorded reachability-generation action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L142)

<a id="field-field-mq3-botlib-aas-reachability-action-source-source-src-mq3-botlib-aas-reachability-ml-2086859047"></a>
### source

```ml
source
```

Source area or entity associated with the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L144)
