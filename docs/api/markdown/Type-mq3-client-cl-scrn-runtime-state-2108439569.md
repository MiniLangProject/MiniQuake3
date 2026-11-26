# `mq3.client.cl_scrn_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-client-cl-scrn-runtime-ml-5625006.md)

<a id="struct-struct-mq3-client-cl-scrn-runtime-state-struct-state-src-mq3-client-cl-scrn-runtime-ml-845915987"></a>
## State

```ml
struct State
```

Stores engine client scrn runtime state, including `renderer`, `lifecycle`, `services`, `vidWidth`, `vidHeight`, `charSetShader` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L57)

## Members

<a id="field-field-mq3-client-cl-scrn-runtime-state-charsetshader-charsetshader-src-mq3-client-cl-scrn-runtime-ml-282267468"></a>
### charSetShader

```ml
charSetShader
```

Shader resource selected for char set rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L72)

<a id="field-field-mq3-client-cl-scrn-runtime-state-connectionstate-connectionstate-src-mq3-client-cl-scrn-runtime-ml-130595640"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L103)

<a id="field-field-mq3-client-cl-scrn-runtime-state-currentstereo-currentstereo-src-mq3-client-cl-scrn-runtime-ml-596877536"></a>
### currentStereo

```ml
currentStereo
```

When constructing this record, `create` supplies `STEREO_CENTER` for this member. Used by `SCR_DrawScreenField` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L130)

<a id="field-field-mq3-client-cl-scrn-runtime-state-debuggraph-debuggraph-src-mq3-client-cl-scrn-runtime-ml-400493202"></a>
### debuggraph

```ml
debuggraph
```

When constructing this record, `create` supplies `0` for this member. Used by `SCR_Init` and `SCR_DrawScreenField` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L83)

<a id="field-field-mq3-client-cl-scrn-runtime-state-debugmove-debugmove-src-mq3-client-cl-scrn-runtime-ml-650593080"></a>
### debugMove

```ml
debugMove
```

When constructing this record, `create` supplies `0` for this member. Used by `SCR_DrawScreenField` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L86)

<a id="field-field-mq3-client-cl-scrn-runtime-state-demofile-demofile-src-mq3-client-cl-scrn-runtime-ml-128539410"></a>
### demoFile

```ml
demoFile
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SCR_DrawDemoRecording` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L124)

<a id="field-field-mq3-client-cl-scrn-runtime-state-demoname-demoname-src-mq3-client-cl-scrn-runtime-ml-1529901552"></a>
### demoName

```ml
demoName
```

Virtual demo filename associated with the current recording or playback operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L121)

<a id="field-field-mq3-client-cl-scrn-runtime-state-demorecording-demorecording-src-mq3-client-cl-scrn-runtime-ml-923841360"></a>
### demoRecording

```ml
demoRecording
```

When constructing this record, `create` supplies `false` for this member. Used by `SCR_DrawDemoRecording` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L116)

<a id="field-field-mq3-client-cl-scrn-runtime-state-graphcurrent-graphcurrent-src-mq3-client-cl-scrn-runtime-ml-819053370"></a>
### graphCurrent

```ml
graphCurrent
```

When constructing this record, `create` supplies `0` for this member. Used by `SCR_DebugGraph` and `SCR_DrawDebugGraph` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L98)

<a id="field-field-mq3-client-cl-scrn-runtime-state-graphheight-graphheight-src-mq3-client-cl-scrn-runtime-ml-1932106600"></a>
### graphheight

```ml
graphheight
```

When constructing this record, `create` supplies `32` for this member. Used by `SCR_DrawDebugGraph` and `SCR_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L89)

<a id="field-field-mq3-client-cl-scrn-runtime-state-graphscale-graphscale-src-mq3-client-cl-scrn-runtime-ml-2029414132"></a>
### graphscale

```ml
graphscale
```

When constructing this record, `create` supplies `1` for this member. Used by `SCR_DrawDebugGraph` and `SCR_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L92)

<a id="field-field-mq3-client-cl-scrn-runtime-state-graphshift-graphshift-src-mq3-client-cl-scrn-runtime-ml-1664584656"></a>
### graphshift

```ml
graphshift
```

When constructing this record, `create` supplies `0` for this member. Used by `SCR_DrawDebugGraph` and `SCR_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L95)

<a id="field-field-mq3-client-cl-scrn-runtime-state-graphvalues-graphvalues-src-mq3-client-cl-scrn-runtime-ml-1126130656"></a>
### graphValues

```ml
graphValues
```

When constructing this record, `create` supplies `values` for this member. Used by `SCR_DebugGraph` and `SCR_DrawDebugGraph` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L101)

<a id="field-field-mq3-client-cl-scrn-runtime-state-initialized-initialized-src-mq3-client-cl-scrn-runtime-ml-791773312"></a>
### initialized

```ml
initialized
```

True after screen-refresh settings and debug-graph defaults are initialized, permitting screen updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L77)

<a id="field-field-mq3-client-cl-scrn-runtime-state-keycatchers-keycatchers-src-mq3-client-cl-scrn-runtime-ml-685598576"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L110)

<a id="field-field-mq3-client-cl-scrn-runtime-state-lifecycle-lifecycle-src-mq3-client-cl-scrn-runtime-ml-1461566412"></a>
### lifecycle

```ml
lifecycle
```

When constructing this record, `create` supplies `uiLifecycle` for this member. Used by `SCR_DrawScreenField` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L62)

<a id="field-field-mq3-client-cl-scrn-runtime-state-realtime-realtime-src-mq3-client-cl-scrn-runtime-ml-1974913478"></a>
### realtime

```ml
realtime
```

Current local client clock in milliseconds supplied to screen and UI presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L105)

<a id="field-field-mq3-client-cl-scrn-runtime-state-recursive-recursive-src-mq3-client-cl-scrn-runtime-ml-1294389108"></a>
### recursive

```ml
recursive
```

When constructing this record, `create` supplies `0` for this member. Used by `SCR_UpdateScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L127)

<a id="field-field-mq3-client-cl-scrn-runtime-state-renderer-renderer-src-mq3-client-cl-scrn-runtime-ml-1322195270"></a>
### renderer

```ml
renderer
```

Renderer implementation name reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L59)

<a id="field-field-mq3-client-cl-scrn-runtime-state-services-services-src-mq3-client-cl-scrn-runtime-ml-928875240"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L64)

<a id="field-field-mq3-client-cl-scrn-runtime-state-spdemorecording-spdemorecording-src-mq3-client-cl-scrn-runtime-ml-810100568"></a>
### spDemoRecording

```ml
spDemoRecording
```

When constructing this record, `create` supplies `false` for this member. Used by `SCR_DrawDemoRecording` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L119)

<a id="field-field-mq3-client-cl-scrn-runtime-state-stereoenabled-stereoenabled-src-mq3-client-cl-scrn-runtime-ml-1090588332"></a>
### stereoEnabled

```ml
stereoEnabled
```

When constructing this record, `create` supplies `false` for this member. Used by `SCR_UpdateScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L113)

<a id="field-field-mq3-client-cl-scrn-runtime-state-timegraph-timegraph-src-mq3-client-cl-scrn-runtime-ml-297745848"></a>
### timegraph

```ml
timegraph
```

When constructing this record, `create` supplies `0` for this member. Used by `SCR_Init` and `SCR_DrawScreenField` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L80)

<a id="field-field-mq3-client-cl-scrn-runtime-state-uiloaded-uiloaded-src-mq3-client-cl-scrn-runtime-ml-835965366"></a>
### uiLoaded

```ml
uiLoaded
```

When constructing this record, `create` supplies `true` for this member. Used by `SCR_DrawScreenField` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L108)

<a id="field-field-mq3-client-cl-scrn-runtime-state-vidheight-vidheight-src-mq3-client-cl-scrn-runtime-ml-2001205712"></a>
### vidHeight

```ml
vidHeight
```

When constructing this record, `create` supplies `height` for this member. Used by `SCR_AdjustFrom640` and `SCR_DrawDebugGraph` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L70)

<a id="field-field-mq3-client-cl-scrn-runtime-state-vidwidth-vidwidth-src-mq3-client-cl-scrn-runtime-ml-888125466"></a>
### vidWidth

```ml
vidWidth
```

When constructing this record, `create` supplies `width` for this member. Used by `SCR_AdjustFrom640` and `SCR_DrawDebugGraph` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L67)

<a id="field-field-mq3-client-cl-scrn-runtime-state-whiteshader-whiteshader-src-mq3-client-cl-scrn-runtime-ml-2020604868"></a>
### whiteShader

```ml
whiteShader
```

Shader resource selected for white rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L74)
