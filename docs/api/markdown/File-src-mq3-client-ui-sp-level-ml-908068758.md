# `src/mq3/client/ui_sp_level.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_sp_level`](Package-mq3-client-ui-sp-level-737887030.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_gameinfo.ml` as `game` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_sp_level.Action](Type-mq3-client-ui-sp-level-action-261680434.md) — struct
<a id="constant-constant-mq3-client-ui-sp-level-arenas-per-tier-const-arenas-per-tier-4-src-mq3-client-ui-sp-level-ml-1841924433"></a>
### ARENAS_PER_TIER

```ml
const ARENAS_PER_TIER = 4
```

Number of arenas grouped into one single-player progression tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L14)

<a id="constant-constant-mq3-client-ui-sp-level-art-arrow-const-art-arrow-menu-art-narrow-0-src-mq3-client-ui-sp-level-ml-1661724127"></a>
### ART_ARROW

```ml
const ART_ARROW = "menu/art/narrow_0"
```

Virtual shader or image asset name used for the menu's arrow artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L46)

<a id="constant-constant-mq3-client-ui-sp-level-art-arrow-focus-const-art-arrow-focus-menu-art-narrow-1-src-mq3-client-ui-sp-level-ml-259201082"></a>
### ART_ARROW_FOCUS

```ml
const ART_ARROW_FOCUS = "menu/art/narrow_1"
```

Virtual shader or image asset name used for the menu's arrow focus artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L48)

<a id="constant-constant-mq3-client-ui-sp-level-art-levelframe-focus-const-art-levelframe-focus-menu-art-maps-select-src-mq3-client-ui-sp-level-ml-737753025"></a>
### ART_LEVELFRAME_FOCUS

```ml
const ART_LEVELFRAME_FOCUS = "menu/art/maps_select"
```

Virtual shader or image asset name used for the menu's levelframe focus artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L42)

<a id="constant-constant-mq3-client-ui-sp-level-art-levelframe-selected-const-art-levelframe-selected-menu-art-maps-selected-src-mq3-client-ui-sp-level-ml-525411804"></a>
### ART_LEVELFRAME_SELECTED

```ml
const ART_LEVELFRAME_SELECTED = "menu/art/maps_selected"
```

Virtual shader or image asset name used for the menu's levelframe selected artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L44)

<a id="constant-constant-mq3-client-ui-sp-level-art-map-unknown-const-art-map-unknown-menu-art-unknownmap-src-mq3-client-ui-sp-level-ml-59929891"></a>
### ART_MAP_UNKNOWN

```ml
const ART_MAP_UNKNOWN = "menu/art/unknownmap"
```

Virtual shader or image asset name used for the menu's map unknown artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L50)

<a id="constant-constant-mq3-client-ui-sp-level-award-frags-const-award-frags-4-src-mq3-client-ui-sp-level-ml-464162581"></a>
### AWARD_FRAGS

```ml
const AWARD_FRAGS = 4
```

Postgame award identifier selecting the frags award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L40)

<a id="function-function-mq3-client-ui-sp-level-awardevent-function-awardevent-state-id-event-src-mq3-client-ui-sp-level-ml-131002642"></a>
### awardEvent

```ml
function awardEvent(state, id, event)
```

Calls `mq3.client.ui_sp_level.emit` from UI sp level `awardEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.awardSounds`. |
| `id` | `dynamic` | — | Value used by `n=id-ID_AWARD1`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L332)

<a id="function-function-mq3-client-ui-sp-level-awardlabel-function-awardlabel-value-src-mq3-client-ui-sp-level-ml-2118943889"></a>
### awardLabel

```ml
function awardLabel(value)
```

Calls `mq3.compat.numeric.trunc32` from UI sp level `awardLabel`. The final path returns `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>=1000000`, `value>=1000` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L348)

<a id="function-function-mq3-client-ui-sp-level-awardpics-function-awardpics-src-mq3-client-ui-sp-level-ml-984955578"></a>
### awardPics

```ml
function awardPics()
```

Lists the 6 UI sp level award pics strings in their declared order, beginning with `"menu/medals/medal_accuracy"`, `"menu/medals/medal_impressive"`, `"menu/medals/medal_excellent"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L225)

<a id="function-function-mq3-client-ui-sp-level-awardsounds-function-awardsounds-src-mq3-client-ui-sp-level-ml-54110140"></a>
### awardSounds

```ml
function awardSounds()
```

Lists the 6 UI sp level award sounds strings in their declared order, beginning with `"sound/feedback/accuracy.wav"`, `"sound/feedback/impressive_a.wav"`, `"sound/feedback/excellent_a.wav"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L227)

<a id="function-function-mq3-client-ui-sp-level-backevent-function-backevent-state-event-src-mq3-client-ui-sp-level-ml-1377727069"></a>
### backEvent

```ml
function backEvent(state, event)
```

Updates `state.selectedArena`, `state.menuEvents` during UI sp level `backEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L340)

- [mq3.client.ui_sp_level.Bot](Type-mq3-client-ui-sp-level-bot-1403174101.md) — struct
<a id="function-function-mq3-client-ui-sp-level-cache-function-cache-state-src-mq3-client-ui-sp-level-ml-1367529421"></a>
### cache

```ml
function cache(state)
```

UI_SPLevelMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.cacheAssets`, `state.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L364)

<a id="function-function-mq3-client-ui-sp-level-clean-function-clean-value-src-mq3-client-ui-sp-level-ml-1727426071"></a>
### clean

```ml
function clean(value)
```

Evaluates UI sp level `clean` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[at]`, `value[at+1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L241)

<a id="function-function-mq3-client-ui-sp-level-clearextramaps-function-clearextramaps-state-first-src-mq3-client-ui-sp-level-ml-554668653"></a>
### clearExtraMaps

```ml
function clearExtraMaps(state, first)
```

Updates `state.maps[i].active`, `state.maps[i].picture` during UI sp level `clearExtraMaps`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.maps[i].active`, `state.maps[i].picture`. |
| `first` | `dynamic` | — | Value used by `for i=first to 3 state.maps[i].active=false`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L282)

<a id="function-function-mq3-client-ui-sp-level-create-function-create-data-retailactive-src-mq3-client-ui-sp-level-ml-2043988541"></a>
### create

```ml
function create(data, retailActive)
```

Creates a `mq3.client.ui_sp_level.State` record. Assigns `data` from `data`, `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used to initialize `State.data`. |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L201)

<a id="function-function-mq3-client-ui-sp-level-customevent-function-customevent-state-event-src-mq3-client-ui-sp-level-ml-1265299105"></a>
### customEvent

```ml
function customEvent(state, event)
```

Updates `state.menuEvents` during UI sp level `customEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L344)

<a id="function-function-mq3-client-ui-sp-level-cvar-function-cvar-state-name-src-mq3-client-ui-sp-level-ml-315438280"></a>
### cvar

```ml
function cvar(state, name)
```

Calls `mq3.client.ui_gameinfo.cvar` from UI sp level `cvar`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.data`, `state.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI sp level resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L218)

<a id="function-function-mq3-client-ui-sp-level-emit-function-emit-state-kind-x-y-w-h-text-asset-value-src-mq3-client-ui-sp-level-ml-1016245765"></a>
### emit

```ml
function emit(state, kind, x, y, w, h, text, asset, value)
```

Appends a UI sp level action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `emit`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `emit`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI sp level path. |
| `asset` | `dynamic` | — | Value used by `a=Action("ui-sp-level",kind,x,y,w,h,text,asset,value,dispatched)`. |
| `value` | `dynamic` | — | Value used by `a=Action("ui-sp-level",kind,x,y,w,h,text,asset,value,dispatched)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L214)

<a id="function-function-mq3-client-ui-sp-level-emptymap-function-emptymap-x-src-mq3-client-ui-sp-level-ml-1994698946"></a>
### emptyMap

```ml
function emptyMap(x)
```

Creates a `mq3.client.ui_sp_level.MapSlot` record. Assigns `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `MapSlot.x`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L197)

<a id="function-function-mq3-client-ui-sp-level-hasasset-function-hasasset-assets-name-src-mq3-client-ui-sp-level-ml-558885080"></a>
### hasAsset

```ml
function hasAsset(assets, name)
```

Calls `mq3.client.ui_sp_level.same`, `std.string.substr` from UI sp level `hasAsset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — | Value used by `if assets==void then return true end if`. |
| `name` | `dynamic` | — | Name whose length/content is inspected by `hasAsset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L235)

<a id="constant-constant-mq3-client-ui-sp-level-id-award1-const-id-award1-17-src-mq3-client-ui-sp-level-ml-550600285"></a>
### ID_AWARD1

```ml
const ID_AWARD1 = 17
```

Menu control identifier routed to the award1 action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L27)

<a id="constant-constant-mq3-client-ui-sp-level-id-back-const-id-back-23-src-mq3-client-ui-sp-level-ml-33010142"></a>
### ID_BACK

```ml
const ID_BACK = 23
```

Native Back-control identifier exposed by single-player arena selection for returning to the previous menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L30)

<a id="constant-constant-mq3-client-ui-sp-level-id-custom-const-id-custom-25-src-mq3-client-ui-sp-level-ml-1774147680"></a>
### ID_CUSTOM

```ml
const ID_CUSTOM = 25
```

Menu control identifier routed to the custom action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L34)

<a id="constant-constant-mq3-client-ui-sp-level-id-leftarrow-const-id-leftarrow-10-src-mq3-client-ui-sp-level-ml-2112009406"></a>
### ID_LEFTARROW

```ml
const ID_LEFTARROW = 10
```

Menu control identifier routed to the leftarrow action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L19)

<a id="constant-constant-mq3-client-ui-sp-level-id-next-const-id-next-26-src-mq3-client-ui-sp-level-ml-2088960865"></a>
### ID_NEXT

```ml
const ID_NEXT = 26
```

Menu control identifier routed to the next action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L36)

<a id="constant-constant-mq3-client-ui-sp-level-id-picture0-const-id-picture0-11-src-mq3-client-ui-sp-level-ml-129419891"></a>
### ID_PICTURE0

```ml
const ID_PICTURE0 = 11
```

Menu control identifier routed to the picture0 action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L21)

<a id="constant-constant-mq3-client-ui-sp-level-id-playerpic-const-id-playerpic-16-src-mq3-client-ui-sp-level-ml-1709332074"></a>
### ID_PLAYERPIC

```ml
const ID_PLAYERPIC = 16
```

Menu control identifier routed to the playerpic action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L25)

<a id="constant-constant-mq3-client-ui-sp-level-id-reset-const-id-reset-24-src-mq3-client-ui-sp-level-ml-738909543"></a>
### ID_RESET

```ml
const ID_RESET = 24
```

Menu control identifier routed to the reset action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L32)

<a id="constant-constant-mq3-client-ui-sp-level-id-rightarrow-const-id-rightarrow-15-src-mq3-client-ui-sp-level-ml-927171727"></a>
### ID_RIGHTARROW

```ml
const ID_RIGHTARROW = 15
```

Menu control identifier routed to the rightarrow action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L23)

<a id="function-function-mq3-client-ui-sp-level-init-function-init-state-availableassets-src-mq3-client-ui-sp-level-ml-100571805"></a>
### init

```ml
function init(state, availableAssets)
```

UI_SPLevelMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.actions`, `state.maps`, `state.bots`, `state.reinit` and additional values. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L374)

<a id="constant-constant-mq3-client-ui-sp-level-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-sp-level-ml-1055550115"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when returning keyboard focus to single-player arena selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L38)

<a id="function-function-mq3-client-ui-sp-level-leftarrowevent-function-leftarrowevent-state-event-availableassets-src-mq3-client-ui-sp-level-ml-1648675047"></a>
### leftArrowEvent

```ml
function leftArrowEvent(state, event, availableAssets)
```

Updates `state.selectedArenaSet` during UI sp level `leftArrowEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.selectedArenaSet`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L318)

<a id="function-function-mq3-client-ui-sp-level-levelevent-function-levelevent-state-id-event-availableassets-src-mq3-client-ui-sp-level-ml-1804590708"></a>
### levelEvent

```ml
function levelEvent(state, id, event, availableAssets)
```

Updates `state.selectedArena`, `state.selectedArenaInfo` during UI sp level `levelEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.selectedArenaInfo`. |
| `id` | `dynamic` | — | Value assigned to `state.selectedArena`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L313)

- [mq3.client.ui_sp_level.MapSlot](Type-mq3-client-ui-sp-level-mapslot-1382136698.md) — struct
<a id="function-function-mq3-client-ui-sp-level-menudraw-function-menudraw-state-availableassets-src-mq3-client-ui-sp-level-ml-1952641081"></a>
### menuDraw

```ml
function menuDraw(state, availableAssets)
```

UI_SPLevelMenu_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.menuEvents`, `state.reinit`, `state.playerName`, `state.playerModel` and additional values. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L352)

<a id="function-function-mq3-client-ui-sp-level-nextevent-function-nextevent-state-event-src-mq3-client-ui-sp-level-ml-777683361"></a>
### nextEvent

```ml
function nextEvent(state, event)
```

Updates `state.selectedArena`, `state.menuEvents` during UI sp level `nextEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L336)

<a id="function-function-mq3-client-ui-sp-level-playerevent-function-playerevent-state-event-src-mq3-client-ui-sp-level-ml-1522886277"></a>
### playerEvent

```ml
function playerEvent(state, event)
```

Updates `state.menuEvents` during UI sp level `playerEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L327)

<a id="function-function-mq3-client-ui-sp-level-playericon-function-playericon-modelandskin-availableassets-src-mq3-client-ui-sp-level-ml-764613899"></a>
### playerIcon

```ml
function playerIcon(modelAndSkin, availableAssets)
```

PlayerIcon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAndSkin` | `dynamic` | — | Sequence whose length/content is inspected by `playerIcon`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L250)

<a id="function-function-mq3-client-ui-sp-level-playericonhandle-function-playericonhandle-state-modelandskin-availableassets-src-mq3-client-ui-sp-level-ml-697571634"></a>
### playerIconHandle

```ml
function playerIconHandle(state, modelAndSkin, availableAssets)
```

PlayerIconHandle is a typed registration boundary in the native host.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI sp level state passed to the helper calls in `playerIconHandle`. |
| `modelAndSkin` | `dynamic` | — | Value used by `name=playerIcon(modelAndSkin,availableAssets)`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L258)

<a id="constant-constant-mq3-client-ui-sp-level-qm-activated-const-qm-activated-3-src-mq3-client-ui-sp-level-ml-1663732618"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the single-player arena selection menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L17)

<a id="function-function-mq3-client-ui-sp-level-reinit-function-reinit-state-src-mq3-client-ui-sp-level-ml-1476878349"></a>
### reInit

```ml
function reInit(state)
```

Updates `state.reinit` during UI sp level `reInit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.reinit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L392)

<a id="function-function-mq3-client-ui-sp-level-resetaction-function-resetaction-state-result-availableassets-src-mq3-client-ui-sp-level-ml-846204042"></a>
### resetAction

```ml
function resetAction(state, result, availableAssets)
```

Updates `state.menuEvents` during UI sp level `resetAction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.menuEvents`. |
| `result` | `dynamic` | — | Value used by `if not result then return false end if`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L302)

<a id="function-function-mq3-client-ui-sp-level-resetdraw-function-resetdraw-state-src-mq3-client-ui-sp-level-ml-955323507"></a>
### resetDraw

```ml
function resetDraw(state)
```

Calls `mq3.client.ui_sp_level.emit` from UI sp level `resetDraw`. The final path returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI sp level state passed to the helper calls in `resetDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L297)

<a id="function-function-mq3-client-ui-sp-level-resetevent-function-resetevent-state-event-availableassets-src-mq3-client-ui-sp-level-ml-2124373691"></a>
### resetEvent

```ml
function resetEvent(state, event, availableAssets)
```

Updates `state.menuEvents` during UI sp level `resetEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `availableAssets` | `dynamic` | — | Accepted for compatibility with `resetEvent`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L307)

<a id="function-function-mq3-client-ui-sp-level-rightarrowevent-function-rightarrowevent-state-event-availableassets-src-mq3-client-ui-sp-level-ml-2037053609"></a>
### rightArrowEvent

```ml
function rightArrowEvent(state, event, availableAssets)
```

Updates `state.selectedArenaSet` during UI sp level `rightArrowEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.selectedArenaSet`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L323)

<a id="function-function-mq3-client-ui-sp-level-same-function-same-a-b-src-mq3-client-ui-sp-level-ml-1294672427"></a>
### same

```ml
function same(a, b)
```

Compares two UI sp level names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `b` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L231)

<a id="function-function-mq3-client-ui-sp-level-setbots-function-setbots-state-availableassets-src-mq3-client-ui-sp-level-ml-1365569181"></a>
### setBots

```ml
function setBots(state, availableAssets)
```

UI_SPLevelMenu_SetBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.bots`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L263)

<a id="function-function-mq3-client-ui-sp-level-setcvar-function-setcvar-state-name-value-src-mq3-client-ui-sp-level-ml-1560788963"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

Updates `state.cvars` during UI sp level `setCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI sp level resource. |
| `value` | `dynamic` | — | Value used by `state.cvars=next+[[name,str(value)]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L223)

<a id="function-function-mq3-client-ui-sp-level-setmenuarena-function-setmenuarena-state-n-level-arenainfo-availableassets-src-mq3-client-ui-sp-level-ml-1416502772"></a>
### setMenuArena

```ml
function setMenuArena(state, n, level, arenaInfo, availableAssets)
```

UI_SPLevelMenu_SetMenuArena

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.data`, `state.maps`, `state.selectedArenaSet`, `state.currentSet`. |
| `n` | `dynamic` | — | Value used by `slot=state.maps[n]`. |
| `level` | `dynamic` | — | Value used by `best=game.UI_GetBestScore(state.data,level)`. |
| `arenaInfo` | `dynamic` | — | Value used by `map=info.value(arenaInfo,"map")`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L275)

<a id="function-function-mq3-client-ui-sp-level-setmenuitems-function-setmenuitems-state-availableassets-src-mq3-client-ui-sp-level-ml-383351409"></a>
### setMenuItems

```ml
function setMenuItems(state, availableAssets)
```

UI_SPLevelMenu_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.maps[0].x`, `state.selectedArenaInfo`, `state.numMaps`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L286)

<a id="function-function-mq3-client-ui-sp-level-splevelmenu-function-splevelmenu-state-availableassets-src-mq3-client-ui-sp-level-ml-1249272329"></a>
### spLevelMenu

```ml
function spLevelMenu(state, availableAssets)
```

UI_SPLevelMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.trainingTier`, `state.minTier`, `state.finalTier`, `state.maxTier` and additional values. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L382)

<a id="function-function-mq3-client-ui-sp-level-splevelmenuf-function-splevelmenuf-state-availableassets-src-mq3-client-ui-sp-level-ml-1454927349"></a>
### spLevelMenuF

```ml
function spLevelMenuF(state, availableAssets)
```

Updates `state.keyCatcher`, `state.menuEvents` during UI sp level `spLevelMenuF`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI sp level record/storage; this routine assigns `state.keyCatcher`, `state.menuEvents`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L389)

- [mq3.client.ui_sp_level.State](Type-mq3-client-ui-sp-level-state-1066399981.md) — struct
<a id="function-function-mq3-client-ui-sp-level-truncate-function-truncate-value-count-src-mq3-client-ui-sp-level-ml-2059307966"></a>
### truncate

```ml
function truncate(value, count)
```

Calls `std.string.substr` from UI sp level `truncate`. The final path returns `strings.substr(value,0,count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `truncate`. |
| `count` | `dynamic` | — | Value tested by `len(value)<=count` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L245)
