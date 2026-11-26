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

Constructs `mq3.platform.desktop_frame_host.Config` from `clientEndpoint`, `serverEndpoint`, `packetCapacity`, `packetBudget`, `maxFrameMsec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientEndpoint` | `dynamic` | — | Initial value for `mq3.platform.desktop_frame_host.Config.clientEndpoint`. |
| `serverEndpoint` | `dynamic` | — | Initial value for `mq3.platform.desktop_frame_host.Config.serverEndpoint`. |
| `packetCapacity` | `dynamic` | — | Initial value for `mq3.platform.desktop_frame_host.Config.packetCapacity`. |
| `packetBudget` | `dynamic` | — | Initial value for `mq3.platform.desktop_frame_host.Config.packetBudget`. |
| `maxFrameMsec` | `dynamic` | — | Initial value for `mq3.platform.desktop_frame_host.Config.maxFrameMsec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L36)

- [mq3.platform.desktop_frame_host.Config](Type-mq3-platform-desktop-frame-host-config-803989000.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-frame-function-frame-runtime-now-src-mq3-platform-desktop-frame-host-ml-1000851294"></a>
### frame

```ml
function frame(runtime, now)
```

Quake's event loop consumes input before advancing server and client state. Time never moves backwards and large desktop stalls are capped per frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.time`, `runtime.frameNumber`, `runtime.packetCount`. |
| `now` | `dynamic` | — | Initial value for `mq3.platform.desktop_frame_host.FrameResult.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L186)

- [mq3.platform.desktop_frame_host.FrameResult](Type-mq3-platform-desktop-frame-host-frameresult-1279231830.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-livebind-function-livebind-services-socket-endpoint-src-mq3-platform-desktop-frame-host-ml-806206712"></a>
### liveBind

```ml
function liveBind(services, socket, endpoint)
```

Calls `mq3.platform.udp.bind` with `(socket,endpoint)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `socket` | `dynamic` | — | Argument 1 supplied to `mq3.platform.udp.bind`. |
| `endpoint` | `dynamic` | — | Argument 2 supplied to `mq3.platform.udp.bind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L50)

<a id="function-function-mq3-platform-desktop-frame-host-livecleanup-function-livecleanup-services-src-mq3-platform-desktop-frame-host-ml-967184588"></a>
### liveCleanup

```ml
function liveCleanup(services)
```

Calls `mq3.platform.udp.cleanup` with `()` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L57)

<a id="function-function-mq3-platform-desktop-frame-host-liveclientframe-function-liveclientframe-services-time-msec-src-mq3-platform-desktop-frame-host-ml-1239549973"></a>
### liveClientFrame

```ml
function liveClientFrame(services, time, msec)
```

Returns `void` from `mq3.platform.desktop_frame_host.liveClientFrame`; earlier branches return `services.context.clientFrameFn(services.context.frameContext,time,msec)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Record providing `services.context`. |
| `time` | `dynamic` | — | Argument 2 supplied to `services.context.clientFrameFn`. |
| `msec` | `dynamic` | — | Argument 3 supplied to `services.context.clientFrameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L92)

<a id="function-function-mq3-platform-desktop-frame-host-liveclose-function-liveclose-services-socket-src-mq3-platform-desktop-frame-host-ml-414597249"></a>
### liveClose

```ml
function liveClose(services, socket)
```

Calls `mq3.platform.udp.close` with `(socket)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `socket` | `dynamic` | — | Argument 1 supplied to `mq3.platform.udp.close`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L54)

- [mq3.platform.desktop_frame_host.LiveContext](Type-mq3-platform-desktop-frame-host-livecontext-1514691407.md) — struct
<a id="function-function-mq3-platform-desktop-frame-host-livecreatepump-function-livecreatepump-services-clientsocket-serversocket-capacity-src-mq3-platform-desktop-frame-host-ml-427874900"></a>
### liveCreatePump

```ml
function liveCreatePump(services, clientSocket, serverSocket, capacity)
```

Calls `mq3.server.network_ingress.createPump` with `(services.context.ingress,clientSocket,serverSocket,capacity)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Record providing `services.context`. |
| `clientSocket` | `dynamic` | — | Argument 2 supplied to `mq3.server.network_ingress.createPump`. |
| `serverSocket` | `dynamic` | — | Argument 3 supplied to `mq3.server.network_ingress.createPump`. |
| `capacity` | `dynamic` | — | Argument 4 supplied to `mq3.server.network_ingress.createPump`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L63)

<a id="function-function-mq3-platform-desktop-frame-host-livedrain-function-livedrain-services-pump-budget-src-mq3-platform-desktop-frame-host-ml-1401026991"></a>
### liveDrain

```ml
function liveDrain(services, pump, budget)
```

Calls `mq3.qcommon.network_pump.drain` with `(pump,budget)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `pump` | `dynamic` | — | Argument 1 supplied to `mq3.qcommon.network_pump.drain`. |
| `budget` | `dynamic` | — | Argument 2 supplied to `mq3.qcommon.network_pump.drain`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L79)

<a id="function-function-mq3-platform-desktop-frame-host-liveopen-function-liveopen-services-src-mq3-platform-desktop-frame-host-ml-1585003188"></a>
### liveOpen

```ml
function liveOpen(services)
```

Calls `mq3.platform.udp.open` with `()` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L45)

<a id="function-function-mq3-platform-desktop-frame-host-liveserverframe-function-liveserverframe-services-time-msec-src-mq3-platform-desktop-frame-host-ml-1766536669"></a>
### liveServerFrame

```ml
function liveServerFrame(services, time, msec)
```

Returns `void` from `mq3.platform.desktop_frame_host.liveServerFrame`; earlier branches return `services.context.serverFrameFn(services.context.frameContext,time,msec)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Record providing `services.context`. |
| `time` | `dynamic` | — | Argument 2 supplied to `services.context.serverFrameFn`. |
| `msec` | `dynamic` | — | Argument 3 supplied to `services.context.serverFrameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L84)

<a id="function-function-mq3-platform-desktop-frame-host-liveservices-function-liveservices-ingress-framecontext-serverframefn-clientframefn-src-mq3-platform-desktop-frame-host-ml-1234287623"></a>
### liveServices

```ml
function liveServices(ingress, frameContext, serverFrameFn, clientFrameFn)
```

Builds `mq3.platform.desktop_frame_host.Services` for `mq3.platform.desktop_frame_host.liveServices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ingress` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.ingress`. |
| `frameContext` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.frameContext`. |
| `serverFrameFn` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.serverFrameFn`. |
| `clientFrameFn` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.clientFrameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L102)

<a id="function-function-mq3-platform-desktop-frame-host-liveserviceswithcommon-function-liveserviceswithcommon-ingress-framecontext-commonframefn-serverframefn-clientframefn-src-mq3-platform-desktop-frame-host-ml-1558860983"></a>
### liveServicesWithCommon

```ml
function liveServicesWithCommon(ingress, frameContext, commonFrameFn, serverFrameFn, clientFrameFn)
```

Builds `mq3.platform.desktop_frame_host.Services` for `mq3.platform.desktop_frame_host.liveServicesWithCommon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ingress` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.ingress`. |
| `frameContext` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.frameContext`. |
| `commonFrameFn` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.commonFrameFn`. |
| `serverFrameFn` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.serverFrameFn`. |
| `clientFrameFn` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.LiveContext.clientFrameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L115)

<a id="function-function-mq3-platform-desktop-frame-host-livesettime-function-livesettime-services-time-src-mq3-platform-desktop-frame-host-ml-2062618579"></a>
### liveSetTime

```ml
function liveSetTime(services, time)
```

Returns `networkIngress.setTime(services.context.ingress,time)` from `mq3.platform.desktop_frame_host.liveSetTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Record providing `services.context`. |
| `time` | `dynamic` | — | Argument 2 supplied to `services.context.commonFrameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L69)

<a id="function-function-mq3-platform-desktop-frame-host-livestartup-function-livestartup-services-src-mq3-platform-desktop-frame-host-ml-2009566982"></a>
### liveStartup

```ml
function liveStartup(services)
```

Calls `mq3.platform.udp.startup` with `()` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L42)

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
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.active`, `runtime.clientSocket`, `runtime.serverSocket`, `runtime.udpStarted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L144)

<a id="function-function-mq3-platform-desktop-frame-host-start-function-start-configuration-services-initialtime-src-mq3-platform-desktop-frame-host-ml-1951148619"></a>
### start

```ml
function start(configuration, services, initialTime)
```

Builds `runtime.udpStarted`, `runtime.clientSocket`, `runtime.serverSocket`, `runtime.clientEndpoint`, `runtime.serverEndpoint` in `mq3.platform.desktop_frame_host.start`; returns `runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `configuration` | `dynamic` | — | Record providing `configuration.clientEndpoint`, `configuration.serverEndpoint`, `configuration.packetCapacity`. |
| `services` | `dynamic` | — | Record providing `services.startupFn`, `services.openFn`, `services.bindFn`, `services.createPumpFn`. |
| `initialTime` | `dynamic` | — | Value used for `mq3.platform.desktop_frame_host.Runtime.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L168)

<a id="function-function-mq3-platform-desktop-frame-host-validconfig-function-validconfig-value-src-mq3-platform-desktop-frame-host-ml-1158748125"></a>
### validConfig

```ml
function validConfig(value)
```

Checks endpoint presence, UDP capacities/budgets, frame timing, and endpoint port ranges.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.clientEndpoint`, `value.serverEndpoint`, `value.packetCapacity`, `value.packetBudget`, `value.maxFrameMsec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L124)

<a id="function-function-mq3-platform-desktop-frame-host-validservices-function-validservices-value-src-mq3-platform-desktop-frame-host-ml-1228461997"></a>
### validServices

```ml
function validServices(value)
```

Computes `validServices` from `value!=void and value.startupFn!=void and value.openFn!=void and value.bindFn!=void and`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.startupFn`, `value.openFn`, `value.bindFn`, `value.closeFn`, `value.cleanupFn`, `value.createPumpFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L135)
