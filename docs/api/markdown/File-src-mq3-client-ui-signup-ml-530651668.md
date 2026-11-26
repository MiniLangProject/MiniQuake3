# `src/mq3/client/ui_signup.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_signup`](Package-mq3-client-ui-signup-197925584.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `q` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/client/ui_rankings.ml` as `rankings` → [src/mq3/client/ui_rankings.ml](File-src-mq3-client-ui-rankings-ml-966722513.md)

## Declarations

- [mq3.client.ui_signup.Action](Type-mq3-client-ui-signup-action-1974610168.md) — struct
<a id="function-function-mq3-client-ui-signup-button-function-button-text-id-x-y-flags-style-src-mq3-client-ui-signup-ml-216556165"></a>
### button

```ml
function button(text, id, x, y, flags, style)
```

Calls `mq3.client.ui_qmenu.item` from UI signup `button`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value assigned to `item.string`. |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `button`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `button`. |
| `flags` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`. |
| `style` | `dynamic` | — | Value assigned to `item.style`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L51)

<a id="function-function-mq3-client-ui-signup-create-function-create-retailactive-src-mq3-client-ui-signup-ml-384598149"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_signup.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L24)

<a id="function-function-mq3-client-ui-signup-emit-function-emit-state-boundary-kind-name-text-text2-text3-src-mq3-client-ui-signup-ml-2098194146"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, text2, text3)
```

Appends a UI signup action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI signup record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI signup resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI signup path. |
| `text2` | `dynamic` | — | Value used by `a=Action(boundary,kind,name,text,text2,text3,not state.retailActive)`. |
| `text3` | `dynamic` | — | Value used by `a=Action(boundary,kind,name,text,text2,text3,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L33)

<a id="function-function-mq3-client-ui-signup-field-function-field-id-y-maxchars-src-mq3-client-ui-signup-ml-553675395"></a>
### field

```ml
function field(id, y, maxchars)
```

Calls `mq3.client.ui_qmenu.item` from UI signup `field`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_FIELD,"",id,330,y,0)`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `field`. |
| `maxchars` | `dynamic` | — | Value assigned to `item.maxchars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L38)

<a id="constant-constant-mq3-client-ui-signup-id-again-const-id-again-104-src-mq3-client-ui-signup-ml-1961283920"></a>
### ID_AGAIN

```ml
const ID_AGAIN = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L12)

<a id="constant-constant-mq3-client-ui-signup-id-again-box-const-id-again-box-105-src-mq3-client-ui-signup-ml-596204075"></a>
### ID_AGAIN_BOX

```ml
const ID_AGAIN_BOX = 105
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L13)

<a id="constant-constant-mq3-client-ui-signup-id-cancel-const-id-cancel-109-src-mq3-client-ui-signup-ml-829618313"></a>
### ID_CANCEL

```ml
const ID_CANCEL = 109
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L17)

<a id="constant-constant-mq3-client-ui-signup-id-email-const-id-email-106-src-mq3-client-ui-signup-ml-2011133322"></a>
### ID_EMAIL

```ml
const ID_EMAIL = 106
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L14)

<a id="constant-constant-mq3-client-ui-signup-id-email-box-const-id-email-box-107-src-mq3-client-ui-signup-ml-1065922189"></a>
### ID_EMAIL_BOX

```ml
const ID_EMAIL_BOX = 107
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L15)

<a id="constant-constant-mq3-client-ui-signup-id-name-const-id-name-100-src-mq3-client-ui-signup-ml-1862217922"></a>
### ID_NAME

```ml
const ID_NAME = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L8)

<a id="constant-constant-mq3-client-ui-signup-id-name-box-const-id-name-box-101-src-mq3-client-ui-signup-ml-1985002673"></a>
### ID_NAME_BOX

```ml
const ID_NAME_BOX = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L9)

<a id="constant-constant-mq3-client-ui-signup-id-password-const-id-password-102-src-mq3-client-ui-signup-ml-1121242692"></a>
### ID_PASSWORD

```ml
const ID_PASSWORD = 102
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L10)

<a id="constant-constant-mq3-client-ui-signup-id-password-box-const-id-password-box-103-src-mq3-client-ui-signup-ml-283054999"></a>
### ID_PASSWORD_BOX

```ml
const ID_PASSWORD_BOX = 103
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L11)

<a id="constant-constant-mq3-client-ui-signup-id-signup-const-id-signup-108-src-mq3-client-ui-signup-ml-250545594"></a>
### ID_SIGNUP

```ml
const ID_SIGNUP = 108
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L16)

<a id="function-function-mq3-client-ui-signup-label-function-label-text-id-y-src-mq3-client-ui-signup-ml-1456663873"></a>
### label

```ml
function label(text, id, y)
```

Calls `mq3.client.ui_qmenu.item` from UI signup `label`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value assigned to `item.string`. |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY\|q.QMF_INACTIVE)`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `label`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L43)

<a id="function-function-mq3-client-ui-signup-signup-cache-function-signup-cache-state-src-mq3-client-ui-signup-ml-1757558205"></a>
### Signup_Cache

```ml
function Signup_Cache(state)
```

Signup_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI signup state passed to the helper calls in `Signup_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L61)

<a id="constant-constant-mq3-client-ui-signup-signup-frame-const-signup-frame-menu-art-cut-frame-src-mq3-client-ui-signup-ml-1382306615"></a>
### SIGNUP_FRAME

```ml
const SIGNUP_FRAME = "menu/art/cut_frame"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L7)

<a id="function-function-mq3-client-ui-signup-signup-menuevent-function-signup-menuevent-state-id-event-src-mq3-client-ui-signup-ml-347147062"></a>
### Signup_MenuEvent

```ml
function Signup_MenuEvent(state, id, event)
```

Signup_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI signup record/storage; this routine assigns `state.nameBox.buffer`, `state.passwordBox.buffer`, `state.againBox.buffer`, `state.forcedOff` and additional values. |
| `id` | `dynamic` | — | Value used by `if id==ID_SIGNUP then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer)`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L56)

<a id="function-function-mq3-client-ui-signup-signup-menuinit-function-signup-menuinit-state-status-src-mq3-client-ui-signup-ml-1697519491"></a>
### Signup_MenuInit

```ml
function Signup_MenuInit(state, status)
```

Signup_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI signup record/storage; this routine assigns `state.menu`, `state.actions`, `state.status`, `state.frame` and additional values. |
| `status` | `dynamic` | — | Value assigned to `state.status`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L65)

- [mq3.client.ui_signup.State](Type-mq3-client-ui-signup-state-429813871.md) — struct
<a id="function-function-mq3-client-ui-signup-ui-signupmenu-function-ui-signupmenu-state-status-src-mq3-client-ui-signup-ml-1193865575"></a>
### UI_SignupMenu

```ml
function UI_SignupMenu(state, status)
```

UI_SignupMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI signup record/storage; this routine assigns `state.pushed`. |
| `status` | `dynamic` | — | Value used by `Signup_MenuInit(state,status)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L72)
