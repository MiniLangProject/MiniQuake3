# `src/mq3/client/ui_ingame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_ingame`](Package-mq3-client-ui-ingame-606161161.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-ingame-cache-function-cache-src-mq3-client-ui-ingame-ml-761457190"></a>
### cache

```ml
function cache()
```

InGame_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L65)

<a id="function-function-mq3-client-ui-ingame-event-function-event-menu-id-notification-src-mq3-client-ui-ingame-ml-1320600769"></a>
### event

```ml
function event(menu, id, notification)
```

InGame_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI ingame record/storage; this routine assigns `menu.actions`, `menu.commands`. |
| `id` | `dynamic` | — | Value used by `if id==ID_TEAM then menu.actions=menu.actions+["team"]`. |
| `notification` | `dynamic` | — | Value used by `if notification!=QM_ACTIVATED then return menu end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L49)

<a id="constant-constant-mq3-client-ui-ingame-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-ingame-ml-390025383"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L7)

<a id="constant-constant-mq3-client-ui-ingame-gt-team-const-gt-team-3-src-mq3-client-ui-ingame-ml-1074157914"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L8)

<a id="constant-constant-mq3-client-ui-ingame-id-addbots-const-id-addbots-11-src-mq3-client-ui-ingame-ml-38018851"></a>
### ID_ADDBOTS

```ml
const ID_ADDBOTS = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L11)

<a id="constant-constant-mq3-client-ui-ingame-id-leavearena-const-id-leavearena-15-src-mq3-client-ui-ingame-ml-279951947"></a>
### ID_LEAVEARENA

```ml
const ID_LEAVEARENA = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L15)

<a id="constant-constant-mq3-client-ui-ingame-id-quit-const-id-quit-17-src-mq3-client-ui-ingame-ml-894252505"></a>
### ID_QUIT

```ml
const ID_QUIT = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L17)

<a id="constant-constant-mq3-client-ui-ingame-id-removebots-const-id-removebots-12-src-mq3-client-ui-ingame-ml-702148022"></a>
### ID_REMOVEBOTS

```ml
const ID_REMOVEBOTS = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L12)

<a id="constant-constant-mq3-client-ui-ingame-id-restart-const-id-restart-16-src-mq3-client-ui-ingame-ml-360396238"></a>
### ID_RESTART

```ml
const ID_RESTART = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L16)

<a id="constant-constant-mq3-client-ui-ingame-id-resume-const-id-resume-18-src-mq3-client-ui-ingame-ml-958692892"></a>
### ID_RESUME

```ml
const ID_RESUME = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L18)

<a id="constant-constant-mq3-client-ui-ingame-id-serverinfo-const-id-serverinfo-14-src-mq3-client-ui-ingame-ml-1293581944"></a>
### ID_SERVERINFO

```ml
const ID_SERVERINFO = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L14)

<a id="constant-constant-mq3-client-ui-ingame-id-setup-const-id-setup-13-src-mq3-client-ui-ingame-ml-180028533"></a>
### ID_SETUP

```ml
const ID_SETUP = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L13)

<a id="constant-constant-mq3-client-ui-ingame-id-team-const-id-team-10-src-mq3-client-ui-ingame-ml-124356368"></a>
### ID_TEAM

```ml
const ID_TEAM = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L10)

<a id="constant-constant-mq3-client-ui-ingame-id-teamorders-const-id-teamorders-19-src-mq3-client-ui-ingame-ml-66283927"></a>
### ID_TEAMORDERS

```ml
const ID_TEAMORDERS = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L19)

<a id="constant-constant-mq3-client-ui-ingame-ingame-frame-const-ingame-frame-menu-art-addbotframe-src-mq3-client-ui-ingame-ml-2132146860"></a>
### INGAME_FRAME

```ml
const INGAME_FRAME = "menu/art/addbotframe"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L20)

- [mq3.client.ui_ingame.InGameItem](Type-mq3-client-ui-ingame-ingameitem-1439382987.md) — struct
- [mq3.client.ui_ingame.InGameMenu](Type-mq3-client-ui-ingame-ingamemenu-1969074347.md) — struct
<a id="function-function-mq3-client-ui-ingame-init-function-init-serverrunning-botenable-gametype-playerteam-src-mq3-client-ui-ingame-ml-1732600340"></a>
### init

```ml
function init(serverRunning, botEnable, gametype, playerTeam)
```

InGame_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverRunning` | `dynamic` | — | Value used by `botGrayed=not serverRunning or not botEnable or gametype==GT_SINGLE_PLAYER`. |
| `botEnable` | `dynamic` | — | Value used by `botGrayed=not serverRunning or not botEnable or gametype==GT_SINGLE_PLAYER`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `playerTeam` | `dynamic` | — | Value used by `ordersGrayed=gametype<GT_TEAM or playerTeam==TEAM_SPECTATOR`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L72)

<a id="function-function-mq3-client-ui-ingame-open-function-open-serverrunning-botenable-gametype-playerteam-src-mq3-client-ui-ingame-ml-1831280496"></a>
### open

```ml
function open(serverRunning, botEnable, gametype, playerTeam)
```

UI_InGameMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverRunning` | `dynamic` | — | Value used by `menu=init(serverRunning,botEnable,gametype,playerTeam)`. |
| `botEnable` | `dynamic` | — | Value used by `menu=init(serverRunning,botEnable,gametype,playerTeam)`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `playerTeam` | `dynamic` | — | Value used by `menu=init(serverRunning,botEnable,gametype,playerTeam)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L95)

<a id="constant-constant-mq3-client-ui-ingame-qm-activated-const-qm-activated-3-src-mq3-client-ui-ingame-ml-156422168"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L6)

<a id="function-function-mq3-client-ui-ingame-quitaction-function-quitaction-menu-result-src-mq3-client-ui-ingame-ml-1602470552"></a>
### quitAction

```ml
function quitAction(menu, result)
```

InGame_QuitAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI ingame record/storage; this routine assigns `menu.actions`. |
| `result` | `dynamic` | — | Value used by `if result then menu.actions=menu.actions+["pop","credits"] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L40)

<a id="function-function-mq3-client-ui-ingame-restartaction-function-restartaction-menu-result-src-mq3-client-ui-ingame-ml-1874227270"></a>
### restartAction

```ml
function restartAction(menu, result)
```

InGame_RestartAction

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI ingame record/storage; this routine assigns `menu.actions`, `menu.commands`. |
| `result` | `dynamic` | — | Value used by `if not result then return menu end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L30)

<a id="constant-constant-mq3-client-ui-ingame-team-spectator-const-team-spectator-3-src-mq3-client-ui-ingame-ml-1484767946"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L9)
