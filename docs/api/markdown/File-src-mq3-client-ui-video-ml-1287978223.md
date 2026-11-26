# `src/mq3/client/ui_video.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_video`](Package-mq3-client-ui-video-1745348463.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-video-applytemplate-function-applytemplate-state-index-src-mq3-client-ui-video-ml-1049138101"></a>
### applyTemplate

```ml
function applyTemplate(state, index)
```

Updates `state.mode`, `state.tq`, `state.lighting`, `state.colorDepth` and additional values during UI video `applyTemplate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.mode`, `state.tq`, `state.lighting`, `state.colorDepth` and additional values. |
| `index` | `dynamic` | — | Value used by `value=templates()[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L491)

<a id="function-function-mq3-client-ui-video-booleannumber-function-booleannumber-value-src-mq3-client-ui-video-ml-1558435103"></a>
### booleanNumber

```ml
function booleanNumber(value)
```

Evaluates UI video `booleanNumber` and returns `1`, `0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L447)

- [mq3.client.ui_video.ChoiceList](Type-mq3-client-ui-video-choicelist-1812260872.md) — struct
<a id="function-function-mq3-client-ui-video-copyinitial-function-copyinitial-value-src-mq3-client-ui-video-ml-1216927423"></a>
### copyInitial

```ml
function copyInitial(value)
```

Adapts `mq3.client.ui_video.initial` to UI video `copyInitial`, returning its result for `value.mode, value.fullscreen, value.tq, value.lighting, value.colorDepth, value.textureBits, value.geometry, value.filter, value.driver, value.extensions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.mode`, `value.fullscreen`, `value.tq`, `value.lighting` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L284)

<a id="function-function-mq3-client-ui-video-draw-function-draw-state-text-x-y-alignment-retailactive-src-mq3-client-ui-video-ml-378653897"></a>
### draw

```ml
function draw(state, text, x, y, alignment, retailActive)
```

Updates `state.drawLines`, `state.actions` during UI video `draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.drawLines`, `state.actions`. |
| `text` | `dynamic` | — | Text consumed or emitted by `draw` in the UI video path. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `draw`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `draw`. |
| `alignment` | `dynamic` | — | Value used by `state.drawLines=state.drawLines+[DrawLine(text,x,y,alignment)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L336)

- [mq3.client.ui_video.DrawLine](Type-mq3-client-ui-video-drawline-655896091.md) — struct
<a id="function-function-mq3-client-ui-video-driverinfocache-function-driverinfocache-state-retailactive-src-mq3-client-ui-video-ml-962839168"></a>
### driverInfoCache

```ml
function driverInfoCache(state, retailActive)
```

DriverInfo_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.assets`, `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L371)

<a id="function-function-mq3-client-ui-video-driverinfoevent-function-driverinfoevent-state-eventcode-retailactive-src-mq3-client-ui-video-ml-297760049"></a>
### driverInfoEvent

```ml
function driverInfoEvent(state, eventCode, retailActive)
```

DriverInfo_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.actions`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L323)

<a id="function-function-mq3-client-ui-video-driverinfomenudraw-function-driverinfomenudraw-state-retailactive-src-mq3-client-ui-video-ml-824449996"></a>
### driverInfoMenuDraw

```ml
function driverInfoMenuDraw(state, retailActive)
```

DriverInfo_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L345)

- [mq3.client.ui_video.DriverInfoState](Type-mq3-client-ui-video-driverinfostate-600293082.md) — struct
<a id="function-function-mq3-client-ui-video-driverstate-function-driverstate-config-src-mq3-client-ui-video-ml-1664477902"></a>
### driverState

```ml
function driverState(config)
```

Creates a `mq3.client.ui_video.DriverInfoState` record. Assigns `config` from `config`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Value used to initialize `DriverInfoState.config`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L296)

- [mq3.client.ui_video.GlConfig](Type-mq3-client-ui-video-glconfig-65228990.md) — struct
<a id="constant-constant-mq3-client-ui-video-gldrv-icd-const-gldrv-icd-0-src-mq3-client-ui-video-ml-1283639161"></a>
### GLDRV_ICD

```ml
const GLDRV_ICD = 0
```

Renderer-driver category identifying a standard installable OpenGL driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L32)

<a id="constant-constant-mq3-client-ui-video-gldrv-voodoo-const-gldrv-voodoo-2-src-mq3-client-ui-video-ml-461396301"></a>
### GLDRV_VOODOO

```ml
const GLDRV_VOODOO = 2
```

Renderer-driver category identifying the legacy Voodoo driver path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L34)

<a id="constant-constant-mq3-client-ui-video-glhw-3dfx-2d3d-const-glhw-3dfx-2d3d-1-src-mq3-client-ui-video-ml-979199922"></a>
### GLHW_3DFX_2D3D

```ml
const GLHW_3DFX_2D3D = 1
```

Renderer-hardware category identifying the legacy 3Dfx 2D/3D hardware path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L36)

<a id="function-function-mq3-client-ui-video-graphicschoices-function-graphicschoices-src-mq3-client-ui-video-ml-1896448560"></a>
### graphicsChoices

```ml
function graphicsChoices()
```

Builds the UI video `graphicsChoices` sequence from `[ ChoiceList("Graphics Settings",["High Quality","Normal","Fast","Fastest","Custom"]), ChoiceList("GL Driver",["Default","Voodoo"]), ChoiceList("GL Extensions",["Off","On"]), ChoiceList("Video Mode...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L596)

<a id="function-function-mq3-client-ui-video-graphicsitems-function-graphicsitems-state-src-mq3-client-ui-video-ml-702251099"></a>
### graphicsItems

```ml
function graphicsItems(state)
```

Builds the UI video `graphicsItems` sequence from `[ item(0,"btext","SYSTEM SETUP",320,16,true,false,false), item(0,"bitmap","menu/art/frame2_l",0,78,false,false,false), item(0,"bitmap","menu/art/frame1_r",376,76,false,false,false), item(ID_GRAPHIC...`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.driverHidden`, `state.colorDepthGrayed`, `state.fullscreenGrayed`, `state.applyVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L569)

<a id="function-function-mq3-client-ui-video-graphicsoptionsapplychanges-function-graphicsoptionsapplychanges-state-eventcode-retailactive-src-mq3-client-ui-video-ml-410534257"></a>
### graphicsOptionsApplyChanges

```ml
function graphicsOptionsApplyChanges(state, eventCode, retailActive)
```

GraphicsOptions_ApplyChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.actions`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L456)

<a id="function-function-mq3-client-ui-video-graphicsoptionscache-function-graphicsoptionscache-state-retailactive-src-mq3-client-ui-video-ml-1455954976"></a>
### graphicsOptionsCache

```ml
function graphicsOptionsCache(state, retailActive)
```

GraphicsOptions_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.assets`, `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L614)

<a id="function-function-mq3-client-ui-video-graphicsoptionscheckconfig-function-graphicsoptionscheckconfig-state-src-mq3-client-ui-video-ml-822162865"></a>
### graphicsOptionsCheckConfig

```ml
function graphicsOptionsCheckConfig(state)
```

GraphicsOptions_CheckConfig

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.preset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L413)

<a id="function-function-mq3-client-ui-video-graphicsoptionsevent-function-graphicsoptionsevent-state-id-eventcode-config-retailactive-src-mq3-client-ui-video-ml-81497916"></a>
### graphicsOptionsEvent

```ml
function graphicsOptionsEvent(state, id, eventCode, config, retailActive)
```

GraphicsOptions_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.mode`, `state.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_MODE then`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `config` | `dynamic` | — | Record read through `config.vendor`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L503)

<a id="function-function-mq3-client-ui-video-graphicsoptionsgetinitialvideo-function-graphicsoptionsgetinitialvideo-state-src-mq3-client-ui-video-ml-2007241281"></a>
### graphicsOptionsGetInitialVideo

```ml
function graphicsOptionsGetInitialVideo(state)
```

GraphicsOptions_GetInitialVideo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.initial`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L399)

<a id="function-function-mq3-client-ui-video-graphicsoptionsmenudraw-function-graphicsoptionsmenudraw-state-retailactive-src-mq3-client-ui-video-ml-1577931960"></a>
### graphicsOptionsMenuDraw

```ml
function graphicsOptionsMenuDraw(state, retailActive)
```

GraphicsOptions_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.items`, `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L537)

<a id="function-function-mq3-client-ui-video-graphicsoptionsmenuinit-function-graphicsoptionsmenuinit-cvars-config-retailactive-src-mq3-client-ui-video-ml-1985436064"></a>
### graphicsOptionsMenuInit

```ml
function graphicsOptionsMenuInit(cvars, config, retailActive)
```

GraphicsOptions_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvars` | `dynamic` | — | Value used by `graphicsOptionsSetMenuItems(state,cvars)`. |
| `config` | `dynamic` | — | Record read through `config.driverType`, `config.hardwareType`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L624)

<a id="function-function-mq3-client-ui-video-graphicsoptionssetmenuitems-function-graphicsoptionssetmenuitems-state-cvars-src-mq3-client-ui-video-ml-259566898"></a>
### graphicsOptionsSetMenuItems

```ml
function graphicsOptionsSetMenuItems(state, cvars)
```

GraphicsOptions_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.mode`, `state.fullscreen`, `state.extensions`, `state.tq` and additional values. |
| `cvars` | `dynamic` | — | Record read through `cvars.mode`, `cvars.fullscreen`, `cvars.allowExtensions`, `cvars.picmip` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L547)

<a id="function-function-mq3-client-ui-video-graphicsoptionstqevent-function-graphicsoptionstqevent-state-eventcode-src-mq3-client-ui-video-ml-51210260"></a>
### graphicsOptionsTQEvent

```ml
function graphicsOptionsTQEvent(state, eventCode)
```

GraphicsOptions_TQEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.tq`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L528)

<a id="function-function-mq3-client-ui-video-graphicsoptionsupdatemenuitems-function-graphicsoptionsupdatemenuitems-state-src-mq3-client-ui-video-ml-103722293"></a>
### graphicsOptionsUpdateMenuItems

```ml
function graphicsOptionsUpdateMenuItems(state)
```

GraphicsOptions_UpdateMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.fullscreen`, `state.fullscreenGrayed`, `state.colorDepth`, `state.colorDepthGrayed` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L424)

<a id="function-function-mq3-client-ui-video-graphicsstate-function-graphicsstate-src-mq3-client-ui-video-ml-929715134"></a>
### graphicsState

```ml
function graphicsState()
```

Calls `mq3.client.ui_video.initial`, `mq3.client.ui_video.GraphicsState` from UI video `graphicsState`. The final path returns `GraphicsState(0,false,0,0,0,0,0,0,0,false,4,false,false,false,false,base,[],[],[],[])`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L289)

- [mq3.client.ui_video.GraphicsState](Type-mq3-client-ui-video-graphicsstate-1145696651.md) — struct
<a id="function-function-mq3-client-ui-video-host-function-host-actions-boundary-kind-name-text-number-retailactive-src-mq3-client-ui-video-ml-1896259887"></a>
### host

```ml
function host(actions, boundary, kind, name, text, number, retailActive)
```

Computes `actions+[HostAction(boundary,kind,name,text,number,not retailActive)]` for UI video `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | `dynamic` | — | Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI video resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `host` in the UI video path. |
| `number` | `dynamic` | — | Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L239)

- [mq3.client.ui_video.HostAction](Type-mq3-client-ui-video-hostaction-695301095.md) — struct
<a id="constant-constant-mq3-client-ui-video-id-back2-const-id-back2-101-src-mq3-client-ui-video-ml-565232817"></a>
### ID_BACK2

```ml
const ID_BACK2 = 101
```

Menu control identifier routed to the back2 action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L14)

<a id="constant-constant-mq3-client-ui-video-id-display-const-id-display-107-src-mq3-client-ui-video-ml-1577763305"></a>
### ID_DISPLAY

```ml
const ID_DISPLAY = 107
```

Menu control identifier routed to the display action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L26)

<a id="constant-constant-mq3-client-ui-video-id-driverinfo-const-id-driverinfo-105-src-mq3-client-ui-video-ml-281997133"></a>
### ID_DRIVERINFO

```ml
const ID_DRIVERINFO = 105
```

Menu control identifier routed to the driverinfo action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L22)

<a id="constant-constant-mq3-client-ui-video-id-driverinfoback-const-id-driverinfoback-100-src-mq3-client-ui-video-ml-1921021320"></a>
### ID_DRIVERINFOBACK

```ml
const ID_DRIVERINFOBACK = 100
```

Menu control identifier routed to the driverinfoback action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L12)

<a id="constant-constant-mq3-client-ui-video-id-fullscreen-const-id-fullscreen-102-src-mq3-client-ui-video-ml-473446874"></a>
### ID_FULLSCREEN

```ml
const ID_FULLSCREEN = 102
```

Menu control identifier routed to the fullscreen action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L16)

<a id="constant-constant-mq3-client-ui-video-id-graphics-const-id-graphics-106-src-mq3-client-ui-video-ml-985999898"></a>
### ID_GRAPHICS

```ml
const ID_GRAPHICS = 106
```

Menu control identifier routed to the graphics action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L24)

<a id="constant-constant-mq3-client-ui-video-id-list-const-id-list-103-src-mq3-client-ui-video-ml-588254255"></a>
### ID_LIST

```ml
const ID_LIST = 103
```

Menu control identifier routed to the list action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L18)

<a id="constant-constant-mq3-client-ui-video-id-mode-const-id-mode-104-src-mq3-client-ui-video-ml-219250348"></a>
### ID_MODE

```ml
const ID_MODE = 104
```

Menu control identifier routed to the mode action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L20)

<a id="constant-constant-mq3-client-ui-video-id-network-const-id-network-109-src-mq3-client-ui-video-ml-2059314911"></a>
### ID_NETWORK

```ml
const ID_NETWORK = 109
```

Menu control identifier routed to the network action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L30)

<a id="constant-constant-mq3-client-ui-video-id-sound-const-id-sound-108-src-mq3-client-ui-video-ml-779040932"></a>
### ID_SOUND

```ml
const ID_SOUND = 108
```

Menu control identifier routed to the sound action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L28)

<a id="function-function-mq3-client-ui-video-initial-function-initial-mode-fullscreen-tq-lighting-colordepth-texturebits-geometry-filter-driver-extensions-src-mq3-client-ui-video-ml-122464266"></a>
### initial

```ml
function initial(mode, fullscreen, tq, lighting, colorDepth, textureBits, geometry, filter, driver, extensions)
```

Creates a `mq3.client.ui_video.InitialVideo` record. Assigns `mode` from `mode`, `fullscreen` from `fullscreen`, `tq` from `tq`, `lighting` from `lighting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Value used to initialize `InitialVideo.mode`. |
| `fullscreen` | `dynamic` | — | Value used to initialize `InitialVideo.fullscreen`. |
| `tq` | `dynamic` | — | Value used to initialize `InitialVideo.tq`. |
| `lighting` | `dynamic` | — | Value used to initialize `InitialVideo.lighting`. |
| `colorDepth` | `dynamic` | — | Value used to initialize `InitialVideo.colorDepth`. |
| `textureBits` | `dynamic` | — | Value used to initialize `InitialVideo.textureBits`. |
| `geometry` | `dynamic` | — | Value used to initialize `InitialVideo.geometry`. |
| `filter` | `dynamic` | — | Value used to initialize `InitialVideo.filter`. |
| `driver` | `dynamic` | — | Value used to initialize `InitialVideo.driver`. |
| `extensions` | `dynamic` | — | Value used to initialize `InitialVideo.extensions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L267)

- [mq3.client.ui_video.InitialVideo](Type-mq3-client-ui-video-initialvideo-247248992.md) — struct
<a id="function-function-mq3-client-ui-video-item-function-item-id-kind-name-x-y-active-hidden-grayed-src-mq3-client-ui-video-ml-1653476329"></a>
### item

```ml
function item(id, kind, name, x, y, active, hidden, grayed)
```

Creates a `mq3.client.ui_video.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Item.id`. |
| `kind` | `dynamic` | — | Value used to initialize `Item.kind`. |
| `name` | `dynamic` | — | Value used to initialize `Item.name`. |
| `x` | `dynamic` | — | Value used to initialize `Item.x`. |
| `y` | `dynamic` | — | Value used to initialize `Item.y`. |
| `active` | `dynamic` | — | Value used to initialize `Item.active`. |
| `hidden` | `dynamic` | — | Value used to initialize `Item.hidden`. |
| `grayed` | `dynamic` | — | Value used to initialize `Item.grayed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L252)

- [mq3.client.ui_video.Item](Type-mq3-client-ui-video-item-1259132532.md) — struct
<a id="constant-constant-mq3-client-ui-video-qm-activated-const-qm-activated-3-src-mq3-client-ui-video-ml-1554910316"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the graphics-options and driver-information menus before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L10)

<a id="function-function-mq3-client-ui-video-sametemplate-function-sametemplate-state-value-src-mq3-client-ui-video-ml-1194248496"></a>
### sameTemplate

```ml
function sameTemplate(state, value)
```

Computes `value.colorDepth==state.colorDepth and value.driver==state.driver and value.mode==state.mode and value.fullscreen==state.fullscreen and value.tq==state.tq and value.lighting==state.lighting and val...` for UI video `sameTemplate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.colorDepth`, `state.driver`, `state.mode`, `state.fullscreen` and additional values. |
| `value` | `dynamic` | — | Record read through `value.colorDepth`, `value.driver`, `value.mode`, `value.fullscreen` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L407)

<a id="function-function-mq3-client-ui-video-templates-function-templates-src-mq3-client-ui-video-ml-609096720"></a>
### templates

```ml
function templates()
```

Builds the UI video `templates` sequence from `[ initial(4,true,2,0,2,2,1,1,0,true), initial(3,true,2,0,0,0,1,0,0,true), initial(2,true,1,0,1,0,0,0,0,true), initial(2,true,1,1,1,0,0,0,0,true), initial(3,true,1,0,0,0,1,0,0,true) ]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L272)

<a id="function-function-mq3-client-ui-video-uidriverinfomenu-function-uidriverinfomenu-config-retailactive-src-mq3-client-ui-video-ml-1315601817"></a>
### uiDriverInfoMenu

```ml
function uiDriverInfoMenu(config, retailActive)
```

UI_DriverInfo_Menu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Record read through `config.extensions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L380)

<a id="function-function-mq3-client-ui-video-uigraphicsoptionsmenu-function-uigraphicsoptionsmenu-cvars-config-retailactive-src-mq3-client-ui-video-ml-442802408"></a>
### uiGraphicsOptionsMenu

```ml
function uiGraphicsOptionsMenu(cvars, config, retailActive)
```

UI_GraphicsOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvars` | `dynamic` | — | Value used by `state=graphicsOptionsMenuInit(cvars,config,retailActive)`. |
| `config` | `dynamic` | — | Value used by `state=graphicsOptionsMenuInit(cvars,config,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L641)

- [mq3.client.ui_video.VideoCvars](Type-mq3-client-ui-video-videocvars-2113014957.md) — struct
<a id="function-function-mq3-client-ui-video-words-function-words-text-limit-src-mq3-client-ui-video-ml-550680260"></a>
### words

```ml
function words(text, limit)
```

Calls `decode`, `slice`, `std.string.substr` from UI video `words`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `words` in the UI video path. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L303)

<a id="function-function-mq3-client-ui-video-write-function-write-state-name-text-number-retailactive-src-mq3-client-ui-video-ml-456407039"></a>
### write

```ml
function write(state, name, text, number, retailActive)
```

Updates `state.actions` during UI video `write`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI video record/storage; this routine assigns `state.actions`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI video resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `write` in the UI video path. |
| `number` | `dynamic` | — | Value used by `state.actions=host(state.actions,"cvar","set",name,text,number,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L440)
