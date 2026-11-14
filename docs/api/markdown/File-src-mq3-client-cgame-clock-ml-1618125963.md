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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `realtime` | `dynamic` | — |  |
| `snapshotNumber` | `dynamic` | — |  |
| `snapshotServerTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L13)

<a id="function-function-mq3-client-cgame-clock-fail-function-fail-message-src-mq3-client-cgame-clock-ml-1249441597"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L11)

<a id="function-function-mq3-client-cgame-clock-frame-function-frame-clock-realtime-src-mq3-client-cgame-clock-ml-1929941099"></a>
### frame

```ml
function frame(clock, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L46)

- [mq3.client.cgame_clock.FrameTime](Type-mq3-client-cgame-clock-frametime-890492891.md) — struct
<a id="function-function-mq3-client-cgame-clock-publishsnapshot-function-publishsnapshot-clock-snapshotnumber-servertime-snapflags-src-mq3-client-cgame-clock-ml-900447888"></a>
### publishSnapshot

```ml
function publishSnapshot(clock, snapshotNumber, serverTime, snapFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — |  |
| `snapshotNumber` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `snapFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L22)

<a id="function-function-mq3-client-cgame-clock-setpaused-function-setpaused-clock-serverpaused-clientpaused-serverrunning-src-mq3-client-cgame-clock-ml-1490183122"></a>
### setPaused

```ml
function setPaused(clock, serverPaused, clientPaused, serverRunning)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — |  |
| `serverPaused` | `dynamic` | — |  |
| `clientPaused` | `dynamic` | — |  |
| `serverRunning` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L40)

<a id="function-function-mq3-client-cgame-clock-settimenudge-function-settimenudge-clock-value-src-mq3-client-cgame-clock-ml-1306256899"></a>
### setTimeNudge

```ml
function setTimeNudge(clock, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L35)
