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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `cursorChar` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L20)

<a id="function-function-mq3-client-ui-mfield-byteat-function-byteat-text-index-src-mq3-client-ui-mfield-ml-782235583"></a>
### byteAt

```ml
function byteAt(text, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L23)

<a id="function-function-mq3-client-ui-mfield-bytetext-function-bytetext-value-src-mq3-client-ui-mfield-ml-124348911"></a>
### byteText

```ml
function byteText(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L22)

<a id="function-function-mq3-client-ui-mfield-clamp-function-clamp-value-low-high-src-mq3-client-ui-mfield-ml-848353643"></a>
### clamp

```ml
function clamp(value, low, high)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L21)

- [mq3.client.ui_mfield.DrawResult](Type-mq3-client-ui-mfield-drawresult-1748749990.md) — struct
<a id="function-function-mq3-client-ui-mfield-eraseat-function-eraseat-text-index-src-mq3-client-ui-mfield-ml-795001741"></a>
### eraseAt

```ml
function eraseAt(text, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L24)

<a id="function-function-mq3-client-ui-mfield-field-function-field-widthinchars-maxchars-src-mq3-client-ui-mfield-ml-412473143"></a>
### field

```ml
function field(widthInChars, maxchars)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `widthInChars` | `dynamic` | — |  |
| `maxchars` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L19)

- [mq3.client.ui_mfield.Field](Type-mq3-client-ui-mfield-field-685654459.md) — struct
- [mq3.client.ui_mfield.HostAction](Type-mq3-client-ui-mfield-hostaction-2004169545.md) — struct
<a id="function-function-mq3-client-ui-mfield-insertat-function-insertat-text-index-value-src-mq3-client-ui-mfield-ml-1257333248"></a>
### insertAt

```ml
function insertAt(text, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L27)

<a id="constant-constant-mq3-client-ui-mfield-k-ctrl-const-k-ctrl-137-src-mq3-client-ui-mfield-ml-1601910630"></a>
### K_CTRL

```ml
const K_CTRL = 137
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L11)

<a id="constant-constant-mq3-client-ui-mfield-k-shift-const-k-shift-138-src-mq3-client-ui-mfield-ml-542677031"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L10)

<a id="constant-constant-mq3-client-ui-mfield-max-edit-line-const-max-edit-line-256-src-mq3-client-ui-mfield-ml-1642616110"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L9)

- [mq3.client.ui_mfield.MenuField](Type-mq3-client-ui-mfield-menufield-1519299266.md) — struct
<a id="function-function-mq3-client-ui-mfield-menufield-draw-function-menufield-draw-value-retailactive-src-mq3-client-ui-mfield-ml-1391309944"></a>
### MenuField_Draw

```ml
function MenuField_Draw(value, retailActive)
```

MenuField_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L106)

<a id="function-function-mq3-client-ui-mfield-menufield-init-function-menufield-init-value-src-mq3-client-ui-mfield-ml-941020919"></a>
### MenuField_Init

```ml
function MenuField_Init(value)
```

MenuField_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L101)

<a id="function-function-mq3-client-ui-mfield-menufield-key-function-menufield-key-value-key-shiftdown-ctrldown-clipboard-src-mq3-client-ui-mfield-ml-1582699447"></a>
### MenuField_Key

```ml
function MenuField_Key(value, key, shiftDown, ctrlDown, clipboard)
```

MenuField_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shiftDown` | `dynamic` | — |  |
| `ctrlDown` | `dynamic` | — |  |
| `clipboard` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L114)

- [mq3.client.ui_mfield.MenuKeyResult](Type-mq3-client-ui-mfield-menukeyresult-1480895852.md) — struct
<a id="function-function-mq3-client-ui-mfield-mfield-charevent-function-mfield-charevent-edit-ch-src-mq3-client-ui-mfield-ml-2099227415"></a>
### MField_CharEvent

```ml
function MField_CharEvent(edit, ch)
```

MField_CharEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L77)

<a id="function-function-mq3-client-ui-mfield-mfield-clear-function-mfield-clear-edit-src-mq3-client-ui-mfield-ml-80018126"></a>
### MField_Clear

```ml
function MField_Clear(edit)
```

MField_Clear

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L98)

<a id="function-function-mq3-client-ui-mfield-mfield-draw-function-mfield-draw-edit-x-y-style-color-retailactive-src-mq3-client-ui-mfield-ml-588987808"></a>
### MField_Draw

```ml
function MField_Draw(edit, x, y, style, color, retailActive)
```

MField_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L35)

<a id="function-function-mq3-client-ui-mfield-mfield-keydownevent-function-mfield-keydownevent-edit-key-shiftdown-ctrldown-clipboard-src-mq3-client-ui-mfield-ml-470677984"></a>
### MField_KeyDownEvent

```ml
function MField_KeyDownEvent(edit, key, shiftDown, ctrlDown, clipboard)
```

MField_KeyDownEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shiftDown` | `dynamic` | — |  |
| `ctrlDown` | `dynamic` | — |  |
| `clipboard` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L62)

<a id="function-function-mq3-client-ui-mfield-mfield-paste-function-mfield-paste-edit-clipboard-src-mq3-client-ui-mfield-ml-1699824490"></a>
### MField_Paste

```ml
function MField_Paste(edit, clipboard)
```

MField_Paste

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |
| `clipboard` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L57)

<a id="function-function-mq3-client-ui-mfield-overwriteat-function-overwriteat-text-index-value-src-mq3-client-ui-mfield-ml-86910328"></a>
### overwriteAt

```ml
function overwriteAt(text, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L30)
