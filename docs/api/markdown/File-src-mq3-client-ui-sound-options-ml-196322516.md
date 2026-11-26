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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L90)

<a id="function-function-mq3-client-ui-sound-options-event-function-event-menu-id-eventcode-value-src-mq3-client-ui-sound-options-ml-605962800"></a>
### event

```ml
function event(menu, id, eventCode, value)
```

UI_SoundOptionsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI sound options record/storage; this routine assigns `menu.actions`, `menu.cvarWrites`, `menu.commands`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"]`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `value` | `dynamic` | — | Value tested by `value!=0.0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L119)

<a id="constant-constant-mq3-client-ui-sound-options-id-back-const-id-back-18-src-mq3-client-ui-sound-options-ml-486695126"></a>
### ID_BACK

```ml
const ID_BACK = 18
```

Event identifier of the Back control used to leave the sound and music options menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L25)

<a id="constant-constant-mq3-client-ui-sound-options-id-display-const-id-display-11-src-mq3-client-ui-sound-options-ml-1762972869"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 11
```

Menu control identifier routed to the display action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L12)

<a id="constant-constant-mq3-client-ui-sound-options-id-effectsvolume-const-id-effectsvolume-14-src-mq3-client-ui-sound-options-ml-1830882252"></a>
### ID_EFFECTSVOLUME

```ml
const ID_EFFECTSVOLUME = 14
```

Menu control identifier routed to the effectsvolume action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L18)

<a id="constant-constant-mq3-client-ui-sound-options-id-graphics-const-id-graphics-10-src-mq3-client-ui-sound-options-ml-2038290690"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 10
```

Menu control identifier routed to the graphics action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L10)

<a id="constant-constant-mq3-client-ui-sound-options-id-musicvolume-const-id-musicvolume-15-src-mq3-client-ui-sound-options-ml-1000765303"></a>
### ID_MUSICVOLUME

```ml
const ID_MUSICVOLUME = 15
```

Menu control identifier routed to the musicvolume action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L20)

<a id="constant-constant-mq3-client-ui-sound-options-id-network-const-id-network-13-src-mq3-client-ui-sound-options-ml-722497259"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 13
```

Menu control identifier routed to the network action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L16)

<a id="constant-constant-mq3-client-ui-sound-options-id-quality-const-id-quality-16-src-mq3-client-ui-sound-options-ml-1572456220"></a>
### ID_QUALITY

```ml
const ID_QUALITY = 16
```

Menu control identifier routed to the quality action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L22)

<a id="constant-constant-mq3-client-ui-sound-options-id-sound-const-id-sound-12-src-mq3-client-ui-sound-options-ml-626659040"></a>
### ID_SOUND

```ml
const ID_SOUND = 12
```

Menu control identifier routed to the sound action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L14)

<a id="function-function-mq3-client-ui-sound-options-init-function-init-svolume-smusicvolume-scompression-src-mq3-client-ui-sound-options-ml-120410988"></a>
### init

```ml
function init(sVolume, sMusicVolume, sCompression)
```

UI_SoundOptionsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sVolume` | `dynamic` | — | Value used by `items=items+[item(ID_EFFECTSVOLUME,"slider","Effects Volume:",400,213,0.0,10.0,sVolume*10.0,true)]`. |
| `sMusicVolume` | `dynamic` | — | Value used by `items=items+[item(ID_MUSICVOLUME,"slider","Music Volume:",400,231,0.0,10.0,sMusicVolume*10.0,true)]`. |
| `sCompression` | `dynamic` | — | Value used by `items=items+[item(ID_QUALITY,"spin","Sound Quality:",400,249,0.0,1.0,1.0-sCompression,true)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L98)

<a id="function-function-mq3-client-ui-sound-options-item-function-item-id-kind-name-x-y-minvalue-maxvalue-value-active-src-mq3-client-ui-sound-options-ml-589524636"></a>
### item

```ml
function item(id, kind, name, x, y, minValue, maxValue, value, active)
```

Creates a `mq3.client.ui_sound_options.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L85)

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
| `sVolume` | `dynamic` | — | Argument 1 of `mq3.client.ui_sound_options.init`. |
| `sMusicVolume` | `dynamic` | — | Argument 2 of `mq3.client.ui_sound_options.init`. |
| `sCompression` | `dynamic` | — | Argument 3 of `mq3.client.ui_sound_options.init`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L140)

<a id="constant-constant-mq3-client-ui-sound-options-qm-activated-const-qm-activated-3-src-mq3-client-ui-sound-options-ml-2043382004"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the sound and music options menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sound_options.ml#L8)
