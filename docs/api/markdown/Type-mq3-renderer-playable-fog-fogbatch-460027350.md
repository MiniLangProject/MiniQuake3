# `mq3.renderer.playable_fog.FogBatch`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-fog-ml-140703890.md)

<a id="struct-struct-mq3-renderer-playable-fog-fogbatch-struct-fogbatch-src-mq3-renderer-playable-fog-ml-1500767569"></a>
## FogBatch

```ml
struct FogBatch
```

Data record for `mq3.renderer.playable_fog.FogBatch`; groups `commands`, `sourcePositions`, `fogIndexes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L53)

## Members

<a id="field-field-mq3-renderer-playable-fog-fogbatch-commands-commands-src-mq3-renderer-playable-fog-ml-1824761533"></a>
### commands

```ml
commands
```

Operations or drawing commands queued by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L55)

<a id="field-field-mq3-renderer-playable-fog-fogbatch-fogindexes-fogindexes-src-mq3-renderer-playable-fog-ml-243154365"></a>
### fogIndexes

```ml
fogIndexes
```

Fog-volume index associated with each retained primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L59)

<a id="field-field-mq3-renderer-playable-fog-fogbatch-sourcepositions-sourcepositions-src-mq3-renderer-playable-fog-ml-72306849"></a>
### sourcePositions

```ml
sourcePositions
```

Original vertex positions retained for time-dependent updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L57)
