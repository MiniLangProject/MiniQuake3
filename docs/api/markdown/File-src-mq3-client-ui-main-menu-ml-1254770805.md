# `src/mq3/client/ui_main_menu.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_main_menu`](Package-mq3-client-ui-main-menu-1340248173.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-main-menu-builditems-function-builditems-hasteamarena-src-mq3-client-ui-main-menu-ml-709807834"></a>
### buildItems

```ml
function buildItems(hasTeamArena)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hasTeamArena` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L75)

<a id="function-function-mq3-client-ui-main-menu-cache-function-cache-src-mq3-client-ui-main-menu-ml-1352930134"></a>
### cache

```ml
function cache()
```

MainMenu_Cache


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L45)

<a id="function-function-mq3-client-ui-main-menu-draw-function-draw-menu-realtime-demoversion-src-mq3-client-ui-main-menu-ml-309414607"></a>
### draw

```ml
function draw(menu, realtime, demoVersion)
```

Main_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `demoVersion` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L55)

<a id="function-function-mq3-client-ui-main-menu-errormessagekey-function-errormessagekey-menu-key-src-mq3-client-ui-main-menu-ml-1105459774"></a>
### errorMessageKey

```ml
function errorMessageKey(menu, key)
```

ErrorMessage_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L48)

<a id="function-function-mq3-client-ui-main-menu-event-function-event-menu-id-eventcode-src-mq3-client-ui-main-menu-ml-1915617543"></a>
### event

```ml
function event(menu, id, eventCode)
```

Main_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L31)

<a id="function-function-mq3-client-ui-main-menu-exitaction-function-exitaction-menu-result-src-mq3-client-ui-main-menu-ml-136962796"></a>
### exitAction

```ml
function exitAction(menu, result)
```

MainMenu_ExitAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L24)

<a id="constant-constant-mq3-client-ui-main-menu-id-cinematics-const-id-cinematics-14-src-mq3-client-ui-main-menu-ml-269963088"></a>
### ID_CINEMATICS

```ml
const ID_CINEMATICS = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L13)

<a id="constant-constant-mq3-client-ui-main-menu-id-demos-const-id-demos-13-src-mq3-client-ui-main-menu-ml-157587561"></a>
### ID_DEMOS

```ml
const ID_DEMOS = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L12)

<a id="constant-constant-mq3-client-ui-main-menu-id-exit-const-id-exit-17-src-mq3-client-ui-main-menu-ml-515579703"></a>
### ID_EXIT

```ml
const ID_EXIT = 17
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L16)

<a id="constant-constant-mq3-client-ui-main-menu-id-mods-const-id-mods-16-src-mq3-client-ui-main-menu-ml-633528998"></a>
### ID_MODS

```ml
const ID_MODS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L15)

<a id="constant-constant-mq3-client-ui-main-menu-id-multiplayer-const-id-multiplayer-11-src-mq3-client-ui-main-menu-ml-332393563"></a>
### ID_MULTIPLAYER

```ml
const ID_MULTIPLAYER = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L10)

<a id="constant-constant-mq3-client-ui-main-menu-id-setup-const-id-setup-12-src-mq3-client-ui-main-menu-ml-1222594662"></a>
### ID_SETUP

```ml
const ID_SETUP = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L11)

<a id="constant-constant-mq3-client-ui-main-menu-id-singleplayer-const-id-singleplayer-10-src-mq3-client-ui-main-menu-ml-823484376"></a>
### ID_SINGLEPLAYER

```ml
const ID_SINGLEPLAYER = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L9)

<a id="constant-constant-mq3-client-ui-main-menu-id-teamarena-const-id-teamarena-15-src-mq3-client-ui-main-menu-ml-1891882747"></a>
### ID_TEAMARENA

```ml
const ID_TEAMARENA = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L14)

<a id="constant-constant-mq3-client-ui-main-menu-main-banner-model-const-main-banner-model-models-mapobjects-banner-banner5-md3-src-mq3-client-ui-main-menu-ml-1662818513"></a>
### MAIN_BANNER_MODEL

```ml
const MAIN_BANNER_MODEL = "models/mapobjects/banner/banner5.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L17)

- [mq3.client.ui_main_menu.MainDraw](Type-mq3-client-ui-main-menu-maindraw-955434990.md) — struct
- [mq3.client.ui_main_menu.MainItem](Type-mq3-client-ui-main-menu-mainitem-1955101891.md) — struct
- [mq3.client.ui_main_menu.MainMenu](Type-mq3-client-ui-main-menu-mainmenu-1260810851.md) — struct
<a id="function-function-mq3-client-ui-main-menu-open-function-open-demoversion-cdkeychecked-cdkeyvalid-errormessage-modnames-src-mq3-client-ui-main-menu-ml-215365787"></a>
### open

```ml
function open(demoVersion, cdKeyChecked, cdKeyValid, errorMessage, modNames)
```

UI_MainMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `demoVersion` | `dynamic` | — |  |
| `cdKeyChecked` | `dynamic` | — |  |
| `cdKeyValid` | `dynamic` | — |  |
| `errorMessage` | `dynamic` | — |  |
| `modNames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L89)

<a id="constant-constant-mq3-client-ui-main-menu-qm-activated-const-qm-activated-3-src-mq3-client-ui-main-menu-ml-1782790464"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L8)

<a id="function-function-mq3-client-ui-main-menu-teamarenaexists-function-teamarenaexists-modnames-src-mq3-client-ui-main-menu-ml-108645962"></a>
### teamArenaExists

```ml
function teamArenaExists(modNames)
```

UI_TeamArenaExists

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modNames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L66)
