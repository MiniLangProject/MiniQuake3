# `src/mq3/client/cgame_time.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_time`](Package-mq3-client-cgame-time-1495560164.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-cgame-time-adjusttimedelta-function-adjusttimedelta-state-src-mq3-client-cgame-time-ml-90323261"></a>
### adjustTimeDelta

```ml
function adjustTimeDelta(state)
```

Updates `state.newSnapshots`, `state.serverTimeDelta`, `state.oldServerTime`, `state.serverTime` and additional values during client game time `adjustTimeDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game time record/storage; this routine assigns `state.newSnapshots`, `state.serverTimeDelta`, `state.oldServerTime`, `state.serverTime` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L120)

<a id="constant-constant-mq3-client-cgame-time-ca-active-const-ca-active-8-src-mq3-client-cgame-time-ml-931776693"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```

Connection-state value for normal gameplay after game-state loading, defined for advancing the active game's server clock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L14)

<a id="constant-constant-mq3-client-cgame-time-ca-primed-const-ca-primed-7-src-mq3-client-cgame-time-ml-1629105190"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```

Client connection state with game state loaded, awaiting a playable snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L11)

<a id="function-function-mq3-client-cgame-time-create-function-create-host-src-mq3-client-cgame-time-ml-273072422"></a>
### create

```ml
function create(host)
```

Calls `mq3.client.cgame_time.services`, `mq3.client.cgame_time.State` from client game time `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | host record passed to the client game time helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L109)

<a id="function-function-mq3-client-cgame-time-diagnostic-function-diagnostic-state-text-src-mq3-client-cgame-time-ml-1953681166"></a>
### diagnostic

```ml
function diagnostic(state, text)
```

Calls `host.diagnosticFn` from client game time `diagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host`. |
| `text` | `dynamic` | — | Text consumed or emitted by `diagnostic` in the client game time path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L116)

<a id="function-function-mq3-client-cgame-time-firstsnapshot-function-firstsnapshot-state-src-mq3-client-cgame-time-ml-1913125085"></a>
### firstSnapshot

```ml
function firstSnapshot(state)
```

Updates `state.connectionState`, `state.serverTimeDelta`, `state.oldServerTime`, `state.timeDemoBaseTime` and additional values during client game time `firstSnapshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game time record/storage; this routine assigns `state.connectionState`, `state.serverTimeDelta`, `state.oldServerTime`, `state.timeDemoBaseTime` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L137)

<a id="function-function-mq3-client-cgame-time-readdemo-function-readdemo-state-src-mq3-client-cgame-time-ml-1179549317"></a>
### readDemo

```ml
function readDemo(state)
```

Calls `host.readDemoFn` from client game time `readDemo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L152)

<a id="constant-constant-mq3-client-cgame-time-reset-time-const-reset-time-500-src-mq3-client-cgame-time-ml-1439934160"></a>
### RESET_TIME

```ml
const RESET_TIME = 500
```

Server-time delta error threshold, in milliseconds, that triggers a hard clock correction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L7)

<a id="function-function-mq3-client-cgame-time-services-function-services-src-mq3-client-cgame-time-ml-206661184"></a>
### services

```ml
function services()
```

Creates a `mq3.client.cgame_time.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L106)

- [mq3.client.cgame_time.Services](Type-mq3-client-cgame-time-services-52855922.md) — struct
<a id="function-function-mq3-client-cgame-time-setcgametime-function-setcgametime-state-src-mq3-client-cgame-time-ml-952885589"></a>
### setCGameTime

```ml
function setCGameTime(state)
```

Updates `state.firstDemoFrameSkipped`, `state.newSnapshots`, `state.oldFrameServerTime`, `state.serverTime` and additional values during client game time `setCGameTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game time record/storage; this routine assigns `state.firstDemoFrameSkipped`, `state.newSnapshots`, `state.oldFrameServerTime`, `state.serverTime` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L159)

<a id="constant-constant-mq3-client-cgame-time-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-cgame-time-ml-1549150167"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```

Snapshot flag indicating that the server state is not yet active for normal gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L9)

- [mq3.client.cgame_time.State](Type-mq3-client-cgame-time-state-441770339.md) — struct
