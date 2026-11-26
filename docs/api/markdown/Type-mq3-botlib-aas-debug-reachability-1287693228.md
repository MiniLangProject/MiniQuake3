# `mq3.botlib.aas_debug.Reachability`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-debug-ml-718446593.md)

<a id="struct-struct-mq3-botlib-aas-debug-reachability-struct-reachability-src-mq3-botlib-aas-debug-ml-607570451"></a>
## Reachability

```ml
struct Reachability
```

`Reachability` record for aas debug, containing `areaNum`, `faceNum`, `edgeNum`, `start` and `finish` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L132)

## Members

<a id="field-field-mq3-botlib-aas-debug-reachability-areanum-areanum-src-mq3-botlib-aas-debug-ml-1621235662"></a>
### areaNum

```ml
areaNum
```

Destination navigation area highlighted for this debug connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L134)

<a id="field-field-mq3-botlib-aas-debug-reachability-edgenum-edgenum-src-mq3-botlib-aas-debug-ml-1001437026"></a>
### edgeNum

```ml
edgeNum
```

Index of the AAS edge associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L138)

<a id="field-field-mq3-botlib-aas-debug-reachability-facenum-facenum-src-mq3-botlib-aas-debug-ml-1095118322"></a>
### faceNum

```ml
faceNum
```

Index of the AAS face associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L136)

<a id="field-field-mq3-botlib-aas-debug-reachability-finish-finish-src-mq3-botlib-aas-debug-ml-504172188"></a>
### finish

```ml
finish
```

Arrival point drawn for this navigation connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L142)

<a id="field-field-mq3-botlib-aas-debug-reachability-start-start-src-mq3-botlib-aas-debug-ml-112773910"></a>
### start

```ml
start
```

Departure point drawn for this navigation connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L140)

<a id="field-field-mq3-botlib-aas-debug-reachability-traveltime-traveltime-src-mq3-botlib-aas-debug-ml-520575868"></a>
### travelTime

```ml
travelTime
```

AAS travel cost assigned to traversing this movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L146)

<a id="field-field-mq3-botlib-aas-debug-reachability-traveltype-traveltype-src-mq3-botlib-aas-debug-ml-1880275130"></a>
### travelType

```ml
travelType
```

Encoded AAS movement type required to traverse this link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L144)
