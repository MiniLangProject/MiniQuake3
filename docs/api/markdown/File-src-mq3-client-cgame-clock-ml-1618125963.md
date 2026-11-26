# `src/mq3/client/cgame_clock.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_clock`](Package-mq3-client-cgame-clock-597085021.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cgame_time.ml` as `timing` → [src/mq3/client/cgame_time.ml](File-src-mq3-client-cgame-time-ml-148018170.md)

## Declarations

- [mq3.client.cgame_clock.Clock](Type-mq3-client-cgame-clock-clock-68915929.md) — struct
<a id="function-function-mq3-client-cgame-clock-create-function-create-realtime-snapshotnumber-snapshotservertime-src-mq3-client-cgame-clock-ml-717110928"></a>
### create

```ml
function create(realtime, snapshotNumber, snapshotServerTime)
```

Calls `mq3.client.cgame_time.create`, `mq3.client.cgame_time.services`, `mq3.client.cgame_clock.Clock` from client game clock `create`. The final path returns `Clock(state,snapshotNumber)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `snapshotNumber` | `dynamic` | — | Value used by `if realtime<0 or snapshotNumber<0 or snapshotServerTime<0 then return fail("negative initial time or sequence") end if`. |
| `snapshotServerTime` | `dynamic` | — | Value assigned to `state.snapServerTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L34)

<a id="function-function-mq3-client-cgame-clock-fail-function-fail-message-src-mq3-client-cgame-clock-ml-1249441597"></a>
### fail

```ml
function fail(message)
```

Creates the client game clock error `7691` with diagnostic text `"cgame clock: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"cgame clock: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L28)

<a id="function-function-mq3-client-cgame-clock-frame-function-frame-clock-realtime-src-mq3-client-cgame-clock-ml-1929941099"></a>
### frame

```ml
function frame(clock, realtime)
```

Updates `clock.state.realtime` during client game clock `frame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — | Mutable client game clock record/storage; this routine assigns `clock.state.realtime`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L83)

- [mq3.client.cgame_clock.FrameTime](Type-mq3-client-cgame-clock-frametime-890492891.md) — struct
<a id="function-function-mq3-client-cgame-clock-publishsnapshot-function-publishsnapshot-clock-snapshotnumber-servertime-snapflags-src-mq3-client-cgame-clock-ml-900447888"></a>
### publishSnapshot

```ml
function publishSnapshot(clock, snapshotNumber, serverTime, snapFlags)
```

Updates `clock.snapshotNumber`, `clock.state.snapServerTime`, `clock.state.snapFlags`, `clock.state.snapValid` and additional values during client game clock `publishSnapshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — | Mutable client game clock record/storage; this routine assigns `clock.snapshotNumber`, `clock.state.snapServerTime`, `clock.state.snapFlags`, `clock.state.snapValid` and additional values. |
| `snapshotNumber` | `dynamic` | — | Value assigned to `clock.snapshotNumber`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `snapFlags` | `dynamic` | — | Snapshot flags controlling validity, interpolation and server restarts. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L48)

<a id="function-function-mq3-client-cgame-clock-setpaused-function-setpaused-clock-serverpaused-clientpaused-serverrunning-src-mq3-client-cgame-clock-ml-1490183122"></a>
### setPaused

```ml
function setPaused(clock, serverPaused, clientPaused, serverRunning)
```

Updates `clock.state.serverPaused`, `clock.state.clientPaused`, `clock.state.serverRunning` during client game clock `setPaused`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — | Mutable client game clock record/storage; this routine assigns `clock.state.serverPaused`, `clock.state.clientPaused`, `clock.state.serverRunning`. |
| `serverPaused` | `dynamic` | — | Value assigned to `clock.state.serverPaused`. |
| `clientPaused` | `dynamic` | — | Value assigned to `clock.state.clientPaused`. |
| `serverRunning` | `dynamic` | — | Value assigned to `clock.state.serverRunning`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L74)

<a id="function-function-mq3-client-cgame-clock-settimenudge-function-settimenudge-clock-value-src-mq3-client-cgame-clock-ml-1306256899"></a>
### setTimeNudge

```ml
function setTimeNudge(clock, value)
```

Updates `clock.state.timeNudge` during client game clock `setTimeNudge`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — | Mutable client game clock record/storage; this routine assigns `clock.state.timeNudge`. |
| `value` | `dynamic` | — | Value assigned to `clock.state.timeNudge`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L64)
