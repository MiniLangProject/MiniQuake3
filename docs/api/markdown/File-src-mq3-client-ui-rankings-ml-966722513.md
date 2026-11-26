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

Computes `(c>=48 and c<=57) or (c>=65 and c<=90) or (c>=97 and c<=122)` for UI rankings `alphanumeric`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `c` | `dynamic` | — | Value used by `return (c>=48 and c<=57) or (c>=65 and c<=90) or (c>=97 and c<=122)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L131)

<a id="function-function-mq3-client-ui-rankings-create-function-create-retailactive-src-mq3-client-ui-rankings-ml-2012381565"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_rankings.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L118)

<a id="function-function-mq3-client-ui-rankings-emit-function-emit-state-boundary-kind-name-text-x-y-value-src-mq3-client-ui-rankings-ml-1169748799"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, x, y, value)
```

Appends a UI rankings action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankings record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI rankings resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI rankings path. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `value` | `dynamic` | — | Value used by `a=Action(boundary,kind,name,text,x,y,value,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L128)

<a id="constant-constant-mq3-client-ui-rankings-id-create-const-id-create-102-src-mq3-client-ui-rankings-ml-852312706"></a>
### ID_CREATE

```ml
const ID_CREATE = 102
```

Menu control identifier routed to the create action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L14)

<a id="constant-constant-mq3-client-ui-rankings-id-leave-const-id-leave-105-src-mq3-client-ui-rankings-ml-55979039"></a>
### ID_LEAVE

```ml
const ID_LEAVE = 105
```

Menu control identifier routed to the leave action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L20)

<a id="constant-constant-mq3-client-ui-rankings-id-login-const-id-login-100-src-mq3-client-ui-rankings-ml-1931549684"></a>
### ID_LOGIN

```ml
const ID_LOGIN = 100
```

Menu control identifier routed to the login action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L10)

<a id="constant-constant-mq3-client-ui-rankings-id-logout-const-id-logout-101-src-mq3-client-ui-rankings-ml-1271052167"></a>
### ID_LOGOUT

```ml
const ID_LOGOUT = 101
```

Menu control identifier routed to the logout action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L12)

<a id="constant-constant-mq3-client-ui-rankings-id-setup-const-id-setup-104-src-mq3-client-ui-rankings-ml-712654024"></a>
### ID_SETUP

```ml
const ID_SETUP = 104
```

Menu control identifier routed to the setup action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L18)

<a id="constant-constant-mq3-client-ui-rankings-id-spectate-const-id-spectate-103-src-mq3-client-ui-rankings-ml-934239853"></a>
### ID_SPECTATE

```ml
const ID_SPECTATE = 103
```

Menu control identifier routed to the spectate action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L16)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-active-const-qgr-status-active-2-src-mq3-client-ui-rankings-ml-530606401"></a>
### QGR_STATUS_ACTIVE

```ml
const QGR_STATUS_ACTIVE = 2
```

Legacy ranking-service status code indicating the active state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L26)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-bad-password-const-qgr-status-bad-password-7-src-mq3-client-ui-rankings-ml-1741422098"></a>
### QGR_STATUS_BAD_PASSWORD

```ml
const QGR_STATUS_BAD_PASSWORD = 7
```

Legacy ranking-service status code indicating the bad password state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L36)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-error-const-qgr-status-error-12-src-mq3-client-ui-rankings-ml-2086539740"></a>
### QGR_STATUS_ERROR

```ml
const QGR_STATUS_ERROR = 12
```

Legacy ranking-service status code indicating the error state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L46)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-invaliduser-const-qgr-status-invaliduser-11-src-mq3-client-ui-rankings-ml-230413545"></a>
### QGR_STATUS_INVALIDUSER

```ml
const QGR_STATUS_INVALIDUSER = 11
```

Legacy ranking-service status code indicating the invaliduser state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L44)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-leaving-const-qgr-status-leaving-5-src-mq3-client-ui-rankings-ml-2014042894"></a>
### QGR_STATUS_LEAVING

```ml
const QGR_STATUS_LEAVING = 5
```

Legacy ranking-service status code indicating the leaving state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L32)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-new-const-qgr-status-new-0-src-mq3-client-ui-rankings-ml-378009721"></a>
### QGR_STATUS_NEW

```ml
const QGR_STATUS_NEW = 0
```

Legacy ranking-service status code indicating the new state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L22)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-no-membership-const-qgr-status-no-membership-9-src-mq3-client-ui-rankings-ml-2087530238"></a>
### QGR_STATUS_NO_MEMBERSHIP

```ml
const QGR_STATUS_NO_MEMBERSHIP = 9
```

Legacy ranking-service status code indicating the no membership state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L40)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-no-user-const-qgr-status-no-user-6-src-mq3-client-ui-rankings-ml-894400537"></a>
### QGR_STATUS_NO_USER

```ml
const QGR_STATUS_NO_USER = 6
```

Legacy ranking-service status code indicating the no user state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L34)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-pending-const-qgr-status-pending-4-src-mq3-client-ui-rankings-ml-796887643"></a>
### QGR_STATUS_PENDING

```ml
const QGR_STATUS_PENDING = 4
```

Legacy ranking-service status code indicating the pending state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L30)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-spectator-const-qgr-status-spectator-1-src-mq3-client-ui-rankings-ml-678097068"></a>
### QGR_STATUS_SPECTATOR

```ml
const QGR_STATUS_SPECTATOR = 1
```

Legacy ranking-service status code indicating the spectator state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L24)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-timeout-const-qgr-status-timeout-10-src-mq3-client-ui-rankings-ml-2122329012"></a>
### QGR_STATUS_TIMEOUT

```ml
const QGR_STATUS_TIMEOUT = 10
```

Legacy ranking-service status code indicating the timeout state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L42)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-user-exists-const-qgr-status-user-exists-8-src-mq3-client-ui-rankings-ml-2133726797"></a>
### QGR_STATUS_USER_EXISTS

```ml
const QGR_STATUS_USER_EXISTS = 8
```

Legacy ranking-service status code indicating the user exists state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L38)

<a id="constant-constant-mq3-client-ui-rankings-qgr-status-validating-const-qgr-status-validating-3-src-mq3-client-ui-rankings-ml-1166904198"></a>
### QGR_STATUS_VALIDATING

```ml
const QGR_STATUS_VALIDATING = 3
```

Legacy ranking-service status code indicating the validating state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L28)

<a id="function-function-mq3-client-ui-rankings-rankings-cache-function-rankings-cache-state-src-mq3-client-ui-rankings-ml-1990891859"></a>
### Rankings_Cache

```ml
function Rankings_Cache(state)
```

Rankings_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI rankings state passed to the helper calls in `Rankings_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L179)

<a id="function-function-mq3-client-ui-rankings-rankings-drawname-function-rankings-drawname-state-field-focus-overstrike-src-mq3-client-ui-rankings-ml-728883565"></a>
### Rankings_DrawName

```ml
function Rankings_DrawName(state, field, focus, overstrike)
```

Rankings_DrawName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI rankings state passed to the helper calls in `Rankings_DrawName`. |
| `field` | `dynamic` | — | Mutable UI rankings record/storage; this routine assigns `field.buffer`, `field.fieldCursor`. |
| `focus` | `dynamic` | — | Value used by `return Rankings_DrawText(state,field,focus,overstrike)`. |
| `overstrike` | `dynamic` | — | Value used by `return Rankings_DrawText(state,field,focus,overstrike)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L149)

<a id="function-function-mq3-client-ui-rankings-rankings-drawpassword-function-rankings-drawpassword-state-field-focus-overstrike-src-mq3-client-ui-rankings-ml-1567922697"></a>
### Rankings_DrawPassword

```ml
function Rankings_DrawPassword(state, field, focus, overstrike)
```

Rankings_DrawPassword

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI rankings state passed to the helper calls in `Rankings_DrawPassword`. |
| `field` | `dynamic` | — | Mutable UI rankings record/storage; this routine assigns `field.buffer`, `field.fieldCursor`. |
| `focus` | `dynamic` | — | Value used by `rows=Rankings_DrawText(state,field,focus,overstrike)`. |
| `overstrike` | `dynamic` | — | Value used by `rows=Rankings_DrawText(state,field,focus,overstrike)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L155)

<a id="function-function-mq3-client-ui-rankings-rankings-drawtext-function-rankings-drawtext-state-field-focus-overstrike-src-mq3-client-ui-rankings-ml-482848253"></a>
### Rankings_DrawText

```ml
function Rankings_DrawText(state, field, focus, overstrike)
```

Rankings_DrawText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI rankings state passed to the helper calls in `Rankings_DrawText`. |
| `field` | `dynamic` | — | Record read through `field.x`, `field.y`, `field.buffer`, `field.fieldCursor`. |
| `focus` | `dynamic` | — | Value used by `if focus then style=style\|q.UI_PULSE end if`. |
| `overstrike` | `dynamic` | — | Value used by `if overstrike then cursor=11 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L141)

<a id="constant-constant-mq3-client-ui-rankings-rankings-frame-const-rankings-frame-menu-art-cut-frame-src-mq3-client-ui-rankings-ml-1840830341"></a>
### RANKINGS_FRAME

```ml
const RANKINGS_FRAME = "menu/art/cut_frame"
```

Virtual asset path used to load the rankings frame renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L8)

<a id="function-function-mq3-client-ui-rankings-rankings-menuevent-function-rankings-menuevent-state-id-event-src-mq3-client-ui-rankings-ml-216417846"></a>
### Rankings_MenuEvent

```ml
function Rankings_MenuEvent(state, id, event)
```

Rankings_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankings record/storage; this routine assigns `state.forcedOff`. |
| `id` | `dynamic` | — | Value used by `if id==ID_LOGIN then emit(state,"ui","open-menu","login","",0,0,0)`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L161)

<a id="function-function-mq3-client-ui-rankings-rankings-menuinit-function-rankings-menuinit-state-status-src-mq3-client-ui-rankings-ml-1358598687"></a>
### Rankings_MenuInit

```ml
function Rankings_MenuInit(state, status)
```

Rankings_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankings record/storage; this routine assigns `state.menu`, `state.actions`, `state.status`, `state.frame` and additional values. |
| `status` | `dynamic` | — | Value assigned to `state.status`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L183)

<a id="function-function-mq3-client-ui-rankings-sanitize-function-sanitize-text-src-mq3-client-ui-rankings-ml-565239427"></a>
### sanitize

```ml
function sanitize(text)
```

Calls `mq3.client.ui_rankings.alphanumeric`, `decode` from UI rankings `sanitize`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `sanitize` in the UI rankings path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L134)

- [mq3.client.ui_rankings.State](Type-mq3-client-ui-rankings-state-1592516948.md) — struct
<a id="function-function-mq3-client-ui-rankings-text-function-text-label-id-y-flags-src-mq3-client-ui-rankings-ml-50345155"></a>
### text

```ml
function text(label, id, y, flags)
```

Calls `mq3.client.ui_qmenu.item` from UI rankings `text`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | `dynamic` | — | Value assigned to `item.string`. |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,320,y,flags)`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `text`. |
| `flags` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_PTEXT,"",id,320,y,flags)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L176)

<a id="function-function-mq3-client-ui-rankings-ui-rankingsmenu-function-ui-rankingsmenu-state-status-src-mq3-client-ui-rankings-ml-1087400391"></a>
### UI_RankingsMenu

```ml
function UI_RankingsMenu(state, status)
```

UI_RankingsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankings record/storage; this routine assigns `state.pushed`. |
| `status` | `dynamic` | — | Value used by `Rankings_MenuInit(state,status)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankings.ml#L191)
