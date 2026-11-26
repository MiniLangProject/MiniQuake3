# `src/mq3/client/cl_scrn_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_scrn_runtime`](Package-mq3-client-cl-scrn-runtime-2143027498.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_host_lifecycle.ml` as `lifecycle` → [src/mq3/client/ui_host_lifecycle.ml](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/command_queue.ml` as `commands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/tr_cmds_runtime.ml` as `renderer` → [src/mq3/renderer/tr_cmds_runtime.ml](File-src-mq3-renderer-tr-cmds-runtime-ml-2143950218.md)

## Declarations

<a id="constant-constant-mq3-client-cl-scrn-runtime-bigchar-width-const-bigchar-width-16-src-mq3-client-cl-scrn-runtime-ml-1045838686"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L16)

<a id="function-function-mq3-client-cl-scrn-runtime-color-function-color-index-src-mq3-client-cl-scrn-runtime-ml-446577968"></a>
### color

```ml
function color(index)
```

Evaluates engine client scrn runtime `color` and returns `table[index&7]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value used by `return table[index&7]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L55)

<a id="function-function-mq3-client-cl-scrn-runtime-create-function-create-renderstate-uilifecycle-host-width-height-charsetshader-whiteshader-src-mq3-client-cl-scrn-runtime-ml-1828062129"></a>
### create

```ml
function create(renderState, uiLifecycle, host, width, height, charSetShader, whiteShader)
```

Calls `mq3.renderer.tr_cmds_runtime.create`, `mq3.client.cl_scrn_runtime.services`, `mq3.client.cl_scrn_runtime.GraphSample` and additional helpers from engine client scrn runtime `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderState` | `dynamic` | — | Value used by `if renderState==void then renderState=renderer.create(void,void,void,void) end if`. |
| `uiLifecycle` | `dynamic` | — | Value used by `return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,...`. |
| `host` | `dynamic` | — | host record passed to the engine client scrn runtime helper calls. |
| `width` | `dynamic` | — | Width in the coordinate space used by `create`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `create`. |
| `charSetShader` | `dynamic` | — | Value used by `return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,...`. |
| `whiteShader` | `dynamic` | — | Value used by `return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L42)

<a id="function-function-mq3-client-cl-scrn-runtime-draw-function-draw-state-x-y-w-h-s1-t1-s2-t2-shader-src-mq3-client-cl-scrn-runtime-ml-1162637334"></a>
### draw

```ml
function draw(state, x, y, w, h, s1, t1, s2, t2, shader)
```

Adapts `mq3.renderer.tr_cmds_runtime.RE_StretchPic` to engine client scrn runtime `draw`, returning its result for `state.renderer, x, y, w, h, s1, t1, s2, t2, shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.renderer`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `w` | `dynamic` | — | Argument 4 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `h` | `dynamic` | — | Argument 5 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `s1` | `dynamic` | — | Argument 6 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `t1` | `dynamic` | — | Argument 7 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `s2` | `dynamic` | — | Argument 8 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `t2` | `dynamic` | — | Argument 9 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |
| `shader` | `dynamic` | — | Argument 10 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L87)

<a id="function-function-mq3-client-cl-scrn-runtime-emit-function-emit-state-kind-value-src-mq3-client-cl-scrn-runtime-ml-1220430106"></a>
### emit

```ml
function emit(state, kind, value)
```

Calls `state.services.diagnosticFn` from engine client scrn runtime `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.diagnosticFn`, `state.services.context`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `value` | `dynamic` | — | Value used by `if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,kind,value) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L52)

<a id="function-function-mq3-client-cl-scrn-runtime-fail-function-fail-message-src-mq3-client-cl-scrn-runtime-ml-2062802491"></a>
### fail

```ml
function fail(message)
```

Creates the engine client scrn runtime error `7810` with diagnostic text `"cl_scrn: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"cl_scrn: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L30)

- [mq3.client.cl_scrn_runtime.GraphSample](Type-mq3-client-cl-scrn-runtime-graphsample-2007097154.md) — struct
<a id="function-function-mq3-client-cl-scrn-runtime-iscolor-function-iscolor-data-index-src-mq3-client-cl-scrn-runtime-ml-1121084036"></a>
### isColor

```ml
function isColor(data, index)
```

Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for engine client scrn runtime `isColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[index]`, `data[index+1]`. |
| `index` | `dynamic` | — | Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L62)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-adjustfrom640-function-scr-adjustfrom640-state-x-y-w-h-src-mq3-client-cl-scrn-runtime-ml-678919345"></a>
### SCR_AdjustFrom640

```ml
function SCR_AdjustFrom640(state, x, y, w, h)
```

SCR_AdjustFrom640 -- independent x/y scaling is intentional Baseq3 behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vidWidth`, `state.vidHeight`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_AdjustFrom640`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_AdjustFrom640`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `SCR_AdjustFrom640`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `SCR_AdjustFrom640`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L70)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-debuggraph-function-scr-debuggraph-state-value-colorindex-src-mq3-client-cl-scrn-runtime-ml-920279991"></a>
### SCR_DebugGraph

```ml
function SCR_DebugGraph(state, value, colorIndex)
```

Updates `state.graphValues[index].value`, `state.graphValues[index].color`, `state.graphCurrent` during engine client scrn runtime `SCR_DebugGraph`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client scrn runtime record/storage; this routine assigns `state.graphValues[index].value`, `state.graphValues[index].color`, `state.graphCurrent`. |
| `value` | `dynamic` | — | Value used by `state.graphValues[index].value=value`. |
| `colorIndex` | `dynamic` | — | Value used by `state.graphValues[index].color=colorIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L215)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawbigstring-function-scr-drawbigstring-state-x-y-text-alpha-src-mq3-client-cl-scrn-runtime-ml-1601716335"></a>
### SCR_DrawBigString

```ml
function SCR_DrawBigString(state, x, y, text, alpha)
```

Adapts `mq3.client.cl_scrn_runtime.SCR_DrawStringExt` to engine client scrn runtime `SCR_DrawBigString`, returning its result for `state, x, y, BIGCHAR_WIDTH, text, [1.0,1.0,1.0,alpha], false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `text` | `dynamic` | — | Argument 5 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L170)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawbigstringcolor-function-scr-drawbigstringcolor-state-x-y-text-rgba-src-mq3-client-cl-scrn-runtime-ml-234282723"></a>
### SCR_DrawBigStringColor

```ml
function SCR_DrawBigStringColor(state, x, y, text, rgba)
```

Adapts `mq3.client.cl_scrn_runtime.SCR_DrawStringExt` to engine client scrn runtime `SCR_DrawBigStringColor`, returning its result for `state, x, y, BIGCHAR_WIDTH, text, rgba, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `text` | `dynamic` | — | Argument 5 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |
| `rgba` | `dynamic` | — | Argument 6 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L177)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawchar-function-scr-drawchar-state-x-y-size-ch-src-mq3-client-cl-scrn-runtime-ml-1598655442"></a>
### SCR_DrawChar

```ml
function SCR_DrawChar(state, x, y, size, ch)
```

Calls `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.charSetShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_DrawChar`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_DrawChar`. |
| `size` | `dynamic` | — | Value tested by `ch==32 or y<0-size` before the calculation continues. |
| `ch` | `dynamic` | — | Value used by `ch=ch&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L126)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawdebuggraph-function-scr-drawdebuggraph-state-src-mq3-client-cl-scrn-runtime-ml-1773741677"></a>
### SCR_DrawDebugGraph

```ml
function SCR_DrawDebugGraph(state)
```

Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.color`, `mq3.client.cl_scrn_runtime.draw` and additional helpers from engine client scrn runtime `SCR_DrawDebugGraph`. The final path returns `columns`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vidWidth`, `state.vidHeight`, `state.renderer`, `state.graphheight` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L220)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawdemorecording-function-scr-drawdemorecording-state-src-mq3-client-cl-scrn-runtime-ml-1470082651"></a>
### SCR_DrawDemoRecording

```ml
function SCR_DrawDemoRecording(state)
```

Calls `state.services.fileTellFn`, `mq3.compat.numeric.quotient`, `mq3.client.cl_scrn_runtime.SCR_DrawStringExt` and additional helpers from engine client scrn runtime `SCR_DrawDemoRecording`. The final path returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.demoRecording`, `state.spDemoRecording`, `state.services.fileTellFn`, `state.services.context` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L206)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawnamedpic-function-scr-drawnamedpic-state-x-y-width-height-picname-src-mq3-client-cl-scrn-runtime-ml-1784469350"></a>
### SCR_DrawNamedPic

```ml
function SCR_DrawNamedPic(state, x, y, width, height, picname)
```

Calls `state.services.registerShaderFn`, `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawNamedPic`. The final path returns `shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.registerShaderFn`, `state.services.context`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_DrawNamedPic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_DrawNamedPic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `SCR_DrawNamedPic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `SCR_DrawNamedPic`. |
| `picname` | `dynamic` | — | Value used by `shader=state.services.registerShaderFn(state.services.context,picname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L95)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawpic-function-scr-drawpic-state-x-y-width-height-shader-src-mq3-client-cl-scrn-runtime-ml-1988694532"></a>
### SCR_DrawPic

```ml
function SCR_DrawPic(state, x, y, width, height, shader)
```

Calls `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawPic`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client scrn runtime state passed to the helper calls in `SCR_DrawPic`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_DrawPic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_DrawPic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `SCR_DrawPic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `SCR_DrawPic`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L117)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawscreenfield-function-scr-drawscreenfield-state-stereoframe-src-mq3-client-cl-scrn-runtime-ml-959997518"></a>
### SCR_DrawScreenField

```ml
function SCR_DrawScreenField(state, stereoFrame)
```

Updates `state.currentStereo` during engine client scrn runtime `SCR_DrawScreenField`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client scrn runtime record/storage; this routine assigns `state.currentStereo`. |
| `stereoFrame` | `dynamic` | — | Value assigned to `state.currentStereo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L237)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawsmallchar-function-scr-drawsmallchar-state-x-y-ch-src-mq3-client-cl-scrn-runtime-ml-791976585"></a>
### SCR_DrawSmallChar

```ml
function SCR_DrawSmallChar(state, x, y, ch)
```

Calls `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawSmallChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.charSetShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_DrawSmallChar`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_DrawSmallChar`. |
| `ch` | `dynamic` | — | Value used by `ch=ch&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L136)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawsmallstringext-function-scr-drawsmallstringext-state-x-y-text-setcolor-forcecolor-src-mq3-client-cl-scrn-runtime-ml-1777313438"></a>
### SCR_DrawSmallStringExt

```ml
function SCR_DrawSmallStringExt(state, x, y, text, setColor, forceColor)
```

Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.isColor`, `mq3.client.cl_scrn_runtime.color` and additional helpers from engine client scrn runtime `SCR_DrawSmallStringExt`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.renderer`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_DrawSmallStringExt`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_DrawSmallStringExt`. |
| `text` | `dynamic` | — | Text consumed or emitted by `SCR_DrawSmallStringExt` in the engine client scrn runtime path. |
| `setColor` | `dynamic` | — | Sequence read at `setColor[3]`. |
| `forceColor` | `dynamic` | — | Value used by `if not forceColor then rgba=color(data[index+1])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L185)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawstringext-function-scr-drawstringext-state-x-y-size-text-setcolor-forcecolor-src-mq3-client-cl-scrn-runtime-ml-566526671"></a>
### SCR_DrawStringExt

```ml
function SCR_DrawStringExt(state, x, y, size, text, setColor, forceColor)
```

Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.isColor`, `mq3.client.cl_scrn_runtime.SCR_DrawChar` and additional helpers from engine client scrn runtime `SCR_DrawStringExt`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.renderer`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_DrawStringExt`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_DrawStringExt`. |
| `size` | `dynamic` | — | Value tested by `if SCR_DrawChar(state,xx+2,y+2,size,data[index])`, `if SCR_DrawChar(state,xx,y,size,data[index])` before the calculation continues. |
| `text` | `dynamic` | — | Text consumed or emitted by `SCR_DrawStringExt` in the engine client scrn runtime path. |
| `setColor` | `dynamic` | — | Sequence read at `setColor[3]`. |
| `forceColor` | `dynamic` | — | Value used by `if not forceColor then rgba=color(data[index+1])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L149)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-fillrect-function-scr-fillrect-state-x-y-width-height-rgba-src-mq3-client-cl-scrn-runtime-ml-2120011551"></a>
### SCR_FillRect

```ml
function SCR_FillRect(state, x, y, width, height, rgba)
```

Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_FillRect`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.renderer`, `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `SCR_FillRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `SCR_FillRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `SCR_FillRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `SCR_FillRect`. |
| `rgba` | `dynamic` | — | Value used by `renderer.RE_SetColor(state.renderer,rgba)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L107)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-getbigstringwidth-function-scr-getbigstringwidth-text-src-mq3-client-cl-scrn-runtime-ml-931290451"></a>
### SCR_GetBigStringWidth

```ml
function SCR_GetBigStringWidth(text)
```

Computes `SCR_Strlen(text)*BIGCHAR_WIDTH` for engine client scrn runtime `SCR_GetBigStringWidth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `SCR_GetBigStringWidth` in the engine client scrn runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L202)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-init-function-scr-init-state-src-mq3-client-cl-scrn-runtime-ml-277580753"></a>
### SCR_Init

```ml
function SCR_Init(state)
```

Updates `state.timegraph`, `state.debuggraph`, `state.graphheight`, `state.graphscale` and additional values during engine client scrn runtime `SCR_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client scrn runtime record/storage; this routine assigns `state.timegraph`, `state.debuggraph`, `state.graphheight`, `state.graphscale` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L230)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-strlen-function-scr-strlen-text-src-mq3-client-cl-scrn-runtime-ml-944599567"></a>
### SCR_Strlen

```ml
function SCR_Strlen(text)
```

Calls `mq3.client.cl_scrn_runtime.isColor` from engine client scrn runtime `SCR_Strlen`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `SCR_Strlen` in the engine client scrn runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L197)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-updatescreen-function-scr-updatescreen-state-src-mq3-client-cl-scrn-runtime-ml-40089921"></a>
### SCR_UpdateScreen

```ml
function SCR_UpdateScreen(state)
```

Updates `state.recursive` during engine client scrn runtime `SCR_UpdateScreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client scrn runtime record/storage; this routine assigns `state.recursive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L251)

<a id="constant-constant-mq3-client-cl-scrn-runtime-screen-height-const-screen-height-480-src-mq3-client-cl-scrn-runtime-ml-1199265897"></a>
### SCREEN_HEIGHT

```ml
const SCREEN_HEIGHT = 480
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L13)

<a id="constant-constant-mq3-client-cl-scrn-runtime-screen-width-const-screen-width-640-src-mq3-client-cl-scrn-runtime-ml-1443537603"></a>
### SCREEN_WIDTH

```ml
const SCREEN_WIDTH = 640
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L12)

<a id="function-function-mq3-client-cl-scrn-runtime-services-function-services-context-src-mq3-client-cl-scrn-runtime-ml-1973680319"></a>
### services

```ml
function services(context)
```

Creates a `mq3.client.cl_scrn_runtime.Services` record. Assigns `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L33)

- [mq3.client.cl_scrn_runtime.Services](Type-mq3-client-cl-scrn-runtime-services-1553853860.md) — struct
<a id="constant-constant-mq3-client-cl-scrn-runtime-smallchar-height-const-smallchar-height-16-src-mq3-client-cl-scrn-runtime-ml-79639782"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L15)

<a id="constant-constant-mq3-client-cl-scrn-runtime-smallchar-width-const-smallchar-width-8-src-mq3-client-cl-scrn-runtime-ml-1999448545"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L14)

- [mq3.client.cl_scrn_runtime.State](Type-mq3-client-cl-scrn-runtime-state-2108439569.md) — struct
<a id="constant-constant-mq3-client-cl-scrn-runtime-stereo-center-const-stereo-center-0-src-mq3-client-cl-scrn-runtime-ml-1772628449"></a>
### STEREO_CENTER

```ml
const STEREO_CENTER = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L17)

<a id="constant-constant-mq3-client-cl-scrn-runtime-stereo-left-const-stereo-left-1-src-mq3-client-cl-scrn-runtime-ml-256493450"></a>
### STEREO_LEFT

```ml
const STEREO_LEFT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L18)

<a id="constant-constant-mq3-client-cl-scrn-runtime-stereo-right-const-stereo-right-2-src-mq3-client-cl-scrn-runtime-ml-711524263"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_scrn_runtime.ml#L19)
