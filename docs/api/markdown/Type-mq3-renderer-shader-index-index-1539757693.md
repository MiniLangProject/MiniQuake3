# `mq3.renderer.shader_index.Index`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-index-ml-492021135.md)

<a id="struct-struct-mq3-renderer-shader-index-index-struct-index-src-mq3-renderer-shader-index-ml-1859160061"></a>
## Index

```ml
struct Index
```

Data record for `mq3.renderer.shader_index.Index`; groups `text`, `entries`, `buckets`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L25)

## Members

<a id="field-field-mq3-renderer-shader-index-index-buckets-buckets-src-mq3-renderer-shader-index-ml-1657603717"></a>
### buckets

```ml
buckets
```

Hash-table buckets used to locate entries by name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L31)

<a id="field-field-mq3-renderer-shader-index-index-entries-entries-src-mq3-renderer-shader-index-ml-1731822417"></a>
### entries

```ml
entries
```

Records currently stored in this index, registry, or cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L29)

<a id="field-field-mq3-renderer-shader-index-index-text-text-src-mq3-renderer-shader-index-ml-659024755"></a>
### text

```ml
text
```

Text payload, script source, or message associated with this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L27)
