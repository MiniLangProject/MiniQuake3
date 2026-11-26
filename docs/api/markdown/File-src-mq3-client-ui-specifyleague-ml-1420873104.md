# `src/mq3/client/ui_specifyleague.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_specifyleague`](Package-mq3-client-ui-specifyleague-581610270.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `q` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_specifyleague.Action](Type-mq3-client-ui-specifyleague-action-1198749578.md) — struct
<a id="function-function-mq3-client-ui-specifyleague-artlist-function-artlist-src-mq3-client-ui-specifyleague-ml-1304273818"></a>
### artList

```ml
function artList()
```

Lists the 9 UI specifyleague art list strings in their declared order, beginning with `"menu/art/frame2_l"`, `"menu/art/frame1_r"`, `"menu/art/arrows_vert_0"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L16)

<a id="function-function-mq3-client-ui-specifyleague-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-specifyleague-ml-1849083367"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

Calls `mq3.client.ui_qmenu.item` from UI specifyleague `bitmap`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI specifyleague resource. |
| `id` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `bitmap`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `bitmap`. |
| `flags` | `dynamic` | — | Value used by `item=q.item(q.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `w` | `dynamic` | — | Value assigned to `item.width`. |
| `h` | `dynamic` | — | Value assigned to `item.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L62)

<a id="function-function-mq3-client-ui-specifyleague-create-function-create-retailactive-src-mq3-client-ui-specifyleague-ml-1637403769"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_specifyleague.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L23)

<a id="function-function-mq3-client-ui-specifyleague-emit-function-emit-state-boundary-kind-name-text-number-src-mq3-client-ui-specifyleague-ml-197564684"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, number)
```

Appends a UI specifyleague action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI specifyleague record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI specifyleague resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI specifyleague path. |
| `number` | `dynamic` | — | Value used by `a=Action(boundary,kind,name,text,number,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L31)

<a id="constant-constant-mq3-client-ui-specifyleague-id-specifyleagueback-const-id-specifyleagueback-104-src-mq3-client-ui-specifyleague-ml-876619992"></a>
### ID_SPECIFYLEAGUEBACK

```ml
const ID_SPECIFYLEAGUEBACK = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L14)

<a id="constant-constant-mq3-client-ui-specifyleague-id-specifyleaguedown-const-id-specifyleaguedown-103-src-mq3-client-ui-specifyleague-ml-2119547457"></a>
### ID_SPECIFYLEAGUEDOWN

```ml
const ID_SPECIFYLEAGUEDOWN = 103
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L13)

<a id="constant-constant-mq3-client-ui-specifyleague-id-specifyleaguelist-const-id-specifyleaguelist-101-src-mq3-client-ui-specifyleague-ml-1924556927"></a>
### ID_SPECIFYLEAGUELIST

```ml
const ID_SPECIFYLEAGUELIST = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L11)

<a id="constant-constant-mq3-client-ui-specifyleague-id-specifyleaguename-const-id-specifyleaguename-100-src-mq3-client-ui-specifyleague-ml-96468324"></a>
### ID_SPECIFYLEAGUENAME

```ml
const ID_SPECIFYLEAGUENAME = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L10)

<a id="constant-constant-mq3-client-ui-specifyleague-id-specifyleagueup-const-id-specifyleagueup-102-src-mq3-client-ui-specifyleague-ml-588737870"></a>
### ID_SPECIFYLEAGUEUP

```ml
const ID_SPECIFYLEAGUEUP = 102
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L12)

<a id="constant-constant-mq3-client-ui-specifyleague-max-leaguename-const-max-leaguename-80-src-mq3-client-ui-specifyleague-ml-766806953"></a>
### MAX_LEAGUENAME

```ml
const MAX_LEAGUENAME = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L9)

<a id="constant-constant-mq3-client-ui-specifyleague-max-listboxitems-const-max-listboxitems-128-src-mq3-client-ui-specifyleague-ml-1004189256"></a>
### MAX_LISTBOXITEMS

```ml
const MAX_LISTBOXITEMS = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L7)

<a id="constant-constant-mq3-client-ui-specifyleague-max-listboxwidth-const-max-listboxwidth-40-src-mq3-client-ui-specifyleague-ml-707563823"></a>
### MAX_LISTBOXWIDTH

```ml
const MAX_LISTBOXWIDTH = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L8)

<a id="function-function-mq3-client-ui-specifyleague-prefixsame-function-prefixsame-old-newtext-src-mq3-client-ui-specifyleague-ml-701582822"></a>
### prefixSame

```ml
function prefixSame(old, newText)
```

Calls `std.string.substr` from UI specifyleague `prefixSame`. The final path returns `strings.substr(old,0,len(newText))==newText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `old` | `dynamic` | — | Sequence whose length/content is inspected by `prefixSame`. |
| `newText` | `dynamic` | — | Sequence whose length/content is inspected by `prefixSame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L45)

<a id="function-function-mq3-client-ui-specifyleague-specifyleague-cache-function-specifyleague-cache-state-src-mq3-client-ui-specifyleague-ml-58601455"></a>
### SpecifyLeague_Cache

```ml
function SpecifyLeague_Cache(state)
```

SpecifyLeague_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI specifyleague state passed to the helper calls in `SpecifyLeague_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L65)

<a id="function-function-mq3-client-ui-specifyleague-specifyleague-event-function-specifyleague-event-state-id-event-leagues-src-mq3-client-ui-specifyleague-ml-986423788"></a>
### SpecifyLeague_Event

```ml
function SpecifyLeague_Event(state, id, event, leagues)
```

SpecifyLeague_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI specifyleague record/storage; this routine assigns `state.selected`, `state.popped`, `state.menu.popped`. |
| `id` | `dynamic` | — | Value used by `if id==ID_SPECIFYLEAGUELIST then return event==q.QM_GOTFOCUS end if`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `leagues` | `dynamic` | — | Value used by `if id==ID_SPECIFYLEAGUENAME and event==q.QM_LOSTFOCUS and not prefixSame(state.playername,state.rankname.buffer) then SpecifyLeague_GetList(st...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L51)

<a id="function-function-mq3-client-ui-specifyleague-specifyleague-getlist-function-specifyleague-getlist-state-leagues-src-mq3-client-ui-specifyleague-ml-1464876907"></a>
### SpecifyLeague_GetList

```ml
function SpecifyLeague_GetList(state, leagues)
```

SpecifyLeague_GetList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI specifyleague record/storage; this routine assigns `state.playername`, `state.leagueNames`, `state.displayNames`, `state.list.itemnames` and additional values. |
| `leagues` | `dynamic` | — | Sequence read at `leagues[i]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L39)

<a id="function-function-mq3-client-ui-specifyleague-specifyleague-menuinit-function-specifyleague-menuinit-state-playername-leagues-src-mq3-client-ui-specifyleague-ml-641370087"></a>
### SpecifyLeague_MenuInit

```ml
function SpecifyLeague_MenuInit(state, playerName, leagues)
```

SpecifyLeague_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI specifyleague record/storage; this routine assigns `state.menu`, `state.actions`, `state.banner`, `state.banner.string` and additional values. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `leagues` | `dynamic` | — | Value used by `SpecifyLeague_GetList(state,leagues)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L70)

- [mq3.client.ui_specifyleague.State](Type-mq3-client-ui-specifyleague-state-1121640709.md) — struct
<a id="function-function-mq3-client-ui-specifyleague-truncate-function-truncate-text-max-src-mq3-client-ui-specifyleague-ml-1495816711"></a>
### truncate

```ml
function truncate(text, max)
```

Calls `decode`, `slice` from UI specifyleague `truncate`. The final path returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `truncate` in the UI specifyleague path. |
| `max` | `dynamic` | — | Value used by `if len(data)>=max then return decode(slice(data,0,max-1)) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L35)

<a id="function-function-mq3-client-ui-specifyleague-ui-specifyleaguemenu-function-ui-specifyleaguemenu-state-playername-leagues-src-mq3-client-ui-specifyleague-ml-2002314699"></a>
### UI_SpecifyLeagueMenu

```ml
function UI_SpecifyLeagueMenu(state, playerName, leagues)
```

UI_SpecifyLeagueMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI specifyleague record/storage; this routine assigns `state.pushed`. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `leagues` | `dynamic` | — | Value used by `SpecifyLeague_MenuInit(state,playerName,leagues)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L78)
