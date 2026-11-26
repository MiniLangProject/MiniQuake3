# `mq3.renderer.qgl.Registry`

[Home](README.md) · [Source file](File-src-mq3-renderer-qgl-ml-2071350969.md)

<a id="struct-struct-mq3-renderer-qgl-registry-struct-registry-src-mq3-renderer-qgl-ml-538076399"></a>
## Registry

```ml
struct Registry
```

Data record for `mq3.renderer.qgl.Registry`; groups `bindings`, `loaded`, `driver`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L34)

## Members

<a id="field-field-mq3-renderer-qgl-registry-bindings-bindings-src-mq3-renderer-qgl-ml-1977682670"></a>
### bindings

```ml
bindings
```

Bindings associating names or handles with their backing resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L36)

<a id="field-field-mq3-renderer-qgl-registry-driver-driver-src-mq3-renderer-qgl-ml-1123773334"></a>
### driver

```ml
driver
```

Graphics driver selected or loaded by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L40)

<a id="field-field-mq3-renderer-qgl-registry-loaded-loaded-src-mq3-renderer-qgl-ml-1095002740"></a>
### loaded

```ml
loaded
```

Whether the selected graphics driver and entry points have been loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L38)
