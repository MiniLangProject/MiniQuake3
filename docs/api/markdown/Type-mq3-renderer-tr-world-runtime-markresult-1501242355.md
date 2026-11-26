# `mq3.renderer.tr_world_runtime.MarkResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-world-runtime-ml-1466231431.md)

<a id="struct-struct-mq3-renderer-tr-world-runtime-markresult-struct-markresult-src-mq3-renderer-tr-world-runtime-ml-1482353775"></a>
## MarkResult

```ml
struct MarkResult
```

Data record for `mq3.renderer.tr_world_runtime.MarkResult`; groups `changed`, `cluster`, `visCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L122)

## Members

<a id="field-field-mq3-renderer-tr-world-runtime-markresult-changed-changed-src-mq3-renderer-tr-world-runtime-ml-1660409519"></a>
### changed

```ml
changed
```

Whether the visibility cluster or associated visible set changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L124)

<a id="field-field-mq3-renderer-tr-world-runtime-markresult-cluster-cluster-src-mq3-renderer-tr-world-runtime-ml-1550977291"></a>
### cluster

```ml
cluster
```

Visibility cluster containing the BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L126)

<a id="field-field-mq3-renderer-tr-world-runtime-markresult-viscount-viscount-src-mq3-renderer-tr-world-runtime-ml-1868187605"></a>
### visCount

```ml
visCount
```

Current visibility-marking generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L128)
