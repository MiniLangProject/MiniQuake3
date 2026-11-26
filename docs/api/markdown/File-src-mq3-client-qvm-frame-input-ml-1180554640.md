# `src/mq3/client/qvm_frame_input.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.qvm_frame_input`](Package-mq3-client-qvm-frame-input-168035024.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/command_ring.ml` as `qvmFrameRing` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/input_command.ml` as `qvmFrameCommands` → [src/mq3/client/input_command.ml](File-src-mq3-client-input-command-ml-1980603655.md)
- `mq3/client/input_command_events.ml` as `qvmFrameEvents` → [src/mq3/client/input_command_events.ml](File-src-mq3-client-input-command-events-ml-1691230747.md)
- `mq3/client/key_binding_dispatch.ml` as `qvmFrameBindings` → [src/mq3/client/key_binding_dispatch.ml](File-src-mq3-client-key-binding-dispatch-ml-676068433.md)
- `mq3/compat/numeric.ml` as `qvmFrameNumeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/cvar.ml` as `qvmFrameCvars` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/vm/syscall_qagame_world.ml` as `qvmFrameWorld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)

## Declarations

<a id="function-function-mq3-client-qvm-frame-input-applybound-function-applybound-state-plan-time-type-value-value2-binding-catchers-src-mq3-client-qvm-frame-input-ml-969840679"></a>
### applyBound

```ml
function applyBound(state, plan, time, type, value, value2, binding, catchers)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `plan` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `binding` | `dynamic` | — |  |
| `catchers` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L52)

<a id="function-function-mq3-client-qvm-frame-input-bindconfig-function-bindconfig-state-registry-src-mq3-client-qvm-frame-input-ml-2124100812"></a>
### bindConfig

```ml
function bindConfig(state, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L31)

<a id="function-function-mq3-client-qvm-frame-input-commandtime-function-commandtime-state-clockservertime-clockactive-src-mq3-client-qvm-frame-input-ml-603994565"></a>
### commandTime

```ml
function commandTime(state, clockServerTime, clockActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clockServerTime` | `dynamic` | — |  |
| `clockActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L80)

<a id="function-function-mq3-client-qvm-frame-input-create-function-create-worldangles-deltaangles-realtime-commandtime-src-mq3-client-qvm-frame-input-ml-1490664165"></a>
### create

```ml
function create(worldAngles, deltaAngles, realtime, commandTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldAngles` | `dynamic` | — |  |
| `deltaAngles` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `commandTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L18)

<a id="function-function-mq3-client-qvm-frame-input-fail-function-fail-text-src-mq3-client-qvm-frame-input-ml-418147351"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L17)

<a id="function-function-mq3-client-qvm-frame-input-finish-function-finish-state-plan-servertime-weapon-sensitivity-catchers-anykeydown-src-mq3-client-qvm-frame-input-ml-772820475"></a>
### finish

```ml
function finish(state, plan, serverTime, weapon, sensitivity, catchers, anyKeyDown)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `plan` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `sensitivity` | `dynamic` | — |  |
| `catchers` | `dynamic` | — |  |
| `anyKeyDown` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L84)

<a id="function-function-mq3-client-qvm-frame-input-handlesaction-function-handlesaction-state-action-src-mq3-client-qvm-frame-input-ml-1074363809"></a>
### handlesAction

```ml
function handlesAction(state, action)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `action` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L32)

<a id="constant-constant-mq3-client-qvm-frame-input-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-qvm-frame-input-ml-1574884663"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L14)

<a id="constant-constant-mq3-client-qvm-frame-input-keycatch-console-const-keycatch-console-1-src-mq3-client-qvm-frame-input-ml-1686482312"></a>
### KEYCATCH_CONSOLE

```ml
const KEYCATCH_CONSOLE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L12)

<a id="constant-constant-mq3-client-qvm-frame-input-keycatch-ui-const-keycatch-ui-2-src-mq3-client-qvm-frame-input-ml-1154261135"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L13)

<a id="function-function-mq3-client-qvm-frame-input-keyup-function-keyup-button-key-time-framemsec-src-mq3-client-qvm-frame-input-ml-1096930103"></a>
### keyUp

```ml
function keyUp(button, key, time, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L44)

- [mq3.client.qvm_frame_input.Plan](Type-mq3-client-qvm-frame-input-plan-1320632033.md) — struct
<a id="function-function-mq3-client-qvm-frame-input-prepare-function-prepare-state-realtime-commandnumber-connectionstate-serverrunning-serverpaused-clientpaused-src-mq3-client-qvm-frame-input-ml-358397483"></a>
### prepare

```ml
function prepare(state, realtime, commandNumber, connectionState, serverRunning, serverPaused, clientPaused)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `commandNumber` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `serverRunning` | `dynamic` | — |  |
| `serverPaused` | `dynamic` | — |  |
| `clientPaused` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L37)

<a id="function-function-mq3-client-qvm-frame-input-registerconfig-function-registerconfig-registry-src-mq3-client-qvm-frame-input-ml-407706775"></a>
### registerConfig

```ml
function registerConfig(registry)
```

Original CL_Init cvars are retained as objects. UI writes become visible on the next command without per-frame registry lookups or allocations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L28)

<a id="function-function-mq3-client-qvm-frame-input-releaseall-function-releaseall-state-plan-time-src-mq3-client-qvm-frame-input-ml-530284015"></a>
### releaseAll

```ml
function releaseAll(state, plan, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `plan` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L71)

- [mq3.client.qvm_frame_input.State](Type-mq3-client-qvm-frame-input-state-1456937071.md) — struct
<a id="function-function-mq3-client-qvm-frame-input-syncconfig-function-syncconfig-state-src-mq3-client-qvm-frame-input-ml-85415273"></a>
### syncConfig

```ml
function syncConfig(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L33)
