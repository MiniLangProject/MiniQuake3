# `src/mq3/client/ui_login.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_login`](Package-mq3-client-ui-login-1910960937.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `q` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/client/ui_rankings.ml` as `rankings` → [src/mq3/client/ui_rankings.ml](File-src-mq3-client-ui-rankings-ml-966722513.md)

## Declarations

<a id="function-function-mq3-client-ui-login-action-function-action-text-id-x-y-flags-style-src-mq3-client-ui-login-ml-1181730599"></a>
### action

```ml
function action(text, id, x, y, flags, style)
```

Calls `mq3.client.ui_qmenu.item` from UI login `action`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value assigned to `item.string`. |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `action`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `action`. |
| `flags` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`. |
| `style` | `dynamic` | — | Value assigned to `item.style`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L106)

- [mq3.client.ui_login.Action](Type-mq3-client-ui-login-action-2008815967.md) — struct
<a id="function-function-mq3-client-ui-login-create-function-create-retailactive-src-mq3-client-ui-login-ml-257190167"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_login.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L80)

<a id="function-function-mq3-client-ui-login-emit-function-emit-state-boundary-kind-name-text-text2-src-mq3-client-ui-login-ml-110559878"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, text2)
```

Appends a UI login action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI login record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI login resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI login path. |
| `text2` | `dynamic` | — | Value used by `a=Action(boundary,kind,name,text,text2,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L88)

<a id="function-function-mq3-client-ui-login-field-function-field-id-x-y-src-mq3-client-ui-login-ml-928259504"></a>
### field

```ml
function field(id, x, y)
```

Calls `mq3.client.ui_qmenu.item` from UI login `field`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_FIELD,"",id,x,y,0)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `field`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `field`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L93)

<a id="constant-constant-mq3-client-ui-login-id-cancel-const-id-cancel-105-src-mq3-client-ui-login-ml-1970332693"></a>
### ID_CANCEL

```ml
const ID_CANCEL = 105
```

Menu control identifier routed to the cancel action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L20)

<a id="constant-constant-mq3-client-ui-login-id-login-const-id-login-104-src-mq3-client-ui-login-ml-792094188"></a>
### ID_LOGIN

```ml
const ID_LOGIN = 104
```

Menu control identifier routed to the login action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L18)

<a id="constant-constant-mq3-client-ui-login-id-name-const-id-name-100-src-mq3-client-ui-login-ml-1940119360"></a>
### ID_NAME

```ml
const ID_NAME = 100
```

Menu control identifier routed to the name action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L10)

<a id="constant-constant-mq3-client-ui-login-id-name-box-const-id-name-box-101-src-mq3-client-ui-login-ml-2018323777"></a>
### ID_NAME_BOX

```ml
const ID_NAME_BOX = 101
```

Menu control identifier routed to the name box action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L12)

<a id="constant-constant-mq3-client-ui-login-id-password-const-id-password-102-src-mq3-client-ui-login-ml-571442042"></a>
### ID_PASSWORD

```ml
const ID_PASSWORD = 102
```

Menu control identifier routed to the password action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L14)

<a id="constant-constant-mq3-client-ui-login-id-password-box-const-id-password-box-103-src-mq3-client-ui-login-ml-120075327"></a>
### ID_PASSWORD_BOX

```ml
const ID_PASSWORD_BOX = 103
```

Menu control identifier routed to the password box action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L16)

<a id="function-function-mq3-client-ui-login-label-function-label-text-id-y-src-mq3-client-ui-login-ml-1997640101"></a>
### label

```ml
function label(text, id, y)
```

Calls `mq3.client.ui_qmenu.item` from UI login `label`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value assigned to `item.string`. |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY\|q.QMF_INACTIVE)`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `label`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L98)

<a id="function-function-mq3-client-ui-login-login-cache-function-login-cache-state-src-mq3-client-ui-login-ml-1809301881"></a>
### Login_Cache

```ml
function Login_Cache(state)
```

Login_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI login state passed to the helper calls in `Login_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L116)

<a id="constant-constant-mq3-client-ui-login-login-frame-const-login-frame-menu-art-cut-frame-src-mq3-client-ui-login-ml-1652091207"></a>
### LOGIN_FRAME

```ml
const LOGIN_FRAME = "menu/art/cut_frame"
```

Virtual asset path used to load the login frame renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L8)

<a id="function-function-mq3-client-ui-login-login-menuevent-function-login-menuevent-state-id-event-src-mq3-client-ui-login-ml-706314968"></a>
### Login_MenuEvent

```ml
function Login_MenuEvent(state, id, event)
```

Login_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI login record/storage; this routine assigns `state.nameBox.buffer`, `state.passwordBox.buffer`, `state.forcedOff`, `state.popped` and additional values. |
| `id` | `dynamic` | — | Value used by `if id==ID_LOGIN then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer)`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L111)

<a id="function-function-mq3-client-ui-login-login-menuinit-function-login-menuinit-state-src-mq3-client-ui-login-ml-1252515985"></a>
### Login_MenuInit

```ml
function Login_MenuInit(state)
```

Login_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI login record/storage; this routine assigns `state.menu`, `state.actions`, `state.frame`, `state.frame.width` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L119)

- [mq3.client.ui_login.State](Type-mq3-client-ui-login-state-1861023702.md) — struct
<a id="function-function-mq3-client-ui-login-ui-loginmenu-function-ui-loginmenu-state-src-mq3-client-ui-login-ml-834644809"></a>
### UI_LoginMenu

```ml
function UI_LoginMenu(state)
```

UI_LoginMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI login record/storage; this routine assigns `state.pushed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L124)
