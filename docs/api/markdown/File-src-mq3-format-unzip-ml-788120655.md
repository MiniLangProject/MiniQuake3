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
| `adler` | `dynamic` | — | Adler used in `(adler >> 16)` and `(adler & 65535)`. |
| `data` | `dynamic` | — | Data used in `(data == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L241)

<a id="function-function-mq3-format-unzip-asciifold-function-asciifold-value-src-mq3-format-unzip-ml-1966297111"></a>
### asciiFold

```ml
function asciiFold(value)
```

Compute ascii fold in format.unzip; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value - 32)` and `(value >= 97)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L40)

<a id="function-function-mq3-format-unzip-comparebytes-function-comparebytes-left-right-fold-src-mq3-format-unzip-ml-85958178"></a>
### compareBytes

```ml
function compareBytes(left, right, fold)
```

Compute compare bytes in format.unzip; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `bytes(left)`. |
| `right` | `dynamic` | — | Right used in `bytes(right)`. |
| `fold` | `dynamic` | — | Fold operand used by `compareBytes`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L45)

<a id="function-function-mq3-format-unzip-currententry-function-currententry-handle-src-mq3-format-unzip-ml-1895601868"></a>
### currentEntry

```ml
function currentEntry(handle)
```

Compute current entry in format.unzip; the normal completion returns `handle.archive.entries[handle.current]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Record exposing `currentOk`, `current`, `archive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L105)

<a id="function-function-mq3-format-unzip-fileinfo-function-fileinfo-entry-src-mq3-format-unzip-ml-1420560056"></a>
### fileInfo

```ml
function fileInfo(entry)
```

Create `mq3.format.unzip.FileInfo` with version=entry.version; versionNeeded=entry.versionNeeded; flag=entry.flags; compressionMethod=entry.method; 14 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Record exposing `version`, `versionNeeded`, `flags`, `method`, `dosDate`, `checksum`, `compressedSize` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L97)

- [mq3.format.unzip.FileInfo](Type-mq3-format-unzip-fileinfo-684352023.md) — struct
- [mq3.format.unzip.GlobalInfo](Type-mq3-format-unzip-globalinfo-1271323310.md) — struct
- [mq3.format.unzip.Handle](Type-mq3-format-unzip-handle-1002259827.md) — struct
<a id="function-function-mq3-format-unzip-inflate-function-inflate-state-data-expectedsize-src-mq3-format-unzip-ml-301250770"></a>
### inflate

```ml
function inflate(state, data, expectedSize)
```

Update `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint` in format.unzip; the normal completion returns `decoded`.

Direct state writes: `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`. Updated in place: `totalIn`, `totalOut`, `output`, `syncPoint`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.deflate.inflate`. |
| `expectedSize` | `dynamic` | — | Expected size passed as `expectedSize` to `mq3.format.deflate.inflate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L266)

<a id="function-function-mq3-format-unzip-inflate-blocks-function-inflate-blocks-state-data-expectedsize-src-mq3-format-unzip-ml-705413792"></a>
### inflate_blocks

```ml
function inflate_blocks(state, data, expectedSize)
```

Return `mq3.format.unzip.inflate(state, data, expectedSize)` from `format.unzip.inflate_blocks`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflate`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.unzip.inflate`. |
| `expectedSize` | `dynamic` | — | Expected size passed as `expectedSize` to `mq3.format.unzip.inflate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L300)

<a id="function-function-mq3-format-unzip-inflate-blocks-free-function-inflate-blocks-free-state-src-mq3-format-unzip-ml-754007617"></a>
### inflate_blocks_free

```ml
function inflate_blocks_free(state)
```

Return `mq3.format.unzip.inflateEnd(state)` from `format.unzip.inflate_blocks_free`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflateEnd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L306)

<a id="function-function-mq3-format-unzip-inflate-blocks-new-function-inflate-blocks-new-windowbits-src-mq3-format-unzip-ml-1776779274"></a>
### inflate_blocks_new

```ml
function inflate_blocks_new(windowBits)
```

Return `mq3.format.unzip.inflateInit2_(windowBits)` from `format.unzip.inflate_blocks_new`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `windowBits` | `dynamic` | — | Window bits passed as `windowBits` to `mq3.format.unzip.inflateInit2_`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L295)

<a id="function-function-mq3-format-unzip-inflate-blocks-reset-function-inflate-blocks-reset-state-src-mq3-format-unzip-ml-431627995"></a>
### inflate_blocks_reset

```ml
function inflate_blocks_reset(state)
```

Return `mq3.format.unzip.inflateReset(state)` from `format.unzip.inflate_blocks_reset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflateReset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L303)

<a id="function-function-mq3-format-unzip-inflate-blocks-sync-point-function-inflate-blocks-sync-point-state-src-mq3-format-unzip-ml-1803227025"></a>
### inflate_blocks_sync_point

```ml
function inflate_blocks_sync_point(state)
```

Return `mq3.format.unzip.inflateSyncPoint(state)` from `format.unzip.inflate_blocks_sync_point`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflateSyncPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L309)

<a id="function-function-mq3-format-unzip-inflate-codes-function-inflate-codes-state-data-expectedsize-src-mq3-format-unzip-ml-1194662640"></a>
### inflate_codes

```ml
function inflate_codes(state, data, expectedSize)
```

Return `mq3.format.unzip.inflate(state, data, expectedSize)` from `format.unzip.inflate_codes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflate`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.unzip.inflate`. |
| `expectedSize` | `dynamic` | — | Expected size passed as `expectedSize` to `mq3.format.unzip.inflate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L321)

<a id="function-function-mq3-format-unzip-inflate-codes-free-function-inflate-codes-free-state-src-mq3-format-unzip-ml-988890563"></a>
### inflate_codes_free

```ml
function inflate_codes_free(state)
```

Return `mq3.format.unzip.inflateEnd(state)` from `format.unzip.inflate_codes_free`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflateEnd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L324)

<a id="function-function-mq3-format-unzip-inflate-codes-new-function-inflate-codes-new-windowbits-src-mq3-format-unzip-ml-40630452"></a>
### inflate_codes_new

```ml
function inflate_codes_new(windowBits)
```

Return `mq3.format.unzip.inflateInit2_(windowBits)` from `format.unzip.inflate_codes_new`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `windowBits` | `dynamic` | — | Window bits passed as `windowBits` to `mq3.format.unzip.inflateInit2_`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L316)

<a id="function-function-mq3-format-unzip-inflate-fast-function-inflate-fast-state-data-expectedsize-src-mq3-format-unzip-ml-77695192"></a>
### inflate_fast

```ml
function inflate_fast(state, data, expectedSize)
```

Return `mq3.format.unzip.inflate(state, data, expectedSize)` from `format.unzip.inflate_fast`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflate`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.unzip.inflate`. |
| `expectedSize` | `dynamic` | — | Expected size passed as `expectedSize` to `mq3.format.unzip.inflate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L329)

<a id="function-function-mq3-format-unzip-inflate-flush-function-inflate-flush-state-src-mq3-format-unzip-ml-164407927"></a>
### inflate_flush

```ml
function inflate_flush(state)
```

Compute inflate flush in format.unzip; the normal completion returns `state.output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`, `output`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L332)

<a id="function-function-mq3-format-unzip-inflate-set-dictionary-function-inflate-set-dictionary-state-dictionary-src-mq3-format-unzip-ml-2035951047"></a>
### inflate_set_dictionary

```ml
function inflate_set_dictionary(state, dictionary)
```

Return `mq3.format.unzip.inflateSetDictionary(state, dictionary)` from `format.unzip.inflate_set_dictionary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.format.unzip.inflateSetDictionary`. |
| `dictionary` | `dynamic` | — | Dictionary passed as `dictionary` to `mq3.format.unzip.inflateSetDictionary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L313)

<a id="function-function-mq3-format-unzip-inflateend-function-inflateend-state-src-mq3-format-unzip-ml-1367941699"></a>
### inflateEnd

```ml
function inflateEnd(state)
```

Update `state.initialized`, `state.output` in format.unzip; the normal completion returns `Z_OK`.

Direct state writes: `state.initialized`, `state.output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`. Updated in place: `initialized`, `output`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L259)

<a id="function-function-mq3-format-unzip-inflateinit2-function-inflateinit2-windowbits-src-mq3-format-unzip-ml-1112166182"></a>
### inflateInit2_

```ml
function inflateInit2_(windowBits)
```

Compute inflate init2 in format.unzip; the normal completion returns `InflateState(windowBits, true, 0, 0, void, void, false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `windowBits` | `dynamic` | — | Initial `windowBits` field stored in the returned or constructed `mq3.format.unzip.InflateState` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L247)

<a id="function-function-mq3-format-unzip-inflateinit-function-inflateinit-src-mq3-format-unzip-ml-2045866174"></a>
### inflateInit_

```ml
function inflateInit_()
```

Return `mq3.format.unzip.inflateInit2_(15)` from `format.unzip.inflateInit_`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L249)

<a id="function-function-mq3-format-unzip-inflatereset-function-inflatereset-state-src-mq3-format-unzip-ml-434963427"></a>
### inflateReset

```ml
function inflateReset(state)
```

Update `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint` in format.unzip; the normal completion returns `Z_OK`.

Direct state writes: `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`. Updated in place: `totalIn`, `totalOut`, `output`, `syncPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L254)

<a id="function-function-mq3-format-unzip-inflatesetdictionary-function-inflatesetdictionary-state-dictionary-src-mq3-format-unzip-ml-1405563643"></a>
### inflateSetDictionary

```ml
function inflateSetDictionary(state, dictionary)
```

Update `state.dictionary` in format.unzip; the normal completion returns `Z_OK`.

Direct state writes: `state.dictionary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`. Updated in place: `dictionary`. |
| `dictionary` | `dynamic` | — | Dictionary operand used by `inflateSetDictionary`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L275)

- [mq3.format.unzip.InflateState](Type-mq3-format-unzip-inflatestate-2027770121.md) — struct
<a id="function-function-mq3-format-unzip-inflatesync-function-inflatesync-state-data-src-mq3-format-unzip-ml-1895908119"></a>
### inflateSync

```ml
function inflateSync(state, data)
```

Update `state.syncPoint` in format.unzip; the normal completion returns `Z_DATA_ERROR`.

Direct state writes: `state.syncPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`. Updated in place: `syncPoint`. |
| `data` | `dynamic` | — | Sequence traversed as `value` by the loop in `inflateSync`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L281)

<a id="function-function-mq3-format-unzip-inflatesyncpoint-function-inflatesyncpoint-state-src-mq3-format-unzip-ml-42293339"></a>
### inflateSyncPoint

```ml
function inflateSyncPoint(state)
```

Compute inflate sync point in format.unzip; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`, `syncPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L292)

- [mq3.format.unzip.LocalHeader](Type-mq3-format-unzip-localheader-754130509.md) — struct
<a id="function-function-mq3-format-unzip-strcmpcasenosensitive-internal-function-strcmpcasenosensitive-internal-left-right-src-mq3-format-unzip-ml-1976691379"></a>
### strcmpcasenosensitive_internal

```ml
function strcmpcasenosensitive_internal(left, right)
```

Return `mq3.format.unzip.compareBytes(left, right, true)` from `format.unzip.strcmpcasenosensitive_internal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left passed as `left` to `mq3.format.unzip.compareBytes`. |
| `right` | `dynamic` | — | Right passed as `right` to `mq3.format.unzip.compareBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L53)

- [mq3.format.unzip.TmUnz](Type-mq3-format-unzip-tmunz-1379299385.md) — struct
<a id="constant-constant-mq3-format-unzip-unz-badzipfile-const-unz-badzipfile-qcommonheaders-unz-badzipfile-src-mq3-format-unzip-ml-1234405419"></a>
### UNZ_BADZIPFILE

```ml
const UNZ_BADZIPFILE = qcommonHeaders.UNZ_BADZIPFILE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L13)

<a id="constant-constant-mq3-format-unzip-unz-casesensitive-const-unz-casesensitive-qcommonheaders-unz-casesensitive-src-mq3-format-unzip-ml-495229971"></a>
### UNZ_CASESENSITIVE

```ml
const UNZ_CASESENSITIVE = qcommonHeaders.UNZ_CASESENSITIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L16)

<a id="constant-constant-mq3-format-unzip-unz-crcerror-const-unz-crcerror-qcommonheaders-unz-crcerror-src-mq3-format-unzip-ml-1238645279"></a>
### UNZ_CRCERROR

```ml
const UNZ_CRCERROR = qcommonHeaders.UNZ_CRCERROR
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L15)

<a id="constant-constant-mq3-format-unzip-unz-end-of-list-of-file-const-unz-end-of-list-of-file-qcommonheaders-unz-end-of-list-of-file-src-mq3-format-unzip-ml-1020417312"></a>
### UNZ_END_OF_LIST_OF_FILE

```ml
const UNZ_END_OF_LIST_OF_FILE = qcommonHeaders.UNZ_END_OF_LIST_OF_FILE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L10)

<a id="constant-constant-mq3-format-unzip-unz-eof-const-unz-eof-qcommonheaders-unz-eof-src-mq3-format-unzip-ml-1621740749"></a>
### UNZ_EOF

```ml
const UNZ_EOF = qcommonHeaders.UNZ_EOF
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L11)

<a id="constant-constant-mq3-format-unzip-unz-internalerror-const-unz-internalerror-qcommonheaders-unz-internalerror-src-mq3-format-unzip-ml-1714250114"></a>
### UNZ_INTERNALERROR

```ml
const UNZ_INTERNALERROR = qcommonHeaders.UNZ_INTERNALERROR
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L14)

<a id="constant-constant-mq3-format-unzip-unz-notcasesensitive-const-unz-notcasesensitive-qcommonheaders-unz-notcasesensitive-src-mq3-format-unzip-ml-1029752078"></a>
### UNZ_NOTCASESENSITIVE

```ml
const UNZ_NOTCASESENSITIVE = qcommonHeaders.UNZ_NOTCASESENSITIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L17)

<a id="constant-constant-mq3-format-unzip-unz-ok-const-unz-ok-qcommonheaders-unz-ok-src-mq3-format-unzip-ml-1746616081"></a>
### UNZ_OK

```ml
const UNZ_OK = qcommonHeaders.UNZ_OK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L9)

<a id="constant-constant-mq3-format-unzip-unz-osdefaultcase-const-unz-osdefaultcase-qcommonheaders-unz-osdefaultcase-src-mq3-format-unzip-ml-1488400192"></a>
### UNZ_OSDEFAULTCASE

```ml
const UNZ_OSDEFAULTCASE = qcommonHeaders.UNZ_OSDEFAULTCASE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L18)

<a id="constant-constant-mq3-format-unzip-unz-paramerror-const-unz-paramerror-qcommonheaders-unz-paramerror-src-mq3-format-unzip-ml-112751232"></a>
### UNZ_PARAMERROR

```ml
const UNZ_PARAMERROR = qcommonHeaders.UNZ_PARAMERROR
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L12)

<a id="function-function-mq3-format-unzip-unzclose-function-unzclose-file-src-mq3-format-unzip-ml-1737126240"></a>
### unzClose

```ml
function unzClose(file)
```

Update `file.readData`, `file.localExtra`, `file.closed` in format.unzip; the normal completion returns `UNZ_OK`.

Direct state writes: `file.readData`, `file.localExtra`, `file.closed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Updated in place: `readData`, `localExtra`, `closed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L125)

<a id="function-function-mq3-format-unzip-unzclosecurrentfile-function-unzclosecurrentfile-file-src-mq3-format-unzip-ml-1450871040"></a>
### unzCloseCurrentFile

```ml
function unzCloseCurrentFile(file)
```

Update `file.readData`, `file.readPosition`, `file.localExtra` in format.unzip; the normal completion returns `UNZ_OK`.

Direct state writes: `file.readData`, `file.readPosition`, `file.localExtra`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `readData`. Updated in place: `readData`, `readPosition`, `localExtra`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L235)

<a id="function-function-mq3-format-unzip-unzeof-function-unzeof-file-src-mq3-format-unzip-ml-1346918836"></a>
### unzeof

```ml
function unzeof(file)
```

Compute unzeof in format.unzip; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `readData`, `readPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L223)

<a id="function-function-mq3-format-unzip-unzgetcurrentfileinfo-function-unzgetcurrentfileinfo-file-src-mq3-format-unzip-ml-1677447912"></a>
### unzGetCurrentFileInfo

```ml
function unzGetCurrentFileInfo(file)
```

Return `mq3.format.unzip.unzlocal_GetCurrentFileInfoInternal(file)` from `format.unzip.unzGetCurrentFileInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | File passed as `file` to `mq3.format.unzip.unzlocal_GetCurrentFileInfoInternal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L141)

<a id="function-function-mq3-format-unzip-unzgetcurrentfileinfoposition-function-unzgetcurrentfileinfoposition-file-src-mq3-format-unzip-ml-249765374"></a>
### unzGetCurrentFileInfoPosition

```ml
function unzGetCurrentFileInfoPosition(file)
```

Compute unz get current file info position in format.unzip; the normal completion returns `(entry.centralOffset - file.archive.byteBeforeZip)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L161)

<a id="function-function-mq3-format-unzip-unzgetglobalcomment-function-unzgetglobalcomment-file-size-src-mq3-format-unzip-ml-1227812557"></a>
### unzGetGlobalComment

```ml
function unzGetGlobalComment(file, size)
```

Compute unz get global comment in format.unzip; the normal completion returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(len(data) > size)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L132)

<a id="function-function-mq3-format-unzip-unzgetglobalinfo-function-unzgetglobalinfo-file-src-mq3-format-unzip-ml-546663424"></a>
### unzGetGlobalInfo

```ml
function unzGetGlobalInfo(file)
```

Compute unz get global info in format.unzip; the normal completion returns `GlobalInfo(len(file.archive.entries), len(bytes(file.archive.comment)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L128)

<a id="function-function-mq3-format-unzip-unzgetlocalextrafield-function-unzgetlocalextrafield-file-length-src-mq3-format-unzip-ml-1260894552"></a>
### unzGetLocalExtrafield

```ml
function unzGetLocalExtrafield(file, length)
```

Compute unz get local extrafield in format.unzip; the normal completion returns `slice(file.localExtra, 0, count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `readData`, `localExtra`. |
| `length` | `dynamic` | — | Length used in `(length < 0)` and `(length < count)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L227)

<a id="function-function-mq3-format-unzip-unzgotofirstfile-function-unzgotofirstfile-file-src-mq3-format-unzip-ml-259877240"></a>
### unzGoToFirstFile

```ml
function unzGoToFirstFile(file)
```

Update `file.current`, `file.currentOk`, `file.readData` in format.unzip; the normal completion returns `UNZ_OK`.

Direct state writes: `file.current`, `file.currentOk`, `file.readData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. Updated in place: `current`, `currentOk`, `readData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L146)

<a id="function-function-mq3-format-unzip-unzgotonextfile-function-unzgotonextfile-file-src-mq3-format-unzip-ml-105508902"></a>
### unzGoToNextFile

```ml
function unzGoToNextFile(file)
```

Update `file.current`, `file.readData` in format.unzip; the normal completion returns `UNZ_OK`.

Direct state writes: `file.current`, `file.readData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `currentOk`, `current`, `archive`. Updated in place: `current`, `readData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L155)

<a id="function-function-mq3-format-unzip-unzlocal-checkcurrentfilecoherencyheader-function-unzlocal-checkcurrentfilecoherencyheader-file-src-mq3-format-unzip-ml-1130156092"></a>
### unzlocal_CheckCurrentFileCoherencyHeader

```ml
function unzlocal_CheckCurrentFileCoherencyHeader(file)
```

Compute unzlocal check current file coherency header in format.unzip; the normal completion returns `LocalHeader(local[0], local[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L193)

<a id="function-function-mq3-format-unzip-unzlocal-dosdatetotmudate-function-unzlocal-dosdatetotmudate-dosdate-src-mq3-format-unzip-ml-471915090"></a>
### unzlocal_DosDateToTmuDate

```ml
function unzlocal_DosDateToTmuDate(dosDate)
```

Apply `mq3.format.unzip.TmUnz` for unzlocal dos date to tmu date in format.unzip.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dosDate` | `dynamic` | — | Dos date used in `(dosDate & 31)` and `(dosDate >> 5)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L91)

<a id="function-function-mq3-format-unzip-unzlocal-getbyte-function-unzlocal-getbyte-data-offset-src-mq3-format-unzip-ml-519270439"></a>
### unzlocal_getByte

```ml
function unzlocal_getByte(data, offset)
```

Compute unzlocal get byte in format.unzip; the normal completion returns `[UNZ_OK, data[offset], (offset + 1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L66)

<a id="function-function-mq3-format-unzip-unzlocal-getcurrentfileinfointernal-function-unzlocal-getcurrentfileinfointernal-file-src-mq3-format-unzip-ml-102584230"></a>
### unzlocal_GetCurrentFileInfoInternal

```ml
function unzlocal_GetCurrentFileInfoInternal(file)
```

Compute unzlocal get current file info internal in format.unzip; the normal completion returns `fileInfo(entry)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Handle passed as `handle` to `mq3.format.unzip.currentEntry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L136)

<a id="function-function-mq3-format-unzip-unzlocal-getlong-function-unzlocal-getlong-data-offset-src-mq3-format-unzip-ml-1541038215"></a>
### unzlocal_getLong

```ml
function unzlocal_getLong(data, offset)
```

Provide the unzlocal get long lookup table in format.unzip.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L74)

<a id="function-function-mq3-format-unzip-unzlocal-getshort-function-unzlocal-getshort-data-offset-src-mq3-format-unzip-ml-1886301909"></a>
### unzlocal_getShort

```ml
function unzlocal_getShort(data, offset)
```

Compute unzlocal get short in format.unzip; the normal completion returns `[UNZ_OK, (data[offset] | (data[(offset + 1)] << 8)), (offset + 2)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L70)

<a id="function-function-mq3-format-unzip-unzlocal-searchcentraldir-function-unzlocal-searchcentraldir-data-src-mq3-format-unzip-ml-240319252"></a>
### unzlocal_SearchCentralDir

```ml
function unzlocal_SearchCentralDir(data)
```

Compute unzlocal search central dir in format.unzip; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `typeof(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L78)

<a id="function-function-mq3-format-unzip-unzlocatefile-function-unzlocatefile-file-name-casesensitivity-src-mq3-format-unzip-ml-982736206"></a>
### unzLocateFile

```ml
function unzLocateFile(file, name, caseSensitivity)
```

Update `file.current`, `file.currentOk`, `file.readData` in format.unzip; the normal completion returns `UNZ_END_OF_LIST_OF_FILE`.

Direct state writes: `file.current`, `file.currentOk`, `file.readData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `current`, `currentOk`, `archive`. Updated in place: `current`, `currentOk`, `readData`. |
| `name` | `dynamic` | — | Right passed as `right` to `mq3.format.unzip.unzStringFileNameCompare`. |
| `caseSensitivity` | `dynamic` | — | Case sensitivity passed as `caseSensitivity` to `mq3.format.unzip.unzStringFileNameCompare`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L182)

<a id="function-function-mq3-format-unzip-unzopen-function-unzopen-path-src-mq3-format-unzip-ml-1687224909"></a>
### unzOpen

```ml
function unzOpen(path)
```

Compute unz open in format.unzip; the normal completion returns `Handle(archive, - 1, false, void, 0, void, false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.format.pk3.open`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L109)

<a id="function-function-mq3-format-unzip-unzopencurrentfile-function-unzopencurrentfile-file-src-mq3-format-unzip-ml-712009432"></a>
### unzOpenCurrentFile

```ml
function unzOpenCurrentFile(file)
```

Update `file.readData`, `file.readPosition`, `file.localExtra` in format.unzip; the normal completion returns `UNZ_OK`.

Direct state writes: `file.readData`, `file.readPosition`, `file.localExtra`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. Updated in place: `readData`, `readPosition`, `localExtra`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L202)

<a id="function-function-mq3-format-unzip-unzreadcurrentfile-function-unzreadcurrentfile-file-length-src-mq3-format-unzip-ml-988488292"></a>
### unzReadCurrentFile

```ml
function unzReadCurrentFile(file, length)
```

Update `file.readPosition` in format.unzip; the normal completion returns `result`.

Direct state writes: `file.readPosition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `readData`, `readPosition`. Updated in place: `readPosition`. |
| `length` | `dynamic` | — | Length used in `(length < 0)` and `(length > remaining)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L213)

<a id="function-function-mq3-format-unzip-unzreopen-function-unzreopen-path-file-src-mq3-format-unzip-ml-2035372257"></a>
### unzReOpen

```ml
function unzReOpen(path, file)
```

Compute unz re open in format.unzip; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.format.unzip.unzOpen`. |
| `file` | `dynamic` | — | Record exposing `currentOk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L116)

<a id="function-function-mq3-format-unzip-unzsetcurrentfileinfoposition-function-unzsetcurrentfileinfoposition-file-position-src-mq3-format-unzip-ml-663201635"></a>
### unzSetCurrentFileInfoPosition

```ml
function unzSetCurrentFileInfoPosition(file, position)
```

Update `file.current`, `file.currentOk`, `file.readData` in format.unzip; the normal completion returns `UNZ_OK`.

Direct state writes: `file.current`, `file.currentOk`, `file.readData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `archive`. Updated in place: `current`, `currentOk`, `readData`. |
| `position` | `dynamic` | — | Position used in `((file.archive.entries[index].centralOffset - file.archive.byteBeforeZip) == position)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L169)

<a id="function-function-mq3-format-unzip-unzstringfilenamecompare-function-unzstringfilenamecompare-left-right-casesensitivity-src-mq3-format-unzip-ml-1240243270"></a>
### unzStringFileNameCompare

```ml
function unzStringFileNameCompare(left, right, caseSensitivity)
```

Compute unz string file name compare in format.unzip; the normal completion returns `compareBytes(left, right, (caseSensitivity != UNZ_CASESENSITIVE))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left passed as `left` to `mq3.format.unzip.compareBytes`. |
| `right` | `dynamic` | — | Right passed as `right` to `mq3.format.unzip.compareBytes`. |
| `caseSensitivity` | `dynamic` | — | Case sensitivity used in `(caseSensitivity == UNZ_OSDEFAULTCASE)` and `(caseSensitivity != UNZ_CASESENSITIVE)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L58)

<a id="function-function-mq3-format-unzip-unztell-function-unztell-file-src-mq3-format-unzip-ml-703394592"></a>
### unztell

```ml
function unztell(file)
```

Compute unztell in format.unzip; the normal completion returns `file.readPosition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | Record exposing `readData`, `readPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L220)

<a id="function-function-mq3-format-unzip-valid-function-valid-handle-src-mq3-format-unzip-ml-119803860"></a>
### valid

```ml
function valid(handle)
```

Compute format.unzip.valid as `((handle != void) and not handle.closed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Record exposing `closed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L102)

<a id="constant-constant-mq3-format-unzip-z-buf-error-const-z-buf-error-5-src-mq3-format-unzip-ml-1663020483"></a>
### Z_BUF_ERROR

```ml
const Z_BUF_ERROR = -5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L23)

<a id="constant-constant-mq3-format-unzip-z-data-error-const-z-data-error-3-src-mq3-format-unzip-ml-1377534267"></a>
### Z_DATA_ERROR

```ml
const Z_DATA_ERROR = -3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L22)

<a id="constant-constant-mq3-format-unzip-z-ok-const-z-ok-0-src-mq3-format-unzip-ml-372593419"></a>
### Z_OK

```ml
const Z_OK = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L19)

<a id="constant-constant-mq3-format-unzip-z-stream-end-const-z-stream-end-1-src-mq3-format-unzip-ml-163605012"></a>
### Z_STREAM_END

```ml
const Z_STREAM_END = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L20)

<a id="constant-constant-mq3-format-unzip-z-stream-error-const-z-stream-error-2-src-mq3-format-unzip-ml-2107781852"></a>
### Z_STREAM_ERROR

```ml
const Z_STREAM_ERROR = -2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L21)

<a id="function-function-mq3-format-unzip-zcalloc-function-zcalloc-opaque-items-size-src-mq3-format-unzip-ml-1281487880"></a>
### zcalloc

```ml
function zcalloc(opaque, items, size)
```

Compute zcalloc in format.unzip; the normal completion returns `bytes((items * size), 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opaque` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `items` | `dynamic` | — | Items used in `(items < 0)` and `(items * size)`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(items * size)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L337)

<a id="function-function-mq3-format-unzip-zcfree-function-zcfree-opaque-value-src-mq3-format-unzip-ml-2081970428"></a>
### zcfree

```ml
function zcfree(opaque, value)
```

Compute format.unzip.zcfree as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opaque` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `value` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L341)
