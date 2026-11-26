# `mq3.botlib.be_aas_route.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-route-ml-448925219.md)

<a id="struct-struct-mq3-botlib-be-aas-route-services-struct-services-src-mq3-botlib-be-aas-route-ml-882783543"></a>
## Services

```ml
struct Services
```

`Services` record for be aas route, containing `context`, `visibleFn`, `traceAreasFn` and `randomFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L19)

## Members

<a id="field-field-mq3-botlib-be-aas-route-services-context-context-src-mq3-botlib-be-aas-route-ml-2142279019"></a>
### context

```ml
context
```

Caller-supplied data associated with route visibility checks, crossed-area traces, and random route selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L22)

<a id="field-field-mq3-botlib-be-aas-route-services-randomfn-randomfn-src-mq3-botlib-be-aas-route-ml-1785196229"></a>
### randomFn

```ml
randomFn
```

Host callback that supplies the random values used by bot selection and fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L28)

<a id="field-field-mq3-botlib-be-aas-route-services-traceareasfn-traceareasfn-src-mq3-botlib-be-aas-route-ml-1841047997"></a>
### traceAreasFn

```ml
traceAreasFn
```

Host callback that finds AAS areas crossed by a line segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L26)

<a id="field-field-mq3-botlib-be-aas-route-services-visiblefn-visiblefn-src-mq3-botlib-be-aas-route-ml-1517158635"></a>
### visibleFn

```ml
visibleFn
```

Host callback that tests visibility between candidate routing positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L24)
