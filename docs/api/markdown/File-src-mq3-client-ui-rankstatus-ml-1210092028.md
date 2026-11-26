# `src/mq3/client/ui_rankstatus.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_rankstatus`](Package-mq3-client-ui-rankstatus-599593620.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `q` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/client/ui_rankings.ml` as `rankings` → [src/mq3/client/ui_rankings.ml](File-src-mq3-client-ui-rankings-ml-966722513.md)

## Declarations

- [mq3.client.ui_rankstatus.Action](Type-mq3-client-ui-rankstatus-action-183679844.md) — struct
<a id="function-function-mq3-client-ui-rankstatus-create-function-create-retailactive-src-mq3-client-ui-rankstatus-ml-2016194125"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_rankstatus.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L64)

<a id="function-function-mq3-client-ui-rankstatus-emit-function-emit-state-boundary-kind-name-text-src-mq3-client-ui-rankstatus-ml-1125391529"></a>
### emit

```ml
function emit(state, boundary, kind, name, text)
```

Appends a UI rankstatus action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankstatus record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI rankstatus resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI rankstatus path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L71)

<a id="constant-constant-mq3-client-ui-rankstatus-id-message-const-id-message-100-src-mq3-client-ui-rankstatus-ml-1717840990"></a>
### ID_MESSAGE

```ml
const ID_MESSAGE = 100
```

Menu control identifier routed to the message action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L10)

<a id="constant-constant-mq3-client-ui-rankstatus-id-ok-const-id-ok-101-src-mq3-client-ui-rankstatus-ml-1057689869"></a>
### ID_OK

```ml
const ID_OK = 101
```

Menu control identifier routed to the ok action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L12)

<a id="function-function-mq3-client-ui-rankstatus-rankstatus-cache-function-rankstatus-cache-state-src-mq3-client-ui-rankstatus-ml-1214388385"></a>
### RankStatus_Cache

```ml
function RankStatus_Cache(state)
```

RankStatus_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI rankstatus state passed to the helper calls in `RankStatus_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L81)

<a id="constant-constant-mq3-client-ui-rankstatus-rankstatus-frame-const-rankstatus-frame-menu-art-cut-frame-src-mq3-client-ui-rankstatus-ml-1420861779"></a>
### RANKSTATUS_FRAME

```ml
const RANKSTATUS_FRAME = "menu/art/cut_frame"
```

Virtual asset path used to load the rankstatus frame renderer or menu resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L8)

<a id="function-function-mq3-client-ui-rankstatus-rankstatus-menuevent-function-rankstatus-menuevent-state-id-event-src-mq3-client-ui-rankstatus-ml-2079593546"></a>
### RankStatus_MenuEvent

```ml
function RankStatus_MenuEvent(state, id, event)
```

RankStatus_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankstatus record/storage; this routine assigns `state.popped`, `state.menu.popped`. |
| `id` | `dynamic` | — | Value used by `if event!=q.QM_ACTIVATED or id!=ID_OK then return false end if`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L76)

<a id="function-function-mq3-client-ui-rankstatus-rankstatus-menuinit-function-rankstatus-menuinit-state-src-mq3-client-ui-rankstatus-ml-1972845357"></a>
### RankStatus_MenuInit

```ml
function RankStatus_MenuInit(state)
```

RankStatus_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankstatus record/storage; this routine assigns `state.menu`, `state.actions`, `state.frame`, `state.frame.width` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L84)

- [mq3.client.ui_rankstatus.State](Type-mq3-client-ui-rankstatus-state-869481587.md) — struct
<a id="function-function-mq3-client-ui-rankstatus-statusmessage-function-statusmessage-status-src-mq3-client-ui-rankstatus-ml-316279542"></a>
### statusMessage

```ml
function statusMessage(status)
```

Maps a rankings service error status to its user-facing message; unhandled statuses yield an empty string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | `dynamic` | — | Value used by `if status==rankings.QGR_STATUS_NO_USER then return "Username unavailable" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L89)

<a id="function-function-mq3-client-ui-rankstatus-ui-rankstatusmenu-function-ui-rankstatusmenu-state-status-src-mq3-client-ui-rankstatus-ml-1009151591"></a>
### UI_RankStatusMenu

```ml
function UI_RankStatusMenu(state, status)
```

UI_RankStatusMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI rankstatus record/storage; this routine assigns `state.status`, `state.messageText`, `state.forcedOff`, `state.pushed`. |
| `status` | `dynamic` | — | Value assigned to `state.status`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L93)
