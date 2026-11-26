# `mq3.renderer.tr_init.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-init-ml-1583039474.md)

<a id="struct-struct-mq3-renderer-tr-init-state-struct-state-src-mq3-renderer-tr-init-ml-600950851"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_init.State`; groups `registered`, `cvars`, `commands`, `config`, `textureMode`, `overbrightBits`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L88)

## Members

<a id="field-field-mq3-renderer-tr-init-state-actions-actions-src-mq3-renderer-tr-init-ml-2091778820"></a>
### actions

```ml
actions
```

Platform operations recorded for dispatch or inspection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L108)

<a id="field-field-mq3-renderer-tr-init-state-apiexports-apiexports-src-mq3-renderer-tr-init-ml-1788296298"></a>
### apiExports

```ml
apiExports
```

Renderer functions exposed through the refresh API.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L114)

<a id="field-field-mq3-renderer-tr-init-state-commands-commands-src-mq3-renderer-tr-init-ml-1375630180"></a>
### commands

```ml
commands
```

Console commands registered by the renderer lifecycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L94)

<a id="field-field-mq3-renderer-tr-init-state-config-config-src-mq3-renderer-tr-init-ml-296371736"></a>
### config

```ml
config
```

Configuration values used to initialize or drive this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L96)

<a id="field-field-mq3-renderer-tr-init-state-cvars-cvars-src-mq3-renderer-tr-init-ml-1003009116"></a>
### cvars

```ml
cvars
```

Console variables and their current runtime values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L92)

<a id="field-field-mq3-renderer-tr-init-state-glerror-glerror-src-mq3-renderer-tr-init-ml-1837427700"></a>
### glError

```ml
glError
```

Most recently observed graphics-driver error code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L106)

<a id="field-field-mq3-renderer-tr-init-state-lastscreenshot-lastscreenshot-src-mq3-renderer-tr-init-ml-1427391240"></a>
### lastScreenshot

```ml
lastScreenshot
```

Path or result of the latest ordinary screenshot request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L110)

<a id="field-field-mq3-renderer-tr-init-state-lastscreenshotjpeg-lastscreenshotjpeg-src-mq3-renderer-tr-init-ml-700770224"></a>
### lastScreenshotJpeg

```ml
lastScreenshotJpeg
```

Path or result of the latest JPEG screenshot request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L112)

<a id="field-field-mq3-renderer-tr-init-state-maxpolys-maxpolys-src-mq3-renderer-tr-init-ml-361831474"></a>
### maxPolys

```ml
maxPolys
```

Maximum number of polygons accepted by the scene buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L102)

<a id="field-field-mq3-renderer-tr-init-state-maxpolyverts-maxpolyverts-src-mq3-renderer-tr-init-ml-1990967104"></a>
### maxPolyVerts

```ml
maxPolyVerts
```

Maximum number of polygon vertices accepted by the scene buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L104)

<a id="field-field-mq3-renderer-tr-init-state-overbrightbits-overbrightbits-src-mq3-renderer-tr-init-ml-388513532"></a>
### overbrightBits

```ml
overbrightBits
```

Number of additional brightness bits used by color mapping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L100)

<a id="field-field-mq3-renderer-tr-init-state-registered-registered-src-mq3-renderer-tr-init-ml-662838768"></a>
### registered

```ml
registered
```

Whether the subsystem has completed resource registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L90)

<a id="field-field-mq3-renderer-tr-init-state-texturemode-texturemode-src-mq3-renderer-tr-init-ml-1314066336"></a>
### textureMode

```ml
textureMode
```

Configured texture-filtering mode applied to registered images.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L98)
