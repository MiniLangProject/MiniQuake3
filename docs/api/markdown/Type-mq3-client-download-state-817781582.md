# `mq3.client.download.State`

[Home](README.md) · [Source file](File-src-mq3-client-download-ml-170988721.md)

<a id="struct-struct-mq3-client-download-state-struct-state-src-mq3-client-download-ml-1697041387"></a>
## State

```ml
struct State
```

Stores download state, including `downloadSize`, `downloadBlock`, `download`, `downloadTempName`, `downloadName`, `downloadCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L10)

## Members

<a id="field-field-mq3-client-download-state-download-download-src-mq3-client-download-ml-69048926"></a>
### download

```ml
download
```

When constructing this record, `create` supplies `0` for this member. Used by `parseDownload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L17)

<a id="field-field-mq3-client-download-state-downloadblock-downloadblock-src-mq3-client-download-ml-835676730"></a>
### downloadBlock

```ml
downloadBlock
```

Download-block number the client is currently waiting to receive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L14)

<a id="field-field-mq3-client-download-state-downloadcount-downloadcount-src-mq3-client-download-ml-1336061778"></a>
### downloadCount

```ml
downloadCount
```

Number of bytes accumulated for the active download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L25)

<a id="field-field-mq3-client-download-state-downloadname-downloadname-src-mq3-client-download-ml-464304636"></a>
### downloadName

```ml
downloadName
```

When constructing this record, `create` supplies an empty string for this member. Used by `parseDownload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L23)

<a id="field-field-mq3-client-download-state-downloadsize-downloadsize-src-mq3-client-download-ml-309773812"></a>
### downloadSize

```ml
downloadSize
```

Expected total size in bytes of the active download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L12)

<a id="field-field-mq3-client-download-state-downloadtempname-downloadtempname-src-mq3-client-download-ml-669374232"></a>
### downloadTempName

```ml
downloadTempName
```

When constructing this record, `create` supplies an empty string for this member. Used by `parseDownload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/download.ml#L20)
