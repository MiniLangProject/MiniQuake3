# `mq3.renderer.qvm_scene_geometry.FrameCache`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-framecache-struct-framecache-src-mq3-renderer-qvm-scene-geometry-ml-717401579"></a>
## FrameCache

```ml
struct FrameCache
```

Data record for `mq3.renderer.qvm_scene_geometry.FrameCache`; groups `normalTable`, `entries`, `maxEntries`, `hits`, `misses`, `transforms`, and 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L218)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-entries-entries-src-mq3-renderer-qvm-scene-geometry-ml-580422152"></a>
### entries

```ml
entries
```

Records currently stored in this index, registry, or cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L222)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-entrycount-entrycount-src-mq3-renderer-qvm-scene-geometry-ml-474886218"></a>
### entryCount

```ml
entryCount
```

Number of valid entries currently stored in the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L236)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-entrynext-entrynext-src-mq3-renderer-qvm-scene-geometry-ml-342196372"></a>
### entryNext

```ml
entryNext
```

Next cache slot selected for insertion or replacement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L238)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-frameindex-frameindex-src-mq3-renderer-qvm-scene-geometry-ml-76455922"></a>
### frameIndex

```ml
frameIndex
```

Index used to look up cached animation-frame data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L246)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-framelookupsteps-framelookupsteps-src-mq3-renderer-qvm-scene-geometry-ml-1555643796"></a>
### frameLookupSteps

```ml
frameLookupSteps
```

Number of probe steps performed by frame-cache lookups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L250)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-hits-hits-src-mq3-renderer-qvm-scene-geometry-ml-957860044"></a>
### hits

```ml
hits
```

Number of lookups satisfied by an existing cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L226)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-maxentries-maxentries-src-mq3-renderer-qvm-scene-geometry-ml-12066804"></a>
### maxEntries

```ml
maxEntries
```

Maximum number of entries retained by the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L224)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-misses-misses-src-mq3-renderer-qvm-scene-geometry-ml-403855044"></a>
### misses

```ml
misses
```

Number of lookups that required loading or rebuilding data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L228)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-normaltable-normaltable-src-mq3-renderer-qvm-scene-geometry-ml-2112782920"></a>
### normalTable

```ml
normalTable
```

Lookup table used to decode packed model normals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L220)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-packednormaltable-packednormaltable-src-mq3-renderer-qvm-scene-geometry-ml-1723273084"></a>
### packedNormalTable

```ml
packedNormalTable
```

Packed lookup table used to decode model normal angles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L244)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transformcount-transformcount-src-mq3-renderer-qvm-scene-geometry-ml-1860867714"></a>
### transformCount

```ml
transformCount
```

Number of valid transformed-geometry entries in the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L240)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transformhits-transformhits-src-mq3-renderer-qvm-scene-geometry-ml-919395180"></a>
### transformHits

```ml
transformHits
```

Number of transformed-geometry cache hits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L232)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transformindex-transformindex-src-mq3-renderer-qvm-scene-geometry-ml-483382124"></a>
### transformIndex

```ml
transformIndex
```

Index used to look up cached entity transforms.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L248)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transformlookupsteps-transformlookupsteps-src-mq3-renderer-qvm-scene-geometry-ml-1357266110"></a>
### transformLookupSteps

```ml
transformLookupSteps
```

Number of probe steps performed by transform-cache lookups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L252)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transformmisses-transformmisses-src-mq3-renderer-qvm-scene-geometry-ml-1378229016"></a>
### transformMisses

```ml
transformMisses
```

Number of transformed-geometry cache misses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L234)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transformnext-transformnext-src-mq3-renderer-qvm-scene-geometry-ml-760499788"></a>
### transformNext

```ml
transformNext
```

Next transformed-geometry slot selected for replacement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L242)

<a id="field-field-mq3-renderer-qvm-scene-geometry-framecache-transforms-transforms-src-mq3-renderer-qvm-scene-geometry-ml-791167318"></a>
### transforms

```ml
transforms
```

Cached transformed geometry reused across compatible entity draws.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L230)
