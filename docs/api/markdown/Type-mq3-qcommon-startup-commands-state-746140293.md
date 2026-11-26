# `mq3.qcommon.startup_commands.State`

[Home](README.md) · [Source file](File-src-mq3-qcommon-startup-commands-ml-835791996.md)

<a id="struct-struct-mq3-qcommon-startup-commands-state-struct-state-src-mq3-qcommon-startup-commands-ml-1160936385"></a>
## State

```ml
struct State
```

State record for qcommon.startup_commands, containing `commandState`, `lines`, `cvarSetFn`, `cvarGetFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/startup_commands.ml#L13)

## Members

<a id="field-field-mq3-qcommon-startup-commands-state-commandstate-commandstate-src-mq3-qcommon-startup-commands-ml-443335158"></a>
### commandState

```ml
commandState
```

Command buffer receiving commands parsed from the startup arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/startup_commands.ml#L15)

<a id="field-field-mq3-qcommon-startup-commands-state-context-context-src-mq3-qcommon-startup-commands-ml-1839458674"></a>
### context

```ml
context
```

Caller-supplied data associated with configuration-variable access while processing startup commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/startup_commands.ml#L24)

<a id="field-field-mq3-qcommon-startup-commands-state-cvargetfn-cvargetfn-src-mq3-qcommon-startup-commands-ml-180570282"></a>
### cvarGetFn

```ml
cvarGetFn
```

Host callback that retrieves a configuration variable from the host registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/startup_commands.ml#L21)

<a id="field-field-mq3-qcommon-startup-commands-state-cvarsetfn-cvarsetfn-src-mq3-qcommon-startup-commands-ml-356677754"></a>
### cvarSetFn

```ml
cvarSetFn
```

Host callback that sets a configuration variable in the host registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/startup_commands.ml#L19)

<a id="field-field-mq3-qcommon-startup-commands-state-lines-lines-src-mq3-qcommon-startup-commands-ml-209748014"></a>
### lines

```ml
lines
```

Startup command lines split from the process command line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/startup_commands.ml#L17)
