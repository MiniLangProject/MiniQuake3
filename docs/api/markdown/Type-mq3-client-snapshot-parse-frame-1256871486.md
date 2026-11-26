# `mq3.client.snapshot_parse.Frame`

[Home](README.md) · [Source file](File-src-mq3-client-snapshot-parse-ml-455311349.md)

<a id="struct-struct-mq3-client-snapshot-parse-frame-struct-frame-src-mq3-client-snapshot-parse-ml-158474779"></a>
## Frame

```ml
struct Frame
```

Stores snapshot parse frame data, including `parseEntitiesNum`, `numEntities`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_parse.ml#L19)

## Members

<a id="field-field-mq3-client-snapshot-parse-frame-numentities-numentities-src-mq3-client-snapshot-parse-ml-788190610"></a>
### numEntities

```ml
numEntities
```

Number of entity-state entries represented by the snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_parse.ml#L23)

<a id="field-field-mq3-client-snapshot-parse-frame-parseentitiesnum-parseentitiesnum-src-mq3-client-snapshot-parse-ml-83091342"></a>
### parseEntitiesNum

```ml
parseEntitiesNum
```

Absolute position in the parsed-entity ring at which this snapshot's entities begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_parse.ml#L21)
