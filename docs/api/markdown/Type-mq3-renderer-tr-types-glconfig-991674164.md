# `mq3.renderer.tr_types.Glconfig`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-types-ml-1757535937.md)

<a id="struct-struct-mq3-renderer-tr-types-glconfig-struct-glconfig-src-mq3-renderer-tr-types-ml-1068463147"></a>
## Glconfig

```ml
struct Glconfig
```

Data record for `mq3.renderer.tr_types.Glconfig`; groups `renderer_string`, `vendor_string`, `version_string`, `extensions_string`, `maxTextureSize`, `maxActiveTextures`, and 15 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L175)

## Members

<a id="field-field-mq3-renderer-tr-types-glconfig-colorbits-colorbits-src-mq3-renderer-tr-types-ml-950478944"></a>
### colorBits

```ml
colorBits
```

Color-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L189)

<a id="field-field-mq3-renderer-tr-types-glconfig-depthbits-depthbits-src-mq3-renderer-tr-types-ml-731775540"></a>
### depthBits

```ml
depthBits
```

Depth-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L191)

<a id="field-field-mq3-renderer-tr-types-glconfig-devicesupportsgamma-devicesupportsgamma-src-mq3-renderer-tr-types-ml-1082700244"></a>
### deviceSupportsGamma

```ml
deviceSupportsGamma
```

Whether the display supports hardware gamma-ramp updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L199)

<a id="field-field-mq3-renderer-tr-types-glconfig-displayfrequency-displayfrequency-src-mq3-renderer-tr-types-ml-1589692216"></a>
### displayFrequency

```ml
displayFrequency
```

Refresh frequency of the selected display mode, in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L211)

<a id="field-field-mq3-renderer-tr-types-glconfig-drivertype-drivertype-src-mq3-renderer-tr-types-ml-421424992"></a>
### driverType

```ml
driverType
```

Graphics-driver integration category used by platform compatibility handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L195)

<a id="field-field-mq3-renderer-tr-types-glconfig-extensions-string-extensions-string-src-mq3-renderer-tr-types-ml-1081134904"></a>
### extensions_string

```ml
extensions_string
```

Space-separated extension names reported by OpenGL.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L183)

<a id="field-field-mq3-renderer-tr-types-glconfig-hardwaretype-hardwaretype-src-mq3-renderer-tr-types-ml-1560008664"></a>
### hardwareType

```ml
hardwareType
```

Detected graphics-hardware family used to select compatibility behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L197)

<a id="field-field-mq3-renderer-tr-types-glconfig-isfullscreen-isfullscreen-src-mq3-renderer-tr-types-ml-306255326"></a>
### isFullscreen

```ml
isFullscreen
```

Whether rendering occupies the full display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L213)

<a id="field-field-mq3-renderer-tr-types-glconfig-maxactivetextures-maxactivetextures-src-mq3-renderer-tr-types-ml-1533993192"></a>
### maxActiveTextures

```ml
maxActiveTextures
```

Number of simultaneous texture units supported by the driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L187)

<a id="field-field-mq3-renderer-tr-types-glconfig-maxtexturesize-maxtexturesize-src-mq3-renderer-tr-types-ml-1531429704"></a>
### maxTextureSize

```ml
maxTextureSize
```

Largest supported texture dimension reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L185)

<a id="field-field-mq3-renderer-tr-types-glconfig-renderer-string-renderer-string-src-mq3-renderer-tr-types-ml-1138599376"></a>
### renderer_string

```ml
renderer_string
```

Renderer identification string reported by OpenGL.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L177)

<a id="field-field-mq3-renderer-tr-types-glconfig-smpactive-smpactive-src-mq3-renderer-tr-types-ml-575228528"></a>
### smpActive

```ml
smpActive
```

Whether a separate render thread is currently active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L217)

<a id="field-field-mq3-renderer-tr-types-glconfig-stencilbits-stencilbits-src-mq3-renderer-tr-types-ml-1311865428"></a>
### stencilBits

```ml
stencilBits
```

Stencil-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L193)

<a id="field-field-mq3-renderer-tr-types-glconfig-stereoenabled-stereoenabled-src-mq3-renderer-tr-types-ml-543057404"></a>
### stereoEnabled

```ml
stereoEnabled
```

Whether stereoscopic drawing buffers are available and enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L215)

<a id="field-field-mq3-renderer-tr-types-glconfig-texturecompression-texturecompression-src-mq3-renderer-tr-types-ml-1105972934"></a>
### textureCompression

```ml
textureCompression
```

Selected texture-compression capability or mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L201)

<a id="field-field-mq3-renderer-tr-types-glconfig-textureenvaddavailable-textureenvaddavailable-src-mq3-renderer-tr-types-ml-531393304"></a>
### textureEnvAddAvailable

```ml
textureEnvAddAvailable
```

Whether the driver supports additive texture-environment combining.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L203)

<a id="field-field-mq3-renderer-tr-types-glconfig-vendor-string-vendor-string-src-mq3-renderer-tr-types-ml-1242933528"></a>
### vendor_string

```ml
vendor_string
```

Vendor identification string reported by OpenGL.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L179)

<a id="field-field-mq3-renderer-tr-types-glconfig-version-string-version-string-src-mq3-renderer-tr-types-ml-1786528596"></a>
### version_string

```ml
version_string
```

Version string reported by OpenGL.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L181)

<a id="field-field-mq3-renderer-tr-types-glconfig-vidheight-vidheight-src-mq3-renderer-tr-types-ml-1724819424"></a>
### vidHeight

```ml
vidHeight
```

Height of the active video mode in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L207)

<a id="field-field-mq3-renderer-tr-types-glconfig-vidwidth-vidwidth-src-mq3-renderer-tr-types-ml-1596616374"></a>
### vidWidth

```ml
vidWidth
```

Width of the active video mode in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L205)

<a id="field-field-mq3-renderer-tr-types-glconfig-windowaspect-windowaspect-src-mq3-renderer-tr-types-ml-879531276"></a>
### windowAspect

```ml
windowAspect
```

Physical display aspect ratio used to configure the renderer's projection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L209)
