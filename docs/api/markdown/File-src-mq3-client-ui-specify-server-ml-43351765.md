# `src/mq3/client/ui_specify_server.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_specify_server`](Package-mq3-client-ui-specify-server-563992243.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-specify-server-cache-function-cache-src-mq3-client-ui-specify-server-ml-788636722"></a>
### cache

```ml
function cache()
```

SpecifyServer_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L51)

<a id="function-function-mq3-client-ui-specify-server-event-function-event-menu-id-eventcode-src-mq3-client-ui-specify-server-ml-1885597373"></a>
### event

```ml
function event(menu, id, eventCode)
```

SpecifyServer_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI specify server record/storage; this routine assigns `menu.commands`, `menu.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_SPECIFYSERVERGO and eventCode==QM_ACTIVATED and menu.domain!="" then address=menu.domain`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L45)

<a id="constant-constant-mq3-client-ui-specify-server-id-specifyserverback-const-id-specifyserverback-102-src-mq3-client-ui-specify-server-ml-1187946114"></a>
### ID_SPECIFYSERVERBACK

```ml
const ID_SPECIFYSERVERBACK = 102
```

Menu control identifier routed to the specifyserverback action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L9)

<a id="constant-constant-mq3-client-ui-specify-server-id-specifyservergo-const-id-specifyservergo-103-src-mq3-client-ui-specify-server-ml-299372295"></a>
### ID_SPECIFYSERVERGO

```ml
const ID_SPECIFYSERVERGO = 103
```

Menu control identifier routed to the specifyservergo action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L11)

<a id="function-function-mq3-client-ui-specify-server-init-function-init-src-mq3-client-ui-specify-server-ml-1096508914"></a>
### init

```ml
function init()
```

SpecifyServer_MenuInit


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L53)

<a id="function-function-mq3-client-ui-specify-server-open-function-open-src-mq3-client-ui-specify-server-ml-635926742"></a>
### open

```ml
function open()
```

UI_SpecifyServerMenu


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L55)

<a id="constant-constant-mq3-client-ui-specify-server-qm-activated-const-qm-activated-3-src-mq3-client-ui-specify-server-ml-207779720"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the direct server-address dialog before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L7)

- [mq3.client.ui_specify_server.SpecifyServerMenu](Type-mq3-client-ui-specify-server-specifyservermenu-665280162.md) — struct
