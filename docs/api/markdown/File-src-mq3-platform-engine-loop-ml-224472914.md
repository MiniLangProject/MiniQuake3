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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L50)

<a id="function-function-mq3-platform-engine-loop-commontick-function-commontick-runtime-time-src-mq3-platform-engine-loop-ml-1716240505"></a>
### commonTick

```ml
function commonTick(runtime, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L32)

<a id="function-function-mq3-platform-engine-loop-create-function-create-inputqueue-inputhandlers-inputbudget-serverstate-serverservices-clientstate-clientservices-src-mq3-platform-engine-loop-ml-651422523"></a>
### create

```ml
function create(inputQueue, inputHandlers, inputBudget, serverState, serverServices, clientState, clientServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inputQueue` | `dynamic` | — |  |
| `inputHandlers` | `dynamic` | — |  |
| `inputBudget` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `serverServices` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `clientServices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L14)

<a id="function-function-mq3-platform-engine-loop-initializeconfiguration-function-initializeconfiguration-runtime-configstate-commandstate-src-mq3-platform-engine-loop-ml-332429321"></a>
### initializeConfiguration

```ml
function initializeConfiguration(runtime, configState, commandState)
```

Completes the common startup portion after cvars, commands, filesystem and client input have initialized.  Baseq3 registers writeconfig during Com_Init and only enables automatic writes at the very end of that routine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `configState` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L23)

<a id="function-function-mq3-platform-engine-loop-liveservices-function-liveservices-runtime-serveringress-src-mq3-platform-engine-loop-ml-1529702480"></a>
### liveServices

```ml
function liveServices(runtime, serverIngress)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `serverIngress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L57)

- [mq3.platform.engine_loop.Runtime](Type-mq3-platform-engine-loop-runtime-932181352.md) — struct
<a id="function-function-mq3-platform-engine-loop-servertick-function-servertick-runtime-time-msec-src-mq3-platform-engine-loop-ml-30592809"></a>
### serverTick

```ml
function serverTick(runtime, time, msec)
```

desktop_frame_host calls this after the network pump, preserving Quake's event-before-simulation rule.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L40)
