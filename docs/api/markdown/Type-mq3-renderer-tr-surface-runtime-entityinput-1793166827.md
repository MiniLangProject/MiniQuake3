# `mq3.renderer.tr_surface_runtime.EntityInput`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-surface-runtime-ml-230018798.md)

<a id="struct-struct-mq3-renderer-tr-surface-runtime-entityinput-struct-entityinput-src-mq3-renderer-tr-surface-runtime-ml-411215553"></a>
## EntityInput

```ml
struct EntityInput
```

Data record for `mq3.renderer.tr_surface_runtime.EntityInput`; groups `reType`, `origin`, `oldOrigin`, `radius`, `rotation`, `shaderRGBA`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L51)

## Members

<a id="field-field-mq3-renderer-tr-surface-runtime-entityinput-oldorigin-oldorigin-src-mq3-renderer-tr-surface-runtime-ml-1261586466"></a>
### oldOrigin

```ml
oldOrigin
```

Previous entity position used by interpolation or beam geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-surface-runtime-entityinput-origin-origin-src-mq3-renderer-tr-surface-runtime-ml-1078997134"></a>
### origin

```ml
origin
```

Entity position used when constructing sprite, beam, rail, or lightning surface geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L55)

<a id="field-field-mq3-renderer-tr-surface-runtime-entityinput-radius-radius-src-mq3-renderer-tr-surface-runtime-ml-1805374150"></a>
### radius

```ml
radius
```

Radius used for the light, sprite, beam, or bounded object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-surface-runtime-entityinput-retype-retype-src-mq3-renderer-tr-surface-runtime-ml-362135780"></a>
### reType

```ml
reType
```

Renderer entity type selecting the model, sprite, beam, or portal path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L53)

<a id="field-field-mq3-renderer-tr-surface-runtime-entityinput-rotation-rotation-src-mq3-renderer-tr-surface-runtime-ml-1532368622"></a>
### rotation

```ml
rotation
```

Sprite rotation angle in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L61)

<a id="field-field-mq3-renderer-tr-surface-runtime-entityinput-shaderrgba-shaderrgba-src-mq3-renderer-tr-surface-runtime-ml-173030192"></a>
### shaderRGBA

```ml
shaderRGBA
```

Entity RGBA color bytes used by entity-driven shader generators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L63)
