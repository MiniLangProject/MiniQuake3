# `mq3.botlib.aas_clustering.Entity`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-clustering-ml-1254362060.md)

<a id="struct-struct-mq3-botlib-aas-clustering-entity-struct-entity-src-mq3-botlib-aas-clustering-ml-998848485"></a>
## Entity

```ml
struct Entity
```

`Entity` record for aas clustering, containing `className`, `target`, `targetName`, `origin` and `linkedAreas` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L112)

## Members

<a id="field-field-mq3-botlib-aas-clustering-entity-classname-classname-src-mq3-botlib-aas-clustering-ml-1837095708"></a>
### className

```ml
className
```

Map entity class used to identify navigation-related entity behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L114)

<a id="field-field-mq3-botlib-aas-clustering-entity-destinationarea-destinationarea-src-mq3-botlib-aas-clustering-ml-1888591636"></a>
### destinationArea

```ml
destinationArea
```

AAS area reached at the end of this movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L124)

<a id="field-field-mq3-botlib-aas-clustering-entity-linkedareas-linkedareas-src-mq3-botlib-aas-clustering-ml-330485360"></a>
### linkedAreas

```ml
linkedAreas
```

AAS areas intersected by this entity's bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L122)

<a id="field-field-mq3-botlib-aas-clustering-entity-origin-origin-src-mq3-botlib-aas-clustering-ml-1471666868"></a>
### origin

```ml
origin
```

Map entity position inspected while identifying navigation cluster and portal entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L120)

<a id="field-field-mq3-botlib-aas-clustering-entity-target-target-src-mq3-botlib-aas-clustering-ml-677730738"></a>
### target

```ml
target
```

Target name referenced by this map entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L116)

<a id="field-field-mq3-botlib-aas-clustering-entity-targetname-targetname-src-mq3-botlib-aas-clustering-ml-1484870056"></a>
### targetName

```ml
targetName
```

Name by which other map entities can target this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L118)

<a id="field-field-mq3-botlib-aas-clustering-entity-valid-valid-src-mq3-botlib-aas-clustering-ml-1626442608"></a>
### valid

```ml
valid
```

True when the represented entry contains usable data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L126)
