# `mq3.qcommon.command_buffer.State`

[Home](README.md) · [Source file](File-src-mq3-qcommon-command-buffer-ml-122952676.md)

<a id="struct-struct-mq3-qcommon-command-buffer-state-struct-state-src-mq3-qcommon-command-buffer-ml-1688664545"></a>
## State

```ml
struct State
```

State record for qcommon.command_buffer, containing `buffer`, `argv`, `command`, `wait`, `executeFn`, `printFn`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L24)

## Members

<a id="field-field-mq3-qcommon-command-buffer-state-argv-argv-src-mq3-qcommon-command-buffer-ml-609002514"></a>
### argv

```ml
argv
```

Parsed arguments of the command currently being executed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L28)

<a id="field-field-mq3-qcommon-command-buffer-state-buffer-buffer-src-mq3-qcommon-command-buffer-ml-244279654"></a>
### buffer

```ml
buffer
```

Pending console-command text in execution order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L26)

<a id="field-field-mq3-qcommon-command-buffer-state-clientgamecommandfn-clientgamecommandfn-src-mq3-qcommon-command-buffer-ml-896814762"></a>
### clientGameCommandFn

```ml
clientGameCommandFn
```

Host callback that offers a console command to the client-game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L49)

<a id="field-field-mq3-qcommon-command-buffer-state-clientrunning-clientrunning-src-mq3-qcommon-command-buffer-ml-350221442"></a>
### clientRunning

```ml
clientRunning
```

True while a local client is available to process commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L57)

<a id="field-field-mq3-qcommon-command-buffer-state-command-command-src-mq3-qcommon-command-buffer-ml-1971796294"></a>
### command

```ml
command
```

Text of the console command currently being executed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L30)

<a id="field-field-mq3-qcommon-command-buffer-state-context-context-src-mq3-qcommon-command-buffer-ml-520345498"></a>
### context

```ml
context
```

Caller-supplied data associated with console command execution, script loading, and command diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L39)

<a id="field-field-mq3-qcommon-command-buffer-state-cvarcommandcontext-cvarcommandcontext-src-mq3-qcommon-command-buffer-ml-1711374482"></a>
### cvarCommandContext

```ml
cvarCommandContext
```

Opaque context passed to the configuration-variable command handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L47)

<a id="field-field-mq3-qcommon-command-buffer-state-cvarcommandfn-cvarcommandfn-src-mq3-qcommon-command-buffer-ml-582628402"></a>
### cvarCommandFn

```ml
cvarCommandFn
```

Host callback that handles a console command naming a configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L43)

<a id="field-field-mq3-qcommon-command-buffer-state-cvarcontextcommandfn-cvarcontextcommandfn-src-mq3-qcommon-command-buffer-ml-109846082"></a>
### cvarContextCommandFn

```ml
cvarContextCommandFn
```

Host callback that handles a configuration-variable command using the bound callback context.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L45)

<a id="field-field-mq3-qcommon-command-buffer-state-cvarstringfn-cvarstringfn-src-mq3-qcommon-command-buffer-ml-1063122648"></a>
### cvarStringFn

```ml
cvarStringFn
```

Host callback that reads the text value of a host configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L61)

<a id="field-field-mq3-qcommon-command-buffer-state-executefn-executefn-src-mq3-qcommon-command-buffer-ml-1124425206"></a>
### executeFn

```ml
executeFn
```

Host callback that executes a routed command or operation on the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L34)

<a id="field-field-mq3-qcommon-command-buffer-state-forwardcommandfn-forwardcommandfn-src-mq3-qcommon-command-buffer-ml-1427326374"></a>
### forwardCommandFn

```ml
forwardCommandFn
```

Host callback that forwards an unhandled console command to the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L55)

<a id="field-field-mq3-qcommon-command-buffer-state-freefilefn-freefilefn-src-mq3-qcommon-command-buffer-ml-80657858"></a>
### freeFileFn

```ml
freeFileFn
```

Host callback that releases file bytes supplied by the host loader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L65)

<a id="field-field-mq3-qcommon-command-buffer-state-functions-functions-src-mq3-qcommon-command-buffer-ml-833094474"></a>
### functions

```ml
functions
```

Registered command names and their bound handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L41)

<a id="field-field-mq3-qcommon-command-buffer-state-printfn-printfn-src-mq3-qcommon-command-buffer-ml-1732388986"></a>
### printFn

```ml
printFn
```

Host callback that prints console command errors and command-list output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L36)

<a id="field-field-mq3-qcommon-command-buffer-state-readfilefn-readfilefn-src-mq3-qcommon-command-buffer-ml-404374582"></a>
### readFileFn

```ml
readFileFn
```

Host callback that reads a requested file through the host filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L63)

<a id="field-field-mq3-qcommon-command-buffer-state-servergamecommandfn-servergamecommandfn-src-mq3-qcommon-command-buffer-ml-1778177698"></a>
### serverGameCommandFn

```ml
serverGameCommandFn
```

Host callback that offers a console command to the server game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L51)

<a id="field-field-mq3-qcommon-command-buffer-state-serverrunning-serverrunning-src-mq3-qcommon-command-buffer-ml-1372859834"></a>
### serverRunning

```ml
serverRunning
```

True while a local server is available to process commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L59)

<a id="field-field-mq3-qcommon-command-buffer-state-uigamecommandfn-uigamecommandfn-src-mq3-qcommon-command-buffer-ml-2102556694"></a>
### uiGameCommandFn

```ml
uiGameCommandFn
```

Host callback that offers a console command to the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L53)

<a id="field-field-mq3-qcommon-command-buffer-state-wait-wait-src-mq3-qcommon-command-buffer-ml-1848817484"></a>
### wait

```ml
wait
```

Number of command-buffer execution passes to defer before continuing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/command_buffer.ml#L32)
