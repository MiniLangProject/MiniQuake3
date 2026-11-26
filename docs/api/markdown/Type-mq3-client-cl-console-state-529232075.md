# `mq3.client.cl_console.State`

[Home](README.md) · [Source file](File-src-mq3-client-cl-console-ml-1724798958.md)

<a id="struct-struct-mq3-client-cl-console-state-struct-state-src-mq3-client-cl-console-ml-662610277"></a>
## State

```ml
struct State
```

Stores engine client console state, including `initialized`, `text`, `current`, `x`, `display`, `linewidth` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L113)

## Members

<a id="field-field-mq3-client-cl-console-state-clientrunning-clientrunning-src-mq3-client-cl-console-ml-1324937702"></a>
### clientRunning

```ml
clientRunning
```

When constructing this record, `create` supplies `true` for this member. Used by `Con_Close` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L175)

<a id="field-field-mq3-client-cl-console-state-color-color-src-mq3-client-cl-console-ml-1118744794"></a>
### color

```ml
color
```

RGBA console modulation color retained in the console runtime state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L148)

<a id="field-field-mq3-client-cl-console-state-commands-commands-src-mq3-client-cl-console-ml-1016938834"></a>
### commands

```ml
commands
```

When constructing this record, `create` supplies an empty list for this member. Used by `Con_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L183)

<a id="field-field-mq3-client-cl-console-state-connectionstate-connectionstate-src-mq3-client-cl-console-ml-357445286"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L164)

<a id="field-field-mq3-client-cl-console-state-consoleinput-consoleinput-src-mq3-client-cl-console-ml-402659888"></a>
### consoleInput

```ml
consoleInput
```

When constructing this record, `create` supplies `consoleInput` for this member. Used by `setCatcher` and `Con_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L178)

<a id="field-field-mq3-client-cl-console-state-conspeed-conspeed-src-mq3-client-cl-console-ml-56710496"></a>
### conSpeed

```ml
conSpeed
```

When constructing this record, `create` supplies `3.0` for this member. Used by `Con_Init` and `Con_RunConsole` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L154)

<a id="field-field-mq3-client-cl-console-state-current-current-src-mq3-client-cl-console-ml-111122286"></a>
### current

```ml
current
```

When constructing this record, `create` supplies `0` for this member. Used by `Con_CheckResize` and `Con_Linefeed` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L120)

<a id="field-field-mq3-client-cl-console-state-display-display-src-mq3-client-cl-console-ml-1310572150"></a>
### display

```ml
display
```

When constructing this record, `create` supplies `0` for this member. Used by `Con_CheckResize` and `Con_Linefeed` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L126)

<a id="field-field-mq3-client-cl-console-state-displayfrac-displayfrac-src-mq3-client-cl-console-ml-1490798566"></a>
### displayFrac

```ml
displayFrac
```

When constructing this record, `create` supplies `0.0` for this member. Used by `Con_DrawConsole` and `Con_RunConsole` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L137)

<a id="field-field-mq3-client-cl-console-state-finalfrac-finalfrac-src-mq3-client-cl-console-ml-763414650"></a>
### finalFrac

```ml
finalFrac
```

When constructing this record, `create` supplies `0.0` for this member. Used by `Con_RunConsole` and `Con_Close` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L140)

<a id="field-field-mq3-client-cl-console-state-host-host-src-mq3-client-cl-console-ml-1521577322"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L180)

<a id="field-field-mq3-client-cl-console-state-initialized-initialized-src-mq3-client-cl-console-ml-1780677862"></a>
### initialized

```ml
initialized
```

True once console storage and line wrapping have been initialized for the current screen width.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L115)

<a id="field-field-mq3-client-cl-console-state-intermission-intermission-src-mq3-client-cl-console-ml-1707356486"></a>
### intermission

```ml
intermission
```

When constructing this record, `create` supplies `false` for this member. Used by `Con_DrawNotify` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L172)

<a id="field-field-mq3-client-cl-console-state-keycatchers-keycatchers-src-mq3-client-cl-console-ml-2027278406"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L166)

<a id="field-field-mq3-client-cl-console-state-linewidth-linewidth-src-mq3-client-cl-console-ml-921735310"></a>
### linewidth

```ml
linewidth
```

When constructing this record, `create` supplies `0` for this member. Used by `lineOffset` and `lineText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L129)

<a id="field-field-mq3-client-cl-console-state-noprint-noprint-src-mq3-client-cl-console-ml-561072262"></a>
### noPrint

```ml
noPrint
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_ConsolePrint` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L162)

<a id="field-field-mq3-client-cl-console-state-notifytime-notifytime-src-mq3-client-cl-console-ml-2084138726"></a>
### notifyTime

```ml
notifyTime
```

When constructing this record, `create` supplies `3.0` for this member. Used by `Con_Init` and `Con_DrawNotify` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L151)

<a id="field-field-mq3-client-cl-console-state-realframetime-realframetime-src-mq3-client-cl-console-ml-1963342034"></a>
### realFrametime

```ml
realFrametime
```

When constructing this record, `create` supplies `0` for this member. Used by `Con_RunConsole` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L159)

<a id="field-field-mq3-client-cl-console-state-realtime-realtime-src-mq3-client-cl-console-ml-1445526536"></a>
### realtime

```ml
realtime
```

Local client clock in milliseconds used for console notification ages and input cursor blinking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L156)

<a id="field-field-mq3-client-cl-console-state-text-text-src-mq3-client-cl-console-ml-1913244368"></a>
### text

```ml
text
```

Editable or accumulated console text retained for drawing and command submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L117)

<a id="field-field-mq3-client-cl-console-state-times-times-src-mq3-client-cl-console-ml-484834758"></a>
### times

```ml
times
```

When constructing this record, `create` supplies `[0,0,0,0]` for this member. Used by `Con_ClearNotify` and `Con_Linefeed` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L146)

<a id="field-field-mq3-client-cl-console-state-totallines-totallines-src-mq3-client-cl-console-ml-2124762700"></a>
### totallines

```ml
totallines
```

When constructing this record, `create` supplies `0` for this member. Used by `lineOffset` and `lineText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L132)

<a id="field-field-mq3-client-cl-console-state-uiorcgamecatcher-uiorcgamecatcher-src-mq3-client-cl-console-ml-1401636502"></a>
### uiOrCgameCatcher

```ml
uiOrCgameCatcher
```

When constructing this record, `create` supplies `0` for this member. Used by `Con_DrawNotify` and `Con_DrawConsole` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L169)

<a id="field-field-mq3-client-cl-console-state-vislines-vislines-src-mq3-client-cl-console-ml-479360880"></a>
### vislines

```ml
vislines
```

When constructing this record, `create` supplies `0` for this member. Used by `Con_DrawInput` and `Con_DrawSolidConsole` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L143)

<a id="field-field-mq3-client-cl-console-state-x-x-src-mq3-client-cl-console-ml-905898742"></a>
### x

```ml
x
```

Current character column in the console's output line, advanced as characters are appended to scrollback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L123)

<a id="field-field-mq3-client-cl-console-state-xadjust-xadjust-src-mq3-client-cl-console-ml-1026932490"></a>
### xadjust

```ml
xadjust
```

When constructing this record, `create` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L134)
