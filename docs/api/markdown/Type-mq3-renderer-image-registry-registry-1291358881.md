# `mq3.renderer.image_registry.Registry`

[Home](README.md) · [Source file](File-src-mq3-renderer-image-registry-ml-1972611638.md)

<a id="struct-struct-mq3-renderer-image-registry-registry-struct-registry-src-mq3-renderer-image-registry-ml-1120308457"></a>
## Registry

```ml
struct Registry
```

Data record for `mq3.renderer.image_registry.Registry`; groups `images`, `buckets`, `config`, `services`, `activeTexture`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L128)

## Members

<a id="field-field-mq3-renderer-image-registry-registry-activetexture-activetexture-src-mq3-renderer-image-registry-ml-1240644228"></a>
### activeTexture

```ml
activeTexture
```

Currently selected texture unit for image operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L138)

<a id="field-field-mq3-renderer-image-registry-registry-buckets-buckets-src-mq3-renderer-image-registry-ml-1675029128"></a>
### buckets

```ml
buckets
```

Hash-table buckets used to locate entries by name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L132)

<a id="field-field-mq3-renderer-image-registry-registry-config-config-src-mq3-renderer-image-registry-ml-119404008"></a>
### config

```ml
config
```

Configuration values used to initialize or drive this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L134)

<a id="field-field-mq3-renderer-image-registry-registry-images-images-src-mq3-renderer-image-registry-ml-1706153172"></a>
### images

```ml
images
```

Image resources or image-animation frames retained by the record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L130)

<a id="field-field-mq3-renderer-image-registry-registry-services-services-src-mq3-renderer-image-registry-ml-1743179848"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L136)
