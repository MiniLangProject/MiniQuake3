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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L16)

<a id="function-function-mq3-client-cl-scrn-runtime-color-function-color-index-src-mq3-client-cl-scrn-runtime-ml-446577968"></a>
### color

```ml
function color(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L34)

<a id="function-function-mq3-client-cl-scrn-runtime-create-function-create-renderstate-uilifecycle-host-width-height-charsetshader-whiteshader-src-mq3-client-cl-scrn-runtime-ml-1828062129"></a>
### create

```ml
function create(renderState, uiLifecycle, host, width, height, charSetShader, whiteShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderState` | `dynamic` | — |  |
| `uiLifecycle` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `charSetShader` | `dynamic` | — |  |
| `whiteShader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L27)

<a id="function-function-mq3-client-cl-scrn-runtime-draw-function-draw-state-x-y-w-h-s1-t1-s2-t2-shader-src-mq3-client-cl-scrn-runtime-ml-1162637334"></a>
### draw

```ml
function draw(state, x, y, w, h, s1, t1, s2, t2, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L47)

<a id="function-function-mq3-client-cl-scrn-runtime-emit-function-emit-state-kind-value-src-mq3-client-cl-scrn-runtime-ml-1220430106"></a>
### emit

```ml
function emit(state, kind, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L33)

<a id="function-function-mq3-client-cl-scrn-runtime-fail-function-fail-message-src-mq3-client-cl-scrn-runtime-ml-2062802491"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L25)

- [mq3.client.cl_scrn_runtime.GraphSample](Type-mq3-client-cl-scrn-runtime-graphsample-2007097154.md) — struct
<a id="function-function-mq3-client-cl-scrn-runtime-iscolor-function-iscolor-data-index-src-mq3-client-cl-scrn-runtime-ml-1121084036"></a>
### isColor

```ml
function isColor(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L38)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-adjustfrom640-function-scr-adjustfrom640-state-x-y-w-h-src-mq3-client-cl-scrn-runtime-ml-678919345"></a>
### SCR_AdjustFrom640

```ml
function SCR_AdjustFrom640(state, x, y, w, h)
```

SCR_AdjustFrom640 -- independent x/y scaling is intentional Baseq3 behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L41)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-debuggraph-function-scr-debuggraph-state-value-colorindex-src-mq3-client-cl-scrn-runtime-ml-920279991"></a>
### SCR_DebugGraph

```ml
function SCR_DebugGraph(state, value, colorIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `colorIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L106)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawbigstring-function-scr-drawbigstring-state-x-y-text-alpha-src-mq3-client-cl-scrn-runtime-ml-1601716335"></a>
### SCR_DrawBigString

```ml
function SCR_DrawBigString(state, x, y, text, alpha)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L84)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawbigstringcolor-function-scr-drawbigstringcolor-state-x-y-text-rgba-src-mq3-client-cl-scrn-runtime-ml-234282723"></a>
### SCR_DrawBigStringColor

```ml
function SCR_DrawBigStringColor(state, x, y, text, rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L85)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawchar-function-scr-drawchar-state-x-y-size-ch-src-mq3-client-cl-scrn-runtime-ml-1598655442"></a>
### SCR_DrawChar

```ml
function SCR_DrawChar(state, x, y, size, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L59)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawdebuggraph-function-scr-drawdebuggraph-state-src-mq3-client-cl-scrn-runtime-ml-1773741677"></a>
### SCR_DrawDebugGraph

```ml
function SCR_DrawDebugGraph(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L109)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawdemorecording-function-scr-drawdemorecording-state-src-mq3-client-cl-scrn-runtime-ml-1470082651"></a>
### SCR_DrawDemoRecording

```ml
function SCR_DrawDemoRecording(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L101)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawnamedpic-function-scr-drawnamedpic-state-x-y-width-height-picname-src-mq3-client-cl-scrn-runtime-ml-1784469350"></a>
### SCR_DrawNamedPic

```ml
function SCR_DrawNamedPic(state, x, y, width, height, picname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `picname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L48)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawpic-function-scr-drawpic-state-x-y-width-height-shader-src-mq3-client-cl-scrn-runtime-ml-1988694532"></a>
### SCR_DrawPic

```ml
function SCR_DrawPic(state, x, y, width, height, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L56)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawscreenfield-function-scr-drawscreenfield-state-stereoframe-src-mq3-client-cl-scrn-runtime-ml-959997518"></a>
### SCR_DrawScreenField

```ml
function SCR_DrawScreenField(state, stereoFrame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stereoFrame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L121)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawsmallchar-function-scr-drawsmallchar-state-x-y-ch-src-mq3-client-cl-scrn-runtime-ml-791976585"></a>
### SCR_DrawSmallChar

```ml
function SCR_DrawSmallChar(state, x, y, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L64)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawsmallstringext-function-scr-drawsmallstringext-state-x-y-text-setcolor-forcecolor-src-mq3-client-cl-scrn-runtime-ml-1777313438"></a>
### SCR_DrawSmallStringExt

```ml
function SCR_DrawSmallStringExt(state, x, y, text, setColor, forceColor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `setColor` | `dynamic` | — |  |
| `forceColor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L86)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-drawstringext-function-scr-drawstringext-state-x-y-size-text-setcolor-forcecolor-src-mq3-client-cl-scrn-runtime-ml-566526671"></a>
### SCR_DrawStringExt

```ml
function SCR_DrawStringExt(state, x, y, size, text, setColor, forceColor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `setColor` | `dynamic` | — |  |
| `forceColor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L69)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-fillrect-function-scr-fillrect-state-x-y-width-height-rgba-src-mq3-client-cl-scrn-runtime-ml-2120011551"></a>
### SCR_FillRect

```ml
function SCR_FillRect(state, x, y, width, height, rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L53)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-getbigstringwidth-function-scr-getbigstringwidth-text-src-mq3-client-cl-scrn-runtime-ml-931290451"></a>
### SCR_GetBigStringWidth

```ml
function SCR_GetBigStringWidth(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L99)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-init-function-scr-init-state-src-mq3-client-cl-scrn-runtime-ml-277580753"></a>
### SCR_Init

```ml
function SCR_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L117)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-strlen-function-scr-strlen-text-src-mq3-client-cl-scrn-runtime-ml-944599567"></a>
### SCR_Strlen

```ml
function SCR_Strlen(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L96)

<a id="function-function-mq3-client-cl-scrn-runtime-scr-updatescreen-function-scr-updatescreen-state-src-mq3-client-cl-scrn-runtime-ml-40089921"></a>
### SCR_UpdateScreen

```ml
function SCR_UpdateScreen(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L133)

<a id="constant-constant-mq3-client-cl-scrn-runtime-screen-height-const-screen-height-480-src-mq3-client-cl-scrn-runtime-ml-970874283"></a>
### SCREEN_HEIGHT

```ml
const SCREEN_HEIGHT = 480.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L13)

<a id="constant-constant-mq3-client-cl-scrn-runtime-screen-width-const-screen-width-640-src-mq3-client-cl-scrn-runtime-ml-2010000109"></a>
### SCREEN_WIDTH

```ml
const SCREEN_WIDTH = 640.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L12)

<a id="function-function-mq3-client-cl-scrn-runtime-services-function-services-context-src-mq3-client-cl-scrn-runtime-ml-1973680319"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L26)

- [mq3.client.cl_scrn_runtime.Services](Type-mq3-client-cl-scrn-runtime-services-1553853860.md) — struct
<a id="constant-constant-mq3-client-cl-scrn-runtime-smallchar-height-const-smallchar-height-16-src-mq3-client-cl-scrn-runtime-ml-79639782"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L15)

<a id="constant-constant-mq3-client-cl-scrn-runtime-smallchar-width-const-smallchar-width-8-src-mq3-client-cl-scrn-runtime-ml-1999448545"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L14)

- [mq3.client.cl_scrn_runtime.State](Type-mq3-client-cl-scrn-runtime-state-2108439569.md) — struct
<a id="constant-constant-mq3-client-cl-scrn-runtime-stereo-center-const-stereo-center-0-src-mq3-client-cl-scrn-runtime-ml-1772628449"></a>
### STEREO_CENTER

```ml
const STEREO_CENTER = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L17)

<a id="constant-constant-mq3-client-cl-scrn-runtime-stereo-left-const-stereo-left-1-src-mq3-client-cl-scrn-runtime-ml-256493450"></a>
### STEREO_LEFT

```ml
const STEREO_LEFT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L18)

<a id="constant-constant-mq3-client-cl-scrn-runtime-stereo-right-const-stereo-right-2-src-mq3-client-cl-scrn-runtime-ml-711524263"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L19)
