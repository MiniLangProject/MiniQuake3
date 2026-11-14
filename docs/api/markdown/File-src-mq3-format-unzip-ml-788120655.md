# `src/mq3/format/unzip.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.unzip`](Package-mq3-format-unzip-1031717097.md)

Reachable from entry: **no**

## Imports

- `mq3/format/deflate.ml` as `raw` → [src/mq3/format/deflate.ml](File-src-mq3-format-deflate-ml-363514060.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-format-unzip-adler32-function-adler32-adler-data-src-mq3-format-unzip-ml-701997866"></a>
### adler32

```ml
function adler32(adler, data)
```

The original file embeds zlib 1.1.3. These names own that internal surface; the port funnels all actual DEFLATE work through the bounded RFC1951 decoder.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adler` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L140)

<a id="function-function-mq3-format-unzip-asciifold-function-asciifold-value-src-mq3-format-unzip-ml-1966297111"></a>
### asciiFold

```ml
function asciiFold(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L32)

<a id="function-function-mq3-format-unzip-comparebytes-function-comparebytes-left-right-fold-src-mq3-format-unzip-ml-85958178"></a>
### compareBytes

```ml
function compareBytes(left, right, fold)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `fold` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L33)

<a id="function-function-mq3-format-unzip-currententry-function-currententry-handle-src-mq3-format-unzip-ml-1895601868"></a>
### currentEntry

```ml
function currentEntry(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L67)

<a id="function-function-mq3-format-unzip-fileinfo-function-fileinfo-entry-src-mq3-format-unzip-ml-1420560056"></a>
### fileInfo

```ml
function fileInfo(entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L63)

- [mq3.format.unzip.FileInfo](Type-mq3-format-unzip-fileinfo-684352023.md) — struct
- [mq3.format.unzip.GlobalInfo](Type-mq3-format-unzip-globalinfo-1271323310.md) — struct
- [mq3.format.unzip.Handle](Type-mq3-format-unzip-handle-1002259827.md) — struct
<a id="function-function-mq3-format-unzip-inflate-function-inflate-state-data-expectedsize-src-mq3-format-unzip-ml-301250770"></a>
### inflate

```ml
function inflate(state, data, expectedSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `expectedSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L148)

<a id="function-function-mq3-format-unzip-inflate-blocks-function-inflate-blocks-state-data-expectedsize-src-mq3-format-unzip-ml-705413792"></a>
### inflate_blocks

```ml
function inflate_blocks(state, data, expectedSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `expectedSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L164)

<a id="function-function-mq3-format-unzip-inflate-blocks-free-function-inflate-blocks-free-state-src-mq3-format-unzip-ml-754007617"></a>
### inflate_blocks_free

```ml
function inflate_blocks_free(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L166)

<a id="function-function-mq3-format-unzip-inflate-blocks-new-function-inflate-blocks-new-windowbits-src-mq3-format-unzip-ml-1776779274"></a>
### inflate_blocks_new

```ml
function inflate_blocks_new(windowBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `windowBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L163)

<a id="function-function-mq3-format-unzip-inflate-blocks-reset-function-inflate-blocks-reset-state-src-mq3-format-unzip-ml-431627995"></a>
### inflate_blocks_reset

```ml
function inflate_blocks_reset(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L165)

<a id="function-function-mq3-format-unzip-inflate-blocks-sync-point-function-inflate-blocks-sync-point-state-src-mq3-format-unzip-ml-1803227025"></a>
### inflate_blocks_sync_point

```ml
function inflate_blocks_sync_point(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L167)

<a id="function-function-mq3-format-unzip-inflate-codes-function-inflate-codes-state-data-expectedsize-src-mq3-format-unzip-ml-1194662640"></a>
### inflate_codes

```ml
function inflate_codes(state, data, expectedSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `expectedSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L170)

<a id="function-function-mq3-format-unzip-inflate-codes-free-function-inflate-codes-free-state-src-mq3-format-unzip-ml-988890563"></a>
### inflate_codes_free

```ml
function inflate_codes_free(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L171)

<a id="function-function-mq3-format-unzip-inflate-codes-new-function-inflate-codes-new-windowbits-src-mq3-format-unzip-ml-40630452"></a>
### inflate_codes_new

```ml
function inflate_codes_new(windowBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `windowBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L169)

<a id="function-function-mq3-format-unzip-inflate-fast-function-inflate-fast-state-data-expectedsize-src-mq3-format-unzip-ml-77695192"></a>
### inflate_fast

```ml
function inflate_fast(state, data, expectedSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `expectedSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L172)

<a id="function-function-mq3-format-unzip-inflate-flush-function-inflate-flush-state-src-mq3-format-unzip-ml-164407927"></a>
### inflate_flush

```ml
function inflate_flush(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L173)

<a id="function-function-mq3-format-unzip-inflate-set-dictionary-function-inflate-set-dictionary-state-dictionary-src-mq3-format-unzip-ml-2035951047"></a>
### inflate_set_dictionary

```ml
function inflate_set_dictionary(state, dictionary)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dictionary` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L168)

<a id="function-function-mq3-format-unzip-inflateend-function-inflateend-state-src-mq3-format-unzip-ml-1367941699"></a>
### inflateEnd

```ml
function inflateEnd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L147)

<a id="function-function-mq3-format-unzip-inflateinit2-function-inflateinit2-windowbits-src-mq3-format-unzip-ml-1112166182"></a>
### inflateInit2_

```ml
function inflateInit2_(windowBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `windowBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L144)

<a id="function-function-mq3-format-unzip-inflateinit-function-inflateinit-src-mq3-format-unzip-ml-2045866174"></a>
### inflateInit_

```ml
function inflateInit_()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L145)

<a id="function-function-mq3-format-unzip-inflatereset-function-inflatereset-state-src-mq3-format-unzip-ml-434963427"></a>
### inflateReset

```ml
function inflateReset(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L146)

<a id="function-function-mq3-format-unzip-inflatesetdictionary-function-inflatesetdictionary-state-dictionary-src-mq3-format-unzip-ml-1405563643"></a>
### inflateSetDictionary

```ml
function inflateSetDictionary(state, dictionary)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dictionary` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L152)

- [mq3.format.unzip.InflateState](Type-mq3-format-unzip-inflatestate-2027770121.md) — struct
<a id="function-function-mq3-format-unzip-inflatesync-function-inflatesync-state-data-src-mq3-format-unzip-ml-1895908119"></a>
### inflateSync

```ml
function inflateSync(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L153)

<a id="function-function-mq3-format-unzip-inflatesyncpoint-function-inflatesyncpoint-state-src-mq3-format-unzip-ml-42293339"></a>
### inflateSyncPoint

```ml
function inflateSyncPoint(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L162)

- [mq3.format.unzip.LocalHeader](Type-mq3-format-unzip-localheader-754130509.md) — struct
<a id="function-function-mq3-format-unzip-strcmpcasenosensitive-internal-function-strcmpcasenosensitive-internal-left-right-src-mq3-format-unzip-ml-1976691379"></a>
### strcmpcasenosensitive_internal

```ml
function strcmpcasenosensitive_internal(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L38)

- [mq3.format.unzip.TmUnz](Type-mq3-format-unzip-tmunz-1379299385.md) — struct
<a id="constant-constant-mq3-format-unzip-unz-badzipfile-const-unz-badzipfile-qcommonheaders-unz-badzipfile-src-mq3-format-unzip-ml-1234405419"></a>
### UNZ_BADZIPFILE

```ml
const UNZ_BADZIPFILE = qcommonHeaders.UNZ_BADZIPFILE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L13)

<a id="constant-constant-mq3-format-unzip-unz-casesensitive-const-unz-casesensitive-qcommonheaders-unz-casesensitive-src-mq3-format-unzip-ml-495229971"></a>
### UNZ_CASESENSITIVE

```ml
const UNZ_CASESENSITIVE = qcommonHeaders.UNZ_CASESENSITIVE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L16)

<a id="constant-constant-mq3-format-unzip-unz-crcerror-const-unz-crcerror-qcommonheaders-unz-crcerror-src-mq3-format-unzip-ml-1238645279"></a>
### UNZ_CRCERROR

```ml
const UNZ_CRCERROR = qcommonHeaders.UNZ_CRCERROR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L15)

<a id="constant-constant-mq3-format-unzip-unz-end-of-list-of-file-const-unz-end-of-list-of-file-qcommonheaders-unz-end-of-list-of-file-src-mq3-format-unzip-ml-1020417312"></a>
### UNZ_END_OF_LIST_OF_FILE

```ml
const UNZ_END_OF_LIST_OF_FILE = qcommonHeaders.UNZ_END_OF_LIST_OF_FILE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L10)

<a id="constant-constant-mq3-format-unzip-unz-eof-const-unz-eof-qcommonheaders-unz-eof-src-mq3-format-unzip-ml-1621740749"></a>
### UNZ_EOF

```ml
const UNZ_EOF = qcommonHeaders.UNZ_EOF
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L11)

<a id="constant-constant-mq3-format-unzip-unz-internalerror-const-unz-internalerror-qcommonheaders-unz-internalerror-src-mq3-format-unzip-ml-1714250114"></a>
### UNZ_INTERNALERROR

```ml
const UNZ_INTERNALERROR = qcommonHeaders.UNZ_INTERNALERROR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L14)

<a id="constant-constant-mq3-format-unzip-unz-notcasesensitive-const-unz-notcasesensitive-qcommonheaders-unz-notcasesensitive-src-mq3-format-unzip-ml-1029752078"></a>
### UNZ_NOTCASESENSITIVE

```ml
const UNZ_NOTCASESENSITIVE = qcommonHeaders.UNZ_NOTCASESENSITIVE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L17)

<a id="constant-constant-mq3-format-unzip-unz-ok-const-unz-ok-qcommonheaders-unz-ok-src-mq3-format-unzip-ml-1746616081"></a>
### UNZ_OK

```ml
const UNZ_OK = qcommonHeaders.UNZ_OK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L9)

<a id="constant-constant-mq3-format-unzip-unz-osdefaultcase-const-unz-osdefaultcase-qcommonheaders-unz-osdefaultcase-src-mq3-format-unzip-ml-1488400192"></a>
### UNZ_OSDEFAULTCASE

```ml
const UNZ_OSDEFAULTCASE = qcommonHeaders.UNZ_OSDEFAULTCASE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L18)

<a id="constant-constant-mq3-format-unzip-unz-paramerror-const-unz-paramerror-qcommonheaders-unz-paramerror-src-mq3-format-unzip-ml-112751232"></a>
### UNZ_PARAMERROR

```ml
const UNZ_PARAMERROR = qcommonHeaders.UNZ_PARAMERROR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L12)

<a id="function-function-mq3-format-unzip-unzclose-function-unzclose-file-src-mq3-format-unzip-ml-1737126240"></a>
### unzClose

```ml
function unzClose(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L78)

<a id="function-function-mq3-format-unzip-unzclosecurrentfile-function-unzclosecurrentfile-file-src-mq3-format-unzip-ml-1450871040"></a>
### unzCloseCurrentFile

```ml
function unzCloseCurrentFile(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L136)

<a id="function-function-mq3-format-unzip-unzeof-function-unzeof-file-src-mq3-format-unzip-ml-1346918836"></a>
### unzeof

```ml
function unzeof(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L131)

<a id="function-function-mq3-format-unzip-unzgetcurrentfileinfo-function-unzgetcurrentfileinfo-file-src-mq3-format-unzip-ml-1677447912"></a>
### unzGetCurrentFileInfo

```ml
function unzGetCurrentFileInfo(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L85)

<a id="function-function-mq3-format-unzip-unzgetcurrentfileinfoposition-function-unzgetcurrentfileinfoposition-file-src-mq3-format-unzip-ml-249765374"></a>
### unzGetCurrentFileInfoPosition

```ml
function unzGetCurrentFileInfoPosition(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L95)

<a id="function-function-mq3-format-unzip-unzgetglobalcomment-function-unzgetglobalcomment-file-size-src-mq3-format-unzip-ml-1227812557"></a>
### unzGetGlobalComment

```ml
function unzGetGlobalComment(file, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L80)

<a id="function-function-mq3-format-unzip-unzgetglobalinfo-function-unzgetglobalinfo-file-src-mq3-format-unzip-ml-546663424"></a>
### unzGetGlobalInfo

```ml
function unzGetGlobalInfo(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L79)

<a id="function-function-mq3-format-unzip-unzgetlocalextrafield-function-unzgetlocalextrafield-file-length-src-mq3-format-unzip-ml-1260894552"></a>
### unzGetLocalExtrafield

```ml
function unzGetLocalExtrafield(file, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L132)

<a id="function-function-mq3-format-unzip-unzgotofirstfile-function-unzgotofirstfile-file-src-mq3-format-unzip-ml-259877240"></a>
### unzGoToFirstFile

```ml
function unzGoToFirstFile(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L86)

<a id="function-function-mq3-format-unzip-unzgotonextfile-function-unzgotonextfile-file-src-mq3-format-unzip-ml-105508902"></a>
### unzGoToNextFile

```ml
function unzGoToNextFile(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L91)

<a id="function-function-mq3-format-unzip-unzlocal-checkcurrentfilecoherencyheader-function-unzlocal-checkcurrentfilecoherencyheader-file-src-mq3-format-unzip-ml-1130156092"></a>
### unzlocal_CheckCurrentFileCoherencyHeader

```ml
function unzlocal_CheckCurrentFileCoherencyHeader(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L114)

<a id="function-function-mq3-format-unzip-unzlocal-dosdatetotmudate-function-unzlocal-dosdatetotmudate-dosdate-src-mq3-format-unzip-ml-471915090"></a>
### unzlocal_DosDateToTmuDate

```ml
function unzlocal_DosDateToTmuDate(dosDate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dosDate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L59)

<a id="function-function-mq3-format-unzip-unzlocal-getbyte-function-unzlocal-getbyte-data-offset-src-mq3-format-unzip-ml-519270439"></a>
### unzlocal_getByte

```ml
function unzlocal_getByte(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L44)

<a id="function-function-mq3-format-unzip-unzlocal-getcurrentfileinfointernal-function-unzlocal-getcurrentfileinfointernal-file-src-mq3-format-unzip-ml-102584230"></a>
### unzlocal_GetCurrentFileInfoInternal

```ml
function unzlocal_GetCurrentFileInfoInternal(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L82)

<a id="function-function-mq3-format-unzip-unzlocal-getlong-function-unzlocal-getlong-data-offset-src-mq3-format-unzip-ml-1541038215"></a>
### unzlocal_getLong

```ml
function unzlocal_getLong(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L46)

<a id="function-function-mq3-format-unzip-unzlocal-getshort-function-unzlocal-getshort-data-offset-src-mq3-format-unzip-ml-1886301909"></a>
### unzlocal_getShort

```ml
function unzlocal_getShort(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L45)

<a id="function-function-mq3-format-unzip-unzlocal-searchcentraldir-function-unzlocal-searchcentraldir-data-src-mq3-format-unzip-ml-240319252"></a>
### unzlocal_SearchCentralDir

```ml
function unzlocal_SearchCentralDir(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L48)

<a id="function-function-mq3-format-unzip-unzlocatefile-function-unzlocatefile-file-name-casesensitivity-src-mq3-format-unzip-ml-982736206"></a>
### unzLocateFile

```ml
function unzLocateFile(file, name, caseSensitivity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `caseSensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L105)

<a id="function-function-mq3-format-unzip-unzopen-function-unzopen-path-src-mq3-format-unzip-ml-1687224909"></a>
### unzOpen

```ml
function unzOpen(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L69)

<a id="function-function-mq3-format-unzip-unzopencurrentfile-function-unzopencurrentfile-file-src-mq3-format-unzip-ml-712009432"></a>
### unzOpenCurrentFile

```ml
function unzOpenCurrentFile(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L119)

<a id="function-function-mq3-format-unzip-unzreadcurrentfile-function-unzreadcurrentfile-file-length-src-mq3-format-unzip-ml-988488292"></a>
### unzReadCurrentFile

```ml
function unzReadCurrentFile(file, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L125)

<a id="function-function-mq3-format-unzip-unzreopen-function-unzreopen-path-file-src-mq3-format-unzip-ml-2035372257"></a>
### unzReOpen

```ml
function unzReOpen(path, file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L73)

<a id="function-function-mq3-format-unzip-unzsetcurrentfileinfoposition-function-unzsetcurrentfileinfoposition-file-position-src-mq3-format-unzip-ml-663201635"></a>
### unzSetCurrentFileInfoPosition

```ml
function unzSetCurrentFileInfoPosition(file, position)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L98)

<a id="function-function-mq3-format-unzip-unzstringfilenamecompare-function-unzstringfilenamecompare-left-right-casesensitivity-src-mq3-format-unzip-ml-1240243270"></a>
### unzStringFileNameCompare

```ml
function unzStringFileNameCompare(left, right, caseSensitivity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `caseSensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L39)

<a id="function-function-mq3-format-unzip-unztell-function-unztell-file-src-mq3-format-unzip-ml-703394592"></a>
### unztell

```ml
function unztell(file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L130)

<a id="function-function-mq3-format-unzip-valid-function-valid-handle-src-mq3-format-unzip-ml-119803860"></a>
### valid

```ml
function valid(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L66)

<a id="constant-constant-mq3-format-unzip-z-buf-error-const-z-buf-error-5-src-mq3-format-unzip-ml-1663020483"></a>
### Z_BUF_ERROR

```ml
const Z_BUF_ERROR = -5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L23)

<a id="constant-constant-mq3-format-unzip-z-data-error-const-z-data-error-3-src-mq3-format-unzip-ml-1377534267"></a>
### Z_DATA_ERROR

```ml
const Z_DATA_ERROR = -3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L22)

<a id="constant-constant-mq3-format-unzip-z-ok-const-z-ok-0-src-mq3-format-unzip-ml-372593419"></a>
### Z_OK

```ml
const Z_OK = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L19)

<a id="constant-constant-mq3-format-unzip-z-stream-end-const-z-stream-end-1-src-mq3-format-unzip-ml-163605012"></a>
### Z_STREAM_END

```ml
const Z_STREAM_END = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L20)

<a id="constant-constant-mq3-format-unzip-z-stream-error-const-z-stream-error-2-src-mq3-format-unzip-ml-2107781852"></a>
### Z_STREAM_ERROR

```ml
const Z_STREAM_ERROR = -2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L21)

<a id="function-function-mq3-format-unzip-zcalloc-function-zcalloc-opaque-items-size-src-mq3-format-unzip-ml-1281487880"></a>
### zcalloc

```ml
function zcalloc(opaque, items, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opaque` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L174)

<a id="function-function-mq3-format-unzip-zcfree-function-zcfree-opaque-value-src-mq3-format-unzip-ml-2081970428"></a>
### zcfree

```ml
function zcfree(opaque, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opaque` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L175)
