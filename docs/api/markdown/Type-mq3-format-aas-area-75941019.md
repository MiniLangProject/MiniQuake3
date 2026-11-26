# `mq3.format.aas.Area`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-area-struct-area-src-mq3-format-aas-ml-22179351"></a>
## Area

```ml
struct Area
```

Area record for format.aas, containing `areaNum`, `numFaces`, `firstFace`, `mins`, `maxs`, `center`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L270)

## Members

<a id="field-field-mq3-format-aas-area-areanum-areanum-src-mq3-format-aas-ml-572517452"></a>
### areaNum

```ml
areaNum
```

Area identifier stored in this serialized AAS area record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L272)

<a id="field-field-mq3-format-aas-area-center-center-src-mq3-format-aas-ml-126220626"></a>
### center

```ml
center
```

'center' of the area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L282)

<a id="field-field-mq3-format-aas-area-firstface-firstface-src-mq3-format-aas-ml-1653123956"></a>
### firstFace

```ml
firstFace
```

Starting offset of this area in the signed face-index array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L276)

<a id="field-field-mq3-format-aas-area-maxs-maxs-src-mq3-format-aas-ml-1239667318"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the navigation area stored in the AAS area lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L280)

<a id="field-field-mq3-format-aas-area-mins-mins-src-mq3-format-aas-ml-1385230450"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the navigation area stored in the AAS area lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L278)

<a id="field-field-mq3-format-aas-area-numfaces-numfaces-src-mq3-format-aas-ml-1966985896"></a>
### numFaces

```ml
numFaces
```

Number of face records represented by this area or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L274)
