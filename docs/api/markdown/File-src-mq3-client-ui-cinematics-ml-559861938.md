# `src/mq3/client/ui_cinematics.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_cinematics`](Package-mq3-client-ui-cinematics-1742576150.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_gameinfo.ml` as `game` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)

## Declarations

- [mq3.client.ui_cinematics.Action](Type-mq3-client-ui-cinematics-action-121786194.md) — struct
<a id="constant-constant-mq3-client-ui-cinematics-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-cinematics-ml-156503875"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```

Virtual shader or image asset name used for the menu's back0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L18)

<a id="constant-constant-mq3-client-ui-cinematics-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-cinematics-ml-265206294"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```

Virtual shader or image asset name used for the menu's back1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L20)

<a id="constant-constant-mq3-client-ui-cinematics-art-framel-const-art-framel-menu-art-frame2-l-src-mq3-client-ui-cinematics-ml-365301897"></a>
### ART_FRAMEL

```ml
const ART_FRAMEL = "menu/art/frame2_l"
```

Virtual shader or image asset name used for the menu's framel artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L22)

<a id="constant-constant-mq3-client-ui-cinematics-art-framer-const-art-framer-menu-art-frame1-r-src-mq3-client-ui-cinematics-ml-1512447104"></a>
### ART_FRAMER

```ml
const ART_FRAMER = "menu/art/frame1_r"
```

Virtual shader or image asset name used for the menu's framer artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L24)

<a id="function-function-mq3-client-ui-cinematics-backevent-function-backevent-state-event-src-mq3-client-ui-cinematics-ml-205193549"></a>
### backEvent

```ml
function backEvent(state, event)
```

UI_CinematicsMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cinematics record/storage; this routine assigns `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L95)

<a id="function-function-mq3-client-ui-cinematics-cache-function-cache-state-src-mq3-client-ui-cinematics-ml-1652009565"></a>
### cache

```ml
function cache(state)
```

UI_CinematicsMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cinematics record/storage; this routine assigns `state.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L105)

<a id="function-function-mq3-client-ui-cinematics-cinematicsmenu-function-cinematicsmenu-state-src-mq3-client-ui-cinematics-ml-869257725"></a>
### cinematicsMenu

```ml
function cinematicsMenu(state)
```

UI_CinematicsMenu / UI_CinematicsMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cinematics record/storage; this routine assigns `state.pushed`, `state.menuEvents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L113)

<a id="function-function-mq3-client-ui-cinematics-cinematicsmenuf-function-cinematicsmenuf-state-index-src-mq3-client-ui-cinematics-ml-342854849"></a>
### cinematicsMenuF

```ml
function cinematicsMenuF(state, index)
```

Updates `state.cursor`, `state.menuEvents` during UI cinematics `cinematicsMenuF`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cinematics record/storage; this routine assigns `state.cursor`, `state.menuEvents`. |
| `index` | `dynamic` | — | Value assigned to `state.cursor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L117)

<a id="function-function-mq3-client-ui-cinematics-create-function-create-data-demoversion-retailactive-src-mq3-client-ui-cinematics-ml-1558847890"></a>
### create

```ml
function create(data, demoVersion, retailActive)
```

Creates a `mq3.client.ui_cinematics.State` record. Assigns `data` from `data`, `demoVersion` from `demoVersion`, `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used to initialize `State.data`. |
| `demoVersion` | `dynamic` | — | Value used to initialize `State.demoVersion`. |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L84)

<a id="function-function-mq3-client-ui-cinematics-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-cinematics-ml-844257530"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

Appends a UI cinematics action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cinematics record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI cinematics resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI cinematics path. |
| `value` | `dynamic` | — | Value used by `item=Action("ui-cinematics",kind,name,text,value,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L91)

<a id="constant-constant-mq3-client-ui-cinematics-id-back-const-id-back-10-src-mq3-client-ui-cinematics-ml-1814383444"></a>
### ID_BACK

```ml
const ID_BACK = 10
```

Native Back-control identifier exposed by the cinematics chooser for leaving cinematic selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L12)

<a id="constant-constant-mq3-client-ui-cinematics-id-cin-end-const-id-cin-end-20-src-mq3-client-ui-cinematics-ml-1297285553"></a>
### ID_CIN_END

```ml
const ID_CIN_END = 20
```

Menu control identifier routed to the cin end action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L16)

<a id="constant-constant-mq3-client-ui-cinematics-id-cin-idlogo-const-id-cin-idlogo-11-src-mq3-client-ui-cinematics-ml-113619923"></a>
### ID_CIN_IDLOGO

```ml
const ID_CIN_IDLOGO = 11
```

Menu control identifier routed to the cin idlogo action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L14)

<a id="function-function-mq3-client-ui-cinematics-init-function-init-state-src-mq3-client-ui-cinematics-ml-365588285"></a>
### init

```ml
function init(state)
```

UI_CinematicsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI cinematics record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.enabled`, `state.enabled[0]` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L108)

<a id="function-function-mq3-client-ui-cinematics-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-cinematics-ml-1875642280"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

UI_CinematicsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.names`, `state.demoVersion`. |
| `id` | `dynamic` | — | Value used by `n=id-ID_CIN_IDLOGO`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L100)

<a id="constant-constant-mq3-client-ui-cinematics-qm-activated-const-qm-activated-3-src-mq3-client-ui-cinematics-ml-1678810118"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the cinematics selection menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L10)

- [mq3.client.ui_cinematics.State](Type-mq3-client-ui-cinematics-state-481223309.md) — struct
