# `mq3.vm.cgame_collision_cache.Memo`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-collision-cache-ml-322754460.md)

<a id="struct-struct-mq3-vm-cgame-collision-cache-memo-struct-memo-src-mq3-vm-cgame-collision-cache-ml-1300774659"></a>
## Memo

```ml
struct Memo
```

Memo record for vm.cgame_collision_cache, containing `enabled`, `world`, `map`, `mapData`, `mapDataPointer`, `checksum`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L35)

## Members

<a id="field-field-mq3-vm-cgame-collision-cache-memo-checksum-checksum-src-mq3-vm-cgame-collision-cache-ml-1392129685"></a>
### checksum

```ml
checksum
```

Map checksum used to detect changes in collision input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L47)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-enabled-enabled-src-mq3-vm-cgame-collision-cache-ml-1042087779"></a>
### enabled

```ml
enabled
```

Nonzero when the optional cache or subsystem is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L37)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-invalidations-invalidations-src-mq3-vm-cgame-collision-cache-ml-1948528327"></a>
### invalidations

```ml
invalidations
```

Number of cache clears caused by changes to the input world or map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L59)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-map-map-src-mq3-vm-cgame-collision-cache-ml-353767331"></a>
### map

```ml
map
```

BSP/map object associated with the cached geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L41)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-mapdata-mapdata-src-mq3-vm-cgame-collision-cache-ml-313904403"></a>
### mapData

```ml
mapData
```

Retained BSP data bytes whose identity participates in cache invalidation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L43)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-mapdatapointer-mapdatapointer-src-mq3-vm-cgame-collision-cache-ml-797144041"></a>
### mapDataPointer

```ml
mapDataPointer
```

Native address used to detect replacement of the backing BSP buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L45)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-marks-marks-src-mq3-vm-cgame-collision-cache-ml-928785443"></a>
### marks

```ml
marks
```

FIFO cache of projected mark-fragment results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L57)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-name-name-src-mq3-vm-cgame-collision-cache-ml-1225948085"></a>
### name

```ml
name
```

Map name participating in cache invalidation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L49)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-patchesready-patchesready-src-mq3-vm-cgame-collision-cache-ml-929521745"></a>
### patchesReady

```ml
patchesReady
```

Cached marker indicating whether curved patch collision data is prepared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L51)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-playercurveclip-playercurveclip-src-mq3-vm-cgame-collision-cache-ml-1932900947"></a>
### playerCurveClip

```ml
playerCurveClip
```

Cached curved-surface collision setting affecting player trace results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L53)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-traces-traces-src-mq3-vm-cgame-collision-cache-ml-154257827"></a>
### traces

```ml
traces
```

FIFO cache of collision trace results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L55)

<a id="field-field-mq3-vm-cgame-collision-cache-memo-world-world-src-mq3-vm-cgame-collision-cache-ml-1048076095"></a>
### world

```ml
world
```

Collision-world object associated with the cached queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_collision_cache.ml#L39)
