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
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-demo-playback-advance-function-advance-playback-servertime-realtime-src-mq3-client-demo-playback-ml-2124477412"></a>
### advance

```ml
function advance(playback, serverTime, realtime)
```

Read ahead through the next snapshot for Cgame interpolation. After a new gamestate, stop at its first active snapshot so Cgame can initialize again.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L152)

<a id="function-function-mq3-client-demo-playback-close-function-close-playback-src-mq3-client-demo-playback-ml-746511457"></a>
### close

```ml
function close(playback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L46)

<a id="constant-constant-mq3-client-demo-playback-extension-const-extension-dm-68-src-mq3-client-demo-playback-ml-1433796997"></a>
### EXTENSION

```ml
const EXTENSION = ".dm_68"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L15)

<a id="function-function-mq3-client-demo-playback-fail-function-fail-reason-src-mq3-client-demo-playback-ml-1532683722"></a>
### fail

```ml
function fail(reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L33)

<a id="function-function-mq3-client-demo-playback-filename-function-filename-name-src-mq3-client-demo-playback-ml-1681053007"></a>
### filename

```ml
function filename(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L35)

<a id="function-function-mq3-client-demo-playback-loosepath-function-loosepath-dataroot-leaf-src-mq3-client-demo-playback-ml-1884418428"></a>
### loosePath

```ml
function loosePath(dataRoot, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L98)

<a id="constant-constant-mq3-client-demo-playback-max-archived-demo-const-max-archived-demo-64-1024-1024-src-mq3-client-demo-playback-ml-1106556961"></a>
### MAX_ARCHIVED_DEMO

```ml
const MAX_ARCHIVED_DEMO = 64 * 1024 * 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L16)

<a id="constant-constant-mq3-client-demo-playback-max-frame-packets-const-max-frame-packets-128-src-mq3-client-demo-playback-ml-171243888"></a>
### MAX_FRAME_PACKETS

```ml
const MAX_FRAME_PACKETS = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L18)

<a id="constant-constant-mq3-client-demo-playback-max-start-packets-const-max-start-packets-1024-src-mq3-client-demo-playback-ml-1203934450"></a>
### MAX_START_PACKETS

```ml
const MAX_START_PACKETS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L17)

<a id="function-function-mq3-client-demo-playback-open-function-open-dataroot-archive-name-now-src-mq3-client-demo-playback-ml-2048008955"></a>
### open

```ml
function open(dataRoot, archive, name, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L105)

- [mq3.client.demo_playback.Playback](Type-mq3-client-demo-playback-playback-467060537.md) — struct
<a id="function-function-mq3-client-demo-playback-read-function-read-playback-output-count-src-mq3-client-demo-playback-ml-1355431987"></a>
### read

```ml
function read(playback, output, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L54)

<a id="function-function-mq3-client-demo-playback-readpacket-function-readpacket-playback-realtime-src-mq3-client-demo-playback-ml-859177242"></a>
### readPacket

```ml
function readPacket(playback, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L68)

<a id="function-function-mq3-client-demo-playback-updatemap-function-updatemap-playback-src-mq3-client-demo-playback-ml-965245155"></a>
### updateMap

```ml
function updateMap(playback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L90)
