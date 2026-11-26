# `mq3.botlib.aas_reachability.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-reachability-ml-713478871.md)

<a id="struct-struct-mq3-botlib-aas-reachability-services-struct-services-src-mq3-botlib-aas-reachability-ml-463021715"></a>
## Services

```ml
struct Services
```

`Services` record for aas reachability, containing `pointAreaFn`, `pointContentsFn`, `bboxAreasFn`, `traceFn` and `teamFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L192)

## Members

<a id="field-field-mq3-botlib-aas-reachability-services-bboxareasfn-bboxareasfn-src-mq3-botlib-aas-reachability-ml-1120120775"></a>
### bboxAreasFn

```ml
bboxAreasFn
```

Host callback that finds AAS areas intersected by a bounding box.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L198)

<a id="field-field-mq3-botlib-aas-reachability-services-context-context-src-mq3-botlib-aas-reachability-ml-1542769991"></a>
### context

```ml
context
```

Caller-supplied data associated with geometry, collision, team, and time queries during reachability generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L207)

<a id="field-field-mq3-botlib-aas-reachability-services-pointareafn-pointareafn-src-mq3-botlib-aas-reachability-ml-417775455"></a>
### pointAreaFn

```ml
pointAreaFn
```

Host callback that returns the AAS area containing a point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L194)

<a id="field-field-mq3-botlib-aas-reachability-services-pointcontentsfn-pointcontentsfn-src-mq3-botlib-aas-reachability-ml-1953684027"></a>
### pointContentsFn

```ml
pointContentsFn
```

Host callback that queries world contents at a supplied point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L196)

<a id="field-field-mq3-botlib-aas-reachability-services-teamfn-teamfn-src-mq3-botlib-aas-reachability-ml-1384028713"></a>
### teamFn

```ml
teamFn
```

Host callback that returns team restrictions needed when generating reachabilities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L202)

<a id="field-field-mq3-botlib-aas-reachability-services-timefn-timefn-src-mq3-botlib-aas-reachability-ml-1477997761"></a>
### timeFn

```ml
timeFn
```

Host callback that supplies the current time used by the bot runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L204)

<a id="field-field-mq3-botlib-aas-reachability-services-tracefn-tracefn-src-mq3-botlib-aas-reachability-ml-360377683"></a>
### traceFn

```ml
traceFn
```

Host callback that performs a collision sweep through the host world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L200)
