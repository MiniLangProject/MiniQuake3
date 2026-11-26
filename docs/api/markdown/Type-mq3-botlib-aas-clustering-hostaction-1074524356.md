# `mq3.botlib.aas_clustering.HostAction`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-clustering-ml-1254362060.md)

<a id="struct-struct-mq3-botlib-aas-clustering-hostaction-struct-hostaction-src-mq3-botlib-aas-clustering-ml-952320713"></a>
## HostAction

```ml
struct HostAction
```

`HostAction` record for aas clustering, containing `boundary`, `kind`, `subject`, `detail` and `value` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L129)

## Members

<a id="field-field-mq3-botlib-aas-clustering-hostaction-boundary-boundary-src-mq3-botlib-aas-clustering-ml-370682309"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L131)

<a id="field-field-mq3-botlib-aas-clustering-hostaction-detail-detail-src-mq3-botlib-aas-clustering-ml-746756275"></a>
### detail

```ml
detail
```

Textual detail describing the clustering action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L137)

<a id="field-field-mq3-botlib-aas-clustering-hostaction-dispatched-dispatched-src-mq3-botlib-aas-clustering-ml-1259115787"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L141)

<a id="field-field-mq3-botlib-aas-clustering-hostaction-kind-kind-src-mq3-botlib-aas-clustering-ml-1932277509"></a>
### kind

```ml
kind
```

Discriminator selecting the host clustering action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L133)

<a id="field-field-mq3-botlib-aas-clustering-hostaction-subject-subject-src-mq3-botlib-aas-clustering-ml-540845509"></a>
### subject

```ml
subject
```

Map entity or navigation element affected by the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L135)

<a id="field-field-mq3-botlib-aas-clustering-hostaction-value-value-src-mq3-botlib-aas-clustering-ml-409819001"></a>
### value

```ml
value
```

Additional scalar argument associated with the clustering action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L139)
