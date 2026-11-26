# `mq3.format.aas.AreaSettings`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-areasettings-struct-areasettings-src-mq3-format-aas-ml-1362092491"></a>
## AreaSettings

```ml
struct AreaSettings
```

AreaSettings record for format.aas, containing `contents`, `flags`, `presenceType`, `cluster`, `clusterAreaNum`, `numReachableAreas`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L285)

## Members

<a id="field-field-mq3-format-aas-areasettings-cluster-cluster-src-mq3-format-aas-ml-1814514873"></a>
### cluster

```ml
cluster
```

Cluster the area belongs to, if negative it's a portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L293)

<a id="field-field-mq3-format-aas-areasettings-clusterareanum-clusterareanum-src-mq3-format-aas-ml-162957895"></a>
### clusterAreaNum

```ml
clusterAreaNum
```

Number of the area in the cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L295)

<a id="field-field-mq3-format-aas-areasettings-contents-contents-src-mq3-format-aas-ml-1298242425"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L287)

<a id="field-field-mq3-format-aas-areasettings-firstreachablearea-firstreachablearea-src-mq3-format-aas-ml-1335604441"></a>
### firstReachableArea

```ml
firstReachableArea
```

First outgoing reachability index for this area in the shared reachability array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L299)

<a id="field-field-mq3-format-aas-areasettings-flags-flags-src-mq3-format-aas-ml-1175603209"></a>
### flags

```ml
flags
```

AAS area-property flags controlling movement and route availability.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L289)

<a id="field-field-mq3-format-aas-areasettings-numreachableareas-numreachableareas-src-mq3-format-aas-ml-455500681"></a>
### numReachableAreas

```ml
numReachableAreas
```

Number of outgoing reachability records belonging to this AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L297)

<a id="field-field-mq3-format-aas-areasettings-presencetype-presencetype-src-mq3-format-aas-ml-1413703663"></a>
### presenceType

```ml
presenceType
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L291)
