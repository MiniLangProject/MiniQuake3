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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L12)

<a id="function-function-mq3-client-ui-rankstatus-emit-function-emit-state-boundary-kind-name-text-src-mq3-client-ui-rankstatus-ml-1125391529"></a>
### emit

```ml
function emit(state, boundary, kind, name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L13)

<a id="constant-constant-mq3-client-ui-rankstatus-id-message-const-id-message-100-src-mq3-client-ui-rankstatus-ml-1717840990"></a>
### ID_MESSAGE

```ml
const ID_MESSAGE = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L8)

<a id="constant-constant-mq3-client-ui-rankstatus-id-ok-const-id-ok-101-src-mq3-client-ui-rankstatus-ml-1057689869"></a>
### ID_OK

```ml
const ID_OK = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L9)

<a id="function-function-mq3-client-ui-rankstatus-rankstatus-cache-function-rankstatus-cache-state-src-mq3-client-ui-rankstatus-ml-1214388385"></a>
### RankStatus_Cache

```ml
function RankStatus_Cache(state)
```

RankStatus_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L19)

<a id="constant-constant-mq3-client-ui-rankstatus-rankstatus-frame-const-rankstatus-frame-menu-art-cut-frame-src-mq3-client-ui-rankstatus-ml-1420861779"></a>
### RANKSTATUS_FRAME

```ml
const RANKSTATUS_FRAME = "menu/art/cut_frame"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L7)

<a id="function-function-mq3-client-ui-rankstatus-rankstatus-menuevent-function-rankstatus-menuevent-state-id-event-src-mq3-client-ui-rankstatus-ml-2079593546"></a>
### RankStatus_MenuEvent

```ml
function RankStatus_MenuEvent(state, id, event)
```

RankStatus_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L15)

<a id="function-function-mq3-client-ui-rankstatus-rankstatus-menuinit-function-rankstatus-menuinit-state-src-mq3-client-ui-rankstatus-ml-1972845357"></a>
### RankStatus_MenuInit

```ml
function RankStatus_MenuInit(state)
```

RankStatus_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L21)

- [mq3.client.ui_rankstatus.State](Type-mq3-client-ui-rankstatus-state-869481587.md) — struct
<a id="function-function-mq3-client-ui-rankstatus-statusmessage-function-statusmessage-status-src-mq3-client-ui-rankstatus-ml-316279542"></a>
### statusMessage

```ml
function statusMessage(status)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L24)

<a id="function-function-mq3-client-ui-rankstatus-ui-rankstatusmenu-function-ui-rankstatusmenu-state-status-src-mq3-client-ui-rankstatus-ml-1009151591"></a>
### UI_RankStatusMenu

```ml
function UI_RankStatusMenu(state, status)
```

UI_RankStatusMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankstatus.ml#L26)
