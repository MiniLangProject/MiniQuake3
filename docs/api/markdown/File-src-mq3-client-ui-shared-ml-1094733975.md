# `src/mq3/client/ui_shared.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_shared`](Package-mq3-client-ui-shared-153020017.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-shared-abs-function-abs-value-src-mq3-client-ui-shared-ml-1687720167"></a>
### abs

```ml
function abs(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L97)

- [mq3.client.ui_shared.Action](Type-mq3-client-ui-shared-action-608828119.md) — struct
<a id="function-function-mq3-client-ui-shared-adjustfrom640-function-adjustfrom640-dc-value-src-mq3-client-ui-shared-ml-2127283568"></a>
### AdjustFrom640

```ml
function AdjustFrom640(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L135)

<a id="function-function-mq3-client-ui-shared-bindingfromname-function-bindingfromname-dc-name-src-mq3-client-ui-shared-ml-1576290404"></a>
### BindingFromName

```ml
function BindingFromName(dc, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L304)

<a id="function-function-mq3-client-ui-shared-bindingidfromname-function-bindingidfromname-name-src-mq3-client-ui-shared-ml-1270561361"></a>
### BindingIDFromName

```ml
function BindingIDFromName(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L303)

<a id="function-function-mq3-client-ui-shared-bindingtable-function-bindingtable-src-mq3-client-ui-shared-ml-1646266950"></a>
### bindingTable

```ml
function bindingTable()
```

Bindings and defaults.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L302)

<a id="function-function-mq3-client-ui-shared-clamp-function-clamp-value-low-high-src-mq3-client-ui-shared-ml-1578536751"></a>
### clamp

```ml
function clamp(value, low, high)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L98)

<a id="function-function-mq3-client-ui-shared-color-function-color-r-g-b-a-src-mq3-client-ui-shared-ml-1374922726"></a>
### color

```ml
function color(r, g, b, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L87)

- [mq3.client.ui_shared.Color](Type-mq3-client-ui-shared-color-1363201088.md) — struct
<a id="function-function-mq3-client-ui-shared-color-parse-function-color-parse-source-src-mq3-client-ui-shared-ml-832303907"></a>
### Color_Parse

```ml
function Color_Parse(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L116)

<a id="function-function-mq3-client-ui-shared-commandhandler-function-commandhandler-name-src-mq3-client-ui-shared-ml-302252451"></a>
### commandHandler

```ml
function commandHandler(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L212)

<a id="function-function-mq3-client-ui-shared-controls-getconfig-function-controls-getconfig-dc-src-mq3-client-ui-shared-ml-716748197"></a>
### Controls_GetConfig

```ml
function Controls_GetConfig(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L306)

<a id="function-function-mq3-client-ui-shared-controls-getkeyassignment-function-controls-getkeyassignment-dc-name-src-mq3-client-ui-shared-ml-438328798"></a>
### Controls_GetKeyAssignment

```ml
function Controls_GetKeyAssignment(dc, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L305)

<a id="function-function-mq3-client-ui-shared-controls-setconfig-function-controls-setconfig-dc-restart-src-mq3-client-ui-shared-ml-627888168"></a>
### Controls_SetConfig

```ml
function Controls_SetConfig(dc, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L308)

<a id="function-function-mq3-client-ui-shared-controls-setdefaults-function-controls-setdefaults-dc-src-mq3-client-ui-shared-ml-441380433"></a>
### Controls_SetDefaults

```ml
function Controls_SetDefaults(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L307)

<a id="constant-constant-mq3-client-ui-shared-cursor-arrow-const-cursor-arrow-2-src-mq3-client-ui-shared-ml-731531835"></a>
### CURSOR_ARROW

```ml
const CURSOR_ARROW = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L42)

<a id="constant-constant-mq3-client-ui-shared-cursor-none-const-cursor-none-1-src-mq3-client-ui-shared-ml-1015683024"></a>
### CURSOR_NONE

```ml
const CURSOR_NONE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L41)

<a id="constant-constant-mq3-client-ui-shared-cursor-sizer-const-cursor-sizer-4-src-mq3-client-ui-shared-ml-621723401"></a>
### CURSOR_SIZER

```ml
const CURSOR_SIZER = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L43)

<a id="function-function-mq3-client-ui-shared-display-function-display-retailactive-src-mq3-client-ui-shared-ml-1608388745"></a>
### display

```ml
function display(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L94)

- [mq3.client.ui_shared.Display](Type-mq3-client-ui-shared-display-1222485597.md) — struct
<a id="function-function-mq3-client-ui-shared-display-cacheall-function-display-cacheall-dc-src-mq3-client-ui-shared-ml-1999780121"></a>
### Display_CacheAll

```ml
function Display_CacheAll(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L299)

<a id="function-function-mq3-client-ui-shared-display-captureitem-function-display-captureitem-dc-x-y-src-mq3-client-ui-shared-ml-1870443688"></a>
### Display_CaptureItem

```ml
function Display_CaptureItem(dc, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L329)

<a id="function-function-mq3-client-ui-shared-display-closecinematics-function-display-closecinematics-dc-src-mq3-client-ui-shared-ml-449753443"></a>
### Display_CloseCinematics

```ml
function Display_CloseCinematics(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L227)

<a id="function-function-mq3-client-ui-shared-display-cursortype-function-display-cursortype-dc-x-y-src-mq3-client-ui-shared-ml-123225656"></a>
### Display_CursorType

```ml
function Display_CursorType(dc, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L331)

<a id="function-function-mq3-client-ui-shared-display-getcontext-function-display-getcontext-dc-src-mq3-client-ui-shared-ml-2012866293"></a>
### Display_GetContext

```ml
function Display_GetContext(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L130)

<a id="function-function-mq3-client-ui-shared-display-handlekey-function-display-handlekey-dc-key-down-x-y-src-mq3-client-ui-shared-ml-1230251697"></a>
### Display_HandleKey

```ml
function Display_HandleKey(dc, key, down, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L332)

<a id="function-function-mq3-client-ui-shared-display-keybindpending-function-display-keybindpending-dc-src-mq3-client-ui-shared-ml-1829964605"></a>
### Display_KeyBindPending

```ml
function Display_KeyBindPending(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L309)

<a id="function-function-mq3-client-ui-shared-display-mousemove-function-display-mousemove-dc-p-x-y-src-mq3-client-ui-shared-ml-573252638"></a>
### Display_MouseMove

```ml
function Display_MouseMove(dc, p, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L330)

<a id="function-function-mq3-client-ui-shared-display-visiblemenucount-function-display-visiblemenucount-dc-src-mq3-client-ui-shared-ml-1783172181"></a>
### Display_VisibleMenuCount

```ml
function Display_VisibleMenuCount(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L328)

<a id="function-function-mq3-client-ui-shared-emit-function-emit-dc-boundary-kind-name-detail-number-vector-src-mq3-client-ui-shared-ml-1574390001"></a>
### emit

```ml
function emit(dc, boundary, kind, name, detail, number, vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L95)

<a id="function-function-mq3-client-ui-shared-fade-function-fade-flags-alpha-clampvalue-nexttime-offsettime-bflags-fadeamount-realtime-src-mq3-client-ui-shared-ml-535346505"></a>
### Fade

```ml
function Fade(flags, alpha, clampValue, nextTime, offsetTime, bFlags, fadeAmount, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `clampValue` | `dynamic` | — |  |
| `nextTime` | `dynamic` | — |  |
| `offsetTime` | `dynamic` | — |  |
| `bFlags` | `dynamic` | — |  |
| `fadeAmount` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L137)

<a id="function-function-mq3-client-ui-shared-float-parse-function-float-parse-source-src-mq3-client-ui-shared-ml-914128661"></a>
### Float_Parse

```ml
function Float_Parse(source)
```

Text and PC parser boundaries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L114)

<a id="function-function-mq3-client-ui-shared-gradientbar-paint-function-gradientbar-paint-dc-value-tint-src-mq3-client-ui-shared-ml-984273717"></a>
### GradientBar_Paint

```ml
function GradientBar_Paint(dc, value, tint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `tint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L152)

<a id="function-function-mq3-client-ui-shared-hashforstring-function-hashforstring-value-src-mq3-client-ui-shared-ml-360014231"></a>
### hashForString

```ml
function hashForString(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L107)

<a id="function-function-mq3-client-ui-shared-init-display-function-init-display-dc-src-mq3-client-ui-shared-ml-1056631161"></a>
### Init_Display

```ml
function Init_Display(dc)
```

Display context and geometry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L129)

<a id="function-function-mq3-client-ui-shared-int-parse-function-int-parse-source-src-mq3-client-ui-shared-ml-866503643"></a>
### Int_Parse

```ml
function Int_Parse(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L115)

<a id="function-function-mq3-client-ui-shared-isvisible-function-isvisible-flags-src-mq3-client-ui-shared-ml-1867945645"></a>
### IsVisible

```ml
function IsVisible(flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L132)

<a id="function-function-mq3-client-ui-shared-item-function-item-src-mq3-client-ui-shared-ml-1378341602"></a>
### item

```ml
function item()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L90)

- [mq3.client.ui_shared.Item](Type-mq3-client-ui-shared-item-693759470.md) — struct
<a id="function-function-mq3-client-ui-shared-item-action-function-item-action-dc-value-src-mq3-client-ui-shared-ml-1502629742"></a>
### Item_Action

```ml
function Item_Action(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L231)

<a id="constant-constant-mq3-client-ui-shared-item-align-center-const-item-align-center-1-src-mq3-client-ui-shared-ml-1014636844"></a>
### ITEM_ALIGN_CENTER

```ml
const ITEM_ALIGN_CENTER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L39)

<a id="constant-constant-mq3-client-ui-shared-item-align-left-const-item-align-left-0-src-mq3-client-ui-shared-ml-341304843"></a>
### ITEM_ALIGN_LEFT

```ml
const ITEM_ALIGN_LEFT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L38)

<a id="constant-constant-mq3-client-ui-shared-item-align-right-const-item-align-right-2-src-mq3-client-ui-shared-ml-1625044951"></a>
### ITEM_ALIGN_RIGHT

```ml
const ITEM_ALIGN_RIGHT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L40)

<a id="function-function-mq3-client-ui-shared-item-bind-handlekey-function-item-bind-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-191308691"></a>
### Item_Bind_HandleKey

```ml
function Item_Bind_HandleKey(dc, value, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L260)

<a id="function-function-mq3-client-ui-shared-item-bind-paint-function-item-bind-paint-dc-value-src-mq3-client-ui-shared-ml-147432126"></a>
### Item_Bind_Paint

```ml
function Item_Bind_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L278)

<a id="function-function-mq3-client-ui-shared-item-cachecontents-function-item-cachecontents-dc-value-src-mq3-client-ui-shared-ml-624926778"></a>
### Item_CacheContents

```ml
function Item_CacheContents(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L298)

<a id="function-function-mq3-client-ui-shared-item-correctedtextrect-function-item-correctedtextrect-value-src-mq3-client-ui-shared-ml-446709031"></a>
### Item_CorrectedTextRect

```ml
function Item_CorrectedTextRect(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L166)

<a id="function-function-mq3-client-ui-shared-item-enableshowviacvar-function-item-enableshowviacvar-dc-value-flag-src-mq3-client-ui-shared-ml-1439124108"></a>
### Item_EnableShowViaCvar

```ml
function Item_EnableShowViaCvar(dc, value, flag)
```

Cvar gating and item controls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `flag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L230)

<a id="function-function-mq3-client-ui-shared-item-handlekey-function-item-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-1131079461"></a>
### Item_HandleKey

```ml
function Item_HandleKey(dc, value, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L261)

<a id="function-function-mq3-client-ui-shared-item-image-paint-function-item-image-paint-dc-value-src-mq3-client-ui-shared-ml-2141520854"></a>
### Item_Image_Paint

```ml
function Item_Image_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L280)

<a id="function-function-mq3-client-ui-shared-item-init-function-item-init-value-src-mq3-client-ui-shared-ml-744597423"></a>
### Item_Init

```ml
function Item_Init(value)
```

Item/menu initialization and coordinates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L158)

<a id="function-function-mq3-client-ui-shared-item-initcontrols-function-item-initcontrols-value-src-mq3-client-ui-shared-ml-1335703751"></a>
### Item_InitControls

```ml
function Item_InitControls(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L160)

<a id="function-function-mq3-client-ui-shared-item-listbox-handlekey-function-item-listbox-handlekey-dc-value-key-down-force-src-mq3-client-ui-shared-ml-843207284"></a>
### Item_ListBox_HandleKey

```ml
function Item_ListBox_HandleKey(dc, value, key, down, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L255)

<a id="function-function-mq3-client-ui-shared-item-listbox-maxscroll-function-item-listbox-maxscroll-dc-value-src-mq3-client-ui-shared-ml-931146378"></a>
### Item_ListBox_MaxScroll

```ml
function Item_ListBox_MaxScroll(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L240)

<a id="function-function-mq3-client-ui-shared-item-listbox-mouseenter-function-item-listbox-mouseenter-dc-value-x-y-src-mq3-client-ui-shared-ml-960830369"></a>
### Item_ListBox_MouseEnter

```ml
function Item_ListBox_MouseEnter(dc, value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L254)

<a id="function-function-mq3-client-ui-shared-item-listbox-overlb-function-item-listbox-overlb-dc-value-x-y-src-mq3-client-ui-shared-ml-963220427"></a>
### Item_ListBox_OverLB

```ml
function Item_ListBox_OverLB(dc, value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L243)

<a id="function-function-mq3-client-ui-shared-item-listbox-paint-function-item-listbox-paint-dc-value-src-mq3-client-ui-shared-ml-721041598"></a>
### Item_ListBox_Paint

```ml
function Item_ListBox_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L281)

<a id="function-function-mq3-client-ui-shared-item-listbox-thumbdrawposition-function-item-listbox-thumbdrawposition-dc-value-src-mq3-client-ui-shared-ml-1813934238"></a>
### Item_ListBox_ThumbDrawPosition

```ml
function Item_ListBox_ThumbDrawPosition(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L242)

<a id="function-function-mq3-client-ui-shared-item-listbox-thumbposition-function-item-listbox-thumbposition-dc-value-src-mq3-client-ui-shared-ml-1443281782"></a>
### Item_ListBox_ThumbPosition

```ml
function Item_ListBox_ThumbPosition(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L241)

<a id="function-function-mq3-client-ui-shared-item-model-paint-function-item-model-paint-dc-value-src-mq3-client-ui-shared-ml-1987746086"></a>
### Item_Model_Paint

```ml
function Item_Model_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L279)

<a id="function-function-mq3-client-ui-shared-item-mouseenter-function-item-mouseenter-dc-value-x-y-src-mq3-client-ui-shared-ml-717971833"></a>
### Item_MouseEnter

```ml
function Item_MouseEnter(dc, value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L177)

<a id="function-function-mq3-client-ui-shared-item-mouseleave-function-item-mouseleave-dc-value-src-mq3-client-ui-shared-ml-1449958"></a>
### Item_MouseLeave

```ml
function Item_MouseLeave(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L178)

<a id="function-function-mq3-client-ui-shared-item-multi-countsettings-function-item-multi-countsettings-value-src-mq3-client-ui-shared-ml-1197910551"></a>
### Item_Multi_CountSettings

```ml
function Item_Multi_CountSettings(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L233)

<a id="function-function-mq3-client-ui-shared-item-multi-findcvarbyvalue-function-item-multi-findcvarbyvalue-dc-value-src-mq3-client-ui-shared-ml-100131058"></a>
### Item_Multi_FindCvarByValue

```ml
function Item_Multi_FindCvarByValue(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L234)

<a id="function-function-mq3-client-ui-shared-item-multi-handlekey-function-item-multi-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-1744153517"></a>
### Item_Multi_HandleKey

```ml
function Item_Multi_HandleKey(dc, value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L236)

<a id="function-function-mq3-client-ui-shared-item-multi-paint-function-item-multi-paint-dc-value-src-mq3-client-ui-shared-ml-77983326"></a>
### Item_Multi_Paint

```ml
function Item_Multi_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L276)

<a id="function-function-mq3-client-ui-shared-item-multi-setting-function-item-multi-setting-dc-value-src-mq3-client-ui-shared-ml-1656097518"></a>
### Item_Multi_Setting

```ml
function Item_Multi_Setting(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L235)

<a id="function-function-mq3-client-ui-shared-item-ownerdraw-handlekey-function-item-ownerdraw-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-507912961"></a>
### Item_OwnerDraw_HandleKey

```ml
function Item_OwnerDraw_HandleKey(dc, value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L259)

<a id="function-function-mq3-client-ui-shared-item-ownerdraw-paint-function-item-ownerdraw-paint-dc-value-src-mq3-client-ui-shared-ml-1423689582"></a>
### Item_OwnerDraw_Paint

```ml
function Item_OwnerDraw_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L282)

<a id="function-function-mq3-client-ui-shared-item-paint-function-item-paint-dc-value-src-mq3-client-ui-shared-ml-1243021002"></a>
### Item_Paint

```ml
function Item_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L294)

<a id="function-function-mq3-client-ui-shared-item-parse-function-item-parse-handle-value-src-mq3-client-ui-shared-ml-427978369"></a>
### Item_Parse

```ml
function Item_Parse(handle, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L373)

<a id="function-function-mq3-client-ui-shared-item-runscript-function-item-runscript-dc-value-text-src-mq3-client-ui-shared-ml-395192879"></a>
### Item_RunScript

```ml
function Item_RunScript(dc, value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L213)

<a id="function-function-mq3-client-ui-shared-item-setfocus-function-item-setfocus-dc-value-x-y-src-mq3-client-ui-shared-ml-276830991"></a>
### Item_SetFocus

```ml
function Item_SetFocus(dc, value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L175)

<a id="function-function-mq3-client-ui-shared-item-setmouseover-function-item-setmouseover-value-focus-src-mq3-client-ui-shared-ml-496698949"></a>
### Item_SetMouseOver

```ml
function Item_SetMouseOver(value, focus)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L176)

<a id="function-function-mq3-client-ui-shared-item-setscreencoords-function-item-setscreencoords-value-x-y-src-mq3-client-ui-shared-ml-2120637126"></a>
### Item_SetScreenCoords

```ml
function Item_SetScreenCoords(value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L162)

<a id="function-function-mq3-client-ui-shared-item-settextextents-function-item-settextextents-value-text-src-mq3-client-ui-shared-ml-2066842654"></a>
### Item_SetTextExtents

```ml
function Item_SetTextExtents(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L167)

<a id="function-function-mq3-client-ui-shared-item-setupkeywordhash-function-item-setupkeywordhash-src-mq3-client-ui-shared-ml-801027750"></a>
### Item_SetupKeywordHash

```ml
function Item_SetupKeywordHash()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L340)

<a id="function-function-mq3-client-ui-shared-item-slider-handlekey-function-item-slider-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-173157227"></a>
### Item_Slider_HandleKey

```ml
function Item_Slider_HandleKey(dc, value, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L239)

<a id="function-function-mq3-client-ui-shared-item-slider-overslider-function-item-slider-overslider-dc-value-x-y-src-mq3-client-ui-shared-ml-651658319"></a>
### Item_Slider_OverSlider

```ml
function Item_Slider_OverSlider(dc, value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L238)

<a id="function-function-mq3-client-ui-shared-item-slider-paint-function-item-slider-paint-dc-value-src-mq3-client-ui-shared-ml-1546342426"></a>
### Item_Slider_Paint

```ml
function Item_Slider_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L277)

<a id="function-function-mq3-client-ui-shared-item-slider-thumbposition-function-item-slider-thumbposition-dc-value-src-mq3-client-ui-shared-ml-848541940"></a>
### Item_Slider_ThumbPosition

```ml
function Item_Slider_ThumbPosition(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L237)

<a id="function-function-mq3-client-ui-shared-item-startcapture-function-item-startcapture-dc-value-key-src-mq3-client-ui-shared-ml-498714901"></a>
### Item_StartCapture

```ml
function Item_StartCapture(dc, value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L262)

<a id="function-function-mq3-client-ui-shared-item-stopcapture-function-item-stopcapture-dc-value-src-mq3-client-ui-shared-ml-1887209086"></a>
### Item_StopCapture

```ml
function Item_StopCapture(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L263)

<a id="function-function-mq3-client-ui-shared-item-text-autowrapped-paint-function-item-text-autowrapped-paint-dc-value-src-mq3-client-ui-shared-ml-1001799936"></a>
### Item_Text_AutoWrapped_Paint

```ml
function Item_Text_AutoWrapped_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L273)

<a id="function-function-mq3-client-ui-shared-item-text-paint-function-item-text-paint-dc-value-src-mq3-client-ui-shared-ml-1790611486"></a>
### Item_Text_Paint

```ml
function Item_Text_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L271)

<a id="function-function-mq3-client-ui-shared-item-text-wrapped-paint-function-item-text-wrapped-paint-dc-value-src-mq3-client-ui-shared-ml-1427294414"></a>
### Item_Text_Wrapped_Paint

```ml
function Item_Text_Wrapped_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L272)

<a id="function-function-mq3-client-ui-shared-item-textcolor-function-item-textcolor-dc-value-src-mq3-client-ui-shared-ml-1259777846"></a>
### Item_TextColor

```ml
function Item_TextColor(dc, value)
```

Painting uses typed renderer/feeder/ownerdraw actions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L269)

<a id="function-function-mq3-client-ui-shared-item-textfield-handlekey-function-item-textfield-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-1792470053"></a>
### Item_TextField_HandleKey

```ml
function Item_TextField_HandleKey(dc, value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L258)

<a id="function-function-mq3-client-ui-shared-item-textfield-paint-function-item-textfield-paint-dc-value-src-mq3-client-ui-shared-ml-1488838278"></a>
### Item_TextField_Paint

```ml
function Item_TextField_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L274)

<a id="constant-constant-mq3-client-ui-shared-item-type-bind-const-item-type-bind-13-src-mq3-client-ui-shared-ml-320205743"></a>
### ITEM_TYPE_BIND

```ml
const ITEM_TYPE_BIND = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L37)

<a id="constant-constant-mq3-client-ui-shared-item-type-button-const-item-type-button-1-src-mq3-client-ui-shared-ml-1311364728"></a>
### ITEM_TYPE_BUTTON

```ml
const ITEM_TYPE_BUTTON = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L25)

<a id="constant-constant-mq3-client-ui-shared-item-type-checkbox-const-item-type-checkbox-3-src-mq3-client-ui-shared-ml-1742352268"></a>
### ITEM_TYPE_CHECKBOX

```ml
const ITEM_TYPE_CHECKBOX = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L27)

<a id="constant-constant-mq3-client-ui-shared-item-type-combo-const-item-type-combo-5-src-mq3-client-ui-shared-ml-784126244"></a>
### ITEM_TYPE_COMBO

```ml
const ITEM_TYPE_COMBO = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L29)

<a id="constant-constant-mq3-client-ui-shared-item-type-editfield-const-item-type-editfield-4-src-mq3-client-ui-shared-ml-30928095"></a>
### ITEM_TYPE_EDITFIELD

```ml
const ITEM_TYPE_EDITFIELD = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L28)

<a id="constant-constant-mq3-client-ui-shared-item-type-listbox-const-item-type-listbox-6-src-mq3-client-ui-shared-ml-2012312625"></a>
### ITEM_TYPE_LISTBOX

```ml
const ITEM_TYPE_LISTBOX = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L30)

<a id="constant-constant-mq3-client-ui-shared-item-type-model-const-item-type-model-7-src-mq3-client-ui-shared-ml-170576690"></a>
### ITEM_TYPE_MODEL

```ml
const ITEM_TYPE_MODEL = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L31)

<a id="constant-constant-mq3-client-ui-shared-item-type-multi-const-item-type-multi-12-src-mq3-client-ui-shared-ml-435822090"></a>
### ITEM_TYPE_MULTI

```ml
const ITEM_TYPE_MULTI = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L36)

<a id="constant-constant-mq3-client-ui-shared-item-type-numericfield-const-item-type-numericfield-9-src-mq3-client-ui-shared-ml-27548414"></a>
### ITEM_TYPE_NUMERICFIELD

```ml
const ITEM_TYPE_NUMERICFIELD = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L33)

<a id="constant-constant-mq3-client-ui-shared-item-type-ownerdraw-const-item-type-ownerdraw-8-src-mq3-client-ui-shared-ml-862330631"></a>
### ITEM_TYPE_OWNERDRAW

```ml
const ITEM_TYPE_OWNERDRAW = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L32)

<a id="constant-constant-mq3-client-ui-shared-item-type-radiobutton-const-item-type-radiobutton-2-src-mq3-client-ui-shared-ml-41786369"></a>
### ITEM_TYPE_RADIOBUTTON

```ml
const ITEM_TYPE_RADIOBUTTON = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L26)

<a id="constant-constant-mq3-client-ui-shared-item-type-slider-const-item-type-slider-10-src-mq3-client-ui-shared-ml-1227123958"></a>
### ITEM_TYPE_SLIDER

```ml
const ITEM_TYPE_SLIDER = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L34)

<a id="constant-constant-mq3-client-ui-shared-item-type-text-const-item-type-text-0-src-mq3-client-ui-shared-ml-2098914137"></a>
### ITEM_TYPE_TEXT

```ml
const ITEM_TYPE_TEXT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L24)

<a id="constant-constant-mq3-client-ui-shared-item-type-yesno-const-item-type-yesno-11-src-mq3-client-ui-shared-ml-849459887"></a>
### ITEM_TYPE_YESNO

```ml
const ITEM_TYPE_YESNO = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L35)

<a id="function-function-mq3-client-ui-shared-item-updateeffects-function-item-updateeffects-dc-value-src-mq3-client-ui-shared-ml-483056990"></a>
### Item_UpdateEffects

```ml
function Item_UpdateEffects(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L284)

<a id="function-function-mq3-client-ui-shared-item-updateposition-function-item-updateposition-value-src-mq3-client-ui-shared-ml-481997411"></a>
### Item_UpdatePosition

```ml
function Item_UpdatePosition(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L163)

<a id="function-function-mq3-client-ui-shared-item-validatetypedata-function-item-validatetypedata-value-src-mq3-client-ui-shared-ml-1531697399"></a>
### Item_ValidateTypeData

```ml
function Item_ValidateTypeData(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L161)

<a id="function-function-mq3-client-ui-shared-item-yesno-handlekey-function-item-yesno-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-1308444729"></a>
### Item_YesNo_HandleKey

```ml
function Item_YesNo_HandleKey(dc, value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L232)

<a id="function-function-mq3-client-ui-shared-item-yesno-paint-function-item-yesno-paint-dc-value-src-mq3-client-ui-shared-ml-824468394"></a>
### Item_YesNo_Paint

```ml
function Item_YesNo_Paint(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L275)

<a id="function-function-mq3-client-ui-shared-itemkeywords-function-itemkeywords-src-mq3-client-ui-shared-ml-1236742954"></a>
### itemKeywords

```ml
function itemKeywords()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L372)

<a id="function-function-mq3-client-ui-shared-itemparse-action-function-itemparse-action-value-handle-src-mq3-client-ui-shared-ml-1226349421"></a>
### ItemParse_action

```ml
function ItemParse_action(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L431)

<a id="function-function-mq3-client-ui-shared-itemparse-addcolorrange-function-itemparse-addcolorrange-value-handle-src-mq3-client-ui-shared-ml-1117831825"></a>
### ItemParse_addColorRange

```ml
function ItemParse_addColorRange(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L441)

<a id="function-function-mq3-client-ui-shared-itemparse-align-function-itemparse-align-value-handle-src-mq3-client-ui-shared-ml-2098998849"></a>
### ItemParse_align

```ml
function ItemParse_align(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L412)

<a id="function-function-mq3-client-ui-shared-itemparse-asset-model-function-itemparse-asset-model-value-handle-src-mq3-client-ui-shared-ml-1712260907"></a>
### ItemParse_asset_model

```ml
function ItemParse_asset_model(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L388)

<a id="function-function-mq3-client-ui-shared-itemparse-asset-shader-function-itemparse-asset-shader-value-handle-src-mq3-client-ui-shared-ml-910422913"></a>
### ItemParse_asset_shader

```ml
function ItemParse_asset_shader(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L389)

<a id="function-function-mq3-client-ui-shared-itemparse-autowrapped-function-itemparse-autowrapped-value-handle-src-mq3-client-ui-shared-ml-237877299"></a>
### ItemParse_autowrapped

```ml
function ItemParse_autowrapped(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L400)

<a id="function-function-mq3-client-ui-shared-itemparse-backcolor-function-itemparse-backcolor-value-handle-src-mq3-client-ui-shared-ml-202384915"></a>
### ItemParse_backcolor

```ml
function ItemParse_backcolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L418)

<a id="function-function-mq3-client-ui-shared-itemparse-background-function-itemparse-background-value-handle-src-mq3-client-ui-shared-ml-1060739805"></a>
### ItemParse_background

```ml
function ItemParse_background(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L422)

<a id="function-function-mq3-client-ui-shared-itemparse-border-function-itemparse-border-value-handle-src-mq3-client-ui-shared-ml-968512749"></a>
### ItemParse_border

```ml
function ItemParse_border(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L408)

<a id="function-function-mq3-client-ui-shared-itemparse-bordercolor-function-itemparse-bordercolor-value-handle-src-mq3-client-ui-shared-ml-1208018577"></a>
### ItemParse_bordercolor

```ml
function ItemParse_bordercolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L420)

<a id="function-function-mq3-client-ui-shared-itemparse-bordersize-function-itemparse-bordersize-value-handle-src-mq3-client-ui-shared-ml-1732751145"></a>
### ItemParse_bordersize

```ml
function ItemParse_bordersize(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L409)

<a id="function-function-mq3-client-ui-shared-itemparse-cinematic-function-itemparse-cinematic-value-handle-src-mq3-client-ui-shared-ml-1570828017"></a>
### ItemParse_cinematic

```ml
function ItemParse_cinematic(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L423)

<a id="function-function-mq3-client-ui-shared-itemparse-columns-function-itemparse-columns-value-handle-src-mq3-client-ui-shared-ml-347486717"></a>
### ItemParse_columns

```ml
function ItemParse_columns(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L407)

<a id="function-function-mq3-client-ui-shared-itemparse-cvar-function-itemparse-cvar-value-handle-src-mq3-client-ui-shared-ml-578138517"></a>
### ItemParse_cvar

```ml
function ItemParse_cvar(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L434)

<a id="function-function-mq3-client-ui-shared-itemparse-cvarfloat-function-itemparse-cvarfloat-value-handle-src-mq3-client-ui-shared-ml-1829272939"></a>
### ItemParse_cvarFloat

```ml
function ItemParse_cvarFloat(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L437)

<a id="function-function-mq3-client-ui-shared-itemparse-cvarfloatlist-function-itemparse-cvarfloatlist-value-handle-src-mq3-client-ui-shared-ml-1629197947"></a>
### ItemParse_cvarFloatList

```ml
function ItemParse_cvarFloatList(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L440)

<a id="function-function-mq3-client-ui-shared-itemparse-cvarstrlist-function-itemparse-cvarstrlist-value-handle-src-mq3-client-ui-shared-ml-1406966513"></a>
### ItemParse_cvarStrList

```ml
function ItemParse_cvarStrList(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L439)

<a id="function-function-mq3-client-ui-shared-itemparse-cvartest-function-itemparse-cvartest-value-handle-src-mq3-client-ui-shared-ml-1000167749"></a>
### ItemParse_cvarTest

```ml
function ItemParse_cvarTest(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L433)

<a id="function-function-mq3-client-ui-shared-itemparse-decoration-function-itemparse-decoration-value-handle-src-mq3-client-ui-shared-ml-528694165"></a>
### ItemParse_decoration

```ml
function ItemParse_decoration(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L397)

<a id="function-function-mq3-client-ui-shared-itemparse-disablecvar-function-itemparse-disablecvar-value-handle-src-mq3-client-ui-shared-ml-409868587"></a>
### ItemParse_disableCvar

```ml
function ItemParse_disableCvar(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L445)

<a id="function-function-mq3-client-ui-shared-itemparse-doubleclick-function-itemparse-doubleclick-value-handle-src-mq3-client-ui-shared-ml-634843113"></a>
### ItemParse_doubleClick

```ml
function ItemParse_doubleClick(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L424)

<a id="function-function-mq3-client-ui-shared-itemparse-elementheight-function-itemparse-elementheight-value-handle-src-mq3-client-ui-shared-ml-843492565"></a>
### ItemParse_elementheight

```ml
function ItemParse_elementheight(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L404)

<a id="function-function-mq3-client-ui-shared-itemparse-elementtype-function-itemparse-elementtype-value-handle-src-mq3-client-ui-shared-ml-2032065183"></a>
### ItemParse_elementtype

```ml
function ItemParse_elementtype(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L406)

<a id="function-function-mq3-client-ui-shared-itemparse-elementwidth-function-itemparse-elementwidth-value-handle-src-mq3-client-ui-shared-ml-1270997481"></a>
### ItemParse_elementwidth

```ml
function ItemParse_elementwidth(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L403)

<a id="function-function-mq3-client-ui-shared-itemparse-enablecvar-function-itemparse-enablecvar-value-handle-src-mq3-client-ui-shared-ml-674453657"></a>
### ItemParse_enableCvar

```ml
function ItemParse_enableCvar(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L444)

<a id="function-function-mq3-client-ui-shared-itemparse-feeder-function-itemparse-feeder-value-handle-src-mq3-client-ui-shared-ml-347448073"></a>
### ItemParse_feeder

```ml
function ItemParse_feeder(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L405)

<a id="function-function-mq3-client-ui-shared-itemparse-focussound-function-itemparse-focussound-value-handle-src-mq3-client-ui-shared-ml-1025612005"></a>
### ItemParse_focusSound

```ml
function ItemParse_focusSound(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L385)

<a id="function-function-mq3-client-ui-shared-itemparse-forecolor-function-itemparse-forecolor-value-handle-src-mq3-client-ui-shared-ml-945155033"></a>
### ItemParse_forecolor

```ml
function ItemParse_forecolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L419)

<a id="function-function-mq3-client-ui-shared-itemparse-group-function-itemparse-group-value-handle-src-mq3-client-ui-shared-ml-1297457425"></a>
### ItemParse_group

```ml
function ItemParse_group(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L387)

<a id="function-function-mq3-client-ui-shared-itemparse-hidecvar-function-itemparse-hidecvar-value-handle-src-mq3-client-ui-shared-ml-191243869"></a>
### ItemParse_hideCvar

```ml
function ItemParse_hideCvar(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L447)

<a id="function-function-mq3-client-ui-shared-itemparse-horizontalscroll-function-itemparse-horizontalscroll-value-handle-src-mq3-client-ui-shared-ml-42608561"></a>
### ItemParse_horizontalscroll

```ml
function ItemParse_horizontalscroll(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L401)

<a id="function-function-mq3-client-ui-shared-itemparse-leavefocus-function-itemparse-leavefocus-value-handle-src-mq3-client-ui-shared-ml-1418838129"></a>
### ItemParse_leaveFocus

```ml
function ItemParse_leaveFocus(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L426)

<a id="function-function-mq3-client-ui-shared-itemparse-maxchars-function-itemparse-maxchars-value-handle-src-mq3-client-ui-shared-ml-782229461"></a>
### ItemParse_maxChars

```ml
function ItemParse_maxChars(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L435)

<a id="function-function-mq3-client-ui-shared-itemparse-maxpaintchars-function-itemparse-maxpaintchars-value-handle-src-mq3-client-ui-shared-ml-1242416805"></a>
### ItemParse_maxPaintChars

```ml
function ItemParse_maxPaintChars(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L436)

<a id="function-function-mq3-client-ui-shared-itemparse-model-angle-function-itemparse-model-angle-value-handle-src-mq3-client-ui-shared-ml-1589802537"></a>
### ItemParse_model_angle

```ml
function ItemParse_model_angle(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L394)

<a id="function-function-mq3-client-ui-shared-itemparse-model-fovx-function-itemparse-model-fovx-value-handle-src-mq3-client-ui-shared-ml-1010108037"></a>
### ItemParse_model_fovx

```ml
function ItemParse_model_fovx(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L391)

<a id="function-function-mq3-client-ui-shared-itemparse-model-fovy-function-itemparse-model-fovy-value-handle-src-mq3-client-ui-shared-ml-2036185289"></a>
### ItemParse_model_fovy

```ml
function ItemParse_model_fovy(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L392)

<a id="function-function-mq3-client-ui-shared-itemparse-model-origin-function-itemparse-model-origin-value-handle-src-mq3-client-ui-shared-ml-1081406853"></a>
### ItemParse_model_origin

```ml
function ItemParse_model_origin(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L390)

<a id="function-function-mq3-client-ui-shared-itemparse-model-rotation-function-itemparse-model-rotation-value-handle-src-mq3-client-ui-shared-ml-2123075041"></a>
### ItemParse_model_rotation

```ml
function ItemParse_model_rotation(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L393)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseenter-function-itemparse-mouseenter-value-handle-src-mq3-client-ui-shared-ml-805822881"></a>
### ItemParse_mouseEnter

```ml
function ItemParse_mouseEnter(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L427)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseentertext-function-itemparse-mouseentertext-value-handle-src-mq3-client-ui-shared-ml-1388275573"></a>
### ItemParse_mouseEnterText

```ml
function ItemParse_mouseEnterText(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L429)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseexit-function-itemparse-mouseexit-value-handle-src-mq3-client-ui-shared-ml-1167315941"></a>
### ItemParse_mouseExit

```ml
function ItemParse_mouseExit(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L428)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseexittext-function-itemparse-mouseexittext-value-handle-src-mq3-client-ui-shared-ml-952422295"></a>
### ItemParse_mouseExitText

```ml
function ItemParse_mouseExitText(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L430)

<a id="function-function-mq3-client-ui-shared-itemparse-name-function-itemparse-name-value-handle-src-mq3-client-ui-shared-ml-776586997"></a>
### ItemParse_name

```ml
function ItemParse_name(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L384)

<a id="function-function-mq3-client-ui-shared-itemparse-notselectable-function-itemparse-notselectable-value-handle-src-mq3-client-ui-shared-ml-619972721"></a>
### ItemParse_notselectable

```ml
function ItemParse_notselectable(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L398)

<a id="function-function-mq3-client-ui-shared-itemparse-onfocus-function-itemparse-onfocus-value-handle-src-mq3-client-ui-shared-ml-1842334245"></a>
### ItemParse_onFocus

```ml
function ItemParse_onFocus(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L425)

<a id="function-function-mq3-client-ui-shared-itemparse-outlinecolor-function-itemparse-outlinecolor-value-handle-src-mq3-client-ui-shared-ml-1293645369"></a>
### ItemParse_outlinecolor

```ml
function ItemParse_outlinecolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L421)

<a id="function-function-mq3-client-ui-shared-itemparse-ownerdraw-function-itemparse-ownerdraw-value-handle-src-mq3-client-ui-shared-ml-2000445945"></a>
### ItemParse_ownerdraw

```ml
function ItemParse_ownerdraw(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L411)

<a id="function-function-mq3-client-ui-shared-itemparse-ownerdrawflag-function-itemparse-ownerdrawflag-value-handle-src-mq3-client-ui-shared-ml-462409229"></a>
### ItemParse_ownerdrawFlag

```ml
function ItemParse_ownerdrawFlag(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L442)

<a id="function-function-mq3-client-ui-shared-itemparse-rect-function-itemparse-rect-value-handle-src-mq3-client-ui-shared-ml-1172301709"></a>
### ItemParse_rect

```ml
function ItemParse_rect(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L395)

<a id="function-function-mq3-client-ui-shared-itemparse-showcvar-function-itemparse-showcvar-value-handle-src-mq3-client-ui-shared-ml-1126023401"></a>
### ItemParse_showCvar

```ml
function ItemParse_showCvar(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L446)

<a id="function-function-mq3-client-ui-shared-itemparse-special-function-itemparse-special-value-handle-src-mq3-client-ui-shared-ml-1948113053"></a>
### ItemParse_special

```ml
function ItemParse_special(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L432)

<a id="function-function-mq3-client-ui-shared-itemparse-style-function-itemparse-style-value-handle-src-mq3-client-ui-shared-ml-1445025489"></a>
### ItemParse_style

```ml
function ItemParse_style(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L396)

<a id="function-function-mq3-client-ui-shared-itemparse-text-function-itemparse-text-value-handle-src-mq3-client-ui-shared-ml-2051652561"></a>
### ItemParse_text

```ml
function ItemParse_text(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L386)

<a id="function-function-mq3-client-ui-shared-itemparse-textalign-function-itemparse-textalign-value-handle-src-mq3-client-ui-shared-ml-1438941947"></a>
### ItemParse_textalign

```ml
function ItemParse_textalign(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L413)

<a id="function-function-mq3-client-ui-shared-itemparse-textalignx-function-itemparse-textalignx-value-handle-src-mq3-client-ui-shared-ml-88138037"></a>
### ItemParse_textalignx

```ml
function ItemParse_textalignx(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L414)

<a id="function-function-mq3-client-ui-shared-itemparse-textaligny-function-itemparse-textaligny-value-handle-src-mq3-client-ui-shared-ml-1094023409"></a>
### ItemParse_textaligny

```ml
function ItemParse_textaligny(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L415)

<a id="function-function-mq3-client-ui-shared-itemparse-textscale-function-itemparse-textscale-value-handle-src-mq3-client-ui-shared-ml-298141221"></a>
### ItemParse_textscale

```ml
function ItemParse_textscale(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L416)

<a id="function-function-mq3-client-ui-shared-itemparse-textstyle-function-itemparse-textstyle-value-handle-src-mq3-client-ui-shared-ml-377177211"></a>
### ItemParse_textstyle

```ml
function ItemParse_textstyle(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L417)

<a id="function-function-mq3-client-ui-shared-itemparse-type-function-itemparse-type-value-handle-src-mq3-client-ui-shared-ml-1420019849"></a>
### ItemParse_type

```ml
function ItemParse_type(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L402)

<a id="function-function-mq3-client-ui-shared-itemparse-visible-function-itemparse-visible-value-handle-src-mq3-client-ui-shared-ml-861507559"></a>
### ItemParse_visible

```ml
function ItemParse_visible(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L410)

<a id="function-function-mq3-client-ui-shared-itemparse-wrapped-function-itemparse-wrapped-value-handle-src-mq3-client-ui-shared-ml-1746529553"></a>
### ItemParse_wrapped

```ml
function ItemParse_wrapped(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L399)

<a id="function-function-mq3-client-ui-shared-itemparsekind-function-itemparsekind-value-handle-key-kind-src-mq3-client-ui-shared-ml-989161958"></a>
### itemParseKind

```ml
function itemParseKind(value, handle, key, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L343)

<a id="constant-constant-mq3-client-ui-shared-k-alt-const-k-alt-136-src-mq3-client-ui-shared-ml-1364135153"></a>
### K_ALT

```ml
const K_ALT = 136
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L53)

<a id="constant-constant-mq3-client-ui-shared-k-backspace-const-k-backspace-127-src-mq3-client-ui-shared-ml-1901639823"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L48)

<a id="constant-constant-mq3-client-ui-shared-k-ctrl-const-k-ctrl-137-src-mq3-client-ui-shared-ml-1291355466"></a>
### K_CTRL

```ml
const K_CTRL = 137
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L54)

<a id="constant-constant-mq3-client-ui-shared-k-del-const-k-del-140-src-mq3-client-ui-shared-ml-881794188"></a>
### K_DEL

```ml
const K_DEL = 140
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L56)

<a id="constant-constant-mq3-client-ui-shared-k-downarrow-const-k-downarrow-133-src-mq3-client-ui-shared-ml-481919458"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L50)

<a id="constant-constant-mq3-client-ui-shared-k-end-const-k-end-144-src-mq3-client-ui-shared-ml-2114628196"></a>
### K_END

```ml
const K_END = 144
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L58)

<a id="constant-constant-mq3-client-ui-shared-k-enter-const-k-enter-13-src-mq3-client-ui-shared-ml-1394583977"></a>
### K_ENTER

```ml
const K_ENTER = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L45)

<a id="constant-constant-mq3-client-ui-shared-k-escape-const-k-escape-27-src-mq3-client-ui-shared-ml-1370217730"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L46)

<a id="constant-constant-mq3-client-ui-shared-k-f1-const-k-f1-145-src-mq3-client-ui-shared-ml-569239295"></a>
### K_F1

```ml
const K_F1 = 145
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L59)

<a id="constant-constant-mq3-client-ui-shared-k-f2-const-k-f2-146-src-mq3-client-ui-shared-ml-1543936108"></a>
### K_F2

```ml
const K_F2 = 146
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L60)

<a id="constant-constant-mq3-client-ui-shared-k-f3-const-k-f3-147-src-mq3-client-ui-shared-ml-559898405"></a>
### K_F3

```ml
const K_F3 = 147
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L61)

<a id="constant-constant-mq3-client-ui-shared-k-f4-const-k-f4-148-src-mq3-client-ui-shared-ml-1719568482"></a>
### K_F4

```ml
const K_F4 = 148
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L62)

<a id="constant-constant-mq3-client-ui-shared-k-f5-const-k-f5-149-src-mq3-client-ui-shared-ml-1809663363"></a>
### K_F5

```ml
const K_F5 = 149
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L63)

<a id="constant-constant-mq3-client-ui-shared-k-kp-pgdn-const-k-kp-pgdn-168-src-mq3-client-ui-shared-ml-2021606258"></a>
### K_KP_PGDN

```ml
const K_KP_PGDN = 168
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L65)

<a id="constant-constant-mq3-client-ui-shared-k-kp-pgup-const-k-kp-pgup-162-src-mq3-client-ui-shared-ml-2019448560"></a>
### K_KP_PGUP

```ml
const K_KP_PGUP = 162
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L64)

<a id="constant-constant-mq3-client-ui-shared-k-leftarrow-const-k-leftarrow-134-src-mq3-client-ui-shared-ml-1202439343"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L51)

<a id="constant-constant-mq3-client-ui-shared-k-mouse1-const-k-mouse1-178-src-mq3-client-ui-shared-ml-1148140069"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L66)

<a id="constant-constant-mq3-client-ui-shared-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-shared-ml-1537697584"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L67)

<a id="constant-constant-mq3-client-ui-shared-k-mouse3-const-k-mouse3-180-src-mq3-client-ui-shared-ml-157370750"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = 180
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L68)

<a id="constant-constant-mq3-client-ui-shared-k-mouse4-const-k-mouse4-181-src-mq3-client-ui-shared-ml-1980115103"></a>
### K_MOUSE4

```ml
const K_MOUSE4 = 181
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L69)

<a id="constant-constant-mq3-client-ui-shared-k-pgdn-const-k-pgdn-141-src-mq3-client-ui-shared-ml-211826103"></a>
### K_PGDN

```ml
const K_PGDN = 141
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L57)

<a id="constant-constant-mq3-client-ui-shared-k-rightarrow-const-k-rightarrow-135-src-mq3-client-ui-shared-ml-17608660"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L52)

<a id="constant-constant-mq3-client-ui-shared-k-shift-const-k-shift-138-src-mq3-client-ui-shared-ml-969663235"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L55)

<a id="constant-constant-mq3-client-ui-shared-k-space-const-k-space-32-src-mq3-client-ui-shared-ml-1018321436"></a>
### K_SPACE

```ml
const K_SPACE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L47)

<a id="constant-constant-mq3-client-ui-shared-k-tab-const-k-tab-9-src-mq3-client-ui-shared-ml-258683312"></a>
### K_TAB

```ml
const K_TAB = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L44)

<a id="constant-constant-mq3-client-ui-shared-k-uparrow-const-k-uparrow-132-src-mq3-client-ui-shared-ml-349434085"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L49)

<a id="function-function-mq3-client-ui-shared-keytext-function-keytext-key-src-mq3-client-ui-shared-ml-128258621"></a>
### keyText

```ml
function keyText(key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L257)

<a id="function-function-mq3-client-ui-shared-keywordhash-add-function-keywordhash-add-table-key-src-mq3-client-ui-shared-ml-1269765545"></a>
### KeywordHash_Add

```ml
function KeywordHash_Add(table, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L338)

<a id="function-function-mq3-client-ui-shared-keywordhash-find-function-keywordhash-find-table-keyword-src-mq3-client-ui-shared-ml-24600831"></a>
### KeywordHash_Find

```ml
function KeywordHash_Find(table, keyword)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — |  |
| `keyword` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L339)

<a id="function-function-mq3-client-ui-shared-keywordhash-key-function-keywordhash-key-keyword-src-mq3-client-ui-shared-ml-978626451"></a>
### KeywordHash_Key

```ml
function KeywordHash_Key(keyword)
```

Keyword hash and declarative parsers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keyword` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L337)

<a id="function-function-mq3-client-ui-shared-lerpcolor-function-lerpcolor-a-b-t-src-mq3-client-ui-shared-ml-67991391"></a>
### LerpColor

```ml
function LerpColor(a, b, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L136)

<a id="constant-constant-mq3-client-ui-shared-max-editfield-const-max-editfield-256-src-mq3-client-ui-shared-ml-998947382"></a>
### MAX_EDITFIELD

```ml
const MAX_EDITFIELD = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L70)

<a id="constant-constant-mq3-client-ui-shared-max-menuitems-const-max-menuitems-96-src-mq3-client-ui-shared-ml-1971501354"></a>
### MAX_MENUITEMS

```ml
const MAX_MENUITEMS = 96
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L71)

<a id="constant-constant-mq3-client-ui-shared-max-menus-const-max-menus-64-src-mq3-client-ui-shared-ml-572637055"></a>
### MAX_MENUS

```ml
const MAX_MENUS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L72)

<a id="function-function-mq3-client-ui-shared-memory-function-memory-capacity-src-mq3-client-ui-shared-ml-825497194"></a>
### memory

```ml
function memory(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L93)

- [mq3.client.ui_shared.Memory](Type-mq3-client-ui-shared-memory-662869782.md) — struct
<a id="function-function-mq3-client-ui-shared-menu-function-menu-src-mq3-client-ui-shared-ml-1628358782"></a>
### menu

```ml
function menu()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L91)

- [mq3.client.ui_shared.Menu](Type-mq3-client-ui-shared-menu-1007668034.md) — struct
<a id="function-function-mq3-client-ui-shared-menu-cachecontents-function-menu-cachecontents-dc-value-src-mq3-client-ui-shared-ml-646464950"></a>
### Menu_CacheContents

```ml
function Menu_CacheContents(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L297)

<a id="function-function-mq3-client-ui-shared-menu-clearfocus-function-menu-clearfocus-value-src-mq3-client-ui-shared-ml-1065973869"></a>
### Menu_ClearFocus

```ml
function Menu_ClearFocus(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L174)

<a id="function-function-mq3-client-ui-shared-menu-closecinematics-function-menu-closecinematics-dc-value-src-mq3-client-ui-shared-ml-681236446"></a>
### Menu_CloseCinematics

```ml
function Menu_CloseCinematics(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L226)

<a id="function-function-mq3-client-ui-shared-menu-count-function-menu-count-dc-src-mq3-client-ui-shared-ml-2036735461"></a>
### Menu_Count

```ml
function Menu_Count(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L224)

<a id="function-function-mq3-client-ui-shared-menu-fadeitembyname-function-menu-fadeitembyname-value-name-fadeout-src-mq3-client-ui-shared-ml-1161545800"></a>
### Menu_FadeItemByName

```ml
function Menu_FadeItemByName(value, name, fadeOut)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fadeOut` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L193)

<a id="function-function-mq3-client-ui-shared-menu-finditembyname-function-menu-finditembyname-value-name-src-mq3-client-ui-shared-ml-1448789518"></a>
### Menu_FindItemByName

```ml
function Menu_FindItemByName(value, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L172)

<a id="function-function-mq3-client-ui-shared-menu-getfocused-function-menu-getfocused-dc-src-mq3-client-ui-shared-ml-1134986895"></a>
### Menu_GetFocused

```ml
function Menu_GetFocused(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L182)

<a id="function-function-mq3-client-ui-shared-menu-getfocuseditem-function-menu-getfocuseditem-value-src-mq3-client-ui-shared-ml-2069598947"></a>
### Menu_GetFocusedItem

```ml
function Menu_GetFocusedItem(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L181)

<a id="function-function-mq3-client-ui-shared-menu-getmatchingitembynumber-function-menu-getmatchingitembynumber-value-index-name-src-mq3-client-ui-shared-ml-279249170"></a>
### Menu_GetMatchingItemByNumber

```ml
function Menu_GetMatchingItemByNumber(value, index, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L171)

<a id="function-function-mq3-client-ui-shared-menu-handlekey-function-menu-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-1531759733"></a>
### Menu_HandleKey

```ml
function Menu_HandleKey(dc, value, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L314)

<a id="function-function-mq3-client-ui-shared-menu-handlemousemove-function-menu-handlemousemove-dc-value-x-y-src-mq3-client-ui-shared-ml-770755295"></a>
### Menu_HandleMouseMove

```ml
function Menu_HandleMouseMove(dc, value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L315)

<a id="function-function-mq3-client-ui-shared-menu-hittest-function-menu-hittest-value-x-y-src-mq3-client-ui-shared-ml-568638034"></a>
### Menu_HitTest

```ml
function Menu_HitTest(value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L179)

<a id="function-function-mq3-client-ui-shared-menu-init-function-menu-init-value-src-mq3-client-ui-shared-ml-2104435603"></a>
### Menu_Init

```ml
function Menu_Init(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L159)

<a id="function-function-mq3-client-ui-shared-menu-itemsmatchinggroup-function-menu-itemsmatchinggroup-value-name-src-mq3-client-ui-shared-ml-1951874650"></a>
### Menu_ItemsMatchingGroup

```ml
function Menu_ItemsMatchingGroup(value, name)
```

Menu/item lookup, visibility and focus.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L170)

<a id="function-function-mq3-client-ui-shared-menu-new-function-menu-new-dc-handle-src-mq3-client-ui-shared-ml-1245998727"></a>
### Menu_New

```ml
function Menu_New(dc, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L378)

<a id="function-function-mq3-client-ui-shared-menu-orbititembyname-function-menu-orbititembyname-value-name-x-y-cx-cy-time-src-mq3-client-ui-shared-ml-280419397"></a>
### Menu_OrbitItemByName

```ml
function Menu_OrbitItemByName(value, name, x, y, cx, cy, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `cx` | `dynamic` | — |  |
| `cy` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L203)

<a id="function-function-mq3-client-ui-shared-menu-overactiveitem-function-menu-overactiveitem-value-x-y-src-mq3-client-ui-shared-ml-464577816"></a>
### Menu_OverActiveItem

```ml
function Menu_OverActiveItem(value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L180)

<a id="function-function-mq3-client-ui-shared-menu-paint-function-menu-paint-dc-value-forcepaint-src-mq3-client-ui-shared-ml-1007484301"></a>
### Menu_Paint

```ml
function Menu_Paint(dc, value, forcePaint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `forcePaint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L295)

<a id="function-function-mq3-client-ui-shared-menu-paintall-function-menu-paintall-dc-src-mq3-client-ui-shared-ml-960271719"></a>
### Menu_PaintAll

```ml
function Menu_PaintAll(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L296)

<a id="function-function-mq3-client-ui-shared-menu-parse-function-menu-parse-handle-value-src-mq3-client-ui-shared-ml-113959373"></a>
### Menu_Parse

```ml
function Menu_Parse(handle, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L377)

<a id="function-function-mq3-client-ui-shared-menu-postparse-function-menu-postparse-value-src-mq3-client-ui-shared-ml-1012526267"></a>
### Menu_PostParse

```ml
function Menu_PostParse(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L165)

<a id="function-function-mq3-client-ui-shared-menu-reset-function-menu-reset-dc-src-mq3-client-ui-shared-ml-2012079125"></a>
### Menu_Reset

```ml
function Menu_Reset(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L225)

<a id="function-function-mq3-client-ui-shared-menu-runclosescript-function-menu-runclosescript-dc-value-src-mq3-client-ui-shared-ml-1367755454"></a>
### Menu_RunCloseScript

```ml
function Menu_RunCloseScript(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L218)

<a id="function-function-mq3-client-ui-shared-menu-scrollfeeder-function-menu-scrollfeeder-dc-value-feeder-down-src-mq3-client-ui-shared-ml-11274723"></a>
### Menu_ScrollFeeder

```ml
function Menu_ScrollFeeder(dc, value, feeder, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `feeder` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L333)

<a id="function-function-mq3-client-ui-shared-menu-setfeederselection-function-menu-setfeederselection-dc-value-feeder-index-name-src-mq3-client-ui-shared-ml-967381764"></a>
### Menu_SetFeederSelection

```ml
function Menu_SetFeederSelection(dc, value, feeder, index, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `feeder` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L334)

<a id="function-function-mq3-client-ui-shared-menu-setnextcursoritem-function-menu-setnextcursoritem-value-src-mq3-client-ui-shared-ml-1644874703"></a>
### Menu_SetNextCursorItem

```ml
function Menu_SetNextCursorItem(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L313)

<a id="function-function-mq3-client-ui-shared-menu-setprevcursoritem-function-menu-setprevcursoritem-value-src-mq3-client-ui-shared-ml-649778147"></a>
### Menu_SetPrevCursorItem

```ml
function Menu_SetPrevCursorItem(value)
```

Keyboard, mouse and display capture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L312)

<a id="function-function-mq3-client-ui-shared-menu-setupkeywordhash-function-menu-setupkeywordhash-src-mq3-client-ui-shared-ml-95864214"></a>
### Menu_SetupKeywordHash

```ml
function Menu_SetupKeywordHash()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L341)

<a id="function-function-mq3-client-ui-shared-menu-showitembyname-function-menu-showitembyname-value-name-show-src-mq3-client-ui-shared-ml-826327681"></a>
### Menu_ShowItemByName

```ml
function Menu_ShowItemByName(value, name, show)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `show` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L192)

<a id="function-function-mq3-client-ui-shared-menu-transitionitembyname-function-menu-transitionitembyname-value-name-fromrect-torect-time-amount-src-mq3-client-ui-shared-ml-1563927458"></a>
### Menu_TransitionItemByName

```ml
function Menu_TransitionItemByName(value, name, fromRect, toRect, time, amount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fromRect` | `dynamic` | — |  |
| `toRect` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L201)

<a id="function-function-mq3-client-ui-shared-menu-updateposition-function-menu-updateposition-value-src-mq3-client-ui-shared-ml-786867687"></a>
### Menu_UpdatePosition

```ml
function Menu_UpdatePosition(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L164)

<a id="function-function-mq3-client-ui-shared-menukeywords-function-menukeywords-src-mq3-client-ui-shared-ml-184041358"></a>
### menuKeywords

```ml
function menuKeywords()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L376)

<a id="function-function-mq3-client-ui-shared-menuparse-backcolor-function-menuparse-backcolor-value-handle-src-mq3-client-ui-shared-ml-447069075"></a>
### MenuParse_backcolor

```ml
function MenuParse_backcolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L460)

<a id="function-function-mq3-client-ui-shared-menuparse-background-function-menuparse-background-value-handle-src-mq3-client-ui-shared-ml-1914331233"></a>
### MenuParse_background

```ml
function MenuParse_background(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L466)

<a id="function-function-mq3-client-ui-shared-menuparse-border-function-menuparse-border-value-handle-src-mq3-client-ui-shared-ml-2031599517"></a>
### MenuParse_border

```ml
function MenuParse_border(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L458)

<a id="function-function-mq3-client-ui-shared-menuparse-bordercolor-function-menuparse-bordercolor-value-handle-src-mq3-client-ui-shared-ml-741626721"></a>
### MenuParse_bordercolor

```ml
function MenuParse_bordercolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L462)

<a id="function-function-mq3-client-ui-shared-menuparse-bordersize-function-menuparse-bordersize-value-handle-src-mq3-client-ui-shared-ml-1008170253"></a>
### MenuParse_borderSize

```ml
function MenuParse_borderSize(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L459)

<a id="function-function-mq3-client-ui-shared-menuparse-cinematic-function-menuparse-cinematic-value-handle-src-mq3-client-ui-shared-ml-800784753"></a>
### MenuParse_cinematic

```ml
function MenuParse_cinematic(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L467)

<a id="function-function-mq3-client-ui-shared-menuparse-disablecolor-function-menuparse-disablecolor-value-handle-src-mq3-client-ui-shared-ml-355065029"></a>
### MenuParse_disablecolor

```ml
function MenuParse_disablecolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L464)

<a id="function-function-mq3-client-ui-shared-menuparse-fadeamount-function-menuparse-fadeamount-value-handle-src-mq3-client-ui-shared-ml-247809773"></a>
### MenuParse_fadeAmount

```ml
function MenuParse_fadeAmount(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L474)

<a id="function-function-mq3-client-ui-shared-menuparse-fadeclamp-function-menuparse-fadeclamp-value-handle-src-mq3-client-ui-shared-ml-584872305"></a>
### MenuParse_fadeClamp

```ml
function MenuParse_fadeClamp(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L473)

<a id="function-function-mq3-client-ui-shared-menuparse-fadecycle-function-menuparse-fadecycle-value-handle-src-mq3-client-ui-shared-ml-356174711"></a>
### MenuParse_fadeCycle

```ml
function MenuParse_fadeCycle(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L475)

<a id="function-function-mq3-client-ui-shared-menuparse-focuscolor-function-menuparse-focuscolor-value-handle-src-mq3-client-ui-shared-ml-1323773"></a>
### MenuParse_focuscolor

```ml
function MenuParse_focuscolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L463)

<a id="function-function-mq3-client-ui-shared-menuparse-font-function-menuparse-font-value-handle-src-mq3-client-ui-shared-ml-168048881"></a>
### MenuParse_font

```ml
function MenuParse_font(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L449)

<a id="function-function-mq3-client-ui-shared-menuparse-forecolor-function-menuparse-forecolor-value-handle-src-mq3-client-ui-shared-ml-1407130673"></a>
### MenuParse_forecolor

```ml
function MenuParse_forecolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L461)

<a id="function-function-mq3-client-ui-shared-menuparse-fullscreen-function-menuparse-fullscreen-value-handle-src-mq3-client-ui-shared-ml-1314801761"></a>
### MenuParse_fullscreen

```ml
function MenuParse_fullscreen(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L451)

<a id="function-function-mq3-client-ui-shared-menuparse-itemdef-function-menuparse-itemdef-value-handle-src-mq3-client-ui-shared-ml-203377791"></a>
### MenuParse_itemDef

```ml
function MenuParse_itemDef(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L476)

<a id="function-function-mq3-client-ui-shared-menuparse-name-function-menuparse-name-value-handle-src-mq3-client-ui-shared-ml-1099027001"></a>
### MenuParse_name

```ml
function MenuParse_name(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L450)

<a id="function-function-mq3-client-ui-shared-menuparse-onclose-function-menuparse-onclose-value-handle-src-mq3-client-ui-shared-ml-1914959869"></a>
### MenuParse_onClose

```ml
function MenuParse_onClose(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L456)

<a id="function-function-mq3-client-ui-shared-menuparse-onesc-function-menuparse-onesc-value-handle-src-mq3-client-ui-shared-ml-1134661711"></a>
### MenuParse_onESC

```ml
function MenuParse_onESC(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L457)

<a id="function-function-mq3-client-ui-shared-menuparse-onopen-function-menuparse-onopen-value-handle-src-mq3-client-ui-shared-ml-1309051617"></a>
### MenuParse_onOpen

```ml
function MenuParse_onOpen(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L455)

<a id="function-function-mq3-client-ui-shared-menuparse-outlinecolor-function-menuparse-outlinecolor-value-handle-src-mq3-client-ui-shared-ml-526445233"></a>
### MenuParse_outlinecolor

```ml
function MenuParse_outlinecolor(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L465)

<a id="function-function-mq3-client-ui-shared-menuparse-outofbounds-function-menuparse-outofbounds-value-handle-src-mq3-client-ui-shared-ml-1453626239"></a>
### MenuParse_outOfBounds

```ml
function MenuParse_outOfBounds(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L471)

<a id="function-function-mq3-client-ui-shared-menuparse-ownerdraw-function-menuparse-ownerdraw-value-handle-src-mq3-client-ui-shared-ml-1597756081"></a>
### MenuParse_ownerdraw

```ml
function MenuParse_ownerdraw(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L469)

<a id="function-function-mq3-client-ui-shared-menuparse-ownerdrawflag-function-menuparse-ownerdrawflag-value-handle-src-mq3-client-ui-shared-ml-99977689"></a>
### MenuParse_ownerdrawFlag

```ml
function MenuParse_ownerdrawFlag(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L468)

<a id="function-function-mq3-client-ui-shared-menuparse-popup-function-menuparse-popup-value-handle-src-mq3-client-ui-shared-ml-2138620787"></a>
### MenuParse_popup

```ml
function MenuParse_popup(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L470)

<a id="function-function-mq3-client-ui-shared-menuparse-rect-function-menuparse-rect-value-handle-src-mq3-client-ui-shared-ml-962571909"></a>
### MenuParse_rect

```ml
function MenuParse_rect(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L452)

<a id="function-function-mq3-client-ui-shared-menuparse-soundloop-function-menuparse-soundloop-value-handle-src-mq3-client-ui-shared-ml-1519411929"></a>
### MenuParse_soundLoop

```ml
function MenuParse_soundLoop(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L472)

<a id="function-function-mq3-client-ui-shared-menuparse-style-function-menuparse-style-value-handle-src-mq3-client-ui-shared-ml-856592457"></a>
### MenuParse_style

```ml
function MenuParse_style(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L453)

<a id="function-function-mq3-client-ui-shared-menuparse-visible-function-menuparse-visible-value-handle-src-mq3-client-ui-shared-ml-822144439"></a>
### MenuParse_visible

```ml
function MenuParse_visible(value, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L454)

<a id="function-function-mq3-client-ui-shared-menuparsekind-function-menuparsekind-value-handle-key-kind-src-mq3-client-ui-shared-ml-539905710"></a>
### menuParseKind

```ml
function menuParseKind(value, handle, key, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L375)

<a id="function-function-mq3-client-ui-shared-menus-activate-function-menus-activate-dc-value-src-mq3-client-ui-shared-ml-1310567838"></a>
### Menus_Activate

```ml
function Menus_Activate(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L221)

<a id="function-function-mq3-client-ui-shared-menus-activatebyname-function-menus-activatebyname-dc-name-src-mq3-client-ui-shared-ml-312325420"></a>
### Menus_ActivateByName

```ml
function Menus_ActivateByName(dc, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L222)

<a id="function-function-mq3-client-ui-shared-menus-anyfullscreenvisible-function-menus-anyfullscreenvisible-dc-src-mq3-client-ui-shared-ml-857006585"></a>
### Menus_AnyFullScreenVisible

```ml
function Menus_AnyFullScreenVisible(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L223)

<a id="function-function-mq3-client-ui-shared-menus-closeall-function-menus-closeall-dc-src-mq3-client-ui-shared-ml-303944097"></a>
### Menus_CloseAll

```ml
function Menus_CloseAll(dc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L220)

<a id="function-function-mq3-client-ui-shared-menus-closebyname-function-menus-closebyname-dc-name-src-mq3-client-ui-shared-ml-1895165850"></a>
### Menus_CloseByName

```ml
function Menus_CloseByName(dc, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L219)

<a id="function-function-mq3-client-ui-shared-menus-findbyname-function-menus-findbyname-dc-name-src-mq3-client-ui-shared-ml-440048276"></a>
### Menus_FindByName

```ml
function Menus_FindByName(dc, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L173)

<a id="function-function-mq3-client-ui-shared-menus-handleoobclick-function-menus-handleoobclick-dc-value-key-down-src-mq3-client-ui-shared-ml-1160875229"></a>
### Menus_HandleOOBClick

```ml
function Menus_HandleOOBClick(dc, value, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L327)

<a id="function-function-mq3-client-ui-shared-menus-openbyname-function-menus-openbyname-dc-name-src-mq3-client-ui-shared-ml-1414316996"></a>
### Menus_OpenByName

```ml
function Menus_OpenByName(dc, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L217)

<a id="function-function-mq3-client-ui-shared-menus-showbyname-function-menus-showbyname-dc-name-src-mq3-client-ui-shared-ml-1947413548"></a>
### Menus_ShowByName

```ml
function Menus_ShowByName(dc, name)
```

Menu lifecycle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L216)

<a id="function-function-mq3-client-ui-shared-movecomponent-function-movecomponent-current-target-step-src-mq3-client-ui-shared-ml-277971346"></a>
### moveComponent

```ml
function moveComponent(current, target, step)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `step` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L283)

<a id="function-function-mq3-client-ui-shared-next-function-next-source-src-mq3-client-ui-shared-ml-1027390733"></a>
### next

```ml
function next(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L101)

<a id="function-function-mq3-client-ui-shared-painttext-function-painttext-dc-value-text-kind-src-mq3-client-ui-shared-ml-404212227"></a>
### paintText

```ml
function paintText(dc, value, text, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L270)

<a id="function-function-mq3-client-ui-shared-pairget-function-pairget-pairs-key-otherwise-src-mq3-client-ui-shared-ml-1088856174"></a>
### pairGet

```ml
function pairGet(pairs, key, otherwise)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `otherwise` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L99)

<a id="function-function-mq3-client-ui-shared-pairset-function-pairset-pairs-key-value-src-mq3-client-ui-shared-ml-211438399"></a>
### pairSet

```ml
function pairSet(pairs, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L100)

<a id="function-function-mq3-client-ui-shared-parsecvargate-function-parsecvargate-value-handle-key-flag-src-mq3-client-ui-shared-ml-958948090"></a>
### parseCvarGate

```ml
function parseCvarGate(value, handle, key, flag)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `flag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L443)

<a id="function-function-mq3-client-ui-shared-parseitem-function-parseitem-value-handle-key-kind-src-mq3-client-ui-shared-ml-462598102"></a>
### parseItem

```ml
function parseItem(value, handle, key, kind)
```

Parse-entry wrappers retain the original public symbol surface.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L381)

<a id="function-function-mq3-client-ui-shared-parselist-function-parselist-value-handle-floatvalues-src-mq3-client-ui-shared-ml-1354686791"></a>
### parseList

```ml
function parseList(value, handle, floatValues)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `floatValues` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L438)

<a id="function-function-mq3-client-ui-shared-parsemenu-function-parsemenu-value-handle-key-kind-src-mq3-client-ui-shared-ml-1177033262"></a>
### parseMenu

```ml
function parseMenu(value, handle, key, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L382)

<a id="function-function-mq3-client-ui-shared-pc-color-parse-function-pc-color-parse-handle-src-mq3-client-ui-shared-ml-1082724388"></a>
### PC_Color_Parse

```ml
function PC_Color_Parse(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L121)

<a id="function-function-mq3-client-ui-shared-pc-float-parse-function-pc-float-parse-handle-src-mq3-client-ui-shared-ml-1017356464"></a>
### PC_Float_Parse

```ml
function PC_Float_Parse(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L119)

<a id="function-function-mq3-client-ui-shared-pc-int-parse-function-pc-int-parse-handle-src-mq3-client-ui-shared-ml-740338820"></a>
### PC_Int_Parse

```ml
function PC_Int_Parse(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L120)

<a id="function-function-mq3-client-ui-shared-pc-rect-parse-function-pc-rect-parse-handle-src-mq3-client-ui-shared-ml-1950185848"></a>
### PC_Rect_Parse

```ml
function PC_Rect_Parse(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L122)

<a id="function-function-mq3-client-ui-shared-pc-script-parse-function-pc-script-parse-handle-src-mq3-client-ui-shared-ml-757369126"></a>
### PC_Script_Parse

```ml
function PC_Script_Parse(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L124)

<a id="function-function-mq3-client-ui-shared-pc-sourceerror-function-pc-sourceerror-handle-message-src-mq3-client-ui-shared-ml-1029010795"></a>
### PC_SourceError

```ml
function PC_SourceError(handle, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L126)

<a id="function-function-mq3-client-ui-shared-pc-sourcewarning-function-pc-sourcewarning-handle-message-src-mq3-client-ui-shared-ml-176254687"></a>
### PC_SourceWarning

```ml
function PC_SourceWarning(handle, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L125)

<a id="function-function-mq3-client-ui-shared-pc-string-parse-function-pc-string-parse-handle-src-mq3-client-ui-shared-ml-360669846"></a>
### PC_String_Parse

```ml
function PC_String_Parse(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L123)

<a id="function-function-mq3-client-ui-shared-putitem-function-putitem-value-key-data-src-mq3-client-ui-shared-ml-940877522"></a>
### putItem

```ml
function putItem(value, key, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L342)

<a id="function-function-mq3-client-ui-shared-putmenu-function-putmenu-value-key-data-src-mq3-client-ui-shared-ml-461218470"></a>
### putMenu

```ml
function putMenu(value, key, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L374)

<a id="function-function-mq3-client-ui-shared-rect-function-rect-x-y-w-h-src-mq3-client-ui-shared-ml-1362310986"></a>
### rect

```ml
function rect(x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L86)

- [mq3.client.ui_shared.Rect](Type-mq3-client-ui-shared-rect-1995140079.md) — struct
<a id="function-function-mq3-client-ui-shared-rect-containspoint-function-rect-containspoint-value-x-y-src-mq3-client-ui-shared-ml-1775096458"></a>
### Rect_ContainsPoint

```ml
function Rect_ContainsPoint(value, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L131)

<a id="function-function-mq3-client-ui-shared-rect-parse-function-rect-parse-source-src-mq3-client-ui-shared-ml-733439697"></a>
### Rect_Parse

```ml
function Rect_Parse(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L117)

<a id="function-function-mq3-client-ui-shared-rect-towindowcoords-function-rect-towindowcoords-value-window-src-mq3-client-ui-shared-ml-1719557759"></a>
### Rect_ToWindowCoords

```ml
function Rect_ToWindowCoords(value, window)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `window` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L134)

<a id="function-function-mq3-client-ui-shared-same-function-same-a-b-src-mq3-client-ui-shared-ml-243397819"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L96)

<a id="function-function-mq3-client-ui-shared-script-close-function-script-close-dc-value-args-src-mq3-client-ui-shared-ml-269363745"></a>
### Script_Close

```ml
function Script_Close(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L200)

<a id="function-function-mq3-client-ui-shared-script-conditionalopen-function-script-conditionalopen-dc-value-args-src-mq3-client-ui-shared-ml-1789939193"></a>
### Script_ConditionalOpen

```ml
function Script_ConditionalOpen(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L199)

<a id="function-function-mq3-client-ui-shared-script-exec-function-script-exec-dc-value-args-src-mq3-client-ui-shared-ml-799721799"></a>
### Script_Exec

```ml
function Script_Exec(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L209)

<a id="function-function-mq3-client-ui-shared-script-fadein-function-script-fadein-dc-value-args-src-mq3-client-ui-shared-ml-814785479"></a>
### Script_FadeIn

```ml
function Script_FadeIn(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L196)

<a id="function-function-mq3-client-ui-shared-script-fadeout-function-script-fadeout-dc-value-args-src-mq3-client-ui-shared-ml-725848561"></a>
### Script_FadeOut

```ml
function Script_FadeOut(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L197)

<a id="function-function-mq3-client-ui-shared-script-hide-function-script-hide-dc-value-args-src-mq3-client-ui-shared-ml-2041907497"></a>
### Script_Hide

```ml
function Script_Hide(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L195)

<a id="function-function-mq3-client-ui-shared-script-open-function-script-open-dc-value-args-src-mq3-client-ui-shared-ml-1262549697"></a>
### Script_Open

```ml
function Script_Open(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L198)

<a id="function-function-mq3-client-ui-shared-script-orbit-function-script-orbit-dc-value-args-src-mq3-client-ui-shared-ml-848533553"></a>
### Script_Orbit

```ml
function Script_Orbit(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L204)

<a id="function-function-mq3-client-ui-shared-script-play-function-script-play-dc-value-args-src-mq3-client-ui-shared-ml-1561009873"></a>
### Script_Play

```ml
function Script_Play(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L210)

<a id="function-function-mq3-client-ui-shared-script-playlooped-function-script-playlooped-dc-value-args-src-mq3-client-ui-shared-ml-477911583"></a>
### Script_playLooped

```ml
function Script_playLooped(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L211)

<a id="function-function-mq3-client-ui-shared-script-setasset-function-script-setasset-dc-value-args-src-mq3-client-ui-shared-ml-756560905"></a>
### Script_SetAsset

```ml
function Script_SetAsset(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L188)

<a id="function-function-mq3-client-ui-shared-script-setbackground-function-script-setbackground-dc-value-args-src-mq3-client-ui-shared-ml-204599461"></a>
### Script_SetBackground

```ml
function Script_SetBackground(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L189)

<a id="function-function-mq3-client-ui-shared-script-setcolor-function-script-setcolor-dc-value-args-src-mq3-client-ui-shared-ml-42536475"></a>
### Script_SetColor

```ml
function Script_SetColor(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L187)

<a id="function-function-mq3-client-ui-shared-script-setcvar-function-script-setcvar-dc-value-args-src-mq3-client-ui-shared-ml-1934108297"></a>
### Script_SetCvar

```ml
function Script_SetCvar(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L208)

<a id="function-function-mq3-client-ui-shared-script-setfocus-function-script-setfocus-dc-value-args-src-mq3-client-ui-shared-ml-386012945"></a>
### Script_SetFocus

```ml
function Script_SetFocus(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L205)

<a id="function-function-mq3-client-ui-shared-script-setitemcolor-function-script-setitemcolor-dc-value-args-src-mq3-client-ui-shared-ml-1767521797"></a>
### Script_SetItemColor

```ml
function Script_SetItemColor(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L191)

<a id="function-function-mq3-client-ui-shared-script-setplayerhead-function-script-setplayerhead-dc-value-args-src-mq3-client-ui-shared-ml-921709761"></a>
### Script_SetPlayerHead

```ml
function Script_SetPlayerHead(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L207)

<a id="function-function-mq3-client-ui-shared-script-setplayermodel-function-script-setplayermodel-dc-value-args-src-mq3-client-ui-shared-ml-1502511709"></a>
### Script_SetPlayerModel

```ml
function Script_SetPlayerModel(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L206)

<a id="function-function-mq3-client-ui-shared-script-setteamcolor-function-script-setteamcolor-dc-value-args-src-mq3-client-ui-shared-ml-1373914201"></a>
### Script_SetTeamColor

```ml
function Script_SetTeamColor(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L190)

<a id="function-function-mq3-client-ui-shared-script-show-function-script-show-dc-value-args-src-mq3-client-ui-shared-ml-1399271031"></a>
### Script_Show

```ml
function Script_Show(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L194)

<a id="function-function-mq3-client-ui-shared-script-transition-function-script-transition-dc-value-args-src-mq3-client-ui-shared-ml-679360015"></a>
### Script_Transition

```ml
function Script_Transition(dc, value, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L202)

<a id="function-function-mq3-client-ui-shared-scriptargs-function-scriptargs-text-src-mq3-client-ui-shared-ml-1642464995"></a>
### scriptArgs

```ml
function scriptArgs(text)
```

Scripts.  Tokenization and command dispatch mirror the original command table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L185)

<a id="function-function-mq3-client-ui-shared-scriptvalue-function-scriptvalue-args-src-mq3-client-ui-shared-ml-705442445"></a>
### scriptValue

```ml
function scriptValue(args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L186)

<a id="function-function-mq3-client-ui-shared-scroll-listbox-autofunc-function-scroll-listbox-autofunc-dc-value-src-mq3-client-ui-shared-ml-816225324"></a>
### Scroll_ListBox_AutoFunc

```ml
function Scroll_ListBox_AutoFunc(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L264)

<a id="function-function-mq3-client-ui-shared-scroll-listbox-thumbfunc-function-scroll-listbox-thumbfunc-dc-value-src-mq3-client-ui-shared-ml-1884993950"></a>
### Scroll_ListBox_ThumbFunc

```ml
function Scroll_ListBox_ThumbFunc(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L265)

<a id="function-function-mq3-client-ui-shared-scroll-slider-thumbfunc-function-scroll-slider-thumbfunc-dc-value-src-mq3-client-ui-shared-ml-1761504174"></a>
### Scroll_Slider_ThumbFunc

```ml
function Scroll_Slider_ThumbFunc(dc, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L266)

<a id="constant-constant-mq3-client-ui-shared-scrollbar-size-const-scrollbar-size-16-src-mq3-client-ui-shared-ml-2139956814"></a>
### SCROLLBAR_SIZE

```ml
const SCROLLBAR_SIZE = 16.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L73)

<a id="function-function-mq3-client-ui-shared-source-function-source-text-name-src-mq3-client-ui-shared-ml-380555870"></a>
### source

```ml
function source(text, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L92)

- [mq3.client.ui_shared.Source](Type-mq3-client-ui-shared-source-600485040.md) — struct
<a id="function-function-mq3-client-ui-shared-string-alloc-function-string-alloc-state-value-src-mq3-client-ui-shared-ml-1201815704"></a>
### String_Alloc

```ml
function String_Alloc(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L108)

<a id="function-function-mq3-client-ui-shared-string-init-function-string-init-state-src-mq3-client-ui-shared-ml-209605243"></a>
### String_Init

```ml
function String_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L110)

<a id="function-function-mq3-client-ui-shared-string-parse-function-string-parse-source-src-mq3-client-ui-shared-ml-798225157"></a>
### String_Parse

```ml
function String_Parse(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L118)

<a id="function-function-mq3-client-ui-shared-string-report-function-string-report-state-src-mq3-client-ui-shared-ml-693613811"></a>
### String_Report

```ml
function String_Report(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L109)

<a id="function-function-mq3-client-ui-shared-structure-function-structure-name-size-fields-src-mq3-client-ui-shared-ml-1602652537"></a>
### structure

```ml
function structure(name, size, fields)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `fields` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L111)

<a id="function-function-mq3-client-ui-shared-textpart-function-textpart-text-start-count-src-mq3-client-ui-shared-ml-153237310"></a>
### textPart

```ml
function textPart(text, start, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L256)

<a id="function-function-mq3-client-ui-shared-towindowcoords-function-towindowcoords-point-window-src-mq3-client-ui-shared-ml-4300678"></a>
### ToWindowCoords

```ml
function ToWindowCoords(point, window)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `window` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L133)

<a id="function-function-mq3-client-ui-shared-typedata-function-typedata-src-mq3-client-ui-shared-ml-1572909954"></a>
### typeData

```ml
function typeData()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L89)

- [mq3.client.ui_shared.TypeData](Type-mq3-client-ui-shared-typedata-1209231461.md) — struct
<a id="function-function-mq3-client-ui-shared-ui-alloc-function-ui-alloc-state-size-src-mq3-client-ui-shared-ml-1099347784"></a>
### UI_Alloc

```ml
function UI_Alloc(state, size)
```

UI memory and interned strings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L104)

<a id="function-function-mq3-client-ui-shared-ui-initmemory-function-ui-initmemory-state-src-mq3-client-ui-shared-ml-793057379"></a>
### UI_InitMemory

```ml
function UI_InitMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L105)

<a id="function-function-mq3-client-ui-shared-ui-outofmemory-function-ui-outofmemory-state-src-mq3-client-ui-shared-ml-76328251"></a>
### UI_OutOfMemory

```ml
function UI_OutOfMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L106)

<a id="function-function-mq3-client-ui-shared-window-function-window-src-mq3-client-ui-shared-ml-849991354"></a>
### window

```ml
function window()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L88)

- [mq3.client.ui_shared.Window](Type-mq3-client-ui-shared-window-307264949.md) — struct
<a id="function-function-mq3-client-ui-shared-window-cachecontents-function-window-cachecontents-dc-w-src-mq3-client-ui-shared-ml-551801158"></a>
### Window_CacheContents

```ml
function Window_CacheContents(dc, w)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L155)

<a id="function-function-mq3-client-ui-shared-window-closecinematic-function-window-closecinematic-dc-w-src-mq3-client-ui-shared-ml-1579220530"></a>
### Window_CloseCinematic

```ml
function Window_CloseCinematic(dc, w)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L154)

<a id="constant-constant-mq3-client-ui-shared-window-decoration-const-window-decoration-16-src-mq3-client-ui-shared-ml-1921397066"></a>
### WINDOW_DECORATION

```ml
const WINDOW_DECORATION = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L16)

<a id="constant-constant-mq3-client-ui-shared-window-fadingin-const-window-fadingin-64-src-mq3-client-ui-shared-ml-377281611"></a>
### WINDOW_FADINGIN

```ml
const WINDOW_FADINGIN = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L18)

<a id="constant-constant-mq3-client-ui-shared-window-fadingout-const-window-fadingout-32-src-mq3-client-ui-shared-ml-1801246518"></a>
### WINDOW_FADINGOUT

```ml
const WINDOW_FADINGOUT = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L17)

<a id="constant-constant-mq3-client-ui-shared-window-forecolorset-const-window-forecolorset-512-src-mq3-client-ui-shared-ml-212445999"></a>
### WINDOW_FORECOLORSET

```ml
const WINDOW_FORECOLORSET = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L21)

<a id="constant-constant-mq3-client-ui-shared-window-hasfocus-const-window-hasfocus-2-src-mq3-client-ui-shared-ml-846900785"></a>
### WINDOW_HASFOCUS

```ml
const WINDOW_HASFOCUS = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L15)

<a id="constant-constant-mq3-client-ui-shared-window-horizontal-const-window-horizontal-1024-src-mq3-client-ui-shared-ml-771198182"></a>
### WINDOW_HORIZONTAL

```ml
const WINDOW_HORIZONTAL = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L22)

<a id="constant-constant-mq3-client-ui-shared-window-intransition-const-window-intransition-256-src-mq3-client-ui-shared-ml-1648824510"></a>
### WINDOW_INTRANSITION

```ml
const WINDOW_INTRANSITION = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L20)

<a id="constant-constant-mq3-client-ui-shared-window-mouseover-const-window-mouseover-1-src-mq3-client-ui-shared-ml-670890194"></a>
### WINDOW_MOUSEOVER

```ml
const WINDOW_MOUSEOVER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L14)

<a id="constant-constant-mq3-client-ui-shared-window-mouseovertext-const-window-mouseovertext-128-src-mq3-client-ui-shared-ml-945718514"></a>
### WINDOW_MOUSEOVERTEXT

```ml
const WINDOW_MOUSEOVERTEXT = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L19)

<a id="constant-constant-mq3-client-ui-shared-window-orbiting-const-window-orbiting-65536-src-mq3-client-ui-shared-ml-1640851546"></a>
### WINDOW_ORBITING

```ml
const WINDOW_ORBITING = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L23)

<a id="function-function-mq3-client-ui-shared-window-paint-function-window-paint-dc-w-fadeamount-fadeclamp-fadecycle-src-mq3-client-ui-shared-ml-359981721"></a>
### Window_Paint

```ml
function Window_Paint(dc, w, fadeAmount, fadeClamp, fadeCycle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `fadeAmount` | `dynamic` | — |  |
| `fadeClamp` | `dynamic` | — |  |
| `fadeCycle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L153)

<a id="constant-constant-mq3-client-ui-shared-window-visible-const-window-visible-4-src-mq3-client-ui-shared-ml-811605111"></a>
### WINDOW_VISIBLE

```ml
const WINDOW_VISIBLE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L13)
