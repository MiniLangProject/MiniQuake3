# `src/mq3/client/ui_team.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_team`](Package-mq3-client-ui-team-995468373.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-team-cache-function-cache-src-mq3-client-ui-team-ml-1106015750"></a>
### cache

```ml
function cache()
```

TeamMain_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L67)

<a id="function-function-mq3-client-ui-team-event-function-event-menu-id-eventcode-src-mq3-client-ui-team-ml-750525785"></a>
### event

```ml
function event(menu, id, eventCode)
```

TeamMain_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI team record/storage; this routine assigns `menu.commands`, `menu.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_JOINRED then command="cmd team red\\n" else if id==ID_JOINBLUE then command="cmd team blue\\n" else if id==ID_JOINGAME then command="c...`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L59)

<a id="constant-constant-mq3-client-ui-team-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-team-ml-1010667631"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Capture-the-flag rules identifier retained in the team menu's native game-type vocabulary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L19)

<a id="constant-constant-mq3-client-ui-team-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-team-ml-2041420643"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Native game-type identifier selecting free-for-all deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L9)

<a id="constant-constant-mq3-client-ui-team-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-team-ml-1138245635"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Native game-type value for single-player arena progression, used when choosing valid team and spectator actions for the current rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L15)

<a id="constant-constant-mq3-client-ui-team-gt-team-const-gt-team-3-src-mq3-client-ui-team-ml-760873954"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Team-deathmatch rules identifier retained in the team menu's native game-type vocabulary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L17)

<a id="constant-constant-mq3-client-ui-team-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-team-ml-1517847616"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when choosing valid team and spectator actions for the current rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L12)

<a id="constant-constant-mq3-client-ui-team-id-joinblue-const-id-joinblue-101-src-mq3-client-ui-team-ml-814937495"></a>
### ID_JOINBLUE

```ml
const ID_JOINBLUE = 101
```

Menu control identifier routed to the joinblue action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L23)

<a id="constant-constant-mq3-client-ui-team-id-joingame-const-id-joingame-102-src-mq3-client-ui-team-ml-1037740286"></a>
### ID_JOINGAME

```ml
const ID_JOINGAME = 102
```

Menu control identifier routed to the joingame action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L25)

<a id="constant-constant-mq3-client-ui-team-id-joinred-const-id-joinred-100-src-mq3-client-ui-team-ml-1298868136"></a>
### ID_JOINRED

```ml
const ID_JOINRED = 100
```

Menu control identifier routed to the joinred action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L21)

<a id="constant-constant-mq3-client-ui-team-id-spectate-const-id-spectate-103-src-mq3-client-ui-team-ml-1073876077"></a>
### ID_SPECTATE

```ml
const ID_SPECTATE = 103
```

Menu control identifier routed to the spectate action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L27)

<a id="function-function-mq3-client-ui-team-init-function-init-gametype-src-mq3-client-ui-team-ml-99131764"></a>
### init

```ml
function init(gametype)
```

TeamMain_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L70)

<a id="function-function-mq3-client-ui-team-open-function-open-gametype-src-mq3-client-ui-team-ml-1966451192"></a>
### open

```ml
function open(gametype)
```

UI_TeamMainMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L78)

<a id="constant-constant-mq3-client-ui-team-qm-activated-const-qm-activated-3-src-mq3-client-ui-team-ml-539601408"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the team-selection menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_team.ml#L7)

- [mq3.client.ui_team.TeamItem](Type-mq3-client-ui-team-teamitem-1777515439.md) — struct
- [mq3.client.ui_team.TeamMenu](Type-mq3-client-ui-team-teammenu-907100999.md) — struct
