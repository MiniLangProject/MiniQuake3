# `src/mq3/client/ui_mods.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_mods`](Package-mq3-client-ui-mods-885545121.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-mods-cache-function-cache-src-mq3-client-ui-mods-ml-2034081678"></a>
### cache

```ml
function cache()
```

UI_ModsMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L35)

<a id="function-function-mq3-client-ui-mods-event-function-event-menu-id-eventcode-src-mq3-client-ui-mods-ml-597660001"></a>
### event

```ml
function event(menu, id, eventCode)
```

UI_Mods_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L28)

<a id="constant-constant-mq3-client-ui-mods-id-back-const-id-back-10-src-mq3-client-ui-mods-ml-1308614628"></a>
### ID_BACK

```ml
const ID_BACK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L7)

<a id="constant-constant-mq3-client-ui-mods-id-go-const-id-go-11-src-mq3-client-ui-mods-ml-1745958071"></a>
### ID_GO

```ml
const ID_GO = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L8)

<a id="constant-constant-mq3-client-ui-mods-id-list-const-id-list-12-src-mq3-client-ui-mods-ml-1000717034"></a>
### ID_LIST

```ml
const ID_LIST = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L9)

<a id="function-function-mq3-client-ui-mods-init-function-init-mods-src-mq3-client-ui-mods-ml-1942674365"></a>
### init

```ml
function init(mods)
```

UI_Mods_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mods` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L37)

<a id="function-function-mq3-client-ui-mods-loadmodfromfile-function-loadmodfromfile-menu-filename-description-src-mq3-client-ui-mods-ml-1369883760"></a>
### loadModFromFile

```ml
function loadModFromFile(menu, filename, description)
```

UI_Mods_LoadModsFromFile (unused in the original build, retained as semantic helper)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `description` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L41)

<a id="function-function-mq3-client-ui-mods-loadmods-function-loadmods-mods-src-mq3-client-ui-mods-ml-1281181733"></a>
### loadMods

```ml
function loadMods(mods)
```

UI_Mods_LoadMods

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mods` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L21)

<a id="constant-constant-mq3-client-ui-mods-max-mods-const-max-mods-64-src-mq3-client-ui-mods-ml-2093764509"></a>
### MAX_MODS

```ml
const MAX_MODS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L10)

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
| `mods` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L39)

<a id="function-function-mq3-client-ui-mods-parseinfo-function-parseinfo-menu-moddir-moddesc-src-mq3-client-ui-mods-ml-13860989"></a>
### parseInfo

```ml
function parseInfo(menu, modDir, modDesc)
```

UI_Mods_ParseInfos

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `modDir` | `dynamic` | — |  |
| `modDesc` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L14)

<a id="constant-constant-mq3-client-ui-mods-qm-activated-const-qm-activated-3-src-mq3-client-ui-mods-ml-1641659040"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L6)
