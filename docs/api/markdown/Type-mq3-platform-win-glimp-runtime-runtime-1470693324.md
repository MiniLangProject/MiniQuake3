# `mq3.platform.win_glimp_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-win-glimp-runtime-ml-2055312246.md)

<a id="struct-struct-mq3-platform-win-glimp-runtime-runtime-struct-runtime-src-mq3-platform-win-glimp-runtime-ml-895599353"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.win_glimp_runtime.Runtime`; groups `osSupported`, `driverLoaded`, `windowCreated`, `contextCreated`, `active`, `fullscreen`, and 16 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L84)

## Members

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-active-active-src-mq3-platform-win-glimp-runtime-ml-1435260405"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L94)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-contextcreated-contextcreated-src-mq3-platform-win-glimp-runtime-ml-571178619"></a>
### contextCreated

```ml
contextCreated
```

Whether the graphics context has been created.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L92)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-displaychanged-displaychanged-src-mq3-platform-win-glimp-runtime-ml-835195093"></a>
### displayChanged

```ml
displayChanged
```

Whether the platform changed the desktop display mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L98)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-driverloaded-driverloaded-src-mq3-platform-win-glimp-runtime-ml-1691527311"></a>
### driverLoaded

```ml
driverLoaded
```

Whether the graphics driver library loaded successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L88)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-extensions-extensions-src-mq3-platform-win-glimp-runtime-ml-361758805"></a>
### extensions

```ml
extensions
```

Graphics extension capabilities or extension names reported by the driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L104)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-extensiontext-extensiontext-src-mq3-platform-win-glimp-runtime-ml-126160389"></a>
### extensionText

```ml
extensionText
```

Space-separated graphics extension string returned by the driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L112)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-fullscreen-fullscreen-src-mq3-platform-win-glimp-runtime-ml-146910763"></a>
### fullscreen

```ml
fullscreen
```

Whether the selected video mode occupies the full display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L96)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-glwstate-glwstate-src-mq3-platform-win-glimp-runtime-ml-102882863"></a>
### glwState

```ml
glwState
```

Native Windows graphics-window state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L128)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-logs-logs-src-mq3-platform-win-glimp-runtime-ml-80848055"></a>
### logs

```ml
logs
```

Diagnostic log entries retained by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L116)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-mode-mode-src-mq3-platform-win-glimp-runtime-ml-1345775235"></a>
### mode

```ml
mode
```

Selected display mode and its dimensions, color depth, and refresh settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L100)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-ossupported-ossupported-src-mq3-platform-win-glimp-runtime-ml-1175082641"></a>
### osSupported

```ml
osSupported
```

Whether the detected operating system satisfies the graphics backend requirements.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L86)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-pfd-pfd-src-mq3-platform-win-glimp-runtime-ml-445132213"></a>
### pfd

```ml
pfd
```

Selected Windows pixel-format descriptor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L102)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-qglregistry-qglregistry-src-mq3-platform-win-glimp-runtime-ml-1493658869"></a>
### qglRegistry

```ml
qglRegistry
```

Registry of loaded OpenGL entry points.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L124)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-qglstate-qglstate-src-mq3-platform-win-glimp-runtime-ml-369785343"></a>
### qglState

```ml
qglState
```

Current OpenGL entry-point binding and logging state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L126)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-rendercommands-rendercommands-src-mq3-platform-win-glimp-runtime-ml-1441465053"></a>
### renderCommands

```ml
renderCommands
```

Commands waiting to be executed by the render thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L120)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-rendercompleted-rendercompleted-src-mq3-platform-win-glimp-runtime-ml-688603241"></a>
### renderCompleted

```ml
renderCompleted
```

Completion state or count for render-thread work.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L122)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-renderer-renderer-src-mq3-platform-win-glimp-runtime-ml-848174327"></a>
### renderer

```ml
renderer
```

Graphics-driver renderer identification string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L108)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-rendererthread-rendererthread-src-mq3-platform-win-glimp-runtime-ml-2096037591"></a>
### rendererThread

```ml
rendererThread
```

Render-thread handle or state owned by the platform backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L118)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-swaps-swaps-src-mq3-platform-win-glimp-runtime-ml-990869209"></a>
### swaps

```ml
swaps
```

Number of buffer-swap operations performed by the graphics backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L114)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-vendor-vendor-src-mq3-platform-win-glimp-runtime-ml-646673501"></a>
### vendor

```ml
vendor
```

Graphics-driver vendor identification string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L106)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-version-version-src-mq3-platform-win-glimp-runtime-ml-1630007081"></a>
### version

```ml
version
```

Version string reported by the loaded graphics implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L110)

<a id="field-field-mq3-platform-win-glimp-runtime-runtime-windowcreated-windowcreated-src-mq3-platform-win-glimp-runtime-ml-2117198157"></a>
### windowCreated

```ml
windowCreated
```

Whether the application window has been created.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L90)
