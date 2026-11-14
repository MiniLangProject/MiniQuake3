# `src/mq3/client/ui_sound_options.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_sound_options`](Package-mq3-client-ui-sound-options-1452362466.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-sound-options-cache-function-cache-src-mq3-client-ui-sound-options-ml-1739873164"></a>
### cache

```ml
function cache()
```

UI_SoundOptionsMenu_Cache


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L24)

<a id="function-function-mq3-client-ui-sound-options-event-function-event-menu-id-eventcode-value-src-mq3-client-ui-sound-options-ml-605962800"></a>
### event

```ml
function event(menu, id, eventCode, value)
```

UI_SoundOptionsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L46)

<a id="constant-constant-mq3-client-ui-sound-options-id-back-const-id-back-18-src-mq3-client-ui-sound-options-ml-486695126"></a>
### ID_BACK

```ml
const ID_BACK = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L14)

<a id="constant-constant-mq3-client-ui-sound-options-id-display-const-id-display-11-src-mq3-client-ui-sound-options-ml-1762972869"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L8)

<a id="constant-constant-mq3-client-ui-sound-options-id-effectsvolume-const-id-effectsvolume-14-src-mq3-client-ui-sound-options-ml-1830882252"></a>
### ID_EFFECTSVOLUME

```ml
const ID_EFFECTSVOLUME = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L11)

<a id="constant-constant-mq3-client-ui-sound-options-id-graphics-const-id-graphics-10-src-mq3-client-ui-sound-options-ml-2038290690"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L7)

<a id="constant-constant-mq3-client-ui-sound-options-id-musicvolume-const-id-musicvolume-15-src-mq3-client-ui-sound-options-ml-1000765303"></a>
### ID_MUSICVOLUME

```ml
const ID_MUSICVOLUME = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L12)

<a id="constant-constant-mq3-client-ui-sound-options-id-network-const-id-network-13-src-mq3-client-ui-sound-options-ml-722497259"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L10)

<a id="constant-constant-mq3-client-ui-sound-options-id-quality-const-id-quality-16-src-mq3-client-ui-sound-options-ml-1572456220"></a>
### ID_QUALITY

```ml
const ID_QUALITY = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L13)

<a id="constant-constant-mq3-client-ui-sound-options-id-sound-const-id-sound-12-src-mq3-client-ui-sound-options-ml-626659040"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L9)

<a id="function-function-mq3-client-ui-sound-options-init-function-init-svolume-smusicvolume-scompression-src-mq3-client-ui-sound-options-ml-120410988"></a>
### init

```ml
function init(sVolume, sMusicVolume, sCompression)
```

UI_SoundOptionsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sVolume` | `dynamic` | — |  |
| `sMusicVolume` | `dynamic` | — |  |
| `sCompression` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L29)

<a id="function-function-mq3-client-ui-sound-options-item-function-item-id-kind-name-x-y-minvalue-maxvalue-value-active-src-mq3-client-ui-sound-options-ml-589524636"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L19)

- [mq3.client.ui_sound_options.Item](Type-mq3-client-ui-sound-options-item-793859675.md) — struct
- [mq3.client.ui_sound_options.Menu](Type-mq3-client-ui-sound-options-menu-323770811.md) — struct
<a id="function-function-mq3-client-ui-sound-options-open-function-open-svolume-smusicvolume-scompression-src-mq3-client-ui-sound-options-ml-517094928"></a>
### open

```ml
function open(sVolume, sMusicVolume, sCompression)
```

UI_SoundOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sVolume` | `dynamic` | — |  |
| `sMusicVolume` | `dynamic` | — |  |
| `sCompression` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L64)

<a id="constant-constant-mq3-client-ui-sound-options-qm-activated-const-qm-activated-3-src-mq3-client-ui-sound-options-ml-2043382004"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L6)
