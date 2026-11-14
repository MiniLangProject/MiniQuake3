# `src/mq3/platform/desktop_frame_host.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.desktop_frame_host`](Package-mq3-platform-desktop-frame-host-1127498084.md)

Reachable from entry: **yes**

## Imports

- `mq3/platform/udp.ml` as `udp` → [src/mq3/platform/udp.ml](File-src-mq3-platform-udp-ml-646757928.md)
- `mq3/qcommon/network_pump.ml` as `networkPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/server/network_ingress.ml` as `networkIngress` → [src/mq3/server/network_ingress.ml](File-src-mq3-server-network-ingress-ml-1810419035.md)

## Declarations

<a id="function-function-mq3-platform-desktop-frame-host-config-function-config-clientendpoint-serverendpoint-packetcapacity-packetbudget-maxframemsec-src-mq3-platform-desktop-frame-host-ml-1555343022"></a>
### config

```ml
function config(clientEndpoint, serverEndpoint, packetCapacity, packetBudget, maxFrameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientEndpoint` | `dynamic` | — |  |
| `serverEndpoint` | `dynamic` | — |  |
| `packetCapacity` | `dynamic` | — |  |
| `packetBudget` | `dynamic` | — |  |
| `maxFrameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L26)

- [mq3.platform.desktop_frame_host.Config](Type-mq3-platform-desktop-frame-host-config-803989000.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-frame-function-frame-runtime-now-src-mq3-platform-desktop-frame-host-ml-1000851294"></a>
### frame

```ml
function frame(runtime, now)
```

Quake's event loop consumes input before advancing server and client state. Time never moves backwards and large desktop stalls are capped per frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L121)

- [mq3.platform.desktop_frame_host.FrameResult](Type-mq3-platform-desktop-frame-host-frameresult-1279231830.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-livebind-function-livebind-services-socket-endpoint-src-mq3-platform-desktop-frame-host-ml-806206712"></a>
### liveBind

```ml
function liveBind(services, socket, endpoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `socket` | `dynamic` | — |  |
| `endpoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L32)

<a id="function-function-mq3-platform-desktop-frame-host-livecleanup-function-livecleanup-services-src-mq3-platform-desktop-frame-host-ml-967184588"></a>
### liveCleanup

```ml
function liveCleanup(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L34)

<a id="function-function-mq3-platform-desktop-frame-host-liveclientframe-function-liveclientframe-services-time-msec-src-mq3-platform-desktop-frame-host-ml-1239549973"></a>
### liveClientFrame

```ml
function liveClientFrame(services, time, msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L49)

<a id="function-function-mq3-platform-desktop-frame-host-liveclose-function-liveclose-services-socket-src-mq3-platform-desktop-frame-host-ml-414597249"></a>
### liveClose

```ml
function liveClose(services, socket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `socket` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L33)

- [mq3.platform.desktop_frame_host.LiveContext](Type-mq3-platform-desktop-frame-host-livecontext-1514691407.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-livecreatepump-function-livecreatepump-services-clientsocket-serversocket-capacity-src-mq3-platform-desktop-frame-host-ml-427874900"></a>
### liveCreatePump

```ml
function liveCreatePump(services, clientSocket, serverSocket, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `clientSocket` | `dynamic` | — |  |
| `serverSocket` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L35)

<a id="function-function-mq3-platform-desktop-frame-host-livedrain-function-livedrain-services-pump-budget-src-mq3-platform-desktop-frame-host-ml-1401026991"></a>
### liveDrain

```ml
function liveDrain(services, pump, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `pump` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L44)

<a id="function-function-mq3-platform-desktop-frame-host-liveopen-function-liveopen-services-src-mq3-platform-desktop-frame-host-ml-1585003188"></a>
### liveOpen

```ml
function liveOpen(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L31)

<a id="function-function-mq3-platform-desktop-frame-host-liveserverframe-function-liveserverframe-services-time-msec-src-mq3-platform-desktop-frame-host-ml-1766536669"></a>
### liveServerFrame

```ml
function liveServerFrame(services, time, msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L45)

<a id="function-function-mq3-platform-desktop-frame-host-liveservices-function-liveservices-ingress-framecontext-serverframefn-clientframefn-src-mq3-platform-desktop-frame-host-ml-1234287623"></a>
### liveServices

```ml
function liveServices(ingress, frameContext, serverFrameFn, clientFrameFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ingress` | `dynamic` | — |  |
| `frameContext` | `dynamic` | — |  |
| `serverFrameFn` | `dynamic` | — |  |
| `clientFrameFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L54)

<a id="function-function-mq3-platform-desktop-frame-host-liveserviceswithcommon-function-liveserviceswithcommon-ingress-framecontext-commonframefn-serverframefn-clientframefn-src-mq3-platform-desktop-frame-host-ml-1558860983"></a>
### liveServicesWithCommon

```ml
function liveServicesWithCommon(ingress, frameContext, commonFrameFn, serverFrameFn, clientFrameFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ingress` | `dynamic` | — |  |
| `frameContext` | `dynamic` | — |  |
| `commonFrameFn` | `dynamic` | — |  |
| `serverFrameFn` | `dynamic` | — |  |
| `clientFrameFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L61)

<a id="function-function-mq3-platform-desktop-frame-host-livesettime-function-livesettime-services-time-src-mq3-platform-desktop-frame-host-ml-2062618579"></a>
### liveSetTime

```ml
function liveSetTime(services, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L38)

<a id="function-function-mq3-platform-desktop-frame-host-livestartup-function-livestartup-services-src-mq3-platform-desktop-frame-host-ml-2009566982"></a>
### liveStartup

```ml
function liveStartup(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L30)

- [mq3.platform.desktop_frame_host.Runtime](Type-mq3-platform-desktop-frame-host-runtime-94095142.md) — struct
- [mq3.platform.desktop_frame_host.Services](Type-mq3-platform-desktop-frame-host-services-2034917618.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-shutdown-function-shutdown-runtime-src-mq3-platform-desktop-frame-host-ml-1161143376"></a>
### shutdown

```ml
function shutdown(runtime)
```

Release every resource that was acquired. Keep attempting later cleanup steps if an earlier close reports an error, and return the first failure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L85)

<a id="function-function-mq3-platform-desktop-frame-host-start-function-start-configuration-services-initialtime-src-mq3-platform-desktop-frame-host-ml-1951148619"></a>
### start

```ml
function start(configuration, services, initialTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `configuration` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `initialTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L105)

<a id="function-function-mq3-platform-desktop-frame-host-validconfig-function-validconfig-value-src-mq3-platform-desktop-frame-host-ml-1158748125"></a>
### validConfig

```ml
function validConfig(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L68)

<a id="function-function-mq3-platform-desktop-frame-host-validservices-function-validservices-value-src-mq3-platform-desktop-frame-host-ml-1228461997"></a>
### validServices

```ml
function validServices(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L77)
