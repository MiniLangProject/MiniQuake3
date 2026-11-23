# `src/mq3/client/server_stream.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.server_stream`](Package-mq3-client-server-stream-236718543.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/snapshot_command.ml` as `snapshots` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/client/snapshot_parse.ml` as `entities` → [src/mq3/client/snapshot_parse.ml](File-src-mq3-client-snapshot-parse-ml-455311349.md)
- `mq3/compat/textnumbers.ml` as `streamNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-client-server-stream-at-function-at-stream-number-src-mq3-client-server-stream-ml-919476185"></a>
### at

```ml
function at(stream, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_stream.ml#L30)

<a id="function-function-mq3-client-server-stream-attach-function-attach-protocol-demoplaying-src-mq3-client-server-stream-ml-2094686689"></a>
### attach

```ml
function attach(protocol, demoPlaying)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `protocol` | `dynamic` | — |  |
| `demoPlaying` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_stream.ml#L25)

<a id="function-function-mq3-client-server-stream-entity-function-entity-stream-snapshot-index-src-mq3-client-server-stream-ml-1693470456"></a>
### entity

```ml
function entity(stream, snapshot, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_stream.ml#L39)

<a id="function-function-mq3-client-server-stream-mapname-function-mapname-protocol-src-mq3-client-server-stream-ml-973920736"></a>
### mapName

```ml
function mapName(protocol)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `protocol` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_stream.ml#L21)

<a id="function-function-mq3-client-server-stream-ready-function-ready-protocol-src-mq3-client-server-stream-ml-1751139900"></a>
### ready

```ml
function ready(protocol)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `protocol` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_stream.ml#L15)

<a id="constant-constant-mq3-client-server-stream-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-server-stream-ml-266710153"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_stream.ml#L11)

- [mq3.client.server_stream.Stream](Type-mq3-client-server-stream-stream-414087547.md) — struct
