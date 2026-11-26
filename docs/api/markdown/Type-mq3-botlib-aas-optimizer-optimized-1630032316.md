# `mq3.botlib.aas_optimizer.Optimized`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-optimizer-ml-949906489.md)

<a id="struct-struct-mq3-botlib-aas-optimizer-optimized-struct-optimized-src-mq3-botlib-aas-optimizer-ml-758123883"></a>
## Optimized

```ml
struct Optimized
```

`Optimized` record for aas optimizer, containing `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L110)

## Members

<a id="field-field-mq3-botlib-aas-optimizer-optimized-areas-areas-src-mq3-botlib-aas-optimizer-ml-1818221810"></a>
### areas

```ml
areas
```

Area records or area assignments used by navigation and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L122)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-edgeindex-edgeindex-src-mq3-botlib-aas-optimizer-ml-774872698"></a>
### edgeIndex

```ml
edgeIndex
```

Signed edge references used by faces of the navigation mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L116)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-edgeoptimizeindex-edgeoptimizeindex-src-mq3-botlib-aas-optimizer-ml-566491650"></a>
### edgeOptimizeIndex

```ml
edgeOptimizeIndex
```

Mapping from original edge indexes to optimized edge indexes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L126)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-edges-edges-src-mq3-botlib-aas-optimizer-ml-555679042"></a>
### edges

```ml
edges
```

Vertex-index pairs defining edges of the map or navigation geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L114)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-faceindex-faceindex-src-mq3-botlib-aas-optimizer-ml-1040390314"></a>
### faceIndex

```ml
faceIndex
```

Signed face references used to construct AAS area boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L120)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-faceoptimizeindex-faceoptimizeindex-src-mq3-botlib-aas-optimizer-ml-1376417426"></a>
### faceOptimizeIndex

```ml
faceOptimizeIndex
```

Mapping from original face indexes to optimized face indexes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L128)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-faces-faces-src-mq3-botlib-aas-optimizer-ml-499792586"></a>
### faces

```ml
faces
```

Face records bounding AAS areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L118)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-vertexes-vertexes-src-mq3-botlib-aas-optimizer-ml-502579578"></a>
### vertexes

```ml
vertexes
```

XYZ vertices defining the navigation or map geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L112)

<a id="field-field-mq3-botlib-aas-optimizer-optimized-vertexoptimizeindex-vertexoptimizeindex-src-mq3-botlib-aas-optimizer-ml-740622562"></a>
### vertexOptimizeIndex

```ml
vertexOptimizeIndex
```

Mapping from original vertex indexes to optimized vertex indexes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L124)
