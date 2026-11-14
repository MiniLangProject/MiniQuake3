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
| `commandState` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L83)

<a id="function-function-mq3-qcommon-config-persistence-configfilename-function-configfilename-name-src-mq3-qcommon-config-persistence-ml-955712517"></a>
### configFilename

```ml
function configFilename(name)
```

Q_strncpyz followed by COM_DefaultExtension, both constrained by MAX_QPATH.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L38)

<a id="function-function-mq3-qcommon-config-persistence-configtext-function-configtext-state-src-mq3-qcommon-config-persistence-ml-606273295"></a>
### configText

```ml
function configText(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L47)

<a id="function-function-mq3-qcommon-config-persistence-copytext-function-copytext-text-capacity-src-mq3-qcommon-config-persistence-ml-171674637"></a>
### copyText

```ml
function copyText(text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L31)

<a id="function-function-mq3-qcommon-config-persistence-create-function-create-registry-host-src-mq3-qcommon-config-persistence-ml-744492971"></a>
### create

```ml
function create(registry, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L24)

<a id="function-function-mq3-qcommon-config-persistence-emit-function-emit-state-text-src-mq3-qcommon-config-persistence-ml-863908682"></a>
### emit

```ml
function emit(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L26)

<a id="function-function-mq3-qcommon-config-persistence-installcommand-function-installcommand-state-commandstate-src-mq3-qcommon-config-persistence-ml-1293915345"></a>
### installCommand

```ml
function installCommand(state, commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L88)

<a id="constant-constant-mq3-qcommon-config-persistence-max-qpath-const-max-qpath-64-src-mq3-qcommon-config-persistence-ml-2035076225"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L8)

<a id="function-function-mq3-qcommon-config-persistence-services-function-services-src-mq3-qcommon-config-persistence-ml-1785922456"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L23)

- [mq3.qcommon.config_persistence.Services](Type-mq3-qcommon-config-persistence-services-1094447434.md) — struct
- [mq3.qcommon.config_persistence.State](Type-mq3-qcommon-config-persistence-state-1217751323.md) — struct
<a id="function-function-mq3-qcommon-config-persistence-writeconfigcommand-function-writeconfigcommand-state-commandstate-src-mq3-qcommon-config-persistence-ml-1017332761"></a>
### writeConfigCommand

```ml
function writeConfigCommand(state, commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L74)

<a id="function-function-mq3-qcommon-config-persistence-writeconfigtofile-function-writeconfigtofile-state-filename-src-mq3-qcommon-config-persistence-ml-130085284"></a>
### writeConfigToFile

```ml
function writeConfigToFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L56)

<a id="function-function-mq3-qcommon-config-persistence-writeconfiguration-function-writeconfiguration-state-src-mq3-qcommon-config-persistence-ml-2108295299"></a>
### writeConfiguration

```ml
function writeConfiguration(state)
```

Com_WriteConfiguration: archive dirtiness is consumed before attempting the write, matching the original failure behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L67)
