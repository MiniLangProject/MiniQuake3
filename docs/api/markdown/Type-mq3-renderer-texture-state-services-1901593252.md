# `mq3.renderer.texture_state.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-texture-state-ml-1230714594.md)

<a id="struct-struct-mq3-renderer-texture-state-services-struct-services-src-mq3-renderer-texture-state-ml-1558728719"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.texture_state.Services`; exposes `bindTextureFn`, `activeTextureFn`, `clientActiveTextureFn`, `logFn`, `warningFn`, `dropFn`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L21)

## Members

<a id="field-field-mq3-renderer-texture-state-services-activetexturefn-activetexturefn-src-mq3-renderer-texture-state-ml-804812469"></a>
### activeTextureFn

```ml
activeTextureFn
```

Host callback used to perform active texture operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L25)

<a id="field-field-mq3-renderer-texture-state-services-bindtexturefn-bindtexturefn-src-mq3-renderer-texture-state-ml-590917293"></a>
### bindTextureFn

```ml
bindTextureFn
```

Host callback used to perform bind texture operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L23)

<a id="field-field-mq3-renderer-texture-state-services-clientactivetexturefn-clientactivetexturefn-src-mq3-renderer-texture-state-ml-1563250105"></a>
### clientActiveTextureFn

```ml
clientActiveTextureFn
```

Host callback used to perform client active texture operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L27)

<a id="field-field-mq3-renderer-texture-state-services-context-context-src-mq3-renderer-texture-state-ml-1260662229"></a>
### context

```ml
context
```

Graphics-host state passed when binding textures, selecting texture units, or reporting state errors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L36)

<a id="field-field-mq3-renderer-texture-state-services-dropfn-dropfn-src-mq3-renderer-texture-state-ml-498528267"></a>
### dropFn

```ml
dropFn
```

Host callback used to perform drop operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L33)

<a id="field-field-mq3-renderer-texture-state-services-logfn-logfn-src-mq3-renderer-texture-state-ml-2034066941"></a>
### logFn

```ml
logFn
```

Host callback used to perform log operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L29)

<a id="field-field-mq3-renderer-texture-state-services-warningfn-warningfn-src-mq3-renderer-texture-state-ml-480079009"></a>
### warningFn

```ml
warningFn
```

Host callback used to perform warning operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L31)
