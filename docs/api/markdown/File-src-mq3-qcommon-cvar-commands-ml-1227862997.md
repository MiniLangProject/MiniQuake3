# `src/mq3/qcommon/cvar_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.cvar_commands`](Package-mq3-qcommon-cvar-commands-723311451.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)

## Declarations

<a id="function-function-mq3-qcommon-cvar-commands-emit-function-emit-commandstate-text-src-mq3-qcommon-cvar-commands-ml-1139173257"></a>
### emit

```ml
function emit(commandState, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L8)

<a id="function-function-mq3-qcommon-cvar-commands-flaggedset-function-flaggedset-commandstate-registry-flag-usage-src-mq3-qcommon-cvar-commands-ml-646480600"></a>
### flaggedSet

```ml
function flaggedSet(commandState, registry, flag, usage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |
| `flag` | `dynamic` | — |  |
| `usage` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L39)

<a id="function-function-mq3-qcommon-cvar-commands-flagtext-function-flagtext-flags-src-mq3-qcommon-cvar-commands-ml-715333445"></a>
### flagText

```ml
function flagText(flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L50)

<a id="function-function-mq3-qcommon-cvar-commands-install-function-install-registry-commandstate-src-mq3-qcommon-cvar-commands-ml-1821431659"></a>
### install

```ml
function install(registry, commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L75)

<a id="function-function-mq3-qcommon-cvar-commands-listcallback-function-listcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-822750745"></a>
### listCallback

```ml
function listCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L60)

<a id="function-function-mq3-qcommon-cvar-commands-resetcallback-function-resetcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1038471749"></a>
### resetCallback

```ml
function resetCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L46)

<a id="function-function-mq3-qcommon-cvar-commands-restartcallback-function-restartcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1678590181"></a>
### restartCallback

```ml
function restartCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L70)

<a id="function-function-mq3-qcommon-cvar-commands-setarchivecallback-function-setarchivecallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-470931961"></a>
### setArchiveCallback

```ml
function setArchiveCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L45)

<a id="function-function-mq3-qcommon-cvar-commands-setcallback-function-setcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-675265859"></a>
### setCallback

```ml
function setCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L27)

<a id="function-function-mq3-qcommon-cvar-commands-setservercallback-function-setservercallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-632275277"></a>
### setServerCallback

```ml
function setServerCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L44)

<a id="function-function-mq3-qcommon-cvar-commands-setusercallback-function-setusercallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1378146197"></a>
### setUserCallback

```ml
function setUserCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L43)

<a id="function-function-mq3-qcommon-cvar-commands-togglecallback-function-togglecallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1809536481"></a>
### toggleCallback

```ml
function toggleCallback(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L21)

<a id="function-function-mq3-qcommon-cvar-commands-valuecommand-function-valuecommand-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1932293221"></a>
### valueCommand

```ml
function valueCommand(commandState, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L10)
