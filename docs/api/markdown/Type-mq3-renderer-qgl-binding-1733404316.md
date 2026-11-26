# `mq3.renderer.qgl.Binding`

[Home](README.md) · [Source file](File-src-mq3-renderer-qgl-ml-2071350969.md)

<a id="struct-struct-mq3-renderer-qgl-binding-struct-binding-src-mq3-renderer-qgl-ml-182039219"></a>
## Binding

```ml
struct Binding
```

Data record for `mq3.renderer.qgl.Binding`; groups `name`, `address`, `extension`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L25)

## Members

<a id="field-field-mq3-renderer-qgl-binding-address-address-src-mq3-renderer-qgl-ml-1634410342"></a>
### address

```ml
address
```

Network address used to identify the remote or local endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L29)

<a id="field-field-mq3-renderer-qgl-binding-extension-extension-src-mq3-renderer-qgl-ml-953338362"></a>
### extension

```ml
extension
```

Whether the graphics entry point belongs to an optional extension.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L31)

<a id="field-field-mq3-renderer-qgl-binding-name-name-src-mq3-renderer-qgl-ml-664990752"></a>
### name

```ml
name
```

OpenGL function name whose native entry-point address is bound by the registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L27)
