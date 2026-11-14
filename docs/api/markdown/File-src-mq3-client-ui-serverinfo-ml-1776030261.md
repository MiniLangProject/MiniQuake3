# `src/mq3/client/ui_serverinfo.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_serverinfo`](Package-mq3-client-ui-serverinfo-1380196947.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_serverinfo.Action](Type-mq3-client-ui-serverinfo-action-1788693885.md) — struct
<a id="function-function-mq3-client-ui-serverinfo-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-serverinfo-ml-895367469"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L48)

<a id="function-function-mq3-client-ui-serverinfo-create-function-create-retailactive-src-mq3-client-ui-serverinfo-ml-717389117"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L20)

<a id="function-function-mq3-client-ui-serverinfo-digitaddress-function-digitaddress-value-src-mq3-client-ui-serverinfo-ml-1638263035"></a>
### digitAddress

```ml
function digitAddress(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L23)

<a id="function-function-mq3-client-ui-serverinfo-emit-function-emit-state-boundary-kind-name-text-x-y-number-src-mq3-client-ui-serverinfo-ml-2027722389"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, x, y, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L21)

<a id="function-function-mq3-client-ui-serverinfo-favorites-add-function-favorites-add-state-src-mq3-client-ui-serverinfo-ml-1715188321"></a>
### Favorites_Add

```ml
function Favorites_Add(state)
```

Favorites_Add

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L27)

<a id="constant-constant-mq3-client-ui-serverinfo-id-add-const-id-add-100-src-mq3-client-ui-serverinfo-ml-1464151984"></a>
### ID_ADD

```ml
const ID_ADD = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L13)

<a id="constant-constant-mq3-client-ui-serverinfo-id-back-const-id-back-101-src-mq3-client-ui-serverinfo-ml-466637475"></a>
### ID_BACK

```ml
const ID_BACK = 101
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L14)

<a id="function-function-mq3-client-ui-serverinfo-infopairs-function-infopairs-text-src-mq3-client-ui-serverinfo-ml-357555049"></a>
### infoPairs

```ml
function infoPairs(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L24)

<a id="constant-constant-mq3-client-ui-serverinfo-max-favoriteservers-const-max-favoriteservers-16-src-mq3-client-ui-serverinfo-ml-912398238"></a>
### MAX_FAVORITESERVERS

```ml
const MAX_FAVORITESERVERS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L15)

<a id="function-function-mq3-client-ui-serverinfo-same-function-same-a-b-src-mq3-client-ui-serverinfo-ml-1370120315"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L22)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-back0-const-serverinfo-back0-menu-art-back-0-src-mq3-client-ui-serverinfo-ml-30461817"></a>
### SERVERINFO_BACK0

```ml
const SERVERINFO_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L11)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-back1-const-serverinfo-back1-menu-art-back-1-src-mq3-client-ui-serverinfo-ml-1991637338"></a>
### SERVERINFO_BACK1

```ml
const SERVERINFO_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L12)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-cache-function-serverinfo-cache-state-src-mq3-client-ui-serverinfo-ml-435293031"></a>
### ServerInfo_Cache

```ml
function ServerInfo_Cache(state)
```

ServerInfo_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L46)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-event-function-serverinfo-event-state-id-event-src-mq3-client-ui-serverinfo-ml-1452128182"></a>
### ServerInfo_Event

```ml
function ServerInfo_Event(state, id, event)
```

ServerInfo_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L33)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-framel-const-serverinfo-framel-menu-art-frame2-l-src-mq3-client-ui-serverinfo-ml-1343847279"></a>
### SERVERINFO_FRAMEL

```ml
const SERVERINFO_FRAMEL = "menu/art/frame2_l"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L9)

<a id="constant-constant-mq3-client-ui-serverinfo-serverinfo-framer-const-serverinfo-framer-menu-art-frame1-r-src-mq3-client-ui-serverinfo-ml-314678214"></a>
### SERVERINFO_FRAMER

```ml
const SERVERINFO_FRAMER = "menu/art/frame1_r"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L10)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-menudraw-function-serverinfo-menudraw-state-realtime-src-mq3-client-ui-serverinfo-ml-1549688922"></a>
### ServerInfo_MenuDraw

```ml
function ServerInfo_MenuDraw(state, realtime)
```

ServerInfo_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L38)

<a id="function-function-mq3-client-ui-serverinfo-serverinfo-menukey-function-serverinfo-menukey-state-key-cursorx-cursory-src-mq3-client-ui-serverinfo-ml-1910452143"></a>
### ServerInfo_MenuKey

```ml
function ServerInfo_MenuKey(state, key, cursorx, cursory)
```

ServerInfo_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L43)

- [mq3.client.ui_serverinfo.State](Type-mq3-client-ui-serverinfo-state-17572200.md) — struct
<a id="function-function-mq3-client-ui-serverinfo-ui-serverinfomenu-function-ui-serverinfomenu-state-serverinfo-svrunning-currentaddress-favorites-src-mq3-client-ui-serverinfo-ml-882246256"></a>
### UI_ServerInfoMenu

```ml
function UI_ServerInfoMenu(state, serverInfo, svRunning, currentAddress, favorites)
```

UI_ServerInfoMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `svRunning` | `dynamic` | — |  |
| `currentAddress` | `dynamic` | — |  |
| `favorites` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L51)
