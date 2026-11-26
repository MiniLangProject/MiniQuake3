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

Returns the absolute value used by UI shared, negating negative inputs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L485)

- [mq3.client.ui_shared.Action](Type-mq3-client-ui-shared-action-608828119.md) — struct
<a id="function-function-mq3-client-ui-shared-adjustfrom640-function-adjustfrom640-dc-value-src-mq3-client-ui-shared-ml-2127283568"></a>
### AdjustFrom640

```ml
function AdjustFrom640(dc, value)
```

Transforms a virtual 640-by-480 rectangle using display scale factors and the horizontal bias.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.scaleX`, `dc.bias`, `dc.scaleY`. |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`, `value[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L601)

<a id="function-function-mq3-client-ui-shared-bindingfromname-function-bindingfromname-dc-name-src-mq3-client-ui-shared-ml-1576290404"></a>
### BindingFromName

```ml
function BindingFromName(dc, name)
```

Calls `mq3.client.ui_shared.pairGet` from UI shared `BindingFromName`. The final path returns `"KEY"+str(key)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1181)

<a id="function-function-mq3-client-ui-shared-bindingidfromname-function-bindingidfromname-name-src-mq3-client-ui-shared-ml-1270561361"></a>
### BindingIDFromName

```ml
function BindingIDFromName(name)
```

Calls `mq3.client.ui_shared.bindingTable`, `mq3.client.ui_shared.same` from UI shared `BindingIDFromName`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1177)

<a id="function-function-mq3-client-ui-shared-bindingtable-function-bindingtable-src-mq3-client-ui-shared-ml-1646266950"></a>
### bindingTable

```ml
function bindingTable()
```

Bindings and defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1174)

<a id="function-function-mq3-client-ui-shared-clamp-function-clamp-value-low-high-src-mq3-client-ui-shared-ml-1578536751"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for UI shared.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L490)

<a id="function-function-mq3-client-ui-shared-color-function-color-r-g-b-a-src-mq3-client-ui-shared-ml-1374922726"></a>
### color

```ml
function color(r, g, b, a)
```

Creates a `mq3.client.ui_shared.Color` record. Assigns `r` from `r`, `g` from `g`, `b` from `b`, `a` from `a`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — | Value used to initialize `Color.r`. |
| `g` | `dynamic` | — | Value used to initialize `Color.g`. |
| `b` | `dynamic` | — | Value used to initialize `Color.b`. |
| `a` | `dynamic` | — | Value used to initialize `Color.a`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L451)

- [mq3.client.ui_shared.Color](Type-mq3-client-ui-shared-color-1363201088.md) — struct
<a id="function-function-mq3-client-ui-shared-color-parse-function-color-parse-source-src-mq3-client-ui-shared-ml-832303907"></a>
### Color_Parse

```ml
function Color_Parse(source)
```

Calls `mq3.client.ui_shared.next`, `mq3.compat.textnumbers.atof`, `mq3.client.ui_shared.color` from UI shared `Color_Parse`. The final path returns `color(values[0],values[1],values[2],values[3])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `for i=0 to 3 token=next(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L542)

<a id="function-function-mq3-client-ui-shared-commandhandler-function-commandhandler-name-src-mq3-client-ui-shared-ml-302252451"></a>
### commandHandler

```ml
function commandHandler(name)
```

Calls `mq3.client.ui_shared.same` from UI shared `commandHandler`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L883)

<a id="function-function-mq3-client-ui-shared-controls-getconfig-function-controls-getconfig-dc-src-mq3-client-ui-shared-ml-716748197"></a>
### Controls_GetConfig

```ml
function Controls_GetConfig(dc)
```

Reads `dc.bindings` for UI shared `Controls_GetConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1188)

<a id="function-function-mq3-client-ui-shared-controls-getkeyassignment-function-controls-getkeyassignment-dc-name-src-mq3-client-ui-shared-ml-438328798"></a>
### Controls_GetKeyAssignment

```ml
function Controls_GetKeyAssignment(dc, name)
```

Calls `mq3.client.ui_shared.pairGet` from UI shared `Controls_GetKeyAssignment`. The final path returns `[key,-1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1185)

<a id="function-function-mq3-client-ui-shared-controls-setconfig-function-controls-setconfig-dc-restart-src-mq3-client-ui-shared-ml-627888168"></a>
### Controls_SetConfig

```ml
function Controls_SetConfig(dc, restart)
```

Calls `mq3.client.ui_shared.emit` from UI shared `Controls_SetConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`. |
| `restart` | `dynamic` | — | Value used by `if restart then emit(dc,"command","execute","in_restart","append",0,void) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1195)

<a id="function-function-mq3-client-ui-shared-controls-setdefaults-function-controls-setdefaults-dc-src-mq3-client-ui-shared-ml-441380433"></a>
### Controls_SetDefaults

```ml
function Controls_SetDefaults(dc)
```

Updates `dc.bindings` during UI shared `Controls_SetDefaults`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1191)

<a id="constant-constant-mq3-client-ui-shared-cursor-arrow-const-cursor-arrow-2-src-mq3-client-ui-shared-ml-731531835"></a>
### CURSOR_ARROW

```ml
const CURSOR_ARROW = 2
```

Cursor-display value selecting the ordinary arrow pointer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L72)

<a id="constant-constant-mq3-client-ui-shared-cursor-none-const-cursor-none-1-src-mq3-client-ui-shared-ml-1015683024"></a>
### CURSOR_NONE

```ml
const CURSOR_NONE = 1
```

Cursor-display value selecting no visible pointer shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L70)

<a id="constant-constant-mq3-client-ui-shared-cursor-sizer-const-cursor-sizer-4-src-mq3-client-ui-shared-ml-621723401"></a>
### CURSOR_SIZER

```ml
const CURSOR_SIZER = 4
```

Cursor-display value selecting the resizing pointer shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L74)

<a id="function-function-mq3-client-ui-shared-display-function-display-retailactive-src-mq3-client-ui-shared-ml-1608388745"></a>
### display

```ml
function display(retailActive)
```

Creates a `mq3.client.ui_shared.Display` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `Display.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L469)

- [mq3.client.ui_shared.Display](Type-mq3-client-ui-shared-display-1222485597.md) — struct
<a id="function-function-mq3-client-ui-shared-display-cacheall-function-display-cacheall-dc-src-mq3-client-ui-shared-ml-1999780121"></a>
### Display_CacheAll

```ml
function Display_CacheAll(dc)
```

Calls `mq3.client.ui_shared.Menu_CacheContents` from UI shared `Display_CacheAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1171)

<a id="function-function-mq3-client-ui-shared-display-captureitem-function-display-captureitem-dc-x-y-src-mq3-client-ui-shared-ml-1870443688"></a>
### Display_CaptureItem

```ml
function Display_CaptureItem(dc, x, y)
```

Calls `mq3.client.ui_shared.IsVisible`, `mq3.client.ui_shared.Menu_HitTest` from UI shared `Display_CaptureItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Display_CaptureItem`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Display_CaptureItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1242)

<a id="function-function-mq3-client-ui-shared-display-closecinematics-function-display-closecinematics-dc-src-mq3-client-ui-shared-ml-449753443"></a>
### Display_CloseCinematics

```ml
function Display_CloseCinematics(dc)
```

Calls `mq3.client.ui_shared.Menu_CloseCinematics` from UI shared `Display_CloseCinematics`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L932)

<a id="function-function-mq3-client-ui-shared-display-cursortype-function-display-cursortype-dc-x-y-src-mq3-client-ui-shared-ml-123225656"></a>
### Display_CursorType

```ml
function Display_CursorType(dc, x, y)
```

Calls `mq3.client.ui_shared.Display_CaptureItem` from UI shared `Display_CursorType`. The final path returns `CURSOR_SIZER`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Display_CursorType`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Display_CursorType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1253)

<a id="function-function-mq3-client-ui-shared-display-getcontext-function-display-getcontext-dc-src-mq3-client-ui-shared-ml-2012866293"></a>
### Display_GetContext

```ml
function Display_GetContext(dc)
```

Reads `dc` for UI shared `Display_GetContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L581)

<a id="function-function-mq3-client-ui-shared-display-handlekey-function-display-handlekey-dc-key-down-x-y-src-mq3-client-ui-shared-ml-1230251697"></a>
### Display_HandleKey

```ml
function Display_HandleKey(dc, key, down, x, y)
```

Updates `dc.cursorx`, `dc.cursory` during UI shared `Display_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cursorx`, `dc.cursory`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |
| `x` | `dynamic` | — | Value assigned to `dc.cursorx`. |
| `y` | `dynamic` | — | Value assigned to `dc.cursory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1260)

<a id="function-function-mq3-client-ui-shared-display-keybindpending-function-display-keybindpending-dc-src-mq3-client-ui-shared-ml-1829964605"></a>
### Display_KeyBindPending

```ml
function Display_KeyBindPending(dc)
```

Reads `dc.keyBindPending` for UI shared `Display_KeyBindPending`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.keyBindPending`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1198)

<a id="function-function-mq3-client-ui-shared-display-mousemove-function-display-mousemove-dc-p-x-y-src-mq3-client-ui-shared-ml-573252638"></a>
### Display_MouseMove

```ml
function Display_MouseMove(dc, p, x, y)
```

Updates `dc.cursorx`, `dc.cursory` during UI shared `Display_MouseMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cursorx`, `dc.cursory`. |
| `p` | `dynamic` | — | Accepted for compatibility with `Display_MouseMove`; the current implementation does not read it. |
| `x` | `dynamic` | — | Value assigned to `dc.cursorx`. |
| `y` | `dynamic` | — | Value assigned to `dc.cursory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1248)

<a id="function-function-mq3-client-ui-shared-display-visiblemenucount-function-display-visiblemenucount-dc-src-mq3-client-ui-shared-ml-1783172181"></a>
### Display_VisibleMenuCount

```ml
function Display_VisibleMenuCount(dc)
```

Calls `mq3.client.ui_shared.IsVisible` from UI shared `Display_VisibleMenuCount`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1237)

<a id="function-function-mq3-client-ui-shared-emit-function-emit-dc-boundary-kind-name-detail-number-vector-src-mq3-client-ui-shared-ml-1574390001"></a>
### emit

```ml
function emit(dc, boundary, kind, name, detail, number, vector)
```

Appends a typed UI engine action and sets its dispatched flag according to retail-QVM ownership.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |
| `detail` | `dynamic` | — | Value used by `dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)]`. |
| `number` | `dynamic` | — | Value used by `dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)]`. |
| `vector` | `dynamic` | — | Value used by `dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L478)

<a id="function-function-mq3-client-ui-shared-fade-function-fade-flags-alpha-clampvalue-nexttime-offsettime-bflags-fadeamount-realtime-src-mq3-client-ui-shared-ml-535346505"></a>
### Fade

```ml
function Fade(flags, alpha, clampValue, nextTime, offsetTime, bFlags, fadeAmount, realtime)
```

Evaluates UI shared `Fade` and returns `[flags,alpha,nextTime]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Value used by `if (flags&(WINDOW_FADINGOUT\|WINDOW_FADINGIN))==0 or realtime<=nextTime then return [flags,alpha,nextTime] end if`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. |
| `clampValue` | `dynamic` | — | Value used by `if alpha>=clampValue then`. |
| `nextTime` | `dynamic` | — | Value used by `if (flags&(WINDOW_FADINGOUT\|WINDOW_FADINGIN))==0 or realtime<=nextTime then return [flags,alpha,nextTime] end if`. |
| `offsetTime` | `dynamic` | — | Value used by `nextTime=realtime+offsetTime`. |
| `bFlags` | `dynamic` | — | Value used by `if bFlags and alpha<=0.0 then flags=flags&(~(WINDOW_FADINGOUT\|WINDOW_VISIBLE)) end if`. |
| `fadeAmount` | `dynamic` | — | Value used by `alpha=alpha-fadeAmount`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L616)

<a id="function-function-mq3-client-ui-shared-float-parse-function-float-parse-source-src-mq3-client-ui-shared-ml-914128661"></a>
### Float_Parse

```ml
function Float_Parse(source)
```

Text and PC parser boundaries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `token=next(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L536)

<a id="function-function-mq3-client-ui-shared-gradientbar-paint-function-gradientbar-paint-dc-value-tint-src-mq3-client-ui-shared-ml-984273717"></a>
### GradientBar_Paint

```ml
function GradientBar_Paint(dc, value, tint)
```

Calls `mq3.client.ui_shared.emit` from UI shared `GradientBar_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.x`, `value.y`, `value.w`, `value.h`. |
| `tint` | `dynamic` | — | Record read through `tint.r`, `tint.g`, `tint.b`, `tint.a`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L635)

<a id="function-function-mq3-client-ui-shared-hashforstring-function-hashforstring-value-src-mq3-client-ui-shared-ml-360014231"></a>
### hashForString

```ml
function hashForString(value)
```

Hashes ASCII-case-folded string bytes into one of 2,048 UI string buckets.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `for i=0 to len(bytes(value))-1 c=bytes(value)[i]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L517)

<a id="function-function-mq3-client-ui-shared-init-display-function-init-display-dc-src-mq3-client-ui-shared-ml-1056631161"></a>
### Init_Display

```ml
function Init_Display(dc)
```

Display context and geometry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.menus`, `dc.focus`, `dc.capture`, `dc.cursorx` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L578)

<a id="function-function-mq3-client-ui-shared-int-parse-function-int-parse-source-src-mq3-client-ui-shared-ml-866503643"></a>
### Int_Parse

```ml
function Int_Parse(source)
```

Calls `mq3.client.ui_shared.next`, `mq3.compat.textnumbers.atoi` from UI shared `Int_Parse`. The final path returns `numbers.atoi(token)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `token=next(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L539)

<a id="function-function-mq3-client-ui-shared-isvisible-function-isvisible-flags-src-mq3-client-ui-shared-ml-1867945645"></a>
### IsVisible

```ml
function IsVisible(flags)
```

Computes `(flags&WINDOW_VISIBLE)!=0 and (flags&WINDOW_FADINGOUT)==0` for UI shared `IsVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Value used by `return (flags&WINDOW_VISIBLE)!=0 and (flags&WINDOW_FADINGOUT)==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L589)

<a id="function-function-mq3-client-ui-shared-item-function-item-src-mq3-client-ui-shared-ml-1378341602"></a>
### item

```ml
function item()
```

Creates a `mq3.client.ui_shared.Item` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L457)

- [mq3.client.ui_shared.Item](Type-mq3-client-ui-shared-item-693759470.md) — struct
<a id="function-function-mq3-client-ui-shared-item-action-function-item-action-dc-value-src-mq3-client-ui-shared-ml-1502629742"></a>
### Item_Action

```ml
function Item_Action(dc, value)
```

Calls `mq3.client.ui_shared.Item_RunScript` from UI shared `Item_Action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L942)

<a id="constant-constant-mq3-client-ui-shared-item-align-center-const-item-align-center-1-src-mq3-client-ui-shared-ml-1014636844"></a>
### ITEM_ALIGN_CENTER

```ml
const ITEM_ALIGN_CENTER = 1
```

Menu-item alignment value selecting center horizontal alignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L66)

<a id="constant-constant-mq3-client-ui-shared-item-align-left-const-item-align-left-0-src-mq3-client-ui-shared-ml-341304843"></a>
### ITEM_ALIGN_LEFT

```ml
const ITEM_ALIGN_LEFT = 0
```

Menu-item alignment value selecting left horizontal alignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L64)

<a id="constant-constant-mq3-client-ui-shared-item-align-right-const-item-align-right-2-src-mq3-client-ui-shared-ml-1625044951"></a>
### ITEM_ALIGN_RIGHT

```ml
const ITEM_ALIGN_RIGHT = 2
```

Menu-item alignment value selecting right horizontal alignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L68)

<a id="function-function-mq3-client-ui-shared-item-bind-handlekey-function-item-bind-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-191308691"></a>
### Item_Bind_HandleKey

```ml
function Item_Bind_HandleKey(dc, value, key, down)
```

Updates `dc.keyBindPending`, `dc.capture`, `dc.bindings` during UI shared `Item_Bind_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.keyBindPending`, `dc.capture`, `dc.bindings`. |
| `value` | `dynamic` | — | Record read through `value.cvar`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1044)

<a id="function-function-mq3-client-ui-shared-item-bind-paint-function-item-bind-paint-dc-value-src-mq3-client-ui-shared-ml-147432126"></a>
### Item_Bind_Paint

```ml
function Item_Bind_Paint(dc, value)
```

Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Bind_Paint`, returning its result for `dc, value, BindingFromName(dc,value.cvar), "draw-bind"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`. |
| `value` | `dynamic` | — | Record read through `value.cvar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1114)

<a id="function-function-mq3-client-ui-shared-item-cachecontents-function-item-cachecontents-dc-value-src-mq3-client-ui-shared-ml-624926778"></a>
### Item_CacheContents

```ml
function Item_CacheContents(dc, value)
```

Calls `mq3.client.ui_shared.Window_CacheContents`, `mq3.client.ui_shared.emit` from UI shared `Item_CacheContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window`, `value.focusSound`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1168)

<a id="function-function-mq3-client-ui-shared-item-correctedtextrect-function-item-correctedtextrect-value-src-mq3-client-ui-shared-ml-446709031"></a>
### Item_CorrectedTextRect

```ml
function Item_CorrectedTextRect(value)
```

Calls `mq3.client.ui_shared.rect` from UI shared `Item_CorrectedTextRect`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.textRect.x`, `value.textRect.y`, `value.textRect.w`, `value.textRect.h`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L680)

<a id="function-function-mq3-client-ui-shared-item-enableshowviacvar-function-item-enableshowviacvar-dc-value-flag-src-mq3-client-ui-shared-ml-1439124108"></a>
### Item_EnableShowViaCvar

```ml
function Item_EnableShowViaCvar(dc, value, flag)
```

Cvar gating and item controls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvarTest`, `value.enableCvar`. |
| `flag` | `dynamic` | — | Value used by `if (flag&1)!=0 then return matched end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L938)

<a id="function-function-mq3-client-ui-shared-item-handlekey-function-item-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-1131079461"></a>
### Item_HandleKey

```ml
function Item_HandleKey(dc, value, key, down)
```

Calls `mq3.client.ui_shared.Item_ListBox_HandleKey`, `mq3.client.ui_shared.Item_Slider_HandleKey`, `mq3.client.ui_shared.Item_YesNo_HandleKey` and additional helpers from UI shared `Item_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.type`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1050)

<a id="function-function-mq3-client-ui-shared-item-image-paint-function-item-image-paint-dc-value-src-mq3-client-ui-shared-ml-2141520854"></a>
### Item_Image_Paint

```ml
function Item_Image_Paint(dc, value)
```

Calls `mq3.client.ui_shared.emit` from UI shared `Item_Image_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window.background`, `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1122)

<a id="function-function-mq3-client-ui-shared-item-init-function-item-init-value-src-mq3-client-ui-shared-ml-744597423"></a>
### Item_Init

```ml
function Item_Init(value)
```

Item/menu initialization and coordinates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window`, `value.textRect`, `value.typeData`, `value.properties` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L654)

<a id="function-function-mq3-client-ui-shared-item-initcontrols-function-item-initcontrols-value-src-mq3-client-ui-shared-ml-1335703751"></a>
### Item_InitControls

```ml
function Item_InitControls(value)
```

Updates `value.typeData` during UI shared `Item_InitControls`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L660)

<a id="function-function-mq3-client-ui-shared-item-listbox-handlekey-function-item-listbox-handlekey-dc-value-key-down-force-src-mq3-client-ui-shared-ml-843207284"></a>
### Item_ListBox_HandleKey

```ml
function Item_ListBox_HandleKey(dc, value, key, down, force)
```

Updates `value.typeData.cursorPos`, `value.typeData.startPos` during UI shared `Item_ListBox_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursorx`, `dc.cursory`. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.cursorPos`, `value.typeData.startPos`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |
| `force` | `dynamic` | — | Accepted for compatibility with `Item_ListBox_HandleKey`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1020)

<a id="function-function-mq3-client-ui-shared-item-listbox-maxscroll-function-item-listbox-maxscroll-dc-value-src-mq3-client-ui-shared-ml-931146378"></a>
### Item_ListBox_MaxScroll

```ml
function Item_ListBox_MaxScroll(dc, value)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.clamp` from UI shared `Item_ListBox_MaxScroll`. The final path returns `clamp(count-visible,0,count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.special`, `value.typeData.elementHeight`, `value.window.rect.h`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L983)

<a id="function-function-mq3-client-ui-shared-item-listbox-mouseenter-function-item-listbox-mouseenter-dc-value-x-y-src-mq3-client-ui-shared-ml-960830369"></a>
### Item_ListBox_MouseEnter

```ml
function Item_ListBox_MouseEnter(dc, value, x, y)
```

Updates `value.typeData.cursorPos` during UI shared `Item_ListBox_MouseEnter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.cursorPos`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Item_ListBox_MouseEnter`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Item_ListBox_MouseEnter`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1013)

<a id="function-function-mq3-client-ui-shared-item-listbox-overlb-function-item-listbox-overlb-dc-value-x-y-src-mq3-client-ui-shared-ml-963220427"></a>
### Item_ListBox_OverLB

```ml
function Item_ListBox_OverLB(dc, value, x, y)
```

Calls `mq3.client.ui_shared.Rect_ContainsPoint` from UI shared `Item_ListBox_OverLB`. The final path returns `3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Item_ListBox_OverLB`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.window.rect`, `value.typeData.horizontal`, `value.window.rect.x`, `value.window.rect.w` and additional values. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Item_ListBox_OverLB`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Item_ListBox_OverLB`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L997)

<a id="function-function-mq3-client-ui-shared-item-listbox-paint-function-item-listbox-paint-dc-value-src-mq3-client-ui-shared-ml-721041598"></a>
### Item_ListBox_Paint

```ml
function Item_ListBox_Paint(dc, value)
```

Calls `mq3.client.ui_shared.emit` from UI shared `Item_ListBox_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.special`, `value.typeData.startPos`, `value.typeData.cursorPos`, `value.window.rect.x` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1126)

<a id="function-function-mq3-client-ui-shared-item-listbox-thumbdrawposition-function-item-listbox-thumbdrawposition-dc-value-src-mq3-client-ui-shared-ml-1813934238"></a>
### Item_ListBox_ThumbDrawPosition

```ml
function Item_ListBox_ThumbDrawPosition(dc, value)
```

Adapts `mq3.client.ui_shared.Item_ListBox_ThumbPosition` to UI shared `Item_ListBox_ThumbDrawPosition`, returning its result for `dc, value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Item_ListBox_ThumbPosition`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Item_ListBox_ThumbPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L991)

<a id="function-function-mq3-client-ui-shared-item-listbox-thumbposition-function-item-listbox-thumbposition-dc-value-src-mq3-client-ui-shared-ml-1443281782"></a>
### Item_ListBox_ThumbPosition

```ml
function Item_ListBox_ThumbPosition(dc, value)
```

Calls `mq3.client.ui_shared.Item_ListBox_MaxScroll`, `mq3.compat.numeric.trunc32` from UI shared `Item_ListBox_ThumbPosition`. The final path returns `numeric.trunc32(value.window.rect.y+SCROLLBAR_SIZE+(value.typeData.startPos/max)*track)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window.rect.y`, `value.window.rect.h`, `value.typeData.startPos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L987)

<a id="function-function-mq3-client-ui-shared-item-model-paint-function-item-model-paint-dc-value-src-mq3-client-ui-shared-ml-1987746086"></a>
### Item_Model_Paint

```ml
function Item_Model_Paint(dc, value)
```

Calls `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.emit` from UI shared `Item_Model_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.properties`, `value.window.background`, `value.typeData.modelAngle`, `value.typeData.modelRotation` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1118)

<a id="function-function-mq3-client-ui-shared-item-mouseenter-function-item-mouseenter-dc-value-x-y-src-mq3-client-ui-shared-ml-717971833"></a>
### Item_MouseEnter

```ml
function Item_MouseEnter(dc, value, x, y)
```

Calls `mq3.client.ui_shared.Item_SetMouseOver`, `mq3.client.ui_shared.Item_RunScript` from UI shared `Item_MouseEnter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.mouseEnter`. |
| `x` | `dynamic` | — | Accepted for compatibility with `Item_MouseEnter`; the current implementation does not read it. |
| `y` | `dynamic` | — | Accepted for compatibility with `Item_MouseEnter`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L721)

<a id="function-function-mq3-client-ui-shared-item-mouseleave-function-item-mouseleave-dc-value-src-mq3-client-ui-shared-ml-1449958"></a>
### Item_MouseLeave

```ml
function Item_MouseLeave(dc, value)
```

Updates `value.window.flags` during UI shared `Item_MouseLeave`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L725)

<a id="function-function-mq3-client-ui-shared-item-multi-countsettings-function-item-multi-countsettings-value-src-mq3-client-ui-shared-ml-1197910551"></a>
### Item_Multi_CountSettings

```ml
function Item_Multi_CountSettings(value)
```

Returns the element/byte count of `value.typeData.settings` for UI shared `Item_Multi_CountSettings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.typeData.settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L950)

<a id="function-function-mq3-client-ui-shared-item-multi-findcvarbyvalue-function-item-multi-findcvarbyvalue-dc-value-src-mq3-client-ui-shared-ml-100131058"></a>
### Item_Multi_FindCvarByValue

```ml
function Item_Multi_FindCvarByValue(dc, value)
```

Calls `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.same` from UI shared `Item_Multi_FindCvarByValue`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvar`, `value.typeData.values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L954)

<a id="function-function-mq3-client-ui-shared-item-multi-handlekey-function-item-multi-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-1744153517"></a>
### Item_Multi_HandleKey

```ml
function Item_Multi_HandleKey(dc, value, key)
```

Updates `dc.cvars` during UI shared `Item_Multi_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.typeData.values`, `value.cvar`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L963)

<a id="function-function-mq3-client-ui-shared-item-multi-paint-function-item-multi-paint-dc-value-src-mq3-client-ui-shared-ml-77983326"></a>
### Item_Multi_Paint

```ml
function Item_Multi_Paint(dc, value)
```

Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Multi_Paint`, returning its result for `dc, value, Item_Multi_Setting(dc,value), "draw-multi"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`. |
| `value` | `dynamic` | — | Argument 2, 3 of `mq3.client.ui_shared.paintText`; passed as `value`, `Item_Multi_Setting(dc,value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1106)

<a id="function-function-mq3-client-ui-shared-item-multi-setting-function-item-multi-setting-dc-value-src-mq3-client-ui-shared-ml-1656097518"></a>
### Item_Multi_Setting

```ml
function Item_Multi_Setting(dc, value)
```

Calls `mq3.client.ui_shared.Item_Multi_CountSettings`, `mq3.client.ui_shared.Item_Multi_FindCvarByValue`, `mq3.client.ui_shared.clamp` from UI shared `Item_Multi_Setting`. The final path returns `value.typeData.settings[clamp(index,0,count-1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.typeData.settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L958)

<a id="function-function-mq3-client-ui-shared-item-ownerdraw-handlekey-function-item-ownerdraw-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-507912961"></a>
### Item_OwnerDraw_HandleKey

```ml
function Item_OwnerDraw_HandleKey(dc, value, key)
```

Calls `mq3.client.ui_shared.emit` from UI shared `Item_OwnerDraw_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.ownerDraw`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1038)

<a id="function-function-mq3-client-ui-shared-item-ownerdraw-paint-function-item-ownerdraw-paint-dc-value-src-mq3-client-ui-shared-ml-1423689582"></a>
### Item_OwnerDraw_Paint

```ml
function Item_OwnerDraw_Paint(dc, value)
```

Calls `mq3.client.ui_shared.emit` from UI shared `Item_OwnerDraw_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.ownerDraw`, `value.text`, `value.ownerDrawFlags`, `value.window.rect.x` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1130)

<a id="function-function-mq3-client-ui-shared-item-paint-function-item-paint-dc-value-src-mq3-client-ui-shared-ml-1243021002"></a>
### Item_Paint

```ml
function Item_Paint(dc, value)
```

Calls `mq3.client.ui_shared.Item_UpdateEffects`, `mq3.client.ui_shared.IsVisible`, `mq3.client.ui_shared.Item_EnableShowViaCvar` and additional helpers from UI shared `Item_Paint`. The final path returns `Item_Image_Paint(dc,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window.flags`, `value.parent`, `value.parent.fadeAmount`, `value.parent.fadeClamp` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1152)

<a id="function-function-mq3-client-ui-shared-item-parse-function-item-parse-handle-value-src-mq3-client-ui-shared-ml-427978369"></a>
### Item_Parse

```ml
function Item_Parse(handle, value)
```

Parses an itemDef block through the keyword table, validates its type-specific data and records malformed or unknown properties.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `Item_Parse`. |
| `value` | `dynamic` | — | Value tested by `not itemParseKind(value,handle,strings.toLowerAscii(keyword),kind)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1334)

<a id="function-function-mq3-client-ui-shared-item-runscript-function-item-runscript-dc-value-text-src-mq3-client-ui-shared-ml-395192879"></a>
### Item_RunScript

```ml
function Item_RunScript(dc, value, text)
```

Calls `mq3.client.ui_shared.scriptArgs`, `mq3.client.ui_shared.next`, `mq3.client.ui_shared.commandHandler` and additional helpers from UI shared `Item_RunScript`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Value used by `if id==0 then Script_SetColor(dc,value,src) else if id==1 then Script_SetAsset(dc,value,src) else if id==2 then Script_SetBackground(dc,value,...`. |
| `text` | `dynamic` | — | Text consumed or emitted by `Item_RunScript` in the UI shared path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L888)

<a id="function-function-mq3-client-ui-shared-item-setfocus-function-item-setfocus-dc-value-x-y-src-mq3-client-ui-shared-ml-276830991"></a>
### Item_SetFocus

```ml
function Item_SetFocus(dc, value, x, y)
```

Updates `value.window.flags`, `value.parent.cursorItem` during UI shared `Item_SetFocus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.flags`, `value.parent.cursorItem`. |
| `x` | `dynamic` | — | Accepted for compatibility with `Item_SetFocus`; the current implementation does not read it. |
| `y` | `dynamic` | — | Accepted for compatibility with `Item_SetFocus`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L711)

<a id="function-function-mq3-client-ui-shared-item-setmouseover-function-item-setmouseover-value-focus-src-mq3-client-ui-shared-ml-496698949"></a>
### Item_SetMouseOver

```ml
function Item_SetMouseOver(value, focus)
```

Updates `value.window.flags` during UI shared `Item_SetMouseOver`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.flags`. |
| `focus` | `dynamic` | — | Value used by `if focus then value.window.flags=value.window.flags\|WINDOW_MOUSEOVER else value.window.flags=value.window.flags&(~WINDOW_MOUSEOVER) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L715)

<a id="function-function-mq3-client-ui-shared-item-setscreencoords-function-item-setscreencoords-value-x-y-src-mq3-client-ui-shared-ml-2120637126"></a>
### Item_SetScreenCoords

```ml
function Item_SetScreenCoords(value, x, y)
```

Updates `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w`, `value.window.rect.h` during UI shared `Item_SetScreenCoords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w`, `value.window.rect.h`. |
| `x` | `dynamic` | — | Value assigned to `value.window.rect.x`. |
| `y` | `dynamic` | — | Value assigned to `value.window.rect.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L668)

<a id="function-function-mq3-client-ui-shared-item-settextextents-function-item-settextextents-value-text-src-mq3-client-ui-shared-ml-2066842654"></a>
### Item_SetTextExtents

```ml
function Item_SetTextExtents(value, text)
```

Estimates scaled text width/height, stores them in the text rectangle and returns their integer pixel values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.textRect.w`, `value.textRect.h`. |
| `text` | `dynamic` | — | Text consumed or emitted by `Item_SetTextExtents` in the UI shared path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L684)

<a id="function-function-mq3-client-ui-shared-item-setupkeywordhash-function-item-setupkeywordhash-src-mq3-client-ui-shared-ml-801027750"></a>
### Item_SetupKeywordHash

```ml
function Item_SetupKeywordHash()
```

Adapts `mq3.client.ui_shared.itemKeywords` to UI shared `Item_SetupKeywordHash`, returning its result for `no arguments`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1287)

<a id="function-function-mq3-client-ui-shared-item-slider-handlekey-function-item-slider-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-173157227"></a>
### Item_Slider_HandleKey

```ml
function Item_Slider_HandleKey(dc, value, key, down)
```

Updates `dc.cvars` during UI shared `Item_Slider_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvar`, `value.typeData.defVal`, `value.typeData.maxVal`, `value.typeData.minVal` and additional values. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L979)

<a id="function-function-mq3-client-ui-shared-item-slider-overslider-function-item-slider-overslider-dc-value-x-y-src-mq3-client-ui-shared-ml-651658319"></a>
### Item_Slider_OverSlider

```ml
function Item_Slider_OverSlider(dc, value, x, y)
```

Calls `mq3.client.ui_shared.Item_Slider_ThumbPosition` from UI shared `Item_Slider_OverSlider`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window.rect.y`, `value.window.rect.h`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Item_Slider_OverSlider`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Item_Slider_OverSlider`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L973)

<a id="function-function-mq3-client-ui-shared-item-slider-paint-function-item-slider-paint-dc-value-src-mq3-client-ui-shared-ml-1546342426"></a>
### Item_Slider_Paint

```ml
function Item_Slider_Paint(dc, value)
```

Calls `mq3.client.ui_shared.emit`, `mq3.client.ui_shared.Item_Slider_ThumbPosition` from UI shared `Item_Slider_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.cvar`, `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1110)

<a id="function-function-mq3-client-ui-shared-item-slider-thumbposition-function-item-slider-thumbposition-dc-value-src-mq3-client-ui-shared-ml-848541940"></a>
### Item_Slider_ThumbPosition

```ml
function Item_Slider_ThumbPosition(dc, value)
```

Calls `mq3.compat.textnumbers.atof`, `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.clamp` from UI shared `Item_Slider_ThumbPosition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvar`, `value.typeData.defVal`, `value.typeData.maxVal`, `value.typeData.minVal` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L967)

<a id="function-function-mq3-client-ui-shared-item-startcapture-function-item-startcapture-dc-value-key-src-mq3-client-ui-shared-ml-498714901"></a>
### Item_StartCapture

```ml
function Item_StartCapture(dc, value, key)
```

Updates `dc.capture` during UI shared `Item_StartCapture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.capture`. |
| `value` | `dynamic` | — | Record read through `value.type`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1055)

<a id="function-function-mq3-client-ui-shared-item-stopcapture-function-item-stopcapture-dc-value-src-mq3-client-ui-shared-ml-1887209086"></a>
### Item_StopCapture

```ml
function Item_StopCapture(dc, value)
```

Updates `dc.capture` during UI shared `Item_StopCapture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.capture`. |
| `value` | `dynamic` | — | Accepted for compatibility with `Item_StopCapture`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1059)

<a id="function-function-mq3-client-ui-shared-item-text-autowrapped-paint-function-item-text-autowrapped-paint-dc-value-src-mq3-client-ui-shared-ml-1001799936"></a>
### Item_Text_AutoWrapped_Paint

```ml
function Item_Text_AutoWrapped_Paint(dc, value)
```

Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Text_AutoWrapped_Paint`, returning its result for `dc, value, value.text, "draw-auto-wrapped-text"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`. |
| `value` | `dynamic` | — | Record read through `value.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1094)

<a id="function-function-mq3-client-ui-shared-item-text-paint-function-item-text-paint-dc-value-src-mq3-client-ui-shared-ml-1790611486"></a>
### Item_Text_Paint

```ml
function Item_Text_Paint(dc, value)
```

Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Text_Paint`, returning its result for `dc, value, value.text, "draw-text"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`. |
| `value` | `dynamic` | — | Record read through `value.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1086)

<a id="function-function-mq3-client-ui-shared-item-text-wrapped-paint-function-item-text-wrapped-paint-dc-value-src-mq3-client-ui-shared-ml-1427294414"></a>
### Item_Text_Wrapped_Paint

```ml
function Item_Text_Wrapped_Paint(dc, value)
```

Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Text_Wrapped_Paint`, returning its result for `dc, value, value.text, "draw-wrapped-text"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`. |
| `value` | `dynamic` | — | Record read through `value.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1090)

<a id="function-function-mq3-client-ui-shared-item-textcolor-function-item-textcolor-dc-value-src-mq3-client-ui-shared-ml-1259777846"></a>
### Item_TextColor

```ml
function Item_TextColor(dc, value)
```

Painting uses typed renderer/feeder/ownerdraw actions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window.foreColor`, `value.window.flags`, `value.parent`, `value.parent.focusColor` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1076)

<a id="function-function-mq3-client-ui-shared-item-textfield-handlekey-function-item-textfield-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-1792470053"></a>
### Item_TextField_HandleKey

```ml
function Item_TextField_HandleKey(dc, value, key)
```

Updates `value.typeData.cursorPos`, `dc.cvars` during UI shared `Item_TextField_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.cursorPos`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1033)

<a id="function-function-mq3-client-ui-shared-item-textfield-paint-function-item-textfield-paint-dc-value-src-mq3-client-ui-shared-ml-1488838278"></a>
### Item_TextField_Paint

```ml
function Item_TextField_Paint(dc, value)
```

Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_TextField_Paint`, returning its result for `dc, value, str(pairGet(dc.cvars,value.cvar,"")), "draw-editfield"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1098)

<a id="constant-constant-mq3-client-ui-shared-item-type-bind-const-item-type-bind-13-src-mq3-client-ui-shared-ml-320205743"></a>
### ITEM_TYPE_BIND

```ml
const ITEM_TYPE_BIND = 13
```

Menu-item type selecting bind interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L62)

<a id="constant-constant-mq3-client-ui-shared-item-type-button-const-item-type-button-1-src-mq3-client-ui-shared-ml-1311364728"></a>
### ITEM_TYPE_BUTTON

```ml
const ITEM_TYPE_BUTTON = 1
```

Menu-item type selecting button interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L38)

<a id="constant-constant-mq3-client-ui-shared-item-type-checkbox-const-item-type-checkbox-3-src-mq3-client-ui-shared-ml-1742352268"></a>
### ITEM_TYPE_CHECKBOX

```ml
const ITEM_TYPE_CHECKBOX = 3
```

Menu-item type selecting checkbox interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L42)

<a id="constant-constant-mq3-client-ui-shared-item-type-combo-const-item-type-combo-5-src-mq3-client-ui-shared-ml-784126244"></a>
### ITEM_TYPE_COMBO

```ml
const ITEM_TYPE_COMBO = 5
```

Menu-item type selecting combo interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L46)

<a id="constant-constant-mq3-client-ui-shared-item-type-editfield-const-item-type-editfield-4-src-mq3-client-ui-shared-ml-30928095"></a>
### ITEM_TYPE_EDITFIELD

```ml
const ITEM_TYPE_EDITFIELD = 4
```

Menu-item type selecting editfield interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L44)

<a id="constant-constant-mq3-client-ui-shared-item-type-listbox-const-item-type-listbox-6-src-mq3-client-ui-shared-ml-2012312625"></a>
### ITEM_TYPE_LISTBOX

```ml
const ITEM_TYPE_LISTBOX = 6
```

Menu-item type selecting listbox interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L48)

<a id="constant-constant-mq3-client-ui-shared-item-type-model-const-item-type-model-7-src-mq3-client-ui-shared-ml-170576690"></a>
### ITEM_TYPE_MODEL

```ml
const ITEM_TYPE_MODEL = 7
```

Menu-item type selecting model interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L50)

<a id="constant-constant-mq3-client-ui-shared-item-type-multi-const-item-type-multi-12-src-mq3-client-ui-shared-ml-435822090"></a>
### ITEM_TYPE_MULTI

```ml
const ITEM_TYPE_MULTI = 12
```

Menu-item type selecting multi interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L60)

<a id="constant-constant-mq3-client-ui-shared-item-type-numericfield-const-item-type-numericfield-9-src-mq3-client-ui-shared-ml-27548414"></a>
### ITEM_TYPE_NUMERICFIELD

```ml
const ITEM_TYPE_NUMERICFIELD = 9
```

Menu-item type selecting numericfield interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L54)

<a id="constant-constant-mq3-client-ui-shared-item-type-ownerdraw-const-item-type-ownerdraw-8-src-mq3-client-ui-shared-ml-862330631"></a>
### ITEM_TYPE_OWNERDRAW

```ml
const ITEM_TYPE_OWNERDRAW = 8
```

Menu-item type selecting ownerdraw interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L52)

<a id="constant-constant-mq3-client-ui-shared-item-type-radiobutton-const-item-type-radiobutton-2-src-mq3-client-ui-shared-ml-41786369"></a>
### ITEM_TYPE_RADIOBUTTON

```ml
const ITEM_TYPE_RADIOBUTTON = 2
```

Menu-item type selecting radiobutton interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L40)

<a id="constant-constant-mq3-client-ui-shared-item-type-slider-const-item-type-slider-10-src-mq3-client-ui-shared-ml-1227123958"></a>
### ITEM_TYPE_SLIDER

```ml
const ITEM_TYPE_SLIDER = 10
```

Menu-item type selecting slider interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L56)

<a id="constant-constant-mq3-client-ui-shared-item-type-text-const-item-type-text-0-src-mq3-client-ui-shared-ml-2098914137"></a>
### ITEM_TYPE_TEXT

```ml
const ITEM_TYPE_TEXT = 0
```

Menu-item type selecting text interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L36)

<a id="constant-constant-mq3-client-ui-shared-item-type-yesno-const-item-type-yesno-11-src-mq3-client-ui-shared-ml-849459887"></a>
### ITEM_TYPE_YESNO

```ml
const ITEM_TYPE_YESNO = 11
```

Menu-item type selecting yesno interaction and type-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L58)

<a id="function-function-mq3-client-ui-shared-item-updateeffects-function-item-updateeffects-dc-value-src-mq3-client-ui-shared-ml-483056990"></a>
### Item_UpdateEffects

```ml
function Item_UpdateEffects(dc, value)
```

Calls `mq3.compat.transcendental.cos`, `mq3.compat.transcendental.sin`, `mq3.client.ui_shared.Item_UpdatePosition` and additional helpers from UI shared `Item_UpdateEffects`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.realtime`. |
| `value` | `dynamic` | — | Record read through `value.window`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1139)

<a id="function-function-mq3-client-ui-shared-item-updateposition-function-item-updateposition-value-src-mq3-client-ui-shared-ml-481997411"></a>
### Item_UpdatePosition

```ml
function Item_UpdatePosition(value)
```

Calls `mq3.client.ui_shared.Item_SetScreenCoords` from UI shared `Item_UpdatePosition`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.parent`, `value.parent.window.rect.x`, `value.parent.window.rect.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L671)

<a id="function-function-mq3-client-ui-shared-item-validatetypedata-function-item-validatetypedata-value-src-mq3-client-ui-shared-ml-1531697399"></a>
### Item_ValidateTypeData

```ml
function Item_ValidateTypeData(value)
```

Updates `value.typeData`, `value.typeData.maxChars`, `value.typeData.cursorPos` during UI shared `Item_ValidateTypeData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData`, `value.typeData.maxChars`, `value.typeData.cursorPos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L663)

<a id="function-function-mq3-client-ui-shared-item-yesno-handlekey-function-item-yesno-handlekey-dc-value-key-src-mq3-client-ui-shared-ml-1308444729"></a>
### Item_YesNo_HandleKey

```ml
function Item_YesNo_HandleKey(dc, value, key)
```

Updates `dc.cvars` during UI shared `Item_YesNo_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvar`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L947)

<a id="function-function-mq3-client-ui-shared-item-yesno-paint-function-item-yesno-paint-dc-value-src-mq3-client-ui-shared-ml-824468394"></a>
### Item_YesNo_Paint

```ml
function Item_YesNo_Paint(dc, value)
```

Calls `mq3.compat.textnumbers.atoi`, `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.paintText` from UI shared `Item_YesNo_Paint`. The final path returns `paintText(dc,value,text,"draw-yesno")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Record read through `value.cvar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1102)

<a id="function-function-mq3-client-ui-shared-itemkeywords-function-itemkeywords-src-mq3-client-ui-shared-ml-1236742954"></a>
### itemKeywords

```ml
function itemKeywords()
```

Provides the item keywords table used by UI shared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1330)

<a id="function-function-mq3-client-ui-shared-itemparse-action-function-itemparse-action-value-handle-src-mq3-client-ui-shared-ml-1226349421"></a>
### ItemParse_action

```ml
function ItemParse_action(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_action`, returning its result for `value, handle, "action", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1561)

<a id="function-function-mq3-client-ui-shared-itemparse-addcolorrange-function-itemparse-addcolorrange-value-handle-src-mq3-client-ui-shared-ml-1117831825"></a>
### ItemParse_addColorRange

```ml
function ItemParse_addColorRange(value, handle)
```

Updates `value.colorRanges` during UI shared `ItemParse_addColorRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.colorRanges`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_addColorRange`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1602)

<a id="function-function-mq3-client-ui-shared-itemparse-align-function-itemparse-align-value-handle-src-mq3-client-ui-shared-ml-2098998849"></a>
### ItemParse_align

```ml
function ItemParse_align(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_align`, returning its result for `value, handle, "align", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1485)

<a id="function-function-mq3-client-ui-shared-itemparse-asset-model-function-itemparse-asset-model-value-handle-src-mq3-client-ui-shared-ml-1712260907"></a>
### ItemParse_asset_model

```ml
function ItemParse_asset_model(value, handle)
```

Calls `mq3.client.ui_shared.PC_String_Parse`, `mq3.client.ui_shared.putItem` from UI shared `ItemParse_asset_model`. The final path returns `putItem(value,"asset_model",path)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return putItem(value,"asset_model",path)`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_asset_model`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1389)

<a id="function-function-mq3-client-ui-shared-itemparse-asset-shader-function-itemparse-asset-shader-value-handle-src-mq3-client-ui-shared-ml-910422913"></a>
### ItemParse_asset_shader

```ml
function ItemParse_asset_shader(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_asset_shader`, returning its result for `value, handle, "background", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1393)

<a id="function-function-mq3-client-ui-shared-itemparse-autowrapped-function-itemparse-autowrapped-value-handle-src-mq3-client-ui-shared-ml-237877299"></a>
### ItemParse_autowrapped

```ml
function ItemParse_autowrapped(value, handle)
```

Adapts `mq3.client.ui_shared.putItem` to UI shared `ItemParse_autowrapped`, returning its result for `value, "autowrapped", 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.putItem`. |
| `handle` | `dynamic` | — | Accepted for compatibility with `ItemParse_autowrapped`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1437)

<a id="function-function-mq3-client-ui-shared-itemparse-backcolor-function-itemparse-backcolor-value-handle-src-mq3-client-ui-shared-ml-202384915"></a>
### ItemParse_backcolor

```ml
function ItemParse_backcolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_backcolor`, returning its result for `value, handle, "backcolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1509)

<a id="function-function-mq3-client-ui-shared-itemparse-background-function-itemparse-background-value-handle-src-mq3-client-ui-shared-ml-1060739805"></a>
### ItemParse_background

```ml
function ItemParse_background(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_background`, returning its result for `value, handle, "background", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1525)

<a id="function-function-mq3-client-ui-shared-itemparse-border-function-itemparse-border-value-handle-src-mq3-client-ui-shared-ml-968512749"></a>
### ItemParse_border

```ml
function ItemParse_border(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_border`, returning its result for `value, handle, "border", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1469)

<a id="function-function-mq3-client-ui-shared-itemparse-bordercolor-function-itemparse-bordercolor-value-handle-src-mq3-client-ui-shared-ml-1208018577"></a>
### ItemParse_bordercolor

```ml
function ItemParse_bordercolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_bordercolor`, returning its result for `value, handle, "bordercolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1517)

<a id="function-function-mq3-client-ui-shared-itemparse-bordersize-function-itemparse-bordersize-value-handle-src-mq3-client-ui-shared-ml-1732751145"></a>
### ItemParse_bordersize

```ml
function ItemParse_bordersize(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_bordersize`, returning its result for `value, handle, "bordersize", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1473)

<a id="function-function-mq3-client-ui-shared-itemparse-cinematic-function-itemparse-cinematic-value-handle-src-mq3-client-ui-shared-ml-1570828017"></a>
### ItemParse_cinematic

```ml
function ItemParse_cinematic(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_cinematic`, returning its result for `value, handle, "cinematic", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1529)

<a id="function-function-mq3-client-ui-shared-itemparse-columns-function-itemparse-columns-value-handle-src-mq3-client-ui-shared-ml-347486717"></a>
### ItemParse_columns

```ml
function ItemParse_columns(value, handle)
```

Parses a count followed by list-box column position, width and character-limit triples, stopping on missing values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.columns`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_columns`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1465)

<a id="function-function-mq3-client-ui-shared-itemparse-cvar-function-itemparse-cvar-value-handle-src-mq3-client-ui-shared-ml-578138517"></a>
### ItemParse_cvar

```ml
function ItemParse_cvar(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_cvar`, returning its result for `value, handle, "cvar", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1573)

<a id="function-function-mq3-client-ui-shared-itemparse-cvarfloat-function-itemparse-cvarfloat-value-handle-src-mq3-client-ui-shared-ml-1829272939"></a>
### ItemParse_cvarFloat

```ml
function ItemParse_cvarFloat(value, handle)
```

Updates `value.cvar`, `value.typeData.defVal`, `value.typeData.minVal`, `value.typeData.maxVal` during UI shared `ItemParse_cvarFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.cvar`, `value.typeData.defVal`, `value.typeData.minVal`, `value.typeData.maxVal`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_cvarFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1585)

<a id="function-function-mq3-client-ui-shared-itemparse-cvarfloatlist-function-itemparse-cvarfloatlist-value-handle-src-mq3-client-ui-shared-ml-1629197947"></a>
### ItemParse_cvarFloatList

```ml
function ItemParse_cvarFloatList(value, handle)
```

Adapts `mq3.client.ui_shared.parseList` to UI shared `ItemParse_cvarFloatList`, returning its result for `value, handle, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseList`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1598)

<a id="function-function-mq3-client-ui-shared-itemparse-cvarstrlist-function-itemparse-cvarstrlist-value-handle-src-mq3-client-ui-shared-ml-1406966513"></a>
### ItemParse_cvarStrList

```ml
function ItemParse_cvarStrList(value, handle)
```

Adapts `mq3.client.ui_shared.parseList` to UI shared `ItemParse_cvarStrList`, returning its result for `value, handle, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseList`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1594)

<a id="function-function-mq3-client-ui-shared-itemparse-cvartest-function-itemparse-cvartest-value-handle-src-mq3-client-ui-shared-ml-1000167749"></a>
### ItemParse_cvarTest

```ml
function ItemParse_cvarTest(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_cvarTest`, returning its result for `value, handle, "cvartest", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1569)

<a id="function-function-mq3-client-ui-shared-itemparse-decoration-function-itemparse-decoration-value-handle-src-mq3-client-ui-shared-ml-528694165"></a>
### ItemParse_decoration

```ml
function ItemParse_decoration(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_decoration`, returning its result for `value, handle, "decoration", "flag"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1425)

<a id="function-function-mq3-client-ui-shared-itemparse-disablecvar-function-itemparse-disablecvar-value-handle-src-mq3-client-ui-shared-ml-409868587"></a>
### ItemParse_disableCvar

```ml
function ItemParse_disableCvar(value, handle)
```

Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_disableCvar`, returning its result for `value, handle, "disablecvar", 2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseCvarGate`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseCvarGate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1620)

<a id="function-function-mq3-client-ui-shared-itemparse-doubleclick-function-itemparse-doubleclick-value-handle-src-mq3-client-ui-shared-ml-634843113"></a>
### ItemParse_doubleClick

```ml
function ItemParse_doubleClick(value, handle)
```

Updates `value.typeData.doubleClick` during UI shared `ItemParse_doubleClick`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.doubleClick`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_doubleClick`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1533)

<a id="function-function-mq3-client-ui-shared-itemparse-elementheight-function-itemparse-elementheight-value-handle-src-mq3-client-ui-shared-ml-843492565"></a>
### ItemParse_elementheight

```ml
function ItemParse_elementheight(value, handle)
```

Updates `value.typeData.elementHeight` during UI shared `ItemParse_elementheight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.elementHeight`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_elementheight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1453)

<a id="function-function-mq3-client-ui-shared-itemparse-elementtype-function-itemparse-elementtype-value-handle-src-mq3-client-ui-shared-ml-2032065183"></a>
### ItemParse_elementtype

```ml
function ItemParse_elementtype(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_elementtype`, returning its result for `value, handle, "elementtype", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1461)

<a id="function-function-mq3-client-ui-shared-itemparse-elementwidth-function-itemparse-elementwidth-value-handle-src-mq3-client-ui-shared-ml-1270997481"></a>
### ItemParse_elementwidth

```ml
function ItemParse_elementwidth(value, handle)
```

Updates `value.typeData.elementWidth` during UI shared `ItemParse_elementwidth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.elementWidth`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_elementwidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1449)

<a id="function-function-mq3-client-ui-shared-itemparse-enablecvar-function-itemparse-enablecvar-value-handle-src-mq3-client-ui-shared-ml-674453657"></a>
### ItemParse_enableCvar

```ml
function ItemParse_enableCvar(value, handle)
```

Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_enableCvar`, returning its result for `value, handle, "enablecvar", 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseCvarGate`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseCvarGate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1616)

<a id="function-function-mq3-client-ui-shared-itemparse-feeder-function-itemparse-feeder-value-handle-src-mq3-client-ui-shared-ml-347448073"></a>
### ItemParse_feeder

```ml
function ItemParse_feeder(value, handle)
```

Updates `value.typeData.feeder`, `value.special` during UI shared `ItemParse_feeder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.feeder`, `value.special`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_feeder`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1457)

<a id="function-function-mq3-client-ui-shared-itemparse-focussound-function-itemparse-focussound-value-handle-src-mq3-client-ui-shared-ml-1025612005"></a>
### ItemParse_focusSound

```ml
function ItemParse_focusSound(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_focusSound`, returning its result for `value, handle, "focussound", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1377)

<a id="function-function-mq3-client-ui-shared-itemparse-forecolor-function-itemparse-forecolor-value-handle-src-mq3-client-ui-shared-ml-945155033"></a>
### ItemParse_forecolor

```ml
function ItemParse_forecolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_forecolor`, returning its result for `value, handle, "forecolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1513)

<a id="function-function-mq3-client-ui-shared-itemparse-group-function-itemparse-group-value-handle-src-mq3-client-ui-shared-ml-1297457425"></a>
### ItemParse_group

```ml
function ItemParse_group(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_group`, returning its result for `value, handle, "group", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1385)

<a id="function-function-mq3-client-ui-shared-itemparse-hidecvar-function-itemparse-hidecvar-value-handle-src-mq3-client-ui-shared-ml-191243869"></a>
### ItemParse_hideCvar

```ml
function ItemParse_hideCvar(value, handle)
```

Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_hideCvar`, returning its result for `value, handle, "hidecvar", 8`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseCvarGate`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseCvarGate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1628)

<a id="function-function-mq3-client-ui-shared-itemparse-horizontalscroll-function-itemparse-horizontalscroll-value-handle-src-mq3-client-ui-shared-ml-42608561"></a>
### ItemParse_horizontalscroll

```ml
function ItemParse_horizontalscroll(value, handle)
```

Enables horizontal list-box scrolling and sets the corresponding window flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.horizontal`, `value.window.flags`. |
| `handle` | `dynamic` | — | Accepted for compatibility with `ItemParse_horizontalscroll`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1441)

<a id="function-function-mq3-client-ui-shared-itemparse-leavefocus-function-itemparse-leavefocus-value-handle-src-mq3-client-ui-shared-ml-1418838129"></a>
### ItemParse_leaveFocus

```ml
function ItemParse_leaveFocus(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_leaveFocus`, returning its result for `value, handle, "leavefocus", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1541)

<a id="function-function-mq3-client-ui-shared-itemparse-maxchars-function-itemparse-maxchars-value-handle-src-mq3-client-ui-shared-ml-782229461"></a>
### ItemParse_maxChars

```ml
function ItemParse_maxChars(value, handle)
```

Updates `value.typeData.maxChars` during UI shared `ItemParse_maxChars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.maxChars`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_maxChars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1577)

<a id="function-function-mq3-client-ui-shared-itemparse-maxpaintchars-function-itemparse-maxpaintchars-value-handle-src-mq3-client-ui-shared-ml-1242416805"></a>
### ItemParse_maxPaintChars

```ml
function ItemParse_maxPaintChars(value, handle)
```

Updates `value.typeData.maxPaintChars` during UI shared `ItemParse_maxPaintChars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.maxPaintChars`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_maxPaintChars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1581)

<a id="function-function-mq3-client-ui-shared-itemparse-model-angle-function-itemparse-model-angle-value-handle-src-mq3-client-ui-shared-ml-1589802537"></a>
### ItemParse_model_angle

```ml
function ItemParse_model_angle(value, handle)
```

Updates `value.typeData.modelAngle` during UI shared `ItemParse_model_angle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.modelAngle`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_angle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1413)

<a id="function-function-mq3-client-ui-shared-itemparse-model-fovx-function-itemparse-model-fovx-value-handle-src-mq3-client-ui-shared-ml-1010108037"></a>
### ItemParse_model_fovx

```ml
function ItemParse_model_fovx(value, handle)
```

Updates `value.typeData.modelFovX` during UI shared `ItemParse_model_fovx`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.modelFovX`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_fovx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1401)

<a id="function-function-mq3-client-ui-shared-itemparse-model-fovy-function-itemparse-model-fovy-value-handle-src-mq3-client-ui-shared-ml-2036185289"></a>
### ItemParse_model_fovy

```ml
function ItemParse_model_fovy(value, handle)
```

Updates `value.typeData.modelFovY` during UI shared `ItemParse_model_fovy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.modelFovY`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_fovy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1405)

<a id="function-function-mq3-client-ui-shared-itemparse-model-origin-function-itemparse-model-origin-value-handle-src-mq3-client-ui-shared-ml-1081406853"></a>
### ItemParse_model_origin

```ml
function ItemParse_model_origin(value, handle)
```

Reads the three floating-point model-origin coordinates into the item's preview data.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.modelOrigin`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1397)

<a id="function-function-mq3-client-ui-shared-itemparse-model-rotation-function-itemparse-model-rotation-value-handle-src-mq3-client-ui-shared-ml-2123075041"></a>
### ItemParse_model_rotation

```ml
function ItemParse_model_rotation(value, handle)
```

Updates `value.typeData.modelRotation` during UI shared `ItemParse_model_rotation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.modelRotation`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_rotation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1409)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseenter-function-itemparse-mouseenter-value-handle-src-mq3-client-ui-shared-ml-805822881"></a>
### ItemParse_mouseEnter

```ml
function ItemParse_mouseEnter(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseEnter`, returning its result for `value, handle, "mouseenter", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1545)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseentertext-function-itemparse-mouseentertext-value-handle-src-mq3-client-ui-shared-ml-1388275573"></a>
### ItemParse_mouseEnterText

```ml
function ItemParse_mouseEnterText(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseEnterText`, returning its result for `value, handle, "mouseentertext", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1553)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseexit-function-itemparse-mouseexit-value-handle-src-mq3-client-ui-shared-ml-1167315941"></a>
### ItemParse_mouseExit

```ml
function ItemParse_mouseExit(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseExit`, returning its result for `value, handle, "mouseexit", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1549)

<a id="function-function-mq3-client-ui-shared-itemparse-mouseexittext-function-itemparse-mouseexittext-value-handle-src-mq3-client-ui-shared-ml-952422295"></a>
### ItemParse_mouseExitText

```ml
function ItemParse_mouseExitText(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseExitText`, returning its result for `value, handle, "mouseexittext", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1557)

<a id="function-function-mq3-client-ui-shared-itemparse-name-function-itemparse-name-value-handle-src-mq3-client-ui-shared-ml-776586997"></a>
### ItemParse_name

```ml
function ItemParse_name(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_name`, returning its result for `value, handle, "name", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1373)

<a id="function-function-mq3-client-ui-shared-itemparse-notselectable-function-itemparse-notselectable-value-handle-src-mq3-client-ui-shared-ml-619972721"></a>
### ItemParse_notselectable

```ml
function ItemParse_notselectable(value, handle)
```

Updates `value.typeData.notselectable` during UI shared `ItemParse_notselectable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.notselectable`. |
| `handle` | `dynamic` | — | Accepted for compatibility with `ItemParse_notselectable`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1429)

<a id="function-function-mq3-client-ui-shared-itemparse-onfocus-function-itemparse-onfocus-value-handle-src-mq3-client-ui-shared-ml-1842334245"></a>
### ItemParse_onFocus

```ml
function ItemParse_onFocus(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_onFocus`, returning its result for `value, handle, "onfocus", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1537)

<a id="function-function-mq3-client-ui-shared-itemparse-outlinecolor-function-itemparse-outlinecolor-value-handle-src-mq3-client-ui-shared-ml-1293645369"></a>
### ItemParse_outlinecolor

```ml
function ItemParse_outlinecolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_outlinecolor`, returning its result for `value, handle, "outlinecolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1521)

<a id="function-function-mq3-client-ui-shared-itemparse-ownerdraw-function-itemparse-ownerdraw-value-handle-src-mq3-client-ui-shared-ml-2000445945"></a>
### ItemParse_ownerdraw

```ml
function ItemParse_ownerdraw(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_ownerdraw`, returning its result for `value, handle, "ownerdraw", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1481)

<a id="function-function-mq3-client-ui-shared-itemparse-ownerdrawflag-function-itemparse-ownerdrawflag-value-handle-src-mq3-client-ui-shared-ml-462409229"></a>
### ItemParse_ownerdrawFlag

```ml
function ItemParse_ownerdrawFlag(value, handle)
```

Updates `value.ownerDrawFlags` during UI shared `ItemParse_ownerdrawFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.ownerDrawFlags`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `ItemParse_ownerdrawFlag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1606)

<a id="function-function-mq3-client-ui-shared-itemparse-rect-function-itemparse-rect-value-handle-src-mq3-client-ui-shared-ml-1172301709"></a>
### ItemParse_rect

```ml
function ItemParse_rect(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_rect`, returning its result for `value, handle, "rect", "rect"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1417)

<a id="function-function-mq3-client-ui-shared-itemparse-showcvar-function-itemparse-showcvar-value-handle-src-mq3-client-ui-shared-ml-1126023401"></a>
### ItemParse_showCvar

```ml
function ItemParse_showCvar(value, handle)
```

Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_showCvar`, returning its result for `value, handle, "showcvar", 4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseCvarGate`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseCvarGate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1624)

<a id="function-function-mq3-client-ui-shared-itemparse-special-function-itemparse-special-value-handle-src-mq3-client-ui-shared-ml-1948113053"></a>
### ItemParse_special

```ml
function ItemParse_special(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_special`, returning its result for `value, handle, "special", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1565)

<a id="function-function-mq3-client-ui-shared-itemparse-style-function-itemparse-style-value-handle-src-mq3-client-ui-shared-ml-1445025489"></a>
### ItemParse_style

```ml
function ItemParse_style(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_style`, returning its result for `value, handle, "style", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1421)

<a id="function-function-mq3-client-ui-shared-itemparse-text-function-itemparse-text-value-handle-src-mq3-client-ui-shared-ml-2051652561"></a>
### ItemParse_text

```ml
function ItemParse_text(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_text`, returning its result for `value, handle, "text", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1381)

<a id="function-function-mq3-client-ui-shared-itemparse-textalign-function-itemparse-textalign-value-handle-src-mq3-client-ui-shared-ml-1438941947"></a>
### ItemParse_textalign

```ml
function ItemParse_textalign(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textalign`, returning its result for `value, handle, "textalign", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1489)

<a id="function-function-mq3-client-ui-shared-itemparse-textalignx-function-itemparse-textalignx-value-handle-src-mq3-client-ui-shared-ml-88138037"></a>
### ItemParse_textalignx

```ml
function ItemParse_textalignx(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textalignx`, returning its result for `value, handle, "textalignx", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1493)

<a id="function-function-mq3-client-ui-shared-itemparse-textaligny-function-itemparse-textaligny-value-handle-src-mq3-client-ui-shared-ml-1094023409"></a>
### ItemParse_textaligny

```ml
function ItemParse_textaligny(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textaligny`, returning its result for `value, handle, "textaligny", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1497)

<a id="function-function-mq3-client-ui-shared-itemparse-textscale-function-itemparse-textscale-value-handle-src-mq3-client-ui-shared-ml-298141221"></a>
### ItemParse_textscale

```ml
function ItemParse_textscale(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textscale`, returning its result for `value, handle, "textscale", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1501)

<a id="function-function-mq3-client-ui-shared-itemparse-textstyle-function-itemparse-textstyle-value-handle-src-mq3-client-ui-shared-ml-377177211"></a>
### ItemParse_textstyle

```ml
function ItemParse_textstyle(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textstyle`, returning its result for `value, handle, "textstyle", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1505)

<a id="function-function-mq3-client-ui-shared-itemparse-type-function-itemparse-type-value-handle-src-mq3-client-ui-shared-ml-1420019849"></a>
### ItemParse_type

```ml
function ItemParse_type(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_type`, returning its result for `value, handle, "type", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1445)

<a id="function-function-mq3-client-ui-shared-itemparse-visible-function-itemparse-visible-value-handle-src-mq3-client-ui-shared-ml-861507559"></a>
### ItemParse_visible

```ml
function ItemParse_visible(value, handle)
```

Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_visible`, returning its result for `value, handle, "visible", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseItem`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1477)

<a id="function-function-mq3-client-ui-shared-itemparse-wrapped-function-itemparse-wrapped-value-handle-src-mq3-client-ui-shared-ml-1746529553"></a>
### ItemParse_wrapped

```ml
function ItemParse_wrapped(value, handle)
```

Adapts `mq3.client.ui_shared.putItem` to UI shared `ItemParse_wrapped`, returning its result for `value, "wrapped", 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.putItem`. |
| `handle` | `dynamic` | — | Accepted for compatibility with `ItemParse_wrapped`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1433)

<a id="function-function-mq3-client-ui-shared-itemparsekind-function-itemparsekind-value-handle-key-kind-src-mq3-client-ui-shared-ml-989161958"></a>
### itemParseKind

```ml
function itemParseKind(value, handle, key, kind)
```

Updates `value.window.rectClient`, `value.window.rect`, `value.window.backColor`, `value.window.foreColor` and additional values during UI shared `itemParseKind`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.rectClient`, `value.window.rect`, `value.window.backColor`, `value.window.foreColor` and additional values. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `itemParseKind`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1300)

<a id="constant-constant-mq3-client-ui-shared-k-alt-const-k-alt-136-src-mq3-client-ui-shared-ml-1364135153"></a>
### K_ALT

```ml
const K_ALT = 136
```

Engine key code for the alt input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L94)

<a id="constant-constant-mq3-client-ui-shared-k-backspace-const-k-backspace-127-src-mq3-client-ui-shared-ml-1901639823"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```

Engine key code for the backspace input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L84)

<a id="constant-constant-mq3-client-ui-shared-k-ctrl-const-k-ctrl-137-src-mq3-client-ui-shared-ml-1291355466"></a>
### K_CTRL

```ml
const K_CTRL = 137
```

Engine key code for the ctrl input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L96)

<a id="constant-constant-mq3-client-ui-shared-k-del-const-k-del-140-src-mq3-client-ui-shared-ml-881794188"></a>
### K_DEL

```ml
const K_DEL = 140
```

Engine key code for the del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L100)

<a id="constant-constant-mq3-client-ui-shared-k-downarrow-const-k-downarrow-133-src-mq3-client-ui-shared-ml-481919458"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```

Engine key code for the downarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L88)

<a id="constant-constant-mq3-client-ui-shared-k-end-const-k-end-144-src-mq3-client-ui-shared-ml-2114628196"></a>
### K_END

```ml
const K_END = 144
```

Engine key code for the end input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L104)

<a id="constant-constant-mq3-client-ui-shared-k-enter-const-k-enter-13-src-mq3-client-ui-shared-ml-1394583977"></a>
### K_ENTER

```ml
const K_ENTER = 13
```

Engine key code for the enter input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L78)

<a id="constant-constant-mq3-client-ui-shared-k-escape-const-k-escape-27-src-mq3-client-ui-shared-ml-1370217730"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```

Engine key code for the escape input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L80)

<a id="constant-constant-mq3-client-ui-shared-k-f1-const-k-f1-145-src-mq3-client-ui-shared-ml-569239295"></a>
### K_F1

```ml
const K_F1 = 145
```

Engine key code for the f1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L106)

<a id="constant-constant-mq3-client-ui-shared-k-f2-const-k-f2-146-src-mq3-client-ui-shared-ml-1543936108"></a>
### K_F2

```ml
const K_F2 = 146
```

Engine key code for the f2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L108)

<a id="constant-constant-mq3-client-ui-shared-k-f3-const-k-f3-147-src-mq3-client-ui-shared-ml-559898405"></a>
### K_F3

```ml
const K_F3 = 147
```

Engine key code for the f3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L110)

<a id="constant-constant-mq3-client-ui-shared-k-f4-const-k-f4-148-src-mq3-client-ui-shared-ml-1719568482"></a>
### K_F4

```ml
const K_F4 = 148
```

Engine key code for the f4 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L112)

<a id="constant-constant-mq3-client-ui-shared-k-f5-const-k-f5-149-src-mq3-client-ui-shared-ml-1809663363"></a>
### K_F5

```ml
const K_F5 = 149
```

Engine key code for the f5 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L114)

<a id="constant-constant-mq3-client-ui-shared-k-kp-pgdn-const-k-kp-pgdn-168-src-mq3-client-ui-shared-ml-2021606258"></a>
### K_KP_PGDN

```ml
const K_KP_PGDN = 168
```

Engine key code for the kp pgdn input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L118)

<a id="constant-constant-mq3-client-ui-shared-k-kp-pgup-const-k-kp-pgup-162-src-mq3-client-ui-shared-ml-2019448560"></a>
### K_KP_PGUP

```ml
const K_KP_PGUP = 162
```

Engine key code for the kp pgup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L116)

<a id="constant-constant-mq3-client-ui-shared-k-leftarrow-const-k-leftarrow-134-src-mq3-client-ui-shared-ml-1202439343"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```

Engine key code for the leftarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L90)

<a id="constant-constant-mq3-client-ui-shared-k-mouse1-const-k-mouse1-178-src-mq3-client-ui-shared-ml-1148140069"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```

Engine key code for the mouse1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L120)

<a id="constant-constant-mq3-client-ui-shared-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-shared-ml-1537697584"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L122)

<a id="constant-constant-mq3-client-ui-shared-k-mouse3-const-k-mouse3-180-src-mq3-client-ui-shared-ml-157370750"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = 180
```

Engine key code for the mouse3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L124)

<a id="constant-constant-mq3-client-ui-shared-k-mouse4-const-k-mouse4-181-src-mq3-client-ui-shared-ml-1980115103"></a>
### K_MOUSE4

```ml
const K_MOUSE4 = 181
```

Engine key code for the mouse4 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L126)

<a id="constant-constant-mq3-client-ui-shared-k-pgdn-const-k-pgdn-141-src-mq3-client-ui-shared-ml-211826103"></a>
### K_PGDN

```ml
const K_PGDN = 141
```

Engine key code for the pgdn input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L102)

<a id="constant-constant-mq3-client-ui-shared-k-rightarrow-const-k-rightarrow-135-src-mq3-client-ui-shared-ml-17608660"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```

Engine key code for the rightarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L92)

<a id="constant-constant-mq3-client-ui-shared-k-shift-const-k-shift-138-src-mq3-client-ui-shared-ml-969663235"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```

Engine key code for the shift input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L98)

<a id="constant-constant-mq3-client-ui-shared-k-space-const-k-space-32-src-mq3-client-ui-shared-ml-1018321436"></a>
### K_SPACE

```ml
const K_SPACE = 32
```

Engine key code for the space input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L82)

<a id="constant-constant-mq3-client-ui-shared-k-tab-const-k-tab-9-src-mq3-client-ui-shared-ml-258683312"></a>
### K_TAB

```ml
const K_TAB = 9
```

Engine key code for the tab input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L76)

<a id="constant-constant-mq3-client-ui-shared-k-uparrow-const-k-uparrow-132-src-mq3-client-ui-shared-ml-349434085"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```

Engine key code for the uparrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L86)

<a id="function-function-mq3-client-ui-shared-keytext-function-keytext-key-src-mq3-client-ui-shared-ml-128258621"></a>
### keyText

```ml
function keyText(key)
```

Calls `decode` from UI shared `keyText`. The final path returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1028)

<a id="function-function-mq3-client-ui-shared-keywordhash-add-function-keywordhash-add-table-key-src-mq3-client-ui-shared-ml-1269765545"></a>
### KeywordHash_Add

```ml
function KeywordHash_Add(table, key)
```

Adapts `mq3.client.ui_shared.pairSet` to UI shared `KeywordHash_Add`, returning its result for `table, key[0], key[1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.pairSet`. |
| `key` | `dynamic` | — | Argument 2, 3 of `mq3.client.ui_shared.pairSet`; passed as `key[0]`, `key[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1281)

<a id="function-function-mq3-client-ui-shared-keywordhash-find-function-keywordhash-find-table-keyword-src-mq3-client-ui-shared-ml-24600831"></a>
### KeywordHash_Find

```ml
function KeywordHash_Find(table, keyword)
```

Adapts `mq3.client.ui_shared.pairGet` to UI shared `KeywordHash_Find`, returning its result for `table, keyword, void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.pairGet`. |
| `keyword` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.pairGet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1285)

<a id="function-function-mq3-client-ui-shared-keywordhash-key-function-keywordhash-key-keyword-src-mq3-client-ui-shared-ml-978626451"></a>
### KeywordHash_Key

```ml
function KeywordHash_Key(keyword)
```

Keyword hash and declarative parsers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keyword` | `dynamic` | — | Value used by `for i=0 to len(bytes(keyword))-1 c=bytes(keyword)[i]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1277)

<a id="function-function-mq3-client-ui-shared-lerpcolor-function-lerpcolor-a-b-t-src-mq3-client-ui-shared-ml-67991391"></a>
### LerpColor

```ml
function LerpColor(a, b, t)
```

Linearly interpolates the four color components and clamps each result to the range zero through one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record read through `a.r`, `a.g`, `a.b`, `a.a`. |
| `b` | `dynamic` | — | Record read through `b.r`, `b.g`, `b.b`, `b.a`. |
| `t` | `dynamic` | — | Value used by `r=clamp(a.r+t*(b.r-a.r),0.0,1.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L606)

<a id="constant-constant-mq3-client-ui-shared-max-editfield-const-max-editfield-256-src-mq3-client-ui-shared-ml-998947382"></a>
### MAX_EDITFIELD

```ml
const MAX_EDITFIELD = 256
```

Maximum editable text length supported by the UI field implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L128)

<a id="constant-constant-mq3-client-ui-shared-max-menuitems-const-max-menuitems-96-src-mq3-client-ui-shared-ml-1971501354"></a>
### MAX_MENUITEMS

```ml
const MAX_MENUITEMS = 96
```

Capacity limit for the menuitems collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L130)

<a id="constant-constant-mq3-client-ui-shared-max-menus-const-max-menus-64-src-mq3-client-ui-shared-ml-572637055"></a>
### MAX_MENUS

```ml
const MAX_MENUS = 64
```

Capacity limit for the menus collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L132)

<a id="function-function-mq3-client-ui-shared-memory-function-memory-capacity-src-mq3-client-ui-shared-ml-825497194"></a>
### memory

```ml
function memory(capacity)
```

Creates a `mq3.client.ui_shared.Memory` record. Assigns `capacity` from `capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Value used to initialize `Memory.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L466)

- [mq3.client.ui_shared.Memory](Type-mq3-client-ui-shared-memory-662869782.md) — struct
<a id="function-function-mq3-client-ui-shared-menu-function-menu-src-mq3-client-ui-shared-ml-1628358782"></a>
### menu

```ml
function menu()
```

Creates a `mq3.client.ui_shared.Menu` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L459)

- [mq3.client.ui_shared.Menu](Type-mq3-client-ui-shared-menu-1007668034.md) — struct
<a id="function-function-mq3-client-ui-shared-menu-cachecontents-function-menu-cachecontents-dc-value-src-mq3-client-ui-shared-ml-646464950"></a>
### Menu_CacheContents

```ml
function Menu_CacheContents(dc, value)
```

Calls `mq3.client.ui_shared.Window_CacheContents`, `mq3.client.ui_shared.Item_CacheContents` from UI shared `Menu_CacheContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window`, `value.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1164)

<a id="function-function-mq3-client-ui-shared-menu-clearfocus-function-menu-clearfocus-value-src-mq3-client-ui-shared-ml-1065973869"></a>
### Menu_ClearFocus

```ml
function Menu_ClearFocus(value)
```

Updates `value.cursorItem` during UI shared `Menu_ClearFocus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.cursorItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L705)

<a id="function-function-mq3-client-ui-shared-menu-closecinematics-function-menu-closecinematics-dc-value-src-mq3-client-ui-shared-ml-681236446"></a>
### Menu_CloseCinematics

```ml
function Menu_CloseCinematics(dc, value)
```

Calls `mq3.client.ui_shared.Window_CloseCinematic` from UI shared `Menu_CloseCinematics`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window`, `value.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L929)

<a id="function-function-mq3-client-ui-shared-menu-count-function-menu-count-dc-src-mq3-client-ui-shared-ml-2036735461"></a>
### Menu_Count

```ml
function Menu_Count(dc)
```

Returns the element/byte count of `dc.menus` for UI shared `Menu_Count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L922)

<a id="function-function-mq3-client-ui-shared-menu-fadeitembyname-function-menu-fadeitembyname-value-name-fadeout-src-mq3-client-ui-shared-ml-1161545800"></a>
### Menu_FadeItemByName

```ml
function Menu_FadeItemByName(value, name, fadeOut)
```

Calls `mq3.client.ui_shared.same` from UI shared `Menu_FadeItemByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |
| `fadeOut` | `dynamic` | — | Value used by `for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if fadeOut then child.window.flags=(child....`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L783)

<a id="function-function-mq3-client-ui-shared-menu-finditembyname-function-menu-finditembyname-value-name-src-mq3-client-ui-shared-ml-1448789518"></a>
### Menu_FindItemByName

```ml
function Menu_FindItemByName(value, name)
```

Finds the first menu item whose window name matches case-insensitively, returning void if none matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L698)

<a id="function-function-mq3-client-ui-shared-menu-getfocused-function-menu-getfocused-dc-src-mq3-client-ui-shared-ml-1134986895"></a>
### Menu_GetFocused

```ml
function Menu_GetFocused(dc)
```

Evaluates UI shared `Menu_GetFocused` and returns `value`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L741)

<a id="function-function-mq3-client-ui-shared-menu-getfocuseditem-function-menu-getfocuseditem-value-src-mq3-client-ui-shared-ml-2069598947"></a>
### Menu_GetFocusedItem

```ml
function Menu_GetFocusedItem(value)
```

Evaluates UI shared `Menu_GetFocusedItem` and returns `value.items[value.cursorItem]`, `child`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.cursorItem`, `value.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L738)

<a id="function-function-mq3-client-ui-shared-menu-getmatchingitembynumber-function-menu-getmatchingitembynumber-value-index-name-src-mq3-client-ui-shared-ml-279249170"></a>
### Menu_GetMatchingItemByNumber

```ml
function Menu_GetMatchingItemByNumber(value, index, name)
```

Calls `mq3.client.ui_shared.same` from UI shared `Menu_GetMatchingItemByNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `index` | `dynamic` | — | Value tested by `found==index` before the calculation continues. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L694)

<a id="function-function-mq3-client-ui-shared-menu-handlekey-function-menu-handlekey-dc-value-key-down-src-mq3-client-ui-shared-ml-1531759733"></a>
### Menu_HandleKey

```ml
function Menu_HandleKey(dc, value, key, down)
```

Calls `mq3.client.ui_shared.Menu_GetFocusedItem`, `mq3.client.ui_shared.Item_HandleKey`, `mq3.client.ui_shared.Menu_SetNextCursorItem` and additional helpers from UI shared `Menu_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursorx`, `dc.cursory`. |
| `value` | `dynamic` | — | Record read through `value.onESC`, `value.window.name`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1211)

<a id="function-function-mq3-client-ui-shared-menu-handlemousemove-function-menu-handlemousemove-dc-value-x-y-src-mq3-client-ui-shared-ml-770755295"></a>
### Menu_HandleMouseMove

```ml
function Menu_HandleMouseMove(dc, value, x, y)
```

Calls `mq3.client.ui_shared.Menu_HitTest`, `mq3.client.ui_shared.Item_MouseEnter`, `mq3.client.ui_shared.Item_MouseLeave` and additional helpers from UI shared `Menu_HandleMouseMove`. The final path returns `hit is not void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Menu_HandleMouseMove`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Menu_HandleMouseMove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1217)

<a id="function-function-mq3-client-ui-shared-menu-hittest-function-menu-hittest-value-x-y-src-mq3-client-ui-shared-ml-568638034"></a>
### Menu_HitTest

```ml
function Menu_HitTest(value, x, y)
```

Searches visible menu items from back to front for the first rectangle containing the point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Menu_HitTest`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Menu_HitTest`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L730)

<a id="function-function-mq3-client-ui-shared-menu-init-function-menu-init-value-src-mq3-client-ui-shared-ml-2104435603"></a>
### Menu_Init

```ml
function Menu_Init(value)
```

Updates `value.window`, `value.items`, `value.cursorItem`, `value.properties` during UI shared `Menu_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window`, `value.items`, `value.cursorItem`, `value.properties`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L657)

<a id="function-function-mq3-client-ui-shared-menu-itemsmatchinggroup-function-menu-itemsmatchinggroup-value-name-src-mq3-client-ui-shared-ml-1951874650"></a>
### Menu_ItemsMatchingGroup

```ml
function Menu_ItemsMatchingGroup(value, name)
```

Menu/item lookup, visibility and focus.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L689)

<a id="function-function-mq3-client-ui-shared-menu-new-function-menu-new-dc-handle-src-mq3-client-ui-shared-ml-1245998727"></a>
### Menu_New

```ml
function Menu_New(dc, handle)
```

Parses and appends a menu unless MAX_MENUS has been reached or the source is malformed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.menus`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `Menu_New`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1355)

<a id="function-function-mq3-client-ui-shared-menu-orbititembyname-function-menu-orbititembyname-value-name-x-y-cx-cy-time-src-mq3-client-ui-shared-ml-280419397"></a>
### Menu_OrbitItemByName

```ml
function Menu_OrbitItemByName(value, name, x, y, cx, cy, time)
```

Calls `mq3.client.ui_shared.same`, `mq3.client.ui_shared.Item_UpdatePosition` from UI shared `Menu_OrbitItemByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |
| `x` | `dynamic` | — | Value assigned to `child.window.rectClient.x`. |
| `y` | `dynamic` | — | Value assigned to `child.window.rectClient.y`. |
| `cx` | `dynamic` | — | Value assigned to `child.window.rectEffects.x`. |
| `cy` | `dynamic` | — | Value assigned to `child.window.rectEffects.y`. |
| `time` | `dynamic` | — | Value assigned to `child.window.offsetTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L840)

<a id="function-function-mq3-client-ui-shared-menu-overactiveitem-function-menu-overactiveitem-value-x-y-src-mq3-client-ui-shared-ml-464577816"></a>
### Menu_OverActiveItem

```ml
function Menu_OverActiveItem(value, x, y)
```

Computes `Menu_HitTest(value,x,y) is not void` for UI shared `Menu_OverActiveItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return Menu_HitTest(value,x,y) is not void`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Menu_OverActiveItem`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Menu_OverActiveItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L735)

<a id="function-function-mq3-client-ui-shared-menu-paint-function-menu-paint-dc-value-forcepaint-src-mq3-client-ui-shared-ml-1007484301"></a>
### Menu_Paint

```ml
function Menu_Paint(dc, value, forcePaint)
```

Calls `mq3.client.ui_shared.IsVisible`, `mq3.client.ui_shared.Window_Paint`, `mq3.client.ui_shared.Item_Paint` from UI shared `Menu_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.window.flags`, `value.window`, `value.fadeAmount`, `value.fadeClamp` and additional values. |
| `forcePaint` | `dynamic` | — | Value used by `if not forcePaint and not IsVisible(value.window.flags) then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1157)

<a id="function-function-mq3-client-ui-shared-menu-paintall-function-menu-paintall-dc-src-mq3-client-ui-shared-ml-960271719"></a>
### Menu_PaintAll

```ml
function Menu_PaintAll(dc)
```

Calls `mq3.client.ui_shared.Menu_Paint` from UI shared `Menu_PaintAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1160)

<a id="function-function-mq3-client-ui-shared-menu-parse-function-menu-parse-handle-value-src-mq3-client-ui-shared-ml-113959373"></a>
### Menu_Parse

```ml
function Menu_Parse(handle, value)
```

Parses a menuDef block and its child items, applying supported properties and finalizing menu positions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `Menu_Parse`. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1351)

<a id="function-function-mq3-client-ui-shared-menu-postparse-function-menu-postparse-value-src-mq3-client-ui-shared-ml-1012526267"></a>
### Menu_PostParse

```ml
function Menu_PostParse(value)
```

Updates `value.window.rect` during UI shared `Menu_PostParse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.rect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L677)

<a id="function-function-mq3-client-ui-shared-menu-reset-function-menu-reset-dc-src-mq3-client-ui-shared-ml-2012079125"></a>
### Menu_Reset

```ml
function Menu_Reset(dc)
```

Updates `dc.menus`, `dc.focus`, `dc.capture` during UI shared `Menu_Reset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.menus`, `dc.focus`, `dc.capture`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L925)

<a id="function-function-mq3-client-ui-shared-menu-runclosescript-function-menu-runclosescript-dc-value-src-mq3-client-ui-shared-ml-1367755454"></a>
### Menu_RunCloseScript

```ml
function Menu_RunCloseScript(dc, value)
```

Calls `mq3.client.ui_shared.item`, `mq3.client.ui_shared.Item_RunScript` from UI shared `Menu_RunCloseScript`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.onClose`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L901)

<a id="function-function-mq3-client-ui-shared-menu-scrollfeeder-function-menu-scrollfeeder-dc-value-feeder-down-src-mq3-client-ui-shared-ml-11274723"></a>
### Menu_ScrollFeeder

```ml
function Menu_ScrollFeeder(dc, value, feeder, down)
```

Calls `mq3.client.ui_shared.Item_ListBox_HandleKey` from UI shared `Menu_ScrollFeeder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `feeder` | `dynamic` | — | Value used by `for each child in value.items if child.type==ITEM_TYPE_LISTBOX and child.special==feeder then return Item_ListBox_HandleKey(dc,child,key,true,...`. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1266)

<a id="function-function-mq3-client-ui-shared-menu-setfeederselection-function-menu-setfeederselection-dc-value-feeder-index-name-src-mq3-client-ui-shared-ml-967381764"></a>
### Menu_SetFeederSelection

```ml
function Menu_SetFeederSelection(dc, value, feeder, index, name)
```

Calls `mq3.client.ui_shared.same`, `mq3.client.ui_shared.emit` from UI shared `Menu_SetFeederSelection`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `feeder` | `dynamic` | — | Value used by `for each child in value.items if child.type==ITEM_TYPE_LISTBOX and child.special==feeder and (name=="" or same(child.window.name,name)) then c...`. |
| `index` | `dynamic` | — | Value assigned to `child.typeData.cursorPos`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1273)

<a id="function-function-mq3-client-ui-shared-menu-setnextcursoritem-function-menu-setnextcursoritem-value-src-mq3-client-ui-shared-ml-1644874703"></a>
### Menu_SetNextCursorItem

```ml
function Menu_SetNextCursorItem(value)
```

Updates `value.cursorItem` during UI shared `Menu_SetNextCursorItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.cursorItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1205)

<a id="function-function-mq3-client-ui-shared-menu-setprevcursoritem-function-menu-setprevcursoritem-value-src-mq3-client-ui-shared-ml-649778147"></a>
### Menu_SetPrevCursorItem

```ml
function Menu_SetPrevCursorItem(value)
```

Keyboard, mouse and display capture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.cursorItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1202)

<a id="function-function-mq3-client-ui-shared-menu-setupkeywordhash-function-menu-setupkeywordhash-src-mq3-client-ui-shared-ml-95864214"></a>
### Menu_SetupKeywordHash

```ml
function Menu_SetupKeywordHash()
```

Adapts `mq3.client.ui_shared.menuKeywords` to UI shared `Menu_SetupKeywordHash`, returning its result for `no arguments`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1289)

<a id="function-function-mq3-client-ui-shared-menu-showitembyname-function-menu-showitembyname-value-name-show-src-mq3-client-ui-shared-ml-826327681"></a>
### Menu_ShowItemByName

```ml
function Menu_ShowItemByName(value, name, show)
```

Calls `mq3.client.ui_shared.same` from UI shared `Menu_ShowItemByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |
| `show` | `dynamic` | — | Value used by `for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if show then child.window.flags=child.wind...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L778)

<a id="function-function-mq3-client-ui-shared-menu-transitionitembyname-function-menu-transitionitembyname-value-name-fromrect-torect-time-amount-src-mq3-client-ui-shared-ml-1563927458"></a>
### Menu_TransitionItemByName

```ml
function Menu_TransitionItemByName(value, name, fromRect, toRect, time, amount)
```

Calls `mq3.client.ui_shared.same`, `mq3.client.ui_shared.rect`, `mq3.client.ui_shared.Item_UpdatePosition` from UI shared `Menu_TransitionItemByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |
| `fromRect` | `dynamic` | — | Record read through `fromRect.x`, `fromRect.y`, `fromRect.w`, `fromRect.h`. |
| `toRect` | `dynamic` | — | Record read through `toRect.x`, `toRect.y`, `toRect.w`, `toRect.h`. |
| `time` | `dynamic` | — | Value assigned to `child.window.offsetTime`. |
| `amount` | `dynamic` | — | Value tested by `amount==0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L826)

<a id="function-function-mq3-client-ui-shared-menu-updateposition-function-menu-updateposition-value-src-mq3-client-ui-shared-ml-786867687"></a>
### Menu_UpdatePosition

```ml
function Menu_UpdatePosition(value)
```

Calls `mq3.client.ui_shared.Item_UpdatePosition` from UI shared `Menu_UpdatePosition`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L674)

<a id="function-function-mq3-client-ui-shared-menukeywords-function-menukeywords-src-mq3-client-ui-shared-ml-184041358"></a>
### menuKeywords

```ml
function menuKeywords()
```

Provides the menu keywords table used by UI shared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1347)

<a id="function-function-mq3-client-ui-shared-menuparse-backcolor-function-menuparse-backcolor-value-handle-src-mq3-client-ui-shared-ml-447069075"></a>
### MenuParse_backcolor

```ml
function MenuParse_backcolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_backcolor`, returning its result for `value, handle, "backcolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1677)

<a id="function-function-mq3-client-ui-shared-menuparse-background-function-menuparse-background-value-handle-src-mq3-client-ui-shared-ml-1914331233"></a>
### MenuParse_background

```ml
function MenuParse_background(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_background`, returning its result for `value, handle, "background", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1701)

<a id="function-function-mq3-client-ui-shared-menuparse-border-function-menuparse-border-value-handle-src-mq3-client-ui-shared-ml-2031599517"></a>
### MenuParse_border

```ml
function MenuParse_border(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_border`, returning its result for `value, handle, "border", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1669)

<a id="function-function-mq3-client-ui-shared-menuparse-bordercolor-function-menuparse-bordercolor-value-handle-src-mq3-client-ui-shared-ml-741626721"></a>
### MenuParse_bordercolor

```ml
function MenuParse_bordercolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_bordercolor`, returning its result for `value, handle, "bordercolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1685)

<a id="function-function-mq3-client-ui-shared-menuparse-bordersize-function-menuparse-bordersize-value-handle-src-mq3-client-ui-shared-ml-1008170253"></a>
### MenuParse_borderSize

```ml
function MenuParse_borderSize(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_borderSize`, returning its result for `value, handle, "bordersize", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1673)

<a id="function-function-mq3-client-ui-shared-menuparse-cinematic-function-menuparse-cinematic-value-handle-src-mq3-client-ui-shared-ml-800784753"></a>
### MenuParse_cinematic

```ml
function MenuParse_cinematic(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_cinematic`, returning its result for `value, handle, "cinematic", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1705)

<a id="function-function-mq3-client-ui-shared-menuparse-disablecolor-function-menuparse-disablecolor-value-handle-src-mq3-client-ui-shared-ml-355065029"></a>
### MenuParse_disablecolor

```ml
function MenuParse_disablecolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_disablecolor`, returning its result for `value, handle, "disablecolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1693)

<a id="function-function-mq3-client-ui-shared-menuparse-fadeamount-function-menuparse-fadeamount-value-handle-src-mq3-client-ui-shared-ml-247809773"></a>
### MenuParse_fadeAmount

```ml
function MenuParse_fadeAmount(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fadeAmount`, returning its result for `value, handle, "fadeamount", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1733)

<a id="function-function-mq3-client-ui-shared-menuparse-fadeclamp-function-menuparse-fadeclamp-value-handle-src-mq3-client-ui-shared-ml-584872305"></a>
### MenuParse_fadeClamp

```ml
function MenuParse_fadeClamp(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fadeClamp`, returning its result for `value, handle, "fadeclamp", "float"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1729)

<a id="function-function-mq3-client-ui-shared-menuparse-fadecycle-function-menuparse-fadecycle-value-handle-src-mq3-client-ui-shared-ml-356174711"></a>
### MenuParse_fadeCycle

```ml
function MenuParse_fadeCycle(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fadeCycle`, returning its result for `value, handle, "fadecycle", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1737)

<a id="function-function-mq3-client-ui-shared-menuparse-focuscolor-function-menuparse-focuscolor-value-handle-src-mq3-client-ui-shared-ml-1323773"></a>
### MenuParse_focuscolor

```ml
function MenuParse_focuscolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_focuscolor`, returning its result for `value, handle, "focuscolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1689)

<a id="function-function-mq3-client-ui-shared-menuparse-font-function-menuparse-font-value-handle-src-mq3-client-ui-shared-ml-168048881"></a>
### MenuParse_font

```ml
function MenuParse_font(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_font`, returning its result for `value, handle, "font", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1633)

<a id="function-function-mq3-client-ui-shared-menuparse-forecolor-function-menuparse-forecolor-value-handle-src-mq3-client-ui-shared-ml-1407130673"></a>
### MenuParse_forecolor

```ml
function MenuParse_forecolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_forecolor`, returning its result for `value, handle, "forecolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1681)

<a id="function-function-mq3-client-ui-shared-menuparse-fullscreen-function-menuparse-fullscreen-value-handle-src-mq3-client-ui-shared-ml-1314801761"></a>
### MenuParse_fullscreen

```ml
function MenuParse_fullscreen(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fullscreen`, returning its result for `value, handle, "fullscreen", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1641)

<a id="function-function-mq3-client-ui-shared-menuparse-itemdef-function-menuparse-itemdef-value-handle-src-mq3-client-ui-shared-ml-203377791"></a>
### MenuParse_itemDef

```ml
function MenuParse_itemDef(value, handle)
```

Updates `value.items` during UI shared `MenuParse_itemDef`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.items`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `MenuParse_itemDef`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1741)

<a id="function-function-mq3-client-ui-shared-menuparse-name-function-menuparse-name-value-handle-src-mq3-client-ui-shared-ml-1099027001"></a>
### MenuParse_name

```ml
function MenuParse_name(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_name`, returning its result for `value, handle, "name", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1637)

<a id="function-function-mq3-client-ui-shared-menuparse-onclose-function-menuparse-onclose-value-handle-src-mq3-client-ui-shared-ml-1914959869"></a>
### MenuParse_onClose

```ml
function MenuParse_onClose(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_onClose`, returning its result for `value, handle, "onclose", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1661)

<a id="function-function-mq3-client-ui-shared-menuparse-onesc-function-menuparse-onesc-value-handle-src-mq3-client-ui-shared-ml-1134661711"></a>
### MenuParse_onESC

```ml
function MenuParse_onESC(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_onESC`, returning its result for `value, handle, "onesc", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1665)

<a id="function-function-mq3-client-ui-shared-menuparse-onopen-function-menuparse-onopen-value-handle-src-mq3-client-ui-shared-ml-1309051617"></a>
### MenuParse_onOpen

```ml
function MenuParse_onOpen(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_onOpen`, returning its result for `value, handle, "onopen", "script"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1657)

<a id="function-function-mq3-client-ui-shared-menuparse-outlinecolor-function-menuparse-outlinecolor-value-handle-src-mq3-client-ui-shared-ml-526445233"></a>
### MenuParse_outlinecolor

```ml
function MenuParse_outlinecolor(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_outlinecolor`, returning its result for `value, handle, "outlinecolor", "color"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1697)

<a id="function-function-mq3-client-ui-shared-menuparse-outofbounds-function-menuparse-outofbounds-value-handle-src-mq3-client-ui-shared-ml-1453626239"></a>
### MenuParse_outOfBounds

```ml
function MenuParse_outOfBounds(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_outOfBounds`, returning its result for `value, handle, "outofbounds", "flag"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1721)

<a id="function-function-mq3-client-ui-shared-menuparse-ownerdraw-function-menuparse-ownerdraw-value-handle-src-mq3-client-ui-shared-ml-1597756081"></a>
### MenuParse_ownerdraw

```ml
function MenuParse_ownerdraw(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_ownerdraw`, returning its result for `value, handle, "ownerdraw", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1713)

<a id="function-function-mq3-client-ui-shared-menuparse-ownerdrawflag-function-menuparse-ownerdrawflag-value-handle-src-mq3-client-ui-shared-ml-99977689"></a>
### MenuParse_ownerdrawFlag

```ml
function MenuParse_ownerdrawFlag(value, handle)
```

Updates `value.ownerDrawFlags` during UI shared `MenuParse_ownerdrawFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.ownerDrawFlags`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `MenuParse_ownerdrawFlag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1709)

<a id="function-function-mq3-client-ui-shared-menuparse-popup-function-menuparse-popup-value-handle-src-mq3-client-ui-shared-ml-2138620787"></a>
### MenuParse_popup

```ml
function MenuParse_popup(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_popup`, returning its result for `value, handle, "popup", "flag"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1717)

<a id="function-function-mq3-client-ui-shared-menuparse-rect-function-menuparse-rect-value-handle-src-mq3-client-ui-shared-ml-962571909"></a>
### MenuParse_rect

```ml
function MenuParse_rect(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_rect`, returning its result for `value, handle, "rect", "rect"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1645)

<a id="function-function-mq3-client-ui-shared-menuparse-soundloop-function-menuparse-soundloop-value-handle-src-mq3-client-ui-shared-ml-1519411929"></a>
### MenuParse_soundLoop

```ml
function MenuParse_soundLoop(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_soundLoop`, returning its result for `value, handle, "soundloop", "string"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1725)

<a id="function-function-mq3-client-ui-shared-menuparse-style-function-menuparse-style-value-handle-src-mq3-client-ui-shared-ml-856592457"></a>
### MenuParse_style

```ml
function MenuParse_style(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_style`, returning its result for `value, handle, "style", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1649)

<a id="function-function-mq3-client-ui-shared-menuparse-visible-function-menuparse-visible-value-handle-src-mq3-client-ui-shared-ml-822144439"></a>
### MenuParse_visible

```ml
function MenuParse_visible(value, handle)
```

Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_visible`, returning its result for `value, handle, "visible", "int"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.parseMenu`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.parseMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1653)

<a id="function-function-mq3-client-ui-shared-menuparsekind-function-menuparsekind-value-handle-key-kind-src-mq3-client-ui-shared-ml-539905710"></a>
### menuParseKind

```ml
function menuParseKind(value, handle, key, kind)
```

Updates `value.window.rect`, `value.window.backColor`, `value.window.foreColor`, `value.window.borderColor` and additional values during UI shared `menuParseKind`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.rect`, `value.window.backColor`, `value.window.foreColor`, `value.window.borderColor` and additional values. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `menuParseKind`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1345)

<a id="function-function-mq3-client-ui-shared-menus-activate-function-menus-activate-dc-value-src-mq3-client-ui-shared-ml-1310567838"></a>
### Menus_Activate

```ml
function Menus_Activate(dc, value)
```

Updates `value.window.flags`, `dc.focus` during UI shared `Menus_Activate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.focus`. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L912)

<a id="function-function-mq3-client-ui-shared-menus-activatebyname-function-menus-activatebyname-dc-name-src-mq3-client-ui-shared-ml-312325420"></a>
### Menus_ActivateByName

```ml
function Menus_ActivateByName(dc, name)
```

Calls `mq3.client.ui_shared.Menus_FindByName`, `mq3.client.ui_shared.Menus_Activate` from UI shared `Menus_ActivateByName`. The final path returns `Menus_Activate(dc,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L916)

<a id="function-function-mq3-client-ui-shared-menus-anyfullscreenvisible-function-menus-anyfullscreenvisible-dc-src-mq3-client-ui-shared-ml-857006585"></a>
### Menus_AnyFullScreenVisible

```ml
function Menus_AnyFullScreenVisible(dc)
```

Calls `mq3.client.ui_shared.IsVisible` from UI shared `Menus_AnyFullScreenVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L919)

<a id="function-function-mq3-client-ui-shared-menus-closeall-function-menus-closeall-dc-src-mq3-client-ui-shared-ml-303944097"></a>
### Menus_CloseAll

```ml
function Menus_CloseAll(dc)
```

Updates `dc.focus` during UI shared `Menus_CloseAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.focus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L908)

<a id="function-function-mq3-client-ui-shared-menus-closebyname-function-menus-closebyname-dc-name-src-mq3-client-ui-shared-ml-1895165850"></a>
### Menus_CloseByName

```ml
function Menus_CloseByName(dc, name)
```

Updates `dc.focus` during UI shared `Menus_CloseByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.focus`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L905)

<a id="function-function-mq3-client-ui-shared-menus-findbyname-function-menus-findbyname-dc-name-src-mq3-client-ui-shared-ml-440048276"></a>
### Menus_FindByName

```ml
function Menus_FindByName(dc, name)
```

Finds a display menu by case-insensitive window name, returning void if it is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L702)

<a id="function-function-mq3-client-ui-shared-menus-handleoobclick-function-menus-handleoobclick-dc-value-key-down-src-mq3-client-ui-shared-ml-1160875229"></a>
### Menus_HandleOOBClick

```ml
function Menus_HandleOOBClick(dc, value, key, down)
```

Calls `mq3.client.ui_shared.Menus_CloseByName` from UI shared `Menus_HandleOOBClick`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.outOfBounds`, `value.window.name`. |
| `key` | `dynamic` | — | Accepted for compatibility with `Menus_HandleOOBClick`; the current implementation does not read it. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1234)

<a id="function-function-mq3-client-ui-shared-menus-openbyname-function-menus-openbyname-dc-name-src-mq3-client-ui-shared-ml-1414316996"></a>
### Menus_OpenByName

```ml
function Menus_OpenByName(dc, name)
```

Computes `Menus_ActivateByName(dc,name) is not void` for UI shared `Menus_OpenByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L897)

<a id="function-function-mq3-client-ui-shared-menus-showbyname-function-menus-showbyname-dc-name-src-mq3-client-ui-shared-ml-1947413548"></a>
### Menus_ShowByName

```ml
function Menus_ShowByName(dc, name)
```

Menu lifecycle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L893)

<a id="function-function-mq3-client-ui-shared-movecomponent-function-movecomponent-current-target-step-src-mq3-client-ui-shared-ml-277971346"></a>
### moveComponent

```ml
function moveComponent(current, target, step)
```

Evaluates UI shared `moveComponent` and returns `[current,1]`, `[target,1]`, `[current,0]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — | Value used by `if current==target then return [current,1] end if`. |
| `target` | `dynamic` | — | Value used by `if current==target then return [current,1] end if`. |
| `step` | `dynamic` | — | Value used by `if current<target then current=current+step`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1135)

<a id="function-function-mq3-client-ui-shared-next-function-next-source-src-mq3-client-ui-shared-ml-1027390733"></a>
### next

```ml
function next(source)
```

Adapts `mq3.shared.parser.parseExt` to UI shared `next`, returning its result for `source.scan, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.scan`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L503)

<a id="function-function-mq3-client-ui-shared-painttext-function-painttext-dc-value-text-kind-src-mq3-client-ui-shared-ml-404212227"></a>
### paintText

```ml
function paintText(dc, value, text, kind)
```

Calls `mq3.client.ui_shared.Item_TextColor`, `mq3.client.ui_shared.Item_SetTextExtents`, `mq3.client.ui_shared.emit` from UI shared `paintText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.textStyle`, `value.window.rect.x`, `value.textalignx`, `value.window.rect.y` and additional values. |
| `text` | `dynamic` | — | Text consumed or emitted by `paintText` in the UI shared path. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1082)

<a id="function-function-mq3-client-ui-shared-pairget-function-pairget-pairs-key-otherwise-src-mq3-client-ui-shared-ml-1088856174"></a>
### pairGet

```ml
function pairGet(pairs, key, otherwise)
```

Looks up a case-insensitive key in a pair list, returning the supplied fallback when no pair matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — | Value used by `for each pair in pairs if same(pair[0],key) then return pair[1] end if end for`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `otherwise` | `dynamic` | — | Value used by `return otherwise`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L495)

<a id="function-function-mq3-client-ui-shared-pairset-function-pairset-pairs-key-value-src-mq3-client-ui-shared-ml-211438399"></a>
### pairSet

```ml
function pairSet(pairs, key, value)
```

Returns a pair list with matching case-insensitive keys replaced, or appends the key/value pair if it is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — | Value used by `for each pair in pairs if same(pair[0],key) then result=result+[[key,value]]`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `value` | `dynamic` | — | Value used by `for each pair in pairs if same(pair[0],key) then result=result+[[key,value]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L500)

<a id="function-function-mq3-client-ui-shared-parsecvargate-function-parsecvargate-value-handle-key-flag-src-mq3-client-ui-shared-ml-958948090"></a>
### parseCvarGate

```ml
function parseCvarGate(value, handle, key, flag)
```

Updates `value.enableCvar`, `value.cvarFlags` during UI shared `parseCvarGate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.enableCvar`, `value.cvarFlags`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `parseCvarGate`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `flag` | `dynamic` | — | Value used by `value.cvarFlags=value.cvarFlags\|flag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1612)

<a id="function-function-mq3-client-ui-shared-parseitem-function-parseitem-value-handle-key-kind-src-mq3-client-ui-shared-ml-462598102"></a>
### parseItem

```ml
function parseItem(value, handle, key, kind)
```

Parse-entry wrappers retain the original public symbol surface.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.itemParseKind`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.itemParseKind`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.ui_shared.itemParseKind`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.ui_shared.itemParseKind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1362)

<a id="function-function-mq3-client-ui-shared-parselist-function-parselist-value-handle-floatvalues-src-mq3-client-ui-shared-ml-1354686791"></a>
### parseList

```ml
function parseList(value, handle, floatValues)
```

Updates `value.typeData.settings`, `value.typeData.values` during UI shared `parseList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.settings`, `value.typeData.values`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `parseList`. |
| `floatValues` | `dynamic` | — | Value used by `if floatValues then value.typeData.values=value.typeData.values+[numbers.atof(raw)] else value.typeData.values=value.typeData.values+[raw] end...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1590)

<a id="function-function-mq3-client-ui-shared-parsemenu-function-parsemenu-value-handle-key-kind-src-mq3-client-ui-shared-ml-1177033262"></a>
### parseMenu

```ml
function parseMenu(value, handle, key, kind)
```

Adapts `mq3.client.ui_shared.menuParseKind` to UI shared `parseMenu`, returning its result for `value, handle, key, kind`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.menuParseKind`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.menuParseKind`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.ui_shared.menuParseKind`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.ui_shared.menuParseKind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1368)

<a id="function-function-mq3-client-ui-shared-pc-color-parse-function-pc-color-parse-handle-src-mq3-client-ui-shared-ml-1082724388"></a>
### PC_Color_Parse

```ml
function PC_Color_Parse(handle)
```

Adapts `mq3.client.ui_shared.Color_Parse` to UI shared `PC_Color_Parse`, returning its result for `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.Color_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L557)

<a id="function-function-mq3-client-ui-shared-pc-float-parse-function-pc-float-parse-handle-src-mq3-client-ui-shared-ml-1017356464"></a>
### PC_Float_Parse

```ml
function PC_Float_Parse(handle)
```

Adapts `mq3.client.ui_shared.Float_Parse` to UI shared `PC_Float_Parse`, returning its result for `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.Float_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L551)

<a id="function-function-mq3-client-ui-shared-pc-int-parse-function-pc-int-parse-handle-src-mq3-client-ui-shared-ml-740338820"></a>
### PC_Int_Parse

```ml
function PC_Int_Parse(handle)
```

Adapts `mq3.client.ui_shared.Int_Parse` to UI shared `PC_Int_Parse`, returning its result for `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.Int_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L554)

<a id="function-function-mq3-client-ui-shared-pc-rect-parse-function-pc-rect-parse-handle-src-mq3-client-ui-shared-ml-1950185848"></a>
### PC_Rect_Parse

```ml
function PC_Rect_Parse(handle)
```

Adapts `mq3.client.ui_shared.Rect_Parse` to UI shared `PC_Rect_Parse`, returning its result for `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.Rect_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L560)

<a id="function-function-mq3-client-ui-shared-pc-script-parse-function-pc-script-parse-handle-src-mq3-client-ui-shared-ml-757369126"></a>
### PC_Script_Parse

```ml
function PC_Script_Parse(handle)
```

Reads a brace-delimited UI script, preserving nested brace groups and returning void on a missing opener or premature end.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `PC_Script_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L566)

<a id="function-function-mq3-client-ui-shared-pc-sourceerror-function-pc-sourceerror-handle-message-src-mq3-client-ui-shared-ml-1029010795"></a>
### PC_SourceError

```ml
function PC_SourceError(handle, message)
```

Updates `handle.errors` during UI shared `PC_SourceError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `handle.errors`. |
| `message` | `dynamic` | — | Value used by `handle.errors=handle.errors+[handle.name+": "+message]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L574)

<a id="function-function-mq3-client-ui-shared-pc-sourcewarning-function-pc-sourcewarning-handle-message-src-mq3-client-ui-shared-ml-176254687"></a>
### PC_SourceWarning

```ml
function PC_SourceWarning(handle, message)
```

Updates `handle.warnings` during UI shared `PC_SourceWarning`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `handle.warnings`. |
| `message` | `dynamic` | — | Value used by `handle.warnings=handle.warnings+[handle.name+": "+message]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L570)

<a id="function-function-mq3-client-ui-shared-pc-string-parse-function-pc-string-parse-handle-src-mq3-client-ui-shared-ml-360669846"></a>
### PC_String_Parse

```ml
function PC_String_Parse(handle)
```

Adapts `mq3.client.ui_shared.String_Parse` to UI shared `PC_String_Parse`, returning its result for `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.String_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L563)

<a id="function-function-mq3-client-ui-shared-putitem-function-putitem-value-key-data-src-mq3-client-ui-shared-ml-940877522"></a>
### putItem

```ml
function putItem(value, key, data)
```

Updates `value.properties`, `value.window.name`, `value.window.group`, `value.text` and additional values during UI shared `putItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.properties`, `value.window.name`, `value.window.group`, `value.text` and additional values. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `data` | `dynamic` | — | Value assigned to `value.window.name`, `value.window.group`, `value.text`, `value.type` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1294)

<a id="function-function-mq3-client-ui-shared-putmenu-function-putmenu-value-key-data-src-mq3-client-ui-shared-ml-461218470"></a>
### putMenu

```ml
function putMenu(value, key, data)
```

Updates `value.properties`, `value.window.name`, `value.fullScreen`, `value.window.style` and additional values during UI shared `putMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.properties`, `value.window.name`, `value.fullScreen`, `value.window.style` and additional values. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI shared entry. |
| `data` | `dynamic` | — | Value assigned to `value.window.name`, `value.fullScreen`, `value.window.style`, `value.onOpen` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1339)

<a id="function-function-mq3-client-ui-shared-rect-function-rect-x-y-w-h-src-mq3-client-ui-shared-ml-1362310986"></a>
### rect

```ml
function rect(x, y, w, h)
```

Creates a `mq3.client.ui_shared.Rect` record. Assigns `x` from `x`, `y` from `y`, `w` from `w`, `h` from `h`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `Rect.x`. |
| `y` | `dynamic` | — | Value used to initialize `Rect.y`. |
| `w` | `dynamic` | — | Value used to initialize `Rect.w`. |
| `h` | `dynamic` | — | Value used to initialize `Rect.h`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L445)

- [mq3.client.ui_shared.Rect](Type-mq3-client-ui-shared-rect-1995140079.md) — struct
<a id="function-function-mq3-client-ui-shared-rect-containspoint-function-rect-containspoint-value-x-y-src-mq3-client-ui-shared-ml-1775096458"></a>
### Rect_ContainsPoint

```ml
function Rect_ContainsPoint(value, x, y)
```

Tests whether a point lies strictly inside the rectangle; points on any edge are excluded.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.x`, `value.w`, `value.y`, `value.h`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Rect_ContainsPoint`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Rect_ContainsPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L586)

<a id="function-function-mq3-client-ui-shared-rect-parse-function-rect-parse-source-src-mq3-client-ui-shared-ml-733439697"></a>
### Rect_Parse

```ml
function Rect_Parse(source)
```

Calls `mq3.client.ui_shared.next`, `mq3.compat.textnumbers.atof`, `mq3.client.ui_shared.rect` from UI shared `Rect_Parse`. The final path returns `rect(values[0],values[1],values[2],values[3])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `for i=0 to 3 token=next(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L545)

<a id="function-function-mq3-client-ui-shared-rect-towindowcoords-function-rect-towindowcoords-value-window-src-mq3-client-ui-shared-ml-1719557759"></a>
### Rect_ToWindowCoords

```ml
function Rect_ToWindowCoords(value, window)
```

Offsets a rectangle in place by its containing window's X/Y origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.x`, `value.y`. |
| `window` | `dynamic` | — | Record read through `window.rect.x`, `window.rect.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L597)

<a id="function-function-mq3-client-ui-shared-same-function-same-a-b-src-mq3-client-ui-shared-ml-243397819"></a>
### same

```ml
function same(a, b)
```

Compares two UI shared names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `b` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L482)

<a id="function-function-mq3-client-ui-shared-script-close-function-script-close-dc-value-args-src-mq3-client-ui-shared-ml-269363745"></a>
### Script_Close

```ml
function Script_Close(dc, value, args)
```

Calls `mq3.client.ui_shared.Menus_CloseByName`, `mq3.client.ui_shared.scriptValue` from UI shared `Script_Close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_Close`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `Menus_CloseByName(dc,scriptValue(args))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L818)

<a id="function-function-mq3-client-ui-shared-script-conditionalopen-function-script-conditionalopen-dc-value-args-src-mq3-client-ui-shared-ml-1789939193"></a>
### Script_ConditionalOpen

```ml
function Script_ConditionalOpen(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.same`, `mq3.client.ui_shared.pairGet` and additional helpers from UI shared `Script_ConditionalOpen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_ConditionalOpen`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `cvar=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L813)

<a id="function-function-mq3-client-ui-shared-script-exec-function-script-exec-dc-value-args-src-mq3-client-ui-shared-ml-799721799"></a>
### Script_Exec

```ml
function Script_Exec(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.emit` from UI shared `Script_Exec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_Exec`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `command=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L870)

<a id="function-function-mq3-client-ui-shared-script-fadein-function-script-fadein-dc-value-args-src-mq3-client-ui-shared-ml-814785479"></a>
### Script_FadeIn

```ml
function Script_FadeIn(dc, value, args)
```

Adapts `mq3.client.ui_shared.Menu_FadeItemByName` to UI shared `Script_FadeIn`, returning its result for `value.parent, scriptValue(args), false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_FadeIn`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Menu_FadeItemByName`; passed as `scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L798)

<a id="function-function-mq3-client-ui-shared-script-fadeout-function-script-fadeout-dc-value-args-src-mq3-client-ui-shared-ml-725848561"></a>
### Script_FadeOut

```ml
function Script_FadeOut(dc, value, args)
```

Adapts `mq3.client.ui_shared.Menu_FadeItemByName` to UI shared `Script_FadeOut`, returning its result for `value.parent, scriptValue(args), true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_FadeOut`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Menu_FadeItemByName`; passed as `scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L803)

<a id="function-function-mq3-client-ui-shared-script-hide-function-script-hide-dc-value-args-src-mq3-client-ui-shared-ml-2041907497"></a>
### Script_Hide

```ml
function Script_Hide(dc, value, args)
```

Adapts `mq3.client.ui_shared.Menu_ShowItemByName` to UI shared `Script_Hide`, returning its result for `value.parent, scriptValue(args), false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_Hide`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Menu_ShowItemByName`; passed as `scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L793)

<a id="function-function-mq3-client-ui-shared-script-open-function-script-open-dc-value-args-src-mq3-client-ui-shared-ml-1262549697"></a>
### Script_Open

```ml
function Script_Open(dc, value, args)
```

Calls `mq3.client.ui_shared.Menus_OpenByName`, `mq3.client.ui_shared.scriptValue` from UI shared `Script_Open`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_Open`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `Menus_OpenByName(dc,scriptValue(args))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L808)

<a id="function-function-mq3-client-ui-shared-script-orbit-function-script-orbit-dc-value-args-src-mq3-client-ui-shared-ml-848533553"></a>
### Script_Orbit

```ml
function Script_Orbit(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Float_Parse`, `mq3.client.ui_shared.Int_Parse` and additional helpers from UI shared `Script_Orbit`. The final path returns `Menu_OrbitItemByName(value.parent,name,x,y,cx,cy,time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_Orbit`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Value used by `name=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L845)

<a id="function-function-mq3-client-ui-shared-script-play-function-script-play-dc-value-args-src-mq3-client-ui-shared-ml-1561009873"></a>
### Script_Play

```ml
function Script_Play(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.emit` from UI shared `Script_Play`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_Play`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `sound=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L875)

<a id="function-function-mq3-client-ui-shared-script-playlooped-function-script-playlooped-dc-value-args-src-mq3-client-ui-shared-ml-477911583"></a>
### Script_playLooped

```ml
function Script_playLooped(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.emit` from UI shared `Script_playLooped`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_playLooped`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `sound=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L880)

<a id="function-function-mq3-client-ui-shared-script-setasset-function-script-setasset-dc-value-args-src-mq3-client-ui-shared-ml-756560905"></a>
### Script_SetAsset

```ml
function Script_SetAsset(dc, value, args)
```

Updates `value.window.background` during UI shared `Script_SetAsset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.background`. |
| `args` | `dynamic` | — | Value used by `path=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L758)

<a id="function-function-mq3-client-ui-shared-script-setbackground-function-script-setbackground-dc-value-args-src-mq3-client-ui-shared-ml-204599461"></a>
### Script_SetBackground

```ml
function Script_SetBackground(dc, value, args)
```

Adapts `mq3.client.ui_shared.Script_SetAsset` to UI shared `Script_SetBackground`, returning its result for `dc, value, args`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Script_SetAsset`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Script_SetAsset`. |
| `args` | `dynamic` | — | Argument 3 of `mq3.client.ui_shared.Script_SetAsset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L763)

<a id="function-function-mq3-client-ui-shared-script-setcolor-function-script-setcolor-dc-value-args-src-mq3-client-ui-shared-ml-42536475"></a>
### Script_SetColor

```ml
function Script_SetColor(dc, value, args)
```

Updates `value.window.backColor`, `value.window.foreColor`, `value.window.flags`, `value.window.borderColor` during UI shared `Script_SetColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_SetColor`; the current implementation does not read it. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.backColor`, `value.window.foreColor`, `value.window.flags`, `value.window.borderColor`. |
| `args` | `dynamic` | — | Value used by `target=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L753)

<a id="function-function-mq3-client-ui-shared-script-setcvar-function-script-setcvar-dc-value-args-src-mq3-client-ui-shared-ml-1934108297"></a>
### Script_SetCvar

```ml
function Script_SetCvar(dc, value, args)
```

Updates `dc.cvars` during UI shared `Script_SetCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_SetCvar`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `name=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L865)

<a id="function-function-mq3-client-ui-shared-script-setfocus-function-script-setfocus-dc-value-args-src-mq3-client-ui-shared-ml-386012945"></a>
### Script_SetFocus

```ml
function Script_SetFocus(dc, value, args)
```

Calls `mq3.client.ui_shared.Menu_FindItemByName`, `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Item_SetFocus` from UI shared `Script_SetFocus`. The final path returns `Item_SetFocus(dc,target,dc.cursorx,dc.cursory)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursorx`, `dc.cursory`. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Value used by `target=Menu_FindItemByName(value.parent,scriptValue(args))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L850)

<a id="function-function-mq3-client-ui-shared-script-setitemcolor-function-script-setitemcolor-dc-value-args-src-mq3-client-ui-shared-ml-1767521797"></a>
### Script_SetItemColor

```ml
function Script_SetItemColor(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Menu_FindItemByName`, `mq3.client.ui_shared.Script_SetColor` from UI shared `Script_SetItemColor`. The final path returns `Script_SetColor(dc,target,args)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Value used by `name=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L773)

<a id="function-function-mq3-client-ui-shared-script-setplayerhead-function-script-setplayerhead-dc-value-args-src-mq3-client-ui-shared-ml-921709761"></a>
### Script_SetPlayerHead

```ml
function Script_SetPlayerHead(dc, value, args)
```

Updates `dc.cvars` during UI shared `Script_SetPlayerHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_SetPlayerHead`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `head=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L860)

<a id="function-function-mq3-client-ui-shared-script-setplayermodel-function-script-setplayermodel-dc-value-args-src-mq3-client-ui-shared-ml-1502511709"></a>
### Script_SetPlayerModel

```ml
function Script_SetPlayerModel(dc, value, args)
```

Updates `dc.cvars` during UI shared `Script_SetPlayerModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.cvars`. |
| `value` | `dynamic` | — | Accepted for compatibility with `Script_SetPlayerModel`; the current implementation does not read it. |
| `args` | `dynamic` | — | Value used by `model=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L855)

<a id="function-function-mq3-client-ui-shared-script-setteamcolor-function-script-setteamcolor-dc-value-args-src-mq3-client-ui-shared-ml-1373914201"></a>
### Script_SetTeamColor

```ml
function Script_SetTeamColor(dc, value, args)
```

Updates `value.window.backColor` during UI shared `Script_SetTeamColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.window.backColor`. |
| `args` | `dynamic` | — | Accepted for compatibility with `Script_SetTeamColor`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L768)

<a id="function-function-mq3-client-ui-shared-script-show-function-script-show-dc-value-args-src-mq3-client-ui-shared-ml-1399271031"></a>
### Script_Show

```ml
function Script_Show(dc, value, args)
```

Adapts `mq3.client.ui_shared.Menu_ShowItemByName` to UI shared `Script_Show`, returning its result for `value.parent, scriptValue(args), true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_Show`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Menu_ShowItemByName`; passed as `scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L788)

<a id="function-function-mq3-client-ui-shared-script-transition-function-script-transition-dc-value-args-src-mq3-client-ui-shared-ml-679360015"></a>
### Script_Transition

```ml
function Script_Transition(dc, value, args)
```

Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Rect_Parse`, `mq3.client.ui_shared.Int_Parse` and additional helpers from UI shared `Script_Transition`. The final path returns `Menu_TransitionItemByName(value.parent,name,fromRect,toRect,time,amount)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Accepted for compatibility with `Script_Transition`; the current implementation does not read it. |
| `value` | `dynamic` | — | Record read through `value.parent`. |
| `args` | `dynamic` | — | Value used by `name=scriptValue(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L831)

<a id="function-function-mq3-client-ui-shared-scriptargs-function-scriptargs-text-src-mq3-client-ui-shared-ml-1642464995"></a>
### scriptArgs

```ml
function scriptArgs(text)
```

Scripts.  Tokenization and command dispatch mirror the original command table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.source`; passed as `"{ "+text+" }"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L745)

<a id="function-function-mq3-client-ui-shared-scriptvalue-function-scriptvalue-args-src-mq3-client-ui-shared-ml-705442445"></a>
### scriptValue

```ml
function scriptValue(args)
```

Adapts `mq3.client.ui_shared.String_Parse` to UI shared `scriptValue`, returning its result for `args`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Argument 1 of `mq3.client.ui_shared.String_Parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L748)

<a id="function-function-mq3-client-ui-shared-scroll-listbox-autofunc-function-scroll-listbox-autofunc-dc-value-src-mq3-client-ui-shared-ml-816225324"></a>
### Scroll_ListBox_AutoFunc

```ml
function Scroll_ListBox_AutoFunc(dc, value)
```

Adapts `mq3.client.ui_shared.Item_ListBox_HandleKey` to UI shared `Scroll_ListBox_AutoFunc`, returning its result for `dc, value, K_DOWNARROW, true, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Item_ListBox_HandleKey`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Item_ListBox_HandleKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1063)

<a id="function-function-mq3-client-ui-shared-scroll-listbox-thumbfunc-function-scroll-listbox-thumbfunc-dc-value-src-mq3-client-ui-shared-ml-1884993950"></a>
### Scroll_ListBox_ThumbFunc

```ml
function Scroll_ListBox_ThumbFunc(dc, value)
```

Updates `value.typeData.startPos` during UI shared `Scroll_ListBox_ThumbFunc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursory`. |
| `value` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `value.typeData.startPos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1067)

<a id="function-function-mq3-client-ui-shared-scroll-slider-thumbfunc-function-scroll-slider-thumbfunc-dc-value-src-mq3-client-ui-shared-ml-1761504174"></a>
### Scroll_Slider_ThumbFunc

```ml
function Scroll_Slider_ThumbFunc(dc, value)
```

Adapts `mq3.client.ui_shared.Item_Slider_HandleKey` to UI shared `Scroll_Slider_ThumbFunc`, returning its result for `dc, value, K_MOUSE1, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Item_Slider_HandleKey`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.ui_shared.Item_Slider_HandleKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1071)

<a id="constant-constant-mq3-client-ui-shared-scrollbar-size-const-scrollbar-size-16-src-mq3-client-ui-shared-ml-849433844"></a>
### SCROLLBAR_SIZE

```ml
const SCROLLBAR_SIZE = 16
```

Width or height of the menu scrollbar controls in UI layout coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L134)

<a id="function-function-mq3-client-ui-shared-source-function-source-text-name-src-mq3-client-ui-shared-ml-380555870"></a>
### source

```ml
function source(text, name)
```

Creates a `mq3.client.ui_shared.Source` record. Assigns `name` from `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value used to initialize `Source.scan`. |
| `name` | `dynamic` | — | Value used to initialize `Source.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L463)

- [mq3.client.ui_shared.Source](Type-mq3-client-ui-shared-source-600485040.md) — struct
<a id="function-function-mq3-client-ui-shared-string-alloc-function-string-alloc-state-value-src-mq3-client-ui-shared-ml-1201815704"></a>
### String_Alloc

```ml
function String_Alloc(state, value)
```

Interns a nonempty UI string, reusing an existing entry or returning an empty string if the arena cannot hold it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `state.memory.strings`. |
| `value` | `dynamic` | — | String to intern; its UTF-8 byte length plus the terminator is charged to the UI arena. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L521)

<a id="function-function-mq3-client-ui-shared-string-init-function-string-init-state-src-mq3-client-ui-shared-ml-209605243"></a>
### String_Init

```ml
function String_Init(state)
```

Updates `state.memory.strings` during UI shared `String_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `state.memory.strings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L527)

<a id="function-function-mq3-client-ui-shared-string-parse-function-string-parse-source-src-mq3-client-ui-shared-ml-798225157"></a>
### String_Parse

```ml
function String_Parse(source)
```

Calls `mq3.client.ui_shared.next` from UI shared `String_Parse`. The final path returns `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `token=next(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L548)

<a id="function-function-mq3-client-ui-shared-string-report-function-string-report-state-src-mq3-client-ui-shared-ml-693613811"></a>
### String_Report

```ml
function String_Report(state)
```

Returns the UI string count, consumed arena bytes and remaining arena bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.memory.strings`, `state.memory.used`, `state.memory.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L524)

<a id="function-function-mq3-client-ui-shared-structure-function-structure-name-size-fields-src-mq3-client-ui-shared-ml-1602652537"></a>
### structure

```ml
function structure(name, size, fields)
```

Builds the UI shared `structure` sequence from `[name,size,fields]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI shared resource. |
| `size` | `dynamic` | — | Value used by `return [name,size,fields]`. |
| `fields` | `dynamic` | — | Value used by `return [name,size,fields]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L532)

<a id="function-function-mq3-client-ui-shared-textpart-function-textpart-text-start-count-src-mq3-client-ui-shared-ml-153237310"></a>
### textPart

```ml
function textPart(text, start, count)
```

Calls `std.string.substr` from UI shared `textPart`. The final path returns `strings.substr(text,start,count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `textPart` in the UI shared path. |
| `start` | `dynamic` | — | Value used by `return strings.substr(text,start,count)`. |
| `count` | `dynamic` | — | Value tested by `count<=0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L1025)

<a id="function-function-mq3-client-ui-shared-towindowcoords-function-towindowcoords-point-window-src-mq3-client-ui-shared-ml-4300678"></a>
### ToWindowCoords

```ml
function ToWindowCoords(point, window)
```

Adds the containing window's X/Y origin to a two-component local point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Sequence read at `point[0]`, `point[1]`. |
| `window` | `dynamic` | — | Record read through `window.rect.x`, `window.rect.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L593)

<a id="function-function-mq3-client-ui-shared-typedata-function-typedata-src-mq3-client-ui-shared-ml-1572909954"></a>
### typeData

```ml
function typeData()
```

Creates a `mq3.client.ui_shared.TypeData` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L455)

- [mq3.client.ui_shared.TypeData](Type-mq3-client-ui-shared-typedata-1209231461.md) — struct
<a id="function-function-mq3-client-ui-shared-ui-alloc-function-ui-alloc-state-size-src-mq3-client-ui-shared-ml-1099347784"></a>
### UI_Alloc

```ml
function UI_Alloc(state, size)
```

UI memory and interned strings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `state.outOfMemory`, `state.used`. |
| `size` | `dynamic` | — | Requested bytes; successful allocations advance the arena to a 16-byte aligned offset. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L508)

<a id="function-function-mq3-client-ui-shared-ui-initmemory-function-ui-initmemory-state-src-mq3-client-ui-shared-ml-793057379"></a>
### UI_InitMemory

```ml
function UI_InitMemory(state)
```

Resets UI arena accounting, interned strings and the out-of-memory flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `state.used`, `state.strings`, `state.outOfMemory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L511)

<a id="function-function-mq3-client-ui-shared-ui-outofmemory-function-ui-outofmemory-state-src-mq3-client-ui-shared-ml-76328251"></a>
### UI_OutOfMemory

```ml
function UI_OutOfMemory(state)
```

Reads `state.outOfMemory` for UI shared `UI_OutOfMemory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.outOfMemory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L514)

<a id="function-function-mq3-client-ui-shared-window-function-window-src-mq3-client-ui-shared-ml-849991354"></a>
### window

```ml
function window()
```

Creates a `mq3.client.ui_shared.Window` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L453)

- [mq3.client.ui_shared.Window](Type-mq3-client-ui-shared-window-307264949.md) — struct
<a id="function-function-mq3-client-ui-shared-window-cachecontents-function-window-cachecontents-dc-w-src-mq3-client-ui-shared-ml-551801158"></a>
### Window_CacheContents

```ml
function Window_CacheContents(dc, w)
```

Updates `dc.assets` during UI shared `Window_CacheContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `dc.assets`. |
| `w` | `dynamic` | — | Record read through `w.background`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L650)

<a id="function-function-mq3-client-ui-shared-window-closecinematic-function-window-closecinematic-dc-w-src-mq3-client-ui-shared-ml-1579220530"></a>
### Window_CloseCinematic

```ml
function Window_CloseCinematic(dc, w)
```

Updates `w.cinematic` during UI shared `Window_CloseCinematic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. |
| `w` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `w.cinematic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L646)

<a id="constant-constant-mq3-client-ui-shared-window-decoration-const-window-decoration-16-src-mq3-client-ui-shared-ml-1921397066"></a>
### WINDOW_DECORATION

```ml
const WINDOW_DECORATION = 16
```

Window-state flag used to treat the window as noninteractive decoration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L20)

<a id="constant-constant-mq3-client-ui-shared-window-fadingin-const-window-fadingin-64-src-mq3-client-ui-shared-ml-377281611"></a>
### WINDOW_FADINGIN

```ml
const WINDOW_FADINGIN = 64
```

Window-state flag used to advance the window's fade-in animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L24)

<a id="constant-constant-mq3-client-ui-shared-window-fadingout-const-window-fadingout-32-src-mq3-client-ui-shared-ml-1801246518"></a>
### WINDOW_FADINGOUT

```ml
const WINDOW_FADINGOUT = 32
```

Window-state flag used to advance the window's fade-out animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L22)

<a id="constant-constant-mq3-client-ui-shared-window-forecolorset-const-window-forecolorset-512-src-mq3-client-ui-shared-ml-212445999"></a>
### WINDOW_FORECOLORSET

```ml
const WINDOW_FORECOLORSET = 512
```

Window-state flag used to retain the window's explicitly specified foreground color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L30)

<a id="constant-constant-mq3-client-ui-shared-window-hasfocus-const-window-hasfocus-2-src-mq3-client-ui-shared-ml-846900785"></a>
### WINDOW_HASFOCUS

```ml
const WINDOW_HASFOCUS = 2
```

Window-state flag used to record that the window owns keyboard focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L18)

<a id="constant-constant-mq3-client-ui-shared-window-horizontal-const-window-horizontal-1024-src-mq3-client-ui-shared-ml-771198182"></a>
### WINDOW_HORIZONTAL

```ml
const WINDOW_HORIZONTAL = 1024
```

Window-state flag used to use horizontal layout or scrolling for the window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L32)

<a id="constant-constant-mq3-client-ui-shared-window-intransition-const-window-intransition-256-src-mq3-client-ui-shared-ml-1648824510"></a>
### WINDOW_INTRANSITION

```ml
const WINDOW_INTRANSITION = 256
```

Window-state flag used to advance a rectangle transition for the window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L28)

<a id="constant-constant-mq3-client-ui-shared-window-mouseover-const-window-mouseover-1-src-mq3-client-ui-shared-ml-670890194"></a>
### WINDOW_MOUSEOVER

```ml
const WINDOW_MOUSEOVER = 1
```

Window-state flag used to record that the pointer is inside the window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L16)

<a id="constant-constant-mq3-client-ui-shared-window-mouseovertext-const-window-mouseovertext-128-src-mq3-client-ui-shared-ml-945718514"></a>
### WINDOW_MOUSEOVERTEXT

```ml
const WINDOW_MOUSEOVERTEXT = 128
```

Window-state flag used to record that the pointer is inside the text rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L26)

<a id="constant-constant-mq3-client-ui-shared-window-orbiting-const-window-orbiting-65536-src-mq3-client-ui-shared-ml-1640851546"></a>
### WINDOW_ORBITING

```ml
const WINDOW_ORBITING = 65536
```

Window-state flag used to advance the window's orbit animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L34)

<a id="function-function-mq3-client-ui-shared-window-paint-function-window-paint-dc-w-fadeamount-fadeclamp-fadecycle-src-mq3-client-ui-shared-ml-359981721"></a>
### Window_Paint

```ml
function Window_Paint(dc, w, fadeAmount, fadeClamp, fadeCycle)
```

Updates `w.flags`, `w.alpha`, `w.nextTime` during UI shared `Window_Paint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dc` | `dynamic` | — | UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.realtime`. |
| `w` | `dynamic` | — | Mutable UI shared record/storage; this routine assigns `w.flags`, `w.alpha`, `w.nextTime`. |
| `fadeAmount` | `dynamic` | — | Value used by `if (w.flags&(WINDOW_FADINGIN\|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0...`. |
| `fadeClamp` | `dynamic` | — | Value used by `if (w.flags&(WINDOW_FADINGIN\|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0...`. |
| `fadeCycle` | `dynamic` | — | Value used by `if (w.flags&(WINDOW_FADINGIN\|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L642)

<a id="constant-constant-mq3-client-ui-shared-window-visible-const-window-visible-4-src-mq3-client-ui-shared-ml-811605111"></a>
### WINDOW_VISIBLE

```ml
const WINDOW_VISIBLE = 4
```

Window-state flag used to include the window in menu rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L14)
