# `mq3.renderer.retained_world_batch.Cache`

[Home](README.md) · [Source file](File-src-mq3-renderer-retained-world-batch-ml-1153698861.md)

<a id="struct-struct-mq3-renderer-retained-world-batch-cache-struct-cache-src-mq3-renderer-retained-world-batch-ml-1574128409"></a>
## Cache

```ml
struct Cache
```

Data record for `mq3.renderer.retained_world_batch.Cache`; groups `world`, `catalog`, `skyFlags`, `fogCatalog`, `lightCatalog`, `receiveFlags`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L61)

## Members

<a id="field-field-mq3-renderer-retained-world-batch-cache-active-active-src-mq3-renderer-retained-world-batch-ml-233334731"></a>
### active

```ml
active
```

Material batch containing only the currently selected visible geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L89)

<a id="field-field-mq3-renderer-retained-world-batch-cache-base-base-src-mq3-renderer-retained-world-batch-ml-741506353"></a>
### base

```ml
base
```

Base pass or value from which the current effect is derived.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L77)

<a id="field-field-mq3-renderer-retained-world-batch-cache-catalog-catalog-src-mq3-renderer-retained-world-batch-ml-355525559"></a>
### catalog

```ml
catalog
```

Resolved resources used by the current rendering operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L65)

<a id="field-field-mq3-renderer-retained-world-batch-cache-dlightcommands-dlightcommands-src-mq3-renderer-retained-world-batch-ml-901319039"></a>
### dlightCommands

```ml
dlightCommands
```

Drawing commands retained for the dynamic-light contribution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L83)

<a id="field-field-mq3-renderer-retained-world-batch-cache-enabled-enabled-src-mq3-renderer-retained-world-batch-ml-1533897095"></a>
### enabled

```ml
enabled
```

Whether this feature is enabled by the current configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L93)

<a id="field-field-mq3-renderer-retained-world-batch-cache-faces-faces-src-mq3-renderer-retained-world-batch-ml-899953103"></a>
### faces

```ml
faces
```

BSP faces retained for the current geometry or visibility selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L87)

<a id="field-field-mq3-renderer-retained-world-batch-cache-fallbackfaces-fallbackfaces-src-mq3-renderer-retained-world-batch-ml-1768600787"></a>
### fallbackFaces

```ml
fallbackFaces
```

Faces that must use the ordinary drawing path instead of retained geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L85)

<a id="field-field-mq3-renderer-retained-world-batch-cache-fallbacks-fallbacks-src-mq3-renderer-retained-world-batch-ml-1413730127"></a>
### fallbacks

```ml
fallbacks
```

Number of times drawing fell back to the ordinary geometry path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L99)

<a id="field-field-mq3-renderer-retained-world-batch-cache-fogcatalog-fogcatalog-src-mq3-renderer-retained-world-batch-ml-1243254933"></a>
### fogCatalog

```ml
fogCatalog
```

Fog volumes and shared fog resources used by the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L69)

<a id="field-field-mq3-renderer-retained-world-batch-cache-fogstream-fogstream-src-mq3-renderer-retained-world-batch-ml-203269859"></a>
### fogStream

```ml
fogStream
```

Retained geometry stream used to update the fog contribution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L81)

<a id="field-field-mq3-renderer-retained-world-batch-cache-full-full-src-mq3-renderer-retained-world-batch-ml-1150704121"></a>
### full

```ml
full
```

Complete geometry batch retained before visibility filtering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L75)

<a id="field-field-mq3-renderer-retained-world-batch-cache-last-last-src-mq3-renderer-retained-world-batch-ml-651175599"></a>
### last

```ml
last
```

Most recently selected or submitted retained geometry state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L91)

<a id="field-field-mq3-renderer-retained-world-batch-cache-lightcatalog-lightcatalog-src-mq3-renderer-retained-world-batch-ml-1178107625"></a>
### lightCatalog

```ml
lightCatalog
```

Shared resources used when drawing dynamic-light contributions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L71)

<a id="field-field-mq3-renderer-retained-world-batch-cache-reason-reason-src-mq3-renderer-retained-world-batch-ml-274240359"></a>
### reason

```ml
reason
```

Explanation of why retained rendering is unavailable or was bypassed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L95)

<a id="field-field-mq3-renderer-retained-world-batch-cache-receiveflags-receiveflags-src-mq3-renderer-retained-world-batch-ml-1684853695"></a>
### receiveFlags

```ml
receiveFlags
```

Per-surface flags controlling reception of dynamic lights and effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L73)

<a id="field-field-mq3-renderer-retained-world-batch-cache-selections-selections-src-mq3-renderer-retained-world-batch-ml-1525770165"></a>
### selections

```ml
selections
```

Number of visibility selections applied to the retained geometry cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L97)

<a id="field-field-mq3-renderer-retained-world-batch-cache-skyflags-skyflags-src-mq3-renderer-retained-world-batch-ml-763378319"></a>
### skyFlags

```ml
skyFlags
```

Per-material flags indicating that normal world drawing must skip sky geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L67)

<a id="field-field-mq3-renderer-retained-world-batch-cache-staticprimes-staticprimes-src-mq3-renderer-retained-world-batch-ml-250476187"></a>
### staticPrimes

```ml
staticPrimes
```

Number of static native-buffer preparations performed by the retained cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L101)

<a id="field-field-mq3-renderer-retained-world-batch-cache-streams-streams-src-mq3-renderer-retained-world-batch-ml-1938749499"></a>
### streams

```ml
streams
```

Open streamed-file records managed by the platform runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L79)

<a id="field-field-mq3-renderer-retained-world-batch-cache-world-world-src-mq3-renderer-retained-world-batch-ml-715594139"></a>
### world

```ml
world
```

Loaded world geometry and associated scene state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L63)
