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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L71)

<a id="function-function-mq3-qcommon-startup-commands-create-function-create-commandstate-src-mq3-qcommon-startup-commands-ml-2113834346"></a>
### create

```ml
function create(commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L18)

<a id="constant-constant-mq3-qcommon-startup-commands-cvar-user-created-const-cvar-user-created-128-src-mq3-qcommon-startup-commands-ml-1406830898"></a>
### CVAR_USER_CREATED

```ml
const CVAR_USER_CREATED = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L8)

<a id="constant-constant-mq3-qcommon-startup-commands-max-console-lines-const-max-console-lines-32-src-mq3-qcommon-startup-commands-ml-1021360490"></a>
### MAX_CONSOLE_LINES

```ml
const MAX_CONSOLE_LINES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L7)

<a id="function-function-mq3-qcommon-startup-commands-parsecommandline-function-parsecommandline-state-commandline-src-mq3-qcommon-startup-commands-ml-760689904"></a>
### parseCommandLine

```ml
function parseCommandLine(state, commandLine)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commandLine` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L20)

<a id="function-function-mq3-qcommon-startup-commands-prefixset-function-prefixset-line-src-mq3-qcommon-startup-commands-ml-1829982598"></a>
### prefixSet

```ml
function prefixSet(line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L63)

<a id="function-function-mq3-qcommon-startup-commands-safemode-function-safemode-state-src-mq3-qcommon-startup-commands-ml-2087074315"></a>
### safeMode

```ml
function safeMode(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L36)

<a id="function-function-mq3-qcommon-startup-commands-startupvariable-function-startupvariable-state-match-src-mq3-qcommon-startup-commands-ml-2099556916"></a>
### startupVariable

```ml
function startupVariable(state, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/startup_commands.ml#L47)

- [mq3.qcommon.startup_commands.State](Type-mq3-qcommon-startup-commands-state-746140293.md) — struct
