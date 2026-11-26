# `mq3.botlib.aas_runtime.AreaInfo`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)

<a id="struct-struct-mq3-botlib-aas-runtime-areainfo-struct-areainfo-src-mq3-botlib-aas-runtime-ml-761834851"></a>
## AreaInfo

```ml
struct AreaInfo
```

`AreaInfo` record for aas runtime, containing `contents`, `flags`, `presenceType`, `cluster` and `clusterAreaNum` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L35)

## Members

<a id="field-field-mq3-botlib-aas-runtime-areainfo-center-center-src-mq3-botlib-aas-runtime-ml-1317602002"></a>
### center

```ml
center
```

'center' of the area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L55)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-cluster-cluster-src-mq3-botlib-aas-runtime-ml-985596344"></a>
### cluster

```ml
cluster
```

Navigation cluster containing this area, or a portal-cluster marker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L43)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-clusterareanum-clusterareanum-src-mq3-botlib-aas-runtime-ml-197756374"></a>
### clusterAreaNum

```ml
clusterAreaNum
```

Index of the area within its containing navigation cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L45)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-contents-contents-src-mq3-botlib-aas-runtime-ml-525701704"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L37)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-firstreachablearea-firstreachablearea-src-mq3-botlib-aas-runtime-ml-172330072"></a>
### firstReachableArea

```ml
firstReachableArea
```

First outgoing reachability index for this area in the shared reachability array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L49)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-flags-flags-src-mq3-botlib-aas-runtime-ml-1766736120"></a>
### flags

```ml
flags
```

Combined AAS area-property flags read from the area settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L39)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-maxs-maxs-src-mq3-botlib-aas-runtime-ml-1551864942"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the navigation area returned by this runtime query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L53)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-mins-mins-src-mq3-botlib-aas-runtime-ml-1027117746"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the navigation area returned by this runtime query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L51)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-numreachableareas-numreachableareas-src-mq3-botlib-aas-runtime-ml-471626744"></a>
### numReachableAreas

```ml
numReachableAreas
```

Number of outgoing reachability records belonging to this AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L47)

<a id="field-field-mq3-botlib-aas-runtime-areainfo-presencetype-presencetype-src-mq3-botlib-aas-runtime-ml-344493874"></a>
### presenceType

```ml
presenceType
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L41)
