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

Set `data[index]` to `data[index]^((index*119)&255)` in `mq3.botlib.be_aas_file.AAS_DData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `index`. Entries are written in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L116)

<a id="function-function-mq3-botlib-be-aas-file-aas-dumpaasdata-function-aas-dumpaasdata-state-src-mq3-botlib-be-aas-file-ml-1368224655"></a>
### AAS_DumpAASData

```ml
function AAS_DumpAASData(state)
```

Update `state.map`, `state.loaded`, `state.initialized` and `state.saveFile` and related state during `AAS_DumpAASData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `map`, `loaded`, `initialized`, `saveFile` and `bspChecksum` and related fields. May update `state.map`, `state.loaded` and `state.initialized` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L129)

<a id="function-function-mq3-botlib-be-aas-file-aas-fileinfo-function-aas-fileinfo-state-src-mq3-botlib-be-aas-file-ml-954732157"></a>
### AAS_FileInfo

```ml
function AAS_FileInfo(state)
```

Build the `mq3.botlib.be_aas_file.FileInfo` result for `AAS_FileInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L134)

<a id="function-function-mq3-botlib-be-aas-file-aas-loadaasfile-function-aas-loadaasfile-state-filename-expectedchecksum-src-mq3-botlib-be-aas-file-ml-761478881"></a>
### AAS_LoadAASFile

```ml
function AAS_LoadAASFile(state, filename, expectedChecksum)
```

Record or dispatch `"message"` actions in `AAS_LoadAASFile`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `lastError`, `map`, `bspChecksum` and `loaded`. May update `state.lastError`, `state.map` and `state.bspChecksum` and additional fields in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `expectedChecksum` | `dynamic` | — | Value used by `AAS_LoadAASFile` in `if expectedChecksum!=void and map.bspChecksum!=expectedChecksum then state.lastError=BLERR_WRONGAASFILEVERSION`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L160)

<a id="function-function-mq3-botlib-be-aas-file-aas-loadaaslump-function-aas-loadaaslump-data-offset-length-lastoffset-elementsize-src-mq3-botlib-be-aas-file-ml-1908784155"></a>
### AAS_LoadAASLump

```ml
function AAS_LoadAASLump(data, offset, length, lastOffset, elementSize)
```

Build the `mq3.botlib.be_aas_file.LumpLoad` result for `AAS_LoadAASLump`. Return paths include `LumpLoad(slice(data,offset,length),offset+length,offset==lastOffset)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `AAS_LoadAASLump`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `length` | `dynamic` | — | Value passed as argument 3 to `slice`. |
| `lastOffset` | `dynamic` | — | Operand used to evaluate the returned expression `LumpLoad(slice(data,offset,length),offset+length,offset==lastOffset)`. |
| `elementSize` | `dynamic` | — | Value used by `AAS_LoadAASLump` in `if data==void or typeof(data)!="bytes" or offset<0 or length<0 or offset>len(data) or length>len(data)-offset or...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L145)

<a id="function-function-mq3-botlib-be-aas-file-aas-swapaasdata-function-aas-swapaasdata-state-src-mq3-botlib-be-aas-file-ml-1310941085"></a>
### AAS_SwapAASData

```ml
function AAS_SwapAASData(state)
```

Report whether an AAS map is available; parsed MiniLang map records require no in-place byte swapping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L122)

<a id="function-function-mq3-botlib-be-aas-file-aas-writeaasfile-function-aas-writeaasfile-state-filename-src-mq3-botlib-be-aas-file-ml-1636430506"></a>
### AAS_WriteAASFile

```ml
function AAS_WriteAASFile(state, filename)
```

Record or dispatch `"message"` actions in `AAS_WriteAASFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `map`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L193)

<a id="function-function-mq3-botlib-be-aas-file-aas-writeaaslump-function-aas-writeaaslump-output-lumpnum-data-length-src-mq3-botlib-be-aas-file-ml-1023996977"></a>
### AAS_WriteAASLump

```ml
function AAS_WriteAASLump(output, lumpNum, data, length)
```

Set `output.chunks` to `output.chunks+[slice(data,0,length)]` and `output.offset` to `output.offset+length` in `mq3.botlib.be_aas_file.AAS_WriteAASLump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output record; accesses `header`, `offset` and `chunks`. May update `output.chunks` and `output.offset` in place. |
| `lumpNum` | `dynamic` | — | Value used by `AAS_WriteAASLump` in `if output==void or lumpNum<0 or lumpNum>=aas.LUMP_COUNT or data==void or typeof(data)!="bytes" or length<0 or le...`. |
| `data` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `AAS_WriteAASLump`. |
| `length` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L178)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-cannotopenaasfile-const-blerr-cannotopenaasfile-4-src-mq3-botlib-be-aas-file-ml-1816462685"></a>
### BLERR_CANNOTOPENAASFILE

```ml
const BLERR_CANNOTOPENAASFILE = 4
```

Bot-library error indicating that the AAS map file could not be opened.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L13)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-cannotreadaaslump-const-blerr-cannotreadaaslump-7-src-mq3-botlib-be-aas-file-ml-156678616"></a>
### BLERR_CANNOTREADAASLUMP

```ml
const BLERR_CANNOTREADAASLUMP = 7
```

Bot-library error indicating an unreadable or malformed AAS data lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L19)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-be-aas-file-ml-1434188293"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```

Bot-library status indicating successful completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L11)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-wrongaasfileid-const-blerr-wrongaasfileid-5-src-mq3-botlib-be-aas-file-ml-829972274"></a>
### BLERR_WRONGAASFILEID

```ml
const BLERR_WRONGAASFILEID = 5
```

Bot-library error indicating an invalid AAS file signature.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L15)

<a id="constant-constant-mq3-botlib-be-aas-file-blerr-wrongaasfileversion-const-blerr-wrongaasfileversion-6-src-mq3-botlib-be-aas-file-ml-216687459"></a>
### BLERR_WRONGAASFILEVERSION

```ml
const BLERR_WRONGAASFILEVERSION = 6
```

Bot-library error indicating an unsupported or mismatched AAS map version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L17)

<a id="function-function-mq3-botlib-be-aas-file-create-function-create-host-src-mq3-botlib-be-aas-file-ml-1748124952"></a>
### create

```ml
function create(host)
```

Build the `mq3.botlib.be_aas_file.State` result for `create`. Return paths include `State(host,void,false,false,false,0,BLERR_NOERROR)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Initial value stored in `mq3.botlib.be_aas_file.State.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L106)

<a id="function-function-mq3-botlib-be-aas-file-destinationwrite-function-destinationwrite-state-filename-data-src-mq3-botlib-be-aas-file-ml-408558890"></a>
### destinationWrite

```ml
function destinationWrite(state, filename, data)
```

Use `state.services.writeFileFn` to perform `destinationWrite`. Return paths include `fs.writeAllBytes(filename,data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `services`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `data` | `dynamic` | — | Value passed as argument 3 to `state.services.writeFileFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L186)

<a id="function-function-mq3-botlib-be-aas-file-emit-function-emit-state-kind-text-src-mq3-botlib-be-aas-file-ml-1603361362"></a>
### emit

```ml
function emit(state, kind, text)
```

Use `state.services.printFn` to perform `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `services`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.services.printFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L111)

- [mq3.botlib.be_aas_file.FileInfo](Type-mq3-botlib-be-aas-file-fileinfo-1907240344.md) — struct
- [mq3.botlib.be_aas_file.LumpLoad](Type-mq3-botlib-be-aas-file-lumpload-637305452.md) — struct
<a id="function-function-mq3-botlib-be-aas-file-services-function-services-context-src-mq3-botlib-be-aas-file-ml-68743803"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.be_aas_file.Services` record, initializing `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L103)

- [mq3.botlib.be_aas_file.Services](Type-mq3-botlib-be-aas-file-services-822078766.md) — struct
<a id="function-function-mq3-botlib-be-aas-file-sourcebytes-function-sourcebytes-state-filename-src-mq3-botlib-be-aas-file-ml-1558180374"></a>
### sourceBytes

```ml
function sourceBytes(state, filename)
```

Use `state.services.readFileFn` to perform `sourceBytes`. Return paths include `fs.readAllBytes(filename)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS file state; accesses `services`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L152)

- [mq3.botlib.be_aas_file.State](Type-mq3-botlib-be-aas-file-state-1430783399.md) — struct
<a id="function-function-mq3-botlib-be-aas-file-writer-function-writer-checksum-src-mq3-botlib-be-aas-file-ml-1672385499"></a>
### writer

```ml
function writer(checksum)
```

Build the `mq3.botlib.be_aas_file.Writer` result for `writer`. Return paths include `Writer(header,[],aas.HEADER_SIZE)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `checksum` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L172)

- [mq3.botlib.be_aas_file.Writer](Type-mq3-botlib-be-aas-file-writer-1952675629.md) — struct
