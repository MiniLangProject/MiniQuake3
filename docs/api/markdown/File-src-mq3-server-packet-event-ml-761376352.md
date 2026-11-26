# `src/mq3/server/packet_event.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.packet_event`](Package-mq3-server-packet-event-978691522.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/server/connectionless.ml` as `serverConnectionless` → [src/mq3/server/connectionless.ml](File-src-mq3-server-connectionless-ml-1112827538.md)
- `mq3/server/netchan.ml` as `serverNetchan` → [src/mq3/server/netchan.ml](File-src-mq3-server-netchan-ml-1084677692.md)

## Declarations

<a id="function-function-mq3-server-packet-event-client-function-client-state-servernetchanstate-src-mq3-server-packet-event-ml-1395868762"></a>
### client

```ml
function client(state, serverNetchanState)
```

Create `mq3.server.packet_event.Client` with state=state; netchan=serverNetchanState; lastPacketTime=0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.packet_event.Client` record. |
| `serverNetchanState` | `dynamic` | — | Initial `netchan` field stored in the returned or constructed `mq3.server.packet_event.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L21)

- [mq3.server.packet_event.Client](Type-mq3-server-packet-event-client-932321139.md) — struct
<a id="constant-constant-mq3-server-packet-event-cs-free-const-cs-free-0-src-mq3-server-packet-event-ml-922464525"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L11)

<a id="constant-constant-mq3-server-packet-event-cs-zombie-const-cs-zombie-1-src-mq3-server-packet-event-ml-44014732"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L12)

<a id="function-function-mq3-server-packet-event-isoob-function-isoob-msg-src-mq3-server-packet-event-ml-226574741"></a>
### isOob

```ml
function isOob(msg)
```

Compute server.packet_event.isOob as `((msg.cursize >= 4) and (numeric.readI32(msg.data, 0) == - 1))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `cursize`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L50)

<a id="function-function-mq3-server-packet-event-messagebytes-function-messagebytes-msg-src-mq3-server-packet-event-ml-1317571525"></a>
### messageBytes

```ml
function messageBytes(msg)
```

Compute message bytes in server.packet_event; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `cursize`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L56)

<a id="constant-constant-mq3-server-packet-event-na-ip-const-na-ip-4-src-mq3-server-packet-event-ml-1874528761"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L14)

<a id="constant-constant-mq3-server-packet-event-na-loopback-const-na-loopback-2-src-mq3-server-packet-event-ml-1717059071"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L13)

<a id="function-function-mq3-server-packet-event-packetevent-function-packetevent-state-host-source-msg-src-mq3-server-packet-event-ml-1343267063"></a>
### packetEvent

```ml
function packetEvent(state, host, source, msg)
```

Compute packet event in server.packet_event; the normal completion returns `"unknown"`.

Validation failures include `server packet event: missing input`; `server packet event: missing connectionless service`; `server packet event: missing netchan process`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `clients`, `time`. |
| `host` | `dynamic` | — | Record exposing `connectionlessRuntime`, `connectionlessHost`, `diagnosticFn`, `processFn`, `executeFn`, `disconnectFn`. |
| `source` | `dynamic` | — | Record exposing `port`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.packet_event.isOob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L81)

<a id="function-function-mq3-server-packet-event-processnetchan-function-processnetchan-host-clientstate-msg-src-mq3-server-packet-event-ml-1413262543"></a>
### processNetchan

```ml
function processNetchan(host, clientState, msg)
```

Concrete SV_Netchan_Process adapter. Tests can replace processFn with the deterministic host callback used by the unchanged-C transition oracle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `clientState` | `dynamic` | — | Record exposing `netchan`. |
| `msg` | `dynamic` | — | Record exposing `maxsize`. Updated in place: `data`, `cursize`, `readcount`, `bit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L67)

<a id="function-function-mq3-server-packet-event-runtime-function-runtime-clients-src-mq3-server-packet-event-ml-429028052"></a>
### runtime

```ml
function runtime(clients)
```

Create `mq3.server.packet_event.Runtime` with time=0; clients=clients.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — | Initial `clients` field stored in the returned or constructed `mq3.server.packet_event.Runtime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L27)

- [mq3.server.packet_event.Runtime](Type-mq3-server-packet-event-runtime-881154040.md) — struct
<a id="function-function-mq3-server-packet-event-samebase-function-samebase-left-right-src-mq3-server-packet-event-ml-1065065437"></a>
### sameBase

```ml
function sameBase(left, right)
```

Test same base in server.packet_event; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record exposing `type`, `ip`. |
| `right` | `dynamic` | — | Record exposing `type`, `ip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L41)

<a id="function-function-mq3-server-packet-event-services-function-services-connectionlessruntime-connectionlesshost-src-mq3-server-packet-event-ml-2041605972"></a>
### services

```ml
function services(connectionlessRuntime, connectionlessHost)
```

Create `mq3.server.packet_event.Services` with connectionlessRuntime=connectionlessRuntime; connectionlessHost=connectionlessHost; processFn=processNetchan; executeFn=void; disconnectFn=void; diagnosticFn=void; context=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionlessRuntime` | `dynamic` | — | Initial `connectionlessRuntime` field stored in the returned or constructed `mq3.server.packet_event.Services` record. |
| `connectionlessHost` | `dynamic` | — | Initial `connectionlessHost` field stored in the returned or constructed `mq3.server.packet_event.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L34)

- [mq3.server.packet_event.Services](Type-mq3-server-packet-event-services-266207052.md) — struct
