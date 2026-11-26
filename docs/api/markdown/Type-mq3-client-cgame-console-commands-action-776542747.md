# `mq3.client.cgame_console_commands.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-console-commands-ml-1236537113.md)

<a id="struct-struct-mq3-client-cgame-console-commands-action-struct-action-src-mq3-client-cgame-console-commands-ml-1155616455"></a>
## Action

```ml
struct Action
```

Typed host boundary used by the fully native command dispatcher.  The retail QVM host sets retailActive so the native mirror can still be checked without sending a command, changing a Cvar, or drawing the same UI twice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L362)

## Members

<a id="field-field-mq3-client-cgame-console-commands-action-boundary-boundary-src-mq3-client-cgame-console-commands-ml-337145745"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while executing local CGame commands, including score, view, and weapon-selection requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L365)

<a id="field-field-mq3-client-cgame-console-commands-action-dispatched-dispatched-src-mq3-client-cgame-console-commands-ml-1064161919"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while executing local CGame commands, including score, view, and weapon-selection requests; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L381)

<a id="field-field-mq3-client-cgame-console-commands-action-kind-kind-src-mq3-client-cgame-console-commands-ml-492482569"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while executing local CGame commands, including score, view, and weapon-selection requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L368)

<a id="field-field-mq3-client-cgame-console-commands-action-name-name-src-mq3-client-cgame-console-commands-ml-163811555"></a>
### name

```ml
name
```

Cvar, console command, client command, or sound resource targeted by the client-game command effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L371)

<a id="field-field-mq3-client-cgame-console-commands-action-number-number-src-mq3-client-cgame-console-commands-ml-1545559863"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while executing local CGame commands, including score, view, and weapon-selection requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L378)

<a id="field-field-mq3-client-cgame-console-commands-action-text-text-src-mq3-client-cgame-console-commands-ml-567591687"></a>
### text

```ml
text
```

Cvar value, executable command text, or console message produced by a client-game console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L373)

<a id="field-field-mq3-client-cgame-console-commands-action-text2-text2-src-mq3-client-cgame-console-commands-ml-2019747409"></a>
### text2

```ml
text2
```

When constructing this record, `emit` supplies `text2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L375)
