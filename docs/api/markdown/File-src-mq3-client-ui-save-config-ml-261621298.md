# `src/mq3/client/ui_save_config.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_save_config`](Package-mq3-client-ui-save-config-220959204.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-save-config-backevent-function-backevent-menu-eventcode-src-mq3-client-ui-save-config-ml-583113314"></a>
### backEvent

```ml
function backEvent(menu, eventCode)
```

UI_SaveConfigMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI save config record/storage; this routine assigns `menu.actions`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L15)

<a id="function-function-mq3-client-ui-save-config-cache-function-cache-src-mq3-client-ui-save-config-ml-684037968"></a>
### cache

```ml
function cache()
```

UI_SaveConfigMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L28)

<a id="function-function-mq3-client-ui-save-config-drawname-function-drawname-menu-focused-src-mq3-client-ui-save-config-ml-2112066584"></a>
### drawName

```ml
function drawName(menu, focused)
```

UI_SaveConfigMenu_SavenameDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Record read through `menu.widthInChars`, `menu.name`. |
| `focused` | `dynamic` | — | Value used by `if focused then style="left+pulse+small"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L26)

<a id="function-function-mq3-client-ui-save-config-init-function-init-src-mq3-client-ui-save-config-ml-1718945232"></a>
### init

```ml
function init()
```

UI_SaveConfigMenu_Init


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L30)

<a id="function-function-mq3-client-ui-save-config-open-function-open-src-mq3-client-ui-save-config-ml-1885765156"></a>
### open

```ml
function open()
```

UI_SaveConfigMenu


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L32)

<a id="constant-constant-mq3-client-ui-save-config-qm-activated-const-qm-activated-3-src-mq3-client-ui-save-config-ml-1460457756"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L6)

- [mq3.client.ui_save_config.SaveConfigMenu](Type-mq3-client-ui-save-config-saveconfigmenu-1538733694.md) — struct
<a id="function-function-mq3-client-ui-save-config-saveevent-function-saveevent-menu-eventcode-src-mq3-client-ui-save-config-ml-217665586"></a>
### saveEvent

```ml
function saveEvent(menu, eventCode)
```

UI_SaveConfigMenu_SaveEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI save config record/storage; this routine assigns `menu.commands`, `menu.actions`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L19)

<a id="function-function-mq3-client-ui-save-config-stripextension-function-stripextension-name-src-mq3-client-ui-save-config-ml-1563109671"></a>
### stripExtension

```ml
function stripExtension(name)
```

Calls `std.string.lastIndexOf`, `std.string.substr` from UI save config `stripExtension`. The final path returns `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI save config resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L11)
