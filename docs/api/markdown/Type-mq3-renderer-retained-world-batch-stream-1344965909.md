# `mq3.renderer.retained_world_batch.Stream`

[Home](README.md) · [Source file](File-src-mq3-renderer-retained-world-batch-ml-1153698861.md)

<a id="struct-struct-mq3-renderer-retained-world-batch-stream-struct-stream-src-mq3-renderer-retained-world-batch-ml-812450743"></a>
## Stream

```ml
struct Stream
```

Data record for `mq3.renderer.retained_world_batch.Stream`; groups `source`, `count`, `runs`, `firsts`, `counts`, `draw`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L40)

## Members

<a id="field-field-mq3-renderer-retained-world-batch-stream-activepass-activepass-src-mq3-renderer-retained-world-batch-ml-1931343581"></a>
### activePass

```ml
activePass
```

Material-stage pass restricted to the current visible subset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L56)

<a id="field-field-mq3-renderer-retained-world-batch-stream-count-count-src-mq3-renderer-retained-world-batch-ml-1642638839"></a>
### count

```ml
count
```

Number of packed triangle records in the complete retained source stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L44)

<a id="field-field-mq3-renderer-retained-world-batch-stream-counts-counts-src-mq3-renderer-retained-world-batch-ml-1099955123"></a>
### counts

```ml
counts
```

Number of primitive records in each retained drawing run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L50)

<a id="field-field-mq3-renderer-retained-world-batch-stream-draw-draw-src-mq3-renderer-retained-world-batch-ml-2078482319"></a>
### draw

```ml
draw
```

Prepared drawing commands for the currently selected geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L52)

<a id="field-field-mq3-renderer-retained-world-batch-stream-firsts-firsts-src-mq3-renderer-retained-world-batch-ml-930152093"></a>
### firsts

```ml
firsts
```

First primitive index of each retained drawing run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L48)

<a id="field-field-mq3-renderer-retained-world-batch-stream-fullpass-fullpass-src-mq3-renderer-retained-world-batch-ml-1955865267"></a>
### fullPass

```ml
fullPass
```

Complete material-stage pass retained before visibility filtering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L54)

<a id="field-field-mq3-renderer-retained-world-batch-stream-primed-primed-src-mq3-renderer-retained-world-batch-ml-2087917641"></a>
### primed

```ml
primed
```

Whether the retained stream has completed its initial native-buffer preparation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L58)

<a id="field-field-mq3-renderer-retained-world-batch-stream-runs-runs-src-mq3-renderer-retained-world-batch-ml-896807099"></a>
### runs

```ml
runs
```

Contiguous primitive ranges grouped for retained drawing or material submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L46)

<a id="field-field-mq3-renderer-retained-world-batch-stream-source-source-src-mq3-renderer-retained-world-batch-ml-1554776077"></a>
### source

```ml
source
```

Packed source triangle records retained before visibility filtering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L42)
