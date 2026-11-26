# `mq3.botlib.aas_trace_areas.Segment`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-trace-areas-ml-2060721500.md)

<a id="struct-struct-mq3-botlib-aas-trace-areas-segment-struct-segment-src-mq3-botlib-aas-trace-areas-ml-2066657227"></a>
## Segment

```ml
struct Segment
```

`Segment` record for aas trace areas, containing `start`, `finish`, `nodeNum` and `planeNum`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_trace_areas.ml#L10)

## Members

<a id="field-field-mq3-botlib-aas-trace-areas-segment-finish-finish-src-mq3-botlib-aas-trace-areas-ml-769977730"></a>
### finish

```ml
finish
```

End of the current segment used to enumerate crossed navigation areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_trace_areas.ml#L14)

<a id="field-field-mq3-botlib-aas-trace-areas-segment-nodenum-nodenum-src-mq3-botlib-aas-trace-areas-ml-2104286872"></a>
### nodeNum

```ml
nodeNum
```

Index of the BSP or AAS node visited by this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_trace_areas.ml#L16)

<a id="field-field-mq3-botlib-aas-trace-areas-segment-planenum-planenum-src-mq3-botlib-aas-trace-areas-ml-241225032"></a>
### planeNum

```ml
planeNum
```

Splitting plane crossed to enter the segment while collecting traversed areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_trace_areas.ml#L18)

<a id="field-field-mq3-botlib-aas-trace-areas-segment-start-start-src-mq3-botlib-aas-trace-areas-ml-1166197844"></a>
### start

```ml
start
```

Beginning of the current segment used to enumerate crossed navigation areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_trace_areas.ml#L12)
