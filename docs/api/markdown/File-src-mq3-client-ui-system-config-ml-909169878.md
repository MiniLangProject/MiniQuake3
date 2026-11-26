# `src/mq3/client/ui_system_config.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_system_config`](Package-mq3-client-ui-system-config-802992464.md)

Reachable from entry: **no**

## Declarations

<a id="constant-constant-mq3-client-ui-system-config-ca-connected-const-ca-connected-5-src-mq3-client-ui-system-config-ml-628649282"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```

Connection-state value for a completed handshake before game-state loading, defined for retaining the native connection-state vocabulary used by system menus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L10)

<a id="function-function-mq3-client-ui-system-config-cache-function-cache-src-mq3-client-ui-system-config-ml-1549317048"></a>
### cache

```ml
function cache()
```

SystemConfig_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L64)

<a id="function-function-mq3-client-ui-system-config-event-function-event-menu-id-eventcode-src-mq3-client-ui-system-config-ml-1219833115"></a>
### event

```ml
function event(menu, id, eventCode)
```

Options_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI system config record/storage; this routine assigns `menu.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["display"] else if id==I...`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L75)

<a id="constant-constant-mq3-client-ui-system-config-id-back-const-id-back-14-src-mq3-client-ui-system-config-ml-1826527866"></a>
### ID_BACK

```ml
const ID_BACK = 14
```

Event identifier of the Back control used to leave the system-configuration submenu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L21)

<a id="constant-constant-mq3-client-ui-system-config-id-display-const-id-display-11-src-mq3-client-ui-system-config-ml-298368953"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```

Menu control identifier routed to the display action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L14)

<a id="constant-constant-mq3-client-ui-system-config-id-graphics-const-id-graphics-10-src-mq3-client-ui-system-config-ml-126598866"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```

Menu control identifier routed to the graphics action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L12)

<a id="constant-constant-mq3-client-ui-system-config-id-network-const-id-network-13-src-mq3-client-ui-system-config-ml-1708786555"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```

Menu control identifier routed to the network action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L18)

<a id="constant-constant-mq3-client-ui-system-config-id-sound-const-id-sound-12-src-mq3-client-ui-system-config-ml-215982836"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```

Menu control identifier routed to the sound action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L16)

<a id="function-function-mq3-client-ui-system-config-init-function-init-connstate-src-mq3-client-ui-system-config-ml-446990107"></a>
### init

```ml
function init(connState)
```

Options_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connState` | `dynamic` | — | Value used by `return Menu(true,connState<CA_CONNECTED,items,cache(),[],false)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L67)

<a id="function-function-mq3-client-ui-system-config-item-function-item-id-kind-name-x-y-src-mq3-client-ui-system-config-ml-1478832199"></a>
### item

```ml
function item(id, kind, name, x, y)
```

Creates a `mq3.client.ui_system_config.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Item.id`. |
| `kind` | `dynamic` | — | Value used to initialize `Item.kind`. |
| `name` | `dynamic` | — | Value used to initialize `Item.name`. |
| `x` | `dynamic` | — | Value used to initialize `Item.x`. |
| `y` | `dynamic` | — | Value used to initialize `Item.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L62)

- [mq3.client.ui_system_config.Item](Type-mq3-client-ui-system-config-item-637978321.md) — struct
- [mq3.client.ui_system_config.Menu](Type-mq3-client-ui-system-config-menu-1987868637.md) — struct
<a id="function-function-mq3-client-ui-system-config-open-function-open-connstate-src-mq3-client-ui-system-config-ml-467771871"></a>
### open

```ml
function open(connState)
```

UI_SystemConfigMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connState` | `dynamic` | — | Value used by `menu=init(connState)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L82)

<a id="constant-constant-mq3-client-ui-system-config-qm-activated-const-qm-activated-3-src-mq3-client-ui-system-config-ml-759578524"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the system-configuration submenu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_system_config.ml#L7)
