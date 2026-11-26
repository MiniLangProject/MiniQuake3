# `src/mq3/qcommon/config_persistence.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.config_persistence`](Package-mq3-qcommon-config-persistence-503922028.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)

## Declarations

<a id="function-function-mq3-qcommon-config-persistence-commandcallback-function-commandcallback-commandstate-state-src-mq3-qcommon-config-persistence-ml-1130018321"></a>
### commandCallback

```ml
function commandCallback(commandState, state)
```

Cmd_AddCommand("writeconfig", Com_WriteConfig_f).  The command registry owns the association so several isolated engine runtimes can coexist in tests and tools without a process-global configuration pointer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Command state passed as `commandState` to `mq3.qcommon.config_persistence.writeConfigCommand`. |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.config_persistence.writeConfigCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L109)

<a id="function-function-mq3-qcommon-config-persistence-configfilename-function-configfilename-name-src-mq3-qcommon-config-persistence-ml-955712517"></a>
### configFilename

```ml
function configFilename(name)
```

Q_strncpyz followed by COM_DefaultExtension, both constrained by MAX_QPATH.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.config_persistence.copyText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L51)

<a id="function-function-mq3-qcommon-config-persistence-configtext-function-configtext-state-src-mq3-qcommon-config-persistence-ml-606273295"></a>
### configText

```ml
function configText(state)
```

Compute config text in qcommon.config_persistence; the normal completion returns `(output + cvar.writeVariables(state.registry))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`, `registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L62)

<a id="function-function-mq3-qcommon-config-persistence-copytext-function-copytext-text-capacity-src-mq3-qcommon-config-persistence-ml-171674637"></a>
### copyText

```ml
function copyText(text, capacity)
```

Copy text in qcommon.config_persistence; the normal completion returns `decode(slice(data, 0, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 1)` and `(capacity - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L43)

<a id="function-function-mq3-qcommon-config-persistence-create-function-create-registry-host-src-mq3-qcommon-config-persistence-ml-744492971"></a>
### create

```ml
function create(registry, host)
```

Create `mq3.qcommon.config_persistence.State` with registry=registry; services=host; fullyInitialized=false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Initial `registry` field stored in the returned or constructed `mq3.qcommon.config_persistence.State` record. |
| `host` | `dynamic` | — | Initial `services` field stored in the returned or constructed `mq3.qcommon.config_persistence.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L30)

<a id="function-function-mq3-qcommon-config-persistence-emit-function-emit-state-text-src-mq3-qcommon-config-persistence-ml-863908682"></a>
### emit

```ml
function emit(state, text)
```

Emit config persistence in qcommon.config_persistence.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `text` | `dynamic` | — | Text used in `state.services.printFn(state.services.context, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L35)

<a id="function-function-mq3-qcommon-config-persistence-installcommand-function-installcommand-state-commandstate-src-mq3-qcommon-config-persistence-ml-1293915345"></a>
### installCommand

```ml
function installCommand(state, commandState)
```

Test install command in qcommon.config_persistence; the normal completion returns `true`.

Validation failures include `Configuration persistence requires registry and write service`; `Configuration persistence requires command state`; `writeconfig command already registered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `registry`, `services`. |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.addContextCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L119)

<a id="constant-constant-mq3-qcommon-config-persistence-max-qpath-const-max-qpath-64-src-mq3-qcommon-config-persistence-ml-2035076225"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L8)

<a id="function-function-mq3-qcommon-config-persistence-services-function-services-src-mq3-qcommon-config-persistence-ml-1785922456"></a>
### services

```ml
function services()
```

Create `mq3.qcommon.config_persistence.Services` with writeFn=void; bindingTextFn=void; printFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L26)

- [mq3.qcommon.config_persistence.Services](Type-mq3-qcommon-config-persistence-services-1094447434.md) — struct
- [mq3.qcommon.config_persistence.State](Type-mq3-qcommon-config-persistence-state-1217751323.md) — struct
<a id="function-function-mq3-qcommon-config-persistence-writeconfigcommand-function-writeconfigcommand-state-commandstate-src-mq3-qcommon-config-persistence-ml-1017332761"></a>
### writeConfigCommand

```ml
function writeConfigCommand(state, commandState)
```

Write config command in qcommon.config_persistence; the normal completion returns `writeConfigToFile(state, filename)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.config_persistence.emit`. |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L98)

<a id="function-function-mq3-qcommon-config-persistence-writeconfigtofile-function-writeconfigtofile-state-filename-src-mq3-qcommon-config-persistence-ml-130085284"></a>
### writeConfigToFile

```ml
function writeConfigToFile(state, filename)
```

Write config to file in qcommon.config_persistence; the normal completion returns `true`.

Validation failures include `Configuration persistence requires registry and write service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `registry`, `services`. |
| `filename` | `dynamic` | — | Filename used in `("Couldn't write " + filename)` and `(("Couldn't write " + filename) + ".\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L76)

<a id="function-function-mq3-qcommon-config-persistence-writeconfiguration-function-writeconfiguration-state-src-mq3-qcommon-config-persistence-ml-2108295299"></a>
### writeConfiguration

```ml
function writeConfiguration(state)
```

Com_WriteConfiguration: archive dirtiness is consumed before attempting the write, matching the original failure behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fullyInitialized`, `registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L88)
