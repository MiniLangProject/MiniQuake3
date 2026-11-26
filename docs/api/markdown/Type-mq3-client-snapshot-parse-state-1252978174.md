# `mq3.client.snapshot_parse.State`

[Home](README.md) · [Source file](File-src-mq3-client-snapshot-parse-ml-455311349.md)

<a id="struct-struct-mq3-client-snapshot-parse-state-struct-state-src-mq3-client-snapshot-parse-ml-1160834859"></a>
## State

```ml
struct State
```

Stores snapshot parse state, including `parseEntities`, `parseEntitiesNum`, `entityBaselines`, `shownetLevel`, `shownetLines`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L27)

## Members

<a id="field-field-mq3-client-snapshot-parse-state-entitybaselines-entitybaselines-src-mq3-client-snapshot-parse-ml-1509769282"></a>
### entityBaselines

```ml
entityBaselines
```

Baseline entity states used when delta decoding has no previous snapshot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L33)

<a id="field-field-mq3-client-snapshot-parse-state-parseentities-parseentities-src-mq3-client-snapshot-parse-ml-1336154130"></a>
### parseEntities

```ml
parseEntities
```

Parsed entity-state ring used to reconstruct snapshots from their absolute entity positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L29)

<a id="field-field-mq3-client-snapshot-parse-state-parseentitiesnum-parseentitiesnum-src-mq3-client-snapshot-parse-ml-1741808506"></a>
### parseEntitiesNum

```ml
parseEntitiesNum
```

Absolute position in the parsed-entity ring at which this snapshot's entities begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L31)

<a id="field-field-mq3-client-snapshot-parse-state-shownetlevel-shownetlevel-src-mq3-client-snapshot-parse-ml-1473801042"></a>
### shownetLevel

```ml
shownetLevel
```

When constructing this record, `createState` supplies `0` for this member. Used by `trace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L36)

<a id="field-field-mq3-client-snapshot-parse-state-shownetlines-shownetlines-src-mq3-client-snapshot-parse-ml-562558304"></a>
### shownetLines

```ml
shownetLines
```

When constructing this record, `createState` supplies an empty list for this member. Used by `trace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L39)
