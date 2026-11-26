# `mq3.renderer.tr_light_runtime.Dlight`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-light-runtime-ml-1502188283.md)

<a id="struct-struct-mq3-renderer-tr-light-runtime-dlight-struct-dlight-src-mq3-renderer-tr-light-runtime-ml-1236925443"></a>
## Dlight

```ml
struct Dlight
```

Data record for `mq3.renderer.tr_light_runtime.Dlight`; groups `origin`, `transformed`, `radius`, `color`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L35)

## Members

<a id="field-field-mq3-renderer-tr-light-runtime-dlight-color-color-src-mq3-renderer-tr-light-runtime-ml-604015471"></a>
### color

```ml
color
```

RGB light intensity accumulated into an entity's dynamic-light contribution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L43)

<a id="field-field-mq3-renderer-tr-light-runtime-dlight-origin-origin-src-mq3-renderer-tr-light-runtime-ml-283622183"></a>
### origin

```ml
origin
```

Untransformed world-space center of the dynamic light.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L37)

<a id="field-field-mq3-renderer-tr-light-runtime-dlight-radius-radius-src-mq3-renderer-tr-light-runtime-ml-1365769295"></a>
### radius

```ml
radius
```

Radius used for the light, sprite, beam, or bounded object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L41)

<a id="field-field-mq3-renderer-tr-light-runtime-dlight-transformed-transformed-src-mq3-renderer-tr-light-runtime-ml-728643827"></a>
### transformed

```ml
transformed
```

Dynamic-light origin expressed in the current entity's coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L39)
