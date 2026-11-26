# `src/mq3/client/ui_load_config.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_load_config`](Package-mq3-client-ui-load-config-1449775879.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-load-config-cache-function-cache-src-mq3-client-ui-load-config-ml-1175092250"></a>
### cache

```ml
function cache()
```

UI_LoadConfig_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L61)

<a id="function-function-mq3-client-ui-load-config-displayname-function-displayname-name-src-mq3-client-ui-load-config-ml-2032299163"></a>
### displayName

```ml
function displayName(name)
```

Calls `std.string.toLowerAscii`, `std.string.endsWith`, `std.string.substr` and additional helpers from UI load config `displayName`. The final path returns `strings.toUpperAscii(name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name whose length/content is inspected by `displayName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L47)

<a id="function-function-mq3-client-ui-load-config-event-function-event-menu-id-eventcode-src-mq3-client-ui-load-config-ml-986730547"></a>
### event

```ml
function event(menu, id, eventCode)
```

LoadConfig_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI load config record/storage; this routine assigns `menu.commands`, `menu.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_GO and not menu.goHidden then menu.commands=menu.commands+["exec "+menu.names[menu.selected]+"\\n"]`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L52)

<a id="constant-constant-mq3-client-ui-load-config-id-back-const-id-back-10-src-mq3-client-ui-load-config-ml-1889686076"></a>
### ID_BACK

```ml
const ID_BACK = 10
```

Event identifier of the Back control used to leave the configuration-file loading menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L11)

<a id="constant-constant-mq3-client-ui-load-config-id-go-const-id-go-11-src-mq3-client-ui-load-config-ml-766469773"></a>
### ID_GO

```ml
const ID_GO = 11
```

Menu control identifier routed to the go action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L13)

<a id="constant-constant-mq3-client-ui-load-config-id-left-const-id-left-13-src-mq3-client-ui-load-config-ml-1455614499"></a>
### ID_LEFT

```ml
const ID_LEFT = 13
```

Menu control identifier routed to the left action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L17)

<a id="constant-constant-mq3-client-ui-load-config-id-list-const-id-list-12-src-mq3-client-ui-load-config-ml-175377790"></a>
### ID_LIST

```ml
const ID_LIST = 12
```

Menu control identifier routed to the list action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L15)

<a id="constant-constant-mq3-client-ui-load-config-id-right-const-id-right-14-src-mq3-client-ui-load-config-ml-304435334"></a>
### ID_RIGHT

```ml
const ID_RIGHT = 14
```

Menu control identifier routed to the right action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L19)

<a id="function-function-mq3-client-ui-load-config-init-function-init-files-src-mq3-client-ui-load-config-ml-1436151571"></a>
### init

```ml
function init(files)
```

LoadConfig_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | Value used by `for each file in files if len(names)<MAX_CONFIGS then names=names+[displayName(file)] end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L64)

- [mq3.client.ui_load_config.LoadConfigMenu](Type-mq3-client-ui-load-config-loadconfigmenu-1342410830.md) — struct
<a id="constant-constant-mq3-client-ui-load-config-max-configs-const-max-configs-128-src-mq3-client-ui-load-config-ml-1933149794"></a>
### MAX_CONFIGS

```ml
const MAX_CONFIGS = 128
```

Capacity limit for the configs collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L21)

<a id="function-function-mq3-client-ui-load-config-open-function-open-files-src-mq3-client-ui-load-config-ml-1396848527"></a>
### open

```ml
function open(files)
```

UI_LoadConfigMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | Value used by `menu=init(files)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L71)

<a id="constant-constant-mq3-client-ui-load-config-qm-activated-const-qm-activated-3-src-mq3-client-ui-load-config-ml-1383171272"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the configuration-file loading menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_load_config.ml#L8)
