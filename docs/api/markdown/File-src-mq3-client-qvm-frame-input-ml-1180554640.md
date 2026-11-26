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

Updates `state.input.mlooking` during QVM frame input `applyBound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `state.input.mlooking`. |
| `plan` | `dynamic` | — | Record read through `plan.rawMsec`. |
| `time` | `dynamic` | — | Value used by `if time<0 then return fail("negative event time") end if`. |
| `type` | `dynamic` | — | Value used by `if type==qvmFrameEvents.INPUT_MOUSE then`. |
| `value` | `dynamic` | — | Value used by `accumulated=qvmFrameCommands.accumulateMouse(state.input,value,value2)`. |
| `value2` | `dynamic` | — | Value used by `accumulated=qvmFrameCommands.accumulateMouse(state.input,value,value2)`. |
| `binding` | `dynamic` | — | Command text associated with an input key. |
| `catchers` | `dynamic` | — | Value used by `if (catchers&(KEYCATCH_CONSOLE\|KEYCATCH_UI\|KEYCATCH_CGAME))!=0 then return [] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L140)

<a id="function-function-mq3-client-qvm-frame-input-bindconfig-function-bindconfig-state-registry-src-mq3-client-qvm-frame-input-ml-2124100812"></a>
### bindConfig

```ml
function bindConfig(state, registry)
```

Updates `state.variables` during QVM frame input `bindConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `state.variables`. |
| `registry` | `dynamic` | — | Value used by `state.variables=registerConfig(registry)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L92)

<a id="function-function-mq3-client-qvm-frame-input-commandtime-function-commandtime-state-clockservertime-clockactive-src-mq3-client-qvm-frame-input-ml-603994565"></a>
### commandTime

```ml
function commandTime(state, clockServerTime, clockActive)
```

Evaluates QVM frame input `commandTime` and returns `state.lastCommandTime`, `fail("negative command server time")`, `clockServerTime` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lastCommandTime`. |
| `clockServerTime` | `dynamic` | — | Value used by `if clockServerTime<0 then return fail("negative command server time") end if`. |
| `clockActive` | `dynamic` | — | Value used by `if not clockActive then return state.lastCommandTime end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L176)

<a id="function-function-mq3-client-qvm-frame-input-create-function-create-worldangles-deltaangles-realtime-commandtime-src-mq3-client-qvm-frame-input-ml-1490664165"></a>
### create

```ml
function create(worldAngles, deltaAngles, realtime, commandTime)
```

Calls `mq3.compat.numeric.f32`, `mq3.compat.numeric.i16`, `mq3.client.qvm_frame_input.State` and additional helpers from QVM frame input `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldAngles` | `dynamic` | — | Sequence read at `worldAngles[axis]`. |
| `deltaAngles` | `dynamic` | — | Sequence read at `deltaAngles[axis]`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `commandTime` | `dynamic` | — | Value used by `if len(worldAngles)!=3 or len(deltaAngles)!=3 or realtime<0 or commandTime<0 then return fail("invalid initial view/time") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L75)

<a id="function-function-mq3-client-qvm-frame-input-fail-function-fail-text-src-mq3-client-qvm-frame-input-ml-418147351"></a>
### fail

```ml
function fail(text)
```

Creates the QVM frame input error `7696` with diagnostic text `"client frame input: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 2 of `error`; passed as `"client frame input: "+text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L69)

<a id="function-function-mq3-client-qvm-frame-input-finish-function-finish-state-plan-servertime-weapon-sensitivity-catchers-anykeydown-src-mq3-client-qvm-frame-input-ml-772820475"></a>
### finish

```ml
function finish(state, plan, serverTime, weapon, sensitivity, catchers, anyKeyDown)
```

Updates `plan.used`, `state.epochs`, `state.oldFrameTime`, `state.lastCommandTime` and additional values during QVM frame input `finish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `state.epochs`, `state.oldFrameTime`, `state.lastCommandTime`, `state.produced`. |
| `plan` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `plan.used`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `weapon` | `dynamic` | — | Value used by `created=qvmFrameCommands.createCommand(state.input,state.config,plan.realtime,plan.integrationMsec,serverTime,weapon,sensitivity,catchers,anyK...`. |
| `sensitivity` | `dynamic` | — | Value used by `created=qvmFrameCommands.createCommand(state.input,state.config,plan.realtime,plan.integrationMsec,serverTime,weapon,sensitivity,catchers,anyK...`. |
| `catchers` | `dynamic` | — | Value used by `created=qvmFrameCommands.createCommand(state.input,state.config,plan.realtime,plan.integrationMsec,serverTime,weapon,sensitivity,catchers,anyK...`. |
| `anyKeyDown` | `dynamic` | — | Value used by `created=qvmFrameCommands.createCommand(state.input,state.config,plan.realtime,plan.integrationMsec,serverTime,weapon,sensitivity,catchers,anyK...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L188)

<a id="function-function-mq3-client-qvm-frame-input-handlesaction-function-handlesaction-state-action-src-mq3-client-qvm-frame-input-ml-1074363809"></a>
### handlesAction

```ml
function handlesAction(state, action)
```

Computes `action=="mlook" or qvmFrameEvents.actionButton(state.input,action)!=void` for QVM frame input `handlesAction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.input`. |
| `action` | `dynamic` | — | Value used by `return action=="mlook" or qvmFrameEvents.actionButton(state.input,action)!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L96)

<a id="constant-constant-mq3-client-qvm-frame-input-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-qvm-frame-input-ml-1574884663"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```

Input-capture bit that routes keyboard events to the cgame subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L18)

<a id="constant-constant-mq3-client-qvm-frame-input-keycatch-console-const-keycatch-console-1-src-mq3-client-qvm-frame-input-ml-1686482312"></a>
### KEYCATCH_CONSOLE

```ml
const KEYCATCH_CONSOLE = 1
```

Input-capture bit that routes keyboard events to the console subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L13)

<a id="constant-constant-mq3-client-qvm-frame-input-keycatch-ui-const-keycatch-ui-2-src-mq3-client-qvm-frame-input-ml-1154261135"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when preventing gameplay key expansion while the QVM menu captures input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L16)

<a id="function-function-mq3-client-qvm-frame-input-keyup-function-keyup-button-key-time-framemsec-src-mq3-client-qvm-frame-input-ml-1096930103"></a>
### keyUp

```ml
function keyUp(button, key, time, frameMsec)
```

Updates `button.down0`, `button.down1`, `button.active`, `button.msec` during QVM frame input `keyUp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `button.down0`, `button.down1`, `button.active`, `button.msec`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding QVM frame input entry. |
| `time` | `dynamic` | — | Value used by `if time!=0 then button.msec=button.msec+time-button.downtime else button.msec=button.msec+(frameMsec>>1) end if`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L123)

- [mq3.client.qvm_frame_input.Plan](Type-mq3-client-qvm-frame-input-plan-1320632033.md) — struct
<a id="function-function-mq3-client-qvm-frame-input-prepare-function-prepare-state-realtime-commandnumber-connectionstate-serverrunning-serverpaused-clientpaused-src-mq3-client-qvm-frame-input-ml-358397483"></a>
### prepare

```ml
function prepare(state, realtime, commandNumber, connectionState, serverRunning, serverPaused, clientPaused)
```

Updates `state.sequence` during QVM frame input `prepare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `state.sequence`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `commandNumber` | `dynamic` | — | Value used by `if serverRunning and serverPaused and clientPaused then return Plan(realtime,0,1,commandNumber,false,state.sequence,false) end if`. |
| `connectionState` | `dynamic` | — | Value used by `advanced=qvmFrameRing.advance(connectionState,realtime,state.oldFrameTime,commandNumber)`. |
| `serverRunning` | `dynamic` | — | Value used by `if serverRunning and serverPaused and clientPaused then return Plan(realtime,0,1,commandNumber,false,state.sequence,false) end if`. |
| `serverPaused` | `dynamic` | — | Value used by `if serverRunning and serverPaused and clientPaused then return Plan(realtime,0,1,commandNumber,false,state.sequence,false) end if`. |
| `clientPaused` | `dynamic` | — | Value used by `if serverRunning and serverPaused and clientPaused then return Plan(realtime,0,1,commandNumber,false,state.sequence,false) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L111)

<a id="function-function-mq3-client-qvm-frame-input-registerconfig-function-registerconfig-registry-src-mq3-client-qvm-frame-input-ml-407706775"></a>
### registerConfig

```ml
function registerConfig(registry)
```

Original CL_Init cvars are retained as objects. UI writes become visible on the next command without per-frame registry lookups or allocations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `return [qvmFrameCvars.get(registry,"cl_yawspeed","140",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"cl_pitchspeed","140",qvmFrameCvars.A...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L86)

<a id="function-function-mq3-client-qvm-frame-input-releaseall-function-releaseall-state-plan-time-src-mq3-client-qvm-frame-input-ml-530284015"></a>
### releaseAll

```ml
function releaseAll(state, plan, time)
```

Updates `state.input.mlooking` during QVM frame input `releaseAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable QVM frame input record/storage; this routine assigns `state.input.mlooking`. |
| `plan` | `dynamic` | — | Record read through `plan.rawMsec`. |
| `time` | `dynamic` | — | Value used by `if button.down0!=0 then keyUp(button,button.down0,time,plan.rawMsec) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L163)

- [mq3.client.qvm_frame_input.State](Type-mq3-client-qvm-frame-input-state-1456937071.md) — struct
<a id="function-function-mq3-client-qvm-frame-input-syncconfig-function-syncconfig-state-src-mq3-client-qvm-frame-input-ml-85415273"></a>
### syncConfig

```ml
function syncConfig(state)
```

Evaluates QVM frame input `syncConfig` and returns `false`, `true` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.variables`, `state.config`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_frame_input.ml#L99)
