# `mq3.botlib.aas_optimizer.Area`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-optimizer-ml-949906489.md)

<a id="struct-struct-mq3-botlib-aas-optimizer-area-struct-area-src-mq3-botlib-aas-optimizer-ml-1040757131"></a>
## Area

```ml
struct Area
```

`Area` record for aas optimizer, containing `areaNum`, `numFaces`, `firstFace`, `mins` and `maxs` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L40)

## Members

<a id="field-field-mq3-botlib-aas-optimizer-area-areanum-areanum-src-mq3-botlib-aas-optimizer-ml-1050566996"></a>
### areaNum

```ml
areaNum
```

Navigation area identifier preserved while compacting its geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L42)

<a id="field-field-mq3-botlib-aas-optimizer-area-center-center-src-mq3-botlib-aas-optimizer-ml-492516990"></a>
### center

```ml
center
```

'center' of the area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L52)

<a id="field-field-mq3-botlib-aas-optimizer-area-firstface-firstface-src-mq3-botlib-aas-optimizer-ml-2009826316"></a>
### firstFace

```ml
firstFace
```

Starting offset of this area in the signed face-index array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L46)

<a id="field-field-mq3-botlib-aas-optimizer-area-maxs-maxs-src-mq3-botlib-aas-optimizer-ml-2015265890"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the navigation area retained during geometry compaction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L50)

<a id="field-field-mq3-botlib-aas-optimizer-area-mins-mins-src-mq3-botlib-aas-optimizer-ml-1230985514"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the navigation area retained during geometry compaction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L48)

<a id="field-field-mq3-botlib-aas-optimizer-area-numfaces-numfaces-src-mq3-botlib-aas-optimizer-ml-1221171868"></a>
### numFaces

```ml
numFaces
```

Number of face records represented by this area or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L44)
