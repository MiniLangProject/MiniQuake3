# `mq3.renderer.image_registry.UploadConfig`

[Home](README.md) · [Source file](File-src-mq3-renderer-image-registry-ml-1972611638.md)

<a id="struct-struct-mq3-renderer-image-registry-uploadconfig-struct-uploadconfig-src-mq3-renderer-image-registry-ml-1599500257"></a>
## UploadConfig

```ml
struct UploadConfig
```

Data record for `mq3.renderer.image_registry.UploadConfig`; groups `roundImagesDown`, `picmip`, `maxTextureSize`, `textureBits`, `textureCompression`, `simpleMipMaps`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L41)

## Members

<a id="field-field-mq3-renderer-image-registry-uploadconfig-devicesupportsgamma-devicesupportsgamma-src-mq3-renderer-image-registry-ml-39133696"></a>
### deviceSupportsGamma

```ml
deviceSupportsGamma
```

Whether the display supports hardware gamma-ramp updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L55)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-gammatable-gammatable-src-mq3-renderer-image-registry-ml-442104782"></a>
### gammaTable

```ml
gammaTable
```

Lookup table used to apply gamma correction to color samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L57)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-intensitytable-intensitytable-src-mq3-renderer-image-registry-ml-1768047854"></a>
### intensityTable

```ml
intensityTable
```

Lookup table used to scale texture intensity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L59)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-maxtexturesize-maxtexturesize-src-mq3-renderer-image-registry-ml-252336908"></a>
### maxTextureSize

```ml
maxTextureSize
```

Largest supported texture dimension reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L47)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-picmip-picmip-src-mq3-renderer-image-registry-ml-1569889596"></a>
### picmip

```ml
picmip
```

Global mip-level reduction applied to eligible textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L45)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-roundimagesdown-roundimagesdown-src-mq3-renderer-image-registry-ml-1187981196"></a>
### roundImagesDown

```ml
roundImagesDown
```

Whether non-power-of-two images round down when resized for upload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L43)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-simplemipmaps-simplemipmaps-src-mq3-renderer-image-registry-ml-1554024776"></a>
### simpleMipMaps

```ml
simpleMipMaps
```

Whether mip levels use the simple downsampling filter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L53)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-texturebits-texturebits-src-mq3-renderer-image-registry-ml-1443487712"></a>
### textureBits

```ml
textureBits
```

Requested color precision for uploaded textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L49)

<a id="field-field-mq3-renderer-image-registry-uploadconfig-texturecompression-texturecompression-src-mq3-renderer-image-registry-ml-58456790"></a>
### textureCompression

```ml
textureCompression
```

Selected texture-compression capability or mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L51)
