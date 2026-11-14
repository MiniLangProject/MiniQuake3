# `src/mq3/client/cgame_vm.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_vm`](Package-mq3-client-cgame-vm-2024830508.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cgame_public.ml` as `cgame_api` → [src/mq3/client/cgame_public.ml](File-src-mq3-client-cgame-public-ml-173138442.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="constant-constant-mq3-client-cgame-vm-ca-loading-const-ca-loading-6-src-mq3-client-cgame-vm-ml-369678995"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L17)

<a id="constant-constant-mq3-client-cgame-vm-ca-primed-const-ca-primed-7-src-mq3-client-cgame-vm-ml-911953278"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L18)

<a id="constant-constant-mq3-client-cgame-vm-cg-console-command-const-cg-console-command-cgame-api-cg-console-command-src-mq3-client-cgame-vm-ml-224617227"></a>
### CG_CONSOLE_COMMAND

```ml
const CG_CONSOLE_COMMAND = cgame_api.CG_CONSOLE_COMMAND
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L10)

<a id="constant-constant-mq3-client-cgame-vm-cg-crosshair-player-const-cg-crosshair-player-cgame-api-cg-crosshair-player-src-mq3-client-cgame-vm-ml-1372707042"></a>
### CG_CROSSHAIR_PLAYER

```ml
const CG_CROSSHAIR_PLAYER = cgame_api.CG_CROSSHAIR_PLAYER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L12)

<a id="constant-constant-mq3-client-cgame-vm-cg-draw-active-frame-const-cg-draw-active-frame-cgame-api-cg-draw-active-frame-src-mq3-client-cgame-vm-ml-1597176771"></a>
### CG_DRAW_ACTIVE_FRAME

```ml
const CG_DRAW_ACTIVE_FRAME = cgame_api.CG_DRAW_ACTIVE_FRAME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L11)

<a id="constant-constant-mq3-client-cgame-vm-cg-event-handling-const-cg-event-handling-cgame-api-cg-event-handling-src-mq3-client-cgame-vm-ml-878560466"></a>
### CG_EVENT_HANDLING

```ml
const CG_EVENT_HANDLING = cgame_api.CG_EVENT_HANDLING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L16)

<a id="constant-constant-mq3-client-cgame-vm-cg-init-const-cg-init-cgame-api-cg-init-src-mq3-client-cgame-vm-ml-52877792"></a>
### CG_INIT

```ml
const CG_INIT = cgame_api.CG_INIT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L8)

<a id="constant-constant-mq3-client-cgame-vm-cg-key-event-const-cg-key-event-cgame-api-cg-key-event-src-mq3-client-cgame-vm-ml-456195728"></a>
### CG_KEY_EVENT

```ml
const CG_KEY_EVENT = cgame_api.CG_KEY_EVENT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L14)

<a id="constant-constant-mq3-client-cgame-vm-cg-last-attacker-const-cg-last-attacker-cgame-api-cg-last-attacker-src-mq3-client-cgame-vm-ml-1153792818"></a>
### CG_LAST_ATTACKER

```ml
const CG_LAST_ATTACKER = cgame_api.CG_LAST_ATTACKER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L13)

<a id="constant-constant-mq3-client-cgame-vm-cg-mouse-event-const-cg-mouse-event-cgame-api-cg-mouse-event-src-mq3-client-cgame-vm-ml-1562988272"></a>
### CG_MOUSE_EVENT

```ml
const CG_MOUSE_EVENT = cgame_api.CG_MOUSE_EVENT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L15)

<a id="constant-constant-mq3-client-cgame-vm-cg-shutdown-const-cg-shutdown-cgame-api-cg-shutdown-src-mq3-client-cgame-vm-ml-11453784"></a>
### CG_SHUTDOWN

```ml
const CG_SHUTDOWN = cgame_api.CG_SHUTDOWN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L9)

<a id="function-function-mq3-client-cgame-vm-consolecommand-function-consolecommand-state-src-mq3-client-cgame-vm-ml-616699537"></a>
### consoleCommand

```ml
function consoleCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L100)

<a id="function-function-mq3-client-cgame-vm-create-function-create-host-src-mq3-client-cgame-vm-ml-396088774"></a>
### create

```ml
function create(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L56)

<a id="function-function-mq3-client-cgame-vm-crosshairplayer-function-crosshairplayer-state-src-mq3-client-cgame-vm-ml-836076003"></a>
### crosshairPlayer

```ml
function crosshairPlayer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L102)

<a id="function-function-mq3-client-cgame-vm-drawactiveframe-function-drawactiveframe-state-servertime-stereo-demoplaying-src-mq3-client-cgame-vm-ml-42415052"></a>
### drawActiveFrame

```ml
function drawActiveFrame(state, serverTime, stereo, demoPlaying)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `stereo` | `dynamic` | — |  |
| `demoPlaying` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L101)

<a id="function-function-mq3-client-cgame-vm-eventhandling-function-eventhandling-state-eventtype-src-mq3-client-cgame-vm-ml-1124358201"></a>
### eventHandling

```ml
function eventHandling(state, eventType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `eventType` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L106)

<a id="function-function-mq3-client-cgame-vm-initialize-function-initialize-state-servermessagesequence-lastexecutedservercommand-clientnum-connectedtopureserver-vmcgame-src-mq3-client-cgame-vm-ml-1404519605"></a>
### initialize

```ml
function initialize(state, serverMessageSequence, lastExecutedServerCommand, clientNum, connectedToPureServer, vmCgame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverMessageSequence` | `dynamic` | — |  |
| `lastExecutedServerCommand` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `connectedToPureServer` | `dynamic` | — |  |
| `vmCgame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L73)

<a id="function-function-mq3-client-cgame-vm-invoke-function-invoke-state-arguments-src-mq3-client-cgame-vm-ml-182333903"></a>
### invoke

```ml
function invoke(state, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L66)

<a id="constant-constant-mq3-client-cgame-vm-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-cgame-vm-ml-626104207"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L19)

<a id="function-function-mq3-client-cgame-vm-keyevent-function-keyevent-state-key-down-src-mq3-client-cgame-vm-ml-686265128"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L104)

<a id="function-function-mq3-client-cgame-vm-lastattacker-function-lastattacker-state-src-mq3-client-cgame-vm-ml-2110900645"></a>
### lastAttacker

```ml
function lastAttacker(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L103)

<a id="function-function-mq3-client-cgame-vm-mouseevent-function-mouseevent-state-dx-dy-src-mq3-client-cgame-vm-ml-204175518"></a>
### mouseEvent

```ml
function mouseEvent(state, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L105)

<a id="function-function-mq3-client-cgame-vm-requireactive-function-requireactive-state-src-mq3-client-cgame-vm-ml-1098689595"></a>
### requireActive

```ml
function requireActive(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L61)

<a id="function-function-mq3-client-cgame-vm-services-function-services-machineruntime-syscall-loadfn-callfn-freefn-src-mq3-client-cgame-vm-ml-1189372574"></a>
### services

```ml
function services(machineRuntime, syscall, loadFn, callFn, freeFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |
| `loadFn` | `dynamic` | — |  |
| `callFn` | `dynamic` | — |  |
| `freeFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L52)

- [mq3.client.cgame_vm.Services](Type-mq3-client-cgame-vm-services-658579082.md) — struct
<a id="function-function-mq3-client-cgame-vm-shutdown-function-shutdown-state-src-mq3-client-cgame-vm-ml-1298521289"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L92)

- [mq3.client.cgame_vm.State](Type-mq3-client-cgame-vm-state-434676315.md) — struct
<a id="constant-constant-mq3-client-cgame-vm-vmi-compiled-const-vmi-compiled-2-src-mq3-client-cgame-vm-ml-1448107185"></a>
### VMI_COMPILED

```ml
const VMI_COMPILED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_vm.ml#L20)
