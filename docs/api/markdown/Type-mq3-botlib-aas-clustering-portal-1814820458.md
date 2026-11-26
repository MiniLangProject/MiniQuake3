# `mq3.botlib.aas_clustering.Portal`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-clustering-ml-1254362060.md)

<a id="struct-struct-mq3-botlib-aas-clustering-portal-struct-portal-src-mq3-botlib-aas-clustering-ml-1709137173"></a>
## Portal

```ml
struct Portal
```

`Portal` record for aas clustering, containing `areaNum`, `frontCluster`, `backCluster` and `clusterAreaNums`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L90)

## Members

<a id="field-field-mq3-botlib-aas-clustering-portal-areanum-areanum-src-mq3-botlib-aas-clustering-ml-1176701119"></a>
### areaNum

```ml
areaNum
```

Area assigned as a portal while building the navigation cluster graph.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L92)

<a id="field-field-mq3-botlib-aas-clustering-portal-backcluster-backcluster-src-mq3-botlib-aas-clustering-ml-1412858635"></a>
### backCluster

```ml
backCluster
```

Cluster at back of portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L96)

<a id="field-field-mq3-botlib-aas-clustering-portal-clusterareanums-clusterareanums-src-mq3-botlib-aas-clustering-ml-1170313751"></a>
### clusterAreaNums

```ml
clusterAreaNums
```

Area indexes of this portal within its front and back clusters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L98)

<a id="field-field-mq3-botlib-aas-clustering-portal-frontcluster-frontcluster-src-mq3-botlib-aas-clustering-ml-551656421"></a>
### frontCluster

```ml
frontCluster
```

Cluster at front of portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L94)
