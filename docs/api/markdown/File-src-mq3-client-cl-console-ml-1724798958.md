# `src/mq3/client/cl_console.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_console`](Package-mq3-client-cl-console-459717244.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/console_input.ml` as `clConsoleInput` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/console_input_display.ml` as `inputDisplay` → [src/mq3/client/console_input_display.ml](File-src-mq3-client-console-input-display-ml-1771363644.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cl-console-blanktext-function-blanktext-src-mq3-client-cl-console-ml-2095118286"></a>
### blankText

```ml
function blankText()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L35)

<a id="constant-constant-mq3-client-cl-console-ca-active-const-ca-active-8-src-mq3-client-cl-console-ml-1563133981"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L19)

<a id="constant-constant-mq3-client-cl-console-ca-disconnected-const-ca-disconnected-0-src-mq3-client-cl-console-ml-898493341"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L18)

<a id="function-function-mq3-client-cl-console-cl-consoleprint-function-cl-consoleprint-state-text-screenwidth-src-mq3-client-cl-console-ml-1343908358"></a>
### CL_ConsolePrint

```ml
function CL_ConsolePrint(state, text, screenWidth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `screenWidth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L85)

<a id="function-function-mq3-client-cl-console-clearcells-function-clearcells-state-src-mq3-client-cl-console-ml-611080533"></a>
### clearCells

```ml
function clearCells(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L43)

<a id="constant-constant-mq3-client-cl-console-color-red-const-color-red-1-src-mq3-client-cl-console-ml-1826926712"></a>
### COLOR_RED

```ml
const COLOR_RED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L21)

<a id="constant-constant-mq3-client-cl-console-color-white-const-color-white-7-src-mq3-client-cl-console-ml-1362864086"></a>
### COLOR_WHITE

```ml
const COLOR_WHITE = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L20)

<a id="function-function-mq3-client-cl-console-colorindex-function-colorindex-ch-src-mq3-client-cl-console-ml-1319065839"></a>
### colorIndex

```ml
function colorIndex(ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L41)

<a id="function-function-mq3-client-cl-console-con-bottom-function-con-bottom-state-src-mq3-client-cl-console-ml-306034965"></a>
### Con_Bottom

```ml
function Con_Bottom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L104)

<a id="function-function-mq3-client-cl-console-con-checkresize-function-con-checkresize-state-screenwidth-src-mq3-client-cl-console-ml-1614835481"></a>
### Con_CheckResize

```ml
function Con_CheckResize(state, screenWidth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `screenWidth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L57)

<a id="function-function-mq3-client-cl-console-con-clear-f-function-con-clear-f-state-src-mq3-client-cl-console-ml-719143083"></a>
### Con_Clear_f

```ml
function Con_Clear_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L108)

<a id="function-function-mq3-client-cl-console-con-clearnotify-function-con-clearnotify-state-src-mq3-client-cl-console-ml-1018048475"></a>
### Con_ClearNotify

```ml
function Con_ClearNotify(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L56)

<a id="function-function-mq3-client-cl-console-con-close-function-con-close-state-src-mq3-client-cl-console-ml-696447815"></a>
### Con_Close

```ml
function Con_Close(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L169)

<a id="function-function-mq3-client-cl-console-con-drawconsole-function-con-drawconsole-state-screenwidth-videowidth-videoheight-version-src-mq3-client-cl-console-ml-584499274"></a>
### Con_DrawConsole

```ml
function Con_DrawConsole(state, screenWidth, videoWidth, videoHeight, version)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `screenWidth` | `dynamic` | — |  |
| `videoWidth` | `dynamic` | — |  |
| `videoHeight` | `dynamic` | — |  |
| `version` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L156)

<a id="function-function-mq3-client-cl-console-con-drawinput-function-con-drawinput-state-src-mq3-client-cl-console-ml-2087210639"></a>
### Con_DrawInput

```ml
function Con_DrawInput(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L131)

<a id="function-function-mq3-client-cl-console-con-drawnotify-function-con-drawnotify-state-src-mq3-client-cl-console-ml-1756396853"></a>
### Con_DrawNotify

```ml
function Con_DrawNotify(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L135)

<a id="function-function-mq3-client-cl-console-con-drawsolidconsole-function-con-drawsolidconsole-state-fraction-videowidth-videoheight-version-src-mq3-client-cl-console-ml-1019183702"></a>
### Con_DrawSolidConsole

```ml
function Con_DrawSolidConsole(state, fraction, videoWidth, videoHeight, version)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |
| `videoWidth` | `dynamic` | — |  |
| `videoHeight` | `dynamic` | — |  |
| `version` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L145)

<a id="function-function-mq3-client-cl-console-con-dump-f-function-con-dump-f-state-filename-src-mq3-client-cl-console-ml-1964924712"></a>
### Con_Dump_f

```ml
function Con_Dump_f(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L114)

<a id="function-function-mq3-client-cl-console-con-init-function-con-init-state-screenwidth-src-mq3-client-cl-console-ml-1507157171"></a>
### Con_Init

```ml
function Con_Init(state, screenWidth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `screenWidth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L74)

<a id="function-function-mq3-client-cl-console-con-linefeed-function-con-linefeed-state-skipnotify-src-mq3-client-cl-console-ml-987575471"></a>
### Con_Linefeed

```ml
function Con_Linefeed(state, skipnotify)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `skipnotify` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L80)

<a id="function-function-mq3-client-cl-console-con-messagemode2-f-function-con-messagemode2-f-state-src-mq3-client-cl-console-ml-553144437"></a>
### Con_MessageMode2_f

```ml
function Con_MessageMode2_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L127)

<a id="function-function-mq3-client-cl-console-con-messagemode3-f-function-con-messagemode3-f-state-src-mq3-client-cl-console-ml-801206761"></a>
### Con_MessageMode3_f

```ml
function Con_MessageMode3_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L128)

<a id="function-function-mq3-client-cl-console-con-messagemode4-f-function-con-messagemode4-f-state-src-mq3-client-cl-console-ml-694044897"></a>
### Con_MessageMode4_f

```ml
function Con_MessageMode4_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L129)

<a id="function-function-mq3-client-cl-console-con-messagemode-f-function-con-messagemode-f-state-src-mq3-client-cl-console-ml-775100309"></a>
### Con_MessageMode_f

```ml
function Con_MessageMode_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L126)

<a id="function-function-mq3-client-cl-console-con-pagedown-function-con-pagedown-state-src-mq3-client-cl-console-ml-262816613"></a>
### Con_PageDown

```ml
function Con_PageDown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L107)

<a id="function-function-mq3-client-cl-console-con-pageup-function-con-pageup-state-src-mq3-client-cl-console-ml-1599292725"></a>
### Con_PageUp

```ml
function Con_PageUp(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L106)

<a id="function-function-mq3-client-cl-console-con-runconsole-function-con-runconsole-state-src-mq3-client-cl-console-ml-1751930993"></a>
### Con_RunConsole

```ml
function Con_RunConsole(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L163)

<a id="constant-constant-mq3-client-cl-console-con-textsize-const-con-textsize-32768-src-mq3-client-cl-console-ml-523341309"></a>
### CON_TEXTSIZE

```ml
const CON_TEXTSIZE = 32768
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L12)

<a id="function-function-mq3-client-cl-console-con-toggleconsole-f-function-con-toggleconsole-f-state-src-mq3-client-cl-console-ml-1010354115"></a>
### Con_ToggleConsole_f

```ml
function Con_ToggleConsole_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L118)

<a id="function-function-mq3-client-cl-console-con-top-function-con-top-state-src-mq3-client-cl-console-ml-2073145753"></a>
### Con_Top

```ml
function Con_Top(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L105)

- [mq3.client.cl_console.ConsoleLine](Type-mq3-client-cl-console-consoleline-149698957.md) — struct
<a id="function-function-mq3-client-cl-console-create-function-create-consoleinput-host-src-mq3-client-cl-console-ml-715349537"></a>
### create

```ml
function create(consoleInput, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `consoleInput` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L36)

<a id="constant-constant-mq3-client-cl-console-default-console-width-const-default-console-width-78-src-mq3-client-cl-console-ml-1244708816"></a>
### DEFAULT_CONSOLE_WIDTH

```ml
const DEFAULT_CONSOLE_WIDTH = 78
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L13)

- [mq3.client.cl_console.DrawView](Type-mq3-client-cl-console-drawview-1873391921.md) — struct
<a id="function-function-mq3-client-cl-console-dumptext-function-dumptext-state-src-mq3-client-cl-console-ml-200290441"></a>
### dumpText

```ml
function dumpText(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L109)

- [mq3.client.cl_console.Glyph](Type-mq3-client-cl-console-glyph-1988571348.md) — struct
<a id="function-function-mq3-client-cl-console-iscolor-function-iscolor-data-index-src-mq3-client-cl-console-ml-1842818198"></a>
### isColor

```ml
function isColor(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L42)

<a id="constant-constant-mq3-client-cl-console-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-cl-console-ml-1973272463"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L17)

<a id="constant-constant-mq3-client-cl-console-keycatch-ui-const-keycatch-ui-2-src-mq3-client-cl-console-ml-1060420999"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L16)

<a id="function-function-mq3-client-cl-console-lineglyphs-function-lineglyphs-state-line-startx-starty-src-mq3-client-cl-console-ml-1642565516"></a>
### lineGlyphs

```ml
function lineGlyphs(state, line, startX, startY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `startX` | `dynamic` | — |  |
| `startY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L50)

<a id="function-function-mq3-client-cl-console-lineoffset-function-lineoffset-state-line-src-mq3-client-cl-console-ml-1870577191"></a>
### lineOffset

```ml
function lineOffset(state, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L44)

<a id="function-function-mq3-client-cl-console-linetext-function-linetext-state-line-src-mq3-client-cl-console-ml-1016238575"></a>
### lineText

```ml
function lineText(state, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L45)

<a id="constant-constant-mq3-client-cl-console-max-clients-const-max-clients-64-src-mq3-client-cl-console-ml-300124619"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L22)

<a id="function-function-mq3-client-cl-console-messageplayer-function-messageplayer-state-kind-src-mq3-client-cl-console-ml-1964691727"></a>
### messagePlayer

```ml
function messagePlayer(state, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L122)

- [mq3.client.cl_console.NotifyView](Type-mq3-client-cl-console-notifyview-1366810310.md) — struct
<a id="constant-constant-mq3-client-cl-console-num-con-times-const-num-con-times-4-src-mq3-client-cl-console-ml-968412673"></a>
### NUM_CON_TIMES

```ml
const NUM_CON_TIMES = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L11)

<a id="function-function-mq3-client-cl-console-positivemod-function-positivemod-value-modulus-src-mq3-client-cl-console-ml-1981833120"></a>
### positiveMod

```ml
function positiveMod(value, modulus)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `modulus` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L33)

<a id="function-function-mq3-client-cl-console-services-function-services-context-src-mq3-client-cl-console-ml-1023682723"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L32)

- [mq3.client.cl_console.Services](Type-mq3-client-cl-console-services-1438465658.md) — struct
<a id="function-function-mq3-client-cl-console-setcatcher-function-setcatcher-state-value-src-mq3-client-cl-console-ml-791523918"></a>
### setCatcher

```ml
function setCatcher(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L40)

<a id="constant-constant-mq3-client-cl-console-smallchar-height-const-smallchar-height-16-src-mq3-client-cl-console-ml-311496204"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L15)

<a id="constant-constant-mq3-client-cl-console-smallchar-width-const-smallchar-width-8-src-mq3-client-cl-console-ml-1706246905"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L14)

- [mq3.client.cl_console.SolidView](Type-mq3-client-cl-console-solidview-146080452.md) — struct
- [mq3.client.cl_console.State](Type-mq3-client-cl-console-state-529232075.md) — struct
<a id="function-function-mq3-client-cl-console-whitecell-function-whitecell-src-mq3-client-cl-console-ml-2046799590"></a>
### whiteCell

```ml
function whiteCell()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L34)
