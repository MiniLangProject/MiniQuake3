# `src/mq3/client/ui_demos.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_demos`](Package-mq3-client-ui-demos-512048264.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_demos.Action](Type-mq3-client-ui-demos-action-1542264384.md) — struct
<a id="constant-constant-mq3-client-ui-demos-art-arrowleft-const-art-arrowleft-menu-art-arrows-horz-left-src-mq3-client-ui-demos-ml-1355383229"></a>
### ART_ARROWLEFT

```ml
const ART_ARROWLEFT = "menu/art/arrows_horz_left"
```

Virtual shader or image asset name used for the menu's arrowleft artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L43)

<a id="constant-constant-mq3-client-ui-demos-art-arrowright-const-art-arrowright-menu-art-arrows-horz-right-src-mq3-client-ui-demos-ml-774533664"></a>
### ART_ARROWRIGHT

```ml
const ART_ARROWRIGHT = "menu/art/arrows_horz_right"
```

Virtual shader or image asset name used for the menu's arrowright artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L45)

<a id="constant-constant-mq3-client-ui-demos-art-arrows-const-art-arrows-menu-art-arrows-horz-0-src-mq3-client-ui-demos-ml-1273557724"></a>
### ART_ARROWS

```ml
const ART_ARROWS = "menu/art/arrows_horz_0"
```

Virtual shader or image asset name used for the menu's arrows artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L41)

<a id="constant-constant-mq3-client-ui-demos-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-demos-ml-1872258463"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```

Virtual shader or image asset name used for the menu's back0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L29)

<a id="constant-constant-mq3-client-ui-demos-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-demos-ml-1399466396"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```

Virtual shader or image asset name used for the menu's back1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L31)

<a id="constant-constant-mq3-client-ui-demos-art-framel-const-art-framel-menu-art-frame2-l-src-mq3-client-ui-demos-ml-284514561"></a>
### ART_FRAMEL

```ml
const ART_FRAMEL = "menu/art/frame2_l"
```

Virtual shader or image asset name used for the menu's framel artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L37)

<a id="constant-constant-mq3-client-ui-demos-art-framer-const-art-framer-menu-art-frame1-r-src-mq3-client-ui-demos-ml-487277010"></a>
### ART_FRAMER

```ml
const ART_FRAMER = "menu/art/frame1_r"
```

Virtual shader or image asset name used for the menu's framer artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L39)

<a id="constant-constant-mq3-client-ui-demos-art-go0-const-art-go0-menu-art-play-0-src-mq3-client-ui-demos-ml-1604690614"></a>
### ART_GO0

```ml
const ART_GO0 = "menu/art/play_0"
```

Virtual shader or image asset name used for the menu's go0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L33)

<a id="constant-constant-mq3-client-ui-demos-art-go1-const-art-go1-menu-art-play-1-src-mq3-client-ui-demos-ml-1654014029"></a>
### ART_GO1

```ml
const ART_GO1 = "menu/art/play_1"
```

Virtual shader or image asset name used for the menu's go1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L35)

<a id="function-function-mq3-client-ui-demos-cache-function-cache-state-src-mq3-client-ui-demos-ml-958629693"></a>
### cache

```ml
function cache(state)
```

Demos_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI demos record/storage; this routine assigns `state.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L144)

<a id="function-function-mq3-client-ui-demos-comparenames-function-comparenames-left-right-src-mq3-client-ui-demos-ml-249557993"></a>
### compareNames

```ml
function compareNames(left, right)
```

Calls `std.string.toLowerAscii` from UI demos `compareNames`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value used by `a=bytes(strings.toLowerAscii(left))`. |
| `right` | `dynamic` | — | Value used by `b=bytes(strings.toLowerAscii(right))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L117)

<a id="function-function-mq3-client-ui-demos-create-function-create-retailactive-src-mq3-client-ui-demos-ml-1741462085"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_demos.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L106)

<a id="function-function-mq3-client-ui-demos-demosmenu-function-demosmenu-state-protocol-files-src-mq3-client-ui-demos-ml-316783322"></a>
### demosMenu

```ml
function demosMenu(state, protocol, files)
```

UI_DemosMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI demos record/storage; this routine assigns `state.pushed`, `state.menuEvents`. |
| `protocol` | `dynamic` | — | Value used by `menuInit(state,protocol,files)`. |
| `files` | `dynamic` | — | Value used by `menuInit(state,protocol,files)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L156)

<a id="function-function-mq3-client-ui-demos-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-demos-ml-79522204"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

Appends a UI demos action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI demos record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI demos resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI demos path. |
| `value` | `dynamic` | — | Value used by `item=Action("ui-demos",kind,name,text,value,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L113)

<a id="constant-constant-mq3-client-ui-demos-id-back-const-id-back-10-src-mq3-client-ui-demos-ml-441936002"></a>
### ID_BACK

```ml
const ID_BACK = 10
```

Event identifier of the Back control used to leave the demo-playback selection menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L13)

<a id="constant-constant-mq3-client-ui-demos-id-go-const-id-go-11-src-mq3-client-ui-demos-ml-351257655"></a>
### ID_GO

```ml
const ID_GO = 11
```

Menu control identifier routed to the go action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L15)

<a id="constant-constant-mq3-client-ui-demos-id-left-const-id-left-14-src-mq3-client-ui-demos-ml-172522742"></a>
### ID_LEFT

```ml
const ID_LEFT = 14
```

Menu control identifier routed to the left action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L21)

<a id="constant-constant-mq3-client-ui-demos-id-list-const-id-list-12-src-mq3-client-ui-demos-ml-1378945292"></a>
### ID_LIST

```ml
const ID_LIST = 12
```

Menu control identifier routed to the list action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L17)

<a id="constant-constant-mq3-client-ui-demos-id-right-const-id-right-13-src-mq3-client-ui-demos-ml-1138414407"></a>
### ID_RIGHT

```ml
const ID_RIGHT = 13
```

Menu control identifier routed to the right action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L19)

<a id="constant-constant-mq3-client-ui-demos-k-leftarrow-const-k-leftarrow-134-src-mq3-client-ui-demos-ml-1986278577"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```

Engine key code for the leftarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L23)

<a id="constant-constant-mq3-client-ui-demos-k-rightarrow-const-k-rightarrow-135-src-mq3-client-ui-demos-ml-1804976500"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```

Engine key code for the rightarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L25)

<a id="constant-constant-mq3-client-ui-demos-max-demos-const-max-demos-128-src-mq3-client-ui-demos-ml-592311058"></a>
### MAX_DEMOS

```ml
const MAX_DEMOS = 128
```

Capacity limit for the demos collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L27)

<a id="function-function-mq3-client-ui-demos-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-demos-ml-1614697278"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

Demos_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI demos record/storage; this routine assigns `state.menuEvents`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GO then if not state.goVisible or state.numDemos==0 then return false end if`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L135)

<a id="function-function-mq3-client-ui-demos-menuinit-function-menuinit-state-protocol-files-src-mq3-client-ui-demos-ml-269245748"></a>
### menuInit

```ml
function menuInit(state, protocol, files)
```

Demos_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI demos record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.protocol`, `state.extension` and additional values. |
| `protocol` | `dynamic` | — | Value assigned to `state.protocol`. |
| `files` | `dynamic` | — | Sequence read at `files[i]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L149)

<a id="function-function-mq3-client-ui-demos-menukey-function-menukey-state-key-src-mq3-client-ui-demos-ml-1429601236"></a>
### menuKey

```ml
function menuKey(state, key)
```

UI_DemosMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI demos state passed to the helper calls in `menuKey`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI demos entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L141)

<a id="function-function-mq3-client-ui-demos-normalize-function-normalize-name-src-mq3-client-ui-demos-ml-18181745"></a>
### normalize

```ml
function normalize(name)
```

Calls `std.string.equalsIgnoreCaseAscii`, `std.string.substr`, `std.string.toUpperAscii` from UI demos `normalize`. The final path returns `strings.toUpperAscii(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI demos resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L120)

<a id="constant-constant-mq3-client-ui-demos-qm-activated-const-qm-activated-3-src-mq3-client-ui-demos-ml-379800040"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the demo-playback selection menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L10)

<a id="function-function-mq3-client-ui-demos-scroll-function-scroll-state-key-src-mq3-client-ui-demos-ml-1739623048"></a>
### scroll

```ml
function scroll(state, key)
```

Updates `state.selected`, `state.top` during UI demos `scroll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI demos record/storage; this routine assigns `state.selected`, `state.top`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI demos entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L127)

<a id="function-function-mq3-client-ui-demos-sortnames-function-sortnames-values-src-mq3-client-ui-demos-ml-62056254"></a>
### sortNames

```ml
function sortNames(values)
```

Calls `mq3.client.ui_demos.compareNames` from UI demos `sortNames`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `remaining=values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L123)

- [mq3.client.ui_demos.State](Type-mq3-client-ui-demos-state-130805623.md) — struct
