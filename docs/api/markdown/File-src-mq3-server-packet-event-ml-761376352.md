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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverNetchanState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L17)

- [mq3.server.packet_event.Client](Type-mq3-server-packet-event-client-932321139.md) — struct
<a id="constant-constant-mq3-server-packet-event-cs-free-const-cs-free-0-src-mq3-server-packet-event-ml-922464525"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L11)

<a id="constant-constant-mq3-server-packet-event-cs-zombie-const-cs-zombie-1-src-mq3-server-packet-event-ml-44014732"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L12)

<a id="function-function-mq3-server-packet-event-isoob-function-isoob-msg-src-mq3-server-packet-event-ml-226574741"></a>
### isOob

```ml
function isOob(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L34)

<a id="function-function-mq3-server-packet-event-messagebytes-function-messagebytes-msg-src-mq3-server-packet-event-ml-1317571525"></a>
### messageBytes

```ml
function messageBytes(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L38)

<a id="constant-constant-mq3-server-packet-event-na-ip-const-na-ip-4-src-mq3-server-packet-event-ml-1874528761"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L14)

<a id="constant-constant-mq3-server-packet-event-na-loopback-const-na-loopback-2-src-mq3-server-packet-event-ml-1717059071"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L13)

<a id="function-function-mq3-server-packet-event-packetevent-function-packetevent-state-host-source-msg-src-mq3-server-packet-event-ml-1343267063"></a>
### packetEvent

```ml
function packetEvent(state, host, source, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L53)

<a id="function-function-mq3-server-packet-event-processnetchan-function-processnetchan-host-clientstate-msg-src-mq3-server-packet-event-ml-1413262543"></a>
### processNetchan

```ml
function processNetchan(host, clientState, msg)
```

Concrete SV_Netchan_Process adapter. Tests can replace processFn with the deterministic host callback used by the unchanged-C transition oracle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L46)

<a id="function-function-mq3-server-packet-event-runtime-function-runtime-clients-src-mq3-server-packet-event-ml-429028052"></a>
### runtime

```ml
function runtime(clients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L20)

- [mq3.server.packet_event.Runtime](Type-mq3-server-packet-event-runtime-881154040.md) — struct
<a id="function-function-mq3-server-packet-event-samebase-function-samebase-left-right-src-mq3-server-packet-event-ml-1065065437"></a>
### sameBase

```ml
function sameBase(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L27)

<a id="function-function-mq3-server-packet-event-services-function-services-connectionlessruntime-connectionlesshost-src-mq3-server-packet-event-ml-2041605972"></a>
### services

```ml
function services(connectionlessRuntime, connectionlessHost)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionlessRuntime` | `dynamic` | — |  |
| `connectionlessHost` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/packet_event.ml#L23)

- [mq3.server.packet_event.Services](Type-mq3-server-packet-event-services-266207052.md) — struct
