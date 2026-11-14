# `src/mq3/botlib/be_aas_file.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_aas_file`](Package-mq3-botlib-be-aas-file-132227992.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-be-aas-file-aas-ddata-function-aas-ddata-data-size-src-mq3-botlib-be-aas-file-ml-115772229"></a>
### AAS_DData

```ml
function AAS_DData(data, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L26)

<a id="function-function-mq3-botlib-be-aas-file-aas-dumpaasdata-function-aas-dumpaasdata-state-src-mq3-botlib-be-aas-file-ml-1368224655"></a>
### AAS_DumpAASData

```ml
function AAS_DumpAASData(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L35)

<a id="function-function-mq3-botlib-be-aas-file-aas-fileinfo-function-aas-fileinfo-state-src-mq3-botlib-be-aas-file-ml-954732157"></a>
### AAS_FileInfo

```ml
function AAS_FileInfo(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L38)

<a id="function-function-mq3-botlib-be-aas-file-aas-loadaasfile-function-aas-loadaasfile-state-filename-expectedchecksum-src-mq3-botlib-be-aas-file-ml-761478881"></a>
### AAS_LoadAASFile

```ml
function AAS_LoadAASFile(state, filename, expectedChecksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `expectedChecksum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L51)

<a id="function-function-mq3-botlib-be-aas-file-aas-loadaaslump-function-aas-loadaaslump-data-offset-length-lastoffset-elementsize-src-mq3-botlib-be-aas-file-ml-1908784155"></a>
### AAS_LoadAASLump

```ml
function AAS_LoadAASLump(data, offset, length, lastOffset, elementSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `lastOffset` | `dynamic` | — |  |
| `elementSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L43)

<a id="function-function-mq3-botlib-be-aas-file-aas-swapaasdata-function-aas-swapaasdata-state-src-mq3-botlib-be-aas-file-ml-1310941085"></a>
### AAS_SwapAASData

```ml
function AAS_SwapAASData(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L30)

<a id="function-function-mq3-botlib-be-aas-file-aas-writeaasfile-function-aas-writeaasfile-state-filename-src-mq3-botlib-be-aas-file-ml-1636430506"></a>
### AAS_WriteAASFile

```ml
function AAS_WriteAASFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L70)

<a id="function-function-mq3-botlib-be-aas-file-aas-writeaaslump-function-aas-writeaaslump-output-lumpnum-data-length-src-mq3-botlib-be-aas-file-ml-1023996977"></a>
### AAS_WriteAASLump

```ml
function AAS_WriteAASLump(output, lumpNum, data, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `lumpNum` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L62)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-cannotopenaasfile-const-blerr-cannotopenaasfile-4-src-mq3-botlib-be-aas-file-ml-1816462685"></a>
### BLERR_CANNOTOPENAASFILE

```ml
const BLERR_CANNOTOPENAASFILE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L11)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-cannotreadaaslump-const-blerr-cannotreadaaslump-7-src-mq3-botlib-be-aas-file-ml-156678616"></a>
### BLERR_CANNOTREADAASLUMP

```ml
const BLERR_CANNOTREADAASLUMP = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L14)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-be-aas-file-ml-1434188293"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L10)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-wrongaasfileid-const-blerr-wrongaasfileid-5-src-mq3-botlib-be-aas-file-ml-829972274"></a>
### BLERR_WRONGAASFILEID

```ml
const BLERR_WRONGAASFILEID = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L12)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-wrongaasfileversion-const-blerr-wrongaasfileversion-6-src-mq3-botlib-be-aas-file-ml-216687459"></a>
### BLERR_WRONGAASFILEVERSION

```ml
const BLERR_WRONGAASFILEVERSION = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L13)

<a id="function-function-mq3-botlib-be-aas-file-create-function-create-host-src-mq3-botlib-be-aas-file-ml-1748124952"></a>
### create

```ml
function create(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L23)

<a id="function-function-mq3-botlib-be-aas-file-destinationwrite-function-destinationwrite-state-filename-data-src-mq3-botlib-be-aas-file-ml-408558890"></a>
### destinationWrite

```ml
function destinationWrite(state, filename, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L66)

<a id="function-function-mq3-botlib-be-aas-file-emit-function-emit-state-kind-text-src-mq3-botlib-be-aas-file-ml-1603361362"></a>
### emit

```ml
function emit(state, kind, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L24)

- [mq3.botlib.be_aas_file.FileInfo](Type-mq3-botlib-be-aas-file-fileinfo-1907240344.md) — struct
- [mq3.botlib.be_aas_file.LumpLoad](Type-mq3-botlib-be-aas-file-lumpload-637305452.md) — struct
<a id="function-function-mq3-botlib-be-aas-file-services-function-services-context-src-mq3-botlib-be-aas-file-ml-68743803"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L22)

- [mq3.botlib.be_aas_file.Services](Type-mq3-botlib-be-aas-file-services-822078766.md) — struct
<a id="function-function-mq3-botlib-be-aas-file-sourcebytes-function-sourcebytes-state-filename-src-mq3-botlib-be-aas-file-ml-1558180374"></a>
### sourceBytes

```ml
function sourceBytes(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L47)

- [mq3.botlib.be_aas_file.State](Type-mq3-botlib-be-aas-file-state-1430783399.md) — struct
<a id="function-function-mq3-botlib-be-aas-file-writer-function-writer-checksum-src-mq3-botlib-be-aas-file-ml-1672385499"></a>
### writer

```ml
function writer(checksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `checksum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L61)

- [mq3.botlib.be_aas_file.Writer](Type-mq3-botlib-be-aas-file-writer-1952675629.md) — struct
