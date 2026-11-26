# `src/mq3/client/key_bindings_config.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.key_bindings_config`](Package-mq3-client-key-bindings-config-1015566478.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/vm/cgame_key_traps.ml` as `keys` → [src/mq3/vm/cgame_key_traps.ml](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)

## Declarations

<a id="function-function-mq3-client-key-bindings-config-bindcommand-function-bindcommand-commandstate-state-src-mq3-client-key-bindings-config-ml-981089011"></a>
### bindCommand

```ml
function bindCommand(commandState, state)
```

Calls `mq3.qcommon.command_buffer.argc`, `mq3.client.key_bindings_config.emit`, `mq3.qcommon.command_buffer.argv` and additional helpers from key bindings config `bindCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the key bindings config helper calls. |
| `state` | `dynamic` | — | Record read through `state.keys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L37)

<a id="function-function-mq3-client-key-bindings-config-bindingtext-function-bindingtext-state-src-mq3-client-key-bindings-config-ml-1637938541"></a>
### bindingText

```ml
function bindingText(state)
```

Calls `mq3.vm.cgame_key_traps.getBinding`, `mq3.vm.cgame_key_traps.keynumToString` from key bindings config `bindingText`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L29)

<a id="function-function-mq3-client-key-bindings-config-bindlistcommand-function-bindlistcommand-commandstate-state-src-mq3-client-key-bindings-config-ml-1343701727"></a>
### bindListCommand

```ml
function bindListCommand(commandState, state)
```

Calls `mq3.vm.cgame_key_traps.getBinding`, `mq3.client.key_bindings_config.emit`, `mq3.vm.cgame_key_traps.keynumToString` from key bindings config `bindListCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Accepted for compatibility with `bindListCommand`; the current implementation does not read it. |
| `state` | `dynamic` | — | Record read through `state.keys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L58)

<a id="function-function-mq3-client-key-bindings-config-create-function-create-keystate-src-mq3-client-key-bindings-config-ml-248479834"></a>
### create

```ml
function create(keyState)
```

Creates a `mq3.client.key_bindings_config.State` record. Assigns `keys` from `keyState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keyState` | `dynamic` | — | Value used to initialize `State.keys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L22)

<a id="function-function-mq3-client-key-bindings-config-emit-function-emit-state-text-src-mq3-client-key-bindings-config-ml-996470888"></a>
### emit

```ml
function emit(state, text)
```

Calls `state.printFn` from key bindings config `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.printFn`, `state.printContext`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the key bindings config path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L26)

<a id="function-function-mq3-client-key-bindings-config-install-function-install-state-commandstate-src-mq3-client-key-bindings-config-ml-1141463753"></a>
### install

```ml
function install(state, commandState)
```

Calls `mq3.qcommon.command_buffer.addContextCommand` from key bindings config `install`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keys`. |
| `commandState` | `dynamic` | — | commandState record passed to the key bindings config helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L62)

<a id="function-function-mq3-client-key-bindings-config-loadtext-function-loadtext-state-commandstate-text-src-mq3-client-key-bindings-config-ml-211702170"></a>
### loadText

```ml
function loadText(state, commandState, text)
```

Calls `mq3.qcommon.command_buffer.insertText`, `mq3.qcommon.command_buffer.execute` from key bindings config `loadText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared key bindings config state passed to the helper calls in `loadText`. |
| `commandState` | `dynamic` | — | commandState record passed to the key bindings config helper calls. |
| `text` | `dynamic` | — | Text consumed or emitted by `loadText` in the key bindings config path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L74)

- [mq3.client.key_bindings_config.State](Type-mq3-client-key-bindings-config-state-863210453.md) — struct
<a id="function-function-mq3-client-key-bindings-config-unbindallcommand-function-unbindallcommand-commandstate-state-src-mq3-client-key-bindings-config-ml-533885235"></a>
### unbindAllCommand

```ml
function unbindAllCommand(commandState, state)
```

Calls `mq3.vm.cgame_key_traps.getBinding`, `mq3.vm.cgame_key_traps.setBinding` from key bindings config `unbindAllCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Accepted for compatibility with `unbindAllCommand`; the current implementation does not read it. |
| `state` | `dynamic` | — | Record read through `state.keys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L54)

<a id="function-function-mq3-client-key-bindings-config-unbindcommand-function-unbindcommand-commandstate-state-src-mq3-client-key-bindings-config-ml-1663979853"></a>
### unbindCommand

```ml
function unbindCommand(commandState, state)
```

Calls `mq3.qcommon.command_buffer.argc`, `mq3.client.key_bindings_config.emit`, `mq3.qcommon.command_buffer.argv` and additional helpers from key bindings config `unbindCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the key bindings config helper calls. |
| `state` | `dynamic` | — | Record read through `state.keys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L46)
