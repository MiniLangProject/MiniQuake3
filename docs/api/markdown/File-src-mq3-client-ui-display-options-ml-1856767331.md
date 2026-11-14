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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L23)

<a id="function-function-mq3-client-ui-display-options-event-function-event-menu-id-eventcode-value-src-mq3-client-ui-display-options-ml-1537874886"></a>
### event

```ml
function event(menu, id, eventCode, value)
```

UI_DisplayOptionsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L44)

<a id="constant-constant-mq3-client-ui-display-options-id-back-const-id-back-16-src-mq3-client-ui-display-options-ml-131938494"></a>
### ID_BACK

```ml
const ID_BACK = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L13)

<a id="constant-constant-mq3-client-ui-display-options-id-brightness-const-id-brightness-14-src-mq3-client-ui-display-options-ml-1951102980"></a>
### ID_BRIGHTNESS

```ml
const ID_BRIGHTNESS = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L11)

<a id="constant-constant-mq3-client-ui-display-options-id-display-const-id-display-11-src-mq3-client-ui-display-options-ml-1123045739"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L8)

<a id="constant-constant-mq3-client-ui-display-options-id-graphics-const-id-graphics-10-src-mq3-client-ui-display-options-ml-1620890572"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L7)

<a id="constant-constant-mq3-client-ui-display-options-id-network-const-id-network-13-src-mq3-client-ui-display-options-ml-10975337"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L10)

<a id="constant-constant-mq3-client-ui-display-options-id-screensize-const-id-screensize-15-src-mq3-client-ui-display-options-ml-72331113"></a>
### ID_SCREENSIZE

```ml
const ID_SCREENSIZE = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L12)

<a id="constant-constant-mq3-client-ui-display-options-id-sound-const-id-sound-12-src-mq3-client-ui-display-options-ml-520338702"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L9)

<a id="function-function-mq3-client-ui-display-options-init-function-init-rgamma-cgviewsize-devicesupportsgamma-src-mq3-client-ui-display-options-ml-2087411368"></a>
### init

```ml
function init(rGamma, cgViewsize, deviceSupportsGamma)
```

UI_DisplayOptionsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rGamma` | `dynamic` | — |  |
| `cgViewsize` | `dynamic` | — |  |
| `deviceSupportsGamma` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L28)

<a id="function-function-mq3-client-ui-display-options-item-function-item-id-kind-name-x-y-minvalue-maxvalue-value-active-src-mq3-client-ui-display-options-ml-162636300"></a>
### item

```ml
function item(id, kind, name, x, y, minValue, maxValue, value, active)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `minValue` | `dynamic` | — |  |
| `maxValue` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `active` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L18)

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
| `rGamma` | `dynamic` | — |  |
| `cgViewsize` | `dynamic` | — |  |
| `deviceSupportsGamma` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L57)

<a id="constant-constant-mq3-client-ui-display-options-qm-activated-const-qm-activated-3-src-mq3-client-ui-display-options-ml-921070772"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_display_options.ml#L6)
