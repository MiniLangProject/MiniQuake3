# `src/mq3/client/ui_atoms.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_atoms`](Package-mq3-client-ui-atoms-236523522.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_main.ml` as `uiMain` → [src/mq3/client/ui_main.ml](File-src-mq3-client-ui-main-ml-1850214811.md)
- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_atoms.Action](Type-mq3-client-ui-atoms-action-623527910.md) — struct
<a id="function-function-mq3-client-ui-atoms-bannerwidths-function-bannerwidths-src-mq3-client-ui-atoms-ml-712224844"></a>
### bannerWidths

```ml
function bannerWidths()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L42)

<a id="function-function-mq3-client-ui-atoms-clamp-function-clamp-value-low-high-src-mq3-client-ui-atoms-ml-521186499"></a>
### clamp

```ml
function clamp(value, low, high)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L40)

<a id="function-function-mq3-client-ui-atoms-com-error-function-com-error-state-level-message-src-mq3-client-ui-atoms-ml-1720550140"></a>
### Com_Error

```ml
function Com_Error(state, level, message)
```

Com_Error

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L46)

<a id="function-function-mq3-client-ui-atoms-com-printf-function-com-printf-state-message-src-mq3-client-ui-atoms-ml-360954316"></a>
### Com_Printf

```ml
function Com_Printf(state, message)
```

Com_Printf

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L48)

<a id="function-function-mq3-client-ui-atoms-create-function-create-retailactive-src-mq3-client-ui-atoms-ml-2003498409"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L38)

<a id="function-function-mq3-client-ui-atoms-emit-function-emit-state-boundary-kind-name-text-values-color-src-mq3-client-ui-atoms-ml-558443410"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, values, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L39)

<a id="constant-constant-mq3-client-ui-atoms-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-atoms-ml-1368562291"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L34)

<a id="function-function-mq3-client-ui-atoms-needcdaction-function-needcdaction-state-result-src-mq3-client-ui-atoms-ml-170155824"></a>
### NeedCDAction

```ml
function NeedCDAction(state, result)
```

NeedCDAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L99)

<a id="function-function-mq3-client-ui-atoms-needcdkeyaction-function-needcdkeyaction-state-result-src-mq3-client-ui-atoms-ml-561116748"></a>
### NeedCDKeyAction

```ml
function NeedCDKeyAction(state, result)
```

NeedCDKeyAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L101)

<a id="constant-constant-mq3-client-ui-atoms-prop-gap-width-const-prop-gap-width-3-src-mq3-client-ui-atoms-ml-614271526"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L23)

<a id="constant-constant-mq3-client-ui-atoms-prop-height-const-prop-height-27-src-mq3-client-ui-atoms-ml-468723724"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L25)

<a id="constant-constant-mq3-client-ui-atoms-prop-small-size-scale-const-prop-small-size-scale-0-75-src-mq3-client-ui-atoms-ml-687434763"></a>
### PROP_SMALL_SIZE_SCALE

```ml
const PROP_SMALL_SIZE_SCALE = 0.75
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L26)

<a id="constant-constant-mq3-client-ui-atoms-prop-space-width-const-prop-space-width-8-src-mq3-client-ui-atoms-ml-520829701"></a>
### PROP_SPACE_WIDTH

```ml
const PROP_SPACE_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L24)

<a id="function-function-mq3-client-ui-atoms-propwidths-function-propwidths-src-mq3-client-ui-atoms-ml-1111132992"></a>
### propWidths

```ml
function propWidths()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L41)

<a id="function-function-mq3-client-ui-atoms-quakecolor-function-quakecolor-code-src-mq3-client-ui-atoms-ml-1827287541"></a>
### quakeColor

```ml
function quakeColor(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L43)

- [mq3.client.ui_atoms.State](Type-mq3-client-ui-atoms-state-866290361.md) — struct
<a id="function-function-mq3-client-ui-atoms-ui-adjustfrom640-function-ui-adjustfrom640-state-x-y-w-h-src-mq3-client-ui-atoms-ml-1438436393"></a>
### UI_AdjustFrom640

```ml
function UI_AdjustFrom640(state, x, y, w, h)
```

UI_AdjustFrom640

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L123)

<a id="function-function-mq3-client-ui-atoms-ui-argv-function-ui-argv-state-index-src-mq3-client-ui-atoms-ml-1750915801"></a>
### UI_Argv

```ml
function UI_Argv(state, index)
```

UI_Argv

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L111)

<a id="constant-constant-mq3-client-ui-atoms-ui-bigfont-const-ui-bigfont-32-src-mq3-client-ui-atoms-ml-698854128"></a>
### UI_BIGFONT

```ml
const UI_BIGFONT = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L17)

<a id="constant-constant-mq3-client-ui-atoms-ui-blink-const-ui-blink-4096-src-mq3-client-ui-atoms-ml-800344020"></a>
### UI_BLINK

```ml
const UI_BLINK = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L20)

<a id="function-function-mq3-client-ui-atoms-ui-cache-f-function-ui-cache-f-state-src-mq3-client-ui-atoms-ml-2000558861"></a>
### UI_Cache_f

```ml
function UI_Cache_f(state)
```

UI_Cache_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L115)

<a id="constant-constant-mq3-client-ui-atoms-ui-center-const-ui-center-1-src-mq3-client-ui-atoms-ml-583264200"></a>
### UI_CENTER

```ml
const UI_CENTER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L13)

<a id="function-function-mq3-client-ui-atoms-ui-clampcvar-function-ui-clampcvar-minimum-maximum-value-src-mq3-client-ui-atoms-ml-1080003423"></a>
### UI_ClampCvar

```ml
function UI_ClampCvar(minimum, maximum, value)
```

UI_ClampCvar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L50)

<a id="function-function-mq3-client-ui-atoms-ui-consolecommand-function-ui-consolecommand-state-realtime-src-mq3-client-ui-atoms-ml-578101134"></a>
### UI_ConsoleCommand

```ml
function UI_ConsoleCommand(state, realTime)
```

UI_ConsoleCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L117)

<a id="function-function-mq3-client-ui-atoms-ui-cursorinrect-function-ui-cursorinrect-state-x-y-width-height-src-mq3-client-ui-atoms-ml-459821125"></a>
### UI_CursorInRect

```ml
function UI_CursorInRect(state, x, y, width, height)
```

UI_CursorInRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L143)

<a id="function-function-mq3-client-ui-atoms-ui-cvar-variablestring-function-ui-cvar-variablestring-state-name-src-mq3-client-ui-atoms-ml-150988614"></a>
### UI_Cvar_VariableString

```ml
function UI_Cvar_VariableString(state, name)
```

UI_Cvar_VariableString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L113)

<a id="function-function-mq3-client-ui-atoms-ui-drawbannerstring-function-ui-drawbannerstring-state-x-y-text-style-color-src-mq3-client-ui-atoms-ml-58202461"></a>
### UI_DrawBannerString

```ml
function UI_DrawBannerString(state, x, y, text, style, color)
```

UI_DrawBannerString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L71)

<a id="function-function-mq3-client-ui-atoms-ui-drawbannerstring2-function-ui-drawbannerstring2-state-x-y-text-color-src-mq3-client-ui-atoms-ml-1331317760"></a>
### UI_DrawBannerString2

```ml
function UI_DrawBannerString2(state, x, y, text, color)
```

UI_DrawBannerString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L67)

<a id="function-function-mq3-client-ui-atoms-ui-drawchar-function-ui-drawchar-state-x-y-ch-style-color-src-mq3-client-ui-atoms-ml-37771147"></a>
### UI_DrawChar

```ml
function UI_DrawChar(state, x, y, ch, style, color)
```

UI_DrawChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L95)

<a id="function-function-mq3-client-ui-atoms-ui-drawhandlepic-function-ui-drawhandlepic-state-x-y-w-h-shader-src-mq3-client-ui-atoms-ml-858927456"></a>
### UI_DrawHandlePic

```ml
function UI_DrawHandlePic(state, x, y, w, h, shader)
```

UI_DrawHandlePic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L127)

<a id="function-function-mq3-client-ui-atoms-ui-drawnamedpic-function-ui-drawnamedpic-state-x-y-width-height-picname-src-mq3-client-ui-atoms-ml-1358563512"></a>
### UI_DrawNamedPic

```ml
function UI_DrawNamedPic(state, x, y, width, height, picname)
```

UI_DrawNamedPic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `picname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L125)

<a id="function-function-mq3-client-ui-atoms-ui-drawproportionalstring-function-ui-drawproportionalstring-state-x-y-text-style-color-src-mq3-client-ui-atoms-ml-1123257439"></a>
### UI_DrawProportionalString

```ml
function UI_DrawProportionalString(state, x, y, text, style, color)
```

UI_DrawProportionalString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L79)

<a id="function-function-mq3-client-ui-atoms-ui-drawproportionalstring2-function-ui-drawproportionalstring2-state-x-y-text-color-sizescale-charset-src-mq3-client-ui-atoms-ml-764544791"></a>
### UI_DrawProportionalString2

```ml
function UI_DrawProportionalString2(state, x, y, text, color, sizeScale, charset)
```

UI_DrawProportionalString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `sizeScale` | `dynamic` | — |  |
| `charset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L75)

<a id="function-function-mq3-client-ui-atoms-ui-drawproportionalstring-autowrapped-function-ui-drawproportionalstring-autowrapped-state-x-y-xmax-ystep-text-style-color-src-mq3-client-ui-atoms-ml-2127254846"></a>
### UI_DrawProportionalString_AutoWrapped

```ml
function UI_DrawProportionalString_AutoWrapped(state, x, y, xmax, ystep, text, style, color)
```

UI_DrawProportionalString_AutoWrapped

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `xmax` | `dynamic` | — |  |
| `ystep` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L83)

<a id="function-function-mq3-client-ui-atoms-ui-drawrect-function-ui-drawrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-ml-535715214"></a>
### UI_DrawRect

```ml
function UI_DrawRect(state, x, y, width, height, color)
```

UI_DrawRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L131)

<a id="function-function-mq3-client-ui-atoms-ui-drawstring-function-ui-drawstring-state-x-y-text-style-color-src-mq3-client-ui-atoms-ml-720772457"></a>
### UI_DrawString

```ml
function UI_DrawString(state, x, y, text, style, color)
```

UI_DrawString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L91)

<a id="function-function-mq3-client-ui-atoms-ui-drawstring2-function-ui-drawstring2-state-x-y-text-color-charw-charh-src-mq3-client-ui-atoms-ml-251800423"></a>
### UI_DrawString2

```ml
function UI_DrawString2(state, x, y, text, color, charw, charh)
```

UI_DrawString2

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `charw` | `dynamic` | — |  |
| `charh` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L87)

<a id="function-function-mq3-client-ui-atoms-ui-drawtextbox-function-ui-drawtextbox-state-x-y-width-lines-src-mq3-client-ui-atoms-ml-1081081453"></a>
### UI_DrawTextBox

```ml
function UI_DrawTextBox(state, x, y, width, lines)
```

UI_DrawTextBox

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `lines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L141)

<a id="constant-constant-mq3-client-ui-atoms-ui-dropshadow-const-ui-dropshadow-2048-src-mq3-client-ui-atoms-ml-410417067"></a>
### UI_DROPSHADOW

```ml
const UI_DROPSHADOW = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L19)

<a id="function-function-mq3-client-ui-atoms-ui-fillrect-function-ui-fillrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-ml-1146089792"></a>
### UI_FillRect

```ml
function UI_FillRect(state, x, y, width, height, color)
```

UI_FillRect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L129)

<a id="function-function-mq3-client-ui-atoms-ui-forcemenuoff-function-ui-forcemenuoff-state-src-mq3-client-ui-atoms-ml-1952114909"></a>
### UI_ForceMenuOff

```ml
function UI_ForceMenuOff(state)
```

UI_ForceMenuOff

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L62)

<a id="constant-constant-mq3-client-ui-atoms-ui-formatmask-const-ui-formatmask-7-src-mq3-client-ui-atoms-ml-478207042"></a>
### UI_FORMATMASK

```ml
const UI_FORMATMASK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L15)

<a id="constant-constant-mq3-client-ui-atoms-ui-giantfont-const-ui-giantfont-64-src-mq3-client-ui-atoms-ml-1486161579"></a>
### UI_GIANTFONT

```ml
const UI_GIANTFONT = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L18)

<a id="function-function-mq3-client-ui-atoms-ui-init-function-ui-init-state-vidwidth-vidheight-src-mq3-client-ui-atoms-ml-875370498"></a>
### UI_Init

```ml
function UI_Init(state, vidWidth, vidHeight)
```

UI_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vidWidth` | `dynamic` | — |  |
| `vidHeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L121)

<a id="constant-constant-mq3-client-ui-atoms-ui-inverse-const-ui-inverse-8192-src-mq3-client-ui-atoms-ml-1125611817"></a>
### UI_INVERSE

```ml
const UI_INVERSE = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L21)

<a id="function-function-mq3-client-ui-atoms-ui-isfullscreen-function-ui-isfullscreen-state-src-mq3-client-ui-atoms-ml-348151965"></a>
### UI_IsFullscreen

```ml
function UI_IsFullscreen(state)
```

UI_IsFullscreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L97)

<a id="function-function-mq3-client-ui-atoms-ui-keyevent-function-ui-keyevent-state-key-down-src-mq3-client-ui-atoms-ml-1796184016"></a>
### UI_KeyEvent

```ml
function UI_KeyEvent(state, key, down)
```

UI_KeyEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L105)

<a id="constant-constant-mq3-client-ui-atoms-ui-left-const-ui-left-0-src-mq3-client-ui-atoms-ml-393947105"></a>
### UI_LEFT

```ml
const UI_LEFT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L12)

<a id="function-function-mq3-client-ui-atoms-ui-lerpcolor-function-ui-lerpcolor-a-b-t-src-mq3-client-ui-atoms-ml-254430557"></a>
### UI_LerpColor

```ml
function UI_LerpColor(a, b, t)
```

UI_LerpColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L64)

<a id="function-function-mq3-client-ui-atoms-ui-mouseevent-function-ui-mouseevent-state-dx-dy-src-mq3-client-ui-atoms-ml-1454961070"></a>
### UI_MouseEvent

```ml
function UI_MouseEvent(state, dx, dy)
```

UI_MouseEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L107)

<a id="function-function-mq3-client-ui-atoms-ui-popmenu-function-ui-popmenu-state-src-mq3-client-ui-atoms-ml-722237769"></a>
### UI_PopMenu

```ml
function UI_PopMenu(state)
```

UI_PopMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L60)

<a id="function-function-mq3-client-ui-atoms-ui-proportionalsizescale-function-ui-proportionalsizescale-style-src-mq3-client-ui-atoms-ml-146720137"></a>
### UI_ProportionalSizeScale

```ml
function UI_ProportionalSizeScale(style)
```

UI_ProportionalSizeScale

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L77)

<a id="function-function-mq3-client-ui-atoms-ui-proportionalstringwidth-function-ui-proportionalstringwidth-text-src-mq3-client-ui-atoms-ml-1629688359"></a>
### UI_ProportionalStringWidth

```ml
function UI_ProportionalStringWidth(text)
```

UI_ProportionalStringWidth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L73)

<a id="constant-constant-mq3-client-ui-atoms-ui-pulse-const-ui-pulse-16384-src-mq3-client-ui-atoms-ml-1863553911"></a>
### UI_PULSE

```ml
const UI_PULSE = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L22)

<a id="function-function-mq3-client-ui-atoms-ui-pushmenu-function-ui-pushmenu-state-menu-src-mq3-client-ui-atoms-ml-161450282"></a>
### UI_PushMenu

```ml
function UI_PushMenu(state, menu)
```

UI_PushMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L55)

<a id="function-function-mq3-client-ui-atoms-ui-refresh-function-ui-refresh-state-realtime-src-mq3-client-ui-atoms-ml-990984336"></a>
### UI_Refresh

```ml
function UI_Refresh(state, realtime)
```

UI_Refresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L137)

<a id="constant-constant-mq3-client-ui-atoms-ui-right-const-ui-right-2-src-mq3-client-ui-atoms-ml-1812488251"></a>
### UI_RIGHT

```ml
const UI_RIGHT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L14)

<a id="function-function-mq3-client-ui-atoms-ui-setactivemenu-function-ui-setactivemenu-state-menu-src-mq3-client-ui-atoms-ml-1305406654"></a>
### UI_SetActiveMenu

```ml
function UI_SetActiveMenu(state, menu)
```

UI_SetActiveMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L103)

<a id="function-function-mq3-client-ui-atoms-ui-setcolor-function-ui-setcolor-state-rgba-src-mq3-client-ui-atoms-ml-802330119"></a>
### UI_SetColor

```ml
function UI_SetColor(state, rgba)
```

UI_SetColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L133)

<a id="function-function-mq3-client-ui-atoms-ui-shutdown-function-ui-shutdown-state-src-mq3-client-ui-atoms-ml-1824747099"></a>
### UI_Shutdown

```ml
function UI_Shutdown(state)
```

UI_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L119)

<a id="constant-constant-mq3-client-ui-atoms-ui-smallfont-const-ui-smallfont-16-src-mq3-client-ui-atoms-ml-1509797396"></a>
### UI_SMALLFONT

```ml
const UI_SMALLFONT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L16)

<a id="function-function-mq3-client-ui-atoms-ui-startdemoloop-function-ui-startdemoloop-state-src-mq3-client-ui-atoms-ml-1840024801"></a>
### UI_StartDemoLoop

```ml
function UI_StartDemoLoop(state)
```

UI_StartDemoLoop

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L52)

<a id="function-function-mq3-client-ui-atoms-ui-updatescreen-function-ui-updatescreen-state-src-mq3-client-ui-atoms-ml-398362701"></a>
### UI_UpdateScreen

```ml
function UI_UpdateScreen(state)
```

UI_UpdateScreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L135)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-bad-cd-key-const-uimenu-bad-cd-key-4-src-mq3-client-ui-atoms-ml-502097833"></a>
### UIMENU_BAD_CD_KEY

```ml
const UIMENU_BAD_CD_KEY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L31)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-ingame-const-uimenu-ingame-2-src-mq3-client-ui-atoms-ml-1852226763"></a>
### UIMENU_INGAME

```ml
const UIMENU_INGAME = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L29)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-main-const-uimenu-main-1-src-mq3-client-ui-atoms-ml-258358604"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L28)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-need-cd-const-uimenu-need-cd-3-src-mq3-client-ui-atoms-ml-1827786236"></a>
### UIMENU_NEED_CD

```ml
const UIMENU_NEED_CD = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L30)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-none-const-uimenu-none-0-src-mq3-client-ui-atoms-ml-376880393"></a>
### UIMENU_NONE

```ml
const UIMENU_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L27)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-postgame-const-uimenu-postgame-6-src-mq3-client-ui-atoms-ml-74526163"></a>
### UIMENU_POSTGAME

```ml
const UIMENU_POSTGAME = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L33)

<a id="constant-constant-mq3-client-ui-atoms-uimenu-team-const-uimenu-team-5-src-mq3-client-ui-atoms-ml-1201885740"></a>
### UIMENU_TEAM

```ml
const UIMENU_TEAM = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms.ml#L32)
