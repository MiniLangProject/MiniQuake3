# `src/mq3/server/game_vm.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.game_vm`](Package-mq3-server-game-vm-701758425.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/g_public.ml` as `gpublic` → [src/mq3/game/g_public.ml](File-src-mq3-game-g-public-ml-554411541.md)

## Declarations

<a id="constant-constant-mq3-server-game-vm-botai-start-frame-const-botai-start-frame-gpublic-botai-start-frame-src-mq3-server-game-vm-ml-2126319135"></a>
### BOTAI_START_FRAME

```ml
const BOTAI_START_FRAME = gpublic.BOTAI_START_FRAME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L17)

<a id="function-function-mq3-server-game-vm-botstartframe-function-botstartframe-state-time-src-mq3-server-game-vm-ml-363876168"></a>
### botStartFrame

```ml
function botStartFrame(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L124)

<a id="function-function-mq3-server-game-vm-clientbegin-function-clientbegin-state-clientnum-src-mq3-server-game-vm-ml-1911289052"></a>
### clientBegin

```ml
function clientBegin(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L117)

<a id="function-function-mq3-server-game-vm-clientcommand-function-clientcommand-state-clientnum-src-mq3-server-game-vm-ml-224550596"></a>
### clientCommand

```ml
function clientCommand(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L120)

<a id="function-function-mq3-server-game-vm-clientconnect-function-clientconnect-state-clientnum-firsttime-isbot-src-mq3-server-game-vm-ml-1787140466"></a>
### clientConnect

```ml
function clientConnect(state, clientNum, firstTime, isBot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `firstTime` | `dynamic` | — |  |
| `isBot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L113)

<a id="function-function-mq3-server-game-vm-clientdisconnect-function-clientdisconnect-state-clientnum-src-mq3-server-game-vm-ml-210481968"></a>
### clientDisconnect

```ml
function clientDisconnect(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L119)

<a id="function-function-mq3-server-game-vm-clientthink-function-clientthink-state-clientnum-src-mq3-server-game-vm-ml-1097927302"></a>
### clientThink

```ml
function clientThink(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L121)

<a id="function-function-mq3-server-game-vm-clientuserinfochanged-function-clientuserinfochanged-state-clientnum-src-mq3-server-game-vm-ml-1384716708"></a>
### clientUserinfoChanged

```ml
function clientUserinfoChanged(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L118)

<a id="function-function-mq3-server-game-vm-consolecommand-function-consolecommand-state-src-mq3-server-game-vm-ml-93360595"></a>
### consoleCommand

```ml
function consoleCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L123)

<a id="function-function-mq3-server-game-vm-create-function-create-host-src-mq3-server-game-vm-ml-161339800"></a>
### create

```ml
function create(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L48)

<a id="constant-constant-mq3-server-game-vm-game-client-begin-const-game-client-begin-gpublic-game-client-begin-src-mq3-server-game-vm-ml-793566067"></a>
### GAME_CLIENT_BEGIN

```ml
const GAME_CLIENT_BEGIN = gpublic.GAME_CLIENT_BEGIN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L10)

<a id="constant-constant-mq3-server-game-vm-game-client-command-const-game-client-command-gpublic-game-client-command-src-mq3-server-game-vm-ml-635724519"></a>
### GAME_CLIENT_COMMAND

```ml
const GAME_CLIENT_COMMAND = gpublic.GAME_CLIENT_COMMAND
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L13)

<a id="constant-constant-mq3-server-game-vm-game-client-connect-const-game-client-connect-gpublic-game-client-connect-src-mq3-server-game-vm-ml-190435700"></a>
### GAME_CLIENT_CONNECT

```ml
const GAME_CLIENT_CONNECT = gpublic.GAME_CLIENT_CONNECT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L9)

<a id="constant-constant-mq3-server-game-vm-game-client-disconnect-const-game-client-disconnect-gpublic-game-client-disconnect-src-mq3-server-game-vm-ml-1504075784"></a>
### GAME_CLIENT_DISCONNECT

```ml
const GAME_CLIENT_DISCONNECT = gpublic.GAME_CLIENT_DISCONNECT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L12)

<a id="constant-constant-mq3-server-game-vm-game-client-think-const-game-client-think-gpublic-game-client-think-src-mq3-server-game-vm-ml-1956820026"></a>
### GAME_CLIENT_THINK

```ml
const GAME_CLIENT_THINK = gpublic.GAME_CLIENT_THINK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L14)

<a id="constant-constant-mq3-server-game-vm-game-client-userinfo-changed-const-game-client-userinfo-changed-gpublic-game-client-userinfo-changed-src-mq3-server-game-vm-ml-367339542"></a>
### GAME_CLIENT_USERINFO_CHANGED

```ml
const GAME_CLIENT_USERINFO_CHANGED = gpublic.GAME_CLIENT_USERINFO_CHANGED
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L11)

<a id="constant-constant-mq3-server-game-vm-game-console-command-const-game-console-command-gpublic-game-console-command-src-mq3-server-game-vm-ml-1124266619"></a>
### GAME_CONSOLE_COMMAND

```ml
const GAME_CONSOLE_COMMAND = gpublic.GAME_CONSOLE_COMMAND
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L16)

<a id="constant-constant-mq3-server-game-vm-game-init-const-game-init-gpublic-game-init-src-mq3-server-game-vm-ml-1231343152"></a>
### GAME_INIT

```ml
const GAME_INIT = gpublic.GAME_INIT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L7)

<a id="constant-constant-mq3-server-game-vm-game-run-frame-const-game-run-frame-gpublic-game-run-frame-src-mq3-server-game-vm-ml-1124556579"></a>
### GAME_RUN_FRAME

```ml
const GAME_RUN_FRAME = gpublic.GAME_RUN_FRAME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L15)

<a id="constant-constant-mq3-server-game-vm-game-shutdown-const-game-shutdown-gpublic-game-shutdown-src-mq3-server-game-vm-ml-720573976"></a>
### GAME_SHUTDOWN

```ml
const GAME_SHUTDOWN = gpublic.GAME_SHUTDOWN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L8)

<a id="function-function-mq3-server-game-vm-initialize-function-initialize-state-leveltime-maxclients-src-mq3-server-game-vm-ml-1679926632"></a>
### initialize

```ml
function initialize(state, levelTime, maxClients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L78)

<a id="function-function-mq3-server-game-vm-initializevm-function-initializevm-state-leveltime-maxclients-restart-src-mq3-server-game-vm-ml-990697631"></a>
### initializeVm

```ml
function initializeVm(state, levelTime, maxClients, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L66)

<a id="function-function-mq3-server-game-vm-invoke-function-invoke-state-arguments-src-mq3-server-game-vm-ml-317852643"></a>
### invoke

```ml
function invoke(state, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L58)

<a id="function-function-mq3-server-game-vm-requireactive-function-requireactive-state-src-mq3-server-game-vm-ml-1164685649"></a>
### requireActive

```ml
function requireActive(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L53)

<a id="function-function-mq3-server-game-vm-restart-function-restart-state-leveltime-maxclients-src-mq3-server-game-vm-ml-1346892674"></a>
### restart

```ml
function restart(state, levelTime, maxClients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L90)

<a id="function-function-mq3-server-game-vm-runframe-function-runframe-state-leveltime-src-mq3-server-game-vm-ml-628895402"></a>
### runFrame

```ml
function runFrame(state, levelTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L122)

<a id="function-function-mq3-server-game-vm-services-function-services-machineruntime-syscall-loadfn-callfn-restartfn-freefn-src-mq3-server-game-vm-ml-1924673957"></a>
### services

```ml
function services(machineRuntime, syscall, loadFn, callFn, restartFn, freeFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |
| `loadFn` | `dynamic` | — |  |
| `callFn` | `dynamic` | — |  |
| `restartFn` | `dynamic` | — |  |
| `freeFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L44)

- [mq3.server.game_vm.Services](Type-mq3-server-game-vm-services-352231525.md) — struct
<a id="function-function-mq3-server-game-vm-shutdown-function-shutdown-state-src-mq3-server-game-vm-ml-1146187267"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_vm.ml#L104)

- [mq3.server.game_vm.State](Type-mq3-server-game-vm-state-1588325990.md) — struct
