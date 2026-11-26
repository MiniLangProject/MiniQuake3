# `mq3.renderer.tr_local.DrawBufferCommand`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-local-ml-841068495.md)

<a id="struct-struct-mq3-renderer-tr-local-drawbuffercommand-struct-drawbuffercommand-src-mq3-renderer-tr-local-ml-1806214007"></a>
## DrawBufferCommand

```ml
struct DrawBufferCommand
```

Data record for `mq3.renderer.tr_local.DrawBufferCommand`; groups `commandId`, `buffer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L124)

## Members

<a id="field-field-mq3-renderer-tr-local-drawbuffercommand-buffer-buffer-src-mq3-renderer-tr-local-ml-1050907238"></a>
### buffer

```ml
buffer
```

OpenGL draw-buffer selector to activate when this command executes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L128)

<a id="field-field-mq3-renderer-tr-local-drawbuffercommand-commandid-commandid-src-mq3-renderer-tr-local-ml-84146954"></a>
### commandId

```ml
commandId
```

Renderer command identifier selecting the backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L126)
