# `src/mq3/client/network_handshake.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.network_handshake`](Package-mq3-client-network-handshake-1392380759.md)

Reachable from entry: **no**

## Imports

- `mq3/client/connectionless.ml` as `clientConnectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/network_match_loop.ml` as `matchLoop` → [src/mq3/client/network_match_loop.ml](File-src-mq3-client-network-match-loop-ml-1892407048.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/server/oob_connect.ml` as `serverConnect` → [src/mq3/server/oob_connect.ml](File-src-mq3-server-oob-connect-ml-829458266.md)

## Declarations

<a id="function-function-mq3-client-network-handshake-activate-function-activate-state-index-src-mq3-client-network-handshake-ml-846717127"></a>
### activate

```ml
function activate(state, index)
```

Gamestate parsing normally performs these transitions. Local hosts that have installed their game state can atomically expose the already negotiated slot to CL_SendCmd/SV_UserMove and snapshot scheduling through this boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L127)

<a id="function-function-mq3-client-network-handshake-allready-function-allready-state-src-mq3-client-network-handshake-ml-1955741023"></a>
### allReady

```ml
function allReady(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L119)

<a id="function-function-mq3-client-network-handshake-bindclient-function-bindclient-slot-src-mq3-client-network-handshake-ml-289598546"></a>
### bindClient

```ml
function bindClient(slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L28)

<a id="function-function-mq3-client-network-handshake-bindserver-function-bindserver-state-serverslot-src-mq3-client-network-handshake-ml-1910253474"></a>
### bindServer

```ml
function bindServer(state, serverSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverSlot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L50)

<a id="function-function-mq3-client-network-handshake-create-function-create-groupstate-serverstate-src-mq3-client-network-handshake-ml-1374697564"></a>
### create

```ml
function create(groupState, serverState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L14)

<a id="function-function-mq3-client-network-handshake-findslot-function-findslot-state-accepted-src-mq3-client-network-handshake-ml-1830244000"></a>
### findSlot

```ml
function findSlot(state, accepted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `accepted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L39)

<a id="function-function-mq3-client-network-handshake-pump-function-pump-state-budget-src-mq3-client-network-handshake-ml-23790988"></a>
### pump

```ml
function pump(state, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L108)

<a id="function-function-mq3-client-network-handshake-pumponce-function-pumponce-state-src-mq3-client-network-handshake-ml-770583947"></a>
### pumpOnce

```ml
function pumpOnce(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L103)

<a id="function-function-mq3-client-network-handshake-ready-function-ready-state-index-src-mq3-client-network-handshake-ml-158992401"></a>
### ready

```ml
function ready(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L115)

<a id="function-function-mq3-client-network-handshake-reconcile-function-reconcile-state-src-mq3-client-network-handshake-ml-1045593439"></a>
### reconcile

```ml
function reconcile(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L73)

<a id="function-function-mq3-client-network-handshake-resend-function-resend-state-src-mq3-client-network-handshake-ml-881788647"></a>
### resend

```ml
function resend(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L93)

- [mq3.client.network_handshake.Runtime](Type-mq3-client-network-handshake-runtime-1346947741.md) — struct
<a id="function-function-mq3-client-network-handshake-sameendpoint-function-sameendpoint-left-right-src-mq3-client-network-handshake-ml-791477271"></a>
### sameEndpoint

```ml
function sameEndpoint(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L24)

<a id="function-function-mq3-client-network-handshake-settime-function-settime-state-time-src-mq3-client-network-handshake-ml-853469366"></a>
### setTime

```ml
function setTime(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L87)

- [mq3.client.network_handshake.Slot](Type-mq3-client-network-handshake-slot-1260725159.md) — struct
