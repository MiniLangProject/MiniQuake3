# `src/mq3/client/ui_setup.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_setup`](Package-mq3-client-ui-setup-902351969.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-setup-cache-function-cache-src-mq3-client-ui-setup-ml-1754980014"></a>
### cache

```ml
function cache()
```

UI_SetupMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L74)

<a id="function-function-mq3-client-ui-setup-event-function-event-menu-id-eventcode-src-mq3-client-ui-setup-ml-1451175135"></a>
### event

```ml
function event(menu, id, eventCode)
```

UI_SetupMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI setup record/storage; this routine assigns `menu.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_CUSTOMIZEPLAYER then menu.actions=menu.actions+["playerSettings"]`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L62)

<a id="constant-constant-mq3-client-ui-setup-id-back-const-id-back-18-src-mq3-client-ui-setup-ml-1122189580"></a>
### ID_BACK

```ml
const ID_BACK = 18
```

Event identifier of the Back control used to leave the player and system setup menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L22)

<a id="constant-constant-mq3-client-ui-setup-id-cdkey-const-id-cdkey-14-src-mq3-client-ui-setup-ml-1665842990"></a>
### ID_CDKEY

```ml
const ID_CDKEY = 14
```

Menu control identifier routed to the cdkey action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L17)

<a id="constant-constant-mq3-client-ui-setup-id-customizecontrols-const-id-customizecontrols-11-src-mq3-client-ui-setup-ml-222263037"></a>
### ID_CUSTOMIZECONTROLS

```ml
const ID_CUSTOMIZECONTROLS = 11
```

Menu control identifier routed to the customizecontrols action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L11)

<a id="constant-constant-mq3-client-ui-setup-id-customizeplayer-const-id-customizeplayer-10-src-mq3-client-ui-setup-ml-1019892334"></a>
### ID_CUSTOMIZEPLAYER

```ml
const ID_CUSTOMIZEPLAYER = 10
```

Menu control identifier routed to the customizeplayer action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L9)

<a id="constant-constant-mq3-client-ui-setup-id-defaults-const-id-defaults-17-src-mq3-client-ui-setup-ml-1991617843"></a>
### ID_DEFAULTS

```ml
const ID_DEFAULTS = 17
```

Menu control identifier routed to the defaults action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L19)

<a id="constant-constant-mq3-client-ui-setup-id-game-const-id-game-13-src-mq3-client-ui-setup-ml-1583372911"></a>
### ID_GAME

```ml
const ID_GAME = 13
```

Menu control identifier routed to the game action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L15)

<a id="constant-constant-mq3-client-ui-setup-id-systemconfig-const-id-systemconfig-12-src-mq3-client-ui-setup-ml-125994518"></a>
### ID_SYSTEMCONFIG

```ml
const ID_SYSTEMCONFIG = 12
```

Menu control identifier routed to the systemconfig action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L13)

<a id="function-function-mq3-client-ui-setup-init-function-init-paused-src-mq3-client-ui-setup-ml-1399909720"></a>
### init

```ml
function init(paused)
```

UI_SetupMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paused` | `dynamic` | — | Value used by `if not paused then items=items+[SetupItem(ID_DEFAULTS,"DEFAULTS",304)] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L77)

<a id="function-function-mq3-client-ui-setup-open-function-open-paused-src-mq3-client-ui-setup-ml-537575684"></a>
### open

```ml
function open(paused)
```

UI_SetupMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paused` | `dynamic` | — | Value used by `menu=init(paused)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L85)

<a id="constant-constant-mq3-client-ui-setup-qm-activated-const-qm-activated-3-src-mq3-client-ui-setup-ml-1581072936"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the player and system setup menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L7)

<a id="function-function-mq3-client-ui-setup-resetdefaultsaction-function-resetdefaultsaction-menu-result-src-mq3-client-ui-setup-ml-248999154"></a>
### resetDefaultsAction

```ml
function resetDefaultsAction(menu, result)
```

Setup_ResetDefaults_Action

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI setup record/storage; this routine assigns `menu.commands`. |
| `result` | `dynamic` | — | Value used by `if result then menu.commands=menu.commands+["exec default.cfg\\n","cvar_restart\\n","vid_restart\\n"] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L55)

<a id="function-function-mq3-client-ui-setup-resetdefaultsdraw-function-resetdefaultsdraw-src-mq3-client-ui-setup-ml-491392836"></a>
### resetDefaultsDraw

```ml
function resetDefaultsDraw()
```

Setup_ResetDefaults_Draw


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L57)

- [mq3.client.ui_setup.SetupItem](Type-mq3-client-ui-setup-setupitem-266284445.md) — struct
- [mq3.client.ui_setup.SetupMenu](Type-mq3-client-ui-setup-setupmenu-335050865.md) — struct
