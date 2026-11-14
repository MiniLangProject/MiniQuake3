# `src/mq3/client/ui_lan_ingress.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_ingress`](Package-mq3-client-ui-lan-ingress-1753187407.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/connectionless.ml` as `connectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/ui_lan_browser.ml` as `lan` → [src/mq3/client/ui_lan_browser.ml](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-client-ui-lan-ingress-addresstext-function-addresstext-address-src-mq3-client-ui-lan-ingress-ml-315150758"></a>
### addressText

```ml
function addressText(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L29)

<a id="function-function-mq3-client-ui-lan-ingress-attach-function-attach-host-state-src-mq3-client-ui-lan-ingress-ml-1121456179"></a>
### attach

```ml
function attach(host, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L93)

<a id="function-function-mq3-client-ui-lan-ingress-consumependingping-function-consumependingping-state-address-src-mq3-client-ui-lan-ingress-ml-1664511513"></a>
### consumePendingPing

```ml
function consumePendingPing(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L48)

<a id="function-function-mq3-client-ui-lan-ingress-consumependingstatus-function-consumependingstatus-state-address-src-mq3-client-ui-lan-ingress-ml-1058898541"></a>
### consumePendingStatus

```ml
function consumePendingStatus(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L43)

<a id="function-function-mq3-client-ui-lan-ingress-create-function-create-browser-src-mq3-client-ui-lan-ingress-ml-848564592"></a>
### create

```ml
function create(browser)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browser` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L21)

<a id="constant-constant-mq3-client-ui-lan-ingress-max-serversperpacket-const-max-serversperpacket-256-src-mq3-client-ui-lan-ingress-ml-579689360"></a>
### MAX_SERVERSPERPACKET

```ml
const MAX_SERVERSPERPACKET = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L14)

<a id="constant-constant-mq3-client-ui-lan-ingress-na-broadcast-const-na-broadcast-3-src-mq3-client-ui-lan-ingress-ml-525213450"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L15)

<a id="constant-constant-mq3-client-ui-lan-ingress-na-ip-const-na-ip-4-src-mq3-client-ui-lan-ingress-ml-1037061389"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L16)

<a id="function-function-mq3-client-ui-lan-ingress-nettype-function-nettype-address-src-mq3-client-ui-lan-ingress-ml-101574086"></a>
### netType

```ml
function netType(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L34)

- [mq3.client.ui_lan_ingress.PendingPing](Type-mq3-client-ui-lan-ingress-pendingping-1181047978.md) — struct
<a id="constant-constant-mq3-client-ui-lan-ingress-protocol-version-const-protocol-version-68-src-mq3-client-ui-lan-ingress-ml-2012767741"></a>
### PROTOCOL_VERSION

```ml
const PROTOCOL_VERSION = 68
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L13)

<a id="function-function-mq3-client-ui-lan-ingress-requestping-function-requestping-state-address-start-src-mq3-client-ui-lan-ingress-ml-1944021099"></a>
### requestPing

```ml
function requestPing(state, address, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L36)

<a id="function-function-mq3-client-ui-lan-ingress-requeststatus-function-requeststatus-state-address-src-mq3-client-ui-lan-ingress-ml-650603051"></a>
### requestStatus

```ml
function requestStatus(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L39)

<a id="function-function-mq3-client-ui-lan-ingress-responseinfo-function-responseinfo-host-clientstate-source-msg-src-mq3-client-ui-lan-ingress-ml-731509406"></a>
### responseInfo

```ml
function responseInfo(host, clientState, source, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L54)

<a id="function-function-mq3-client-ui-lan-ingress-responseservers-function-responseservers-host-clientstate-source-msg-src-mq3-client-ui-lan-ingress-ml-1850128060"></a>
### responseServers

```ml
function responseServers(host, clientState, source, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L76)

<a id="function-function-mq3-client-ui-lan-ingress-responsestatus-function-responsestatus-host-clientstate-source-msg-src-mq3-client-ui-lan-ingress-ml-241680522"></a>
### responseStatus

```ml
function responseStatus(host, clientState, source, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L68)

<a id="function-function-mq3-client-ui-lan-ingress-sameaddress-function-sameaddress-left-right-src-mq3-client-ui-lan-ingress-ml-1147340445"></a>
### sameAddress

```ml
function sameAddress(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L33)

<a id="function-function-mq3-client-ui-lan-ingress-services-function-services-state-src-mq3-client-ui-lan-ingress-ml-1682110597"></a>
### services

```ml
function services(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L97)

<a id="function-function-mq3-client-ui-lan-ingress-setmaster-function-setmaster-state-number-src-mq3-client-ui-lan-ingress-ml-1446023576"></a>
### setMaster

```ml
function setMaster(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L27)

<a id="function-function-mq3-client-ui-lan-ingress-setpingupdatesource-function-setpingupdatesource-state-source-src-mq3-client-ui-lan-ingress-ml-1957487736"></a>
### setPingUpdateSource

```ml
function setPingUpdateSource(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L26)

<a id="function-function-mq3-client-ui-lan-ingress-setrealtime-function-setrealtime-state-value-src-mq3-client-ui-lan-ingress-ml-959716150"></a>
### setRealtime

```ml
function setRealtime(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L25)

- [mq3.client.ui_lan_ingress.State](Type-mq3-client-ui-lan-ingress-state-390538724.md) — struct
