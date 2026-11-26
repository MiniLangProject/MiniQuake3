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

Emit cvar commands in qcommon.cvar_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.emit`. |
| `text` | `dynamic` | — | Message passed as `message` to `mq3.qcommon.command_buffer.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L11)

<a id="function-function-mq3-qcommon-cvar-commands-flaggedset-function-flaggedset-commandstate-registry-flag-usage-src-mq3-qcommon-cvar-commands-ml-646480600"></a>
### flaggedSet

```ml
function flaggedSet(commandState, registry, flag, usage)
```

Compute flagged set in qcommon.cvar_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar_commands.setCallback`. |
| `flag` | `dynamic` | — | Flag used in `(variable.flags \| flag)`. |
| `usage` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.cvar_commands.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L56)

<a id="function-function-mq3-qcommon-cvar-commands-flagtext-function-flagtext-flags-src-mq3-qcommon-cvar-commands-ml-715333445"></a>
### flagText

```ml
function flagText(flags)
```

Compute flag text in qcommon.cvar_commands; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Flags used in `(flags & cvar.ROM)` and `(flags & cvar.INIT)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L81)

<a id="function-function-mq3-qcommon-cvar-commands-install-function-install-registry-commandstate-src-mq3-qcommon-cvar-commands-ml-1821431659"></a>
### install

```ml
function install(registry, commandState)
```

Update `commandState.cvarContextCommandFn`, `commandState.cvarCommandContext` in qcommon.cvar_commands; the normal completion returns `true`.

Validation failures include `cvar_restart requires registry and command state`.
Direct state writes: `commandState.cvarContextCommandFn`, `commandState.cvarCommandContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Context passed as `context` to `mq3.qcommon.command_buffer.addContextCommand`. |
| `commandState` | `dynamic` | — | Updated in place: `cvarContextCommandFn`, `cvarCommandContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L120)

<a id="function-function-mq3-qcommon-cvar-commands-listcallback-function-listcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-822750745"></a>
### listCallback

```ml
function listCallback(commandState, registry)
```

Compute list callback in qcommon.cvar_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |
| `registry` | `dynamic` | — | Record exposing `variables`, `numIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L94)

<a id="function-function-mq3-qcommon-cvar-commands-resetcallback-function-resetcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1038471749"></a>
### resetCallback

```ml
function resetCallback(commandState, registry)
```

Reset callback in qcommon.cvar_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.set2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L75)

<a id="function-function-mq3-qcommon-cvar-commands-restartcallback-function-restartcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1678590181"></a>
### restartCallback

```ml
function restartCallback(commandState, registry)
```

Compute restart callback in qcommon.cvar_commands; the normal completion returns `cvar.restart(registry)`.

Validation failures include `cvar_restart command is not bound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.restart`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L109)

<a id="function-function-mq3-qcommon-cvar-commands-setarchivecallback-function-setarchivecallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-470931961"></a>
### setArchiveCallback

```ml
function setArchiveCallback(commandState, registry)
```

Return `mq3.qcommon.cvar_commands.flaggedSet(commandState, registry, cvar.ARCHIVE, "usage: seta <variable> <value>\n")` from `qcommon.cvar_commands.setArchiveCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Command state passed as `commandState` to `mq3.qcommon.cvar_commands.flaggedSet`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar_commands.flaggedSet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L71)

<a id="function-function-mq3-qcommon-cvar-commands-setcallback-function-setcallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-675265859"></a>
### setCallback

```ml
function setCallback(commandState, registry)
```

Set callback in qcommon.cvar_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.set2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L39)

<a id="function-function-mq3-qcommon-cvar-commands-setservercallback-function-setservercallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-632275277"></a>
### setServerCallback

```ml
function setServerCallback(commandState, registry)
```

Return `mq3.qcommon.cvar_commands.flaggedSet(commandState, registry, cvar.SERVERINFO, "usage: sets <variable> <value>\n")` from `qcommon.cvar_commands.setServerCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Command state passed as `commandState` to `mq3.qcommon.cvar_commands.flaggedSet`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar_commands.flaggedSet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L67)

<a id="function-function-mq3-qcommon-cvar-commands-setusercallback-function-setusercallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1378146197"></a>
### setUserCallback

```ml
function setUserCallback(commandState, registry)
```

Return `mq3.qcommon.cvar_commands.flaggedSet(commandState, registry, cvar.USERINFO, "usage: setu <variable> <value>\n")` from `qcommon.cvar_commands.setUserCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Command state passed as `commandState` to `mq3.qcommon.cvar_commands.flaggedSet`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar_commands.flaggedSet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L63)

<a id="function-function-mq3-qcommon-cvar-commands-togglecallback-function-togglecallback-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1809536481"></a>
### toggleCallback

```ml
function toggleCallback(commandState, registry)
```

Compute toggle callback in qcommon.cvar_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L30)

<a id="function-function-mq3-qcommon-cvar-commands-valuecommand-function-valuecommand-commandstate-registry-src-mq3-qcommon-cvar-commands-ml-1932293221"></a>
### valueCommand

```ml
function valueCommand(commandState, registry)
```

Test value command in qcommon.cvar_commands; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argv`. |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar_commands.ml#L16)
