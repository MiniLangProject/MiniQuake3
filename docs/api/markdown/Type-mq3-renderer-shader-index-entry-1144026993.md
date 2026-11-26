# `mq3.renderer.shader_index.Entry`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-index-ml-492021135.md)

<a id="struct-struct-mq3-renderer-shader-index-entry-struct-entry-src-mq3-renderer-shader-index-ml-96200541"></a>
## Entry

```ml
struct Entry
```

Data record for `mq3.renderer.shader_index.Entry`; groups `name`, `hash`, `bodyOffset`, `endOffset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L14)

## Members

<a id="field-field-mq3-renderer-shader-index-entry-bodyoffset-bodyoffset-src-mq3-renderer-shader-index-ml-1840154255"></a>
### bodyOffset

```ml
bodyOffset
```

Byte offset of the shader definition body within the source text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L20)

<a id="field-field-mq3-renderer-shader-index-entry-endoffset-endoffset-src-mq3-renderer-shader-index-ml-996811573"></a>
### endOffset

```ml
endOffset
```

Byte offset immediately after the indexed shader definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L22)

<a id="field-field-mq3-renderer-shader-index-entry-hash-hash-src-mq3-renderer-shader-index-ml-2106519397"></a>
### hash

```ml
hash
```

Hash value used to select or compare the indexed entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L18)

<a id="field-field-mq3-renderer-shader-index-entry-name-name-src-mq3-renderer-shader-index-ml-882836343"></a>
### name

```ml
name
```

Shader-definition name used as the lookup key for the indexed source-text span.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_index.ml#L16)
