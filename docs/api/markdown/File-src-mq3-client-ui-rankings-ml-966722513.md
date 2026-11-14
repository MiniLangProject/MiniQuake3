# `src/mq3/client/ui_rankings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_rankings`](Package-mq3-client-ui-rankings-2142654559.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `q` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)

## Declarations

- [mq3.client.ui_rankings.Action](Type-mq3-client-ui-rankings-action-338082225.md) — struct
<a id="function-function-mq3-client-ui-rankings-alphanumeric-function-alphanumeric-c-src-mq3-client-ui-rankings-ml-1159549747"></a>
### alphanumeric

```ml
function alphanumeric(c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L32)

<a id="function-function-mq3-client-ui-rankings-create-function-create-retailactive-src-mq3-client-ui-rankings-ml-2012381565"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L30)

<a id="function-function-mq3-client-ui-rankings-emit-function-emit-state-boundary-kind-name-text-x-y-value-src-mq3-client-ui-rankings-ml-1169748799"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, x, y, value)
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
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L31)

<a id="constant-constant-mq3-client-ui-rankings-id-create-const-id-create-102-src-mq3-client-ui-rankings-ml-852312706"></a>
### ID_CREATE

```ml
const ID_CREATE = 102
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L10)

<a id="constant-constant-mq3-client-ui-rankings-id-leave-const-id-leave-105-src-mq3-client-ui-rankings-ml-55979039"></a>
### ID_LEAVE

```ml
const ID_LEAVE = 105
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L13)

<a id="constant-constant-mq3-client-ui-rankings-id-login-const-id-login-100-src-mq3-client-ui-rankings-ml-1931549684"></a>
### ID_LOGIN

```ml
const ID_LOGIN = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L8)

<a id="constant-constant-mq3-client-ui-rankings-id-logout-const-id-logout-101-src-mq3-client-ui-rankings-ml-1271052167"></a>
### ID_LOGOUT

```ml
const ID_LOGOUT = 101
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L9)

<a id="constant-constant-mq3-client-ui-rankings-id-setup-const-id-setup-104-src-mq3-client-ui-rankings-ml-712654024"></a>
### ID_SETUP

```ml
const ID_SETUP = 104
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L12)

<a id="constant-constant-mq3-client-ui-rankings-id-spectate-const-id-spectate-103-src-mq3-client-ui-rankings-ml-934239853"></a>
### ID_SPECTATE

```ml
const ID_SPECTATE = 103
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L11)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-active-const-qgr-status-active-2-src-mq3-client-ui-rankings-ml-530606401"></a>
### QGR_STATUS_ACTIVE

```ml
const QGR_STATUS_ACTIVE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L16)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-bad-password-const-qgr-status-bad-password-7-src-mq3-client-ui-rankings-ml-1741422098"></a>
### QGR_STATUS_BAD_PASSWORD

```ml
const QGR_STATUS_BAD_PASSWORD = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L21)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-error-const-qgr-status-error-12-src-mq3-client-ui-rankings-ml-2086539740"></a>
### QGR_STATUS_ERROR

```ml
const QGR_STATUS_ERROR = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L26)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-invaliduser-const-qgr-status-invaliduser-11-src-mq3-client-ui-rankings-ml-230413545"></a>
### QGR_STATUS_INVALIDUSER

```ml
const QGR_STATUS_INVALIDUSER = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L25)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-leaving-const-qgr-status-leaving-5-src-mq3-client-ui-rankings-ml-2014042894"></a>
### QGR_STATUS_LEAVING

```ml
const QGR_STATUS_LEAVING = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L19)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-new-const-qgr-status-new-0-src-mq3-client-ui-rankings-ml-378009721"></a>
### QGR_STATUS_NEW

```ml
const QGR_STATUS_NEW = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L14)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-no-membership-const-qgr-status-no-membership-9-src-mq3-client-ui-rankings-ml-2087530238"></a>
### QGR_STATUS_NO_MEMBERSHIP

```ml
const QGR_STATUS_NO_MEMBERSHIP = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L23)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-no-user-const-qgr-status-no-user-6-src-mq3-client-ui-rankings-ml-894400537"></a>
### QGR_STATUS_NO_USER

```ml
const QGR_STATUS_NO_USER = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L20)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-pending-const-qgr-status-pending-4-src-mq3-client-ui-rankings-ml-796887643"></a>
### QGR_STATUS_PENDING

```ml
const QGR_STATUS_PENDING = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L18)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-spectator-const-qgr-status-spectator-1-src-mq3-client-ui-rankings-ml-678097068"></a>
### QGR_STATUS_SPECTATOR

```ml
const QGR_STATUS_SPECTATOR = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L15)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-timeout-const-qgr-status-timeout-10-src-mq3-client-ui-rankings-ml-2122329012"></a>
### QGR_STATUS_TIMEOUT

```ml
const QGR_STATUS_TIMEOUT = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L24)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-user-exists-const-qgr-status-user-exists-8-src-mq3-client-ui-rankings-ml-2133726797"></a>
### QGR_STATUS_USER_EXISTS

```ml
const QGR_STATUS_USER_EXISTS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L22)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-validating-const-qgr-status-validating-3-src-mq3-client-ui-rankings-ml-1166904198"></a>
### QGR_STATUS_VALIDATING

```ml
const QGR_STATUS_VALIDATING = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L17)

<a id="function-function-mq3-client-ui-rankings-rankings-cache-function-rankings-cache-state-src-mq3-client-ui-rankings-ml-1990891859"></a>
### Rankings_Cache

```ml
function Rankings_Cache(state)
```

Rankings_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L57)

<a id="function-function-mq3-client-ui-rankings-rankings-drawname-function-rankings-drawname-state-field-focus-overstrike-src-mq3-client-ui-rankings-ml-728883565"></a>
### Rankings_DrawName

```ml
function Rankings_DrawName(state, field, focus, overstrike)
```

Rankings_DrawName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `overstrike` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L40)

<a id="function-function-mq3-client-ui-rankings-rankings-drawpassword-function-rankings-drawpassword-state-field-focus-overstrike-src-mq3-client-ui-rankings-ml-1567922697"></a>
### Rankings_DrawPassword

```ml
function Rankings_DrawPassword(state, field, focus, overstrike)
```

Rankings_DrawPassword

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `overstrike` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L42)

<a id="function-function-mq3-client-ui-rankings-rankings-drawtext-function-rankings-drawtext-state-field-focus-overstrike-src-mq3-client-ui-rankings-ml-482848253"></a>
### Rankings_DrawText

```ml
function Rankings_DrawText(state, field, focus, overstrike)
```

Rankings_DrawText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `overstrike` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L36)

<a id="constant-constant-mq3-client-ui-rankings-rankings-frame-const-rankings-frame-menu-art-cut-frame-src-mq3-client-ui-rankings-ml-1840830341"></a>
### RANKINGS_FRAME

```ml
const RANKINGS_FRAME = "menu/art/cut_frame"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L7)

<a id="function-function-mq3-client-ui-rankings-rankings-menuevent-function-rankings-menuevent-state-id-event-src-mq3-client-ui-rankings-ml-216417846"></a>
### Rankings_MenuEvent

```ml
function Rankings_MenuEvent(state, id, event)
```

Rankings_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L45)

<a id="function-function-mq3-client-ui-rankings-rankings-menuinit-function-rankings-menuinit-state-status-src-mq3-client-ui-rankings-ml-1358598687"></a>
### Rankings_MenuInit

```ml
function Rankings_MenuInit(state, status)
```

Rankings_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L59)

<a id="function-function-mq3-client-ui-rankings-sanitize-function-sanitize-text-src-mq3-client-ui-rankings-ml-565239427"></a>
### sanitize

```ml
function sanitize(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L33)

- [mq3.client.ui_rankings.State](Type-mq3-client-ui-rankings-state-1592516948.md) — struct
<a id="function-function-mq3-client-ui-rankings-text-function-text-label-id-y-flags-src-mq3-client-ui-rankings-ml-50345155"></a>
### text

```ml
function text(label, id, y, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L55)

<a id="function-function-mq3-client-ui-rankings-ui-rankingsmenu-function-ui-rankingsmenu-state-status-src-mq3-client-ui-rankings-ml-1087400391"></a>
### UI_RankingsMenu

```ml
function UI_RankingsMenu(state, status)
```

UI_RankingsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L65)
