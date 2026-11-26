# `src/mq3/qcommon/startup_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.startup_commands`](Package-mq3-qcommon-startup-commands-1419176094.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `commands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)

## Declarations

<a id="function-function-mq3-qcommon-startup-commands-addstartupcommands-function-addstartupcommands-state-src-mq3-qcommon-startup-commands-ml-1197527755"></a>
### addStartupCommands

```ml
function addStartupCommands(state)
```

Add startup commands in qcommon.startup_commands; the normal completion returns `added`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `lines`, `commandState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L98)

<a id="function-function-mq3-qcommon-startup-commands-create-function-create-commandstate-src-mq3-qcommon-startup-commands-ml-2113834346"></a>
### create

```ml
function create(commandState)
```

Create `mq3.qcommon.startup_commands.State` with commandState=commandState; lines=[]; cvarSetFn=void; cvarGetFn=void; context=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Initial `commandState` field stored in the returned or constructed `mq3.qcommon.startup_commands.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L29)

<a id="constant-constant-mq3-qcommon-startup-commands-cvar-user-created-const-cvar-user-created-128-src-mq3-qcommon-startup-commands-ml-1406830898"></a>
### CVAR_USER_CREATED

```ml
const CVAR_USER_CREATED = 128
```

Created by a set command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L10)

<a id="constant-constant-mq3-qcommon-startup-commands-max-console-lines-const-max-console-lines-32-src-mq3-qcommon-startup-commands-ml-1021360490"></a>
### MAX_CONSOLE_LINES

```ml
const MAX_CONSOLE_LINES = 32
```

Maximum number of command lines retained for startup console processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L8)

<a id="function-function-mq3-qcommon-startup-commands-parsecommandline-function-parsecommandline-state-commandline-src-mq3-qcommon-startup-commands-ml-760689904"></a>
### parseCommandLine

```ml
function parseCommandLine(state, commandLine)
```

Parse command line in qcommon.startup_commands; the normal completion returns `result`.

Direct state writes: `state.lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `lines`. |
| `commandLine` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.visibleBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L36)

<a id="function-function-mq3-qcommon-startup-commands-prefixset-function-prefixset-line-src-mq3-qcommon-startup-commands-ml-1829982598"></a>
### prefixSet

```ml
function prefixSet(line)
```

Test prefix set in qcommon.startup_commands; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | Line used in `bytes(line)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L88)

<a id="function-function-mq3-qcommon-startup-commands-safemode-function-safemode-state-src-mq3-qcommon-startup-commands-ml-2087074315"></a>
### safeMode

```ml
function safeMode(state)
```

Test safe mode in qcommon.startup_commands; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `lines`, `commandState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L54)

<a id="function-function-mq3-qcommon-startup-commands-startupvariable-function-startupvariable-state-match-src-mq3-qcommon-startup-commands-ml-2099556916"></a>
### startupVariable

```ml
function startupVariable(state, match)
```

Compute startup variable in qcommon.startup_commands.

Validation failures include `Startup variables require Cvar_Set and Cvar_Get services`; `Cvar_Get returned NULL for startup variable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cvarSetFn`, `cvarGetFn`, `lines`, `commandState`. |
| `match` | `dynamic` | — | Match used in `(match == void)` and `(name == match)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L70)

- [mq3.qcommon.startup_commands.State](Type-mq3-qcommon-startup-commands-state-746140293.md) — struct
