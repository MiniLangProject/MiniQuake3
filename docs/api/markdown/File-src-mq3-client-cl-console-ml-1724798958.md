# `src/mq3/client/cl_console.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_console`](Package-mq3-client-cl-console-459717244.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/console_input.ml` as `clConsoleInput` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/console_input_display.ml` as `inputDisplay` → [src/mq3/client/console_input_display.ml](File-src-mq3-client-console-input-display-ml-1771363644.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `fs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cl-console-blanktext-function-blanktext-src-mq3-client-cl-console-ml-2095118286"></a>
### blankText

```ml
function blankText()
```

Creates an array from `CON_TEXTSIZE, whiteCell()` for engine client console `blankText`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L196)

<a id="constant-constant-mq3-client-cl-console-ca-active-const-ca-active-8-src-mq3-client-cl-console-ml-1563133981"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```

Connection-state value for normal gameplay after game-state loading, defined for selecting in-game notification and console presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L31)

<a id="constant-constant-mq3-client-cl-console-ca-disconnected-const-ca-disconnected-0-src-mq3-client-cl-console-ml-898493341"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 0
```

Client connection state with no active server connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L28)

<a id="function-function-mq3-client-cl-console-cl-consoleprint-function-cl-consoleprint-state-text-screenwidth-src-mq3-client-cl-console-ml-1343908358"></a>
### CL_ConsolePrint

```ml
function CL_ConsolePrint(state, text, screenWidth)
```

Updates `state.linewidth`, `state.initialized`, `state.x`, `state.text[base+state.x]` and additional values during engine client console `CL_ConsolePrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.linewidth`, `state.initialized`, `state.x`, `state.text[base+state.x]` and additional values. |
| `text` | `dynamic` | — | Mutable sequence; this routine writes `text[base+state.x]`. |
| `screenWidth` | `dynamic` | — | Value used by `Con_CheckResize(state,screenWidth)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L285)

<a id="function-function-mq3-client-cl-console-clearcells-function-clearcells-state-src-mq3-client-cl-console-ml-611080533"></a>
### clearCells

```ml
function clearCells(state)
```

Updates `state.text` during engine client console `clearCells`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L217)

<a id="constant-constant-mq3-client-cl-console-color-red-const-color-red-1-src-mq3-client-cl-console-ml-1826926712"></a>
### COLOR_RED

```ml
const COLOR_RED = 1
```

Native console palette index selecting red text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L35)

<a id="constant-constant-mq3-client-cl-console-color-white-const-color-white-7-src-mq3-client-cl-console-ml-1362864086"></a>
### COLOR_WHITE

```ml
const COLOR_WHITE = 7
```

Native console palette index selecting white text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L33)

<a id="function-function-mq3-client-cl-console-colorindex-function-colorindex-ch-src-mq3-client-cl-console-ml-1319065839"></a>
### colorIndex

```ml
function colorIndex(ch)
```

Computes `ch&7` for engine client console `colorIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | Value used by `return ch&7`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L210)

<a id="function-function-mq3-client-cl-console-con-bottom-function-con-bottom-state-src-mq3-client-cl-console-ml-306034965"></a>
### Con_Bottom

```ml
function Con_Bottom(state)
```

Updates `state.display` during engine client console `Con_Bottom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.display`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L306)

<a id="function-function-mq3-client-cl-console-con-checkresize-function-con-checkresize-state-screenwidth-src-mq3-client-cl-console-ml-1614835481"></a>
### Con_CheckResize

```ml
function Con_CheckResize(state, screenWidth)
```

Updates `state.linewidth`, `state.totallines`, `state.text[newBase+column]`, `state.current` and additional values during engine client console `Con_CheckResize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.linewidth`, `state.totallines`, `state.text[newBase+column]`, `state.current` and additional values. |
| `screenWidth` | `dynamic` | — | Value used by `width=numeric.trunc32(screenWidth/SMALLCHAR_WIDTH)-2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L247)

<a id="function-function-mq3-client-cl-console-con-clear-f-function-con-clear-f-state-src-mq3-client-cl-console-ml-719143083"></a>
### Con_Clear_f

```ml
function Con_Clear_f(state)
```

Calls `mq3.client.cl_console.clearCells`, `mq3.client.cl_console.Con_Bottom` from engine client console `Con_Clear_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client console state passed to the helper calls in `Con_Clear_f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L318)

<a id="function-function-mq3-client-cl-console-con-clearnotify-function-con-clearnotify-state-src-mq3-client-cl-console-ml-1018048475"></a>
### Con_ClearNotify

```ml
function Con_ClearNotify(state)
```

Updates `state.times` during engine client console `Con_ClearNotify`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.times`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L243)

<a id="function-function-mq3-client-cl-console-con-close-function-con-close-state-src-mq3-client-cl-console-ml-696447815"></a>
### Con_Close

```ml
function Con_Close(state)
```

Updates `state.finalFrac`, `state.displayFrac` during engine client console `Con_Close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.finalFrac`, `state.displayFrac`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L417)

<a id="function-function-mq3-client-cl-console-con-drawconsole-function-con-drawconsole-state-screenwidth-videowidth-videoheight-version-src-mq3-client-cl-console-ml-584499274"></a>
### Con_DrawConsole

```ml
function Con_DrawConsole(state, screenWidth, videoWidth, videoHeight, version)
```

Calls `mq3.client.cl_console.Con_CheckResize`, `mq3.client.cl_console.DrawView`, `mq3.client.cl_console.Con_DrawSolidConsole` and additional helpers from engine client console `Con_DrawConsole`. The final path returns `DrawView("none",void,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.connectionState`, `state.uiOrCgameCatcher`, `state.displayFrac`. |
| `screenWidth` | `dynamic` | — | Value used by `Con_CheckResize(state,screenWidth)`. |
| `videoWidth` | `dynamic` | — | Value used by `if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth...`. |
| `videoHeight` | `dynamic` | — | Value used by `if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth...`. |
| `version` | `dynamic` | — | Value used by `if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L400)

<a id="function-function-mq3-client-cl-console-con-drawinput-function-con-drawinput-state-src-mq3-client-cl-console-ml-2087210639"></a>
### Con_DrawInput

```ml
function Con_DrawInput(state)
```

Updates `state.consoleInput.catcher` during engine client console `Con_DrawInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L361)

<a id="function-function-mq3-client-cl-console-con-drawnotify-function-con-drawnotify-state-src-mq3-client-cl-console-ml-1756396853"></a>
### Con_DrawNotify

```ml
function Con_DrawNotify(state)
```

Updates `state.consoleInput.catcher` during engine client console `Con_DrawNotify`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L367)

<a id="function-function-mq3-client-cl-console-con-drawsolidconsole-function-con-drawsolidconsole-state-fraction-videowidth-videoheight-version-src-mq3-client-cl-console-ml-1019183702"></a>
### Con_DrawSolidConsole

```ml
function Con_DrawSolidConsole(state, fraction, videoWidth, videoHeight, version)
```

Updates `state.vislines` during engine client console `Con_DrawSolidConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.vislines`. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |
| `videoWidth` | `dynamic` | — | Value used by `for index=0 to len(versionRaw)-1 glyphs.add(Glyph(videoWidth-(len(versionRaw)-index)*SMALLCHAR_WIDTH,lines-(SMALLCHAR_HEIGHT+SMALLCHAR_HEIGHT/...`. |
| `videoHeight` | `dynamic` | — | Value used by `lines=numeric.trunc32(videoHeight*fraction)`. |
| `version` | `dynamic` | — | Sequence whose length/content is inspected by `Con_DrawSolidConsole`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L383)

<a id="function-function-mq3-client-cl-console-con-dump-f-function-con-dump-f-state-filename-src-mq3-client-cl-console-ml-1964924712"></a>
### Con_Dump_f

```ml
function Con_Dump_f(state, filename)
```

Calls `mq3.client.cl_console.dumpText`, `std.fs.writeAllBytes` from engine client console `Con_Dump_f`. The final path returns `len(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client console state passed to the helper calls in `Con_Dump_f`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L329)

<a id="function-function-mq3-client-cl-console-con-init-function-con-init-state-screenwidth-src-mq3-client-cl-console-ml-1507157171"></a>
### Con_Init

```ml
function Con_Init(state, screenWidth)
```

Updates `state.notifyTime`, `state.conSpeed`, `state.consoleInput.console.widthInChars`, `state.consoleInput.history[index].widthInChars` and additional values during engine client console `Con_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.notifyTime`, `state.conSpeed`, `state.consoleInput.console.widthInChars`, `state.consoleInput.history[index].widthInChars` and additional values. |
| `screenWidth` | `dynamic` | — | Value used by `Con_CheckResize(state,screenWidth)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L267)

<a id="function-function-mq3-client-cl-console-con-linefeed-function-con-linefeed-state-skipnotify-src-mq3-client-cl-console-ml-987575471"></a>
### Con_Linefeed

```ml
function Con_Linefeed(state, skipnotify)
```

Updates `state.times[positiveMod(state.current,NUM_CON_TIMES)]`, `state.x`, `state.display`, `state.current` and additional values during engine client console `Con_Linefeed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.times[positiveMod(state.current,NUM_CON_TIMES)]`, `state.x`, `state.display`, `state.current` and additional values. |
| `skipnotify` | `dynamic` | — | Value used by `if state.current>=0 then if skipnotify then state.times[positiveMod(state.current,NUM_CON_TIMES)]=0 else state.times[positiveMod(state.current...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L276)

<a id="function-function-mq3-client-cl-console-con-messagemode2-f-function-con-messagemode2-f-state-src-mq3-client-cl-console-ml-553144437"></a>
### Con_MessageMode2_f

```ml
function Con_MessageMode2_f(state)
```

Calls `mq3.client.console_input.beginMessage`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode2_f`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleInput`, `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L351)

<a id="function-function-mq3-client-cl-console-con-messagemode3-f-function-con-messagemode3-f-state-src-mq3-client-cl-console-ml-801206761"></a>
### Con_MessageMode3_f

```ml
function Con_MessageMode3_f(state)
```

Calls `mq3.client.cl_console.messagePlayer`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode3_f`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L354)

<a id="function-function-mq3-client-cl-console-con-messagemode4-f-function-con-messagemode4-f-state-src-mq3-client-cl-console-ml-694044897"></a>
### Con_MessageMode4_f

```ml
function Con_MessageMode4_f(state)
```

Calls `mq3.client.cl_console.messagePlayer`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode4_f`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L357)

<a id="function-function-mq3-client-cl-console-con-messagemode-f-function-con-messagemode-f-state-src-mq3-client-cl-console-ml-775100309"></a>
### Con_MessageMode_f

```ml
function Con_MessageMode_f(state)
```

Calls `mq3.client.console_input.beginMessage`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode_f`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.consoleInput`, `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L348)

<a id="function-function-mq3-client-cl-console-con-pagedown-function-con-pagedown-state-src-mq3-client-cl-console-ml-262816613"></a>
### Con_PageDown

```ml
function Con_PageDown(state)
```

Updates `state.display` during engine client console `Con_PageDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.display`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L315)

<a id="function-function-mq3-client-cl-console-con-pageup-function-con-pageup-state-src-mq3-client-cl-console-ml-1599292725"></a>
### Con_PageUp

```ml
function Con_PageUp(state)
```

Updates `state.display` during engine client console `Con_PageUp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.display`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L312)

<a id="function-function-mq3-client-cl-console-con-runconsole-function-con-runconsole-state-src-mq3-client-cl-console-ml-1751930993"></a>
### Con_RunConsole

```ml
function Con_RunConsole(state)
```

Updates `state.finalFrac`, `state.displayFrac` during engine client console `Con_RunConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.finalFrac`, `state.displayFrac`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L409)

<a id="constant-constant-mq3-client-cl-console-con-textsize-const-con-textsize-32768-src-mq3-client-cl-console-ml-523341309"></a>
### CON_TEXTSIZE

```ml
const CON_TEXTSIZE = 32768
```

Capacity of the console scrollback text buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L15)

<a id="function-function-mq3-client-cl-console-con-toggleconsole-f-function-con-toggleconsole-f-state-src-mq3-client-cl-console-ml-1010354115"></a>
### Con_ToggleConsole_f

```ml
function Con_ToggleConsole_f(state)
```

Updates `state.consoleInput.console.widthInChars` during engine client console `Con_ToggleConsole_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.consoleInput.console.widthInChars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L335)

<a id="function-function-mq3-client-cl-console-con-top-function-con-top-state-src-mq3-client-cl-console-ml-2073145753"></a>
### Con_Top

```ml
function Con_Top(state)
```

Updates `state.display` during engine client console `Con_Top`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.display`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L309)

- [mq3.client.cl_console.ConsoleLine](Type-mq3-client-cl-console-consoleline-149698957.md) — struct
<a id="function-function-mq3-client-cl-console-create-function-create-consoleinput-host-src-mq3-client-cl-console-ml-715349537"></a>
### create

```ml
function create(consoleInput, host)
```

Updates `consoleInput.consoleRuntime` during engine client console `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `consoleInput` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `consoleInput.consoleRuntime`. |
| `host` | `dynamic` | — | host record passed to the engine client console helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L200)

<a id="constant-constant-mq3-client-cl-console-default-console-width-const-default-console-width-78-src-mq3-client-cl-console-ml-1244708816"></a>
### DEFAULT_CONSOLE_WIDTH

```ml
const DEFAULT_CONSOLE_WIDTH = 78
```

Fallback console width setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L18)

- [mq3.client.cl_console.DrawView](Type-mq3-client-cl-console-drawview-1873391921.md) — struct
<a id="function-function-mq3-client-cl-console-dumptext-function-dumptext-state-src-mq3-client-cl-console-ml-200290441"></a>
### dumpText

```ml
function dumpText(state)
```

Calls `mq3.client.cl_console.lineText` from engine client console `dumpText`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.totallines`, `state.current`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L321)

- [mq3.client.cl_console.Glyph](Type-mq3-client-cl-console-glyph-1988571348.md) — struct
<a id="function-function-mq3-client-cl-console-iscolor-function-iscolor-data-index-src-mq3-client-cl-console-ml-1842818198"></a>
### isColor

```ml
function isColor(data, index)
```

Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for engine client console `isColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[index]`, `data[index+1]`. |
| `index` | `dynamic` | — | Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L214)

<a id="constant-constant-mq3-client-cl-console-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-cl-console-ml-1973272463"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```

Input-capture bit that routes keyboard events to the cgame subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L26)

<a id="constant-constant-mq3-client-cl-console-keycatch-ui-const-keycatch-ui-2-src-mq3-client-cl-console-ml-1060420999"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

Native UI keyboard-capture bit exposed alongside the console's input-catcher definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L24)

<a id="function-function-mq3-client-cl-console-lineglyphs-function-lineglyphs-state-line-startx-starty-src-mq3-client-cl-console-ml-1642565516"></a>
### lineGlyphs

```ml
function lineGlyphs(state, line, startX, startY)
```

Collects non-space glyphs from a console row, extracting each packed character/color value into a positioned glyph record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.linewidth`, `state.totallines`, `state.text`. |
| `line` | `dynamic` | — | Value used by `base=lineOffset(state,line)`. |
| `startX` | `dynamic` | — | Value used by `if ch!=32 then result.add(Glyph(startX+index*SMALLCHAR_WIDTH,startY,ch,(cell>>8)&7)) end if end for`. |
| `startY` | `dynamic` | — | Value used by `if ch!=32 then result.add(Glyph(startX+index*SMALLCHAR_WIDTH,startY,ch,(cell>>8)&7)) end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L235)

<a id="function-function-mq3-client-cl-console-lineoffset-function-lineoffset-state-line-src-mq3-client-cl-console-ml-1870577191"></a>
### lineOffset

```ml
function lineOffset(state, line)
```

Computes `positiveMod(line,state.totallines)*state.linewidth` for engine client console `lineOffset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.totallines`, `state.linewidth`. |
| `line` | `dynamic` | — | Value used by `return positiveMod(line,state.totallines)*state.linewidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L221)

<a id="function-function-mq3-client-cl-console-linetext-function-linetext-state-line-src-mq3-client-cl-console-ml-1016238575"></a>
### lineText

```ml
function lineText(state, line)
```

Calls `mq3.client.cl_console.lineOffset`, `decode`, `slice` from engine client console `lineText`. The final path returns `decode(slice(raw,0,endAt))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.totallines`, `state.linewidth`, `state.text`. |
| `line` | `dynamic` | — | Value used by `base=lineOffset(state,line)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L225)

<a id="constant-constant-mq3-client-cl-console-max-clients-const-max-clients-64-src-mq3-client-cl-console-ml-300124619"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L37)

<a id="function-function-mq3-client-cl-console-messageplayer-function-messageplayer-state-kind-src-mq3-client-cl-console-ml-1964691727"></a>
### messagePlayer

```ml
function messagePlayer(state, kind)
```

Updates `state.consoleInput.chatPlayerNum` during engine client console `messagePlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.consoleInput.chatPlayerNum`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L342)

- [mq3.client.cl_console.NotifyView](Type-mq3-client-cl-console-notifyview-1366810310.md) — struct
<a id="constant-constant-mq3-client-cl-console-num-con-times-const-num-con-times-4-src-mq3-client-cl-console-ml-968412673"></a>
### NUM_CON_TIMES

```ml
const NUM_CON_TIMES = 4
```

Number of recent console-line timestamps retained for notification fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L13)

<a id="function-function-mq3-client-cl-console-positivemod-function-positivemod-value-modulus-src-mq3-client-cl-console-ml-1981833120"></a>
### positiveMod

```ml
function positiveMod(value, modulus)
```

Computes a nonnegative ring-buffer index from a possibly negative value and a positive modulus.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `result=value%modulus`. |
| `modulus` | `dynamic` | — | Value used by `result=value%modulus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L192)

<a id="function-function-mq3-client-cl-console-services-function-services-context-src-mq3-client-cl-console-ml-1023682723"></a>
### services

```ml
function services(context)
```

Creates a `mq3.client.cl_console.Services` record. Assigns `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L188)

- [mq3.client.cl_console.Services](Type-mq3-client-cl-console-services-1438465658.md) — struct
<a id="function-function-mq3-client-cl-console-setcatcher-function-setcatcher-state-value-src-mq3-client-cl-console-ml-791523918"></a>
### setCatcher

```ml
function setCatcher(state, value)
```

Updates `state.keyCatchers`, `state.consoleInput.catcher` during engine client console `setCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client console record/storage; this routine assigns `state.keyCatchers`, `state.consoleInput.catcher`. |
| `value` | `dynamic` | — | Value assigned to `state.keyCatchers`, `state.consoleInput.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L207)

<a id="constant-constant-mq3-client-cl-console-smallchar-height-const-smallchar-height-16-src-mq3-client-cl-console-ml-311496204"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```

Smallchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L22)

<a id="constant-constant-mq3-client-cl-console-smallchar-width-const-smallchar-width-8-src-mq3-client-cl-console-ml-1706246905"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```

Smallchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L20)

- [mq3.client.cl_console.SolidView](Type-mq3-client-cl-console-solidview-146080452.md) — struct
- [mq3.client.cl_console.State](Type-mq3-client-cl-console-state-529232075.md) — struct
<a id="function-function-mq3-client-cl-console-whitecell-function-whitecell-src-mq3-client-cl-console-ml-2046799590"></a>
### whiteCell

```ml
function whiteCell()
```

Computes `(COLOR_WHITE<<8)|32` for engine client console `whiteCell`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L194)
