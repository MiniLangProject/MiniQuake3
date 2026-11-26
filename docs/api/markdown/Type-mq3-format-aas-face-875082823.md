# `mq3.format.aas.Face`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-face-struct-face-src-mq3-format-aas-ml-549013199"></a>
## Face

```ml
struct Face
```

Face record for format.aas, containing `planeNum`, `flags`, `numEdges`, `firstEdge`, `frontArea`, `backArea`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L255)

## Members

<a id="field-field-mq3-format-aas-face-backarea-backarea-src-mq3-format-aas-ml-195411696"></a>
### backArea

```ml
backArea
```

Area at the back of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L267)

<a id="field-field-mq3-format-aas-face-firstedge-firstedge-src-mq3-format-aas-ml-2113619312"></a>
### firstEdge

```ml
firstEdge
```

Starting offset of this face in the signed edge-index array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L263)

<a id="field-field-mq3-format-aas-face-flags-flags-src-mq3-format-aas-ml-151697612"></a>
### flags

```ml
flags
```

AAS face-property flags, such as solid, ground, ladder, or liquid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L259)

<a id="field-field-mq3-format-aas-face-frontarea-frontarea-src-mq3-format-aas-ml-695324332"></a>
### frontArea

```ml
frontArea
```

Area at the front of this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L265)

<a id="field-field-mq3-format-aas-face-numedges-numedges-src-mq3-format-aas-ml-1950679196"></a>
### numEdges

```ml
numEdges
```

Number of edge records represented by this face or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L261)

<a id="field-field-mq3-format-aas-face-planenum-planenum-src-mq3-format-aas-ml-270614888"></a>
### planeNum

```ml
planeNum
```

AAS plane index containing this serialized navigation face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L257)
