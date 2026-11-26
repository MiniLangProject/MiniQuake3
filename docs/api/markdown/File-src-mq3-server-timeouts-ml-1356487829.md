# `src/mq3/server/timeouts.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.timeouts`](Package-mq3-server-timeouts-811864941.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-server-timeouts-check-function-check-state-host-src-mq3-server-timeouts-ml-1909283519"></a>
### check

```ml
function check(state, host)
```

Check timeouts in server.timeouts.

Validation failures include `server timeouts: missing state`; `server timeouts: invalid client count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `clients`, `maxClients`, `time`, `timeoutSeconds`, `zombieSeconds`. |
| `host` | `dynamic` | — | Record exposing `diagnosticFn`, `dropFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L71)

<a id="function-function-mq3-server-timeouts-client-function-client-state-lastpackettime-timeoutcount-src-mq3-server-timeouts-ml-482447898"></a>
### client

```ml
function client(state, lastPacketTime, timeoutCount)
```

Create `mq3.server.timeouts.Client` with state=state; lastPacketTime=lastPacketTime; timeoutCount=timeoutCount.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.timeouts.Client` record. |
| `lastPacketTime` | `dynamic` | — | Initial `lastPacketTime` field stored in the returned or constructed `mq3.server.timeouts.Client` record. |
| `timeoutCount` | `dynamic` | — | Initial `timeoutCount` field stored in the returned or constructed `mq3.server.timeouts.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L32)

- [mq3.server.timeouts.Client](Type-mq3-server-timeouts-client-2043009170.md) — struct
<a id="constant-constant-mq3-server-timeouts-cs-active-const-cs-active-4-src-mq3-server-timeouts-ml-946476765"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a playing client monitored for inactivity timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L16)

<a id="constant-constant-mq3-server-timeouts-cs-connected-const-cs-connected-2-src-mq3-server-timeouts-ml-1700153481"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```

Client lifecycle state after connection but before gamestate priming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L12)

<a id="constant-constant-mq3-server-timeouts-cs-free-const-cs-free-0-src-mq3-server-timeouts-ml-1636662057"></a>
### CS_FREE

```ml
const CS_FREE = 0
```

Client-state value identifying a released slot that no longer needs inactivity checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L8)

<a id="constant-constant-mq3-server-timeouts-cs-primed-const-cs-primed-3-src-mq3-server-timeouts-ml-1513582798"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```

Client lifecycle state after gamestate delivery and before entering active play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L14)

<a id="constant-constant-mq3-server-timeouts-cs-zombie-const-cs-zombie-1-src-mq3-server-timeouts-ml-1058533072"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```

Client lifecycle state retaining a recently disconnected client for final messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L10)

<a id="function-function-mq3-server-timeouts-runtime-function-runtime-clients-src-mq3-server-timeouts-ml-1842352188"></a>
### runtime

```ml
function runtime(clients)
```

Compute runtime in server.timeouts; the normal completion returns `Runtime(0, 200, 2, size, clients)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — | Initial `clients` field stored in the returned or constructed `mq3.server.timeouts.Runtime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L49)

- [mq3.server.timeouts.Runtime](Type-mq3-server-timeouts-runtime-1330395935.md) — struct
<a id="function-function-mq3-server-timeouts-services-function-services-src-mq3-server-timeouts-ml-1850656174"></a>
### services

```ml
function services()
```

Create `mq3.server.timeouts.Services` with dropFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L64)

- [mq3.server.timeouts.Services](Type-mq3-server-timeouts-services-141417729.md) — struct
