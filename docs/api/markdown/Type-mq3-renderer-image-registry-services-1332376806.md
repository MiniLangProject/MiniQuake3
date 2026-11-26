# `mq3.renderer.image_registry.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-image-registry-ml-1972611638.md)

<a id="struct-struct-mq3-renderer-image-registry-services-struct-services-src-mq3-renderer-image-registry-ml-163860113"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.image_registry.Services`; exposes `loadFn`, `releaseFn`, `submitFn`, `diagnosticFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L115)

## Members

<a id="field-field-mq3-renderer-image-registry-services-context-context-src-mq3-renderer-image-registry-ml-1299293269"></a>
### context

```ml
context
```

Image-loader and graphics-host state passed to resource loading, release, and upload callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L125)

<a id="field-field-mq3-renderer-image-registry-services-diagnosticfn-diagnosticfn-src-mq3-renderer-image-registry-ml-549634963"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback used to perform diagnostic operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L123)

<a id="field-field-mq3-renderer-image-registry-services-loadfn-loadfn-src-mq3-renderer-image-registry-ml-884562013"></a>
### loadFn

```ml
loadFn
```

Host callback used to perform load operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L117)

<a id="field-field-mq3-renderer-image-registry-services-releasefn-releasefn-src-mq3-renderer-image-registry-ml-213366181"></a>
### releaseFn

```ml
releaseFn
```

Host callback used to perform release operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L119)

<a id="field-field-mq3-renderer-image-registry-services-submitfn-submitfn-src-mq3-renderer-image-registry-ml-1066900985"></a>
### submitFn

```ml
submitFn
```

Host callback used to perform submit operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L121)
