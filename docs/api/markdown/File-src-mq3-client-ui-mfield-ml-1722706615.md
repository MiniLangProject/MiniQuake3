# `src/mq3/client/ui_mfield.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_mfield`](Package-mq3-client-ui-mfield-2062034597.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-mfield-action-function-action-boundary-kind-text-x-y-style-cursorchar-retailactive-src-mq3-client-ui-mfield-ml-316919102"></a>
### action

```ml
function action(boundary, kind, text, x, y, style, cursorChar, retailActive)
```

Creates a `mq3.client.ui_mfield.HostAction` record. Assigns `boundary` from `boundary`, `kind` from `kind`, `text` from `text`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — | Value used to initialize `HostAction.boundary`. |
| `kind` | `dynamic` | — | Value used to initialize `HostAction.kind`. |
| `text` | `dynamic` | — | Value used to initialize `HostAction.text`. |
| `x` | `dynamic` | — | Value used to initialize `HostAction.x`. |
| `y` | `dynamic` | — | Value used to initialize `HostAction.y`. |
| `style` | `dynamic` | — | Value used to initialize `HostAction.style`. |
| `cursorChar` | `dynamic` | — | Value used to initialize `HostAction.cursorChar`. |
| `retailActive` | `dynamic` | — | Value used to initialize `HostAction.dispatched`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L125)

<a id="function-function-mq3-client-ui-mfield-byteat-function-byteat-text-index-src-mq3-client-ui-mfield-ml-782235583"></a>
### byteAt

```ml
function byteAt(text, index)
```

Computes `bytes(text)[index]` for UI mfield `byteAt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `byteAt` in the UI mfield path. |
| `index` | `dynamic` | — | Value used by `return bytes(text)[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L137)

<a id="function-function-mq3-client-ui-mfield-bytetext-function-bytetext-value-src-mq3-client-ui-mfield-ml-124348911"></a>
### byteText

```ml
function byteText(value)
```

Calls `decode` from UI mfield `byteText`. The final path returns `decode(bytes(data))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `c=value&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L133)

<a id="function-function-mq3-client-ui-mfield-clamp-function-clamp-value-low-high-src-mq3-client-ui-mfield-ml-848353643"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for UI mfield.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L130)

- [mq3.client.ui_mfield.DrawResult](Type-mq3-client-ui-mfield-drawresult-1748749990.md) — struct
<a id="function-function-mq3-client-ui-mfield-eraseat-function-eraseat-text-index-src-mq3-client-ui-mfield-ml-795001741"></a>
### eraseAt

```ml
function eraseAt(text, index)
```

Calls `decode`, `slice` from UI mfield `eraseAt`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `eraseAt` in the UI mfield path. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(data)`, `index>0` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L141)

<a id="function-function-mq3-client-ui-mfield-field-function-field-widthinchars-maxchars-src-mq3-client-ui-mfield-ml-412473143"></a>
### field

```ml
function field(widthInChars, maxchars)
```

Creates a `mq3.client.ui_mfield.Field` record. Assigns `widthInChars` from `widthInChars`, `maxchars` from `maxchars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `widthInChars` | `dynamic` | — | Value used to initialize `Field.widthInChars`. |
| `maxchars` | `dynamic` | — | Value used to initialize `Field.maxchars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L115)

- [mq3.client.ui_mfield.Field](Type-mq3-client-ui-mfield-field-685654459.md) — struct
- [mq3.client.ui_mfield.HostAction](Type-mq3-client-ui-mfield-hostaction-2004169545.md) — struct
<a id="function-function-mq3-client-ui-mfield-insertat-function-insertat-text-index-value-src-mq3-client-ui-mfield-ml-1257333248"></a>
### insertAt

```ml
function insertAt(text, index, value)
```

Calls `mq3.client.ui_mfield.clamp`, `decode`, `slice` and additional helpers from UI mfield `insertAt`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `insertAt` in the UI mfield path. |
| `index` | `dynamic` | — | Value tested by `index>0`, `index<len(data)` before the calculation continues. |
| `value` | `dynamic` | — | Value used by `result=result+byteText(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L148)

<a id="constant-constant-mq3-client-ui-mfield-k-ctrl-const-k-ctrl-137-src-mq3-client-ui-mfield-ml-1601910630"></a>
### K_CTRL

```ml
const K_CTRL = 137
```

Engine key code for the ctrl input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L14)

<a id="constant-constant-mq3-client-ui-mfield-k-shift-const-k-shift-138-src-mq3-client-ui-mfield-ml-542677031"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```

Engine key code for the shift input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L12)

<a id="constant-constant-mq3-client-ui-mfield-max-edit-line-const-max-edit-line-256-src-mq3-client-ui-mfield-ml-1642616110"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```

Maximum length of a console or editable input line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L10)

- [mq3.client.ui_mfield.MenuField](Type-mq3-client-ui-mfield-menufield-1519299266.md) — struct
<a id="function-function-mq3-client-ui-mfield-menufield-draw-function-menufield-draw-value-retailactive-src-mq3-client-ui-mfield-ml-1391309944"></a>
### MenuField_Draw

```ml
function MenuField_Draw(value, retailActive)
```

MenuField_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.flags`, `value.parentCursor`, `value.menuPosition`, `value.left` and additional values. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L250)

<a id="function-function-mq3-client-ui-mfield-menufield-init-function-menufield-init-value-src-mq3-client-ui-mfield-ml-941020919"></a>
### MenuField_Init

```ml
function MenuField_Init(value)
```

MenuField_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI mfield record/storage; this routine assigns `value.left`, `value.top`, `value.right`, `value.bottom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L243)

<a id="function-function-mq3-client-ui-mfield-menufield-key-function-menufield-key-value-key-shiftdown-ctrldown-clipboard-src-mq3-client-ui-mfield-ml-1582699447"></a>
### MenuField_Key

```ml
function MenuField_Key(value, key, shiftDown, ctrlDown, clipboard)
```

MenuField_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.flags`, `value.field`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI mfield entry. |
| `shiftDown` | `dynamic` | — | Value used by `MField_KeyDownEvent(value.field,key,shiftDown,ctrlDown,clipboard)`. |
| `ctrlDown` | `dynamic` | — | Value used by `MField_KeyDownEvent(value.field,key,shiftDown,ctrlDown,clipboard)`. |
| `clipboard` | `dynamic` | — | Value used by `if key==22 then MField_Paste(value.field,clipboard) else MField_CharEvent(value.field,key) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L263)

- [mq3.client.ui_mfield.MenuKeyResult](Type-mq3-client-ui-mfield-menukeyresult-1480895852.md) — struct
<a id="function-function-mq3-client-ui-mfield-mfield-charevent-function-mfield-charevent-edit-ch-src-mq3-client-ui-mfield-ml-2099227415"></a>
### MField_CharEvent

```ml
function MField_CharEvent(edit, ch)
```

MField_CharEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Mutable UI mfield record/storage; this routine assigns `edit.buffer`, `edit.cursor`, `edit.scroll`. |
| `ch` | `dynamic` | — | Value used by `if ch==22 then return MField_Paste(edit,edit.clipboard) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L217)

<a id="function-function-mq3-client-ui-mfield-mfield-clear-function-mfield-clear-edit-src-mq3-client-ui-mfield-ml-80018126"></a>
### MField_Clear

```ml
function MField_Clear(edit)
```

MField_Clear

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Mutable UI mfield record/storage; this routine assigns `edit.buffer`, `edit.cursor`, `edit.scroll`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L239)

<a id="function-function-mq3-client-ui-mfield-mfield-draw-function-mfield-draw-edit-x-y-style-color-retailactive-src-mq3-client-ui-mfield-ml-588987808"></a>
### MField_Draw

```ml
function MField_Draw(edit, x, y, style, color, retailActive)
```

MField_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Mutable UI mfield record/storage; this routine assigns `edit.scroll`, `edit.actions`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `MField_Draw`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `MField_Draw`. |
| `style` | `dynamic` | — | Value used by `actions=[action("renderer","draw-string",visible,x,y,style,0,retailActive)]`. |
| `color` | `dynamic` | — | Accepted for compatibility with `MField_Draw`; the current implementation does not read it. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L166)

<a id="function-function-mq3-client-ui-mfield-mfield-keydownevent-function-mfield-keydownevent-edit-key-shiftdown-ctrldown-clipboard-src-mq3-client-ui-mfield-ml-470677984"></a>
### MField_KeyDownEvent

```ml
function MField_KeyDownEvent(edit, key, shiftDown, ctrlDown, clipboard)
```

MField_KeyDownEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Mutable UI mfield record/storage; this routine assigns `edit.clipboard`, `edit.buffer`, `edit.cursor`, `edit.scroll` and additional values. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI mfield entry. |
| `shiftDown` | `dynamic` | — | Value used by `if (key==qmenu.K_INS or key==qmenu.K_KP_INS) and shiftDown then MField_Paste(edit,clipboard)`. |
| `ctrlDown` | `dynamic` | — | Value used by `if key==qmenu.K_HOME or key==qmenu.K_KP_HOME or (lower==97 and ctrlDown) then edit.cursor=0`. |
| `clipboard` | `dynamic` | — | Value assigned to `edit.clipboard`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L200)

<a id="function-function-mq3-client-ui-mfield-mfield-paste-function-mfield-paste-edit-clipboard-src-mq3-client-ui-mfield-ml-1699824490"></a>
### MField_Paste

```ml
function MField_Paste(edit, clipboard)
```

MField_Paste

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Mutable UI mfield record/storage; this routine assigns `edit.clipboard`, `edit.actions`. |
| `clipboard` | `dynamic` | — | Value assigned to `edit.clipboard`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L190)

<a id="function-function-mq3-client-ui-mfield-overwriteat-function-overwriteat-text-index-value-src-mq3-client-ui-mfield-ml-86910328"></a>
### overwriteAt

```ml
function overwriteAt(text, index, value)
```

Calls `mq3.client.ui_mfield.byteText`, `decode`, `slice` from UI mfield `overwriteAt`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `overwriteAt` in the UI mfield path. |
| `index` | `dynamic` | — | Value tested by `index>=len(data)`, `index>0` and additional values before the calculation continues. |
| `value` | `dynamic` | — | Value used by `if index>=len(data) then return text+byteText(value) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L155)
