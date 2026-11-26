# `mq3.renderer.command_queue.Queue`

[Home](README.md) · [Source file](File-src-mq3-renderer-command-queue-ml-1425855282.md)

<a id="struct-struct-mq3-renderer-command-queue-queue-struct-queue-src-mq3-renderer-command-queue-ml-2077951015"></a>
## Queue

```ml
struct Queue
```

Data record for `mq3.renderer.command_queue.Queue`; groups `commands`, `used`, `registered`, `shaderFn`, `shaderContext`, `commandList`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L48)

## Members

<a id="field-field-mq3-renderer-command-queue-queue-commandlist-commandlist-src-mq3-renderer-command-queue-ml-951241174"></a>
### commandList

```ml
commandList
```

Serialized render-command list backing the queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L60)

<a id="field-field-mq3-renderer-command-queue-queue-commands-commands-src-mq3-renderer-command-queue-ml-1972046374"></a>
### commands

```ml
commands
```

Operations or drawing commands queued by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L50)

<a id="field-field-mq3-renderer-command-queue-queue-registered-registered-src-mq3-renderer-command-queue-ml-20677730"></a>
### registered

```ml
registered
```

Whether the subsystem has completed resource registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L54)

<a id="field-field-mq3-renderer-command-queue-queue-shadercontext-shadercontext-src-mq3-renderer-command-queue-ml-553993838"></a>
### shaderContext

```ml
shaderContext
```

Host state supplied to the shader-resolution callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L58)

<a id="field-field-mq3-renderer-command-queue-queue-shaderfn-shaderfn-src-mq3-renderer-command-queue-ml-239590740"></a>
### shaderFn

```ml
shaderFn
```

Host callback used to perform shader operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L56)

<a id="field-field-mq3-renderer-command-queue-queue-used-used-src-mq3-renderer-command-queue-ml-707292272"></a>
### used

```ml
used
```

Number of bytes reserved by the queued render commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L52)
