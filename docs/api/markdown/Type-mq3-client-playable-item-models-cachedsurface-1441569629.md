# `mq3.client.playable_item_models.CachedSurface`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-cachedsurface-struct-cachedsurface-src-mq3-client-playable-item-models-ml-125888049"></a>
## CachedSurface

```ml
struct CachedSurface
```

Stores playable item models cached surface record, including `positions`, `normals`, `triangleIndexes`, `triangleTexCoords`, `surfaceIndex`, `numTriangles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L71)

## Members

<a id="field-field-mq3-client-playable-item-models-cachedsurface-normals-normals-src-mq3-client-playable-item-models-ml-538495382"></a>
### normals

```ml
normals
```

When constructing this record, `cacheModelTriangles` supplies `decoded[1]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L75)

<a id="field-field-mq3-client-playable-item-models-cachedsurface-numtriangles-numtriangles-src-mq3-client-playable-item-models-ml-884289280"></a>
### numTriangles

```ml
numTriangles
```

Number of triangles represented by the model or geometry collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L83)

<a id="field-field-mq3-client-playable-item-models-cachedsurface-positions-positions-src-mq3-client-playable-item-models-ml-159129650"></a>
### positions

```ml
positions
```

Ordered positions used to build the stored trail or spatial history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L73)

<a id="field-field-mq3-client-playable-item-models-cachedsurface-surfaceindex-surfaceindex-src-mq3-client-playable-item-models-ml-381836408"></a>
### surfaceIndex

```ml
surfaceIndex
```

When constructing this record, `cacheModelTriangles` supplies `surfaceIndex` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L81)

<a id="field-field-mq3-client-playable-item-models-cachedsurface-triangleindexes-triangleindexes-src-mq3-client-playable-item-models-ml-107807850"></a>
### triangleIndexes

```ml
triangleIndexes
```

When constructing this record, `cacheModelTriangles` supplies `triangleIndexes` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L77)

<a id="field-field-mq3-client-playable-item-models-cachedsurface-triangletexcoords-triangletexcoords-src-mq3-client-playable-item-models-ml-1101632002"></a>
### triangleTexCoords

```ml
triangleTexCoords
```

When constructing this record, `cacheModelTriangles` supplies `triangleTexCoords` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L79)
