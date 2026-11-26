# `mq3.format.aas.Reachability`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-reachability-struct-reachability-src-mq3-format-aas-ml-1508294231"></a>
## Reachability

```ml
struct Reachability
```

Reachability record for format.aas, containing `areaNum`, `faceNum`, `edgeNum`, `start`, `finish`, `travelType`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L302)

## Members

<a id="field-field-mq3-format-aas-reachability-areanum-areanum-src-mq3-format-aas-ml-1482215590"></a>
### areaNum

```ml
areaNum
```

Destination area reached by this serialized navigation connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L304)

<a id="field-field-mq3-format-aas-reachability-edgenum-edgenum-src-mq3-format-aas-ml-1673484050"></a>
### edgeNum

```ml
edgeNum
```

Index of the AAS edge associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L308)

<a id="field-field-mq3-format-aas-reachability-facenum-facenum-src-mq3-format-aas-ml-862931874"></a>
### faceNum

```ml
faceNum
```

Index of the AAS face associated with the movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L306)

<a id="field-field-mq3-format-aas-reachability-finish-finish-src-mq3-format-aas-ml-987964260"></a>
### finish

```ml
finish
```

Arrival position stored for this serialized area-to-area connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L312)

<a id="field-field-mq3-format-aas-reachability-start-start-src-mq3-format-aas-ml-1316519190"></a>
### start

```ml
start
```

Departure position stored for this serialized area-to-area connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L310)

<a id="field-field-mq3-format-aas-reachability-traveltime-traveltime-src-mq3-format-aas-ml-1881489840"></a>
### travelTime

```ml
travelTime
```

AAS travel cost assigned to traversing this movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L316)

<a id="field-field-mq3-format-aas-reachability-traveltype-traveltype-src-mq3-format-aas-ml-408034862"></a>
### travelType

```ml
travelType
```

Encoded AAS movement type required to traverse this link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L314)
