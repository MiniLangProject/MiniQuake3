# `mq3.botlib.be_aas_file.LumpLoad`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-file-ml-8892360.md)

<a id="struct-struct-mq3-botlib-be-aas-file-lumpload-struct-lumpload-src-mq3-botlib-be-aas-file-ml-331474715"></a>
## LumpLoad

```ml
struct LumpLoad
```

`LumpLoad` record for be aas file, containing `data`, `nextOffset` and `sequential`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L50)

## Members

<a id="field-field-mq3-botlib-be-aas-file-lumpload-data-data-src-mq3-botlib-be-aas-file-ml-1296066443"></a>
### data

```ml
data
```

Bytes decoded or copied from the requested AAS lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L52)

<a id="field-field-mq3-botlib-be-aas-file-lumpload-nextoffset-nextoffset-src-mq3-botlib-be-aas-file-ml-1969358431"></a>
### nextOffset

```ml
nextOffset
```

Byte position immediately after the loaded lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L54)

<a id="field-field-mq3-botlib-be-aas-file-lumpload-sequential-sequential-src-mq3-botlib-be-aas-file-ml-2060847405"></a>
### sequential

```ml
sequential
```

True when this lump begins where the preceding lump ended.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L56)
