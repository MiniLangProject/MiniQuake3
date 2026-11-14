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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L18)

<a id="function-function-mq3-client-ui-network-options-event-function-event-menu-id-eventcode-value-src-mq3-client-ui-network-options-ml-1871556574"></a>
### event

```ml
function event(menu, id, eventCode, value)
```

UI_NetworkOptionsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L25)

<a id="constant-constant-mq3-client-ui-network-options-id-back-const-id-back-15-src-mq3-client-ui-network-options-ml-1098216957"></a>
### ID_BACK

```ml
const ID_BACK = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L11)

<a id="constant-constant-mq3-client-ui-network-options-id-display-const-id-display-11-src-mq3-client-ui-network-options-ml-1107448363"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L7)

<a id="constant-constant-mq3-client-ui-network-options-id-graphics-const-id-graphics-10-src-mq3-client-ui-network-options-ml-1431255756"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L6)

<a id="constant-constant-mq3-client-ui-network-options-id-network-const-id-network-13-src-mq3-client-ui-network-options-ml-511487209"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L9)

<a id="constant-constant-mq3-client-ui-network-options-id-rate-const-id-rate-14-src-mq3-client-ui-network-options-ml-1511274188"></a>
### ID_RATE

```ml
const ID_RATE = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L10)

<a id="constant-constant-mq3-client-ui-network-options-id-sound-const-id-sound-12-src-mq3-client-ui-network-options-ml-159552910"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L8)

<a id="function-function-mq3-client-ui-network-options-init-function-init-rate-src-mq3-client-ui-network-options-ml-1713148064"></a>
### init

```ml
function init(rate)
```

UI_NetworkOptionsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L20)

<a id="function-function-mq3-client-ui-network-options-item-function-item-id-kind-name-x-y-value-src-mq3-client-ui-network-options-ml-1324895736"></a>
### item

```ml
function item(id, kind, name, x, y, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L14)

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
| `rate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L31)

<a id="constant-constant-mq3-client-ui-network-options-qm-activated-const-qm-activated-3-src-mq3-client-ui-network-options-ml-1674065460"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L5)

<a id="function-function-mq3-client-ui-network-options-rateindex-function-rateindex-rate-src-mq3-client-ui-network-options-ml-838841856"></a>
### rateIndex

```ml
function rateIndex(rate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L15)

<a id="function-function-mq3-client-ui-network-options-ratevalue-function-ratevalue-index-src-mq3-client-ui-network-options-ml-1596768438"></a>
### rateValue

```ml
function rateValue(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_network_options.ml#L16)
