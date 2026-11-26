# `mq3.botlib.aas_client_trace.Segment`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-client-trace-ml-566175929.md)

<a id="struct-struct-mq3-botlib-aas-client-trace-segment-struct-segment-src-mq3-botlib-aas-client-trace-ml-1362200283"></a>
## Segment

```ml
struct Segment
```

`Segment` record for aas client trace, containing `start`, `finish`, `nodeNum` and `planeNum`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_trace.ml#L16)

## Members

<a id="field-field-mq3-botlib-aas-client-trace-segment-finish-finish-src-mq3-botlib-aas-client-trace-ml-715209832"></a>
### finish

```ml
finish
```

End of the remaining line segment being tested against an AAS subtree.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_trace.ml#L20)

<a id="field-field-mq3-botlib-aas-client-trace-segment-nodenum-nodenum-src-mq3-botlib-aas-client-trace-ml-1100800430"></a>
### nodeNum

```ml
nodeNum
```

Index of the BSP or AAS node visited by this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_trace.ml#L22)

<a id="field-field-mq3-botlib-aas-client-trace-segment-planenum-planenum-src-mq3-botlib-aas-client-trace-ml-1818324290"></a>
### planeNum

```ml
planeNum
```

Last AAS splitting plane crossed before entering this trace segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_trace.ml#L24)

<a id="field-field-mq3-botlib-aas-client-trace-segment-start-start-src-mq3-botlib-aas-client-trace-ml-333870818"></a>
### start

```ml
start
```

Beginning of the remaining line segment being tested against an AAS subtree.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_trace.ml#L18)
