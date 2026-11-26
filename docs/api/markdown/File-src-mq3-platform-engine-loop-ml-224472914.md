# `src/mq3/platform/engine_loop.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.engine_loop`](Package-mq3-platform-engine-loop-1789905810.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/frame.ml` as `clientLoopFrame` → [src/mq3/client/frame.ml](File-src-mq3-client-frame-ml-2110176474.md)
- `mq3/platform/desktop_frame_host.ml` as `desktopHost` → [src/mq3/platform/desktop_frame_host.ml](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)
- `mq3/platform/input_events.ml` as `inputEvents` → [src/mq3/platform/input_events.ml](File-src-mq3-platform-input-events-ml-1710405869.md)
- `mq3/qcommon/config_persistence.ml` as `configPersistence` → [src/mq3/qcommon/config_persistence.ml](File-src-mq3-qcommon-config-persistence-ml-1954559630.md)
- `mq3/qcommon/cvar_commands.ml` as `cvarCommands` → [src/mq3/qcommon/cvar_commands.ml](File-src-mq3-qcommon-cvar-commands-ml-1227862997.md)
- `mq3/server/frame.ml` as `serverFrame` → [src/mq3/server/frame.ml](File-src-mq3-server-frame-ml-1912753238.md)

## Declarations

<a id="function-function-mq3-platform-engine-loop-clienttick-function-clienttick-runtime-time-msec-src-mq3-platform-engine-loop-ml-457273353"></a>
### clientTick

```ml
function clientTick(runtime, time, msec)
```

Updates `runtime.lastClientResult`, `runtime.frameCount` in `mq3.platform.engine_loop.clientTick`; returns `runtime.lastClientResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.lastClientResult`, `runtime.frameCount`. |
| `time` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `msec` | `dynamic` | — | Argument 2 supplied to `mq3.client.frame.run`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L72)

<a id="function-function-mq3-platform-engine-loop-commontick-function-commontick-runtime-time-src-mq3-platform-engine-loop-ml-1716240505"></a>
### commonTick

```ml
function commonTick(runtime, time)
```

Returns `void` from `mq3.platform.engine_loop.commonTick`; earlier branches return `error(7120,"engine loop: missing runtime")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.configState`. |
| `time` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L47)

<a id="function-function-mq3-platform-engine-loop-create-function-create-inputqueue-inputhandlers-inputbudget-serverstate-serverservices-clientstate-clientservices-src-mq3-platform-engine-loop-ml-651422523"></a>
### create

```ml
function create(inputQueue, inputHandlers, inputBudget, serverState, serverServices, clientState, clientServices)
```

Builds `mq3.platform.engine_loop.Runtime` for `mq3.platform.engine_loop.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inputQueue` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.inputQueue`. |
| `inputHandlers` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.inputHandlers`. |
| `inputBudget` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.inputBudget`. |
| `serverState` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.serverState`. |
| `serverServices` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.serverServices`. |
| `clientState` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.clientState`. |
| `clientServices` | `dynamic` | — | Initial value for `mq3.platform.engine_loop.Runtime.clientServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L23)

<a id="function-function-mq3-platform-engine-loop-initializeconfiguration-function-initializeconfiguration-runtime-configstate-commandstate-src-mq3-platform-engine-loop-ml-332429321"></a>
### initializeConfiguration

```ml
function initializeConfiguration(runtime, configState, commandState)
```

Completes the common startup portion after cvars, commands, filesystem and client input have initialized.  Baseq3 registers writeconfig during Com_Init and only enables automatic writes at the very end of that routine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.configState`, `runtime.commandState`. |
| `configState` | `dynamic` | — | Mutable record or buffer; this call updates `configState.fullyInitialized`. |
| `commandState` | `dynamic` | — | Value assigned to `runtime.commandState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L35)

<a id="function-function-mq3-platform-engine-loop-liveservices-function-liveservices-runtime-serveringress-src-mq3-platform-engine-loop-ml-1529702480"></a>
### liveServices

```ml
function liveServices(runtime, serverIngress)
```

Returns `desktopHost.liveServicesWithCommon(serverIngress,runtime,commonTick,serverTick,clientTick)` from `mq3.platform.engine_loop.liveServices`; earlier branches return `error(7120,"engine loop: missing live component")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 2 supplied to `mq3.platform.desktop_frame_host.liveServicesWithCommon`. |
| `serverIngress` | `dynamic` | — | Argument 1 supplied to `mq3.platform.desktop_frame_host.liveServicesWithCommon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L82)

- [mq3.platform.engine_loop.Runtime](Type-mq3-platform-engine-loop-runtime-932181352.md) — struct
<a id="function-function-mq3-platform-engine-loop-servertick-function-servertick-runtime-time-msec-src-mq3-platform-engine-loop-ml-30592809"></a>
### serverTick

```ml
function serverTick(runtime, time, msec)
```

desktop_frame_host calls this after the network pump, preserving Quake's event-before-simulation rule.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.inputCount`, `runtime.lastServerResult`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.engine_loop.commonTick`. |
| `msec` | `dynamic` | — | Argument 2 supplied to `mq3.server.frame.run`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L58)
