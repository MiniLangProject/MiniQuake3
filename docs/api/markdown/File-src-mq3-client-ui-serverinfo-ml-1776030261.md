# `src/mq3/client/ui_serverinfo.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_serverinfo`](Package-mq3-client-ui-serverinfo-1380196947.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_serverinfo.Action](Type-mq3-client-ui-serverinfo-action-1788693885.md) — struct
<a id="function-function-mq3-client-ui-serverinfo-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-serverinfo-ml-895367469"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

Calls `mq3.client.ui_qmenu.item` from UI serverinfo `bitmap`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI serverinfo resource. |
| `id` | `dynamic` | — | Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `bitmap`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `bitmap`. |
| `flags` | `dynamic` | — | Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `w` | `dynamic` | — | Value assigned to `value.width`. |
| `h` | `dynamic` | — | Value assigned to `value.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L163)

<a id="function-function-mq3-client-ui-serverinfo-create-function-create-retailactive-src-mq3-client-ui-serverinfo-ml-717389117"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_serverinfo.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L100)

<a id="function-function-mq3-client-ui-serverinfo-digitaddress-function-digitaddress-value-src-mq3-client-ui-serverinfo-ml-1638263035"></a>
### digitAddress

```ml
function digitAddress(value)
```

Evaluates UI serverinfo `digitAddress` and returns `false`, `c>=48 and c<=57` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value==""` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L117)

<a id="function-function-mq3-client-ui-serverinfo-emit-function-emit-state-boundary-kind-name-text-x-y-number-src-mq3-client-ui-serverinfo-ml-2027722389"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, x, y, number)
```

Appends a UI serverinfo action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI serverinfo record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI serverinfo resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI serverinfo path. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `number` | `dynamic` | — | Value used by `action=Action(boundary,kind,name,text,x,y,number,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L110)

<a id="function-function-mq3-client-ui-serverinfo-favorites-add-function-favorites-add-state-src-mq3-client-ui-serverinfo-ml-1715188321"></a>
### Favorites_Add

```ml
function Favorites_Add(state)
```

Favorites_Add

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI serverinfo record/storage; this routine assigns `state.favorites`, `state.favorites[best-1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L124)

<a id="constant-constant-mq3-client-ui-serverinfo-id-add-const-id-add-100-src-mq3-client-ui-serverinfo-ml-1464151984"></a>
### ID_ADD

```ml
const ID_ADD = 100
```

Menu control identifier routed to the add action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L18)

<a id="constant-constant-mq3-client-ui-serverinfo-id-back-const-id-back-101-src-mq3-client-ui-serverinfo-ml-466637475"></a>
### ID_BACK

```ml
const ID_BACK = 101
```

Event identifier of the Back control used to leave the server-information dialog and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L21)

<a id="function-function-mq3-client-ui-serverinfo-infopairs-function-infopairs-text-src-mq3-client-ui-serverinfo-ml-357555049"></a>
### infoPairs

```ml
function infoPairs(text)
```

Calls `std.string.split` from UI serverinfo `infoPairs`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `infoPairs` in the UI serverinfo path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L120)

<a id="constant-constant-mq3-client-ui-serverinfo-max-favoriteservers-const-max-favoriteservers-16-src-mq3-client-ui-serverinfo-ml-912398238"></a>
### MAX_FAVORITESERVERS

```ml
const MAX_FAVORITESERVERS = 16
```

Capacity limit for the favoriteservers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L23)

<a id="function-function-mq3-client-ui-serverinfo-same-function-same-a-b-src-mq3-client-ui-serverinfo-ml-1370120315"></a>
### same

```ml
function same(a, b)
```

Compares two UI serverinfo names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `b` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L114)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-back0-const-serverinfo-back0-menu-art-back-0-src-mq3-client-ui-serverinfo-ml-30461817"></a>
### SERVERINFO_BACK0

```ml
const SERVERINFO_BACK0 = "menu/art/back_0"
```

Virtual asset path used to load the serverinfo back0 renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L14)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-back1-const-serverinfo-back1-menu-art-back-1-src-mq3-client-ui-serverinfo-ml-1991637338"></a>
### SERVERINFO_BACK1

```ml
const SERVERINFO_BACK1 = "menu/art/back_1"
```

Virtual asset path used to load the serverinfo back1 renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L16)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-cache-function-serverinfo-cache-state-src-mq3-client-ui-serverinfo-ml-435293031"></a>
### ServerInfo_Cache

```ml
function ServerInfo_Cache(state)
```

ServerInfo_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI serverinfo state passed to the helper calls in `ServerInfo_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L153)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-event-function-serverinfo-event-state-id-event-src-mq3-client-ui-serverinfo-ml-1452128182"></a>
### ServerInfo_Event

```ml
function ServerInfo_Event(state, id, event)
```

ServerInfo_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI serverinfo record/storage; this routine assigns `state.popped`, `state.menu.popped`. |
| `id` | `dynamic` | — | Value used by `if id==ID_ADD then Favorites_Add(state)`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L133)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-framel-const-serverinfo-framel-menu-art-frame2-l-src-mq3-client-ui-serverinfo-ml-1343847279"></a>
### SERVERINFO_FRAMEL

```ml
const SERVERINFO_FRAMEL = "menu/art/frame2_l"
```

Virtual asset path used to load the serverinfo framel renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L10)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-framer-const-serverinfo-framer-menu-art-frame1-r-src-mq3-client-ui-serverinfo-ml-314678214"></a>
### SERVERINFO_FRAMER

```ml
const SERVERINFO_FRAMER = "menu/art/frame1_r"
```

Virtual asset path used to load the serverinfo framer renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L12)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-menudraw-function-serverinfo-menudraw-state-realtime-src-mq3-client-ui-serverinfo-ml-1549688922"></a>
### ServerInfo_MenuDraw

```ml
function ServerInfo_MenuDraw(state, realtime)
```

ServerInfo_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.numlines`, `state.pairs`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L140)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-menukey-function-serverinfo-menukey-state-key-cursorx-cursory-src-mq3-client-ui-serverinfo-ml-1910452143"></a>
### ServerInfo_MenuKey

```ml
function ServerInfo_MenuKey(state, key, cursorx, cursory)
```

ServerInfo_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.menu`. |
| `key` | `dynamic` | — | Argument 2 of `mq3.client.ui_qmenu.Menu_DefaultKey`. |
| `cursorx` | `dynamic` | — | Argument 3 of `mq3.client.ui_qmenu.Menu_DefaultKey`. |
| `cursory` | `dynamic` | — | Argument 4 of `mq3.client.ui_qmenu.Menu_DefaultKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L149)

- [mq3.client.ui_serverinfo.State](Type-mq3-client-ui-serverinfo-state-17572200.md) — struct
<a id="function-function-mq3-client-ui-serverinfo-ui-serverinfomenu-function-ui-serverinfomenu-state-serverinfo-svrunning-currentaddress-favorites-src-mq3-client-ui-serverinfo-ml-882246256"></a>
### UI_ServerInfoMenu

```ml
function UI_ServerInfoMenu(state, serverInfo, svRunning, currentAddress, favorites)
```

UI_ServerInfoMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI serverinfo record/storage; this routine assigns `state.menu`, `state.actions`, `state.pushed`, `state.popped` and additional values. |
| `serverInfo` | `dynamic` | — | Value assigned to `state.info`. |
| `svRunning` | `dynamic` | — | Value used by `if svRunning then flags=flags\|qmenu.QMF_GRAYED end if`. |
| `currentAddress` | `dynamic` | — | Value assigned to `state.currentAddress`. |
| `favorites` | `dynamic` | — | Value assigned to `state.favorites`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L171)
