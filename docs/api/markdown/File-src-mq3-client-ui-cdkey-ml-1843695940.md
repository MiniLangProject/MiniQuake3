# `src/mq3/client/ui_cdkey.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_cdkey`](Package-mq3-client-ui-cdkey-1279877018.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_cdkey.Action](Type-mq3-client-ui-cdkey-action-700549422.md) — struct
<a id="constant-constant-mq3-client-ui-cdkey-art-accept0-const-art-accept0-menu-art-accept-0-src-mq3-client-ui-cdkey-ml-628713532"></a>
### ART_ACCEPT0

```ml
const ART_ACCEPT0 = "menu/art/accept_0"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L13)

<a id="constant-constant-mq3-client-ui-cdkey-art-accept1-const-art-accept1-menu-art-accept-1-src-mq3-client-ui-cdkey-ml-1679339007"></a>
### ART_ACCEPT1

```ml
const ART_ACCEPT1 = "menu/art/accept_1"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L14)

<a id="constant-constant-mq3-client-ui-cdkey-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-cdkey-ml-895541815"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L15)

<a id="constant-constant-mq3-client-ui-cdkey-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-cdkey-ml-191483756"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L16)

<a id="constant-constant-mq3-client-ui-cdkey-art-frame-const-art-frame-menu-art-cut-frame-src-mq3-client-ui-cdkey-ml-2013191661"></a>
### ART_FRAME

```ml
const ART_FRAME = "menu/art/cut_frame"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L12)

<a id="function-function-mq3-client-ui-cdkey-cache-function-cache-state-src-mq3-client-ui-cdkey-ml-760406389"></a>
### cache

```ml
function cache(state)
```

UI_CDKeyMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L37)

<a id="function-function-mq3-client-ui-cdkey-cdkeymenu-function-cdkeymenu-state-storedkey-verifyvalid-menudepth-src-mq3-client-ui-cdkey-ml-154490288"></a>
### cdKeyMenu

```ml
function cdKeyMenu(state, storedKey, verifyValid, menuDepth)
```

UI_CDKeyMenu / UI_CDKeyMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `storedKey` | `dynamic` | — |  |
| `verifyValid` | `dynamic` | — |  |
| `menuDepth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L43)

<a id="function-function-mq3-client-ui-cdkey-cdkeymenuf-function-cdkeymenuf-state-storedkey-verifyvalid-menudepth-src-mq3-client-ui-cdkey-ml-514758290"></a>
### cdKeyMenuF

```ml
function cdKeyMenuF(state, storedKey, verifyValid, menuDepth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `storedKey` | `dynamic` | — |  |
| `verifyValid` | `dynamic` | — |  |
| `menuDepth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L44)

<a id="function-function-mq3-client-ui-cdkey-create-function-create-retailactive-src-mq3-client-ui-cdkey-ml-1327520617"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L22)

- [mq3.client.ui_cdkey.Draw](Type-mq3-client-ui-cdkey-draw-1378794430.md) — struct
<a id="function-function-mq3-client-ui-cdkey-drawkey-function-drawkey-state-src-mq3-client-ui-cdkey-ml-1540697651"></a>
### drawKey

```ml
function drawKey(state)
```

UI_CDKeyMenu_DrawKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L29)

<a id="function-function-mq3-client-ui-cdkey-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-cdkey-ml-730559216"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L23)

<a id="constant-constant-mq3-client-ui-cdkey-id-accept-const-id-accept-11-src-mq3-client-ui-cdkey-ml-1132412355"></a>
### ID_ACCEPT

```ml
const ID_ACCEPT = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L10)

<a id="constant-constant-mq3-client-ui-cdkey-id-back-const-id-back-12-src-mq3-client-ui-cdkey-ml-1761300104"></a>
### ID_BACK

```ml
const ID_BACK = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L11)

<a id="constant-constant-mq3-client-ui-cdkey-id-cdkey-const-id-cdkey-10-src-mq3-client-ui-cdkey-ml-1894378324"></a>
### ID_CDKEY

```ml
const ID_CDKEY = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L9)

<a id="function-function-mq3-client-ui-cdkey-init-function-init-state-storedkey-verifyvalid-menudepth-src-mq3-client-ui-cdkey-ml-814798518"></a>
### init

```ml
function init(state, storedKey, verifyValid, menuDepth)
```

UI_CDKeyMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `storedKey` | `dynamic` | — |  |
| `verifyValid` | `dynamic` | — |  |
| `menuDepth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L39)

<a id="function-function-mq3-client-ui-cdkey-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-cdkey-ml-1969675274"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

UI_CDKeyMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L33)

<a id="function-function-mq3-client-ui-cdkey-prevalidatekey-function-prevalidatekey-key-src-mq3-client-ui-cdkey-ml-1948226639"></a>
### preValidateKey

```ml
function preValidateKey(key)
```

UI_CDKeyMenu_PreValidateKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L25)

<a id="constant-constant-mq3-client-ui-cdkey-qm-activated-const-qm-activated-3-src-mq3-client-ui-cdkey-ml-2134557820"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L8)

- [mq3.client.ui_cdkey.State](Type-mq3-client-ui-cdkey-state-206170337.md) — struct
