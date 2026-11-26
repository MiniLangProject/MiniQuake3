# `src/mq3/client/demo_playback.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.demo_playback`](Package-mq3-client-demo-playback-600319222.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/demo.ml` as `demo` → [src/mq3/client/demo.ml](File-src-mq3-client-demo-ml-1236155596.md)
- `mq3/client/protocol_runtime.ml` as `protocolRuntime` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/client/server_stream.ml` as `serverStream` → [src/mq3/client/server_stream.ml](File-src-mq3-client-server-stream-ml-1251342773.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/file.ml` as `file` → [src/mq3/platform/file.ml](File-src-mq3-platform-file-ml-722016459.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `std/fs.ml` as `fs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-demo-playback-advance-function-advance-playback-servertime-realtime-src-mq3-client-demo-playback-ml-2124477412"></a>
### advance

```ml
function advance(playback, serverTime, realtime)
```

Read ahead through the next snapshot for Cgame interpolation. After a new gamestate, stop at its first active snapshot so Cgame can initialize again.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — | Record read through `playback.completed`, `playback.protocol.dispatcher.snapshotState`, `playback.protocol`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L202)

<a id="function-function-mq3-client-demo-playback-close-function-close-playback-src-mq3-client-demo-playback-ml-746511457"></a>
### close

```ml
function close(playback)
```

Updates `playback.handle`, `playback.archiveData`, `playback.completed` during demo playback `close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — | Mutable demo playback record/storage; this routine assigns `playback.handle`, `playback.archiveData`, `playback.completed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L76)

<a id="constant-constant-mq3-client-demo-playback-extension-const-extension-dm-68-src-mq3-client-demo-playback-ml-1433796997"></a>
### EXTENSION

```ml
const EXTENSION = ".dm_68"
```

Filename suffix used for demos encoded with this client's network protocol version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L16)

<a id="function-function-mq3-client-demo-playback-fail-function-fail-reason-src-mq3-client-demo-playback-ml-1532683722"></a>
### fail

```ml
function fail(reason)
```

Creates the demo playback error `6928` with diagnostic text `"demo playback: "+reason`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reason` | `dynamic` | — | Argument 2 of `error`; passed as `"demo playback: "+reason`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L59)

<a id="function-function-mq3-client-demo-playback-filename-function-filename-name-src-mq3-client-demo-playback-ml-1681053007"></a>
### filename

```ml
function filename(name)
```

Calls `std.string.toLowerAscii`, `std.string.endsWith` from demo playback `filename`. The final path returns `name+EXTENSION`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding demo playback resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L63)

<a id="function-function-mq3-client-demo-playback-loosepath-function-loosepath-dataroot-leaf-src-mq3-client-demo-playback-ml-1884418428"></a>
### loosePath

```ml
function loosePath(dataRoot, leaf)
```

Calls `std.fs.joinPath`, `std.fs.isFile` from demo playback `loosePath`. The final path returns `path`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — | Value used by `if dataRoot=="" then return "" end if`. |
| `leaf` | `dynamic` | — | Value used by `path=fs.joinPath(fs.joinPath(dataRoot,"demos"),leaf)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L140)

<a id="constant-constant-mq3-client-demo-playback-max-archived-demo-const-max-archived-demo-64-1024-1024-src-mq3-client-demo-playback-ml-1106556961"></a>
### MAX_ARCHIVED_DEMO

```ml
const MAX_ARCHIVED_DEMO = 64 * 1024 * 1024
```

Capacity limit for the archived demo collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L18)

<a id="constant-constant-mq3-client-demo-playback-max-frame-packets-const-max-frame-packets-128-src-mq3-client-demo-playback-ml-171243888"></a>
### MAX_FRAME_PACKETS

```ml
const MAX_FRAME_PACKETS = 128
```

Capacity limit for the frame packets collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L22)

<a id="constant-constant-mq3-client-demo-playback-max-start-packets-const-max-start-packets-1024-src-mq3-client-demo-playback-ml-1203934450"></a>
### MAX_START_PACKETS

```ml
const MAX_START_PACKETS = 1024
```

Capacity limit for the start packets collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L20)

<a id="function-function-mq3-client-demo-playback-open-function-open-dataroot-archive-name-now-src-mq3-client-demo-playback-ml-2048008955"></a>
### open

```ml
function open(dataRoot, archive, name, now)
```

Calls `mq3.client.demo_playback.filename`, `mq3.format.pk3.findEntry`, `mq3.client.demo_playback.loosePath` and additional helpers from demo playback `open`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — | Value used by `mounted=archive!=void and archive.modArchive!=void and dataRoot!=""`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Record read through `archive.modArchive`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding demo playback resource. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L152)

- [mq3.client.demo_playback.Playback](Type-mq3-client-demo-playback-playback-467060537.md) — struct
<a id="function-function-mq3-client-demo-playback-read-function-read-playback-output-count-src-mq3-client-demo-playback-ml-1355431987"></a>
### read

```ml
function read(playback, output, count)
```

Updates `playback.offset` during demo playback `read`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — | Mutable demo playback record/storage; this routine assigns `playback.offset`. |
| `output` | `dynamic` | — | Value used by `if not file.ReadFile(playback.handle,nativeBytesPtr(output),count,playback.transferred,0) then return fail("could not read demo data") end if`. |
| `count` | `dynamic` | — | Value tested by `not file.ReadFile(playback.handle,nativeBytesPtr(output),count,playback.transferred,0)`, `count>available` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L88)

<a id="function-function-mq3-client-demo-playback-readpacket-function-readpacket-playback-realtime-src-mq3-client-demo-playback-ml-859177242"></a>
### readPacket

```ml
function readPacket(playback, realtime)
```

Updates `playback.msg.cursize` during demo playback `readPacket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — | Mutable demo playback record/storage; this routine assigns `playback.msg.cursize`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L105)

<a id="function-function-mq3-client-demo-playback-updatemap-function-updatemap-playback-src-mq3-client-demo-playback-ml-965245155"></a>
### updateMap

```ml
function updateMap(playback)
```

Updates `playback.mapName` during demo playback `updateMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — | Mutable demo playback record/storage; this routine assigns `playback.mapName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo_playback.ml#L129)
