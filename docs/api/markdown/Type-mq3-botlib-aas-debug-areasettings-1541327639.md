# `mq3.botlib.aas_debug.AreaSettings`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-debug-ml-718446593.md)

<a id="struct-struct-mq3-botlib-aas-debug-areasettings-struct-areasettings-src-mq3-botlib-aas-debug-ml-1132419527"></a>
## AreaSettings

```ml
struct AreaSettings
```

`AreaSettings` record for aas debug, containing `contents`, `cluster`, `numReachableAreas` and `firstReachableArea`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L121)

## Members

<a id="field-field-mq3-botlib-aas-debug-areasettings-cluster-cluster-src-mq3-botlib-aas-debug-ml-1321839701"></a>
### cluster

```ml
cluster
```

Cluster the area belongs to, if negative it's a portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L125)

<a id="field-field-mq3-botlib-aas-debug-areasettings-contents-contents-src-mq3-botlib-aas-debug-ml-487217861"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L123)

<a id="field-field-mq3-botlib-aas-debug-areasettings-firstreachablearea-firstreachablearea-src-mq3-botlib-aas-debug-ml-1619865141"></a>
### firstReachableArea

```ml
firstReachableArea
```

First outgoing reachability index for this area in the shared reachability array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L129)

<a id="field-field-mq3-botlib-aas-debug-areasettings-numreachableareas-numreachableareas-src-mq3-botlib-aas-debug-ml-784619317"></a>
### numReachableAreas

```ml
numReachableAreas
```

Number of outgoing reachability records belonging to this AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L127)
