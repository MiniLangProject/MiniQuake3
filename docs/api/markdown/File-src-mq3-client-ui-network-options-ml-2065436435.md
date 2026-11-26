# `src/mq3/client/ui_network_options.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_network_options`](Package-mq3-client-ui-network-options-1080371339.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-network-options-cache-function-cache-src-mq3-client-ui-network-options-ml-2111973618"></a>
### cache

```ml
function cache()
```

UI_NetworkOptionsMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L74)

<a id="function-function-mq3-client-ui-network-options-event-function-event-menu-id-eventcode-value-src-mq3-client-ui-network-options-ml-1871556574"></a>
### event

```ml
function event(menu, id, eventCode, value)
```

UI_NetworkOptionsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI network options record/storage; this routine assigns `menu.actions`, `menu.cvarWrites`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["pop","display"] e...`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `value` | `dynamic` | — | Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["pop","display"] e...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L86)

<a id="constant-constant-mq3-client-ui-network-options-id-back-const-id-back-15-src-mq3-client-ui-network-options-ml-1098216957"></a>
### ID_BACK

```ml
const ID_BACK = 15
```

Event identifier of the Back control used to leave the network-rate options menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L20)

<a id="constant-constant-mq3-client-ui-network-options-id-display-const-id-display-11-src-mq3-client-ui-network-options-ml-1107448363"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```

Menu control identifier routed to the display action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L11)

<a id="constant-constant-mq3-client-ui-network-options-id-graphics-const-id-graphics-10-src-mq3-client-ui-network-options-ml-1431255756"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```

Menu control identifier routed to the graphics action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L9)

<a id="constant-constant-mq3-client-ui-network-options-id-network-const-id-network-13-src-mq3-client-ui-network-options-ml-511487209"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```

Menu control identifier routed to the network action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L15)

<a id="constant-constant-mq3-client-ui-network-options-id-rate-const-id-rate-14-src-mq3-client-ui-network-options-ml-1511274188"></a>
### ID_RATE

```ml
const ID_RATE = 14
```

Menu control identifier routed to the rate action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L17)

<a id="constant-constant-mq3-client-ui-network-options-id-sound-const-id-sound-12-src-mq3-client-ui-network-options-ml-159552910"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```

Menu control identifier routed to the sound action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L13)

<a id="function-function-mq3-client-ui-network-options-init-function-init-rate-src-mq3-client-ui-network-options-ml-1713148064"></a>
### init

```ml
function init(rate)
```

UI_NetworkOptionsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Value used by `items=[item(0,"btext","SYSTEM SETUP",320,16,0),item(0,"bitmap","menu/art/frame2_l",0,78,0),item(0,"bitmap","menu/art/frame1_r",376,76,0),item(...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L77)

<a id="function-function-mq3-client-ui-network-options-item-function-item-id-kind-name-x-y-value-src-mq3-client-ui-network-options-ml-1324895736"></a>
### item

```ml
function item(id, kind, name, x, y, value)
```

Creates a `mq3.client.ui_network_options.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Item.id`. |
| `kind` | `dynamic` | — | Value used to initialize `Item.kind`. |
| `name` | `dynamic` | — | Value used to initialize `Item.name`. |
| `x` | `dynamic` | — | Value used to initialize `Item.x`. |
| `y` | `dynamic` | — | Value used to initialize `Item.y`. |
| `value` | `dynamic` | — | Value used to initialize `Item.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L66)

- [mq3.client.ui_network_options.Item](Type-mq3-client-ui-network-options-item-631398488.md) — struct
- [mq3.client.ui_network_options.Menu](Type-mq3-client-ui-network-options-menu-1084079952.md) — struct
<a id="function-function-mq3-client-ui-network-options-open-function-open-rate-src-mq3-client-ui-network-options-ml-2851948"></a>
### open

```ml
function open(rate)
```

UI_NetworkOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Argument 1 of `mq3.client.ui_network_options.init`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L93)

<a id="constant-constant-mq3-client-ui-network-options-qm-activated-const-qm-activated-3-src-mq3-client-ui-network-options-ml-1674065460"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the network-rate options menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L7)

<a id="function-function-mq3-client-ui-network-options-rateindex-function-rateindex-rate-src-mq3-client-ui-network-options-ml-838841856"></a>
### rateIndex

```ml
function rateIndex(rate)
```

Evaluates UI network options `rateIndex` and returns `0`, `1`, `2` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Value used by `if rate<=2500 then return 0 else if rate<=3000 then return 1 else if rate<=4000 then return 2 else if rate<=5000 then return 3 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L69)

<a id="function-function-mq3-client-ui-network-options-ratevalue-function-ratevalue-index-src-mq3-client-ui-network-options-ml-1596768438"></a>
### rateValue

```ml
function rateValue(index)
```

Evaluates UI network options `rateValue` and returns `2500`, `3000`, `4000` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value tested by `index==0`, `index==1` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L72)
