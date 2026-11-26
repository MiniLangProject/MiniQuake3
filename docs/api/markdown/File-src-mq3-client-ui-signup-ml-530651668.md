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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L24)

<a id="function-function-mq3-client-ui-signup-create-function-create-retailactive-src-mq3-client-ui-signup-ml-384598149"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L20)

<a id="function-function-mq3-client-ui-signup-emit-function-emit-state-boundary-kind-name-text-text2-text3-src-mq3-client-ui-signup-ml-2098194146"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, text2, text3)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `text2` | `dynamic` | — |  |
| `text3` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L21)

<a id="function-function-mq3-client-ui-signup-field-function-field-id-y-maxchars-src-mq3-client-ui-signup-ml-553675395"></a>
### field

```ml
function field(id, y, maxchars)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `maxchars` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L22)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L23)

<a id="function-function-mq3-client-ui-signup-signup-cache-function-signup-cache-state-src-mq3-client-ui-signup-ml-1757558205"></a>
### Signup_Cache

```ml
function Signup_Cache(state)
```

Signup_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L30)

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
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L26)

<a id="function-function-mq3-client-ui-signup-signup-menuinit-function-signup-menuinit-state-status-src-mq3-client-ui-signup-ml-1697519491"></a>
### Signup_MenuInit

```ml
function Signup_MenuInit(state, status)
```

Signup_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L32)

- [mq3.client.ui_signup.State](Type-mq3-client-ui-signup-state-429813871.md) — struct
<a id="function-function-mq3-client-ui-signup-ui-signupmenu-function-ui-signupmenu-state-status-src-mq3-client-ui-signup-ml-1193865575"></a>
### UI_SignupMenu

```ml
function UI_SignupMenu(state, status)
```

UI_SignupMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_signup.ml#L37)
