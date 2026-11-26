# `mq3.client.cg_local.SkullTrail`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-skulltrail-struct-skulltrail-src-mq3-client-cg-local-ml-1709233163"></a>
## SkullTrail

```ml
struct SkullTrail
```

Stores client game local skull trail record, including `positions`, `numpositions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L544)

## Members

<a id="field-field-mq3-client-cg-local-skulltrail-numpositions-numpositions-src-mq3-client-cg-local-ml-1937839046"></a>
### numpositions

```ml
numpositions
```

Number of stored points currently participating in the skull trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L548)

<a id="field-field-mq3-client-cg-local-skulltrail-positions-positions-src-mq3-client-cg-local-ml-698842542"></a>
### positions

```ml
positions
```

Ordered positions used to build the stored trail or spatial history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L546)
