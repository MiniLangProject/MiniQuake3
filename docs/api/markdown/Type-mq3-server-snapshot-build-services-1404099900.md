# `mq3.server.snapshot_build.Services`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-build-ml-2050633468.md)

<a id="struct-struct-mq3-server-snapshot-build-services-struct-services-src-mq3-server-snapshot-build-ml-1461161729"></a>
## Services

```ml
struct Services
```

Services record for server.snapshot_build, containing `pointLeafFn`, `leafAreaFn`, `leafClusterFn`, `writeAreaBitsFn`, `clusterPvsFn`, `areasConnectedFn`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L31)

## Members

<a id="field-field-mq3-server-snapshot-build-services-areasconnectedfn-areasconnectedfn-src-mq3-server-snapshot-build-ml-881439655"></a>
### areasConnectedFn

```ml
areasConnectedFn
```

Host callback that tests whether two portal areas are connected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L43)

<a id="field-field-mq3-server-snapshot-build-services-clusterpvsfn-clusterpvsfn-src-mq3-server-snapshot-build-ml-992687731"></a>
### clusterPvsFn

```ml
clusterPvsFn
```

Host callback that returns the potentially visible set for a visibility cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L41)

<a id="field-field-mq3-server-snapshot-build-services-context-context-src-mq3-server-snapshot-build-ml-563694893"></a>
### context

```ml
context
```

Caller-supplied data associated with collision visibility queries used to gather snapshot entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L46)

<a id="field-field-mq3-server-snapshot-build-services-leafareafn-leafareafn-src-mq3-server-snapshot-build-ml-70124319"></a>
### leafAreaFn

```ml
leafAreaFn
```

Host callback that returns the portal area containing a BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L35)

<a id="field-field-mq3-server-snapshot-build-services-leafclusterfn-leafclusterfn-src-mq3-server-snapshot-build-ml-658410821"></a>
### leafClusterFn

```ml
leafClusterFn
```

Host callback that returns the visibility cluster containing a BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L37)

<a id="field-field-mq3-server-snapshot-build-services-pointleaffn-pointleaffn-src-mq3-server-snapshot-build-ml-1188158141"></a>
### pointLeafFn

```ml
pointLeafFn
```

Host callback that returns the BSP leaf containing a point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L33)

<a id="field-field-mq3-server-snapshot-build-services-writeareabitsfn-writeareabitsfn-src-mq3-server-snapshot-build-ml-1573089541"></a>
### writeAreaBitsFn

```ml
writeAreaBitsFn
```

Host callback that serializes the area-visibility mask for a snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L39)
