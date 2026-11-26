# `mq3.botlib.aas_clustering.World`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-clustering-ml-1254362060.md)

<a id="struct-struct-mq3-botlib-aas-clustering-world-struct-world-src-mq3-botlib-aas-clustering-ml-1544586099"></a>
## World

```ml
struct World
```

`World` record for aas clustering, containing `loaded`, `forceClustering`, `forceReachability`, `noFaceFlood` and `planes` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L144)

## Members

<a id="field-field-mq3-botlib-aas-clustering-world-actions-actions-src-mq3-botlib-aas-clustering-ml-980778209"></a>
### actions

```ml
actions
```

Recorded host requests and diagnostics produced while building navigation clusters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L180)

<a id="field-field-mq3-botlib-aas-clustering-world-areas-areas-src-mq3-botlib-aas-clustering-ml-1071212245"></a>
### areas

```ml
areas
```

Area records or area assignments used by navigation and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L166)

<a id="field-field-mq3-botlib-aas-clustering-world-clusters-clusters-src-mq3-botlib-aas-clustering-ml-1970406691"></a>
### clusters

```ml
clusters
```

Cluster records or assignments used to group navigation and visibility areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L176)

<a id="field-field-mq3-botlib-aas-clustering-world-edgeindex-edgeindex-src-mq3-botlib-aas-clustering-ml-614098653"></a>
### edgeIndex

```ml
edgeIndex
```

Signed edge references used by faces of the navigation mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L160)

<a id="field-field-mq3-botlib-aas-clustering-world-edges-edges-src-mq3-botlib-aas-clustering-ml-2076481285"></a>
### edges

```ml
edges
```

Vertex-index pairs defining edges of the map or navigation geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L158)

<a id="field-field-mq3-botlib-aas-clustering-world-entities-entities-src-mq3-botlib-aas-clustering-ml-615727339"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L178)

<a id="field-field-mq3-botlib-aas-clustering-world-faceindex-faceindex-src-mq3-botlib-aas-clustering-ml-705351405"></a>
### faceIndex

```ml
faceIndex
```

Signed face references used to construct AAS area boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L164)

<a id="field-field-mq3-botlib-aas-clustering-world-faces-faces-src-mq3-botlib-aas-clustering-ml-1194269741"></a>
### faces

```ml
faces
```

Face records bounding AAS areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L162)

<a id="field-field-mq3-botlib-aas-clustering-world-forceclustering-forceclustering-src-mq3-botlib-aas-clustering-ml-1603515581"></a>
### forceClustering

```ml
forceClustering
```

True when AAS clusters must be rebuilt even if cached data is present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L148)

<a id="field-field-mq3-botlib-aas-clustering-world-forcereachability-forcereachability-src-mq3-botlib-aas-clustering-ml-101750577"></a>
### forceReachability

```ml
forceReachability
```

True when AAS reachabilities must be rebuilt even if cached data is present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L150)

<a id="field-field-mq3-botlib-aas-clustering-world-loaded-loaded-src-mq3-botlib-aas-clustering-ml-1047898451"></a>
### loaded

```ml
loaded
```

True when navigation geometry is available for cluster construction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L146)

<a id="field-field-mq3-botlib-aas-clustering-world-nofaceflood-nofaceflood-src-mq3-botlib-aas-clustering-ml-164619445"></a>
### noFaceFlood

```ml
noFaceFlood
```

True when clustering must avoid flooding through area faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L152)

<a id="field-field-mq3-botlib-aas-clustering-world-planes-planes-src-mq3-botlib-aas-clustering-ml-51218819"></a>
### planes

```ml
planes
```

Plane records used to classify or clip the represented geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L154)

<a id="field-field-mq3-botlib-aas-clustering-world-portalindex-portalindex-src-mq3-botlib-aas-clustering-ml-730377605"></a>
### portalIndex

```ml
portalIndex
```

Indexes of portals belonging to each navigation cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L174)

<a id="field-field-mq3-botlib-aas-clustering-world-portals-portals-src-mq3-botlib-aas-clustering-ml-1530483181"></a>
### portals

```ml
portals
```

Portal records joining navigation clusters or visibility areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L172)

<a id="field-field-mq3-botlib-aas-clustering-world-reachabilities-reachabilities-src-mq3-botlib-aas-clustering-ml-557982267"></a>
### reachabilities

```ml
reachabilities
```

Reachabilities used for routing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L170)

<a id="field-field-mq3-botlib-aas-clustering-world-retailactive-retailactive-src-mq3-botlib-aas-clustering-ml-431929403"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L182)

<a id="field-field-mq3-botlib-aas-clustering-world-savefile-savefile-src-mq3-botlib-aas-clustering-ml-553432827"></a>
### saveFile

```ml
saveFile
```

True when the current AAS data should be saved back to a file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L184)

<a id="field-field-mq3-botlib-aas-clustering-world-settings-settings-src-mq3-botlib-aas-clustering-ml-1351430811"></a>
### settings

```ml
settings
```

Area or runtime settings controlling navigation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L168)

<a id="field-field-mq3-botlib-aas-clustering-world-vertexes-vertexes-src-mq3-botlib-aas-clustering-ml-294148189"></a>
### vertexes

```ml
vertexes
```

XYZ vertices defining the navigation or map geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_clustering.ml#L156)
