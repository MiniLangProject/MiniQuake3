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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L17)

<a id="function-function-mq3-server-game-vm-botstartframe-function-botstartframe-state-time-src-mq3-server-game-vm-ml-363876168"></a>
### botStartFrame

```ml
function botStartFrame(state, time)
```

Return `mq3.server.game_vm.invoke(state, [BOTAI_START_FRAME, time])` from `server.game_vm.botStartFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `time` | `dynamic` | — | Time used in `invoke(state, [BOTAI_START_FRAME, time])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L202)

<a id="function-function-mq3-server-game-vm-clientbegin-function-clientbegin-state-clientnum-src-mq3-server-game-vm-ml-1911289052"></a>
### clientBegin

```ml
function clientBegin(state, clientNum)
```

Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_BEGIN, clientNum])` from `server.game_vm.clientBegin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `clientNum` | `dynamic` | — | Client num used in `invoke(state, [GAME_CLIENT_BEGIN, clientNum])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L175)

<a id="function-function-mq3-server-game-vm-clientcommand-function-clientcommand-state-clientnum-src-mq3-server-game-vm-ml-224550596"></a>
### clientCommand

```ml
function clientCommand(state, clientNum)
```

Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_COMMAND, clientNum])` from `server.game_vm.clientCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `clientNum` | `dynamic` | — | Client num used in `invoke(state, [GAME_CLIENT_COMMAND, clientNum])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L187)

<a id="function-function-mq3-server-game-vm-clientconnect-function-clientconnect-state-clientnum-firsttime-isbot-src-mq3-server-game-vm-ml-1787140466"></a>
### clientConnect

```ml
function clientConnect(state, clientNum, firstTime, isBot)
```

Compute client connect in server.game_vm; the normal completion returns `invoke(state, [GAME_CLIENT_CONNECT, clientNum, first, bot])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `clientNum` | `dynamic` | — | Client num used in `invoke(state, [GAME_CLIENT_CONNECT, clientNum, first, bot])`. |
| `firstTime` | `dynamic` | — | First time operand used by `clientConnect`; its reads are shown in the implementation. |
| `isBot` | `dynamic` | — | Is bot operand used by `clientConnect`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L168)

<a id="function-function-mq3-server-game-vm-clientdisconnect-function-clientdisconnect-state-clientnum-src-mq3-server-game-vm-ml-210481968"></a>
### clientDisconnect

```ml
function clientDisconnect(state, clientNum)
```

Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_DISCONNECT, clientNum])` from `server.game_vm.clientDisconnect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `clientNum` | `dynamic` | — | Client num used in `invoke(state, [GAME_CLIENT_DISCONNECT, clientNum])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L183)

<a id="function-function-mq3-server-game-vm-clientthink-function-clientthink-state-clientnum-src-mq3-server-game-vm-ml-1097927302"></a>
### clientThink

```ml
function clientThink(state, clientNum)
```

Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_THINK, clientNum])` from `server.game_vm.clientThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `clientNum` | `dynamic` | — | Client num used in `invoke(state, [GAME_CLIENT_THINK, clientNum])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L191)

<a id="function-function-mq3-server-game-vm-clientuserinfochanged-function-clientuserinfochanged-state-clientnum-src-mq3-server-game-vm-ml-1384716708"></a>
### clientUserinfoChanged

```ml
function clientUserinfoChanged(state, clientNum)
```

Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_USERINFO_CHANGED, clientNum])` from `server.game_vm.clientUserinfoChanged`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `clientNum` | `dynamic` | — | Client num used in `invoke(state, [GAME_CLIENT_USERINFO_CHANGED, clientNum])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L179)

<a id="function-function-mq3-server-game-vm-consolecommand-function-consolecommand-state-src-mq3-server-game-vm-ml-93360595"></a>
### consoleCommand

```ml
function consoleCommand(state)
```

Return `mq3.server.game_vm.invoke(state, [GAME_CONSOLE_COMMAND])` from `server.game_vm.consoleCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L198)

<a id="function-function-mq3-server-game-vm-create-function-create-host-src-mq3-server-game-vm-ml-161339800"></a>
### create

```ml
function create(host)
```

Create game vm in server.game_vm; the normal completion returns `State(host, void, false, void, 0, 0, - 1, [])`.

Validation failures include `game VM: missing runtime service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `machineRuntime`, `syscall`, `loadFn`, `callFn`, `restartFn`, `freeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L61)

<a id="constant-constant-mq3-server-game-vm-game-client-begin-const-game-client-begin-gpublic-game-client-begin-src-mq3-server-game-vm-ml-793566067"></a>
### GAME_CLIENT_BEGIN

```ml
const GAME_CLIENT_BEGIN = gpublic.GAME_CLIENT_BEGIN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L10)

<a id="constant-constant-mq3-server-game-vm-game-client-command-const-game-client-command-gpublic-game-client-command-src-mq3-server-game-vm-ml-635724519"></a>
### GAME_CLIENT_COMMAND

```ml
const GAME_CLIENT_COMMAND = gpublic.GAME_CLIENT_COMMAND
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L13)

<a id="constant-constant-mq3-server-game-vm-game-client-connect-const-game-client-connect-gpublic-game-client-connect-src-mq3-server-game-vm-ml-190435700"></a>
### GAME_CLIENT_CONNECT

```ml
const GAME_CLIENT_CONNECT = gpublic.GAME_CLIENT_CONNECT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L9)

<a id="constant-constant-mq3-server-game-vm-game-client-disconnect-const-game-client-disconnect-gpublic-game-client-disconnect-src-mq3-server-game-vm-ml-1504075784"></a>
### GAME_CLIENT_DISCONNECT

```ml
const GAME_CLIENT_DISCONNECT = gpublic.GAME_CLIENT_DISCONNECT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L12)

<a id="constant-constant-mq3-server-game-vm-game-client-think-const-game-client-think-gpublic-game-client-think-src-mq3-server-game-vm-ml-1956820026"></a>
### GAME_CLIENT_THINK

```ml
const GAME_CLIENT_THINK = gpublic.GAME_CLIENT_THINK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L14)

<a id="constant-constant-mq3-server-game-vm-game-client-userinfo-changed-const-game-client-userinfo-changed-gpublic-game-client-userinfo-changed-src-mq3-server-game-vm-ml-367339542"></a>
### GAME_CLIENT_USERINFO_CHANGED

```ml
const GAME_CLIENT_USERINFO_CHANGED = gpublic.GAME_CLIENT_USERINFO_CHANGED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L11)

<a id="constant-constant-mq3-server-game-vm-game-console-command-const-game-console-command-gpublic-game-console-command-src-mq3-server-game-vm-ml-1124266619"></a>
### GAME_CONSOLE_COMMAND

```ml
const GAME_CONSOLE_COMMAND = gpublic.GAME_CONSOLE_COMMAND
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L16)

<a id="constant-constant-mq3-server-game-vm-game-init-const-game-init-gpublic-game-init-src-mq3-server-game-vm-ml-1231343152"></a>
### GAME_INIT

```ml
const GAME_INIT = gpublic.GAME_INIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L7)

<a id="constant-constant-mq3-server-game-vm-game-run-frame-const-game-run-frame-gpublic-game-run-frame-src-mq3-server-game-vm-ml-1124556579"></a>
### GAME_RUN_FRAME

```ml
const GAME_RUN_FRAME = gpublic.GAME_RUN_FRAME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L15)

<a id="constant-constant-mq3-server-game-vm-game-shutdown-const-game-shutdown-gpublic-game-shutdown-src-mq3-server-game-vm-ml-720573976"></a>
### GAME_SHUTDOWN

```ml
const GAME_SHUTDOWN = gpublic.GAME_SHUTDOWN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L8)

<a id="function-function-mq3-server-game-vm-initialize-function-initialize-state-leveltime-maxclients-src-mq3-server-game-vm-ml-1679926632"></a>
### initialize

```ml
function initialize(state, levelTime, maxClients)
```

Update `state.botEnable`, `state.slot`, `state.active` in server.game_vm; the normal completion returns `state.slot`.

Validation failures include `game VM: invalid initialization`; `game VM: module load failed`.
Direct state writes: `state.botEnable`, `state.slot`, `state.active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `host`, `slot`. Updated in place: `botEnable`, `slot`, `active`. |
| `levelTime` | `dynamic` | — | Level time passed as `levelTime` to `mq3.server.game_vm.initializeVm`. |
| `maxClients` | `dynamic` | — | Max clients passed as `maxClients` to `mq3.server.game_vm.initializeVm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L116)

<a id="function-function-mq3-server-game-vm-initializevm-function-initializevm-state-leveltime-maxclients-restart-src-mq3-server-game-vm-ml-990697631"></a>
### initializeVm

```ml
function initializeVm(state, levelTime, maxClients, restart)
```

Update `state.entityParsePoint` in server.game_vm; the normal completion returns `invoke(state, [GAME_INIT, levelTime, seed, flag])`.

Validation failures include `game VM: negative client count`.
Direct state writes: `state.entityParsePoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `host`. Updated in place: `entityParsePoint`. |
| `levelTime` | `dynamic` | — | Level time used in `invoke(state, [GAME_INIT, levelTime, seed, flag])`. |
| `maxClients` | `dynamic` | — | Max clients used in `(maxClients < 0)` and `(maxClients - 1)`. |
| `restart` | `dynamic` | — | Restart operand used by `initializeVm`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L97)

<a id="function-function-mq3-server-game-vm-invoke-function-invoke-state-arguments-src-mq3-server-game-vm-ml-317852643"></a>
### invoke

```ml
function invoke(state, arguments)
```

Update `state.callCount`, `state.lastExport`, `state.lastArgs` in server.game_vm; the normal completion returns `host.callFn(host.machineRuntime, slot, arguments)`.

Validation failures include `game VM: missing export`.
Direct state writes: `state.callCount`, `state.lastExport`, `state.lastArgs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `callCount`, `host`. Updated in place: `callCount`, `lastExport`, `lastArgs`. |
| `arguments` | `dynamic` | — | Arguments used in `arguments[0]` and `len(arguments)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L81)

<a id="function-function-mq3-server-game-vm-requireactive-function-requireactive-state-src-mq3-server-game-vm-ml-1164685649"></a>
### requireActive

```ml
function requireActive(state)
```

Compute require active in server.game_vm; the normal completion returns `state.slot`.

Validation failures include `game VM: module is not active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L70)

<a id="function-function-mq3-server-game-vm-restart-function-restart-state-leveltime-maxclients-src-mq3-server-game-vm-ml-1346892674"></a>
### restart

```ml
function restart(state, levelTime, maxClients)
```

Update `state.slot`, `state.active`, `state.entityParsePoint` in server.game_vm; the normal completion returns `state.slot`.

Validation failures include `game VM: module restart failed`.
Direct state writes: `state.slot`, `state.active`, `state.entityParsePoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `host`, `slot`. Updated in place: `slot`, `active`, `entityParsePoint`. |
| `levelTime` | `dynamic` | — | Level time passed as `levelTime` to `mq3.server.game_vm.initializeVm`. |
| `maxClients` | `dynamic` | — | Max clients passed as `maxClients` to `mq3.server.game_vm.initializeVm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L135)

<a id="function-function-mq3-server-game-vm-runframe-function-runframe-state-leveltime-src-mq3-server-game-vm-ml-628895402"></a>
### runFrame

```ml
function runFrame(state, levelTime)
```

Return `mq3.server.game_vm.invoke(state, [GAME_RUN_FRAME, levelTime])` from `server.game_vm.runFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.game_vm.invoke`. |
| `levelTime` | `dynamic` | — | Level time used in `invoke(state, [GAME_RUN_FRAME, levelTime])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L195)

<a id="function-function-mq3-server-game-vm-services-function-services-machineruntime-syscall-loadfn-callfn-restartfn-freefn-src-mq3-server-game-vm-ml-1924673957"></a>
### services

```ml
function services(machineRuntime, syscall, loadFn, callFn, restartFn, freeFn)
```

Create `mq3.server.game_vm.Services` with machineRuntime=machineRuntime; syscall=syscall; loadFn=loadFn; callFn=callFn; 7 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Initial `machineRuntime` field stored in the returned or constructed `mq3.server.game_vm.Services` record. |
| `syscall` | `dynamic` | — | Initial `syscall` field stored in the returned or constructed `mq3.server.game_vm.Services` record. |
| `loadFn` | `dynamic` | — | Initial `loadFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record. |
| `callFn` | `dynamic` | — | Initial `callFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record. |
| `restartFn` | `dynamic` | — | Initial `restartFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record. |
| `freeFn` | `dynamic` | — | Initial `freeFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L53)

- [mq3.server.game_vm.Services](Type-mq3-server-game-vm-services-352231525.md) — struct
<a id="function-function-mq3-server-game-vm-shutdown-function-shutdown-state-src-mq3-server-game-vm-ml-1146187267"></a>
### shutdown

```ml
function shutdown(state)
```

Update `state.slot`, `state.active`, `state.entityParsePoint` in server.game_vm.

Validation failures include `game VM: missing state`.
Direct state writes: `state.slot`, `state.active`, `state.entityParsePoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `host`, `slot`. Updated in place: `slot`, `active`, `entityParsePoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L154)

- [mq3.server.game_vm.State](Type-mq3-server-game-vm-state-1588325990.md) — struct
