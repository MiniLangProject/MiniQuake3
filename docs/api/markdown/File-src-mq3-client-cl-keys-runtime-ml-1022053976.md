# `src/mq3/client/cl_keys_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_keys_runtime`](Package-mq3-client-cl-keys-runtime-2126679116.md)

Reachable from entry: **no**

## Imports

- `mq3/client/console_input.ml` as `console` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/key_binding_dispatch.ml` as `dispatch` → [src/mq3/client/key_binding_dispatch.ml](File-src-mq3-client-key-binding-dispatch-ml-676068433.md)
- `mq3/client/key_bindings_config.ml` as `config` → [src/mq3/client/key_bindings_config.ml](File-src-mq3-client-key-bindings-config-ml-2105830282.md)
- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/vm/cgame_key_traps.ml` as `keys` → [src/mq3/vm/cgame_key_traps.ml](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)

## Declarations

<a id="constant-constant-mq3-client-cl-keys-runtime-bigchar-width-const-bigchar-width-16-src-mq3-client-cl-keys-runtime-ml-513710538"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L33)

<a id="function-function-mq3-client-cl-keys-runtime-bindcallback-function-bindcallback-commandstate-state-src-mq3-client-cl-keys-runtime-ml-1426325575"></a>
### bindCallback

```ml
function bindCallback(commandState, state)
```

Adapts `mq3.client.cl_keys_runtime.Key_Bind_f` to engine client keys runtime `bindCallback`, returning its result for `state, commandArgs(commandState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 2 of `mq3.client.cl_keys_runtime.Key_Bind_f`; passed as `commandArgs(commandState)`. |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_keys_runtime.Key_Bind_f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L178)

<a id="function-function-mq3-client-cl-keys-runtime-bindlistcallback-function-bindlistcallback-commandstate-state-src-mq3-client-cl-keys-runtime-ml-1750347971"></a>
### bindListCallback

```ml
function bindListCallback(commandState, state)
```

Adapts `mq3.client.cl_keys_runtime.Key_Bindlist_f` to engine client keys runtime `bindListCallback`, returning its result for `state, commandArgs(commandState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 2 of `mq3.client.cl_keys_runtime.Key_Bindlist_f`; passed as `commandArgs(commandState)`. |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_keys_runtime.Key_Bindlist_f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L190)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-active-const-ca-active-8-src-mq3-client-cl-keys-runtime-ml-535608961"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L30)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-authorizing-const-ca-authorizing-2-src-mq3-client-cl-keys-runtime-ml-1017580671"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L24)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-challenging-const-ca-challenging-4-src-mq3-client-cl-keys-runtime-ml-192506597"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L26)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-cinematic-const-ca-cinematic-9-src-mq3-client-cl-keys-runtime-ml-1043436340"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L31)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-connected-const-ca-connected-5-src-mq3-client-cl-keys-runtime-ml-1549974480"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L27)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-connecting-const-ca-connecting-3-src-mq3-client-cl-keys-runtime-ml-1719912504"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L25)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-disconnected-const-ca-disconnected-1-src-mq3-client-cl-keys-runtime-ml-1264287638"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L23)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-loading-const-ca-loading-6-src-mq3-client-cl-keys-runtime-ml-1020425299"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L28)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-primed-const-ca-primed-7-src-mq3-client-cl-keys-runtime-ml-1239880500"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L29)

<a id="constant-constant-mq3-client-cl-keys-runtime-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-cl-keys-runtime-ml-1303176427"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```

connstate_t is a public ABI shared with client.h and ui_public.h.  Keep the explicit Baseq3 ordinals here because routing below depends on the otherwise easy-to-confuse DISCONNECTED, PRIMED and CINEMATIC values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L22)

<a id="function-function-mq3-client-cl-keys-runtime-cl-addkeyupcommands-function-cl-addkeyupcommands-state-key-binding-time-src-mq3-client-cl-keys-runtime-ml-1921208796"></a>
### CL_AddKeyUpCommands

```ml
function CL_AddKeyUpCommands(state, key, binding, time)
```

Calls `mq3.client.key_binding_dispatch.commands`, `mq3.client.cl_keys_runtime.event` from engine client keys runtime `CL_AddKeyUpCommands`. The final path returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client keys runtime state passed to the helper calls in `CL_AddKeyUpCommands`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |
| `binding` | `dynamic` | — | Command text associated with an input key. |
| `time` | `dynamic` | — | Value used by `values=dispatch.commands(binding,key,false,time)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L207)

<a id="function-function-mq3-client-cl-keys-runtime-cl-charevent-function-cl-charevent-state-key-src-mq3-client-cl-keys-runtime-ml-528571750"></a>
### CL_CharEvent

```ml
function CL_CharEvent(state, key)
```

Calls `mq3.client.cl_keys_runtime.Field_CharEvent`, `mq3.client.cl_keys_runtime.event` from engine client keys runtime `CL_CharEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleState.catcher`, `state.consoleState.console`, `state.consoleState.chat`, `state.consoleState.connectionState`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L251)

<a id="function-function-mq3-client-cl-keys-runtime-cl-initkeycommands-function-cl-initkeycommands-state-src-mq3-client-cl-keys-runtime-ml-8926205"></a>
### CL_InitKeyCommands

```ml
function CL_InitKeyCommands(state)
```

Updates `state.initialized` during engine client keys runtime `CL_InitKeyCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L193)

<a id="function-function-mq3-client-cl-keys-runtime-cl-keyevent-function-cl-keyevent-state-key-down-time-src-mq3-client-cl-keys-runtime-ml-88225819"></a>
### CL_KeyEvent

```ml
function CL_KeyEvent(state, key, down, time)
```

Updates `state.repeats[key]`, `state.anyKeyDown`, `state.consoleState.catcher` during engine client keys runtime `CL_KeyEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.repeats[key]`, `state.anyKeyDown`, `state.consoleState.catcher`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |
| `time` | `dynamic` | — | Value used by `CL_AddKeyUpCommands(state,key,Key_GetBinding(state,key),time)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L224)

<a id="function-function-mq3-client-cl-keys-runtime-commandargs-function-commandargs-commandstate-src-mq3-client-cl-keys-runtime-ml-49194536"></a>
### commandArgs

```ml
function commandArgs(commandState)
```

Calls `mq3.qcommon.command_buffer.argc`, `mq3.qcommon.command_buffer.argv` from engine client keys runtime `commandArgs`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the engine client keys runtime helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L174)

<a id="function-function-mq3-client-cl-keys-runtime-console-key-function-console-key-state-key-src-mq3-client-cl-keys-runtime-ml-1354349744"></a>
### Console_Key

```ml
function Console_Key(state, key)
```

Calls `mq3.client.console_input.consoleKey`, `mq3.client.cl_keys_runtime.Key_IsDown`, `mq3.client.cl_keys_runtime.syncCatcher` from engine client keys runtime `Console_Key`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleState`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L213)

<a id="function-function-mq3-client-cl-keys-runtime-create-function-create-width-services-src-mq3-client-cl-keys-runtime-ml-4125854"></a>
### create

```ml
function create(width, services)
```

Calls `mq3.vm.cgame_key_traps.create`, `mq3.client.console_input.create`, `mq3.qcommon.command_buffer.create` and additional helpers from engine client keys runtime `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `create`. |
| `services` | `dynamic` | — | services record passed to the engine client keys runtime helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L45)

- [mq3.client.cl_keys_runtime.DrawResult](Type-mq3-client-cl-keys-runtime-drawresult-1131225577.md) — struct
<a id="function-function-mq3-client-cl-keys-runtime-event-function-event-state-kind-key-down-text-src-mq3-client-cl-keys-runtime-ml-629666933"></a>
### event

```ml
function event(state, kind, key, down, text)
```

Updates `state.events` during engine client keys runtime `event`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.events`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |
| `text` | `dynamic` | — | Text consumed or emitted by `event` in the engine client keys runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L54)

- [mq3.client.cl_keys_runtime.Event](Type-mq3-client-cl-keys-runtime-event-1815038642.md) — struct
<a id="function-function-mq3-client-cl-keys-runtime-field-bigdraw-function-field-bigdraw-state-edit-x-y-width-showcursor-realtime-src-mq3-client-cl-keys-runtime-ml-293768140"></a>
### Field_BigDraw

```ml
function Field_BigDraw(state, edit, x, y, width, showCursor, realtime)
```

Adapts `mq3.client.cl_keys_runtime.Field_VariableSizeDraw` to engine client keys runtime `Field_BigDraw`, returning its result for `state, edit, x, y, width, BIGCHAR_WIDTH, showCursor, realtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `edit` | `dynamic` | — | Argument 2 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `x` | `dynamic` | — | Argument 3 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `y` | `dynamic` | — | Argument 4 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `width` | `dynamic` | — | Argument 5 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `showCursor` | `dynamic` | — | Argument 7 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. Forwarded to `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L145)

<a id="function-function-mq3-client-cl-keys-runtime-field-charevent-function-field-charevent-state-edit-ch-src-mq3-client-cl-keys-runtime-ml-1696486586"></a>
### Field_CharEvent

```ml
function Field_CharEvent(state, edit, ch)
```

Updates `state.consoleState.overstrike` during engine client keys runtime `Field_CharEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`. |
| `edit` | `dynamic` | — | Value used by `result=console.charEvent(state.consoleState,edit,ch)`. |
| `ch` | `dynamic` | — | Value used by `result=console.charEvent(state.consoleState,edit,ch)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L108)

<a id="function-function-mq3-client-cl-keys-runtime-field-draw-function-field-draw-state-edit-x-y-width-showcursor-realtime-src-mq3-client-cl-keys-runtime-ml-1739680726"></a>
### Field_Draw

```ml
function Field_Draw(state, edit, x, y, width, showCursor, realtime)
```

Adapts `mq3.client.cl_keys_runtime.Field_VariableSizeDraw` to engine client keys runtime `Field_Draw`, returning its result for `state, edit, x, y, width, SMALLCHAR_WIDTH, showCursor, realtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `edit` | `dynamic` | — | Argument 2 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `x` | `dynamic` | — | Argument 3 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `y` | `dynamic` | — | Argument 4 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `width` | `dynamic` | — | Argument 5 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `showCursor` | `dynamic` | — | Argument 7 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. Forwarded to `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L136)

<a id="function-function-mq3-client-cl-keys-runtime-field-keydownevent-function-field-keydownevent-state-edit-key-src-mq3-client-cl-keys-runtime-ml-2126842630"></a>
### Field_KeyDownEvent

```ml
function Field_KeyDownEvent(state, edit, key)
```

Updates `state.consoleState.overstrike` during engine client keys runtime `Field_KeyDownEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`. |
| `edit` | `dynamic` | — | Value used by `result=console.fieldKeyDown(state.consoleState,edit,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL))`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L101)

<a id="function-function-mq3-client-cl-keys-runtime-field-paste-function-field-paste-state-edit-src-mq3-client-cl-keys-runtime-ml-482491021"></a>
### Field_Paste

```ml
function Field_Paste(state, edit)
```

Updates `state.consoleState.overstrike` during engine client keys runtime `Field_Paste`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`. |
| `edit` | `dynamic` | — | Value used by `result=console.paste(state.consoleState,edit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L96)

<a id="function-function-mq3-client-cl-keys-runtime-field-variablesizedraw-function-field-variablesizedraw-state-edit-x-y-width-size-showcursor-realtime-src-mq3-client-cl-keys-runtime-ml-1197225153"></a>
### Field_VariableSizeDraw

```ml
function Field_VariableSizeDraw(state, edit, x, y, width, size, showCursor, realtime)
```

Updates `edit.scroll` during engine client keys runtime `Field_VariableSizeDraw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client keys runtime state passed to the helper calls in `Field_VariableSizeDraw`. |
| `edit` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `edit.scroll`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Field_VariableSizeDraw`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Field_VariableSizeDraw`. |
| `width` | `dynamic` | — | Accepted for compatibility with `Field_VariableSizeDraw`; the current implementation does not read it. |
| `size` | `dynamic` | — | Value used by `cursorX=x+(edit.cursor-prestep-i)*size`. |
| `showCursor` | `dynamic` | — | Value used by `cursorVisible=showCursor and ((realtime>>8)&1)==0`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L123)

<a id="constant-constant-mq3-client-cl-keys-runtime-k-char-flag-const-k-char-flag-1024-src-mq3-client-cl-keys-runtime-ml-228322554"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L17)

<a id="constant-constant-mq3-client-cl-keys-runtime-k-escape-const-k-escape-27-src-mq3-client-cl-keys-runtime-ml-1956572326"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L18)

<a id="function-function-mq3-client-cl-keys-runtime-key-bind-f-function-key-bind-f-state-args-src-mq3-client-cl-keys-runtime-ml-672434202"></a>
### Key_Bind_f

```ml
function Key_Bind_f(state, args)
```

Calls `mq3.client.cl_keys_runtime.event`, `mq3.client.cl_keys_runtime.Key_StringToKeynum`, `mq3.client.cl_keys_runtime.Key_GetBinding` and additional helpers from engine client keys runtime `Key_Bind_f`. The final path returns `Key_SetBinding(state,key,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client keys runtime state passed to the helper calls in `Key_Bind_f`. |
| `args` | `dynamic` | — | Sequence read at `args[1]`, `args[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L160)

<a id="function-function-mq3-client-cl-keys-runtime-key-bindlist-f-function-key-bindlist-f-state-args-src-mq3-client-cl-keys-runtime-ml-221110018"></a>
### Key_Bindlist_f

```ml
function Key_Bindlist_f(state, args)
```

Calls `mq3.client.cl_keys_runtime.Key_GetBinding`, `mq3.client.cl_keys_runtime.event`, `mq3.client.cl_keys_runtime.Key_KeynumToString` from engine client keys runtime `Key_Bindlist_f`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client keys runtime state passed to the helper calls in `Key_Bindlist_f`. |
| `args` | `dynamic` | — | Accepted for compatibility with `Key_Bindlist_f`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L171)

<a id="function-function-mq3-client-cl-keys-runtime-key-clearstates-function-key-clearstates-state-src-mq3-client-cl-keys-runtime-ml-686519135"></a>
### Key_ClearStates

```ml
function Key_ClearStates(state)
```

Updates `state.anyKeyDown`, `state.repeats[key]` during engine client keys runtime `Key_ClearStates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.anyKeyDown`, `state.repeats[key]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L260)

<a id="function-function-mq3-client-cl-keys-runtime-key-getbinding-function-key-getbinding-state-keynum-src-mq3-client-cl-keys-runtime-ml-748935614"></a>
### Key_GetBinding

```ml
function Key_GetBinding(state, keynum)
```

Calls `mq3.client.cl_keys_runtime.valid`, `mq3.vm.cgame_key_traps.getBinding` from engine client keys runtime `Key_GetBinding`. The final path returns `keys.getBinding(state.keyState,keynum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyState`. |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L80)

<a id="function-function-mq3-client-cl-keys-runtime-key-getkey-function-key-getkey-state-binding-src-mq3-client-cl-keys-runtime-ml-1141464760"></a>
### Key_GetKey

```ml
function Key_GetKey(state, binding)
```

Calls `mq3.vm.cgame_key_traps.getKey` from engine client keys runtime `Key_GetKey`. The final path returns `keys.getKey(state.keyState,binding)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyState`. |
| `binding` | `dynamic` | — | Command text associated with an input key. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L84)

<a id="function-function-mq3-client-cl-keys-runtime-key-getoverstrikemode-function-key-getoverstrikemode-state-src-mq3-client-cl-keys-runtime-ml-1759495011"></a>
### Key_GetOverstrikeMode

```ml
function Key_GetOverstrikeMode(state)
```

Calls `mq3.vm.cgame_key_traps.getOverstrike` from engine client keys runtime `Key_GetOverstrikeMode`. The final path returns `keys.getOverstrike(state.keyState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L87)

<a id="function-function-mq3-client-cl-keys-runtime-key-isdown-function-key-isdown-state-keynum-src-mq3-client-cl-keys-runtime-ml-127213190"></a>
### Key_IsDown

```ml
function Key_IsDown(state, keynum)
```

Calls `mq3.client.cl_keys_runtime.valid`, `mq3.vm.cgame_key_traps.isDown` from engine client keys runtime `Key_IsDown`. The final path returns `keys.isDown(state.keyState,keynum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyState`. |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L65)

<a id="function-function-mq3-client-cl-keys-runtime-key-keynumtostring-function-key-keynumtostring-keynum-src-mq3-client-cl-keys-runtime-ml-1818288765"></a>
### Key_KeynumToString

```ml
function Key_KeynumToString(keynum)
```

Adapts `mq3.vm.cgame_key_traps.keynumToString` to engine client keys runtime `Key_KeynumToString`, returning its result for `keynum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.vm.cgame_key_traps.keynumToString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L71)

<a id="function-function-mq3-client-cl-keys-runtime-key-setbinding-function-key-setbinding-state-keynum-binding-src-mq3-client-cl-keys-runtime-ml-202958485"></a>
### Key_SetBinding

```ml
function Key_SetBinding(state, keynum, binding)
```

Updates `state.archiveModified` during engine client keys runtime `Key_SetBinding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.archiveModified`. |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. |
| `binding` | `dynamic` | — | Command text associated with an input key. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L76)

<a id="function-function-mq3-client-cl-keys-runtime-key-setoverstrikemode-function-key-setoverstrikemode-state-value-src-mq3-client-cl-keys-runtime-ml-2088898198"></a>
### Key_SetOverstrikeMode

```ml
function Key_SetOverstrikeMode(state, value)
```

Updates `state.consoleState.overstrike` during engine client keys runtime `Key_SetOverstrikeMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`. |
| `value` | `dynamic` | — | Value assigned to `state.consoleState.overstrike`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L91)

<a id="function-function-mq3-client-cl-keys-runtime-key-stringtokeynum-function-key-stringtokeynum-text-src-mq3-client-cl-keys-runtime-ml-164435867"></a>
### Key_StringToKeynum

```ml
function Key_StringToKeynum(text)
```

Adapts `mq3.vm.cgame_key_traps.stringToKeynum` to engine client keys runtime `Key_StringToKeynum`, returning its result for `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 of `mq3.vm.cgame_key_traps.stringToKeynum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L68)

<a id="function-function-mq3-client-cl-keys-runtime-key-unbind-f-function-key-unbind-f-state-args-src-mq3-client-cl-keys-runtime-ml-1672942594"></a>
### Key_Unbind_f

```ml
function Key_Unbind_f(state, args)
```

Calls `mq3.client.cl_keys_runtime.event`, `mq3.client.cl_keys_runtime.Key_StringToKeynum`, `mq3.client.cl_keys_runtime.Key_SetBinding` from engine client keys runtime `Key_Unbind_f`. The final path returns `Key_SetBinding(state,key,"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client keys runtime state passed to the helper calls in `Key_Unbind_f`. |
| `args` | `dynamic` | — | Sequence read at `args[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L150)

<a id="function-function-mq3-client-cl-keys-runtime-key-unbindall-f-function-key-unbindall-f-state-args-src-mq3-client-cl-keys-runtime-ml-1277646554"></a>
### Key_Unbindall_f

```ml
function Key_Unbindall_f(state, args)
```

Calls `mq3.client.cl_keys_runtime.Key_GetBinding`, `mq3.client.cl_keys_runtime.Key_SetBinding` from engine client keys runtime `Key_Unbindall_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client keys runtime state passed to the helper calls in `Key_Unbindall_f`. |
| `args` | `dynamic` | — | Accepted for compatibility with `Key_Unbindall_f`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L156)

<a id="function-function-mq3-client-cl-keys-runtime-key-writebindings-function-key-writebindings-state-src-mq3-client-cl-keys-runtime-ml-260832015"></a>
### Key_WriteBindings

```ml
function Key_WriteBindings(state)
```

Calls `mq3.client.key_bindings_config.bindingText` from engine client keys runtime `Key_WriteBindings`. The final path returns `config.bindingText(state.bindingState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.bindingState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L167)

<a id="constant-constant-mq3-client-cl-keys-runtime-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-cl-keys-runtime-ml-1945909839"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L16)

<a id="constant-constant-mq3-client-cl-keys-runtime-keycatch-console-const-keycatch-console-1-src-mq3-client-cl-keys-runtime-ml-46491076"></a>
### KEYCATCH_CONSOLE

```ml
const KEYCATCH_CONSOLE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L13)

<a id="constant-constant-mq3-client-cl-keys-runtime-keycatch-message-const-keycatch-message-4-src-mq3-client-cl-keys-runtime-ml-1517830967"></a>
### KEYCATCH_MESSAGE

```ml
const KEYCATCH_MESSAGE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L15)

<a id="constant-constant-mq3-client-cl-keys-runtime-keycatch-ui-const-keycatch-ui-2-src-mq3-client-cl-keys-runtime-ml-646528759"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L14)

<a id="constant-constant-mq3-client-cl-keys-runtime-max-keys-const-max-keys-256-src-mq3-client-cl-keys-runtime-ml-392530224"></a>
### MAX_KEYS

```ml
const MAX_KEYS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L12)

<a id="function-function-mq3-client-cl-keys-runtime-message-key-function-message-key-state-key-src-mq3-client-cl-keys-runtime-ml-989388504"></a>
### Message_Key

```ml
function Message_Key(state, key)
```

Calls `mq3.client.console_input.messageKey`, `mq3.client.cl_keys_runtime.Key_IsDown`, `mq3.client.cl_keys_runtime.syncCatcher` from engine client keys runtime `Message_Key`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleState`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L217)

- [mq3.client.cl_keys_runtime.Runtime](Type-mq3-client-cl-keys-runtime-runtime-1167656110.md) — struct
<a id="constant-constant-mq3-client-cl-keys-runtime-smallchar-width-const-smallchar-width-8-src-mq3-client-cl-keys-runtime-ml-812394485"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L32)

<a id="function-function-mq3-client-cl-keys-runtime-synccatcher-function-synccatcher-state-src-mq3-client-cl-keys-runtime-ml-2080463875"></a>
### syncCatcher

```ml
function syncCatcher(state)
```

Updates `state.keyState.catcher` during engine client keys runtime `syncCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client keys runtime record/storage; this routine assigns `state.keyState.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L57)

<a id="function-function-mq3-client-cl-keys-runtime-unbindallcallback-function-unbindallcallback-commandstate-state-src-mq3-client-cl-keys-runtime-ml-1813836791"></a>
### unbindAllCallback

```ml
function unbindAllCallback(commandState, state)
```

Adapts `mq3.client.cl_keys_runtime.Key_Unbindall_f` to engine client keys runtime `unbindAllCallback`, returning its result for `state, commandArgs(commandState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 2 of `mq3.client.cl_keys_runtime.Key_Unbindall_f`; passed as `commandArgs(commandState)`. |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_keys_runtime.Key_Unbindall_f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L186)

<a id="function-function-mq3-client-cl-keys-runtime-unbindcallback-function-unbindcallback-commandstate-state-src-mq3-client-cl-keys-runtime-ml-14068923"></a>
### unbindCallback

```ml
function unbindCallback(commandState, state)
```

Adapts `mq3.client.cl_keys_runtime.Key_Unbind_f` to engine client keys runtime `unbindCallback`, returning its result for `state, commandArgs(commandState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 2 of `mq3.client.cl_keys_runtime.Key_Unbind_f`; passed as `commandArgs(commandState)`. |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_keys_runtime.Key_Unbind_f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L182)

<a id="function-function-mq3-client-cl-keys-runtime-valid-function-valid-key-src-mq3-client-cl-keys-runtime-ml-1844684815"></a>
### valid

```ml
function valid(key)
```

Computes `key>=0 and key<MAX_KEYS` for engine client keys runtime `valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client keys runtime entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L60)

<a id="function-function-mq3-client-cl-keys-runtime-visiblelength-function-visiblelength-text-src-mq3-client-cl-keys-runtime-ml-1917283183"></a>
### visibleLength

```ml
function visibleLength(text)
```

Counts displayed characters while skipping Quake color escape sequences.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `visibleLength` in the engine client keys runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L113)
