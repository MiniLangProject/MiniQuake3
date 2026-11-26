# `src/mq3/client/ui_qmenu.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_qmenu`](Package-mq3-client-ui-qmenu-1470639856.md)

Reachable from entry: **no**

## Imports

- `mq3/client/cgame_drawtools.ml` as `drawtools` → [src/mq3/client/cgame_drawtools.ml](File-src-mq3-client-cgame-drawtools-ml-249217190.md)
- `mq3/client/keycodes.ml` as `q3keys` → [src/mq3/client/keycodes.ml](File-src-mq3-client-keycodes-ml-1532276368.md)
- `mq3/client/ui_local.ml` as `q3local` → [src/mq3/client/ui_local.ml](File-src-mq3-client-ui-local-ml-681073931.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `transcendental` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-qmenu-action-draw-function-action-draw-m-value-src-mq3-client-ui-qmenu-ml-619762250"></a>
### Action_Draw

```ml
function Action_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.colorText`, `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.focused` and additional helpers from UI qmenu `Action_Draw`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value tested by `(value.flags&QMF_PULSEIFFOCUS)!=0 and focused(m,value)`, `(value.flags&QMF_HIGHLIGHT_IF_FOCUS)!=0 and focused(m,value)` and additional values before the calculation continues. |
| `value` | `dynamic` | — | Record read through `value.flags`, `value.x`, `value.y`, `value.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L246)

<a id="function-function-mq3-client-ui-qmenu-action-init-function-action-init-value-src-mq3-client-ui-qmenu-ml-1564640911"></a>
### Action_Init

```ml
function Action_Init(value)
```

Action_Init / Action_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L242)

<a id="constant-constant-mq3-client-ui-qmenu-bigchar-height-const-bigchar-height-16-src-mq3-client-ui-qmenu-ml-1834201566"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L96)

<a id="constant-constant-mq3-client-ui-qmenu-bigchar-width-const-bigchar-width-16-src-mq3-client-ui-qmenu-ml-652884964"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L95)

<a id="function-function-mq3-client-ui-qmenu-bitmap-draw-function-bitmap-draw-m-value-realtime-src-mq3-client-ui-qmenu-ml-1385519661"></a>
### Bitmap_Draw

```ml
function Bitmap_Draw(m, value, realtime)
```

Calls `mq3.client.ui_qmenu.emit`, `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.focused` and additional helpers from UI qmenu `Bitmap_Draw`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value used by `focus=focused(m,value)`. |
| `value` | `dynamic` | — | Record read through `value.x`, `value.flags`, `value.width`, `value.name` and additional values. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L230)

<a id="function-function-mq3-client-ui-qmenu-bitmap-init-function-bitmap-init-value-src-mq3-client-ui-qmenu-ml-1704357557"></a>
### Bitmap_Init

```ml
function Bitmap_Init(value)
```

Bitmap_Init / Bitmap_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L221)

<a id="function-function-mq3-client-ui-qmenu-btext-draw-function-btext-draw-m-value-src-mq3-client-ui-qmenu-ml-1185127600"></a>
### BText_Draw

```ml
function BText_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.emit` from UI qmenu `BText_Draw`. The final path returns `[emit("banner",value.x,value.y,0,0,value.string,value.style,color,"")]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Accepted for compatibility with `BText_Draw`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.color`, `value.flags`, `value.x`, `value.y` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L191)

<a id="function-function-mq3-client-ui-qmenu-btext-init-function-btext-init-value-src-mq3-client-ui-qmenu-ml-1444228365"></a>
### BText_Init

```ml
function BText_Init(value)
```

BText_Init / BText_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L187)

<a id="function-function-mq3-client-ui-qmenu-colordisabled-function-colordisabled-src-mq3-client-ui-qmenu-ml-1500205882"></a>
### colorDisabled

```ml
function colorDisabled()
```

Builds the UI qmenu `colorDisabled` sequence from `[0.5,0.5,0.5,1.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L114)

<a id="function-function-mq3-client-ui-qmenu-colorhighlight-function-colorhighlight-src-mq3-client-ui-qmenu-ml-278496856"></a>
### colorHighlight

```ml
function colorHighlight()
```

Builds the UI qmenu `colorHighlight` sequence from `[1.0,1.0,0.0,1.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L118)

<a id="function-function-mq3-client-ui-qmenu-colorlistbar-function-colorlistbar-src-mq3-client-ui-qmenu-ml-1925514052"></a>
### colorListbar

```ml
function colorListbar()
```

Builds the UI qmenu `colorListbar` sequence from `[1.0,0.43,0.0,0.30]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L120)

<a id="function-function-mq3-client-ui-qmenu-colornormal-function-colornormal-src-mq3-client-ui-qmenu-ml-1418832560"></a>
### colorNormal

```ml
function colorNormal()
```

Builds the UI qmenu `colorNormal` sequence from `[1.0,0.43,0.0,1.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L116)

<a id="function-function-mq3-client-ui-qmenu-colortext-function-colortext-src-mq3-client-ui-qmenu-ml-511300084"></a>
### colorText

```ml
function colorText()
```

Builds the UI qmenu `colorText` sequence from `[1.0,1.0,1.0,1.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L112)

<a id="function-function-mq3-client-ui-qmenu-drawitem-function-drawitem-m-value-realtime-src-mq3-client-ui-qmenu-ml-356814073"></a>
### drawItem

```ml
function drawItem(m, value, realtime)
```

Calls `value.ownerdraw`, `mq3.client.ui_qmenu.RadioButton_Draw`, `mq3.client.ui_qmenu.MenuField_Draw` and additional helpers from UI qmenu `drawItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value used by `if value.type==MTYPE_RADIOBUTTON then return RadioButton_Draw(m,value) end if`. |
| `value` | `dynamic` | — | Record read through `value.ownerdraw`, `value.type`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L419)

<a id="function-function-mq3-client-ui-qmenu-emit-function-emit-kind-x-y-w-h-text-style-color-asset-src-mq3-client-ui-qmenu-ml-299234087"></a>
### emit

```ml
function emit(kind, x, y, w, h, text, style, color, asset)
```

Builds the UI qmenu `emit` sequence from `[kind,x,y,w,h,text,style,color,asset]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `emit`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `emit`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI qmenu path. |
| `style` | `dynamic` | — | Value used by `return [kind,x,y,w,h,text,style,color,asset]`. |
| `color` | `dynamic` | — | Color value used by the UI qmenu drawing or interpolation operation. |
| `asset` | `dynamic` | — | Value used by `return [kind,x,y,w,h,text,style,color,asset]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L157)

<a id="function-function-mq3-client-ui-qmenu-focused-function-focused-m-value-src-mq3-client-ui-qmenu-ml-2080173726"></a>
### focused

```ml
function focused(m, value)
```

Computes `value.menuPosition==m.cursor` for UI qmenu `focused`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Record read through `m.cursor`. |
| `value` | `dynamic` | — | Record read through `value.menuPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L164)

<a id="function-function-mq3-client-ui-qmenu-idiv-function-idiv-a-b-src-mq3-client-ui-qmenu-ml-2057489895"></a>
### idiv

```ml
function idiv(a, b)
```

Adapts `mq3.compat.numeric.trunc32` to UI qmenu `idiv`, returning its result for `a/b`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.trunc32`; passed as `a/b`. |
| `b` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.trunc32`; passed as `a/b`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L168)

<a id="function-function-mq3-client-ui-qmenu-item-function-item-type-name-id-x-y-flags-src-mq3-client-ui-qmenu-ml-304153332"></a>
### item

```ml
function item(type, name, id, x, y, flags)
```

Creates a `mq3.client.ui_qmenu.Item` record. Assigns `type` from `type`, `name` from `name`, `id` from `id`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — | Value used to initialize `Item.type`. |
| `name` | `dynamic` | — | Value used to initialize `Item.name`. |
| `id` | `dynamic` | — | Value used to initialize `Item.id`. |
| `x` | `dynamic` | — | Value used to initialize `Item.x`. |
| `y` | `dynamic` | — | Value used to initialize `Item.y`. |
| `flags` | `dynamic` | — | Value used to initialize `Item.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L143)

- [mq3.client.ui_qmenu.Item](Type-mq3-client-ui-qmenu-item-1773713585.md) — struct
<a id="function-function-mq3-client-ui-qmenu-joystickactivate-function-joystickactivate-key-src-mq3-client-ui-qmenu-ml-680353551"></a>
### joystickActivate

```ml
function joystickActivate(key)
```

Computes `(key>=K_JOY1 and key<=K_JOY4) or (key>=K_AUX1 and key<=K_AUX16)` for UI qmenu `joystickActivate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L431)

<a id="constant-constant-mq3-client-ui-qmenu-k-aux1-const-k-aux1-q3keys-k-aux1-src-mq3-client-ui-qmenu-ml-593756726"></a>
### K_AUX1

```ml
const K_AUX1 = q3keys.K_AUX1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L85)

<a id="constant-constant-mq3-client-ui-qmenu-k-aux16-const-k-aux16-q3keys-k-aux16-src-mq3-client-ui-qmenu-ml-1358383514"></a>
### K_AUX16

```ml
const K_AUX16 = q3keys.K_AUX16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L86)

<a id="constant-constant-mq3-client-ui-qmenu-k-backspace-const-k-backspace-q3keys-k-backspace-src-mq3-client-ui-qmenu-ml-484750492"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = q3keys.K_BACKSPACE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L54)

<a id="constant-constant-mq3-client-ui-qmenu-k-char-flag-const-k-char-flag-q3keys-k-char-flag-src-mq3-client-ui-qmenu-ml-424609720"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = q3keys.K_CHAR_FLAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L87)

<a id="constant-constant-mq3-client-ui-qmenu-k-del-const-k-del-q3keys-k-del-src-mq3-client-ui-qmenu-ml-1915962394"></a>
### K_DEL

```ml
const K_DEL = q3keys.K_DEL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L60)

<a id="constant-constant-mq3-client-ui-qmenu-k-downarrow-const-k-downarrow-q3keys-k-downarrow-src-mq3-client-ui-qmenu-ml-195012110"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = q3keys.K_DOWNARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L56)

<a id="constant-constant-mq3-client-ui-qmenu-k-end-const-k-end-q3keys-k-end-src-mq3-client-ui-qmenu-ml-1170760798"></a>
### K_END

```ml
const K_END = q3keys.K_END
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L64)

<a id="constant-constant-mq3-client-ui-qmenu-k-enter-const-k-enter-q3keys-k-enter-src-mq3-client-ui-qmenu-ml-2106741579"></a>
### K_ENTER

```ml
const K_ENTER = q3keys.K_ENTER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L51)

<a id="constant-constant-mq3-client-ui-qmenu-k-escape-const-k-escape-q3keys-k-escape-src-mq3-client-ui-qmenu-ml-1754330120"></a>
### K_ESCAPE

```ml
const K_ESCAPE = q3keys.K_ESCAPE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L52)

<a id="constant-constant-mq3-client-ui-qmenu-k-f11-const-k-f11-q3keys-k-f11-src-mq3-client-ui-qmenu-ml-841553129"></a>
### K_F11

```ml
const K_F11 = q3keys.K_F11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L65)

<a id="constant-constant-mq3-client-ui-qmenu-k-f12-const-k-f12-q3keys-k-f12-src-mq3-client-ui-qmenu-ml-678758750"></a>
### K_F12

```ml
const K_F12 = q3keys.K_F12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L66)

<a id="constant-constant-mq3-client-ui-qmenu-k-home-const-k-home-q3keys-k-home-src-mq3-client-ui-qmenu-ml-695349636"></a>
### K_HOME

```ml
const K_HOME = q3keys.K_HOME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L63)

<a id="constant-constant-mq3-client-ui-qmenu-k-ins-const-k-ins-q3keys-k-ins-src-mq3-client-ui-qmenu-ml-713150949"></a>
### K_INS

```ml
const K_INS = q3keys.K_INS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L59)

<a id="constant-constant-mq3-client-ui-qmenu-k-joy1-const-k-joy1-q3keys-k-joy1-src-mq3-client-ui-qmenu-ml-96364470"></a>
### K_JOY1

```ml
const K_JOY1 = q3keys.K_JOY1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L81)

<a id="constant-constant-mq3-client-ui-qmenu-k-joy2-const-k-joy2-q3keys-k-joy2-src-mq3-client-ui-qmenu-ml-1583681239"></a>
### K_JOY2

```ml
const K_JOY2 = q3keys.K_JOY2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L82)

<a id="constant-constant-mq3-client-ui-qmenu-k-joy3-const-k-joy3-q3keys-k-joy3-src-mq3-client-ui-qmenu-ml-857933108"></a>
### K_JOY3

```ml
const K_JOY3 = q3keys.K_JOY3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L83)

<a id="constant-constant-mq3-client-ui-qmenu-k-joy4-const-k-joy4-q3keys-k-joy4-src-mq3-client-ui-qmenu-ml-455070381"></a>
### K_JOY4

```ml
const K_JOY4 = q3keys.K_JOY4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L84)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-del-const-k-kp-del-q3keys-k-kp-del-src-mq3-client-ui-qmenu-ml-734820866"></a>
### K_KP_DEL

```ml
const K_KP_DEL = q3keys.K_KP_DEL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L77)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-downarrow-const-k-kp-downarrow-q3keys-k-kp-downarrow-src-mq3-client-ui-qmenu-ml-121310982"></a>
### K_KP_DOWNARROW

```ml
const K_KP_DOWNARROW = q3keys.K_KP_DOWNARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L73)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-end-const-k-kp-end-q3keys-k-kp-end-src-mq3-client-ui-qmenu-ml-548089574"></a>
### K_KP_END

```ml
const K_KP_END = q3keys.K_KP_END
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L72)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-enter-const-k-kp-enter-q3keys-k-kp-enter-src-mq3-client-ui-qmenu-ml-943273921"></a>
### K_KP_ENTER

```ml
const K_KP_ENTER = q3keys.K_KP_ENTER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L75)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-home-const-k-kp-home-q3keys-k-kp-home-src-mq3-client-ui-qmenu-ml-375442936"></a>
### K_KP_HOME

```ml
const K_KP_HOME = q3keys.K_KP_HOME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L67)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-ins-const-k-kp-ins-q3keys-k-kp-ins-src-mq3-client-ui-qmenu-ml-1762117055"></a>
### K_KP_INS

```ml
const K_KP_INS = q3keys.K_KP_INS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L76)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-leftarrow-const-k-kp-leftarrow-q3keys-k-kp-leftarrow-src-mq3-client-ui-qmenu-ml-273829129"></a>
### K_KP_LEFTARROW

```ml
const K_KP_LEFTARROW = q3keys.K_KP_LEFTARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L70)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-pgdn-const-k-kp-pgdn-q3keys-k-kp-pgdn-src-mq3-client-ui-qmenu-ml-1827997144"></a>
### K_KP_PGDN

```ml
const K_KP_PGDN = q3keys.K_KP_PGDN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L74)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-pgup-const-k-kp-pgup-q3keys-k-kp-pgup-src-mq3-client-ui-qmenu-ml-1086988853"></a>
### K_KP_PGUP

```ml
const K_KP_PGUP = q3keys.K_KP_PGUP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L69)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-rightarrow-const-k-kp-rightarrow-q3keys-k-kp-rightarrow-src-mq3-client-ui-qmenu-ml-1109948744"></a>
### K_KP_RIGHTARROW

```ml
const K_KP_RIGHTARROW = q3keys.K_KP_RIGHTARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L71)

<a id="constant-constant-mq3-client-ui-qmenu-k-kp-uparrow-const-k-kp-uparrow-q3keys-k-kp-uparrow-src-mq3-client-ui-qmenu-ml-66901573"></a>
### K_KP_UPARROW

```ml
const K_KP_UPARROW = q3keys.K_KP_UPARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L68)

<a id="constant-constant-mq3-client-ui-qmenu-k-leftarrow-const-k-leftarrow-q3keys-k-leftarrow-src-mq3-client-ui-qmenu-ml-278736555"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = q3keys.K_LEFTARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L57)

<a id="constant-constant-mq3-client-ui-qmenu-k-mouse1-const-k-mouse1-q3keys-k-mouse1-src-mq3-client-ui-qmenu-ml-1479474001"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = q3keys.K_MOUSE1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L78)

<a id="constant-constant-mq3-client-ui-qmenu-k-mouse2-const-k-mouse2-q3keys-k-mouse2-src-mq3-client-ui-qmenu-ml-1199806528"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = q3keys.K_MOUSE2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L79)

<a id="constant-constant-mq3-client-ui-qmenu-k-mouse3-const-k-mouse3-q3keys-k-mouse3-src-mq3-client-ui-qmenu-ml-1650510111"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = q3keys.K_MOUSE3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L80)

<a id="constant-constant-mq3-client-ui-qmenu-k-pgdn-const-k-pgdn-q3keys-k-pgdn-src-mq3-client-ui-qmenu-ml-1648905028"></a>
### K_PGDN

```ml
const K_PGDN = q3keys.K_PGDN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L61)

<a id="constant-constant-mq3-client-ui-qmenu-k-pgup-const-k-pgup-q3keys-k-pgup-src-mq3-client-ui-qmenu-ml-259827767"></a>
### K_PGUP

```ml
const K_PGUP = q3keys.K_PGUP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L62)

<a id="constant-constant-mq3-client-ui-qmenu-k-rightarrow-const-k-rightarrow-q3keys-k-rightarrow-src-mq3-client-ui-qmenu-ml-2020490692"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = q3keys.K_RIGHTARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L58)

<a id="constant-constant-mq3-client-ui-qmenu-k-space-const-k-space-q3keys-k-space-src-mq3-client-ui-qmenu-ml-890766171"></a>
### K_SPACE

```ml
const K_SPACE = q3keys.K_SPACE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L53)

<a id="constant-constant-mq3-client-ui-qmenu-k-tab-const-k-tab-q3keys-k-tab-src-mq3-client-ui-qmenu-ml-1275348692"></a>
### K_TAB

```ml
const K_TAB = q3keys.K_TAB
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L50)

<a id="constant-constant-mq3-client-ui-qmenu-k-uparrow-const-k-uparrow-q3keys-k-uparrow-src-mq3-client-ui-qmenu-ml-1524425863"></a>
### K_UPARROW

```ml
const K_UPARROW = q3keys.K_UPARROW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L55)

- [mq3.client.ui_qmenu.KeyResult](Type-mq3-client-ui-qmenu-keyresult-638657440.md) — struct
<a id="constant-constant-mq3-client-ui-qmenu-max-menuitems-const-max-menuitems-64-src-mq3-client-ui-qmenu-ml-2056281235"></a>
### MAX_MENUITEMS

```ml
const MAX_MENUITEMS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L102)

<a id="function-function-mq3-client-ui-qmenu-menu-function-menu-wraparound-fullscreen-src-mq3-client-ui-qmenu-ml-847892160"></a>
### menu

```ml
function menu(wrapAround, fullscreen)
```

Creates a `mq3.client.ui_qmenu.Menu` record. Assigns `wrapAround` from `wrapAround`, `fullscreen` from `fullscreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wrapAround` | `dynamic` | — | Value used to initialize `Menu.wrapAround`. |
| `fullscreen` | `dynamic` | — | Value used to initialize `Menu.fullscreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L132)

- [mq3.client.ui_qmenu.Menu](Type-mq3-client-ui-qmenu-menu-976120253.md) — struct
<a id="function-function-mq3-client-ui-qmenu-menu-activateitem-function-menu-activateitem-m-value-src-mq3-client-ui-qmenu-ml-732845900"></a>
### Menu_ActivateItem

```ml
function Menu_ActivateItem(m, value)
```

Calls `mq3.client.ui_qmenu.notify` from UI qmenu `Menu_ActivateItem`. The final path returns `SOUND_NONE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Accepted for compatibility with `Menu_ActivateItem`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.callback`, `value.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L413)

<a id="function-function-mq3-client-ui-qmenu-menu-additem-function-menu-additem-m-value-src-mq3-client-ui-qmenu-ml-36609080"></a>
### Menu_AddItem

```ml
function Menu_AddItem(m, value)
```

Menu_AddItem / cursor and focus functions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `m.items`. |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.menuPosition`, `value.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L379)

<a id="function-function-mq3-client-ui-qmenu-menu-adjustcursor-function-menu-adjustcursor-m-direction-src-mq3-client-ui-qmenu-ml-596696846"></a>
### Menu_AdjustCursor

```ml
function Menu_AdjustCursor(m, direction)
```

Updates `m.cursor` during UI qmenu `Menu_AdjustCursor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `m.cursor`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L403)

<a id="function-function-mq3-client-ui-qmenu-menu-cache-function-menu-cache-ragepro-src-mq3-client-ui-qmenu-ml-1374440032"></a>
### Menu_Cache

```ml
function Menu_Cache(ragePro)
```

Menu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ragePro` | `dynamic` | — | Value used by `if ragePro then back="menubackRagePro" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L445)

<a id="function-function-mq3-client-ui-qmenu-menu-cursormoved-function-menu-cursormoved-m-src-mq3-client-ui-qmenu-ml-106930955"></a>
### Menu_CursorMoved

```ml
function Menu_CursorMoved(m)
```

Calls `mq3.client.ui_qmenu.notify` from UI qmenu `Menu_CursorMoved`. The final path returns `m`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Record read through `m.cursor_prev`, `m.cursor`, `m.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L385)

<a id="function-function-mq3-client-ui-qmenu-menu-defaultkey-function-menu-defaultkey-m-key-cursorx-cursory-src-mq3-client-ui-qmenu-ml-2131068365"></a>
### Menu_DefaultKey

```ml
function Menu_DefaultKey(m, key, cursorx, cursory)
```

Menu_DefaultKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `m.popped`, `m.debug`, `m.commands`, `m.cursor_prev` and additional values. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |
| `cursorx` | `dynamic` | — | Value used by `if current.type==MTYPE_SPINCONTROL then sound=SpinControl_Key(current,key) else if current.type==MTYPE_RADIOBUTTON then sound=RadioButton_Key(...`. |
| `cursory` | `dynamic` | — | Value used by `if current.type==MTYPE_SPINCONTROL then sound=SpinControl_Key(current,key) else if current.type==MTYPE_RADIOBUTTON then sound=RadioButton_Key(...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L437)

<a id="function-function-mq3-client-ui-qmenu-menu-draw-function-menu-draw-m-realtime-src-mq3-client-ui-qmenu-ml-1438362510"></a>
### Menu_Draw

```ml
function Menu_Draw(m, realtime)
```

Menu_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Record read through `m.items`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L425)

<a id="function-function-mq3-client-ui-qmenu-menu-itematcursor-function-menu-itematcursor-m-src-mq3-client-ui-qmenu-ml-616846579"></a>
### Menu_ItemAtCursor

```ml
function Menu_ItemAtCursor(m)
```

Evaluates UI qmenu `Menu_ItemAtCursor` and returns `void`, `m.items[m.cursor]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Record read through `m.cursor`, `m.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L409)

<a id="function-function-mq3-client-ui-qmenu-menu-setcursor-function-menu-setcursor-m-cursor-src-mq3-client-ui-qmenu-ml-293974973"></a>
### Menu_SetCursor

```ml
function Menu_SetCursor(m, cursor)
```

Updates `m.cursor_prev`, `m.cursor` during UI qmenu `Menu_SetCursor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `m.cursor_prev`, `m.cursor`. |
| `cursor` | `dynamic` | — | Value assigned to `m.cursor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L391)

<a id="function-function-mq3-client-ui-qmenu-menu-setcursortoitem-function-menu-setcursortoitem-m-value-src-mq3-client-ui-qmenu-ml-1346191732"></a>
### Menu_SetCursorToItem

```ml
function Menu_SetCursorToItem(m, value)
```

Calls `mq3.client.ui_qmenu.Menu_SetCursor` from UI qmenu `Menu_SetCursorToItem`. The final path returns `m`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Record read through `m.items`. |
| `value` | `dynamic` | — | Value tested by `m.items[index]==value` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L397)

<a id="function-function-mq3-client-ui-qmenu-menufield-draw-function-menufield-draw-m-value-src-mq3-client-ui-qmenu-ml-108695796"></a>
### MenuField_Draw

```ml
function MenuField_Draw(m, value)
```

Calls `std.string.substr`, `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.colorDisabled` and additional helpers from UI qmenu `MenuField_Draw`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value tested by `focused(m,value)` before the calculation continues. |
| `value` | `dynamic` | — | Record read through `value.buffer`, `value.fieldScroll`, `value.widthInChars`, `value.flags` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L372)

<a id="function-function-mq3-client-ui-qmenu-menufield-init-function-menufield-init-value-src-mq3-client-ui-qmenu-ml-1359505881"></a>
### MenuField_Init

```ml
function MenuField_Init(value)
```

q3_ui/ui_mfield.c boundary used by the QMenu dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.widthInChars`, `value.maxchars`, `value.fieldCursor`, `value.fieldScroll` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L350)

<a id="function-function-mq3-client-ui-qmenu-menufield-key-function-menufield-key-value-key-src-mq3-client-ui-qmenu-ml-1321160838"></a>
### MenuField_Key

```ml
function MenuField_Key(value, key)
```

Updates `value.buffer`, `value.fieldCursor`, `value.fieldScroll` during UI qmenu `MenuField_Key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.buffer`, `value.fieldCursor`, `value.fieldScroll`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L360)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-action-const-mtype-action-q3local-mtype-action-src-mq3-client-ui-qmenu-ml-2142803036"></a>
### MTYPE_ACTION

```ml
const MTYPE_ACTION = q3local.MTYPE_ACTION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L16)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-bitmap-const-mtype-bitmap-q3local-mtype-bitmap-src-mq3-client-ui-qmenu-ml-831909557"></a>
### MTYPE_BITMAP

```ml
const MTYPE_BITMAP = q3local.MTYPE_BITMAP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L20)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-btext-const-mtype-btext-q3local-mtype-btext-src-mq3-client-ui-qmenu-ml-1750244645"></a>
### MTYPE_BTEXT

```ml
const MTYPE_BTEXT = q3local.MTYPE_BTEXT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L24)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-field-const-mtype-field-q3local-mtype-field-src-mq3-client-ui-qmenu-ml-1149107210"></a>
### MTYPE_FIELD

```ml
const MTYPE_FIELD = q3local.MTYPE_FIELD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L18)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-null-const-mtype-null-q3local-mtype-null-src-mq3-client-ui-qmenu-ml-126168143"></a>
### MTYPE_NULL

```ml
const MTYPE_NULL = q3local.MTYPE_NULL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L14)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-ptext-const-mtype-ptext-q3local-mtype-ptext-src-mq3-client-ui-qmenu-ml-1554976639"></a>
### MTYPE_PTEXT

```ml
const MTYPE_PTEXT = q3local.MTYPE_PTEXT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L23)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-radiobutton-const-mtype-radiobutton-q3local-mtype-radiobutton-src-mq3-client-ui-qmenu-ml-158570015"></a>
### MTYPE_RADIOBUTTON

```ml
const MTYPE_RADIOBUTTON = q3local.MTYPE_RADIOBUTTON
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L19)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-scrolllist-const-mtype-scrolllist-q3local-mtype-scrolllist-src-mq3-client-ui-qmenu-ml-2132580335"></a>
### MTYPE_SCROLLLIST

```ml
const MTYPE_SCROLLLIST = q3local.MTYPE_SCROLLLIST
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L22)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-slider-const-mtype-slider-q3local-mtype-slider-src-mq3-client-ui-qmenu-ml-1705666859"></a>
### MTYPE_SLIDER

```ml
const MTYPE_SLIDER = q3local.MTYPE_SLIDER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L15)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-spincontrol-const-mtype-spincontrol-q3local-mtype-spincontrol-src-mq3-client-ui-qmenu-ml-1790497337"></a>
### MTYPE_SPINCONTROL

```ml
const MTYPE_SPINCONTROL = q3local.MTYPE_SPINCONTROL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L17)

<a id="constant-constant-mq3-client-ui-qmenu-mtype-text-const-mtype-text-q3local-mtype-text-src-mq3-client-ui-qmenu-ml-2108288181"></a>
### MTYPE_TEXT

```ml
const MTYPE_TEXT = q3local.MTYPE_TEXT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L21)

<a id="function-function-mq3-client-ui-qmenu-normalizedbyte-function-normalizedbyte-value-flags-src-mq3-client-ui-qmenu-ml-1820999896"></a>
### normalizedByte

```ml
function normalizedByte(value, flags)
```

Evaluates UI qmenu `normalizedByte` and returns `value+32`, `value-32`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `(flags&QMF_LOWERCASE)!=0 and value>=65 and value<=90`, `(flags&QMF_UPPERCASE)!=0 and value>=97 and value<=122` before the calculation continues. |
| `flags` | `dynamic` | — | Value used by `if (flags&QMF_LOWERCASE)!=0 and value>=65 and value<=90 then return value+32 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L356)

<a id="function-function-mq3-client-ui-qmenu-notify-function-notify-value-event-src-mq3-client-ui-qmenu-ml-532749279"></a>
### notify

```ml
function notify(value, event)
```

Updates `value.events` during UI qmenu `notify`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.events`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L172)

<a id="constant-constant-mq3-client-ui-qmenu-prop-gap-width-const-prop-gap-width-3-src-mq3-client-ui-qmenu-ml-2073792918"></a>
### PROP_GAP_WIDTH

```ml
const PROP_GAP_WIDTH = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L100)

<a id="constant-constant-mq3-client-ui-qmenu-prop-height-const-prop-height-27-src-mq3-client-ui-qmenu-ml-575644264"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L99)

<a id="function-function-mq3-client-ui-qmenu-proportionalscale-function-proportionalscale-style-src-mq3-client-ui-qmenu-ml-270080943"></a>
### proportionalScale

```ml
function proportionalScale(style)
```

Evaluates UI qmenu `proportionalScale` and returns `0.75`, `1.0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if (style&UI_SMALLFONT)!=0 then return 0.75 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L198)

<a id="function-function-mq3-client-ui-qmenu-proportionalwidth-function-proportionalwidth-value-src-mq3-client-ui-qmenu-ml-1871744315"></a>
### proportionalWidth

```ml
function proportionalWidth(value)
```

Adapts `mq3.client.cgame_drawtools.proportionalStringWidth` to UI qmenu `proportionalWidth`, returning its result for `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_drawtools.proportionalStringWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L201)

<a id="function-function-mq3-client-ui-qmenu-ptext-draw-function-ptext-draw-m-value-src-mq3-client-ui-qmenu-ml-1529782724"></a>
### PText_Draw

```ml
function PText_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.focused`, `mq3.client.ui_qmenu.emit` from UI qmenu `PText_Draw`. The final path returns `[emit("proportional",value.x,value.y,0,0,value.string,style,color,"")]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value tested by `focused(m,value)` before the calculation continues. |
| `value` | `dynamic` | — | Record read through `value.color`, `value.style`, `value.flags`, `value.x` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L213)

<a id="function-function-mq3-client-ui-qmenu-ptext-init-function-ptext-init-value-src-mq3-client-ui-qmenu-ml-1328264781"></a>
### PText_Init

```ml
function PText_Init(value)
```

PText_Init / PText_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L205)

<a id="constant-constant-mq3-client-ui-qmenu-qm-activated-const-qm-activated-q3local-qm-activated-src-mq3-client-ui-qmenu-ml-791343980"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = q3local.QM_ACTIVATED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L48)

<a id="constant-constant-mq3-client-ui-qmenu-qm-gotfocus-const-qm-gotfocus-q3local-qm-gotfocus-src-mq3-client-ui-qmenu-ml-642586513"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = q3local.QM_GOTFOCUS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L46)

<a id="constant-constant-mq3-client-ui-qmenu-qm-lostfocus-const-qm-lostfocus-q3local-qm-lostfocus-src-mq3-client-ui-qmenu-ml-385766717"></a>
### QM_LOSTFOCUS

```ml
const QM_LOSTFOCUS = q3local.QM_LOSTFOCUS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L47)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-blink-const-qmf-blink-q3local-qmf-blink-src-mq3-client-ui-qmenu-ml-380728337"></a>
### QMF_BLINK

```ml
const QMF_BLINK = q3local.QMF_BLINK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L25)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-center-justify-const-qmf-center-justify-q3local-qmf-center-justify-src-mq3-client-ui-qmenu-ml-861107433"></a>
### QMF_CENTER_JUSTIFY

```ml
const QMF_CENTER_JUSTIFY = q3local.QMF_CENTER_JUSTIFY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L28)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-grayed-const-qmf-grayed-q3local-qmf-grayed-src-mq3-client-ui-qmenu-ml-1630822933"></a>
### QMF_GRAYED

```ml
const QMF_GRAYED = q3local.QMF_GRAYED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L38)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-hasmousefocus-const-qmf-hasmousefocus-q3local-qmf-hasmousefocus-src-mq3-client-ui-qmenu-ml-807049016"></a>
### QMF_HASMOUSEFOCUS

```ml
const QMF_HASMOUSEFOCUS = q3local.QMF_HASMOUSEFOCUS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L34)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-hidden-const-qmf-hidden-q3local-qmf-hidden-src-mq3-client-ui-qmenu-ml-1623237035"></a>
### QMF_HIDDEN

```ml
const QMF_HIDDEN = q3local.QMF_HIDDEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L37)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-highlight-const-qmf-highlight-q3local-qmf-highlight-src-mq3-client-ui-qmenu-ml-1019253863"></a>
### QMF_HIGHLIGHT

```ml
const QMF_HIGHLIGHT = q3local.QMF_HIGHLIGHT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L31)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-highlight-if-focus-const-qmf-highlight-if-focus-q3local-qmf-highlight-if-focus-src-mq3-client-ui-qmenu-ml-112938262"></a>
### QMF_HIGHLIGHT_IF_FOCUS

```ml
const QMF_HIGHLIGHT_IF_FOCUS = q3local.QMF_HIGHLIGHT_IF_FOCUS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L32)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-inactive-const-qmf-inactive-q3local-qmf-inactive-src-mq3-client-ui-qmenu-ml-839527998"></a>
### QMF_INACTIVE

```ml
const QMF_INACTIVE = q3local.QMF_INACTIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L39)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-left-justify-const-qmf-left-justify-q3local-qmf-left-justify-src-mq3-client-ui-qmenu-ml-1848592281"></a>
### QMF_LEFT_JUSTIFY

```ml
const QMF_LEFT_JUSTIFY = q3local.QMF_LEFT_JUSTIFY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L27)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-lowercase-const-qmf-lowercase-q3local-qmf-lowercase-src-mq3-client-ui-qmenu-ml-109201692"></a>
### QMF_LOWERCASE

```ml
const QMF_LOWERCASE = q3local.QMF_LOWERCASE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L43)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-mouseonly-const-qmf-mouseonly-q3local-qmf-mouseonly-src-mq3-client-ui-qmenu-ml-1936023536"></a>
### QMF_MOUSEONLY

```ml
const QMF_MOUSEONLY = q3local.QMF_MOUSEONLY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L36)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-nodefaultinit-const-qmf-nodefaultinit-q3local-qmf-nodefaultinit-src-mq3-client-ui-qmenu-ml-2066612897"></a>
### QMF_NODEFAULTINIT

```ml
const QMF_NODEFAULTINIT = q3local.QMF_NODEFAULTINIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L40)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-noonofftext-const-qmf-noonofftext-q3local-qmf-noonofftext-src-mq3-client-ui-qmenu-ml-670913911"></a>
### QMF_NOONOFFTEXT

```ml
const QMF_NOONOFFTEXT = q3local.QMF_NOONOFFTEXT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L35)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-numbersonly-const-qmf-numbersonly-q3local-qmf-numbersonly-src-mq3-client-ui-qmenu-ml-615516879"></a>
### QMF_NUMBERSONLY

```ml
const QMF_NUMBERSONLY = q3local.QMF_NUMBERSONLY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L30)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-ownerdraw-const-qmf-ownerdraw-q3local-qmf-ownerdraw-src-mq3-client-ui-qmenu-ml-1720815096"></a>
### QMF_OWNERDRAW

```ml
const QMF_OWNERDRAW = q3local.QMF_OWNERDRAW
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L41)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-pulse-const-qmf-pulse-q3local-qmf-pulse-src-mq3-client-ui-qmenu-ml-179882700"></a>
### QMF_PULSE

```ml
const QMF_PULSE = q3local.QMF_PULSE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L42)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-pulseiffocus-const-qmf-pulseiffocus-q3local-qmf-pulseiffocus-src-mq3-client-ui-qmenu-ml-438533501"></a>
### QMF_PULSEIFFOCUS

```ml
const QMF_PULSEIFFOCUS = q3local.QMF_PULSEIFFOCUS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L33)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-right-justify-const-qmf-right-justify-q3local-qmf-right-justify-src-mq3-client-ui-qmenu-ml-107777472"></a>
### QMF_RIGHT_JUSTIFY

```ml
const QMF_RIGHT_JUSTIFY = q3local.QMF_RIGHT_JUSTIFY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L29)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-silent-const-qmf-silent-q3local-qmf-silent-src-mq3-client-ui-qmenu-ml-998790094"></a>
### QMF_SILENT

```ml
const QMF_SILENT = q3local.QMF_SILENT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L45)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-smallfont-const-qmf-smallfont-q3local-qmf-smallfont-src-mq3-client-ui-qmenu-ml-56145965"></a>
### QMF_SMALLFONT

```ml
const QMF_SMALLFONT = q3local.QMF_SMALLFONT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L26)

<a id="constant-constant-mq3-client-ui-qmenu-qmf-uppercase-const-qmf-uppercase-q3local-qmf-uppercase-src-mq3-client-ui-qmenu-ml-2067724943"></a>
### QMF_UPPERCASE

```ml
const QMF_UPPERCASE = q3local.QMF_UPPERCASE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L44)

<a id="function-function-mq3-client-ui-qmenu-radiobutton-draw-function-radiobutton-draw-m-value-src-mq3-client-ui-qmenu-ml-1578721844"></a>
### RadioButton_Draw

```ml
function RadioButton_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.focused`, `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.colorDisabled` and additional helpers from UI qmenu `RadioButton_Draw`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value used by `focus=focused(m,value)`. |
| `value` | `dynamic` | — | Record read through `value.flags`, `value.left`, `value.top`, `value.right` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L265)

<a id="function-function-mq3-client-ui-qmenu-radiobutton-init-function-radiobutton-init-value-src-mq3-client-ui-qmenu-ml-514411165"></a>
### RadioButton_Init

```ml
function RadioButton_Init(value)
```

RadioButton_Init / RadioButton_Key / RadioButton_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L253)

<a id="function-function-mq3-client-ui-qmenu-radiobutton-key-function-radiobutton-key-value-key-src-mq3-client-ui-qmenu-ml-436139310"></a>
### RadioButton_Key

```ml
function RadioButton_Key(value, key)
```

Updates `value.curvalue` during UI qmenu `RadioButton_Key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.curvalue`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L257)

<a id="function-function-mq3-client-ui-qmenu-scrolllist-draw-function-scrolllist-draw-m-value-src-mq3-client-ui-qmenu-ml-2142545532"></a>
### ScrollList_Draw

```ml
function ScrollList_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.emit`, `mq3.client.ui_qmenu.colorListbar` and additional helpers from UI qmenu `ScrollList_Draw`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value tested by `focused(m,value)` before the calculation continues. |
| `value` | `dynamic` | — | Record read through `value.x`, `value.columns`, `value.y`, `value.listTop` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L344)

<a id="function-function-mq3-client-ui-qmenu-scrolllist-init-function-scrolllist-init-value-src-mq3-client-ui-qmenu-ml-1688351649"></a>
### ScrollList_Init

```ml
function ScrollList_Init(value)
```

ScrollList_Init / ScrollList_Key / ScrollList_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.oldvalue`, `value.curvalue`, `value.listTop`, `value.columns` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L319)

<a id="function-function-mq3-client-ui-qmenu-scrolllist-key-function-scrolllist-key-value-key-cursorx-cursory-src-mq3-client-ui-qmenu-ml-425222155"></a>
### ScrollList_Key

```ml
function ScrollList_Key(value, key, cursorx, cursory)
```

Updates `value.oldvalue`, `value.curvalue`, `value.listTop` during UI qmenu `ScrollList_Key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.oldvalue`, `value.curvalue`, `value.listTop`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |
| `cursorx` | `dynamic` | — | Value used by `if cursorx>=x and cursorx<x+w and cursory>=value.y and cursory<value.y+value.height*SMALLCHAR_HEIGHT then column=idiv(idiv(cursorx-x,SMALLCHAR...`. |
| `cursory` | `dynamic` | — | Value used by `if cursorx>=x and cursorx<x+w and cursory>=value.y and cursory<value.y+value.height*SMALLCHAR_HEIGHT then column=idiv(idiv(cursorx-x,SMALLCHAR...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L327)

<a id="function-function-mq3-client-ui-qmenu-slider-draw-function-slider-draw-m-value-src-mq3-client-ui-qmenu-ml-325073224"></a>
### Slider_Draw

```ml
function Slider_Draw(m, value)
```

Updates `value.range` during UI qmenu `Slider_Draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value used by `focus=focused(m,value)`. |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.range`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L291)

<a id="function-function-mq3-client-ui-qmenu-slider-init-function-slider-init-value-src-mq3-client-ui-qmenu-ml-1889742661"></a>
### Slider_Init

```ml
function Slider_Init(value)
```

Slider_Init / Slider_Key / Slider_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L276)

<a id="function-function-mq3-client-ui-qmenu-slider-key-function-slider-key-value-key-cursorx-src-mq3-client-ui-qmenu-ml-1660868258"></a>
### Slider_Key

```ml
function Slider_Key(value, key, cursorx)
```

Updates `value.curvalue` during UI qmenu `Slider_Key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.curvalue`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |
| `cursorx` | `dynamic` | — | Value used by `if key==K_MOUSE1 then value.curvalue=((cursorx-value.x-2*SMALLCHAR_WIDTH)/(SLIDER_RANGE*SMALLCHAR_WIDTH))*(value.maxvalue-value.minvalue)+valu...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L281)

<a id="constant-constant-mq3-client-ui-qmenu-slider-range-const-slider-range-10-src-mq3-client-ui-qmenu-ml-1111904498"></a>
### SLIDER_RANGE

```ml
const SLIDER_RANGE = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L101)

<a id="constant-constant-mq3-client-ui-qmenu-smallchar-height-const-smallchar-height-16-src-mq3-client-ui-qmenu-ml-868063140"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L98)

<a id="constant-constant-mq3-client-ui-qmenu-smallchar-width-const-smallchar-width-8-src-mq3-client-ui-qmenu-ml-1697369525"></a>
### SMALLCHAR_WIDTH

```ml
const SMALLCHAR_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L97)

<a id="constant-constant-mq3-client-ui-qmenu-sound-buzz-const-sound-buzz-4-src-mq3-client-ui-qmenu-ml-1973924477"></a>
### SOUND_BUZZ

```ml
const SOUND_BUZZ = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L108)

<a id="constant-constant-mq3-client-ui-qmenu-sound-in-const-sound-in-1-src-mq3-client-ui-qmenu-ml-954134200"></a>
### SOUND_IN

```ml
const SOUND_IN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L105)

<a id="constant-constant-mq3-client-ui-qmenu-sound-move-const-sound-move-2-src-mq3-client-ui-qmenu-ml-174204119"></a>
### SOUND_MOVE

```ml
const SOUND_MOVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L106)

<a id="constant-constant-mq3-client-ui-qmenu-sound-none-const-sound-none-0-src-mq3-client-ui-qmenu-ml-1795325819"></a>
### SOUND_NONE

```ml
const SOUND_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L104)

<a id="constant-constant-mq3-client-ui-qmenu-sound-null-const-sound-null-1-src-mq3-client-ui-qmenu-ml-874457267"></a>
### SOUND_NULL

```ml
const SOUND_NULL = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L109)

<a id="constant-constant-mq3-client-ui-qmenu-sound-out-const-sound-out-3-src-mq3-client-ui-qmenu-ml-1839445774"></a>
### SOUND_OUT

```ml
const SOUND_OUT = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L107)

<a id="function-function-mq3-client-ui-qmenu-spincontrol-draw-function-spincontrol-draw-m-value-src-mq3-client-ui-qmenu-ml-336998272"></a>
### SpinControl_Draw

```ml
function SpinControl_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.focused`, `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.colorDisabled` and additional helpers from UI qmenu `SpinControl_Draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Value used by `focus=focused(m,value)`. |
| `value` | `dynamic` | — | Record read through `value.flags`, `value.left`, `value.top`, `value.right` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L312)

<a id="function-function-mq3-client-ui-qmenu-spincontrol-init-function-spincontrol-init-value-src-mq3-client-ui-qmenu-ml-1181143677"></a>
### SpinControl_Init

```ml
function SpinControl_Init(value)
```

SpinControl_Init / SpinControl_Key / SpinControl_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.numitems`, `value.top`, `value.right` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L300)

<a id="function-function-mq3-client-ui-qmenu-spincontrol-key-function-spincontrol-key-value-key-src-mq3-client-ui-qmenu-ml-922073570"></a>
### SpinControl_Key

```ml
function SpinControl_Key(value, key)
```

Updates `value.curvalue` during UI qmenu `SpinControl_Key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.curvalue`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI qmenu entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L306)

<a id="function-function-mq3-client-ui-qmenu-text-draw-function-text-draw-m-value-src-mq3-client-ui-qmenu-ml-1675379788"></a>
### Text_Draw

```ml
function Text_Draw(m, value)
```

Calls `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.emit` from UI qmenu `Text_Draw`. The final path returns `[emit("string",value.x,value.y,0,0,text,value.style,color,"")]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | `dynamic` | — | Accepted for compatibility with `Text_Draw`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.name`, `value.string`, `value.color`, `value.flags` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L180)

<a id="function-function-mq3-client-ui-qmenu-text-init-function-text-init-value-src-mq3-client-ui-qmenu-ml-1829981837"></a>
### Text_Init

```ml
function Text_Init(value)
```

Text_Init / Text_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI qmenu record/storage; this routine assigns `value.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L176)

<a id="constant-constant-mq3-client-ui-qmenu-ui-blink-const-ui-blink-32-src-mq3-client-ui-qmenu-ml-1595305490"></a>
### UI_BLINK

```ml
const UI_BLINK = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L93)

<a id="constant-constant-mq3-client-ui-qmenu-ui-center-const-ui-center-1-src-mq3-client-ui-qmenu-ml-939813728"></a>
### UI_CENTER

```ml
const UI_CENTER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L90)

<a id="constant-constant-mq3-client-ui-qmenu-ui-left-const-ui-left-0-src-mq3-client-ui-qmenu-ml-1874658549"></a>
### UI_LEFT

```ml
const UI_LEFT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L89)

<a id="constant-constant-mq3-client-ui-qmenu-ui-pulse-const-ui-pulse-64-src-mq3-client-ui-qmenu-ml-1814231521"></a>
### UI_PULSE

```ml
const UI_PULSE = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L94)

<a id="constant-constant-mq3-client-ui-qmenu-ui-right-const-ui-right-2-src-mq3-client-ui-qmenu-ml-187431151"></a>
### UI_RIGHT

```ml
const UI_RIGHT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L91)

<a id="constant-constant-mq3-client-ui-qmenu-ui-smallfont-const-ui-smallfont-16-src-mq3-client-ui-qmenu-ml-1138083756"></a>
### UI_SMALLFONT

```ml
const UI_SMALLFONT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L92)
