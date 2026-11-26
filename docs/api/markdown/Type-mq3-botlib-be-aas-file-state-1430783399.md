# `mq3.botlib.be_aas_file.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-file-ml-8892360.md)

<a id="struct-struct-mq3-botlib-be-aas-file-state-struct-state-src-mq3-botlib-be-aas-file-ml-1678598095"></a>
## State

```ml
struct State
```

`State` record for be aas file, containing `services`, `map`, `loaded`, `initialized` and `saveFile` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L33)

## Members

<a id="field-field-mq3-botlib-be-aas-file-state-bspchecksum-bspchecksum-src-mq3-botlib-be-aas-file-ml-1984687828"></a>
### bspChecksum

```ml
bspChecksum
```

Checksum of the BSP map associated with the navigation data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L45)

<a id="field-field-mq3-botlib-be-aas-file-state-initialized-initialized-src-mq3-botlib-be-aas-file-ml-520345188"></a>
### initialized

```ml
initialized
```

Initialization status retained alongside the loaded AAS file state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L41)

<a id="field-field-mq3-botlib-be-aas-file-state-lasterror-lasterror-src-mq3-botlib-be-aas-file-ml-1493947540"></a>
### lastError

```ml
lastError
```

Most recent error code reported by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L47)

<a id="field-field-mq3-botlib-be-aas-file-state-loaded-loaded-src-mq3-botlib-be-aas-file-ml-2028302322"></a>
### loaded

```ml
loaded
```

True after an AAS file has been loaded and its map data accepted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L39)

<a id="field-field-mq3-botlib-be-aas-file-state-map-map-src-mq3-botlib-be-aas-file-ml-12344132"></a>
### map

```ml
map
```

Parsed AAS map currently owned by the file subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L37)

<a id="field-field-mq3-botlib-be-aas-file-state-savefile-savefile-src-mq3-botlib-be-aas-file-ml-1897507346"></a>
### saveFile

```ml
saveFile
```

True when the current AAS data should be saved back to a file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L43)

<a id="field-field-mq3-botlib-be-aas-file-state-services-services-src-mq3-botlib-be-aas-file-ml-838665396"></a>
### services

```ml
services
```

File access and diagnostic callbacks used by the AAS loader and serializer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L35)
