# `mq3.client.ui_controls.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-controls-ml-1689765730.md)

<a id="struct-struct-mq3-client-ui-controls-state-struct-state-src-mq3-client-ui-controls-ml-1323500539"></a>
## State

```ml
struct State
```

Stores UI controls state, including `keyState`, `bindings`, `configs`, `controls`, `section`, `waitingForKey` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L270)

## Members

<a id="field-field-mq3-client-ui-controls-state-actions-actions-src-mq3-client-ui-controls-ml-426687148"></a>
### actions

```ml
actions
```

Host requests queued while applying key bindings and mouse or movement settings, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L305)

<a id="field-field-mq3-client-ui-controls-state-bindings-bindings-src-mq3-client-ui-controls-ml-827631536"></a>
### bindings

```ml
bindings
```

Key-to-command associations available to the UI controls editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L275)

<a id="field-field-mq3-client-ui-controls-state-cached-cached-src-mq3-client-ui-controls-ml-1764052772"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L335)

<a id="field-field-mq3-client-ui-controls-state-changesmade-changesmade-src-mq3-client-ui-controls-ml-893135040"></a>
### changesMade

```ml
changesMade
```

When constructing this record, `create` supplies `false` for this member. Used by `menuKey` and `resetDefaultsAction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L290)

<a id="field-field-mq3-client-ui-controls-state-configs-configs-src-mq3-client-ui-controls-ml-451447808"></a>
### configs

```ml
configs
```

When constructing this record, `create` supplies an empty list for this member. Used by `initCvars` and `getCvarDefault` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L278)

<a id="field-field-mq3-client-ui-controls-state-controls-controls-src-mq3-client-ui-controls-ml-636962780"></a>
### controls

```ml
controls
```

When constructing this record, `create` supplies `makeControls()` for this member. Used by `control` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L281)

<a id="field-field-mq3-client-ui-controls-state-cursorid-cursorid-src-mq3-client-ui-controls-ml-1823201466"></a>
### cursorId

```ml
cursorId
```

When constructing this record, `create` supplies `0` for this member. Used by `update` and `menuKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L293)

<a id="field-field-mq3-client-ui-controls-state-cvardefaults-cvardefaults-src-mq3-client-ui-controls-ml-1555635608"></a>
### cvarDefaults

```ml
cvarDefaults
```

When constructing this record, `create` supplies an empty list for this member. Used by `defaultCvar` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L299)

<a id="field-field-mq3-client-ui-controls-state-cvarvalues-cvarvalues-src-mq3-client-ui-controls-ml-362237680"></a>
### cvarValues

```ml
cvarValues
```

When constructing this record, `create` supplies an empty list for this member. Used by `cvar` and `setCvar` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L296)

<a id="field-field-mq3-client-ui-controls-state-keystate-keystate-src-mq3-client-ui-controls-ml-450546840"></a>
### keyState

```ml
keyState
```

When constructing this record, `create` supplies `keys.create()` for this member. Used by `getKeyAssignment` and `setKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L273)

<a id="field-field-mq3-client-ui-controls-state-menuevents-menuevents-src-mq3-client-ui-controls-ml-1341449212"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L339)

<a id="field-field-mq3-client-ui-controls-state-playerchat-playerchat-src-mq3-client-ui-controls-ml-1022596346"></a>
### playerChat

```ml
playerChat
```

When constructing this record, `create` supplies `false` for this member. Used by `updateModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L331)

<a id="field-field-mq3-client-ui-controls-state-playerlegs-playerlegs-src-mq3-client-ui-controls-ml-1469908960"></a>
### playerLegs

```ml
playerLegs
```

When constructing this record, `create` supplies `LEGS_IDLE` for this member. Used by `updateModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L322)

<a id="field-field-mq3-client-ui-controls-state-playermodel-playermodel-src-mq3-client-ui-controls-ml-790643336"></a>
### playerModel

```ml
playerModel
```

Model resource selected for the player presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L310)

<a id="field-field-mq3-client-ui-controls-state-playermoveangles-playermoveangles-src-mq3-client-ui-controls-ml-876003592"></a>
### playerMoveangles

```ml
playerMoveangles
```

When constructing this record, `create` supplies `[0.0,150.0,0.0]` for this member. Used by `updateModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L319)

<a id="field-field-mq3-client-ui-controls-state-playername-playername-src-mq3-client-ui-controls-ml-1616914156"></a>
### playerName

```ml
playerName
```

When constructing this record, `create` supplies an empty string for this member. Used by `menuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L313)

<a id="field-field-mq3-client-ui-controls-state-playertorso-playertorso-src-mq3-client-ui-controls-ml-1188834212"></a>
### playerTorso

```ml
playerTorso
```

When constructing this record, `create` supplies `TORSO_STAND` for this member. Used by `updateModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L325)

<a id="field-field-mq3-client-ui-controls-state-playerviewangles-playerviewangles-src-mq3-client-ui-controls-ml-2134347384"></a>
### playerViewangles

```ml
playerViewangles
```

When constructing this record, `create` supplies `[0.0,150.0,0.0]` for this member. Used by `updateModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L316)

<a id="field-field-mq3-client-ui-controls-state-playerweapon-playerweapon-src-mq3-client-ui-controls-ml-27245614"></a>
### playerWeapon

```ml
playerWeapon
```

When constructing this record, `create` supplies `-1` for this member. Used by `updateModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L328)

<a id="field-field-mq3-client-ui-controls-state-pushed-pushed-src-mq3-client-ui-controls-ml-695422102"></a>
### pushed

```ml
pushed
```

Records that the controls and key-bindings menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L333)

<a id="field-field-mq3-client-ui-controls-state-retailactive-retailactive-src-mq3-client-ui-controls-ml-2067067586"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the controls and key-bindings menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L308)

<a id="field-field-mq3-client-ui-controls-state-section-section-src-mq3-client-ui-controls-ml-1298534848"></a>
### section

```ml
section
```

When constructing this record, `create` supplies `C_LOOKING` for this member. Used by `update` and `menuEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L284)

<a id="field-field-mq3-client-ui-controls-state-settings-settings-src-mq3-client-ui-controls-ml-655902006"></a>
### settings

```ml
settings
```

When constructing this record, `create` supplies an empty list for this member. Used by `setting` and `setSetting` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L302)

<a id="field-field-mq3-client-ui-controls-state-waitingforkey-waitingforkey-src-mq3-client-ui-controls-ml-1223226184"></a>
### waitingForKey

```ml
waitingForKey
```

When constructing this record, `create` supplies `false` for this member. Used by `update` and `drawKeyBinding` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L287)

<a id="field-field-mq3-client-ui-controls-state-weaponmodels-weaponmodels-src-mq3-client-ui-controls-ml-1959820648"></a>
### weaponModels

```ml
weaponModels
```

Model resources selected for the weapon presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L337)
