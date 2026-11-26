# `mq3.botlib.aas_routing.Heap`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-ml-230871418.md)

<a id="struct-struct-mq3-botlib-aas-routing-heap-struct-heap-src-mq3-botlib-aas-routing-ml-867054671"></a>
## Heap

```ml
struct Heap
```

`Heap` record for aas routing, containing `times`, `reaches`, `firstReaches`, `positions` and `size`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L152)

## Members

<a id="field-field-mq3-botlib-aas-routing-heap-firstreaches-firstreaches-src-mq3-botlib-aas-routing-ml-612701201"></a>
### firstReaches

```ml
firstReaches
```

First-hop reachability retained for each queued route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L158)

<a id="field-field-mq3-botlib-aas-routing-heap-positions-positions-src-mq3-botlib-aas-routing-ml-860511851"></a>
### positions

```ml
positions
```

Lookup from queued items to their current heap positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L160)

<a id="field-field-mq3-botlib-aas-routing-heap-reaches-reaches-src-mq3-botlib-aas-routing-ml-308526351"></a>
### reaches

```ml
reaches
```

Reachability indexes associated with queued search entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L156)

<a id="field-field-mq3-botlib-aas-routing-heap-size-size-src-mq3-botlib-aas-routing-ml-1694686061"></a>
### size

```ml
size
```

Number of routing candidates currently stored in the priority heap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L162)

<a id="field-field-mq3-botlib-aas-routing-heap-times-times-src-mq3-botlib-aas-routing-ml-1157114679"></a>
### times

```ml
times
```

Travel costs stored in the route-search priority queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L154)
