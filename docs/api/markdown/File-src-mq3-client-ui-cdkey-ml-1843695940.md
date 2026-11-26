# `src/mq3/client/ui_cdkey.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_cdkey`](Package-mq3-client-ui-cdkey-1279877018.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_cdkey.Action](Type-mq3-client-ui-cdkey-action-700549422.md) — struct
<a id="constant-constant-mq3-client-ui-cdkey-art-accept0-const-art-accept0-menu-art-accept-0-src-mq3-client-ui-cdkey-ml-628713532"></a>
### ART_ACCEPT0

```ml
const ART_ACCEPT0 = "menu/art/accept_0"
```

Virtual shader or image asset name used for the menu's accept0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L21)

<a id="constant-constant-mq3-client-ui-cdkey-art-accept1-const-art-accept1-menu-art-accept-1-src-mq3-client-ui-cdkey-ml-1679339007"></a>
### ART_ACCEPT1

```ml
const ART_ACCEPT1 = "menu/art/accept_1"
```

Virtual shader or image asset name used for the menu's accept1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L23)

<a id="constant-constant-mq3-client-ui-cdkey-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-cdkey-ml-895541815"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```

Virtual shader or image asset name used for the menu's back0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L25)

<a id="constant-constant-mq3-client-ui-cdkey-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-cdkey-ml-191483756"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```

Virtual shader or image asset name used for the menu's back1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L27)

<a id="constant-constant-mq3-client-ui-cdkey-art-frame-const-art-frame-menu-art-cut-frame-src-mq3-client-ui-cdkey-ml-2013191661"></a>
### ART_FRAME

```ml
const ART_FRAME = "menu/art/cut_frame"
```

Virtual shader or image asset name used for the menu's frame artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L19)

<a id="function-function-mq3-client-ui-cdkey-cache-function-cache-state-src-mq3-client-ui-cdkey-ml-760406389"></a>
### cache

```ml
function cache(state)
```

UI_CDKeyMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cdkey record/storage; this routine assigns `state.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L126)

<a id="function-function-mq3-client-ui-cdkey-cdkeymenu-function-cdkeymenu-state-storedkey-verifyvalid-menudepth-src-mq3-client-ui-cdkey-ml-154490288"></a>
### cdKeyMenu

```ml
function cdKeyMenu(state, storedKey, verifyValid, menuDepth)
```

UI_CDKeyMenu / UI_CDKeyMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cdkey record/storage; this routine assigns `state.pushed`, `state.menuEvents`. |
| `storedKey` | `dynamic` | — | Value used by `init(state,storedKey,verifyValid,menuDepth)`. |
| `verifyValid` | `dynamic` | — | Value used by `init(state,storedKey,verifyValid,menuDepth)`. |
| `menuDepth` | `dynamic` | — | Value used by `init(state,storedKey,verifyValid,menuDepth)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L140)

<a id="function-function-mq3-client-ui-cdkey-cdkeymenuf-function-cdkeymenuf-state-storedkey-verifyvalid-menudepth-src-mq3-client-ui-cdkey-ml-514758290"></a>
### cdKeyMenuF

```ml
function cdKeyMenuF(state, storedKey, verifyValid, menuDepth)
```

Adapts `mq3.client.ui_cdkey.cdKeyMenu` to UI cdkey `cdKeyMenuF`, returning its result for `state, storedKey, verifyValid, menuDepth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_cdkey.cdKeyMenu`. |
| `storedKey` | `dynamic` | — | Argument 2 of `mq3.client.ui_cdkey.cdKeyMenu`. |
| `verifyValid` | `dynamic` | — | Argument 3 of `mq3.client.ui_cdkey.cdKeyMenu`. |
| `menuDepth` | `dynamic` | — | Argument 4 of `mq3.client.ui_cdkey.cdKeyMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L146)

<a id="function-function-mq3-client-ui-cdkey-create-function-create-retailactive-src-mq3-client-ui-cdkey-ml-1327520617"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_cdkey.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L99)

- [mq3.client.ui_cdkey.Draw](Type-mq3-client-ui-cdkey-draw-1378794430.md) — struct
<a id="function-function-mq3-client-ui-cdkey-drawkey-function-drawkey-state-src-mq3-client-ui-cdkey-ml-1540697651"></a>
### drawKey

```ml
function drawKey(state)
```

UI_CDKeyMenu_DrawKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.buffer`, `state.focus`, `state.overstrike`, `state.cursor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L114)

<a id="function-function-mq3-client-ui-cdkey-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-cdkey-ml-730559216"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

Appends a UI cdkey action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cdkey record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI cdkey resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI cdkey path. |
| `value` | `dynamic` | — | Value used by `item=Action("ui-cdkey",kind,name,text,value,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L106)

<a id="constant-constant-mq3-client-ui-cdkey-id-accept-const-id-accept-11-src-mq3-client-ui-cdkey-ml-1132412355"></a>
### ID_ACCEPT

```ml
const ID_ACCEPT = 11
```

Menu control identifier routed to the accept action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L14)

<a id="constant-constant-mq3-client-ui-cdkey-id-back-const-id-back-12-src-mq3-client-ui-cdkey-ml-1761300104"></a>
### ID_BACK

```ml
const ID_BACK = 12
```

Event identifier of the Back control used to leave the product-key entry menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L17)

<a id="constant-constant-mq3-client-ui-cdkey-id-cdkey-const-id-cdkey-10-src-mq3-client-ui-cdkey-ml-1894378324"></a>
### ID_CDKEY

```ml
const ID_CDKEY = 10
```

Menu control identifier routed to the cdkey action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L12)

<a id="function-function-mq3-client-ui-cdkey-init-function-init-state-storedkey-verifyvalid-menudepth-src-mq3-client-ui-cdkey-ml-814798518"></a>
### init

```ml
function init(state, storedKey, verifyValid, menuDepth)
```

UI_CDKeyMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cdkey record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.menuDepth`, `state.backVisible` and additional values. |
| `storedKey` | `dynamic` | — | Value assigned to `state.buffer`. |
| `verifyValid` | `dynamic` | — | Value assigned to `state.verified`. |
| `menuDepth` | `dynamic` | — | Value assigned to `state.menuDepth`, `state.backVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L132)

<a id="function-function-mq3-client-ui-cdkey-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-cdkey-ml-1969675274"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

UI_CDKeyMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cdkey record/storage; this routine assigns `state.menuEvents`. |
| `id` | `dynamic` | — | Value used by `if id==ID_ACCEPT then if len(state.buffer)>0 then emit(state,"set-cdkey","cdkey",state.buffer,0) end if`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L121)

<a id="function-function-mq3-client-ui-cdkey-prevalidatekey-function-prevalidatekey-key-src-mq3-client-ui-cdkey-ml-1948226639"></a>
### preValidateKey

```ml
function preValidateKey(key)
```

UI_CDKeyMenu_PreValidateKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Sequence whose length/content is inspected by `preValidateKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L109)

<a id="constant-constant-mq3-client-ui-cdkey-qm-activated-const-qm-activated-3-src-mq3-client-ui-cdkey-ml-2134557820"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the product-key entry menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L10)

- [mq3.client.ui_cdkey.State](Type-mq3-client-ui-cdkey-state-206170337.md) — struct
