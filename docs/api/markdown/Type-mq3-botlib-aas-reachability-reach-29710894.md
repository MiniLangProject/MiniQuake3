# `mq3.botlib.aas_reachability.Reach`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-reachability-ml-713478871.md)

<a id="struct-struct-mq3-botlib-aas-reachability-reach-struct-reach-src-mq3-botlib-aas-reachability-ml-1721167271"></a>
## Reach

```ml
struct Reach
```

`Reach` record for aas reachability, containing `sourceArea`, `areaNum`, `faceNum`, `edgeNum` and `start` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L96)

## Members

<a id="field-field-mq3-botlib-aas-reachability-reach-allocated-allocated-src-mq3-botlib-aas-reachability-ml-1875460012"></a>
### allocated

```ml
allocated
```

True when the represented object currently owns a live allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L114)

<a id="field-field-mq3-botlib-aas-reachability-reach-areanum-areanum-src-mq3-botlib-aas-reachability-ml-811502160"></a>
### areaNum

```ml
areaNum
```

Destination area assigned to the generated movement connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L100)

<a id="field-field-mq3-botlib-aas-reachability-reach-edgenum-edgenum-src-mq3-botlib-aas-reachability-ml-949628476"></a>
### edgeNum

```ml
edgeNum
```

Index of the AAS edge associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L104)

<a id="field-field-mq3-botlib-aas-reachability-reach-facenum-facenum-src-mq3-botlib-aas-reachability-ml-357076652"></a>
### faceNum

```ml
faceNum
```

Index of the AAS face associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L102)

<a id="field-field-mq3-botlib-aas-reachability-reach-finish-finish-src-mq3-botlib-aas-reachability-ml-523326238"></a>
### finish

```ml
finish
```

Generated arrival point for this candidate movement connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L108)

<a id="field-field-mq3-botlib-aas-reachability-reach-sourcearea-sourcearea-src-mq3-botlib-aas-reachability-ml-187160400"></a>
### sourceArea

```ml
sourceArea
```

AAS area from which this reachability or route begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L98)

<a id="field-field-mq3-botlib-aas-reachability-reach-start-start-src-mq3-botlib-aas-reachability-ml-571726672"></a>
### start

```ml
start
```

Generated departure point for this candidate movement connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L106)

<a id="field-field-mq3-botlib-aas-reachability-reach-traveltime-traveltime-src-mq3-botlib-aas-reachability-ml-781393654"></a>
### travelTime

```ml
travelTime
```

AAS travel cost assigned to traversing this movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L112)

<a id="field-field-mq3-botlib-aas-reachability-reach-traveltype-traveltype-src-mq3-botlib-aas-reachability-ml-622463228"></a>
### travelType

```ml
travelType
```

Encoded AAS movement type required to traverse this link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L110)
