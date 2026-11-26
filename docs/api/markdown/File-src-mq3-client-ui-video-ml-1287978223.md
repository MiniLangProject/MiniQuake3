# `src/mq3/client/ui_video.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_video`](Package-mq3-client-ui-video-1745348463.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-video-applytemplate-function-applytemplate-state-index-src-mq3-client-ui-video-ml-1049138101"></a>
### applyTemplate

```ml
function applyTemplate(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L220)

<a id="function-function-mq3-client-ui-video-booleannumber-function-booleannumber-value-src-mq3-client-ui-video-ml-1558435103"></a>
### booleanNumber

```ml
function booleanNumber(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L182)

- [mq3.client.ui_video.ChoiceList](Type-mq3-client-ui-video-choicelist-1812260872.md) — struct
<a id="function-function-mq3-client-ui-video-copyinitial-function-copyinitial-value-src-mq3-client-ui-video-ml-1216927423"></a>
### copyInitial

```ml
function copyInitial(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L55)

<a id="function-function-mq3-client-ui-video-draw-function-draw-state-text-x-y-alignment-retailactive-src-mq3-client-ui-video-ml-378653897"></a>
### draw

```ml
function draw(state, text, x, y, alignment, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `alignment` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L91)

- [mq3.client.ui_video.DrawLine](Type-mq3-client-ui-video-drawline-655896091.md) — struct
<a id="function-function-mq3-client-ui-video-driverinfocache-function-driverinfocache-state-retailactive-src-mq3-client-ui-video-ml-962839168"></a>
### driverInfoCache

```ml
function driverInfoCache(state, retailActive)
```

DriverInfo_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L122)

<a id="function-function-mq3-client-ui-video-driverinfoevent-function-driverinfoevent-state-eventcode-retailactive-src-mq3-client-ui-video-ml-297760049"></a>
### driverInfoEvent

```ml
function driverInfoEvent(state, eventCode, retailActive)
```

DriverInfo_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L85)

<a id="function-function-mq3-client-ui-video-driverinfomenudraw-function-driverinfomenudraw-state-retailactive-src-mq3-client-ui-video-ml-824449996"></a>
### driverInfoMenuDraw

```ml
function driverInfoMenuDraw(state, retailActive)
```

DriverInfo_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L98)

- [mq3.client.ui_video.DriverInfoState](Type-mq3-client-ui-video-driverinfostate-600293082.md) — struct
<a id="function-function-mq3-client-ui-video-driverstate-function-driverstate-config-src-mq3-client-ui-video-ml-1664477902"></a>
### driverState

```ml
function driverState(config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L64)

- [mq3.client.ui_video.GlConfig](Type-mq3-client-ui-video-glconfig-65228990.md) — struct
<a id="constant-constant-mq3-client-ui-video-gldrv-icd-const-gldrv-icd-0-src-mq3-client-ui-video-ml-1283639161"></a>
### GLDRV_ICD

```ml
const GLDRV_ICD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L19)

<a id="constant-constant-mq3-client-ui-video-gldrv-voodoo-const-gldrv-voodoo-2-src-mq3-client-ui-video-ml-461396301"></a>
### GLDRV_VOODOO

```ml
const GLDRV_VOODOO = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L20)

<a id="constant-constant-mq3-client-ui-video-glhw-3dfx-2d3d-const-glhw-3dfx-2d3d-1-src-mq3-client-ui-video-ml-979199922"></a>
### GLHW_3DFX_2D3D

```ml
const GLHW_3DFX_2D3D = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L21)

<a id="function-function-mq3-client-ui-video-graphicschoices-function-graphicschoices-src-mq3-client-ui-video-ml-1896448560"></a>
### graphicsChoices

```ml
function graphicsChoices()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L311)

<a id="function-function-mq3-client-ui-video-graphicsitems-function-graphicsitems-state-src-mq3-client-ui-video-ml-702251099"></a>
### graphicsItems

```ml
function graphicsItems(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L285)

<a id="function-function-mq3-client-ui-video-graphicsoptionsapplychanges-function-graphicsoptionsapplychanges-state-eventcode-retailactive-src-mq3-client-ui-video-ml-410534257"></a>
### graphicsOptionsApplyChanges

```ml
function graphicsOptionsApplyChanges(state, eventCode, retailActive)
```

GraphicsOptions_ApplyChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L188)

<a id="function-function-mq3-client-ui-video-graphicsoptionscache-function-graphicsoptionscache-state-retailactive-src-mq3-client-ui-video-ml-1455954976"></a>
### graphicsOptionsCache

```ml
function graphicsOptionsCache(state, retailActive)
```

GraphicsOptions_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L327)

<a id="function-function-mq3-client-ui-video-graphicsoptionscheckconfig-function-graphicsoptionscheckconfig-state-src-mq3-client-ui-video-ml-822162865"></a>
### graphicsOptionsCheckConfig

```ml
function graphicsOptionsCheckConfig(state)
```

GraphicsOptions_CheckConfig

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L157)

<a id="function-function-mq3-client-ui-video-graphicsoptionsevent-function-graphicsoptionsevent-state-id-eventcode-config-retailactive-src-mq3-client-ui-video-ml-81497916"></a>
### graphicsOptionsEvent

```ml
function graphicsOptionsEvent(state, id, eventCode, config, retailActive)
```

GraphicsOptions_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L227)

<a id="function-function-mq3-client-ui-video-graphicsoptionsgetinitialvideo-function-graphicsoptionsgetinitialvideo-state-src-mq3-client-ui-video-ml-2007241281"></a>
### graphicsOptionsGetInitialVideo

```ml
function graphicsOptionsGetInitialVideo(state)
```

GraphicsOptions_GetInitialVideo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L147)

<a id="function-function-mq3-client-ui-video-graphicsoptionsmenudraw-function-graphicsoptionsmenudraw-state-retailactive-src-mq3-client-ui-video-ml-1577931960"></a>
### graphicsOptionsMenuDraw

```ml
function graphicsOptionsMenuDraw(state, retailActive)
```

GraphicsOptions_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L257)

<a id="function-function-mq3-client-ui-video-graphicsoptionsmenuinit-function-graphicsoptionsmenuinit-cvars-config-retailactive-src-mq3-client-ui-video-ml-1985436064"></a>
### graphicsOptionsMenuInit

```ml
function graphicsOptionsMenuInit(cvars, config, retailActive)
```

GraphicsOptions_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvars` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L334)

<a id="function-function-mq3-client-ui-video-graphicsoptionssetmenuitems-function-graphicsoptionssetmenuitems-state-cvars-src-mq3-client-ui-video-ml-259566898"></a>
### graphicsOptionsSetMenuItems

```ml
function graphicsOptionsSetMenuItems(state, cvars)
```

GraphicsOptions_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cvars` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L265)

<a id="function-function-mq3-client-ui-video-graphicsoptionstqevent-function-graphicsoptionstqevent-state-eventcode-src-mq3-client-ui-video-ml-51210260"></a>
### graphicsOptionsTQEvent

```ml
function graphicsOptionsTQEvent(state, eventCode)
```

GraphicsOptions_TQEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L250)

<a id="function-function-mq3-client-ui-video-graphicsoptionsupdatemenuitems-function-graphicsoptionsupdatemenuitems-state-src-mq3-client-ui-video-ml-103722293"></a>
### graphicsOptionsUpdateMenuItems

```ml
function graphicsOptionsUpdateMenuItems(state)
```

GraphicsOptions_UpdateMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L167)

<a id="function-function-mq3-client-ui-video-graphicsstate-function-graphicsstate-src-mq3-client-ui-video-ml-929715134"></a>
### graphicsState

```ml
function graphicsState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L59)

- [mq3.client.ui_video.GraphicsState](Type-mq3-client-ui-video-graphicsstate-1145696651.md) — struct
<a id="function-function-mq3-client-ui-video-host-function-host-actions-boundary-kind-name-text-number-retailactive-src-mq3-client-ui-video-ml-1896259887"></a>
### host

```ml
function host(actions, boundary, kind, name, text, number, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L33)

- [mq3.client.ui_video.HostAction](Type-mq3-client-ui-video-hostaction-695301095.md) — struct
<a id="constant-constant-mq3-client-ui-video-id-back2-const-id-back2-101-src-mq3-client-ui-video-ml-565232817"></a>
### ID_BACK2

```ml
const ID_BACK2 = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L10)

<a id="constant-constant-mq3-client-ui-video-id-display-const-id-display-107-src-mq3-client-ui-video-ml-1577763305"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 107
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L16)

<a id="constant-constant-mq3-client-ui-video-id-driverinfo-const-id-driverinfo-105-src-mq3-client-ui-video-ml-281997133"></a>
### ID_DRIVERINFO

```ml
const ID_DRIVERINFO = 105
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L14)

<a id="constant-constant-mq3-client-ui-video-id-driverinfoback-const-id-driverinfoback-100-src-mq3-client-ui-video-ml-1921021320"></a>
### ID_DRIVERINFOBACK

```ml
const ID_DRIVERINFOBACK = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L9)

<a id="constant-constant-mq3-client-ui-video-id-fullscreen-const-id-fullscreen-102-src-mq3-client-ui-video-ml-473446874"></a>
### ID_FULLSCREEN

```ml
const ID_FULLSCREEN = 102
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L11)

<a id="constant-constant-mq3-client-ui-video-id-graphics-const-id-graphics-106-src-mq3-client-ui-video-ml-985999898"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 106
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L15)

<a id="constant-constant-mq3-client-ui-video-id-list-const-id-list-103-src-mq3-client-ui-video-ml-588254255"></a>
### ID_LIST

```ml
const ID_LIST = 103
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L12)

<a id="constant-constant-mq3-client-ui-video-id-mode-const-id-mode-104-src-mq3-client-ui-video-ml-219250348"></a>
### ID_MODE

```ml
const ID_MODE = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L13)

<a id="constant-constant-mq3-client-ui-video-id-network-const-id-network-109-src-mq3-client-ui-video-ml-2059314911"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 109
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L18)

<a id="constant-constant-mq3-client-ui-video-id-sound-const-id-sound-108-src-mq3-client-ui-video-ml-779040932"></a>
### ID_SOUND

```ml
const ID_SOUND = 108
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L17)

<a id="function-function-mq3-client-ui-video-initial-function-initial-mode-fullscreen-tq-lighting-colordepth-texturebits-geometry-filter-driver-extensions-src-mq3-client-ui-video-ml-122464266"></a>
### initial

```ml
function initial(mode, fullscreen, tq, lighting, colorDepth, textureBits, geometry, filter, driver, extensions)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |
| `tq` | `dynamic` | — |  |
| `lighting` | `dynamic` | — |  |
| `colorDepth` | `dynamic` | — |  |
| `textureBits` | `dynamic` | — |  |
| `geometry` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `extensions` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L41)

- [mq3.client.ui_video.InitialVideo](Type-mq3-client-ui-video-initialvideo-247248992.md) — struct
<a id="function-function-mq3-client-ui-video-item-function-item-id-kind-name-x-y-active-hidden-grayed-src-mq3-client-ui-video-ml-1653476329"></a>
### item

```ml
function item(id, kind, name, x, y, active, hidden, grayed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `active` | `dynamic` | — |  |
| `hidden` | `dynamic` | — |  |
| `grayed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L37)

- [mq3.client.ui_video.Item](Type-mq3-client-ui-video-item-1259132532.md) — struct
<a id="constant-constant-mq3-client-ui-video-qm-activated-const-qm-activated-3-src-mq3-client-ui-video-ml-1554910316"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L8)

<a id="function-function-mq3-client-ui-video-sametemplate-function-sametemplate-state-value-src-mq3-client-ui-video-ml-1194248496"></a>
### sameTemplate

```ml
function sameTemplate(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L152)

<a id="function-function-mq3-client-ui-video-templates-function-templates-src-mq3-client-ui-video-ml-609096720"></a>
### templates

```ml
function templates()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L45)

<a id="function-function-mq3-client-ui-video-uidriverinfomenu-function-uidriverinfomenu-config-retailactive-src-mq3-client-ui-video-ml-1315601817"></a>
### uiDriverInfoMenu

```ml
function uiDriverInfoMenu(config, retailActive)
```

UI_DriverInfo_Menu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L129)

<a id="function-function-mq3-client-ui-video-uigraphicsoptionsmenu-function-uigraphicsoptionsmenu-cvars-config-retailactive-src-mq3-client-ui-video-ml-442802408"></a>
### uiGraphicsOptionsMenu

```ml
function uiGraphicsOptionsMenu(cvars, config, retailActive)
```

UI_GraphicsOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvars` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L348)

- [mq3.client.ui_video.VideoCvars](Type-mq3-client-ui-video-videocvars-2113014957.md) — struct
<a id="function-function-mq3-client-ui-video-words-function-words-text-limit-src-mq3-client-ui-video-ml-550680260"></a>
### words

```ml
function words(text, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L68)

<a id="function-function-mq3-client-ui-video-write-function-write-state-name-text-number-retailactive-src-mq3-client-ui-video-ml-456407039"></a>
### write

```ml
function write(state, name, text, number, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L177)
