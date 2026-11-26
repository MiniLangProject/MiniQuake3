# `mq3.collision.visibility.Visibility`

[Home](README.md) · [Source file](File-src-mq3-collision-visibility-ml-1423508826.md)

<a id="struct-struct-mq3-collision-visibility-visibility-struct-visibility-src-mq3-collision-visibility-ml-754596001"></a>
## Visibility

```ml
struct Visibility
```

Visibility record for collision.visibility, containing `clusters`, `areas`, `numClusters`, `numAreas`, `clusterBytes`, `data`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L8)

## Members

<a id="field-field-mq3-collision-visibility-visibility-areas-areas-src-mq3-collision-visibility-ml-357096851"></a>
### areas

```ml
areas
```

Area records or area assignments used by navigation and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L12)

<a id="field-field-mq3-collision-visibility-visibility-clusterbytes-clusterbytes-src-mq3-collision-visibility-ml-151034205"></a>
### clusterBytes

```ml
clusterBytes
```

Byte stride of one cluster's visibility bit vector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L18)

<a id="field-field-mq3-collision-visibility-visibility-clusters-clusters-src-mq3-collision-visibility-ml-73783997"></a>
### clusters

```ml
clusters
```

Cluster records or assignments used to group navigation and visibility areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L10)

<a id="field-field-mq3-collision-visibility-visibility-data-data-src-mq3-collision-visibility-ml-1453454735"></a>
### data

```ml
data
```

Packed potentially-visible-set bits read from the BSP visibility lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L20)

<a id="field-field-mq3-collision-visibility-visibility-floodnums-floodnums-src-mq3-collision-visibility-ml-15566135"></a>
### floodnums

```ml
floodnums
```

Connected-area group numbers calculated by portal flood filling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L27)

<a id="field-field-mq3-collision-visibility-visibility-noareas-noareas-src-mq3-collision-visibility-ml-831367343"></a>
### noAreas

```ml
noAreas
```

True when portal-area visibility restrictions are disabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L29)

<a id="field-field-mq3-collision-visibility-visibility-numareas-numareas-src-mq3-collision-visibility-ml-1848787059"></a>
### numAreas

```ml
numAreas
```

Number of portal or navigation areas represented by the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L16)

<a id="field-field-mq3-collision-visibility-visibility-numclusters-numclusters-src-mq3-collision-visibility-ml-1688520711"></a>
### numClusters

```ml
numClusters
```

Number of visibility clusters associated with this entity or map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L14)

<a id="field-field-mq3-collision-visibility-visibility-portals-portals-src-mq3-collision-visibility-ml-1490790731"></a>
### portals

```ml
portals
```

Portal records joining navigation clusters or visibility areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L25)

<a id="field-field-mq3-collision-visibility-visibility-vised-vised-src-mq3-collision-visibility-ml-669762279"></a>
### vised

```ml
vised
```

True when the map provides per-cluster visibility data; otherwise all clusters are treated as visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/visibility.ml#L23)
