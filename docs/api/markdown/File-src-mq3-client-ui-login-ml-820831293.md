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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L20)

- [mq3.client.ui_login.Action](Type-mq3-client-ui-login-action-2008815967.md) — struct
<a id="function-function-mq3-client-ui-login-create-function-create-retailactive-src-mq3-client-ui-login-ml-257190167"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L16)

<a id="function-function-mq3-client-ui-login-emit-function-emit-state-boundary-kind-name-text-text2-src-mq3-client-ui-login-ml-110559878"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, text2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `text2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L17)

<a id="function-function-mq3-client-ui-login-field-function-field-id-x-y-src-mq3-client-ui-login-ml-928259504"></a>
### field

```ml
function field(id, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L18)

<a id="constant-constant-mq3-client-ui-login-id-cancel-const-id-cancel-105-src-mq3-client-ui-login-ml-1970332693"></a>
### ID_CANCEL

```ml
const ID_CANCEL = 105
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L13)

<a id="constant-constant-mq3-client-ui-login-id-login-const-id-login-104-src-mq3-client-ui-login-ml-792094188"></a>
### ID_LOGIN

```ml
const ID_LOGIN = 104
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L12)

<a id="constant-constant-mq3-client-ui-login-id-name-const-id-name-100-src-mq3-client-ui-login-ml-1940119360"></a>
### ID_NAME

```ml
const ID_NAME = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L8)

<a id="constant-constant-mq3-client-ui-login-id-name-box-const-id-name-box-101-src-mq3-client-ui-login-ml-2018323777"></a>
### ID_NAME_BOX

```ml
const ID_NAME_BOX = 101
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L9)

<a id="constant-constant-mq3-client-ui-login-id-password-const-id-password-102-src-mq3-client-ui-login-ml-571442042"></a>
### ID_PASSWORD

```ml
const ID_PASSWORD = 102
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L10)

<a id="constant-constant-mq3-client-ui-login-id-password-box-const-id-password-box-103-src-mq3-client-ui-login-ml-120075327"></a>
### ID_PASSWORD_BOX

```ml
const ID_PASSWORD_BOX = 103
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L11)

<a id="function-function-mq3-client-ui-login-label-function-label-text-id-y-src-mq3-client-ui-login-ml-1997640101"></a>
### label

```ml
function label(text, id, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L19)

<a id="function-function-mq3-client-ui-login-login-cache-function-login-cache-state-src-mq3-client-ui-login-ml-1809301881"></a>
### Login_Cache

```ml
function Login_Cache(state)
```

Login_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L26)

<a id="constant-constant-mq3-client-ui-login-login-frame-const-login-frame-menu-art-cut-frame-src-mq3-client-ui-login-ml-1652091207"></a>
### LOGIN_FRAME

```ml
const LOGIN_FRAME = "menu/art/cut_frame"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L7)

<a id="function-function-mq3-client-ui-login-login-menuevent-function-login-menuevent-state-id-event-src-mq3-client-ui-login-ml-706314968"></a>
### Login_MenuEvent

```ml
function Login_MenuEvent(state, id, event)
```

Login_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L22)

<a id="function-function-mq3-client-ui-login-login-menuinit-function-login-menuinit-state-src-mq3-client-ui-login-ml-1252515985"></a>
### Login_MenuInit

```ml
function Login_MenuInit(state)
```

Login_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L28)

- [mq3.client.ui_login.State](Type-mq3-client-ui-login-state-1861023702.md) — struct
<a id="function-function-mq3-client-ui-login-ui-loginmenu-function-ui-loginmenu-state-src-mq3-client-ui-login-ml-834644809"></a>
### UI_LoginMenu

```ml
function UI_LoginMenu(state)
```

UI_LoginMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_login.ml#L32)
