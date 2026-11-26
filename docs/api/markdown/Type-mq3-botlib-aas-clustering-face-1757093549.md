# `mq3.botlib.aas_clustering.Face`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-clustering-ml-1254362060.md)

<a id="struct-struct-mq3-botlib-aas-clustering-face-struct-face-src-mq3-botlib-aas-clustering-ml-994729917"></a>
## Face

```ml
struct Face
```

`Face` record for aas clustering, containing `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L44)

## Members

<a id="field-field-mq3-botlib-aas-clustering-face-backarea-backarea-src-mq3-botlib-aas-clustering-ml-1324116350"></a>
### backArea

```ml
backArea
```

Area at the back of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L56)

<a id="field-field-mq3-botlib-aas-clustering-face-firstedge-firstedge-src-mq3-botlib-aas-clustering-ml-42817142"></a>
### firstEdge

```ml
firstEdge
```

Starting offset of this face in the signed edge-index array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L52)

<a id="field-field-mq3-botlib-aas-clustering-face-flags-flags-src-mq3-botlib-aas-clustering-ml-1676990602"></a>
### flags

```ml
flags
```

AAS face properties such as solidity, grounding, or ladder membership.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L48)

<a id="field-field-mq3-botlib-aas-clustering-face-frontarea-frontarea-src-mq3-botlib-aas-clustering-ml-34982450"></a>
### frontArea

```ml
frontArea
```

Area at the front of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L54)

<a id="field-field-mq3-botlib-aas-clustering-face-numedges-numedges-src-mq3-botlib-aas-clustering-ml-1842958674"></a>
### numEdges

```ml
numEdges
```

Number of edge records represented by this face or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L50)

<a id="field-field-mq3-botlib-aas-clustering-face-planenum-planenum-src-mq3-botlib-aas-clustering-ml-1563811150"></a>
### planeNum

```ml
planeNum
```

Navigation plane index used to compare the faces of candidate cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L46)
