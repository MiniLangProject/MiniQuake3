# `mq3.botlib.aas_optimizer.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-optimizer-ml-949906489.md)

<a id="struct-struct-mq3-botlib-aas-optimizer-action-struct-action-src-mq3-botlib-aas-optimizer-ml-996110751"></a>
## Action

```ml
struct Action
```

`Action` record for aas optimizer, containing `boundary`, `kind`, `text` and `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L72)

## Members

<a id="field-field-mq3-botlib-aas-optimizer-action-boundary-boundary-src-mq3-botlib-aas-optimizer-ml-1409639207"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L74)

<a id="field-field-mq3-botlib-aas-optimizer-action-dispatched-dispatched-src-mq3-botlib-aas-optimizer-ml-487126517"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L80)

<a id="field-field-mq3-botlib-aas-optimizer-action-kind-kind-src-mq3-botlib-aas-optimizer-ml-1356652511"></a>
### kind

```ml
kind
```

Discriminator selecting an optimization diagnostic or host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L76)

<a id="field-field-mq3-botlib-aas-optimizer-action-text-text-src-mq3-botlib-aas-optimizer-ml-1276354957"></a>
### text

```ml
text
```

Diagnostic text emitted while optimizing navigation data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L78)
