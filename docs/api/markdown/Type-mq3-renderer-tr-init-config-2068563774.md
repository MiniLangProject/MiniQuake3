# `mq3.renderer.tr_init.Config`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-init-ml-1583039474.md)

<a id="struct-struct-mq3-renderer-tr-init-config-struct-config-src-mq3-renderer-tr-init-ml-805714543"></a>
## Config

```ml
struct Config
```

Data record for `mq3.renderer.tr_init.Config`; groups `vendor`, `renderer`, `version`, `extensions`, `maxTextureSize`, `maxActiveTextures`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L49)

## Members

<a id="field-field-mq3-renderer-tr-init-config-colorbits-colorbits-src-mq3-renderer-tr-init-ml-970809283"></a>
### colorBits

```ml
colorBits
```

Color-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L63)

<a id="field-field-mq3-renderer-tr-init-config-depthbits-depthbits-src-mq3-renderer-tr-init-ml-489818343"></a>
### depthBits

```ml
depthBits
```

Depth-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L65)

<a id="field-field-mq3-renderer-tr-init-config-displayfrequency-displayfrequency-src-mq3-renderer-tr-init-ml-476580227"></a>
### displayFrequency

```ml
displayFrequency
```

Refresh frequency of the selected display mode, in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L73)

<a id="field-field-mq3-renderer-tr-init-config-extensions-extensions-src-mq3-renderer-tr-init-ml-156657107"></a>
### extensions

```ml
extensions
```

Graphics extension capabilities or extension names reported by the driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L57)

<a id="field-field-mq3-renderer-tr-init-config-fullscreen-fullscreen-src-mq3-renderer-tr-init-ml-4237573"></a>
### fullscreen

```ml
fullscreen
```

Whether the selected video mode occupies the full display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L75)

<a id="field-field-mq3-renderer-tr-init-config-gamma-gamma-src-mq3-renderer-tr-init-ml-1246743055"></a>
### gamma

```ml
gamma
```

Configured gamma correction or platform gamma-ramp state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L77)

<a id="field-field-mq3-renderer-tr-init-config-hardwaretype-hardwaretype-src-mq3-renderer-tr-init-ml-1812132371"></a>
### hardwareType

```ml
hardwareType
```

Detected graphics-hardware family used to select compatibility behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L79)

<a id="field-field-mq3-renderer-tr-init-config-maxactivetextures-maxactivetextures-src-mq3-renderer-tr-init-ml-156826755"></a>
### maxActiveTextures

```ml
maxActiveTextures
```

Number of simultaneous texture units supported by the driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L61)

<a id="field-field-mq3-renderer-tr-init-config-maxtexturesize-maxtexturesize-src-mq3-renderer-tr-init-ml-1313863843"></a>
### maxTextureSize

```ml
maxTextureSize
```

Largest supported texture dimension reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L59)

<a id="field-field-mq3-renderer-tr-init-config-renderer-renderer-src-mq3-renderer-tr-init-ml-2143359865"></a>
### renderer

```ml
renderer
```

Graphics-driver renderer identification string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L53)

<a id="field-field-mq3-renderer-tr-init-config-smpactive-smpactive-src-mq3-renderer-tr-init-ml-1088490715"></a>
### smpActive

```ml
smpActive
```

Whether a separate render thread is currently active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L81)

<a id="field-field-mq3-renderer-tr-init-config-stencilbits-stencilbits-src-mq3-renderer-tr-init-ml-1378714543"></a>
### stencilBits

```ml
stencilBits
```

Stencil-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L67)

<a id="field-field-mq3-renderer-tr-init-config-texturecompression-texturecompression-src-mq3-renderer-tr-init-ml-476419901"></a>
### textureCompression

```ml
textureCompression
```

Selected texture-compression capability or mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L85)

<a id="field-field-mq3-renderer-tr-init-config-textureenvaddavailable-textureenvaddavailable-src-mq3-renderer-tr-init-ml-1542492451"></a>
### textureEnvAddAvailable

```ml
textureEnvAddAvailable
```

Whether the driver supports additive texture-environment combining.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L83)

<a id="field-field-mq3-renderer-tr-init-config-vendor-vendor-src-mq3-renderer-tr-init-ml-1704649003"></a>
### vendor

```ml
vendor
```

Graphics-driver vendor identification string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L51)

<a id="field-field-mq3-renderer-tr-init-config-version-version-src-mq3-renderer-tr-init-ml-1375886327"></a>
### version

```ml
version
```

Version string reported by the loaded graphics implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L55)

<a id="field-field-mq3-renderer-tr-init-config-vidheight-vidheight-src-mq3-renderer-tr-init-ml-56144603"></a>
### vidHeight

```ml
vidHeight
```

Height of the active video mode in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L71)

<a id="field-field-mq3-renderer-tr-init-config-vidwidth-vidwidth-src-mq3-renderer-tr-init-ml-1960245301"></a>
### vidWidth

```ml
vidWidth
```

Width of the active video mode in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L69)
