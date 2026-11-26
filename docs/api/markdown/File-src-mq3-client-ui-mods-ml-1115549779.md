# `src/mq3/client/ui_mods.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_mods`](Package-mq3-client-ui-mods-885545121.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-mods-cache-function-cache-src-mq3-client-ui-mods-ml-2034081678"></a>
### cache

```ml
function cache()
```

UI_ModsMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L78)

<a id="function-function-mq3-client-ui-mods-event-function-event-menu-id-eventcode-src-mq3-client-ui-mods-ml-597660001"></a>
### event

```ml
function event(menu, id, eventCode)
```

UI_Mods_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI mods record/storage; this routine assigns `menu.cvarWrites`, `menu.commands`, `menu.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GO then menu.cvarWrites=menu.cvarWrites+["fs_game="+menu.entries[menu.selected].game]`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L71)

<a id="constant-constant-mq3-client-ui-mods-id-back-const-id-back-10-src-mq3-client-ui-mods-ml-1308614628"></a>
### ID_BACK

```ml
const ID_BACK = 10
```

Event identifier of the Back control used to leave the game-mod selection menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L11)

<a id="constant-constant-mq3-client-ui-mods-id-go-const-id-go-11-src-mq3-client-ui-mods-ml-1745958071"></a>
### ID_GO

```ml
const ID_GO = 11
```

Menu control identifier routed to the go action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L13)

<a id="constant-constant-mq3-client-ui-mods-id-list-const-id-list-12-src-mq3-client-ui-mods-ml-1000717034"></a>
### ID_LIST

```ml
const ID_LIST = 12
```

Menu control identifier routed to the list action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L15)

<a id="function-function-mq3-client-ui-mods-init-function-init-mods-src-mq3-client-ui-mods-ml-1942674365"></a>
### init

```ml
function init(mods)
```

UI_Mods_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mods` | `dynamic` | — | Value used by `menu=loadMods(mods)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L81)

<a id="function-function-mq3-client-ui-mods-loadmodfromfile-function-loadmodfromfile-menu-filename-description-src-mq3-client-ui-mods-ml-1369883760"></a>
### loadModFromFile

```ml
function loadModFromFile(menu, filename, description)
```

UI_Mods_LoadModsFromFile (unused in the original build, retained as semantic helper)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Value used by `return parseInfo(menu,name,description)`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `description` | `dynamic` | — | Value used by `return parseInfo(menu,name,description)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L89)

<a id="function-function-mq3-client-ui-mods-loadmods-function-loadmods-mods-src-mq3-client-ui-mods-ml-1281181733"></a>
### loadMods

```ml
function loadMods(mods)
```

UI_Mods_LoadMods

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mods` | `dynamic` | — | Value used by `for each item in mods if len(menu.entries)<MAX_MODS then menu=parseInfo(menu,item[0],item[1]) end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L61)

<a id="constant-constant-mq3-client-ui-mods-max-mods-const-max-mods-64-src-mq3-client-ui-mods-ml-2093764509"></a>
### MAX_MODS

```ml
const MAX_MODS = 64
```

Capacity limit for the mods collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L17)

- [mq3.client.ui_mods.ModEntry](Type-mq3-client-ui-mods-modentry-1334613.md) — struct
- [mq3.client.ui_mods.ModsMenu](Type-mq3-client-ui-mods-modsmenu-541227119.md) — struct
<a id="function-function-mq3-client-ui-mods-open-function-open-mods-src-mq3-client-ui-mods-ml-66413185"></a>
### open

```ml
function open(mods)
```

UI_ModsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mods` | `dynamic` | — | Value used by `menu=init(mods)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L84)

<a id="function-function-mq3-client-ui-mods-parseinfo-function-parseinfo-menu-moddir-moddesc-src-mq3-client-ui-mods-ml-13860989"></a>
### parseInfo

```ml
function parseInfo(menu, modDir, modDesc)
```

UI_Mods_ParseInfos

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI mods record/storage; this routine assigns `menu.entries`. |
| `modDir` | `dynamic` | — | Value used by `game=modDir`. |
| `modDesc` | `dynamic` | — | Value used by `description=modDesc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L53)

<a id="constant-constant-mq3-client-ui-mods-qm-activated-const-qm-activated-3-src-mq3-client-ui-mods-ml-1641659040"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the game-mod selection menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mods.ml#L8)
