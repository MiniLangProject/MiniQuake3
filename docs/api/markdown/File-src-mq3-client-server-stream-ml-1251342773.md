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

Evaluates server stream `at` and returns `void`, `snapshot` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Record read through `stream.epoch`. |
| `number` | `dynamic` | — | Value tested by `number<0 or number>epoch.snap.messageNum or epoch.snap.messageNum-number>=snapshots.PACKET_BACKUP`, `not snapshot.valid or snapshot.messageNum!=number` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L41)

<a id="function-function-mq3-client-server-stream-attach-function-attach-protocol-demoplaying-src-mq3-client-server-stream-ml-2094686689"></a>
### attach

```ml
function attach(protocol, demoPlaying)
```

Calls `mq3.compat.textnumbers.atoi`, `mq3.shared.info.value`, `mq3.client.gamestate.configString` and additional helpers from server stream `attach`. The final path returns `Stream(protocol,protocol.dispatcher.snapshotState,demoPlaying,pure)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `protocol` | `dynamic` | — | Record read through `protocol.gamestateState`, `protocol.dispatcher.snapshotState`. |
| `demoPlaying` | `dynamic` | — | Value used by `pure=not demoPlaying and streamNumbers.atoi(info.value(gamestate.configString(protocol.gamestateState,1),"sv_pure"))!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L33)

<a id="function-function-mq3-client-server-stream-entity-function-entity-stream-snapshot-index-src-mq3-client-server-stream-ml-1693470456"></a>
### entity

```ml
function entity(stream, snapshot, index)
```

Adapts `mq3.client.snapshot_parse.parsedEntity` to server stream `entity`, returning its result for `stream.epoch.entityState, snapshot.parseEntitiesNum+index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Record read through `stream.epoch.entityState`. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.parseEntitiesNum`. |
| `index` | `dynamic` | — | Argument 2 of `mq3.client.snapshot_parse.parsedEntity`; passed as `snapshot.parseEntitiesNum+index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L54)

<a id="function-function-mq3-client-server-stream-mapname-function-mapname-protocol-src-mq3-client-server-stream-ml-973920736"></a>
### mapName

```ml
function mapName(protocol)
```

Adapts `mq3.shared.info.value` to server stream `mapName`, returning its result for `gamestate.configString(protocol.gamestateState,0), "mapname"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `protocol` | `dynamic` | — | Record read through `protocol.gamestateState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L26)

<a id="function-function-mq3-client-server-stream-ready-function-ready-protocol-src-mq3-client-server-stream-ml-1751139900"></a>
### ready

```ml
function ready(protocol)
```

Evaluates server stream `ready` and returns `false`, `snap.valid and (snap.snapFlags&SNAPFLAG_NOT_ACTIVE)==0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `protocol` | `dynamic` | — | Record read through `protocol.dispatcher.snapshotState.snap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L18)

<a id="constant-constant-mq3-client-server-stream-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-server-stream-ml-266710153"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L11)

- [mq3.client.server_stream.Stream](Type-mq3-client-server-stream-stream-414087547.md) — struct
