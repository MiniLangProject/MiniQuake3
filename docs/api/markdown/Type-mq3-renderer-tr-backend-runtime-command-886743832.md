# `mq3.renderer.tr_backend_runtime.Command`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-command-struct-command-src-mq3-renderer-tr-backend-runtime-ml-1619278131"></a>
## Command

```ml
struct Command
```

Data record for `mq3.renderer.tr_backend_runtime.Command`; groups `id`, `payload`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L199)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-command-id-id-src-mq3-renderer-tr-backend-runtime-ml-1160980208"></a>
### id

```ml
id
```

Command identifier selecting the renderer backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L201)

<a id="field-field-mq3-renderer-tr-backend-runtime-command-payload-payload-src-mq3-renderer-tr-backend-runtime-ml-1540455702"></a>
### payload

```ml
payload
```

Operation-specific data interpreted according to the record's command or event type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L203)
