# `mq3.client.ui_video.GlConfig`

[Home](README.md) · [Source file](File-src-mq3-client-ui-video-ml-1287978223.md)

<a id="struct-struct-mq3-client-ui-video-glconfig-struct-glconfig-src-mq3-client-ui-video-ml-1228215739"></a>
## GlConfig

```ml
struct GlConfig
```

Stores UI video gl config record, including `vendor`, `version`, `renderer`, `extensions`, `colorBits`, `depthBits` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L99)

## Members

<a id="field-field-mq3-client-ui-video-glconfig-colorbits-colorbits-src-mq3-client-ui-video-ml-1594356776"></a>
### colorBits

```ml
colorBits
```

Number of bits requested or provided for the framebuffer's color channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L109)

<a id="field-field-mq3-client-ui-video-glconfig-depthbits-depthbits-src-mq3-client-ui-video-ml-640558956"></a>
### depthBits

```ml
depthBits
```

Number of bits available in the graphics depth buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L111)

<a id="field-field-mq3-client-ui-video-glconfig-drivertype-drivertype-src-mq3-client-ui-video-ml-505424872"></a>
### driverType

```ml
driverType
```

Native renderer-driver category used to select compatible video-settings behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L115)

<a id="field-field-mq3-client-ui-video-glconfig-extensions-extensions-src-mq3-client-ui-video-ml-217340472"></a>
### extensions

```ml
extensions
```

Graphics extension information exposed by the renderer or selected by the video-settings UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L107)

<a id="field-field-mq3-client-ui-video-glconfig-hardwaretype-hardwaretype-src-mq3-client-ui-video-ml-709339256"></a>
### hardwareType

```ml
hardwareType
```

Native graphics-hardware category used to select compatible video-settings behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L117)

<a id="field-field-mq3-client-ui-video-glconfig-renderer-renderer-src-mq3-client-ui-video-ml-49893994"></a>
### renderer

```ml
renderer
```

Renderer implementation name reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L105)

<a id="field-field-mq3-client-ui-video-glconfig-stencilbits-stencilbits-src-mq3-client-ui-video-ml-2085148292"></a>
### stencilBits

```ml
stencilBits
```

Number of bits available in the graphics stencil buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L113)

<a id="field-field-mq3-client-ui-video-glconfig-vendor-vendor-src-mq3-client-ui-video-ml-705590112"></a>
### vendor

```ml
vendor
```

Renderer vendor identification string reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L101)

<a id="field-field-mq3-client-ui-video-glconfig-version-version-src-mq3-client-ui-video-ml-1101617660"></a>
### version

```ml
version
```

Graphics-driver or renderer version string exposed to the video-settings UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L103)
