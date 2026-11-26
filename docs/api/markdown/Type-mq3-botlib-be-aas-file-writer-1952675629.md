# `mq3.botlib.be_aas_file.Writer`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-file-ml-8892360.md)

<a id="struct-struct-mq3-botlib-be-aas-file-writer-struct-writer-src-mq3-botlib-be-aas-file-ml-1596787003"></a>
## Writer

```ml
struct Writer
```

`Writer` record for be aas file, containing `header`, `chunks` and `offset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L59)

## Members

<a id="field-field-mq3-botlib-be-aas-file-writer-chunks-chunks-src-mq3-botlib-be-aas-file-ml-1269931694"></a>
### chunks

```ml
chunks
```

Serialized lump payloads accumulated in output order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L63)

<a id="field-field-mq3-botlib-be-aas-file-writer-header-header-src-mq3-botlib-be-aas-file-ml-1800087400"></a>
### header

```ml
header
```

AAS file-header bytes containing the lump directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L61)

<a id="field-field-mq3-botlib-be-aas-file-writer-offset-offset-src-mq3-botlib-be-aas-file-ml-1204094436"></a>
### offset

```ml
offset
```

Next byte offset for appending a serialized AAS lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L65)
