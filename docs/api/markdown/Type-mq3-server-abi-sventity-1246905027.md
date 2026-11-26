# `mq3.server.abi.SvEntity`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-sventity-struct-sventity-src-mq3-server-abi-ml-1909818995"></a>
## SvEntity

```ml
struct SvEntity
```

SvEntity record for server.abi, containing `worldSector`, `nextEntityInWorldSector`, `baseline`, `numClusters`, `clusternums`, `lastCluster`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L123)

## Members

<a id="field-field-mq3-server-abi-sventity-areanum-areanum-src-mq3-server-abi-ml-191478779"></a>
### areanum

```ml
areanum
```

Primary collision area recorded in the native server-entity visibility bookkeeping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L137)

<a id="field-field-mq3-server-abi-sventity-areanum2-areanum2-src-mq3-server-abi-ml-402832045"></a>
### areanum2

```ml
areanum2
```

Second AAS area number used by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L139)

<a id="field-field-mq3-server-abi-sventity-baseline-baseline-src-mq3-server-abi-ml-853012069"></a>
### baseline

```ml
baseline
```

For delta compression of initial sighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L129)

<a id="field-field-mq3-server-abi-sventity-clusternums-clusternums-src-mq3-server-abi-ml-1375071063"></a>
### clusternums

```ml
clusternums
```

Visibility-cluster indexes intersected by the entity's bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L133)

<a id="field-field-mq3-server-abi-sventity-lastcluster-lastcluster-src-mq3-server-abi-ml-84181635"></a>
### lastCluster

```ml
lastCluster
```

Final visibility cluster used when the explicit cluster list overflows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L135)

<a id="field-field-mq3-server-abi-sventity-nextentityinworldsector-nextentityinworldsector-src-mq3-server-abi-ml-76890443"></a>
### nextEntityInWorldSector

```ml
nextEntityInWorldSector
```

Next entity in the sector's linked list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L127)

<a id="field-field-mq3-server-abi-sventity-numclusters-numclusters-src-mq3-server-abi-ml-1984040927"></a>
### numClusters

```ml
numClusters
```

Number of visibility clusters associated with this entity or map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L131)

<a id="field-field-mq3-server-abi-sventity-snapshotcounter-snapshotcounter-src-mq3-server-abi-ml-71193603"></a>
### snapshotCounter

```ml
snapshotCounter
```

Generation marker used to avoid adding an entity twice to one snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L141)

<a id="field-field-mq3-server-abi-sventity-worldsector-worldsector-src-mq3-server-abi-ml-1077508331"></a>
### worldSector

```ml
worldSector
```

Spatial world-sector record containing this linked entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L125)
