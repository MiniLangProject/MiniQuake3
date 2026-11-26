# `mq3.botlib.aas_sample.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-sample-ml-257202176.md)

<a id="struct-struct-mq3-botlib-aas-sample-services-struct-services-src-mq3-botlib-aas-sample-ml-89856905"></a>
## Services

```ml
struct Services
```

`Services` record for aas sample, containing `entityCollisionFn`, `pointContentsFn` and `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L44)

## Members

<a id="field-field-mq3-botlib-aas-sample-services-context-context-src-mq3-botlib-aas-sample-ml-1675169573"></a>
### context

```ml
context
```

Caller-supplied data associated with dynamic entity collisions and contents sampling around the navigation mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L51)

<a id="field-field-mq3-botlib-aas-sample-services-entitycollisionfn-entitycollisionfn-src-mq3-botlib-aas-sample-ml-625321337"></a>
### entityCollisionFn

```ml
entityCollisionFn
```

Host callback that tests collision against a game entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L46)

<a id="field-field-mq3-botlib-aas-sample-services-pointcontentsfn-pointcontentsfn-src-mq3-botlib-aas-sample-ml-1469339873"></a>
### pointContentsFn

```ml
pointContentsFn
```

Host callback that queries world contents at a supplied point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L48)
