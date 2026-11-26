# `mq3.renderer.tr_image_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-image-runtime-ml-1468528624.md)

<a id="struct-struct-mq3-renderer-tr-image-runtime-state-struct-state-src-mq3-renderer-tr-image-runtime-ml-1735669685"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_image_runtime.State`; groups `images`, `services`, `skins`, `fogTable`, `gammaTable`, `intensityTable`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L57)

## Members

<a id="field-field-mq3-renderer-tr-image-runtime-state-defaultimage-defaultimage-src-mq3-renderer-tr-image-runtime-ml-2121478182"></a>
### defaultImage

```ml
defaultImage
```

Fallback image used when a requested texture is unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L83)

<a id="field-field-mq3-renderer-tr-image-runtime-state-dlightimage-dlightimage-src-mq3-renderer-tr-image-runtime-ml-1365961650"></a>
### dlightImage

```ml
dlightImage
```

Texture used when projecting dynamic-light contributions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L91)

<a id="field-field-mq3-renderer-tr-image-runtime-state-filtermax-filtermax-src-mq3-renderer-tr-image-runtime-ml-239878266"></a>
### filterMax

```ml
filterMax
```

Graphics filtering mode used when textures are magnified.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L81)

<a id="field-field-mq3-renderer-tr-image-runtime-state-filtermin-filtermin-src-mq3-renderer-tr-image-runtime-ml-1245382850"></a>
### filterMin

```ml
filterMin
```

Graphics filtering mode used when textures are minified.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L79)

<a id="field-field-mq3-renderer-tr-image-runtime-state-filtername-filtername-src-mq3-renderer-tr-image-runtime-ml-174981108"></a>
### filterName

```ml
filterName
```

Configured texture-filtering mode name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L77)

<a id="field-field-mq3-renderer-tr-image-runtime-state-fogimage-fogimage-src-mq3-renderer-tr-image-runtime-ml-350025460"></a>
### fogImage

```ml
fogImage
```

Texture used to evaluate fog density during rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L93)

<a id="field-field-mq3-renderer-tr-image-runtime-state-fogtable-fogtable-src-mq3-renderer-tr-image-runtime-ml-66182090"></a>
### fogTable

```ml
fogTable
```

Lookup table used to compute distance-based fog intensity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L65)

<a id="field-field-mq3-renderer-tr-image-runtime-state-gammatable-gammatable-src-mq3-renderer-tr-image-runtime-ml-1230281044"></a>
### gammaTable

```ml
gammaTable
```

Lookup table used to apply gamma correction to color samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L67)

<a id="field-field-mq3-renderer-tr-image-runtime-state-identitylight-identitylight-src-mq3-renderer-tr-image-runtime-ml-1250153762"></a>
### identityLight

```ml
identityLight
```

Identity lighting scale after accounting for overbright settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L73)

<a id="field-field-mq3-renderer-tr-image-runtime-state-identitylightbyte-identitylightbyte-src-mq3-renderer-tr-image-runtime-ml-1834835702"></a>
### identityLightByte

```ml
identityLightByte
```

Identity lighting scale represented as an eight-bit color component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L75)

<a id="field-field-mq3-renderer-tr-image-runtime-state-identitylightimage-identitylightimage-src-mq3-renderer-tr-image-runtime-ml-1967533200"></a>
### identityLightImage

```ml
identityLightImage
```

Texture containing the renderer's identity-light color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L87)

<a id="field-field-mq3-renderer-tr-image-runtime-state-images-images-src-mq3-renderer-tr-image-runtime-ml-1949568286"></a>
### images

```ml
images
```

Image registry containing uploaded textures and image-name lookup state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-image-runtime-state-intensitytable-intensitytable-src-mq3-renderer-tr-image-runtime-ml-35375396"></a>
### intensityTable

```ml
intensityTable
```

Lookup table used to scale texture intensity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L69)

<a id="field-field-mq3-renderer-tr-image-runtime-state-overbrightbits-overbrightbits-src-mq3-renderer-tr-image-runtime-ml-1437181014"></a>
### overbrightBits

```ml
overbrightBits
```

Number of additional brightness bits used by color mapping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L71)

<a id="field-field-mq3-renderer-tr-image-runtime-state-scratchimages-scratchimages-src-mq3-renderer-tr-image-runtime-ml-1818476834"></a>
### scratchImages

```ml
scratchImages
```

Reusable image slots used by cinematics and temporary uploads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L89)

<a id="field-field-mq3-renderer-tr-image-runtime-state-services-services-src-mq3-renderer-tr-image-runtime-ml-518896626"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L61)

<a id="field-field-mq3-renderer-tr-image-runtime-state-skins-skins-src-mq3-renderer-tr-image-runtime-ml-1842009578"></a>
### skins

```ml
skins
```

Registered skin definitions and their surface mappings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L63)

<a id="field-field-mq3-renderer-tr-image-runtime-state-whiteimage-whiteimage-src-mq3-renderer-tr-image-runtime-ml-717197854"></a>
### whiteImage

```ml
whiteImage
```

Solid-white texture used by color-only drawing paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L85)
