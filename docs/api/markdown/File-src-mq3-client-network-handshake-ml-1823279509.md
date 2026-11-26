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
| `state` | `dynamic` | — | Record read through `state.slots`, `state.server.clients`. |
| `index` | `dynamic` | — | Value tested by `not ready(state,index)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L188)

<a id="function-function-mq3-client-network-handshake-allready-function-allready-state-src-mq3-client-network-handshake-ml-1955741023"></a>
### allReady

```ml
function allReady(state)
```

Calls `mq3.client.network_handshake.ready` from network handshake `allReady`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.slots`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L178)

<a id="function-function-mq3-client-network-handshake-bindclient-function-bindclient-slot-src-mq3-client-network-handshake-ml-289598546"></a>
### bindClient

```ml
function bindClient(slot)
```

Updates `slot.clientBound` during network handshake `bindClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Mutable network handshake record/storage; this routine assigns `slot.clientBound`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L64)

<a id="function-function-mq3-client-network-handshake-bindserver-function-bindserver-state-serverslot-src-mq3-client-network-handshake-ml-1910253474"></a>
### bindServer

```ml
function bindServer(state, serverSlot)
```

Calls `mq3.client.network_handshake.sameEndpoint`, `mq3.client.network_handshake.findSlot`, `mq3.qcommon.netchan.setup` from network handshake `bindServer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.server.clients`, `state.slots`. |
| `serverSlot` | `dynamic` | — | Value assigned to `slot.serverSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L92)

<a id="function-function-mq3-client-network-handshake-create-function-create-groupstate-serverstate-src-mq3-client-network-handshake-ml-1374697564"></a>
### create

```ml
function create(groupState, serverState)
```

Calls `mq3.client.network_handshake.Slot`, `mq3.client.network_handshake.Runtime` from network handshake `create`. The final path returns `Runtime(groupState,serverState,slots,"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — | Record read through `groupState.runtimes`. |
| `serverState` | `dynamic` | — | Value used by `if groupState==void or serverState==void or groupState.runtimes==void or len(groupState.runtimes)<1 then return error(7715,"network handshake:...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L45)

<a id="function-function-mq3-client-network-handshake-findslot-function-findslot-state-accepted-src-mq3-client-network-handshake-ml-1830244000"></a>
### findSlot

```ml
function findSlot(state, accepted)
```

Calls `mq3.client.network_handshake.sameEndpoint` from network handshake `findSlot`. The final path returns `found`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.slots`. |
| `accepted` | `dynamic` | — | Record read through `accepted.qport`, `accepted.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L78)

<a id="function-function-mq3-client-network-handshake-pump-function-pump-state-budget-src-mq3-client-network-handshake-ml-23790988"></a>
### pump

```ml
function pump(state, budget)
```

Calls `mq3.client.network_handshake.pumpOnce` from network handshake `pump`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared network handshake state passed to the helper calls in `pump`. |
| `budget` | `dynamic` | — | Value used by `if state==void or budget<0 then return error(7715,"network handshake: invalid pump") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L162)

<a id="function-function-mq3-client-network-handshake-pumponce-function-pumponce-state-src-mq3-client-network-handshake-ml-770583947"></a>
### pumpOnce

```ml
function pumpOnce(state)
```

Calls `mq3.client.network_match_loop.pumpGroupOnce`, `mq3.client.network_handshake.reconcile` from network handshake `pumpOnce`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.group`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L154)

<a id="function-function-mq3-client-network-handshake-ready-function-ready-state-index-src-mq3-client-network-handshake-ml-158992401"></a>
### ready

```ml
function ready(state, index)
```

Checks that the selected network slot exists and both client/server transport endpoints are bound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.slots`. |
| `index` | `dynamic` | — | Value tested by `state==void or index<0 or index>=len(state.slots)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L172)

<a id="function-function-mq3-client-network-handshake-reconcile-function-reconcile-state-src-mq3-client-network-handshake-ml-1045593439"></a>
### reconcile

```ml
function reconcile(state)
```

Updates `state.lastError` during network handshake `reconcile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable network handshake record/storage; this routine assigns `state.lastError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L117)

<a id="function-function-mq3-client-network-handshake-resend-function-resend-state-src-mq3-client-network-handshake-ml-881788647"></a>
### resend

```ml
function resend(state)
```

Calls `mq3.client.connectionless.checkForResend` from network handshake `resend`. The final path returns `sent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.slots`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L142)

- [mq3.client.network_handshake.Runtime](Type-mq3-client-network-handshake-runtime-1346947741.md) — struct
<a id="function-function-mq3-client-network-handshake-sameendpoint-function-sameendpoint-left-right-src-mq3-client-network-handshake-ml-791477271"></a>
### sameEndpoint

```ml
function sameEndpoint(left, right)
```

Adapts `mq3.client.connectionless.addressEqual` to network handshake `sameEndpoint`, returning its result for `left, right, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Argument 1 of `mq3.client.connectionless.addressEqual`. |
| `right` | `dynamic` | — | Argument 2 of `mq3.client.connectionless.addressEqual`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L58)

<a id="function-function-mq3-client-network-handshake-settime-function-settime-state-time-src-mq3-client-network-handshake-ml-853469366"></a>
### setTime

```ml
function setTime(state, time)
```

Updates `state.server.time` during network handshake `setTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable network handshake record/storage; this routine assigns `state.server.time`. |
| `time` | `dynamic` | — | Value assigned to `state.server.time`, `slot.runtime.clientConnection.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L134)

- [mq3.client.network_handshake.Slot](Type-mq3-client-network-handshake-slot-1260725159.md) — struct
