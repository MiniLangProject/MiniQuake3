# `mq3.botlib.aas_optimizer.Reachability`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-optimizer-ml-949906489.md)

<a id="struct-struct-mq3-botlib-aas-optimizer-reachability-struct-reachability-src-mq3-botlib-aas-optimizer-ml-938396475"></a>
## Reachability

```ml
struct Reachability
```

`Reachability` record for aas optimizer, containing `areaNum`, `faceNum`, `edgeNum`, `start` and `finish` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L55)

## Members

<a id="field-field-mq3-botlib-aas-optimizer-reachability-areanum-areanum-src-mq3-botlib-aas-optimizer-ml-290611482"></a>
### areaNum

```ml
areaNum
```

Destination area preserved for the compacted navigation connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L57)

<a id="field-field-mq3-botlib-aas-optimizer-reachability-edgenum-edgenum-src-mq3-botlib-aas-optimizer-ml-1224161246"></a>
### edgeNum

```ml
edgeNum
```

Index of the AAS edge associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L61)

<a id="field-field-mq3-botlib-aas-optimizer-reachability-facenum-facenum-src-mq3-botlib-aas-optimizer-ml-595224446"></a>
### faceNum

```ml
faceNum
```

Index of the AAS face associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L59)

<a id="field-field-mq3-botlib-aas-optimizer-reachability-finish-finish-src-mq3-botlib-aas-optimizer-ml-175828172"></a>
### finish

```ml
finish
```

Arrival point preserved when compacting this navigation connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L65)

<a id="field-field-mq3-botlib-aas-optimizer-reachability-start-start-src-mq3-botlib-aas-optimizer-ml-1513993394"></a>
### start

```ml
start
```

Departure point preserved when compacting this navigation connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L63)

<a id="field-field-mq3-botlib-aas-optimizer-reachability-traveltime-traveltime-src-mq3-botlib-aas-optimizer-ml-161743724"></a>
### travelTime

```ml
travelTime
```

AAS travel cost assigned to traversing this movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L69)

<a id="field-field-mq3-botlib-aas-optimizer-reachability-traveltype-traveltype-src-mq3-botlib-aas-optimizer-ml-1868912518"></a>
### travelType

```ml
travelType
```

Encoded AAS movement type required to traverse this link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L67)
