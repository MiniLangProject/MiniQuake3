# `src/mq3/client/ui_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_main`](Package-mq3-client-ui-main-791166769.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-main-arg-function-arg-args-index-src-mq3-client-ui-main-ml-203050677"></a>
### arg

```ml
function arg(args, index)
```

Evaluates UI main `arg` and returns `0`, `args[index]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Sequence read at `args[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(args)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L145)

<a id="function-function-mq3-client-ui-main-create-function-create-retailqvmactive-src-mq3-client-ui-main-ml-1582222863"></a>
### create

```ml
function create(retailQvmActive)
```

Creates a `mq3.client.ui_main.State` record. Assigns `retailQvmActive` from `retailQvmActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailQvmActive` | `dynamic` | — | Value used to initialize `State.retailQvmActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L134)

<a id="constant-constant-mq3-client-ui-main-cvar-archive-const-cvar-archive-1-src-mq3-client-ui-main-ml-109240264"></a>
### CVAR_ARCHIVE

```ml
const CVAR_ARCHIVE = 1
```

Configuration-variable attribute that persists the value in the user's saved configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L31)

<a id="constant-constant-mq3-client-ui-main-cvar-init-const-cvar-init-16-src-mq3-client-ui-main-ml-1128840638"></a>
### CVAR_INIT

```ml
const CVAR_INIT = 16
```

Configuration-variable attribute allowing initialization-time assignment but rejecting later ordinary changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L34)

<a id="constant-constant-mq3-client-ui-main-cvar-latch-const-cvar-latch-32-src-mq3-client-ui-main-ml-1731694728"></a>
### CVAR_LATCH

```ml
const CVAR_LATCH = 32
```

Configuration-variable attribute deferring a changed value until the relevant restart or reinitialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L37)

<a id="constant-constant-mq3-client-ui-main-cvar-rom-const-cvar-rom-64-src-mq3-client-ui-main-ml-2045725531"></a>
### CVAR_ROM

```ml
const CVAR_ROM = 64
```

Configuration-variable attribute restricting writes to engine-controlled updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L39)

- [mq3.client.ui_main.CvarSpec](Type-mq3-client-ui-main-cvarspec-1269032976.md) — struct
<a id="function-function-mq3-client-ui-main-cvartable-function-cvartable-src-mq3-client-ui-main-ml-1439948082"></a>
### cvarTable

```ml
function cvarTable()
```

Calls `mq3.client.ui_main.spec` from UI main `cvarTable`. The final path returns `rows+[spec("ui_cdkeychecked","0",CVAR_ROM)]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L125)

- [mq3.client.ui_main.DispatchResult](Type-mq3-client-ui-main-dispatchresult-1778608090.md) — struct
<a id="function-function-mq3-client-ui-main-hostaction-function-hostaction-state-boundary-kind-name-args-src-mq3-client-ui-main-ml-713026557"></a>
### hostAction

```ml
function hostAction(state, boundary, kind, name, args)
```

Updates `state.actions` during UI main `hostAction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main resource. |
| `args` | `dynamic` | — | Value used by `value=HostAction(boundary,kind,name,args,not state.retailQvmActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L141)

- [mq3.client.ui_main.HostAction](Type-mq3-client-ui-main-hostaction-1975326125.md) — struct
<a id="function-function-mq3-client-ui-main-result-function-result-value-action-src-mq3-client-ui-main-ml-949067465"></a>
### result

```ml
function result(value, action)
```

Creates a `mq3.client.ui_main.DispatchResult` record. Assigns `value` from `value`, `action` from `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used to initialize `DispatchResult.value`. |
| `action` | `dynamic` | — | Value used to initialize `DispatchResult.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L149)

<a id="function-function-mq3-client-ui-main-spec-function-spec-name-defaultvalue-flags-src-mq3-client-ui-main-ml-1532535040"></a>
### spec

```ml
function spec(name, defaultValue, flags)
```

Creates a `mq3.client.ui_main.CvarSpec` record. Assigns `name` from `name`, `defaultValue` from `defaultValue`, `flags` from `flags`, `value` from `defaultValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `CvarSpec.name`. |
| `defaultValue` | `dynamic` | — | Value used to initialize `CvarSpec.defaultValue`, `CvarSpec.value`. |
| `flags` | `dynamic` | — | Value used to initialize `CvarSpec.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L123)

- [mq3.client.ui_main.State](Type-mq3-client-ui-main-state-743995406.md) — struct
<a id="constant-constant-mq3-client-ui-main-ui-api-version-const-ui-api-version-6-src-mq3-client-ui-main-ml-192207847"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 6
```

UI virtual-machine interface version expected by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L29)

<a id="constant-constant-mq3-client-ui-main-ui-console-command-const-ui-console-command-8-src-mq3-client-ui-main-ml-905140501"></a>
### UI_CONSOLE_COMMAND

```ml
const UI_CONSOLE_COMMAND = 8
```

UI VM entry-point ordinal used to handle a UI console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L23)

<a id="constant-constant-mq3-client-ui-main-ui-draw-connect-screen-const-ui-draw-connect-screen-9-src-mq3-client-ui-main-ml-274745700"></a>
### UI_DRAW_CONNECT_SCREEN

```ml
const UI_DRAW_CONNECT_SCREEN = 9
```

UI VM entry-point ordinal used to render the connection-progress screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L25)

<a id="constant-constant-mq3-client-ui-main-ui-getapiversion-const-ui-getapiversion-0-src-mq3-client-ui-main-ml-1182020107"></a>
### UI_GETAPIVERSION

```ml
const UI_GETAPIVERSION = 0
```

UI VM entry-point ordinal used to query the UI VM interface version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L7)

<a id="constant-constant-mq3-client-ui-main-ui-hasuniquecdkey-const-ui-hasuniquecdkey-10-src-mq3-client-ui-main-ml-1664150744"></a>
### UI_HASUNIQUECDKEY

```ml
const UI_HASUNIQUECDKEY = 10
```

UI VM entry-point ordinal used to query whether the UI requires a unique product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L27)

<a id="constant-constant-mq3-client-ui-main-ui-init-const-ui-init-1-src-mq3-client-ui-main-ml-122100856"></a>
### UI_INIT

```ml
const UI_INIT = 1
```

UI VM entry-point ordinal used to initialize the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L9)

<a id="constant-constant-mq3-client-ui-main-ui-is-fullscreen-const-ui-is-fullscreen-6-src-mq3-client-ui-main-ml-1352086601"></a>
### UI_IS_FULLSCREEN

```ml
const UI_IS_FULLSCREEN = 6
```

UI VM entry-point ordinal used to query whether the UI covers the game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L19)

<a id="constant-constant-mq3-client-ui-main-ui-key-event-const-ui-key-event-3-src-mq3-client-ui-main-ml-1417606990"></a>
### UI_KEY_EVENT

```ml
const UI_KEY_EVENT = 3
```

UI VM entry-point ordinal used to deliver a key event to the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L13)

<a id="constant-constant-mq3-client-ui-main-ui-mouse-event-const-ui-mouse-event-4-src-mq3-client-ui-main-ml-116290659"></a>
### UI_MOUSE_EVENT

```ml
const UI_MOUSE_EVENT = 4
```

UI VM entry-point ordinal used to deliver pointer motion to the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L15)

<a id="constant-constant-mq3-client-ui-main-ui-refresh-const-ui-refresh-5-src-mq3-client-ui-main-ml-1207594798"></a>
### UI_REFRESH

```ml
const UI_REFRESH = 5
```

UI VM entry-point ordinal used to advance and render the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L17)

<a id="function-function-mq3-client-ui-main-ui-registercvars-function-ui-registercvars-state-src-mq3-client-ui-main-ml-7027327"></a>
### UI_RegisterCvars

```ml
function UI_RegisterCvars(state)
```

UI_RegisterCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L153)

<a id="constant-constant-mq3-client-ui-main-ui-set-active-menu-const-ui-set-active-menu-7-src-mq3-client-ui-main-ml-875542084"></a>
### UI_SET_ACTIVE_MENU

```ml
const UI_SET_ACTIVE_MENU = 7
```

UI VM entry-point ordinal used to select the active UI menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L21)

<a id="constant-constant-mq3-client-ui-main-ui-shutdown-const-ui-shutdown-2-src-mq3-client-ui-main-ml-1236238321"></a>
### UI_SHUTDOWN

```ml
const UI_SHUTDOWN = 2
```

UI VM entry-point ordinal used to shut down the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L11)

<a id="function-function-mq3-client-ui-main-ui-updatecvars-function-ui-updatecvars-state-src-mq3-client-ui-main-ml-1836780499"></a>
### UI_UpdateCvars

```ml
function UI_UpdateCvars(state)
```

UI_UpdateCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L159)

<a id="function-function-mq3-client-ui-main-vmmain-function-vmmain-state-command-args-src-mq3-client-ui-main-ml-1159591367"></a>
### vmMain

```ml
function vmMain(state, command, args)
```

vmMain

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main record/storage; this routine assigns `state.initialized`, `state.shutdown`, `state.keyEvents`, `state.mouseEvents` and additional values. |
| `command` | `dynamic` | — | Value used by `if command==UI_GETAPIVERSION then return result(UI_API_VERSION,void) end if`. |
| `args` | `dynamic` | — | Value used by `if typeof(args)!="array" then return error(7894,"ui vmMain arguments must be an array") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L167)
