# `src/mq3/client/ui_display_options.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_display_options`](Package-mq3-client-ui-display-options-2080977435.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-display-options-cache-function-cache-src-mq3-client-ui-display-options-ml-1034601618"></a>
### cache

```ml
function cache()
```

UI_DisplayOptionsMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L85)

<a id="function-function-mq3-client-ui-display-options-event-function-event-menu-id-eventcode-value-src-mq3-client-ui-display-options-ml-1537874886"></a>
### event

```ml
function event(menu, id, eventCode, value)
```

UI_DisplayOptionsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI display options record/storage; this routine assigns `menu.actions`, `menu.cvarWrites`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"]`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `value` | `dynamic` | — | Value used by `else if id==ID_BRIGHTNESS then menu.cvarWrites=menu.cvarWrites+[["r_gamma",value/10.0]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L113)

<a id="constant-constant-mq3-client-ui-display-options-id-back-const-id-back-16-src-mq3-client-ui-display-options-ml-131938494"></a>
### ID_BACK

```ml
const ID_BACK = 16
```

Event identifier of the Back control used to leave the display and gamma options menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L23)

<a id="constant-constant-mq3-client-ui-display-options-id-brightness-const-id-brightness-14-src-mq3-client-ui-display-options-ml-1951102980"></a>
### ID_BRIGHTNESS

```ml
const ID_BRIGHTNESS = 14
```

Menu control identifier routed to the brightness action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L18)

<a id="constant-constant-mq3-client-ui-display-options-id-display-const-id-display-11-src-mq3-client-ui-display-options-ml-1123045739"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```

Menu control identifier routed to the display action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L12)

<a id="constant-constant-mq3-client-ui-display-options-id-graphics-const-id-graphics-10-src-mq3-client-ui-display-options-ml-1620890572"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```

Menu control identifier routed to the graphics action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L10)

<a id="constant-constant-mq3-client-ui-display-options-id-network-const-id-network-13-src-mq3-client-ui-display-options-ml-10975337"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```

Menu control identifier routed to the network action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L16)

<a id="constant-constant-mq3-client-ui-display-options-id-screensize-const-id-screensize-15-src-mq3-client-ui-display-options-ml-72331113"></a>
### ID_SCREENSIZE

```ml
const ID_SCREENSIZE = 15
```

Menu control identifier routed to the screensize action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L20)

<a id="constant-constant-mq3-client-ui-display-options-id-sound-const-id-sound-12-src-mq3-client-ui-display-options-ml-520338702"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```

Menu control identifier routed to the sound action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L14)

<a id="function-function-mq3-client-ui-display-options-init-function-init-rgamma-cgviewsize-devicesupportsgamma-src-mq3-client-ui-display-options-ml-2087411368"></a>
### init

```ml
function init(rGamma, cgViewsize, deviceSupportsGamma)
```

UI_DisplayOptionsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rGamma` | `dynamic` | — | Value used by `items=items+[item(ID_BRIGHTNESS,"slider","Brightness:",400,222,5.0,20.0,rGamma*10.0,deviceSupportsGamma)]`. |
| `cgViewsize` | `dynamic` | — | Value used by `items=items+[item(ID_SCREENSIZE,"slider","Screen Size:",400,240,3.0,10.0,cgViewsize/10.0,true)]`. |
| `deviceSupportsGamma` | `dynamic` | — | Value used by `items=items+[item(ID_BRIGHTNESS,"slider","Brightness:",400,222,5.0,20.0,rGamma*10.0,deviceSupportsGamma)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L93)

<a id="function-function-mq3-client-ui-display-options-item-function-item-id-kind-name-x-y-minvalue-maxvalue-value-active-src-mq3-client-ui-display-options-ml-162636300"></a>
### item

```ml
function item(id, kind, name, x, y, minValue, maxValue, value, active)
```

Creates a `mq3.client.ui_display_options.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Item.id`. |
| `kind` | `dynamic` | — | Value used to initialize `Item.kind`. |
| `name` | `dynamic` | — | Value used to initialize `Item.name`. |
| `x` | `dynamic` | — | Value used to initialize `Item.x`. |
| `y` | `dynamic` | — | Value used to initialize `Item.y`. |
| `minValue` | `dynamic` | — | Value used to initialize `Item.minValue`. |
| `maxValue` | `dynamic` | — | Value used to initialize `Item.maxValue`. |
| `value` | `dynamic` | — | Value used to initialize `Item.value`. |
| `active` | `dynamic` | — | Value used to initialize `Item.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L80)

- [mq3.client.ui_display_options.Item](Type-mq3-client-ui-display-options-item-2063193960.md) — struct
- [mq3.client.ui_display_options.Menu](Type-mq3-client-ui-display-options-menu-1101877152.md) — struct
<a id="function-function-mq3-client-ui-display-options-open-function-open-rgamma-cgviewsize-devicesupportsgamma-src-mq3-client-ui-display-options-ml-1939287268"></a>
### open

```ml
function open(rGamma, cgViewsize, deviceSupportsGamma)
```

UI_DisplayOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rGamma` | `dynamic` | — | Argument 1 of `mq3.client.ui_display_options.init`. |
| `cgViewsize` | `dynamic` | — | Argument 2 of `mq3.client.ui_display_options.init`. |
| `deviceSupportsGamma` | `dynamic` | — | Argument 3 of `mq3.client.ui_display_options.init`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L129)

<a id="constant-constant-mq3-client-ui-display-options-qm-activated-const-qm-activated-3-src-mq3-client-ui-display-options-ml-921070772"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the display and gamma options menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L8)
