# `mq3.botlib.aas_debug.Face`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-debug-ml-718446593.md)

<a id="struct-struct-mq3-botlib-aas-debug-face-struct-face-src-mq3-botlib-aas-debug-ml-470504355"></a>
## Face

```ml
struct Face
```

`Face` record for aas debug, containing `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L92)

## Members

<a id="field-field-mq3-botlib-aas-debug-face-backarea-backarea-src-mq3-botlib-aas-debug-ml-1981762092"></a>
### backArea

```ml
backArea
```

Area at the back of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L104)

<a id="field-field-mq3-botlib-aas-debug-face-firstedge-firstedge-src-mq3-botlib-aas-debug-ml-1283370856"></a>
### firstEdge

```ml
firstEdge
```

Starting offset of this face in the signed edge-index array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L100)

<a id="field-field-mq3-botlib-aas-debug-face-flags-flags-src-mq3-botlib-aas-debug-ml-344413188"></a>
### flags

```ml
flags
```

AAS face properties used to classify and draw navigation boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L96)

<a id="field-field-mq3-botlib-aas-debug-face-frontarea-frontarea-src-mq3-botlib-aas-debug-ml-1655750628"></a>
### frontArea

```ml
frontArea
```

Area at the front of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L102)

<a id="field-field-mq3-botlib-aas-debug-face-numedges-numedges-src-mq3-botlib-aas-debug-ml-669730380"></a>
### numEdges

```ml
numEdges
```

Number of edge records represented by this face or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L98)

<a id="field-field-mq3-botlib-aas-debug-face-planenum-planenum-src-mq3-botlib-aas-debug-ml-1517798164"></a>
### planeNum

```ml
planeNum
```

Navigation plane index used to reconstruct the face for debug drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L94)
