# `mq3.renderer.command_queue.Command`

[Home](README.md) · [Source file](File-src-mq3-renderer-command-queue-ml-1425855282.md)

<a id="struct-struct-mq3-renderer-command-queue-command-struct-command-src-mq3-renderer-command-queue-ml-80778739"></a>
## Command

```ml
struct Command
```

Data record for `mq3.renderer.command_queue.Command`; groups `id`, `bytes`, `values`, `shader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L37)

## Members

<a id="field-field-mq3-renderer-command-queue-command-bytes-bytes-src-mq3-renderer-command-queue-ml-2091039104"></a>
### bytes

```ml
bytes
```

Serialized byte size reserved for this render command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L41)

<a id="field-field-mq3-renderer-command-queue-command-id-id-src-mq3-renderer-command-queue-ml-1534085958"></a>
### id

```ml
id
```

Command identifier selecting the renderer backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L39)

<a id="field-field-mq3-renderer-command-queue-command-shader-shader-src-mq3-renderer-command-queue-ml-48912690"></a>
### shader

```ml
shader
```

Resolved shader record or handle used for this drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L45)

<a id="field-field-mq3-renderer-command-queue-command-values-values-src-mq3-renderer-command-queue-ml-841531384"></a>
### values

```ml
values
```

Numeric parameters interpreted according to the texture modifier's kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L43)
