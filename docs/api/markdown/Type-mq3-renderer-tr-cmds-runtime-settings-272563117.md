# `mq3.renderer.tr_cmds_runtime.Settings`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-cmds-runtime-ml-2143950218.md)

<a id="struct-struct-mq3-renderer-tr-cmds-runtime-settings-struct-settings-src-mq3-renderer-tr-cmds-runtime-ml-579875639"></a>
## Settings

```ml
struct Settings
```

Data record for `mq3.renderer.tr_cmds_runtime.Settings`; groups `speeds`, `smp`, `showSmp`, `skipBackEnd`, `measureOverdraw`, `measureOverdrawModified`, and 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L84)

## Members

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-drawbuffer-drawbuffer-src-mq3-renderer-tr-cmds-runtime-ml-1811877696"></a>
### drawBuffer

```ml
drawBuffer
```

Graphics draw buffer selected for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L112)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-gammamodified-gammamodified-src-mq3-renderer-tr-cmds-runtime-ml-2102352592"></a>
### gammaModified

```ml
gammaModified
```

Whether gamma settings changed and must be uploaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L106)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-height-height-src-mq3-renderer-tr-cmds-runtime-ml-1238647054"></a>
### height

```ml
height
```

Height in pixels of the framebuffer used to normalize overdraw statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L118)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-ignoreglerrors-ignoreglerrors-src-mq3-renderer-tr-cmds-runtime-ml-307104972"></a>
### ignoreGLErrors

```ml
ignoreGLErrors
```

Whether graphics-driver error reporting is suppressed by configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L108)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-measureoverdraw-measureoverdraw-src-mq3-renderer-tr-cmds-runtime-ml-86018188"></a>
### measureOverdraw

```ml
measureOverdraw
```

Whether stencil-based overdraw measurement is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-measureoverdrawmodified-measureoverdrawmodified-src-mq3-renderer-tr-cmds-runtime-ml-364363148"></a>
### measureOverdrawModified

```ml
measureOverdrawModified
```

Whether the overdraw setting changed and requires backend state updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L96)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-registered-registered-src-mq3-renderer-tr-cmds-runtime-ml-2071772240"></a>
### registered

```ml
registered
```

Whether the subsystem has completed resource registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L114)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-shadows-shadows-src-mq3-renderer-tr-cmds-runtime-ml-2117172972"></a>
### shadows

```ml
shadows
```

Configured shadow-rendering mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L98)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-showsmp-showsmp-src-mq3-renderer-tr-cmds-runtime-ml-395959688"></a>
### showSmp

```ml
showSmp
```

Whether render-thread synchronization statistics are shown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L90)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-skipbackend-skipbackend-src-mq3-renderer-tr-cmds-runtime-ml-87181396"></a>
### skipBackEnd

```ml
skipBackEnd
```

Whether backend drawing is disabled for diagnostic purposes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L92)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-smp-smp-src-mq3-renderer-tr-cmds-runtime-ml-2087509700"></a>
### smp

```ml
smp
```

Configuration setting controlling use of a separate renderer thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L88)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-speeds-speeds-src-mq3-renderer-tr-cmds-runtime-ml-654388184"></a>
### speeds

```ml
speeds
```

Renderer statistics mode selected for performance reporting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L86)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-stencilbits-stencilbits-src-mq3-renderer-tr-cmds-runtime-ml-1452597596"></a>
### stencilBits

```ml
stencilBits
```

Stencil-buffer precision in bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L100)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-stereoenabled-stereoenabled-src-mq3-renderer-tr-cmds-runtime-ml-1681478780"></a>
### stereoEnabled

```ml
stereoEnabled
```

Whether stereoscopic drawing buffers are available and enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L110)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-texturemode-texturemode-src-mq3-renderer-tr-cmds-runtime-ml-1049897056"></a>
### textureMode

```ml
textureMode
```

Configured texture-filtering mode applied to registered images.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L102)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-texturemodemodified-texturemodemodified-src-mq3-renderer-tr-cmds-runtime-ml-1705940428"></a>
### textureModeModified

```ml
textureModeModified
```

Whether texture filtering changed and must be reapplied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L104)

<a id="field-field-mq3-renderer-tr-cmds-runtime-settings-width-width-src-mq3-renderer-tr-cmds-runtime-ml-1224716108"></a>
### width

```ml
width
```

Width in pixels of the framebuffer used to normalize overdraw statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L116)
