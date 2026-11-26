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

Evaluates UI controls `actionBinding` and returns `state.bindings[id]`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.bindings`. |
| `id` | `dynamic` | — | Value used by `if id>=0 and id<len(state.bindings) then return state.bindings[id] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L427)

<a id="function-function-mq3-client-ui-controls-actionevent-function-actionevent-state-id-event-src-mq3-client-ui-controls-ml-1811433826"></a>
### actionEvent

```ml
function actionEvent(state, id, event)
```

Updates `state.waitingForKey`, `state.cursorId` during UI controls `actionEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.waitingForKey`, `state.cursorId`. |
| `id` | `dynamic` | — | Value assigned to `state.cursorId`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L595)

<a id="constant-constant-mq3-client-ui-controls-anim-attack-const-anim-attack-22-src-mq3-client-ui-controls-ml-804918509"></a>
### ANIM_ATTACK

```ml
const ANIM_ATTACK = 22
```

Controls-menu player-preview selector for the attack animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L125)

<a id="constant-constant-mq3-client-ui-controls-anim-back-const-anim-back-3-src-mq3-client-ui-controls-ml-1508711172"></a>
### ANIM_BACK

```ml
const ANIM_BACK = 3
```

Controls-menu player-preview selector for the back animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L87)

<a id="constant-constant-mq3-client-ui-controls-anim-chat-const-anim-chat-25-src-mq3-client-ui-controls-ml-1636348900"></a>
### ANIM_CHAT

```ml
const ANIM_CHAT = 25
```

Controls-menu player-preview selector for the chat animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L131)

<a id="constant-constant-mq3-client-ui-controls-anim-crouch-const-anim-crouch-5-src-mq3-client-ui-controls-ml-165245474"></a>
### ANIM_CROUCH

```ml
const ANIM_CROUCH = 5
```

Controls-menu player-preview selector for the crouch animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L91)

<a id="constant-constant-mq3-client-ui-controls-anim-die-const-anim-die-24-src-mq3-client-ui-controls-ml-331818093"></a>
### ANIM_DIE

```ml
const ANIM_DIE = 24
```

Controls-menu player-preview selector for the die animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L129)

<a id="constant-constant-mq3-client-ui-controls-anim-gesture-const-anim-gesture-23-src-mq3-client-ui-controls-ml-1480270642"></a>
### ANIM_GESTURE

```ml
const ANIM_GESTURE = 23
```

Controls-menu player-preview selector for the gesture animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L127)

<a id="constant-constant-mq3-client-ui-controls-anim-idle-const-anim-idle-0-src-mq3-client-ui-controls-ml-511519237"></a>
### ANIM_IDLE

```ml
const ANIM_IDLE = 0
```

Controls-menu player-preview selector for the idle animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L81)

<a id="constant-constant-mq3-client-ui-controls-anim-jump-const-anim-jump-4-src-mq3-client-ui-controls-ml-2049239157"></a>
### ANIM_JUMP

```ml
const ANIM_JUMP = 4
```

Controls-menu player-preview selector for the jump animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L89)

<a id="constant-constant-mq3-client-ui-controls-anim-lookdown-const-anim-lookdown-11-src-mq3-client-ui-controls-ml-141320295"></a>
### ANIM_LOOKDOWN

```ml
const ANIM_LOOKDOWN = 11
```

Controls-menu player-preview selector for the lookdown animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L103)

<a id="constant-constant-mq3-client-ui-controls-anim-lookup-const-anim-lookup-10-src-mq3-client-ui-controls-ml-1771105120"></a>
### ANIM_LOOKUP

```ml
const ANIM_LOOKUP = 10
```

Controls-menu player-preview selector for the lookup animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L101)

<a id="constant-constant-mq3-client-ui-controls-anim-run-const-anim-run-1-src-mq3-client-ui-controls-ml-1381691334"></a>
### ANIM_RUN

```ml
const ANIM_RUN = 1
```

Controls-menu player-preview selector for the run animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L83)

<a id="constant-constant-mq3-client-ui-controls-anim-stepleft-const-anim-stepleft-6-src-mq3-client-ui-controls-ml-1037600691"></a>
### ANIM_STEPLEFT

```ml
const ANIM_STEPLEFT = 6
```

Controls-menu player-preview selector for the stepleft animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L93)

<a id="constant-constant-mq3-client-ui-controls-anim-stepright-const-anim-stepright-7-src-mq3-client-ui-controls-ml-1307348118"></a>
### ANIM_STEPRIGHT

```ml
const ANIM_STEPRIGHT = 7
```

Controls-menu player-preview selector for the stepright animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L95)

<a id="constant-constant-mq3-client-ui-controls-anim-turnleft-const-anim-turnleft-8-src-mq3-client-ui-controls-ml-1962499573"></a>
### ANIM_TURNLEFT

```ml
const ANIM_TURNLEFT = 8
```

Controls-menu player-preview selector for the turnleft animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L97)

<a id="constant-constant-mq3-client-ui-controls-anim-turnright-const-anim-turnright-9-src-mq3-client-ui-controls-ml-2046809770"></a>
### ANIM_TURNRIGHT

```ml
const ANIM_TURNRIGHT = 9
```

Controls-menu player-preview selector for the turnright animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L99)

<a id="constant-constant-mq3-client-ui-controls-anim-walk-const-anim-walk-2-src-mq3-client-ui-controls-ml-222117943"></a>
### ANIM_WALK

```ml
const ANIM_WALK = 2
```

Controls-menu player-preview selector for the walk animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L85)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon1-const-anim-weapon1-12-src-mq3-client-ui-controls-ml-18953274"></a>
### ANIM_WEAPON1

```ml
const ANIM_WEAPON1 = 12
```

Controls-menu player-preview selector for the weapon1 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L105)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon10-const-anim-weapon10-21-src-mq3-client-ui-controls-ml-1009417376"></a>
### ANIM_WEAPON10

```ml
const ANIM_WEAPON10 = 21
```

Controls-menu player-preview selector for the weapon10 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L123)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon2-const-anim-weapon2-13-src-mq3-client-ui-controls-ml-1410801483"></a>
### ANIM_WEAPON2

```ml
const ANIM_WEAPON2 = 13
```

Controls-menu player-preview selector for the weapon2 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L107)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon3-const-anim-weapon3-14-src-mq3-client-ui-controls-ml-1185373932"></a>
### ANIM_WEAPON3

```ml
const ANIM_WEAPON3 = 14
```

Controls-menu player-preview selector for the weapon3 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L109)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon4-const-anim-weapon4-15-src-mq3-client-ui-controls-ml-1671965093"></a>
### ANIM_WEAPON4

```ml
const ANIM_WEAPON4 = 15
```

Controls-menu player-preview selector for the weapon4 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L111)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon5-const-anim-weapon5-16-src-mq3-client-ui-controls-ml-1925816750"></a>
### ANIM_WEAPON5

```ml
const ANIM_WEAPON5 = 16
```

Controls-menu player-preview selector for the weapon5 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L113)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon6-const-anim-weapon6-17-src-mq3-client-ui-controls-ml-988392319"></a>
### ANIM_WEAPON6

```ml
const ANIM_WEAPON6 = 17
```

Controls-menu player-preview selector for the weapon6 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L115)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon7-const-anim-weapon7-18-src-mq3-client-ui-controls-ml-2079139424"></a>
### ANIM_WEAPON7

```ml
const ANIM_WEAPON7 = 18
```

Controls-menu player-preview selector for the weapon7 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L117)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon8-const-anim-weapon8-19-src-mq3-client-ui-controls-ml-947520489"></a>
### ANIM_WEAPON8

```ml
const ANIM_WEAPON8 = 19
```

Controls-menu player-preview selector for the weapon8 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L119)

<a id="constant-constant-mq3-client-ui-controls-anim-weapon9-const-anim-weapon9-20-src-mq3-client-ui-controls-ml-1886250735"></a>
### ANIM_WEAPON9

```ml
const ANIM_WEAPON9 = 20
```

Controls-menu player-preview selector for the weapon9 animation or weapon pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L121)

<a id="constant-constant-mq3-client-ui-controls-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-controls-ml-2082843795"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```

Virtual shader or image asset name used for the menu's back0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L177)

<a id="constant-constant-mq3-client-ui-controls-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-controls-ml-1535942214"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```

Virtual shader or image asset name used for the menu's back1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L179)

<a id="constant-constant-mq3-client-ui-controls-art-framel-const-art-framel-menu-art-frame2-l-src-mq3-client-ui-controls-ml-1690810281"></a>
### ART_FRAMEL

```ml
const ART_FRAMEL = "menu/art/frame2_l"
```

Virtual shader or image asset name used for the menu's framel artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L181)

<a id="constant-constant-mq3-client-ui-controls-art-framer-const-art-framer-menu-art-frame1-r-src-mq3-client-ui-controls-ml-854276416"></a>
### ART_FRAMER

```ml
const ART_FRAMER = "menu/art/frame1_r"
```

Virtual shader or image asset name used for the menu's framer artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L183)

<a id="function-function-mq3-client-ui-controls-binding-function-binding-command-label-id-anim-key-src-mq3-client-ui-controls-ml-1177781452"></a>
### binding

```ml
function binding(command, label, id, anim, key)
```

Creates a `mq3.client.ui_controls.Binding` record. Assigns `command` from `command`, `label` from `label`, `id` from `id`, `anim` from `anim`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — | Value used to initialize `Binding.command`. |
| `label` | `dynamic` | — | Value used to initialize `Binding.label`. |
| `id` | `dynamic` | — | Value used to initialize `Binding.id`. |
| `anim` | `dynamic` | — | Value used to initialize `Binding.anim`. |
| `key` | `dynamic` | — | Value used to initialize `Binding.default1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L348)

- [mq3.client.ui_controls.Binding](Type-mq3-client-ui-controls-binding-845961953.md) — struct
<a id="constant-constant-mq3-client-ui-controls-both-death1-const-both-death1-0-src-mq3-client-ui-controls-ml-1271978141"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```

Native whole-body animation slot for the death1 sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L152)

<a id="constant-constant-mq3-client-ui-controls-c-looking-const-c-looking-1-src-mq3-client-ui-controls-ml-1742747886"></a>
### C_LOOKING

```ml
const C_LOOKING = 1
```

Controls-menu category grouping the looking bindings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L21)

<a id="constant-constant-mq3-client-ui-controls-c-max-const-c-max-4-src-mq3-client-ui-controls-ml-1003014161"></a>
### C_MAX

```ml
const C_MAX = 4
```

Number of controls-menu categories, used to bound category-indexed tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L27)

<a id="constant-constant-mq3-client-ui-controls-c-misc-const-c-misc-3-src-mq3-client-ui-controls-ml-1933638318"></a>
### C_MISC

```ml
const C_MISC = 3
```

Controls-menu category grouping the misc bindings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L25)

<a id="constant-constant-mq3-client-ui-controls-c-movement-const-c-movement-0-src-mq3-client-ui-controls-ml-149706709"></a>
### C_MOVEMENT

```ml
const C_MOVEMENT = 0
```

Controls-menu category grouping the movement bindings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L19)

<a id="constant-constant-mq3-client-ui-controls-c-weapons-const-c-weapons-2-src-mq3-client-ui-controls-ml-2039095015"></a>
### C_WEAPONS

```ml
const C_WEAPONS = 2
```

Controls-menu category grouping the weapons bindings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L23)

<a id="function-function-mq3-client-ui-controls-cache-function-cache-state-src-mq3-client-ui-controls-ml-537414397"></a>
### cache

```ml
function cache(state)
```

Updates `state.cached` during UI controls `cache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L606)

<a id="function-function-mq3-client-ui-controls-clamp-function-clamp-low-high-value-src-mq3-client-ui-controls-ml-945748625"></a>
### clamp

```ml
function clamp(low, high, value)
```

Clamps `low` to the inclusive bounds `high` and `value` for UI controls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L419)

<a id="function-function-mq3-client-ui-controls-clean-function-clean-value-src-mq3-client-ui-controls-ml-1858138315"></a>
### clean

```ml
function clean(value)
```

Evaluates UI controls `clean` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[at]`, `value[at+1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L382)

- [mq3.client.ui_controls.Config](Type-mq3-client-ui-controls-config-1154710542.md) — struct
<a id="function-function-mq3-client-ui-controls-control-function-control-state-id-src-mq3-client-ui-controls-ml-268972004"></a>
### control

```ml
function control(state, id)
```

Evaluates UI controls `control` and returns `state.controls[id]`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.controls`. |
| `id` | `dynamic` | — | Value used by `if id>=0 and id<len(state.controls) then return state.controls[id] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L423)

- [mq3.client.ui_controls.Control](Type-mq3-client-ui-controls-control-571295749.md) — struct
<a id="function-function-mq3-client-ui-controls-create-function-create-retailactive-src-mq3-client-ui-controls-ml-2069479601"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_controls.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L365)

<a id="function-function-mq3-client-ui-controls-cvar-function-cvar-state-name-src-mq3-client-ui-controls-ml-1387760952"></a>
### cvar

```ml
function cvar(state, name)
```

Adapts `mq3.client.ui_controls.pairGet` to UI controls `cvar`, returning its result for `state.cvarValues, name, "0"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvarValues`. |
| `name` | `dynamic` | — | Argument 2 of `mq3.client.ui_controls.pairGet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L396)

<a id="function-function-mq3-client-ui-controls-defaultbindings-function-defaultbindings-src-mq3-client-ui-controls-ml-1620451344"></a>
### defaultBindings

```ml
function defaultBindings()
```

Builds the UI controls `defaultBindings` sequence from `[binding("+scores","show scores",0,ANIM_IDLE,9),binding("+button2","use item",1,ANIM_IDLE,13),binding("+speed","run / walk",2,ANIM_RUN,138),binding("+forward","walk forward",3,ANIM_WALK,132),bindin...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L350)

<a id="function-function-mq3-client-ui-controls-defaultcvar-function-defaultcvar-state-name-src-mq3-client-ui-controls-ml-1436391910"></a>
### defaultCvar

```ml
function defaultCvar(state, name)
```

Adapts `mq3.client.ui_controls.pairGet` to UI controls `defaultCvar`, returning its result for `state.cvarDefaults, name, "0"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvarDefaults`. |
| `name` | `dynamic` | — | Argument 2 of `mq3.client.ui_controls.pairGet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L405)

- [mq3.client.ui_controls.DrawBinding](Type-mq3-client-ui-controls-drawbinding-1537378751.md) — struct
<a id="function-function-mq3-client-ui-controls-drawkeybinding-function-drawkeybinding-state-id-selected-src-mq3-client-ui-controls-ml-460180985"></a>
### drawKeyBinding

```ml
function drawKeyBinding(state, id, selected)
```

Controls_DrawKeyBinding / Controls_StatusBar / Controls_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.waitingForKey`. |
| `id` | `dynamic` | — | Value used by `item=actionBinding(state,id)`. |
| `selected` | `dynamic` | — | Value used by `if item==void then return DrawBinding("","???",selected,true,state.waitingForKey) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L498)

<a id="function-function-mq3-client-ui-controls-drawplayer-function-drawplayer-state-model-realtime-src-mq3-client-ui-controls-ml-874739111"></a>
### drawPlayer

```ml
function drawPlayer(state, model, realtime)
```

Updates `state.playerModel` during UI controls `drawPlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.playerModel`. |
| `model` | `dynamic` | — | Value assigned to `state.playerModel`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L508)

<a id="function-function-mq3-client-ui-controls-emit-function-emit-state-kind-name-text-value-number-src-mq3-client-ui-controls-ml-691546909"></a>
### emit

```ml
function emit(state, kind, name, text, value, number)
```

Appends a UI controls action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI controls path. |
| `value` | `dynamic` | — | Value used by `item=Action("ui-controls",kind,name,text,value,number,not state.retailActive)`. |
| `number` | `dynamic` | — | Value used by `item=Action("ui-controls",kind,name,text,value,number,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L375)

<a id="function-function-mq3-client-ui-controls-getconfig-function-getconfig-state-src-mq3-client-ui-controls-ml-865103517"></a>
### getConfig

```ml
function getConfig(state)
```

Calls `mq3.client.ui_controls.getKeyAssignment`, `mq3.client.ui_controls.setSetting`, `mq3.client.ui_controls.getCvarValue` and additional helpers from UI controls `getConfig`. The final path returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L516)

<a id="function-function-mq3-client-ui-controls-getcvardefault-function-getcvardefault-state-name-src-mq3-client-ui-controls-ml-1168677040"></a>
### getCvarDefault

```ml
function getCvarDefault(state, name)
```

Evaluates UI controls `getCvarDefault` and returns `item.defaultValue`, `0.0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.configs`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L437)

<a id="function-function-mq3-client-ui-controls-getcvarvalue-function-getcvarvalue-state-name-src-mq3-client-ui-controls-ml-1578045352"></a>
### getCvarValue

```ml
function getCvarValue(state, name)
```

Evaluates UI controls `getCvarValue` and returns `item.value`, `0.0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.configs`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L441)

<a id="function-function-mq3-client-ui-controls-getkeyassignment-function-getkeyassignment-state-command-src-mq3-client-ui-controls-ml-731688608"></a>
### getKeyAssignment

```ml
function getKeyAssignment(state, command)
```

Controls_GetKeyAssignment / Controls_GetConfig

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyState`. |
| `command` | `dynamic` | — | Value used by `if value!="" and same(value,command) then result[count]=key`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L513)

<a id="function-function-mq3-client-ui-controls-groupfor-function-groupfor-id-src-mq3-client-ui-controls-ml-2001127413"></a>
### groupFor

```ml
function groupFor(id)
```

Evaluates UI controls `groupFor` and returns `C_MOVEMENT`, `C_LOOKING`, `C_WEAPONS` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used by `if id==ID_ALWAYSRUN or (id>=2 and id<=11) then return C_MOVEMENT end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L355)

<a id="function-function-mq3-client-ui-controls-groupids-function-groupids-section-src-mq3-client-ui-controls-ml-27572651"></a>
### groupIds

```ml
function groupIds(section)
```

Controls_Update

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `section` | `dynamic` | — | Value used by `if section==C_MOVEMENT then return [36,2,3,4,5,6,7,8,9,10,11] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L480)

<a id="constant-constant-mq3-client-ui-controls-id-alwaysrun-const-id-alwaysrun-36-src-mq3-client-ui-controls-ml-1685675542"></a>
### ID_ALWAYSRUN

```ml
const ID_ALWAYSRUN = 36
```

Menu control identifier routed to the alwaysrun action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L50)

<a id="constant-constant-mq3-client-ui-controls-id-autoswitch-const-id-autoswitch-37-src-mq3-client-ui-controls-ml-1005566875"></a>
### ID_AUTOSWITCH

```ml
const ID_AUTOSWITCH = 37
```

Menu control identifier routed to the autoswitch action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L52)

<a id="constant-constant-mq3-client-ui-controls-id-back-const-id-back-105-src-mq3-client-ui-controls-ml-1061503833"></a>
### ID_BACK

```ml
const ID_BACK = 105
```

Event identifier of the Back control used to leave the controls and key-bindings menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L40)

<a id="constant-constant-mq3-client-ui-controls-id-defaults-const-id-defaults-104-src-mq3-client-ui-controls-ml-818675766"></a>
### ID_DEFAULTS

```ml
const ID_DEFAULTS = 104
```

Menu control identifier routed to the defaults action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L37)

<a id="constant-constant-mq3-client-ui-controls-id-exit-const-id-exit-107-src-mq3-client-ui-controls-ml-1734816103"></a>
### ID_EXIT

```ml
const ID_EXIT = 107
```

Menu control identifier routed to the exit action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L44)

<a id="constant-constant-mq3-client-ui-controls-id-freelook-const-id-freelook-34-src-mq3-client-ui-controls-ml-1348366622"></a>
### ID_FREELOOK

```ml
const ID_FREELOOK = 34
```

Menu control identifier routed to the freelook action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L46)

<a id="constant-constant-mq3-client-ui-controls-id-invertmouse-const-id-invertmouse-35-src-mq3-client-ui-controls-ml-368181825"></a>
### ID_INVERTMOUSE

```ml
const ID_INVERTMOUSE = 35
```

Menu control identifier routed to the invertmouse action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L48)

<a id="constant-constant-mq3-client-ui-controls-id-joyenable-const-id-joyenable-39-src-mq3-client-ui-controls-ml-453665333"></a>
### ID_JOYENABLE

```ml
const ID_JOYENABLE = 39
```

Menu control identifier routed to the joyenable action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L56)

<a id="constant-constant-mq3-client-ui-controls-id-joythreshold-const-id-joythreshold-40-src-mq3-client-ui-controls-ml-1073087165"></a>
### ID_JOYTHRESHOLD

```ml
const ID_JOYTHRESHOLD = 40
```

Menu control identifier routed to the joythreshold action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L58)

<a id="constant-constant-mq3-client-ui-controls-id-looking-const-id-looking-101-src-mq3-client-ui-controls-ml-165119489"></a>
### ID_LOOKING

```ml
const ID_LOOKING = 101
```

Menu control identifier routed to the looking action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L31)

<a id="constant-constant-mq3-client-ui-controls-id-misc-const-id-misc-103-src-mq3-client-ui-controls-ml-649133887"></a>
### ID_MISC

```ml
const ID_MISC = 103
```

Menu control identifier routed to the misc action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L35)

<a id="constant-constant-mq3-client-ui-controls-id-mousespeed-const-id-mousespeed-38-src-mq3-client-ui-controls-ml-1352664502"></a>
### ID_MOUSESPEED

```ml
const ID_MOUSESPEED = 38
```

Menu control identifier routed to the mousespeed action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L54)

<a id="constant-constant-mq3-client-ui-controls-id-movement-const-id-movement-100-src-mq3-client-ui-controls-ml-1987189858"></a>
### ID_MOVEMENT

```ml
const ID_MOVEMENT = 100
```

Menu control identifier routed to the movement action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L29)

<a id="constant-constant-mq3-client-ui-controls-id-saveandexit-const-id-saveandexit-106-src-mq3-client-ui-controls-ml-323098450"></a>
### ID_SAVEANDEXIT

```ml
const ID_SAVEANDEXIT = 106
```

Menu control identifier routed to the saveandexit action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L42)

<a id="constant-constant-mq3-client-ui-controls-id-smoothmouse-const-id-smoothmouse-41-src-mq3-client-ui-controls-ml-928818510"></a>
### ID_SMOOTHMOUSE

```ml
const ID_SMOOTHMOUSE = 41
```

Menu control identifier routed to the smoothmouse action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L60)

<a id="constant-constant-mq3-client-ui-controls-id-weapons-const-id-weapons-102-src-mq3-client-ui-controls-ml-309877780"></a>
### ID_WEAPONS

```ml
const ID_WEAPONS = 102
```

Menu control identifier routed to the weapons action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L33)

<a id="function-function-mq3-client-ui-controls-initcvars-function-initcvars-state-src-mq3-client-ui-controls-ml-1244282499"></a>
### initCvars

```ml
function initCvars(state)
```

Controls_InitCvars / Controls_GetCvarDefault / Controls_GetCvarValue

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.configs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L431)

<a id="function-function-mq3-client-ui-controls-initmodel-function-initmodel-state-src-mq3-client-ui-controls-ml-857081075"></a>
### initModel

```ml
function initModel(state)
```

Controls_InitModel / Controls_InitWeapons / Controls_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.playerModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L599)

<a id="function-function-mq3-client-ui-controls-initweapons-function-initweapons-state-models-src-mq3-client-ui-controls-ml-1067609117"></a>
### initWeapons

```ml
function initWeapons(state, models)
```

Updates `state.weaponModels` during UI controls `initWeapons`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.weaponModels`. |
| `models` | `dynamic` | — | Value used by `for each model in models state.weaponModels=state.weaponModels+[model]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L603)

<a id="constant-constant-mq3-client-ui-controls-k-backspace-const-k-backspace-127-src-mq3-client-ui-controls-ml-1510407697"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```

Engine key code for the backspace input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L71)

<a id="constant-constant-mq3-client-ui-controls-k-char-flag-const-k-char-flag-1024-src-mq3-client-ui-controls-ml-954671878"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = 1024
```

Engine key code for the char flag input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L79)

<a id="constant-constant-mq3-client-ui-controls-k-del-const-k-del-140-src-mq3-client-ui-controls-ml-330699070"></a>
### K_DEL

```ml
const K_DEL = 140
```

Engine key code for the del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L73)

<a id="constant-constant-mq3-client-ui-controls-k-escape-const-k-escape-27-src-mq3-client-ui-controls-ml-746278614"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```

Engine key code for the escape input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L69)

<a id="constant-constant-mq3-client-ui-controls-k-kp-del-const-k-kp-del-171-src-mq3-client-ui-controls-ml-2120440214"></a>
### K_KP_DEL

```ml
const K_KP_DEL = 171
```

Engine key code for the kp del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L75)

<a id="constant-constant-mq3-client-ui-controls-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-controls-ml-579089474"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L77)

<a id="constant-constant-mq3-client-ui-controls-legs-back-const-legs-back-16-src-mq3-client-ui-controls-ml-1699810126"></a>
### LEGS_BACK

```ml
const LEGS_BACK = 16
```

Native lower-body animation slot for the back sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L138)

<a id="constant-constant-mq3-client-ui-controls-legs-idle-const-legs-idle-22-src-mq3-client-ui-controls-ml-2088282573"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```

Native lower-body animation slot for the idle sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L142)

<a id="constant-constant-mq3-client-ui-controls-legs-idlecr-const-legs-idlecr-23-src-mq3-client-ui-controls-ml-1855865906"></a>
### LEGS_IDLECR

```ml
const LEGS_IDLECR = 23
```

Native lower-body animation slot for the idlecr sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L144)

<a id="constant-constant-mq3-client-ui-controls-legs-jump-const-legs-jump-18-src-mq3-client-ui-controls-ml-1712102220"></a>
### LEGS_JUMP

```ml
const LEGS_JUMP = 18
```

Native lower-body animation slot for the jump sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L140)

<a id="constant-constant-mq3-client-ui-controls-legs-run-const-legs-run-15-src-mq3-client-ui-controls-ml-1593031651"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```

Native lower-body animation slot for the run sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L136)

<a id="constant-constant-mq3-client-ui-controls-legs-walk-const-legs-walk-14-src-mq3-client-ui-controls-ml-1630739092"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```

Native lower-body animation slot for the walk sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L134)

<a id="function-function-mq3-client-ui-controls-makecontrols-function-makecontrols-src-mq3-client-ui-controls-ml-179801278"></a>
### makeControls

```ml
function makeControls()
```

Calls `mq3.client.ui_controls.Control`, `mq3.client.ui_controls.groupFor` from UI controls `makeControls`. The final path returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L362)

<a id="function-function-mq3-client-ui-controls-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-controls-ml-473595728"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

Updates `state.section`, `state.menuEvents`, `state.changesMade` during UI controls `menuEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.section`, `state.menuEvents`, `state.changesMade`. |
| `id` | `dynamic` | — | Value used by `if id==ID_MOVEMENT then state.section=C_MOVEMENT`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L586)

<a id="function-function-mq3-client-ui-controls-menuinit-function-menuinit-state-weaponmodels-src-mq3-client-ui-controls-ml-1784124899"></a>
### menuInit

```ml
function menuInit(state, weaponModels)
```

Updates `state.bindings`, `state.controls`, `state.section`, `state.waitingForKey` and additional values during UI controls `menuInit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.bindings`, `state.controls`, `state.section`, `state.waitingForKey` and additional values. |
| `weaponModels` | `dynamic` | — | Value used by `initWeapons(state,weaponModels)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L610)

<a id="function-function-mq3-client-ui-controls-menukey-function-menukey-state-key-src-mq3-client-ui-controls-ml-1644409406"></a>
### menuKey

```ml
function menuKey(state, key)
```

Controls_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.waitingForKey`, `state.changesMade`. |
| `key` | `dynamic` | — | Value assigned to `item.bind1`, `item.bind2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L541)

<a id="function-function-mq3-client-ui-controls-pairget-function-pairget-pairs-name-fallback-src-mq3-client-ui-controls-ml-1459365682"></a>
### pairGet

```ml
function pairGet(pairs, name, fallback)
```

Evaluates UI controls `pairGet` and returns `pair[1]`, `fallback` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — | Value used by `for each pair in pairs if pair[0]==name then return pair[1] end if end for`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |
| `fallback` | `dynamic` | — | Value used by `return fallback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L387)

<a id="function-function-mq3-client-ui-controls-pairset-function-pairset-pairs-name-value-src-mq3-client-ui-controls-ml-1366110595"></a>
### pairSet

```ml
function pairSet(pairs, name, value)
```

Evaluates UI controls `pairSet` and returns `result+[[name,value]]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairs` | `dynamic` | — | Value used by `for each pair in pairs if pair[0]!=name then result=result+[pair] end if end for`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |
| `value` | `dynamic` | — | Value used by `return result+[[name,value]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L392)

<a id="constant-constant-mq3-client-ui-controls-qm-activated-const-qm-activated-3-src-mq3-client-ui-controls-ml-1826730742"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the controls and key-bindings menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L67)

<a id="constant-constant-mq3-client-ui-controls-qm-gotfocus-const-qm-gotfocus-1-src-mq3-client-ui-controls-ml-2048206538"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = 1
```

Menu callback event reporting that the item was gotfocus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L62)

<a id="constant-constant-mq3-client-ui-controls-qm-lostfocus-const-qm-lostfocus-2-src-mq3-client-ui-controls-ml-1891639279"></a>
### QM_LOSTFOCUS

```ml
const QM_LOSTFOCUS = 2
```

Menu callback event reporting that the item was lostfocus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L64)

<a id="function-function-mq3-client-ui-controls-resetdefaultsaction-function-resetdefaultsaction-state-result-src-mq3-client-ui-controls-ml-1435309696"></a>
### resetDefaultsAction

```ml
function resetDefaultsAction(state, result)
```

Reset/default confirmation and menu callbacks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.changesMade`. |
| `result` | `dynamic` | — | Value used by `if not result then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L578)

<a id="function-function-mq3-client-ui-controls-resetdefaultsdraw-function-resetdefaultsdraw-state-src-mq3-client-ui-controls-ml-986159943"></a>
### resetDefaultsDraw

```ml
function resetDefaultsDraw(state)
```

Calls `mq3.client.ui_controls.emit` from UI controls `resetDefaultsDraw`. The final path returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI controls state passed to the helper calls in `resetDefaultsDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L581)

<a id="function-function-mq3-client-ui-controls-same-function-same-a-b-src-mq3-client-ui-controls-ml-513879911"></a>
### same

```ml
function same(a, b)
```

Compares two UI controls names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `b` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L379)

<a id="constant-constant-mq3-client-ui-controls-save-cancel-const-save-cancel-3-src-mq3-client-ui-controls-ml-1491988544"></a>
### SAVE_CANCEL

```ml
const SAVE_CANCEL = 3
```

Save-confirmation result selecting the cancel response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L17)

<a id="constant-constant-mq3-client-ui-controls-save-no-const-save-no-2-src-mq3-client-ui-controls-ml-9342415"></a>
### SAVE_NO

```ml
const SAVE_NO = 2
```

Save-confirmation result selecting the no response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L15)

<a id="constant-constant-mq3-client-ui-controls-save-noop-const-save-noop-0-src-mq3-client-ui-controls-ml-1055282757"></a>
### SAVE_NOOP

```ml
const SAVE_NOOP = 0
```

Save-confirmation result selecting the noop response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L11)

<a id="constant-constant-mq3-client-ui-controls-save-yes-const-save-yes-1-src-mq3-client-ui-controls-ml-683671386"></a>
### SAVE_YES

```ml
const SAVE_YES = 1
```

Save-confirmation result selecting the yes response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L13)

<a id="function-function-mq3-client-ui-controls-setconfig-function-setconfig-state-src-mq3-client-ui-controls-ml-525561885"></a>
### setConfig

```ml
function setConfig(state)
```

Controls_SetConfig / Controls_SetDefaults

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L528)

<a id="function-function-mq3-client-ui-controls-setcvar-function-setcvar-state-name-value-src-mq3-client-ui-controls-ml-1644879759"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

Updates `state.cvarValues` during UI controls `setCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.cvarValues`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |
| `value` | `dynamic` | — | Value used by `state.cvarValues=pairSet(state.cvarValues,name,str(value))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L401)

<a id="function-function-mq3-client-ui-controls-setdefaults-function-setdefaults-state-src-mq3-client-ui-controls-ml-1046820797"></a>
### setDefaults

```ml
function setDefaults(state)
```

Calls `mq3.client.ui_controls.setSetting`, `mq3.client.ui_controls.getCvarDefault` from UI controls `setDefaults`. The final path returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L534)

<a id="function-function-mq3-client-ui-controls-setkey-function-setkey-state-key-command-src-mq3-client-ui-controls-ml-584065069"></a>
### setKey

```ml
function setKey(state, key, command)
```

Calls `mq3.vm.cgame_key_traps.setBinding`, `mq3.client.ui_controls.emit`, `mq3.vm.cgame_key_traps.keynumToString` from UI controls `setKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyState`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI controls entry. |
| `command` | `dynamic` | — | Value used by `if key>=0 and key<256 then keys.setBinding(state.keyState,key,command) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L524)

<a id="function-function-mq3-client-ui-controls-setsetting-function-setsetting-state-name-value-src-mq3-client-ui-controls-ml-1317119595"></a>
### setSetting

```ml
function setSetting(state, name, value)
```

Updates `state.settings` during UI controls `setSetting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.settings`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI controls resource. |
| `value` | `dynamic` | — | Value used by `state.settings=pairSet(state.settings,name,value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L414)

<a id="function-function-mq3-client-ui-controls-setting-function-setting-state-name-src-mq3-client-ui-controls-ml-1765121348"></a>
### setting

```ml
function setting(state, name)
```

Adapts `mq3.client.ui_controls.pairGet` to UI controls `setting`, returning its result for `state.settings, name, 0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.settings`. |
| `name` | `dynamic` | — | Argument 2 of `mq3.client.ui_controls.pairGet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L409)

- [mq3.client.ui_controls.State](Type-mq3-client-ui-controls-state-1669080757.md) — struct
<a id="function-function-mq3-client-ui-controls-statusbar-function-statusbar-state-src-mq3-client-ui-controls-ml-656597527"></a>
### statusBar

```ml
function statusBar(state)
```

Calls `mq3.client.ui_controls.emit` from UI controls `statusBar`. The final path returns `"Use Arrow Keys or CLICK to change"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI controls state passed to the helper calls in `statusBar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L503)

<a id="constant-constant-mq3-client-ui-controls-torso-attack-const-torso-attack-7-src-mq3-client-ui-controls-ml-365938690"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```

Native upper-body animation slot for the attack sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L148)

<a id="constant-constant-mq3-client-ui-controls-torso-gesture-const-torso-gesture-6-src-mq3-client-ui-controls-ml-654062427"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```

Native upper-body animation slot for the gesture sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L146)

<a id="constant-constant-mq3-client-ui-controls-torso-stand-const-torso-stand-11-src-mq3-client-ui-controls-ml-929473579"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```

Native upper-body animation slot for the stand sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L150)

<a id="function-function-mq3-client-ui-controls-uicontrolsmenu-function-uicontrolsmenu-state-weaponmodels-src-mq3-client-ui-controls-ml-1645420767"></a>
### uiControlsMenu

```ml
function uiControlsMenu(state, weaponModels)
```

Updates `state.pushed`, `state.menuEvents` during UI controls `uiControlsMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.pushed`, `state.menuEvents`. |
| `weaponModels` | `dynamic` | — | Value used by `menuInit(state,weaponModels)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L616)

<a id="function-function-mq3-client-ui-controls-update-function-update-state-src-mq3-client-ui-controls-ml-1377515401"></a>
### update

```ml
function update(state)
```

Calls `mq3.client.ui_controls.groupIds`, `mq3.client.ui_controls.control` from UI controls `update`. The final path returns `len(active)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.controls`, `state.section`, `state.waitingForKey`, `state.cursorId`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L488)

<a id="function-function-mq3-client-ui-controls-updatemodel-function-updatemodel-state-anim-src-mq3-client-ui-controls-ml-1253399758"></a>
### updateModel

```ml
function updateModel(state, anim)
```

Controls_UpdateModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI controls record/storage; this routine assigns `state.playerViewangles`, `state.playerMoveangles`, `state.playerLegs`, `state.playerTorso` and additional values. |
| `anim` | `dynamic` | — | Value used by `switch anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L446)

<a id="constant-constant-mq3-client-ui-controls-wp-bfg-const-wp-bfg-9-src-mq3-client-ui-controls-ml-1514592122"></a>
### WP_BFG

```ml
const WP_BFG = 9
```

Native weapon identifier selecting the BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L172)

<a id="constant-constant-mq3-client-ui-controls-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-ui-controls-ml-425554390"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```

Native weapon identifier selecting the gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L156)

<a id="constant-constant-mq3-client-ui-controls-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-ui-controls-ml-397134376"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```

Native weapon identifier selecting the grappling hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L174)

<a id="constant-constant-mq3-client-ui-controls-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-ui-controls-ml-422843501"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```

Native weapon identifier selecting the grenade launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L162)

<a id="constant-constant-mq3-client-ui-controls-wp-lightning-const-wp-lightning-6-src-mq3-client-ui-controls-ml-2085406741"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```

Native weapon identifier selecting the lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L166)

<a id="constant-constant-mq3-client-ui-controls-wp-machinegun-const-wp-machinegun-2-src-mq3-client-ui-controls-ml-1286468583"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```

Native weapon identifier selecting the machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L158)

<a id="constant-constant-mq3-client-ui-controls-wp-none-const-wp-none-0-src-mq3-client-ui-controls-ml-1192453169"></a>
### WP_NONE

```ml
const WP_NONE = 0
```

Native weapon identifier selecting no selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L154)

<a id="constant-constant-mq3-client-ui-controls-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-ui-controls-ml-1893801275"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```

Native weapon identifier selecting the plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L170)

<a id="constant-constant-mq3-client-ui-controls-wp-railgun-const-wp-railgun-7-src-mq3-client-ui-controls-ml-1784772394"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```

Native weapon identifier selecting the railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L168)

<a id="constant-constant-mq3-client-ui-controls-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-ui-controls-ml-683890142"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```

Native weapon identifier selecting the rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L164)

<a id="constant-constant-mq3-client-ui-controls-wp-shotgun-const-wp-shotgun-3-src-mq3-client-ui-controls-ml-243150630"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```

Native weapon identifier selecting the shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L160)
