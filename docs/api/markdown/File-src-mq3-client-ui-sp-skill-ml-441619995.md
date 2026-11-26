# `src/mq3/client/ui_sp_skill.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_sp_skill`](Package-mq3-client-ui-sp-skill-2095215341.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-sp-skill-backevent-function-backevent-menu-notification-src-mq3-client-ui-sp-skill-ml-1075705816"></a>
### backEvent

```ml
function backEvent(menu, notification)
```

UI_SPSkillMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI sp skill record/storage; this routine assigns `menu.sounds`, `menu.actions`. |
| `notification` | `dynamic` | — | Value used by `if notification==QM_ACTIVATED then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L102)

<a id="function-function-mq3-client-ui-sp-skill-cache-function-cache-src-mq3-client-ui-sp-skill-ml-329303278"></a>
### cache

```ml
function cache()
```

UI_SPSkillMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L108)

<a id="constant-constant-mq3-client-ui-sp-skill-chan-announcer-const-chan-announcer-7-src-mq3-client-ui-sp-skill-ml-574083644"></a>
### CHAN_ANNOUNCER

```ml
const CHAN_ANNOUNCER = 7
```

Sound channel reserved for global announcer feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L13)

<a id="function-function-mq3-client-ui-sp-skill-clampskill-function-clampskill-value-src-mq3-client-ui-sp-skill-ml-1458071071"></a>
### clampSkill

```ml
function clampSkill(value)
```

Evaluates UI sp skill `clampSkill` and returns `1`, `5`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<1`, `value>5` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L70)

<a id="function-function-mq3-client-ui-sp-skill-fightevent-function-fightevent-menu-notification-src-mq3-client-ui-sp-skill-ml-574740334"></a>
### fightEvent

```ml
function fightEvent(menu, notification)
```

UI_SPSkillMenu_FightEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI sp skill record/storage; this routine assigns `menu.actions`. |
| `notification` | `dynamic` | — | Value used by `if notification==QM_ACTIVATED then menu.actions=menu.actions+[["spArenaStart",menu.arenaInfo]] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L98)

<a id="constant-constant-mq3-client-ui-sp-skill-id-baby-const-id-baby-10-src-mq3-client-ui-sp-skill-ml-1210328712"></a>
### ID_BABY

```ml
const ID_BABY = 10
```

Menu control identifier routed to the baby action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L15)

<a id="constant-constant-mq3-client-ui-sp-skill-id-back-const-id-back-15-src-mq3-client-ui-sp-skill-ml-1619561319"></a>
### ID_BACK

```ml
const ID_BACK = 15
```

Event identifier of the Back control used to leave the single-player difficulty menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L26)

<a id="constant-constant-mq3-client-ui-sp-skill-id-easy-const-id-easy-11-src-mq3-client-ui-sp-skill-ml-23865491"></a>
### ID_EASY

```ml
const ID_EASY = 11
```

Menu control identifier routed to the easy action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L17)

<a id="constant-constant-mq3-client-ui-sp-skill-id-fight-const-id-fight-16-src-mq3-client-ui-sp-skill-ml-1862688572"></a>
### ID_FIGHT

```ml
const ID_FIGHT = 16
```

Menu control identifier routed to the fight action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L28)

<a id="constant-constant-mq3-client-ui-sp-skill-id-hard-const-id-hard-13-src-mq3-client-ui-sp-skill-ml-555953317"></a>
### ID_HARD

```ml
const ID_HARD = 13
```

Menu control identifier routed to the hard action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L21)

<a id="constant-constant-mq3-client-ui-sp-skill-id-medium-const-id-medium-12-src-mq3-client-ui-sp-skill-ml-1722289510"></a>
### ID_MEDIUM

```ml
const ID_MEDIUM = 12
```

Menu control identifier routed to the medium action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L19)

<a id="constant-constant-mq3-client-ui-sp-skill-id-nightmare-const-id-nightmare-14-src-mq3-client-ui-sp-skill-ml-405797248"></a>
### ID_NIGHTMARE

```ml
const ID_NIGHTMARE = 14
```

Menu control identifier routed to the nightmare action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L23)

<a id="function-function-mq3-client-ui-sp-skill-init-function-init-rawskill-src-mq3-client-ui-sp-skill-ml-1878261503"></a>
### init

```ml
function init(rawSkill)
```

UI_SPSkillMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rawSkill` | `dynamic` | — | Value used by `skill=clampSkill(rawSkill)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L111)

<a id="constant-constant-mq3-client-ui-sp-skill-k-escape-const-k-escape-27-src-mq3-client-ui-sp-skill-ml-254081890"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```

Engine key code for the escape input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L11)

<a id="constant-constant-mq3-client-ui-sp-skill-k-mouse2-const-k-mouse2-178-src-mq3-client-ui-sp-skill-ml-918977767"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 178
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L9)

<a id="function-function-mq3-client-ui-sp-skill-key-function-key-menu-keycode-src-mq3-client-ui-sp-skill-ml-761139203"></a>
### key

```ml
function key(menu, keyCode)
```

UI_SPSkillMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI sp skill record/storage; this routine assigns `menu.sounds`, `menu.actions`. |
| `keyCode` | `dynamic` | — | Value used by `if keyCode==K_MOUSE2 or keyCode==K_ESCAPE then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L106)

<a id="function-function-mq3-client-ui-sp-skill-open-function-open-arenainfo-rawskill-src-mq3-client-ui-sp-skill-ml-1425356456"></a>
### open

```ml
function open(arenaInfo, rawSkill)
```

UI_SPSkillMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `arenaInfo` | `dynamic` | — | Value assigned to `menu.arenaInfo`. |
| `rawSkill` | `dynamic` | — | Value used by `menu=init(rawSkill)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L120)

<a id="constant-constant-mq3-client-ui-sp-skill-qm-activated-const-qm-activated-3-src-mq3-client-ui-sp-skill-ml-1505075360"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the single-player difficulty menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L7)

<a id="function-function-mq3-client-ui-sp-skill-setskillcolor-function-setskillcolor-menu-skill-color-src-mq3-client-ui-sp-skill-ml-761258103"></a>
### setSkillColor

```ml
function setSkillColor(menu, skill, color)
```

SetSkillColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI sp skill record/storage; this routine assigns `menu.items[index].color`. |
| `skill` | `dynamic` | — | Value used by `index=skill-1`. |
| `color` | `dynamic` | — | Color value used by the UI sp skill drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L78)

<a id="function-function-mq3-client-ui-sp-skill-skillevent-function-skillevent-menu-id-notification-src-mq3-client-ui-sp-skill-ml-932583569"></a>
### skillEvent

```ml
function skillEvent(menu, id, notification)
```

UI_SPSkillMenu_SkillEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI sp skill record/storage; this routine assigns `menu.skill`, `menu.items[5].shader`, `menu.cvarWrites`, `menu.sounds`. |
| `id` | `dynamic` | — | Value used by `skill=clampSkill(id-ID_BABY+1)`. |
| `notification` | `dynamic` | — | Value used by `if notification!=QM_ACTIVATED then return menu end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L87)

- [mq3.client.ui_sp_skill.SkillItem](Type-mq3-client-ui-sp-skill-skillitem-215826969.md) — struct
- [mq3.client.ui_sp_skill.SkillMenu](Type-mq3-client-ui-sp-skill-skillmenu-1820080165.md) — struct
<a id="function-function-mq3-client-ui-sp-skill-skillpicture-function-skillpicture-skill-src-mq3-client-ui-sp-skill-ml-1198652743"></a>
### skillPicture

```ml
function skillPicture(skill)
```

Computes `"menu/art/level_complete"+str(clampSkill(skill))` for UI sp skill `skillPicture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `skill` | `dynamic` | — | Value used by `return "menu/art/level_complete"+str(clampSkill(skill))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L73)
