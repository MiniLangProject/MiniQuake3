# `mq3.botlib.aas_clustering.AreaSettings`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-clustering-ml-1254362060.md)

<a id="struct-struct-mq3-botlib-aas-clustering-areasettings-struct-areasettings-src-mq3-botlib-aas-clustering-ml-1237623601"></a>
## AreaSettings

```ml
struct AreaSettings
```

`AreaSettings` record for aas clustering, containing `contents`, `areaFlags`, `presenceType`, `cluster` and `clusterAreaNum` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L66)

## Members

<a id="field-field-mq3-botlib-aas-clustering-areasettings-areaflags-areaflags-src-mq3-botlib-aas-clustering-ml-1200561433"></a>
### areaFlags

```ml
areaFlags
```

Several area flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L70)

<a id="field-field-mq3-botlib-aas-clustering-areasettings-cluster-cluster-src-mq3-botlib-aas-clustering-ml-217800913"></a>
### cluster

```ml
cluster
```

Cluster the area belongs to, if negative it's a portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L74)

<a id="field-field-mq3-botlib-aas-clustering-areasettings-clusterareanum-clusterareanum-src-mq3-botlib-aas-clustering-ml-591387507"></a>
### clusterAreaNum

```ml
clusterAreaNum
```

Number of the area in the cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L76)

<a id="field-field-mq3-botlib-aas-clustering-areasettings-contents-contents-src-mq3-botlib-aas-clustering-ml-947801281"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L68)

<a id="field-field-mq3-botlib-aas-clustering-areasettings-firstreachablearea-firstreachablearea-src-mq3-botlib-aas-clustering-ml-1395572209"></a>
### firstReachableArea

```ml
firstReachableArea
```

First outgoing reachability index for this area in the shared reachability array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L80)

<a id="field-field-mq3-botlib-aas-clustering-areasettings-numreachableareas-numreachableareas-src-mq3-botlib-aas-clustering-ml-1817660625"></a>
### numReachableAreas

```ml
numReachableAreas
```

Number of outgoing reachability records belonging to this AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L78)

<a id="field-field-mq3-botlib-aas-clustering-areasettings-presencetype-presencetype-src-mq3-botlib-aas-clustering-ml-1281083411"></a>
### presenceType

```ml
presenceType
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L72)
