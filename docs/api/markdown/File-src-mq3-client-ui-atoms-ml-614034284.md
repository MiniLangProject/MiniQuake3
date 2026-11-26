# `src/mq3/client/ui_atoms.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_atoms`](Package-mq3-client-ui-atoms-236523522.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_main.ml` as `uiMain` → [src/mq3/client/ui_main.ml](File-src-mq3-client-ui-main-ml-1850214811.md)
- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_atoms.Action](Type-mq3-client-ui-atoms-action-623527910.md) — struct
<a id="function-function-mq3-client-ui-atoms-bannerwidths-function-bannerwidths-src-mq3-client-ui-atoms-ml-712224844"></a>
### bannerWidths

```ml
function bannerWidths()
```

Builds the UI atoms `bannerWidths` sequence from `[33,31,31,30,21,21,32,30,13,29,31,21,40,32,31,31,30,30,30,25,30,32,51,32,31,25]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L159)

<a id="function-function-mq3-client-ui-atoms-clamp-function-clamp-value-low-high-src-mq3-client-ui-atoms-ml-521186499"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for UI atoms.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L155)

<a id="function-function-mq3-client-ui-atoms-com-error-function-com-error-state-level-message-src-mq3-client-ui-atoms-ml-1720550140"></a>
### Com_Error

```ml
function Com_Error(state, level, message)
```

Com_Error

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.emit`. |
| `level` | `dynamic` | — | Argument 4 of `mq3.client.ui_atoms.emit`; passed as `str(level)`. |
| `message` | `dynamic` | — | Argument 5 of `mq3.client.ui_atoms.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L168)

<a id="function-function-mq3-client-ui-atoms-com-printf-function-com-printf-state-message-src-mq3-client-ui-atoms-ml-360954316"></a>
### Com_Printf

```ml
function Com_Printf(state, message)
```

Com_Printf

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.emit`. |
| `message` | `dynamic` | — | Argument 5 of `mq3.client.ui_atoms.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L172)

<a id="function-function-mq3-client-ui-atoms-create-function-create-retailactive-src-mq3-client-ui-atoms-ml-2003498409"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_atoms.State` record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.mainState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L141)

<a id="function-function-mq3-client-ui-atoms-emit-function-emit-state-boundary-kind-name-text-values-color-src-mq3-client-ui-atoms-ml-558443410"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, values, color)
```

Appends a UI atoms action record to the queued engine requests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI atoms resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI atoms path. |
| `values` | `dynamic` | — | Value used by `value=Action(boundary,kind,name,text,values,color,not state.mainState.retailQvmActive)`. |
| `color` | `dynamic` | — | Color value used by the UI atoms drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L150)

<a id="constant-constant-mq3-client-ui-atoms-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-atoms-ml-1368562291"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when acquiring or releasing keyboard ownership when the base-game menu stack changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L58)

<a id="function-function-mq3-client-ui-atoms-needcdaction-function-needcdaction-state-result-src-mq3-client-ui-atoms-ml-170155824"></a>
### NeedCDAction

```ml
function NeedCDAction(state, result)
```

NeedCDAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `NeedCDAction`. |
| `result` | `dynamic` | — | Value used by `if not result then return emit(state,"command","append","quit","quit\\n",[],void) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L290)

<a id="function-function-mq3-client-ui-atoms-needcdkeyaction-function-needcdkeyaction-state-result-src-mq3-client-ui-atoms-ml-561116748"></a>
### NeedCDKeyAction

```ml
function NeedCDKeyAction(state, result)
```

NeedCDKeyAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.NeedCDAction`. |
| `result` | `dynamic` | — | Argument 2 of `mq3.client.ui_atoms.NeedCDAction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L294)

<a id="constant-constant-mq3-client-ui-atoms-prop-gap-width-const-prop-gap-width-3-src-mq3-client-ui-atoms-ml-614271526"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3
```

Prop font metric controlling gap width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L35)

<a id="constant-constant-mq3-client-ui-atoms-prop-height-const-prop-height-27-src-mq3-client-ui-atoms-ml-468723724"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```

Prop font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L39)

<a id="constant-constant-mq3-client-ui-atoms-prop-small-size-scale-const-prop-small-size-scale-0-75-src-mq3-client-ui-atoms-ml-687434763"></a>
### PROP_SMALL_SIZE_SCALE

```ml
const PROP_SMALL_SIZE_SCALE = 0.75
```

Prop font metric controlling small size scale in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L41)

<a id="constant-constant-mq3-client-ui-atoms-prop-space-width-const-prop-space-width-8-src-mq3-client-ui-atoms-ml-520829701"></a>
### PROP_SPACE_WIDTH

```ml
const PROP_SPACE_WIDTH = 8
```

Prop font metric controlling space width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L37)

<a id="function-function-mq3-client-ui-atoms-propwidths-function-propwidths-src-mq3-client-ui-atoms-ml-1111132992"></a>
### propWidths

```ml
function propWidths()
```

Builds the UI atoms `propWidths` sequence from `[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,8,7,14,17,18,23,18,7,8,9,18,18,7,11,6,14,17,12,17,18,19,18,18,16,17,18,7,7,14,14,14,18,22,18,18,18,1...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L157)

<a id="function-function-mq3-client-ui-atoms-quakecolor-function-quakecolor-code-src-mq3-client-ui-atoms-ml-1827287541"></a>
### quakeColor

```ml
function quakeColor(code)
```

Evaluates UI atoms `quakeColor` and returns `table[(code-48)&7]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Value used by `return table[(code-48)&7]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L162)

- [mq3.client.ui_atoms.State](Type-mq3-client-ui-atoms-state-866290361.md) — struct
<a id="function-function-mq3-client-ui-atoms-ui-adjustfrom640-function-ui-adjustfrom640-state-x-y-w-h-src-mq3-client-ui-atoms-ml-1438436393"></a>
### UI_AdjustFrom640

```ml
function UI_AdjustFrom640(state, x, y, w, h)
```

UI_AdjustFrom640

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scale`, `state.bias`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_AdjustFrom640`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_AdjustFrom640`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_AdjustFrom640`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_AdjustFrom640`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L340)

<a id="function-function-mq3-client-ui-atoms-ui-argv-function-ui-argv-state-index-src-mq3-client-ui-atoms-ml-1750915801"></a>
### UI_Argv

```ml
function UI_Argv(state, index)
```

UI_Argv

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.args`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(state.args)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L314)

<a id="constant-constant-mq3-client-ui-atoms-ui-bigfont-const-ui-bigfont-32-src-mq3-client-ui-atoms-ml-698854128"></a>
### UI_BIGFONT

```ml
const UI_BIGFONT = 32
```

UI text-style flag selecting the large fixed-width font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L23)

<a id="constant-constant-mq3-client-ui-atoms-ui-blink-const-ui-blink-4096-src-mq3-client-ui-atoms-ml-800344020"></a>
### UI_BLINK

```ml
const UI_BLINK = 4096
```

UI text-style flag selecting periodic visibility blinking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L29)

<a id="function-function-mq3-client-ui-atoms-ui-cache-f-function-ui-cache-f-state-src-mq3-client-ui-atoms-ml-2000558861"></a>
### UI_Cache_f

```ml
function UI_Cache_f(state)
```

UI_Cache_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.cacheNames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L321)

<a id="constant-constant-mq3-client-ui-atoms-ui-center-const-ui-center-1-src-mq3-client-ui-atoms-ml-583264200"></a>
### UI_CENTER

```ml
const UI_CENTER = 1
```

UI text-style flag selecting horizontally centered text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L15)

<a id="function-function-mq3-client-ui-atoms-ui-clampcvar-function-ui-clampcvar-minimum-maximum-value-src-mq3-client-ui-atoms-ml-1080003423"></a>
### UI_ClampCvar

```ml
function UI_ClampCvar(minimum, maximum, value)
```

UI_ClampCvar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | `dynamic` | — | Argument 2 of `mq3.client.ui_atoms.clamp`. |
| `maximum` | `dynamic` | — | Argument 3 of `mq3.client.ui_atoms.clamp`. |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.clamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L177)

<a id="function-function-mq3-client-ui-atoms-ui-consolecommand-function-ui-consolecommand-state-realtime-src-mq3-client-ui-atoms-ml-578101134"></a>
### UI_ConsoleCommand

```ml
function UI_ConsoleCommand(state, realTime)
```

UI_ConsoleCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.realtime`. |
| `realTime` | `dynamic` | — | Value assigned to `state.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L325)

<a id="function-function-mq3-client-ui-atoms-ui-cursorinrect-function-ui-cursorinrect-state-x-y-width-height-src-mq3-client-ui-atoms-ml-459821125"></a>
### UI_CursorInRect

```ml
function UI_CursorInRect(state, x, y, width, height)
```

UI_CursorInRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cursorx`, `state.cursory`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_CursorInRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_CursorInRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_CursorInRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_CursorInRect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L399)

<a id="function-function-mq3-client-ui-atoms-ui-cvar-variablestring-function-ui-cvar-variablestring-state-name-src-mq3-client-ui-atoms-ml-150988614"></a>
### UI_Cvar_VariableString

```ml
function UI_Cvar_VariableString(state, name)
```

UI_Cvar_VariableString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI atoms resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L318)

<a id="function-function-mq3-client-ui-atoms-ui-drawbannerstring-function-ui-drawbannerstring-state-x-y-text-style-color-src-mq3-client-ui-atoms-ml-58202461"></a>
### UI_DrawBannerString

```ml
function UI_DrawBannerString(state, x, y, text, style, color)
```

UI_DrawBannerString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `UI_DrawBannerString`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawBannerString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawBannerString`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawBannerString` in the UI atoms path. |
| `style` | `dynamic` | — | Value used by `if (style&UI_FORMATMASK)==UI_CENTER then x=x-numeric.trunc32(width/2) else if (style&UI_FORMATMASK)==UI_RIGHT then x=x-width end if`. |
| `color` | `dynamic` | — | Sequence read at `color[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L217)

<a id="function-function-mq3-client-ui-atoms-ui-drawbannerstring2-function-ui-drawbannerstring2-state-x-y-text-color-src-mq3-client-ui-atoms-ml-1331317760"></a>
### UI_DrawBannerString2

```ml
function UI_DrawBannerString2(state, x, y, text, color)
```

UI_DrawBannerString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scale`, `state.bias`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawBannerString2`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawBannerString2`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawBannerString2` in the UI atoms path. |
| `color` | `dynamic` | — | Color value used by the UI atoms drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L207)

<a id="function-function-mq3-client-ui-atoms-ui-drawchar-function-ui-drawchar-state-x-y-ch-style-color-src-mq3-client-ui-atoms-ml-37771147"></a>
### UI_DrawChar

```ml
function UI_DrawChar(state, x, y, ch, style, color)
```

UI_DrawChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.UI_DrawString`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.ui_atoms.UI_DrawString`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.ui_atoms.UI_DrawString`. |
| `ch` | `dynamic` | — | Argument 4 of `mq3.client.ui_atoms.UI_DrawString`; passed as `decode(bytes([ch&255]))`. |
| `style` | `dynamic` | — | Argument 5 of `mq3.client.ui_atoms.UI_DrawString`. |
| `color` | `dynamic` | — | Argument 6 of `mq3.client.ui_atoms.UI_DrawString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L283)

<a id="function-function-mq3-client-ui-atoms-ui-drawhandlepic-function-ui-drawhandlepic-state-x-y-w-h-shader-src-mq3-client-ui-atoms-ml-858927456"></a>
### UI_DrawHandlePic

```ml
function UI_DrawHandlePic(state, x, y, w, h, shader)
```

UI_DrawHandlePic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `UI_DrawHandlePic`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawHandlePic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawHandlePic`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_DrawHandlePic`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_DrawHandlePic`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L356)

<a id="function-function-mq3-client-ui-atoms-ui-drawnamedpic-function-ui-drawnamedpic-state-x-y-width-height-picname-src-mq3-client-ui-atoms-ml-1358563512"></a>
### UI_DrawNamedPic

```ml
function UI_DrawNamedPic(state, x, y, width, height, picname)
```

UI_DrawNamedPic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `UI_DrawNamedPic`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawNamedPic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawNamedPic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_DrawNamedPic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_DrawNamedPic`. |
| `picname` | `dynamic` | — | Value used by `emit(state,"renderer","register-shader",picname,"",[],void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L348)

<a id="function-function-mq3-client-ui-atoms-ui-drawproportionalstring-function-ui-drawproportionalstring-state-x-y-text-style-color-src-mq3-client-ui-atoms-ml-1123257439"></a>
### UI_DrawProportionalString

```ml
function UI_DrawProportionalString(state, x, y, text, style, color)
```

UI_DrawProportionalString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.realtime`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawProportionalString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawProportionalString`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawProportionalString` in the UI atoms path. |
| `style` | `dynamic` | — | Value used by `sizeScale=UI_ProportionalSizeScale(style)`. |
| `color` | `dynamic` | — | Sequence read at `color[3]`, `color[0]`, `color[1]`, `color[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L240)

<a id="function-function-mq3-client-ui-atoms-ui-drawproportionalstring2-function-ui-drawproportionalstring2-state-x-y-text-color-sizescale-charset-src-mq3-client-ui-atoms-ml-764544791"></a>
### UI_DrawProportionalString2

```ml
function UI_DrawProportionalString2(state, x, y, text, color, sizeScale, charset)
```

UI_DrawProportionalString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scale`, `state.bias`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawProportionalString2`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawProportionalString2`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawProportionalString2` in the UI atoms path. |
| `color` | `dynamic` | — | Color value used by the UI atoms drawing or interpolation operation. |
| `sizeScale` | `dynamic` | — | Value used by `if c==32 then w=PROP_SPACE_WIDTH else if w!=-1 then rows=rows+[emit(state,"renderer","proportional-glyph",charset,"",[at,y*state.scale,w*state...`. |
| `charset` | `dynamic` | — | Value used by `if c==32 then w=PROP_SPACE_WIDTH else if w!=-1 then rows=rows+[emit(state,"renderer","proportional-glyph",charset,"",[at,y*state.scale,w*state...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L229)

<a id="function-function-mq3-client-ui-atoms-ui-drawproportionalstring-autowrapped-function-ui-drawproportionalstring-autowrapped-state-x-y-xmax-ystep-text-style-color-src-mq3-client-ui-atoms-ml-2127254846"></a>
### UI_DrawProportionalString_AutoWrapped

```ml
function UI_DrawProportionalString_AutoWrapped(state, x, y, xmax, ystep, text, style, color)
```

UI_DrawProportionalString_AutoWrapped

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `UI_DrawProportionalString_AutoWrapped`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawProportionalString_AutoWrapped`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawProportionalString_AutoWrapped`. |
| `xmax` | `dynamic` | — | Value used by `if line!="" and UI_ProportionalStringWidth(candidate)*UI_ProportionalSizeScale(style)>xmax then rows=rows+UI_DrawProportionalString(state,x,y,...`. |
| `ystep` | `dynamic` | — | Value used by `y=y+ystep`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawProportionalString_AutoWrapped` in the UI atoms path. |
| `style` | `dynamic` | — | Value used by `if line!="" and UI_ProportionalStringWidth(candidate)*UI_ProportionalSizeScale(style)>xmax then rows=rows+UI_DrawProportionalString(state,x,y,...`. |
| `color` | `dynamic` | — | Color value used by the UI atoms drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L252)

<a id="function-function-mq3-client-ui-atoms-ui-drawrect-function-ui-drawrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-ml-535715214"></a>
### UI_DrawRect

```ml
function UI_DrawRect(state, x, y, width, height, color)
```

UI_DrawRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_DrawRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_DrawRect`. |
| `color` | `dynamic` | — | Color value used by the UI atoms drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L372)

<a id="function-function-mq3-client-ui-atoms-ui-drawstring-function-ui-drawstring-state-x-y-text-style-color-src-mq3-client-ui-atoms-ml-720772457"></a>
### UI_DrawString

```ml
function UI_DrawString(state, x, y, text, style, color)
```

UI_DrawString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.realtime`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawString`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawString` in the UI atoms path. |
| `style` | `dynamic` | — | Value used by `if (style&UI_BLINK)!=0 and (numeric.trunc32(state.realtime/200)&1)!=0 then return rows end if`. |
| `color` | `dynamic` | — | Sequence read at `color[0]`, `color[1]`, `color[2]`, `color[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L273)

<a id="function-function-mq3-client-ui-atoms-ui-drawstring2-function-ui-drawstring2-state-x-y-text-color-charw-charh-src-mq3-client-ui-atoms-ml-251800423"></a>
### UI_DrawString2

```ml
function UI_DrawString2(state, x, y, text, color, charw, charh)
```

UI_DrawString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scale`, `state.bias`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawString2`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawString2`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_DrawString2` in the UI atoms path. |
| `color` | `dynamic` | — | Sequence read at `color[3]`. |
| `charw` | `dynamic` | — | Value used by `if ch!=32 then rows=rows+[emit(state,"renderer","charset-glyph","charset","",[at,y*state.scale,charw*state.scale,charh*state.scale,ch],current...`. |
| `charh` | `dynamic` | — | Value used by `if y<0-charh then return rows end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L263)

<a id="function-function-mq3-client-ui-atoms-ui-drawtextbox-function-ui-drawtextbox-state-x-y-width-lines-src-mq3-client-ui-atoms-ml-1081081453"></a>
### UI_DrawTextBox

```ml
function UI_DrawTextBox(state, x, y, width, lines)
```

UI_DrawTextBox

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `UI_DrawTextBox`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawTextBox`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawTextBox`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_DrawTextBox`. |
| `lines` | `dynamic` | — | Value used by `return [UI_FillRect(state,x+8,y+8,(width+1)*16,(lines+1)*16,[0.0,0.0,0.0,1.0])]+UI_DrawRect(state,x+8,y+8,(width+1)*16,(lines+1)*16,[1.0,1.0,1...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L392)

<a id="constant-constant-mq3-client-ui-atoms-ui-dropshadow-const-ui-dropshadow-2048-src-mq3-client-ui-atoms-ml-410417067"></a>
### UI_DROPSHADOW

```ml
const UI_DROPSHADOW = 2048
```

UI text-style flag selecting a shadow behind the text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L27)

<a id="function-function-mq3-client-ui-atoms-ui-fillrect-function-ui-fillrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-ml-1146089792"></a>
### UI_FillRect

```ml
function UI_FillRect(state, x, y, width, height, color)
```

UI_FillRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_FillRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_FillRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_FillRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_FillRect`. |
| `color` | `dynamic` | — | Color value used by the UI atoms drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L364)

<a id="function-function-mq3-client-ui-atoms-ui-forcemenuoff-function-ui-forcemenuoff-state-src-mq3-client-ui-atoms-ml-1952114909"></a>
### UI_ForceMenuOff

```ml
function UI_ForceMenuOff(state)
```

UI_ForceMenuOff

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.stack`, `state.activeMenu`, `state.keyCatcher`, `state.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L194)

<a id="constant-constant-mq3-client-ui-atoms-ui-formatmask-const-ui-formatmask-7-src-mq3-client-ui-atoms-ml-478207042"></a>
### UI_FORMATMASK

```ml
const UI_FORMATMASK = 7
```

UI text-style flag selecting the horizontal-alignment bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L19)

<a id="constant-constant-mq3-client-ui-atoms-ui-giantfont-const-ui-giantfont-64-src-mq3-client-ui-atoms-ml-1486161579"></a>
### UI_GIANTFONT

```ml
const UI_GIANTFONT = 64
```

UI text-style flag selecting the giant fixed-width font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L25)

<a id="function-function-mq3-client-ui-atoms-ui-init-function-ui-init-state-vidwidth-vidheight-src-mq3-client-ui-atoms-ml-875370498"></a>
### UI_Init

```ml
function UI_Init(state, vidWidth, vidHeight)
```

UI_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.vidWidth`, `state.vidHeight`, `state.scale`, `state.bias` and additional values. |
| `vidWidth` | `dynamic` | — | Value assigned to `state.vidWidth`. |
| `vidHeight` | `dynamic` | — | Value assigned to `state.vidHeight`, `state.scale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L333)

<a id="constant-constant-mq3-client-ui-atoms-ui-inverse-const-ui-inverse-8192-src-mq3-client-ui-atoms-ml-1125611817"></a>
### UI_INVERSE

```ml
const UI_INVERSE = 8192
```

UI text-style flag selecting the subdued inverse text style.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L31)

<a id="function-function-mq3-client-ui-atoms-ui-isfullscreen-function-ui-isfullscreen-state-src-mq3-client-ui-atoms-ml-348151965"></a>
### UI_IsFullscreen

```ml
function UI_IsFullscreen(state)
```

UI_IsFullscreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.activeMenu`, `state.keyCatcher`, `state.activeMenu.fullscreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L286)

<a id="function-function-mq3-client-ui-atoms-ui-keyevent-function-ui-keyevent-state-key-down-src-mq3-client-ui-atoms-ml-1796184016"></a>
### UI_KeyEvent

```ml
function UI_KeyEvent(state, key, down)
```

UI_KeyEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.activeMenu`, `state.cursorx`, `state.cursory`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI atoms entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L303)

<a id="constant-constant-mq3-client-ui-atoms-ui-left-const-ui-left-0-src-mq3-client-ui-atoms-ml-393947105"></a>
### UI_LEFT

```ml
const UI_LEFT = 0
```

UI text-style flag selecting left-aligned text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L13)

<a id="function-function-mq3-client-ui-atoms-ui-lerpcolor-function-ui-lerpcolor-a-b-t-src-mq3-client-ui-atoms-ml-254430557"></a>
### UI_LerpColor

```ml
function UI_LerpColor(a, b, t)
```

UI_LerpColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[i]`. |
| `b` | `dynamic` | — | Sequence read at `b[i]`. |
| `t` | `dynamic` | — | Value used by `for i=0 to 3 result=result+[clamp(a[i]+t*(b[i]-a[i]),0.0,1.0)] end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L199)

<a id="function-function-mq3-client-ui-atoms-ui-mouseevent-function-ui-mouseevent-state-dx-dy-src-mq3-client-ui-atoms-ml-1454961070"></a>
### UI_MouseEvent

```ml
function UI_MouseEvent(state, dx, dy)
```

UI_MouseEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.cursorx`, `state.cursory`. |
| `dx` | `dynamic` | — | Value used by `state.cursorx=clamp(state.cursorx+dx,0,640)`. |
| `dy` | `dynamic` | — | Value used by `state.cursory=clamp(state.cursory+dy,0,480)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L308)

<a id="function-function-mq3-client-ui-atoms-ui-popmenu-function-ui-popmenu-state-src-mq3-client-ui-atoms-ml-722237769"></a>
### UI_PopMenu

```ml
function UI_PopMenu(state)
```

UI_PopMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.stack`, `state.activeMenu`, `state.firstdraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L191)

<a id="function-function-mq3-client-ui-atoms-ui-proportionalsizescale-function-ui-proportionalsizescale-style-src-mq3-client-ui-atoms-ml-146720137"></a>
### UI_ProportionalSizeScale

```ml
function UI_ProportionalSizeScale(style)
```

UI_ProportionalSizeScale

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if (style&UI_SMALLFONT)!=0 then return PROP_SMALL_SIZE_SCALE end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L232)

<a id="function-function-mq3-client-ui-atoms-ui-proportionalstringwidth-function-ui-proportionalstringwidth-text-src-mq3-client-ui-atoms-ml-1629688359"></a>
### UI_ProportionalStringWidth

```ml
function UI_ProportionalStringWidth(text)
```

UI_ProportionalStringWidth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ProportionalStringWidth` in the UI atoms path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L220)

<a id="constant-constant-mq3-client-ui-atoms-ui-pulse-const-ui-pulse-16384-src-mq3-client-ui-atoms-ml-1863553911"></a>
### UI_PULSE

```ml
const UI_PULSE = 16384
```

UI text-style flag selecting a pulsing text color or brightness.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L33)

<a id="function-function-mq3-client-ui-atoms-ui-pushmenu-function-ui-pushmenu-state-menu-src-mq3-client-ui-atoms-ml-161450282"></a>
### UI_PushMenu

```ml
function UI_PushMenu(state, menu)
```

UI_PushMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.stack`, `state.activeMenu`, `state.enterSound`, `state.keyCatcher` and additional values. |
| `menu` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `menu.cursor`, `menu.cursor_prev`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L185)

<a id="function-function-mq3-client-ui-atoms-ui-refresh-function-ui-refresh-state-realtime-src-mq3-client-ui-atoms-ml-990984336"></a>
### UI_Refresh

```ml
function UI_Refresh(state, realtime)
```

UI_Refresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.frametime`, `state.realtime`, `state.firstdraw`, `state.enterSound`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L383)

<a id="constant-constant-mq3-client-ui-atoms-ui-right-const-ui-right-2-src-mq3-client-ui-atoms-ml-1812488251"></a>
### UI_RIGHT

```ml
const UI_RIGHT = 2
```

UI text-style flag selecting right-aligned text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L17)

<a id="function-function-mq3-client-ui-atoms-ui-setactivemenu-function-ui-setactivemenu-state-menu-src-mq3-client-ui-atoms-ml-1305406654"></a>
### UI_SetActiveMenu

```ml
function UI_SetActiveMenu(state, menu)
```

UI_SetActiveMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms record/storage; this routine assigns `state.cvars`. |
| `menu` | `dynamic` | — | Value used by `if menu==UIMENU_NONE then UI_ForceMenuOff(state) else if menu==UIMENU_MAIN then emit(state,"ui","open-menu","main","",[],void) else if menu==U...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L298)

<a id="function-function-mq3-client-ui-atoms-ui-setcolor-function-ui-setcolor-state-rgba-src-mq3-client-ui-atoms-ml-802330119"></a>
### UI_SetColor

```ml
function UI_SetColor(state, rgba)
```

UI_SetColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.emit`. |
| `rgba` | `dynamic` | — | Argument 7 of `mq3.client.ui_atoms.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L376)

<a id="function-function-mq3-client-ui-atoms-ui-shutdown-function-ui-shutdown-state-src-mq3-client-ui-atoms-ml-1824747099"></a>
### UI_Shutdown

```ml
function UI_Shutdown(state)
```

UI_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms state passed to the helper calls in `UI_Shutdown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L328)

<a id="constant-constant-mq3-client-ui-atoms-ui-smallfont-const-ui-smallfont-16-src-mq3-client-ui-atoms-ml-1509797396"></a>
### UI_SMALLFONT

```ml
const UI_SMALLFONT = 16
```

UI text-style flag selecting the small fixed-width font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L21)

<a id="function-function-mq3-client-ui-atoms-ui-startdemoloop-function-ui-startdemoloop-state-src-mq3-client-ui-atoms-ml-1840024801"></a>
### UI_StartDemoLoop

```ml
function UI_StartDemoLoop(state)
```

UI_StartDemoLoop

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L180)

<a id="function-function-mq3-client-ui-atoms-ui-updatescreen-function-ui-updatescreen-state-src-mq3-client-ui-atoms-ml-398362701"></a>
### UI_UpdateScreen

```ml
function UI_UpdateScreen(state)
```

UI_UpdateScreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L379)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-bad-cd-key-const-uimenu-bad-cd-key-4-src-mq3-client-ui-atoms-ml-502097833"></a>
### UIMENU_BAD_CD_KEY

```ml
const UIMENU_BAD_CD_KEY = 4
```

Engine-to-UI menu selector for the bad cd key screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L51)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-ingame-const-uimenu-ingame-2-src-mq3-client-ui-atoms-ml-1852226763"></a>
### UIMENU_INGAME

```ml
const UIMENU_INGAME = 2
```

Engine-to-UI menu selector for the ingame screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L47)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-main-const-uimenu-main-1-src-mq3-client-ui-atoms-ml-258358604"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```

Engine-to-UI menu selector for the main screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L45)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-need-cd-const-uimenu-need-cd-3-src-mq3-client-ui-atoms-ml-1827786236"></a>
### UIMENU_NEED_CD

```ml
const UIMENU_NEED_CD = 3
```

Engine-to-UI menu selector for the need cd screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L49)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-none-const-uimenu-none-0-src-mq3-client-ui-atoms-ml-376880393"></a>
### UIMENU_NONE

```ml
const UIMENU_NONE = 0
```

Engine-to-UI menu selector for the none screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L43)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-postgame-const-uimenu-postgame-6-src-mq3-client-ui-atoms-ml-74526163"></a>
### UIMENU_POSTGAME

```ml
const UIMENU_POSTGAME = 6
```

Engine-to-UI menu selector for the postgame screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L55)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-team-const-uimenu-team-5-src-mq3-client-ui-atoms-ml-1201885740"></a>
### UIMENU_TEAM

```ml
const UIMENU_TEAM = 5
```

Engine-to-UI menu selector for the team screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L53)
