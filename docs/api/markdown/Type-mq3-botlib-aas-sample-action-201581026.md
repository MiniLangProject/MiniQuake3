# `mq3.botlib.aas_sample.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-sample-ml-257202176.md)

<a id="struct-struct-mq3-botlib-aas-sample-action-struct-action-src-mq3-botlib-aas-sample-ml-740944097"></a>
## Action

```ml
struct Action
```

`Action` record for aas sample, containing `boundary`, `kind`, `subject`, `detail` and `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L79)

## Members

<a id="field-field-mq3-botlib-aas-sample-action-boundary-boundary-src-mq3-botlib-aas-sample-ml-150057591"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L81)

<a id="field-field-mq3-botlib-aas-sample-action-detail-detail-src-mq3-botlib-aas-sample-ml-129160709"></a>
### detail

```ml
detail
```

Additional diagnostic information about the recorded operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L87)

<a id="field-field-mq3-botlib-aas-sample-action-dispatched-dispatched-src-mq3-botlib-aas-sample-ml-996993269"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L89)

<a id="field-field-mq3-botlib-aas-sample-action-kind-kind-src-mq3-botlib-aas-sample-ml-1604033319"></a>
### kind

```ml
kind
```

Discriminator identifying the recorded area-linking operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L83)

<a id="field-field-mq3-botlib-aas-sample-action-subject-subject-src-mq3-botlib-aas-sample-ml-2049730183"></a>
### subject

```ml
subject
```

Entity or area identifier affected by the recorded operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L85)
