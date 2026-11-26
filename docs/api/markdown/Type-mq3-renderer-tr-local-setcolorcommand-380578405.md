# `mq3.renderer.tr_local.SetColorCommand`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-local-ml-841068495.md)

<a id="struct-struct-mq3-renderer-tr-local-setcolorcommand-struct-setcolorcommand-src-mq3-renderer-tr-local-ml-1331778469"></a>
## SetColorCommand

```ml
struct SetColorCommand
```

Data record for `mq3.renderer.tr_local.SetColorCommand`; groups `commandId`, `color`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L117)

## Members

<a id="field-field-mq3-renderer-tr-local-setcolorcommand-color-color-src-mq3-renderer-tr-local-ml-1839694509"></a>
### color

```ml
color
```

RGBA modulation value installed for subsequent two-dimensional renderer commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L121)

<a id="field-field-mq3-renderer-tr-local-setcolorcommand-commandid-commandid-src-mq3-renderer-tr-local-ml-479998925"></a>
### commandId

```ml
commandId
```

Renderer command identifier selecting the backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L119)
