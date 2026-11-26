# `mq3.format.aas.Portal`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-portal-struct-portal-src-mq3-format-aas-ml-1523525063"></a>
## Portal

```ml
struct Portal
```

Portal record for format.aas, containing `areaNum`, `frontCluster`, `backCluster`, `clusterAreaNums`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L326)

## Members

<a id="field-field-mq3-format-aas-portal-areanum-areanum-src-mq3-format-aas-ml-2121392015"></a>
### areaNum

```ml
areaNum
```

Navigation area forming the portal between two serialized clusters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L328)

<a id="field-field-mq3-format-aas-portal-backcluster-backcluster-src-mq3-format-aas-ml-1150260579"></a>
### backCluster

```ml
backCluster
```

Cluster at back of portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L332)

<a id="field-field-mq3-format-aas-portal-clusterareanums-clusterareanums-src-mq3-format-aas-ml-218926151"></a>
### clusterAreaNums

```ml
clusterAreaNums
```

Area indexes of this portal within its front and back clusters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L334)

<a id="field-field-mq3-format-aas-portal-frontcluster-frontcluster-src-mq3-format-aas-ml-235253137"></a>
### frontCluster

```ml
frontCluster
```

Cluster at front of portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L330)
