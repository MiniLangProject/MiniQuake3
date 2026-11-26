# `src/mq3/client/ui_controls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_controls`](Package-mq3-client-ui-controls-894199342.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/vm/cgame_key_traps.ml` as `keys` → [src/mq3/vm/cgame_key_traps.ml](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_controls.Action](Type-mq3-client-ui-controls-action-1891887834.md) — struct
<a id="function-function-mq3-client-ui-controls-actionbinding-function-actionbinding-state-id-src-mq3-client-ui-controls-ml-2121905232"></a>
### actionBinding

```ml
function actionBinding(state, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L131)

<a id="function-function-mq3-client-ui-controls-actionevent-function-actionevent-state-id-event-src-mq3-client-ui-controls-ml-1811433826"></a>
### actionEvent

```ml
function actionEvent(state, id, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L253)

<a id="constant-constant-mq3-client-ui-controls-anim-attack-const-anim-attack-22-src-mq3-client-ui-controls-ml-804918509"></a>
### ANIM_ATTACK

```ml
const ANIM_ATTACK = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L66)

<a id="constant-constant-mq3-client-ui-controls-anim-back-const-anim-back-3-src-mq3-client-ui-controls-ml-1508711172"></a>
### ANIM_BACK

```ml
const ANIM_BACK = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L47)

<a id="constant-constant-mq3-client-ui-controls-anim-chat-const-anim-chat-25-src-mq3-client-ui-controls-ml-1636348900"></a>
### ANIM_CHAT

```ml
const ANIM_CHAT = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L69)

<a id="constant-constant-mq3-client-ui-controls-anim-crouch-const-anim-crouch-5-src-mq3-client-ui-controls-ml-165245474"></a>
### ANIM_CROUCH

```ml
const ANIM_CROUCH = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L49)

<a id="constant-constant-mq3-client-ui-controls-anim-die-const-anim-die-24-src-mq3-client-ui-controls-ml-331818093"></a>
### ANIM_DIE

```ml
const ANIM_DIE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L68)

<a id="constant-constant-mq3-client-ui-controls-anim-gesture-const-anim-gesture-23-src-mq3-client-ui-controls-ml-1480270642"></a>
### ANIM_GESTURE

```ml
const ANIM_GESTURE = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L67)

<a id="constant-constant-mq3-client-ui-controls-anim-idle-const-anim-idle-0-src-mq3-client-ui-controls-ml-511519237"></a>
### ANIM_IDLE

```ml
const ANIM_IDLE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L44)

<a id="constant-constant-mq3-client-ui-controls-anim-jump-const-anim-jump-4-src-mq3-client-ui-controls-ml-2049239157"></a>
### ANIM_JUMP

```ml
const ANIM_JUMP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L48)

<a id="constant-constant-mq3-client-ui-controls-anim-lookdown-const-anim-lookdown-11-src-mq3-client-ui-controls-ml-141320295"></a>
### ANIM_LOOKDOWN

```ml
const ANIM_LOOKDOWN = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L55)

<a id="constant-constant-mq3-client-ui-controls-anim-lookup-const-anim-lookup-10-src-mq3-client-ui-controls-ml-1771105120"></a>
### ANIM_LOOKUP

```ml
const ANIM_LOOKUP = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L54)

<a id="constant-constant-mq3-client-ui-controls-anim-run-const-anim-run-1-src-mq3-client-ui-controls-ml-1381691334"></a>
### ANIM_RUN

```ml
const ANIM_RUN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L45)

<a id="constant-constant-mq3-client-ui-controls-anim-stepleft-const-anim-stepleft-6-src-mq3-client-ui-controls-ml-1037600691"></a>
### ANIM_STEPLEFT

```ml
const ANIM_STEPLEFT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L50)

<a id="constant-constant-mq3-client-ui-controls-anim-stepright-const-anim-stepright-7-src-mq3-client-ui-controls-ml-1307348118"></a>
### ANIM_STEPRIGHT

```ml
const ANIM_STEPRIGHT = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L51)

<a id="constant-constant-mq3-client-ui-controls-anim-turnleft-const-anim-turnleft-8-src-mq3-client-ui-controls-ml-1962499573"></a>
### ANIM_TURNLEFT

```ml
const ANIM_TURNLEFT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L52)

<a id="constant-constant-mq3-client-ui-controls-anim-turnright-const-anim-turnright-9-src-mq3-client-ui-controls-ml-2046809770"></a>
### ANIM_TURNRIGHT

```ml
const ANIM_TURNRIGHT = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L53)

<a id="constant-constant-mq3-client-ui-controls-anim-walk-const-anim-walk-2-src-mq3-client-ui-controls-ml-222117943"></a>
### ANIM_WALK

```ml
const ANIM_WALK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L46)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon1-const-anim-weapon1-12-src-mq3-client-ui-controls-ml-18953274"></a>
### ANIM_WEAPON1

```ml
const ANIM_WEAPON1 = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L56)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon10-const-anim-weapon10-21-src-mq3-client-ui-controls-ml-1009417376"></a>
### ANIM_WEAPON10

```ml
const ANIM_WEAPON10 = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L65)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon2-const-anim-weapon2-13-src-mq3-client-ui-controls-ml-1410801483"></a>
### ANIM_WEAPON2

```ml
const ANIM_WEAPON2 = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L57)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon3-const-anim-weapon3-14-src-mq3-client-ui-controls-ml-1185373932"></a>
### ANIM_WEAPON3

```ml
const ANIM_WEAPON3 = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L58)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon4-const-anim-weapon4-15-src-mq3-client-ui-controls-ml-1671965093"></a>
### ANIM_WEAPON4

```ml
const ANIM_WEAPON4 = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L59)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon5-const-anim-weapon5-16-src-mq3-client-ui-controls-ml-1925816750"></a>
### ANIM_WEAPON5

```ml
const ANIM_WEAPON5 = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L60)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon6-const-anim-weapon6-17-src-mq3-client-ui-controls-ml-988392319"></a>
### ANIM_WEAPON6

```ml
const ANIM_WEAPON6 = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L61)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon7-const-anim-weapon7-18-src-mq3-client-ui-controls-ml-2079139424"></a>
### ANIM_WEAPON7

```ml
const ANIM_WEAPON7 = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L62)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon8-const-anim-weapon8-19-src-mq3-client-ui-controls-ml-947520489"></a>
### ANIM_WEAPON8

```ml
const ANIM_WEAPON8 = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L63)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon9-const-anim-weapon9-20-src-mq3-client-ui-controls-ml-1886250735"></a>
### ANIM_WEAPON9

```ml
const ANIM_WEAPON9 = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L64)

<a id="constant-constant-mq3-client-ui-controls-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-controls-ml-2082843795"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L93)

<a id="constant-constant-mq3-client-ui-controls-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-controls-ml-1535942214"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L94)

<a id="constant-constant-mq3-client-ui-controls-art-framel-const-art-framel-menu-art-frame2-l-src-mq3-client-ui-controls-ml-1690810281"></a>
### ART_FRAMEL

```ml
const ART_FRAMEL = "menu/art/frame2_l"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L95)

<a id="constant-constant-mq3-client-ui-controls-art-framer-const-art-framer-menu-art-frame1-r-src-mq3-client-ui-controls-ml-854276416"></a>
### ART_FRAMER

```ml
const ART_FRAMER = "menu/art/frame1_r"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L96)

<a id="function-function-mq3-client-ui-controls-binding-function-binding-command-label-id-anim-key-src-mq3-client-ui-controls-ml-1177781452"></a>
### binding

```ml
function binding(command, label, id, anim, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L105)

- [mq3.client.ui_controls.Binding](Type-mq3-client-ui-controls-binding-845961953.md) — struct
<a id="constant-constant-mq3-client-ui-controls-both-death1-const-both-death1-0-src-mq3-client-ui-controls-ml-1271978141"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L80)

<a id="constant-constant-mq3-client-ui-controls-c-looking-const-c-looking-1-src-mq3-client-ui-controls-ml-1742747886"></a>
### C_LOOKING

```ml
const C_LOOKING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L15)

<a id="constant-constant-mq3-client-ui-controls-c-max-const-c-max-4-src-mq3-client-ui-controls-ml-1003014161"></a>
### C_MAX

```ml
const C_MAX = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L18)

<a id="constant-constant-mq3-client-ui-controls-c-misc-const-c-misc-3-src-mq3-client-ui-controls-ml-1933638318"></a>
### C_MISC

```ml
const C_MISC = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L17)

<a id="constant-constant-mq3-client-ui-controls-c-movement-const-c-movement-0-src-mq3-client-ui-controls-ml-149706709"></a>
### C_MOVEMENT

```ml
const C_MOVEMENT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L14)

<a id="constant-constant-mq3-client-ui-controls-c-weapons-const-c-weapons-2-src-mq3-client-ui-controls-ml-2039095015"></a>
### C_WEAPONS

```ml
const C_WEAPONS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L16)

<a id="function-function-mq3-client-ui-controls-cache-function-cache-state-src-mq3-client-ui-controls-ml-537414397"></a>
### cache

```ml
function cache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L258)

<a id="function-function-mq3-client-ui-controls-clamp-function-clamp-low-high-value-src-mq3-client-ui-controls-ml-945748625"></a>
### clamp

```ml
function clamp(low, high, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L129)

<a id="function-function-mq3-client-ui-controls-clean-function-clean-value-src-mq3-client-ui-controls-ml-1858138315"></a>
### clean

```ml
function clean(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L121)

- [mq3.client.ui_controls.Config](Type-mq3-client-ui-controls-config-1154710542.md) — struct
<a id="function-function-mq3-client-ui-controls-control-function-control-state-id-src-mq3-client-ui-controls-ml-268972004"></a>
### control

```ml
function control(state, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L130)

- [mq3.client.ui_controls.Control](Type-mq3-client-ui-controls-control-571295749.md) — struct
<a id="function-function-mq3-client-ui-controls-create-function-create-retailactive-src-mq3-client-ui-controls-ml-2069479601"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L116)

<a id="function-function-mq3-client-ui-controls-cvar-function-cvar-state-name-src-mq3-client-ui-controls-ml-1387760952"></a>
### cvar

```ml
function cvar(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L124)

<a id="function-function-mq3-client-ui-controls-defaultbindings-function-defaultbindings-src-mq3-client-ui-controls-ml-1620451344"></a>
### defaultBindings

```ml
function defaultBindings()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L106)

<a id="function-function-mq3-client-ui-controls-defaultcvar-function-defaultcvar-state-name-src-mq3-client-ui-controls-ml-1436391910"></a>
### defaultCvar

```ml
function defaultCvar(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L126)

- [mq3.client.ui_controls.DrawBinding](Type-mq3-client-ui-controls-drawbinding-1537378751.md) — struct
<a id="function-function-mq3-client-ui-controls-drawkeybinding-function-drawkeybinding-state-id-selected-src-mq3-client-ui-controls-ml-460180985"></a>
### drawKeyBinding

```ml
function drawKeyBinding(state, id, selected)
```

Controls_DrawKeyBinding / Controls_StatusBar / Controls_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `selected` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L187)

<a id="function-function-mq3-client-ui-controls-drawplayer-function-drawplayer-state-model-realtime-src-mq3-client-ui-controls-ml-874739111"></a>
### drawPlayer

```ml
function drawPlayer(state, model, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L191)

<a id="function-function-mq3-client-ui-controls-emit-function-emit-state-kind-name-text-value-number-src-mq3-client-ui-controls-ml-691546909"></a>
### emit

```ml
function emit(state, kind, name, text, value, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L119)

<a id="function-function-mq3-client-ui-controls-getconfig-function-getconfig-state-src-mq3-client-ui-controls-ml-865103517"></a>
### getConfig

```ml
function getConfig(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L195)

<a id="function-function-mq3-client-ui-controls-getcvardefault-function-getcvardefault-state-name-src-mq3-client-ui-controls-ml-1168677040"></a>
### getCvarDefault

```ml
function getCvarDefault(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L137)

<a id="function-function-mq3-client-ui-controls-getcvarvalue-function-getcvarvalue-state-name-src-mq3-client-ui-controls-ml-1578045352"></a>
### getCvarValue

```ml
function getCvarValue(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L138)

<a id="function-function-mq3-client-ui-controls-getkeyassignment-function-getkeyassignment-state-command-src-mq3-client-ui-controls-ml-731688608"></a>
### getKeyAssignment

```ml
function getKeyAssignment(state, command)
```

Controls_GetKeyAssignment / Controls_GetConfig

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L194)

<a id="function-function-mq3-client-ui-controls-groupfor-function-groupfor-id-src-mq3-client-ui-controls-ml-2001127413"></a>
### groupFor

```ml
function groupFor(id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L109)

<a id="function-function-mq3-client-ui-controls-groupids-function-groupids-section-src-mq3-client-ui-controls-ml-27572651"></a>
### groupIds

```ml
function groupIds(section)
```

Controls_Update

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `section` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L174)

<a id="constant-constant-mq3-client-ui-controls-id-alwaysrun-const-id-alwaysrun-36-src-mq3-client-ui-controls-ml-1685675542"></a>
### ID_ALWAYSRUN

```ml
const ID_ALWAYSRUN = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L29)

<a id="constant-constant-mq3-client-ui-controls-id-autoswitch-const-id-autoswitch-37-src-mq3-client-ui-controls-ml-1005566875"></a>
### ID_AUTOSWITCH

```ml
const ID_AUTOSWITCH = 37
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L30)

<a id="constant-constant-mq3-client-ui-controls-id-back-const-id-back-105-src-mq3-client-ui-controls-ml-1061503833"></a>
### ID_BACK

```ml
const ID_BACK = 105
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L24)

<a id="constant-constant-mq3-client-ui-controls-id-defaults-const-id-defaults-104-src-mq3-client-ui-controls-ml-818675766"></a>
### ID_DEFAULTS

```ml
const ID_DEFAULTS = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L23)

<a id="constant-constant-mq3-client-ui-controls-id-exit-const-id-exit-107-src-mq3-client-ui-controls-ml-1734816103"></a>
### ID_EXIT

```ml
const ID_EXIT = 107
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L26)

<a id="constant-constant-mq3-client-ui-controls-id-freelook-const-id-freelook-34-src-mq3-client-ui-controls-ml-1348366622"></a>
### ID_FREELOOK

```ml
const ID_FREELOOK = 34
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L27)

<a id="constant-constant-mq3-client-ui-controls-id-invertmouse-const-id-invertmouse-35-src-mq3-client-ui-controls-ml-368181825"></a>
### ID_INVERTMOUSE

```ml
const ID_INVERTMOUSE = 35
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L28)

<a id="constant-constant-mq3-client-ui-controls-id-joyenable-const-id-joyenable-39-src-mq3-client-ui-controls-ml-453665333"></a>
### ID_JOYENABLE

```ml
const ID_JOYENABLE = 39
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L32)

<a id="constant-constant-mq3-client-ui-controls-id-joythreshold-const-id-joythreshold-40-src-mq3-client-ui-controls-ml-1073087165"></a>
### ID_JOYTHRESHOLD

```ml
const ID_JOYTHRESHOLD = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L33)

<a id="constant-constant-mq3-client-ui-controls-id-looking-const-id-looking-101-src-mq3-client-ui-controls-ml-165119489"></a>
### ID_LOOKING

```ml
const ID_LOOKING = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L20)

<a id="constant-constant-mq3-client-ui-controls-id-misc-const-id-misc-103-src-mq3-client-ui-controls-ml-649133887"></a>
### ID_MISC

```ml
const ID_MISC = 103
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L22)

<a id="constant-constant-mq3-client-ui-controls-id-mousespeed-const-id-mousespeed-38-src-mq3-client-ui-controls-ml-1352664502"></a>
### ID_MOUSESPEED

```ml
const ID_MOUSESPEED = 38
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L31)

<a id="constant-constant-mq3-client-ui-controls-id-movement-const-id-movement-100-src-mq3-client-ui-controls-ml-1987189858"></a>
### ID_MOVEMENT

```ml
const ID_MOVEMENT = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L19)

<a id="constant-constant-mq3-client-ui-controls-id-saveandexit-const-id-saveandexit-106-src-mq3-client-ui-controls-ml-323098450"></a>
### ID_SAVEANDEXIT

```ml
const ID_SAVEANDEXIT = 106
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L25)

<a id="constant-constant-mq3-client-ui-controls-id-smoothmouse-const-id-smoothmouse-41-src-mq3-client-ui-controls-ml-928818510"></a>
### ID_SMOOTHMOUSE

```ml
const ID_SMOOTHMOUSE = 41
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L34)

<a id="constant-constant-mq3-client-ui-controls-id-weapons-const-id-weapons-102-src-mq3-client-ui-controls-ml-309877780"></a>
### ID_WEAPONS

```ml
const ID_WEAPONS = 102
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L21)

<a id="function-function-mq3-client-ui-controls-initcvars-function-initcvars-state-src-mq3-client-ui-controls-ml-1244282499"></a>
### initCvars

```ml
function initCvars(state)
```

Controls_InitCvars / Controls_GetCvarDefault / Controls_GetCvarValue

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L134)

<a id="function-function-mq3-client-ui-controls-initmodel-function-initmodel-state-src-mq3-client-ui-controls-ml-857081075"></a>
### initModel

```ml
function initModel(state)
```

Controls_InitModel / Controls_InitWeapons / Controls_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L256)

<a id="function-function-mq3-client-ui-controls-initweapons-function-initweapons-state-models-src-mq3-client-ui-controls-ml-1067609117"></a>
### initWeapons

```ml
function initWeapons(state, models)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `models` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L257)

<a id="constant-constant-mq3-client-ui-controls-k-backspace-const-k-backspace-127-src-mq3-client-ui-controls-ml-1510407697"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L39)

<a id="constant-constant-mq3-client-ui-controls-k-char-flag-const-k-char-flag-1024-src-mq3-client-ui-controls-ml-954671878"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L43)

<a id="constant-constant-mq3-client-ui-controls-k-del-const-k-del-140-src-mq3-client-ui-controls-ml-330699070"></a>
### K_DEL

```ml
const K_DEL = 140
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L40)

<a id="constant-constant-mq3-client-ui-controls-k-escape-const-k-escape-27-src-mq3-client-ui-controls-ml-746278614"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L38)

<a id="constant-constant-mq3-client-ui-controls-k-kp-del-const-k-kp-del-171-src-mq3-client-ui-controls-ml-2120440214"></a>
### K_KP_DEL

```ml
const K_KP_DEL = 171
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L41)

<a id="constant-constant-mq3-client-ui-controls-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-controls-ml-579089474"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L42)

<a id="constant-constant-mq3-client-ui-controls-legs-back-const-legs-back-16-src-mq3-client-ui-controls-ml-1699810126"></a>
### LEGS_BACK

```ml
const LEGS_BACK = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L73)

<a id="constant-constant-mq3-client-ui-controls-legs-idle-const-legs-idle-22-src-mq3-client-ui-controls-ml-2088282573"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L75)

<a id="constant-constant-mq3-client-ui-controls-legs-idlecr-const-legs-idlecr-23-src-mq3-client-ui-controls-ml-1855865906"></a>
### LEGS_IDLECR

```ml
const LEGS_IDLECR = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L76)

<a id="constant-constant-mq3-client-ui-controls-legs-jump-const-legs-jump-18-src-mq3-client-ui-controls-ml-1712102220"></a>
### LEGS_JUMP

```ml
const LEGS_JUMP = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L74)

<a id="constant-constant-mq3-client-ui-controls-legs-run-const-legs-run-15-src-mq3-client-ui-controls-ml-1593031651"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L72)

<a id="constant-constant-mq3-client-ui-controls-legs-walk-const-legs-walk-14-src-mq3-client-ui-controls-ml-1630739092"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L71)

<a id="function-function-mq3-client-ui-controls-makecontrols-function-makecontrols-src-mq3-client-ui-controls-ml-179801278"></a>
### makeControls

```ml
function makeControls()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L115)

<a id="function-function-mq3-client-ui-controls-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-controls-ml-473595728"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L248)

<a id="function-function-mq3-client-ui-controls-menuinit-function-menuinit-state-weaponmodels-src-mq3-client-ui-controls-ml-1784124899"></a>
### menuInit

```ml
function menuInit(state, weaponModels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponModels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L259)

<a id="function-function-mq3-client-ui-controls-menukey-function-menukey-state-key-src-mq3-client-ui-controls-ml-1644409406"></a>
### menuKey

```ml
function menuKey(state, key)
```

Controls_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L211)

<a id="function-function-mq3-client-ui-controls-pairget-function-pairget-pairs-name-fallback-src-mq3-client-ui-controls-ml-1459365682"></a>
### pairGet

```ml
function pairGet(pairs, name, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L122)

<a id="function-function-mq3-client-ui-controls-pairset-function-pairset-pairs-name-value-src-mq3-client-ui-controls-ml-1366110595"></a>
### pairSet

```ml
function pairSet(pairs, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L123)

<a id="constant-constant-mq3-client-ui-controls-qm-activated-const-qm-activated-3-src-mq3-client-ui-controls-ml-1826730742"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L37)

<a id="constant-constant-mq3-client-ui-controls-qm-gotfocus-const-qm-gotfocus-1-src-mq3-client-ui-controls-ml-2048206538"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L35)

<a id="constant-constant-mq3-client-ui-controls-qm-lostfocus-const-qm-lostfocus-2-src-mq3-client-ui-controls-ml-1891639279"></a>
### QM_LOSTFOCUS

```ml
const QM_LOSTFOCUS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L36)

<a id="function-function-mq3-client-ui-controls-resetdefaultsaction-function-resetdefaultsaction-state-result-src-mq3-client-ui-controls-ml-1435309696"></a>
### resetDefaultsAction

```ml
function resetDefaultsAction(state, result)
```

Reset/default confirmation and menu callbacks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L246)

<a id="function-function-mq3-client-ui-controls-resetdefaultsdraw-function-resetdefaultsdraw-state-src-mq3-client-ui-controls-ml-986159943"></a>
### resetDefaultsDraw

```ml
function resetDefaultsDraw(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L247)

<a id="function-function-mq3-client-ui-controls-same-function-same-a-b-src-mq3-client-ui-controls-ml-513879911"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L120)

<a id="constant-constant-mq3-client-ui-controls-save-cancel-const-save-cancel-3-src-mq3-client-ui-controls-ml-1491988544"></a>
### SAVE_CANCEL

```ml
const SAVE_CANCEL = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L13)

<a id="constant-constant-mq3-client-ui-controls-save-no-const-save-no-2-src-mq3-client-ui-controls-ml-9342415"></a>
### SAVE_NO

```ml
const SAVE_NO = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L12)

<a id="constant-constant-mq3-client-ui-controls-save-noop-const-save-noop-0-src-mq3-client-ui-controls-ml-1055282757"></a>
### SAVE_NOOP

```ml
const SAVE_NOOP = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L10)

<a id="constant-constant-mq3-client-ui-controls-save-yes-const-save-yes-1-src-mq3-client-ui-controls-ml-683671386"></a>
### SAVE_YES

```ml
const SAVE_YES = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L11)

<a id="function-function-mq3-client-ui-controls-setconfig-function-setconfig-state-src-mq3-client-ui-controls-ml-525561885"></a>
### setConfig

```ml
function setConfig(state)
```

Controls_SetConfig / Controls_SetDefaults

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L202)

<a id="function-function-mq3-client-ui-controls-setcvar-function-setcvar-state-name-value-src-mq3-client-ui-controls-ml-1644879759"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L125)

<a id="function-function-mq3-client-ui-controls-setdefaults-function-setdefaults-state-src-mq3-client-ui-controls-ml-1046820797"></a>
### setDefaults

```ml
function setDefaults(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L206)

<a id="function-function-mq3-client-ui-controls-setkey-function-setkey-state-key-command-src-mq3-client-ui-controls-ml-584065069"></a>
### setKey

```ml
function setKey(state, key, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L199)

<a id="function-function-mq3-client-ui-controls-setsetting-function-setsetting-state-name-value-src-mq3-client-ui-controls-ml-1317119595"></a>
### setSetting

```ml
function setSetting(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L128)

<a id="function-function-mq3-client-ui-controls-setting-function-setting-state-name-src-mq3-client-ui-controls-ml-1765121348"></a>
### setting

```ml
function setting(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L127)

- [mq3.client.ui_controls.State](Type-mq3-client-ui-controls-state-1669080757.md) — struct
<a id="function-function-mq3-client-ui-controls-statusbar-function-statusbar-state-src-mq3-client-ui-controls-ml-656597527"></a>
### statusBar

```ml
function statusBar(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L190)

<a id="constant-constant-mq3-client-ui-controls-torso-attack-const-torso-attack-7-src-mq3-client-ui-controls-ml-365938690"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L78)

<a id="constant-constant-mq3-client-ui-controls-torso-gesture-const-torso-gesture-6-src-mq3-client-ui-controls-ml-654062427"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L77)

<a id="constant-constant-mq3-client-ui-controls-torso-stand-const-torso-stand-11-src-mq3-client-ui-controls-ml-929473579"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L79)

<a id="function-function-mq3-client-ui-controls-uicontrolsmenu-function-uicontrolsmenu-state-weaponmodels-src-mq3-client-ui-controls-ml-1645420767"></a>
### uiControlsMenu

```ml
function uiControlsMenu(state, weaponModels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponModels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L262)

<a id="function-function-mq3-client-ui-controls-update-function-update-state-src-mq3-client-ui-controls-ml-1377515401"></a>
### update

```ml
function update(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L180)

<a id="function-function-mq3-client-ui-controls-updatemodel-function-updatemodel-state-anim-src-mq3-client-ui-controls-ml-1253399758"></a>
### updateModel

```ml
function updateModel(state, anim)
```

Controls_UpdateModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L141)

<a id="constant-constant-mq3-client-ui-controls-wp-bfg-const-wp-bfg-9-src-mq3-client-ui-controls-ml-1514592122"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L90)

<a id="constant-constant-mq3-client-ui-controls-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-ui-controls-ml-425554390"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L82)

<a id="constant-constant-mq3-client-ui-controls-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-ui-controls-ml-397134376"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L91)

<a id="constant-constant-mq3-client-ui-controls-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-ui-controls-ml-422843501"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L85)

<a id="constant-constant-mq3-client-ui-controls-wp-lightning-const-wp-lightning-6-src-mq3-client-ui-controls-ml-2085406741"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L87)

<a id="constant-constant-mq3-client-ui-controls-wp-machinegun-const-wp-machinegun-2-src-mq3-client-ui-controls-ml-1286468583"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L83)

<a id="constant-constant-mq3-client-ui-controls-wp-none-const-wp-none-0-src-mq3-client-ui-controls-ml-1192453169"></a>
### WP_NONE

```ml
const WP_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L81)

<a id="constant-constant-mq3-client-ui-controls-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-ui-controls-ml-1893801275"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L89)

<a id="constant-constant-mq3-client-ui-controls-wp-railgun-const-wp-railgun-7-src-mq3-client-ui-controls-ml-1784772394"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L88)

<a id="constant-constant-mq3-client-ui-controls-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-ui-controls-ml-683890142"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L86)

<a id="constant-constant-mq3-client-ui-controls-wp-shotgun-const-wp-shotgun-3-src-mq3-client-ui-controls-ml-243150630"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L84)
