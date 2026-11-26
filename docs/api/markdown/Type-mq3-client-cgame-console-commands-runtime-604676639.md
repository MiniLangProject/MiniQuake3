# `mq3.client.cgame_console_commands.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-console-commands-ml-1236537113.md)

<a id="struct-struct-mq3-client-cgame-console-commands-runtime-struct-runtime-src-mq3-client-cgame-console-commands-ml-1654835381"></a>
## Runtime

```ml
struct Runtime
```

Stores client game console commands runtime wiring and state, including `commandState`, `registry`, `state`, `targetNum`, `attackerNum`, `time` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L384)

## Members

<a id="field-field-mq3-client-cgame-console-commands-runtime-actions-actions-src-mq3-client-cgame-console-commands-ml-1227954085"></a>
### actions

```ml
actions
```

Host requests queued while executing local CGame commands, including score, view, and weapon-selection requests, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L413)

<a id="field-field-mq3-client-cgame-console-commands-runtime-attackernum-attackernum-src-mq3-client-cgame-console-commands-ml-904091889"></a>
### attackerNum

```ml
attackerNum
```

When constructing this record, `createRuntime` supplies `-1` for this member. Used by `CG_TellAttacker_f` and `CG_VoiceTellAttacker_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L399)

<a id="field-field-mq3-client-cgame-console-commands-runtime-cameraloadsucceeded-cameraloadsucceeded-src-mq3-client-cgame-console-commands-ml-328400425"></a>
### cameraLoadSucceeded

```ml
cameraLoadSucceeded
```

When constructing this record, `createRuntime` supplies `false` for this member. Used by `CG_Camera_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L427)

<a id="field-field-mq3-client-cgame-console-commands-runtime-cameramode-cameramode-src-mq3-client-cgame-console-commands-ml-1369664761"></a>
### cameraMode

```ml
cameraMode
```

When constructing this record, `createRuntime` supplies `false` for this member. Used by `CG_Camera_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L430)

<a id="field-field-mq3-client-cgame-console-commands-runtime-camerastarttime-camerastarttime-src-mq3-client-cgame-console-commands-ml-259345489"></a>
### cameraStartTime

```ml
cameraStartTime
```

Client timestamp at which the scripted camera sequence began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L432)

<a id="field-field-mq3-client-cgame-console-commands-runtime-commandstate-commandstate-src-mq3-client-cgame-console-commands-ml-771427933"></a>
### commandState

```ml
commandState
```

When constructing this record, `createRuntime` supplies `commands.create()` for this member. Used by `absorb` and `Cmd_Argv` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L387)

<a id="field-field-mq3-client-cgame-console-commands-runtime-eventhandling-eventhandling-src-mq3-client-cgame-console-commands-ml-48508917"></a>
### eventHandling

```ml
eventHandling
```

When constructing this record, `createRuntime` supplies `0` for this member. Used by `CG_TeamMenu_f` and `CG_EditHud_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L424)

<a id="field-field-mq3-client-cgame-console-commands-runtime-keycatcher-keycatcher-src-mq3-client-cgame-console-commands-ml-85269363"></a>
### keyCatcher

```ml
keyCatcher
```

Input-capture bitmask selecting which client subsystem currently receives key events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L421)

<a id="field-field-mq3-client-cgame-console-commands-runtime-missionpack-missionpack-src-mq3-client-cgame-console-commands-ml-98578057"></a>
### missionpack

```ml
missionpack
```

When constructing this record, `createRuntime` supplies `missionpack` for this member. Used by `CG_InitConsoleCommands` and `CG_ConsoleCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L404)

<a id="field-field-mq3-client-cgame-console-commands-runtime-registeredcommands-registeredcommands-src-mq3-client-cgame-console-commands-ml-2001643909"></a>
### registeredCommands

```ml
registeredCommands
```

When constructing this record, `createRuntime` supplies an empty list for this member. Used by `CG_InitConsoleCommands` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L410)

<a id="field-field-mq3-client-cgame-console-commands-runtime-registry-registry-src-mq3-client-cgame-console-commands-ml-437729811"></a>
### registry

```ml
registry
```

When constructing this record, `createRuntime` supplies `registry` for this member. Used by `absorb` and `CG_LoadHud_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L390)

<a id="field-field-mq3-client-cgame-console-commands-runtime-retailactive-retailactive-src-mq3-client-cgame-console-commands-ml-2145927623"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns CGame console-command handling, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L407)

<a id="field-field-mq3-client-cgame-console-commands-runtime-state-state-src-mq3-client-cgame-console-commands-ml-1620926429"></a>
### state

```ml
state
```

When constructing this record, `createRuntime` supplies `create()` for this member. Used by `CG_SizeUp_f` and `CG_SizeDown_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L393)

<a id="field-field-mq3-client-cgame-console-commands-runtime-targetnum-targetnum-src-mq3-client-cgame-console-commands-ml-797656465"></a>
### targetNum

```ml
targetNum
```

When constructing this record, `createRuntime` supplies `-1` for this member. Used by `CG_TargetCommand_f` and `CG_TellTarget_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L396)

<a id="field-field-mq3-client-cgame-console-commands-runtime-time-time-src-mq3-client-cgame-console-commands-ml-219295619"></a>
### time

```ml
time
```

Client-game time in milliseconds supplied to scoreboard and team-order console-command handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L401)

<a id="field-field-mq3-client-cgame-console-commands-runtime-vieworigin-vieworigin-src-mq3-client-cgame-console-commands-ml-978158811"></a>
### viewOrigin

```ml
viewOrigin
```

When constructing this record, `createRuntime` supplies `[0.0,0.0,0.0]` for this member. Used by `CG_Viewpos_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L416)

<a id="field-field-mq3-client-cgame-console-commands-runtime-viewyaw-viewyaw-src-mq3-client-cgame-console-commands-ml-1481227797"></a>
### viewYaw

```ml
viewYaw
```

When constructing this record, `createRuntime` supplies `0.0` for this member. Used by `CG_Viewpos_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L419)
