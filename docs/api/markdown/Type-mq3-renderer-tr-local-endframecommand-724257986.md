# `mq3.renderer.tr_local.EndFrameCommand`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-local-ml-841068495.md)

<a id="struct-struct-mq3-renderer-tr-local-endframecommand-struct-endframecommand-src-mq3-renderer-tr-local-ml-1372960247"></a>
## EndFrameCommand

```ml
struct EndFrameCommand
```

Data record for `mq3.renderer.tr_local.EndFrameCommand`; groups `commandId`, `buffer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L136)

## Members

<a id="field-field-mq3-renderer-tr-local-endframecommand-buffer-buffer-src-mq3-renderer-tr-local-ml-1733194912"></a>
### buffer

```ml
buffer
```

Buffer selector carried by the end-of-frame command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L140)

<a id="field-field-mq3-renderer-tr-local-endframecommand-commandid-commandid-src-mq3-renderer-tr-local-ml-756927076"></a>
### commandId

```ml
commandId
```

Renderer command identifier selecting the backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L138)
