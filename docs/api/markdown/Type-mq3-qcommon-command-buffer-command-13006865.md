# `mq3.qcommon.command_buffer.Command`

[Home](README.md) · [Source file](File-src-mq3-qcommon-command-buffer-ml-122952676.md)

<a id="struct-struct-mq3-qcommon-command-buffer-command-struct-command-src-mq3-qcommon-command-buffer-ml-1034650769"></a>
## Command

```ml
struct Command
```

Command record for qcommon.command_buffer, containing `name`, `callback`, `contextCallback`, `callbackContext`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L69)

## Members

<a id="field-field-mq3-qcommon-command-buffer-command-callback-callback-src-mq3-qcommon-command-buffer-ml-658337796"></a>
### callback

```ml
callback
```

Command handler invoked without an explicit context parameter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L73)

<a id="field-field-mq3-qcommon-command-buffer-command-callbackcontext-callbackcontext-src-mq3-qcommon-command-buffer-ml-549719238"></a>
### callbackContext

```ml
callbackContext
```

Opaque host data passed to the bound callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L77)

<a id="field-field-mq3-qcommon-command-buffer-command-contextcallback-contextcallback-src-mq3-qcommon-command-buffer-ml-1894979330"></a>
### contextCallback

```ml
contextCallback
```

Command handler invoked with its bound callback context.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L75)

<a id="field-field-mq3-qcommon-command-buffer-command-name-name-src-mq3-qcommon-command-buffer-ml-1756966260"></a>
### name

```ml
name
```

Console-command name used to find this handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L71)
