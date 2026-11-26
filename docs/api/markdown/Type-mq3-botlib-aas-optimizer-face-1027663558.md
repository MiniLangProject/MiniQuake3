# `mq3.botlib.aas_optimizer.Face`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-optimizer-ml-949906489.md)

<a id="struct-struct-mq3-botlib-aas-optimizer-face-struct-face-src-mq3-botlib-aas-optimizer-ml-1668744363"></a>
## Face

```ml
struct Face
```

`Face` record for aas optimizer, containing `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L25)

## Members

<a id="field-field-mq3-botlib-aas-optimizer-face-backarea-backarea-src-mq3-botlib-aas-optimizer-ml-151159620"></a>
### backArea

```ml
backArea
```

Area at the back of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L37)

<a id="field-field-mq3-botlib-aas-optimizer-face-firstedge-firstedge-src-mq3-botlib-aas-optimizer-ml-80484880"></a>
### firstEdge

```ml
firstEdge
```

Starting offset of this face in the signed edge-index array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L33)

<a id="field-field-mq3-botlib-aas-optimizer-face-flags-flags-src-mq3-botlib-aas-optimizer-ml-1167112572"></a>
### flags

```ml
flags
```

AAS face properties preserved while unused geometry is removed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L29)

<a id="field-field-mq3-botlib-aas-optimizer-face-frontarea-frontarea-src-mq3-botlib-aas-optimizer-ml-1663877852"></a>
### frontArea

```ml
frontArea
```

Area at the front of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L35)

<a id="field-field-mq3-botlib-aas-optimizer-face-numedges-numedges-src-mq3-botlib-aas-optimizer-ml-2041366132"></a>
### numEdges

```ml
numEdges
```

Number of edge records represented by this face or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L31)

<a id="field-field-mq3-botlib-aas-optimizer-face-planenum-planenum-src-mq3-botlib-aas-optimizer-ml-1426355036"></a>
### planeNum

```ml
planeNum
```

Plane reference retained when copying this face into compacted navigation geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L27)
