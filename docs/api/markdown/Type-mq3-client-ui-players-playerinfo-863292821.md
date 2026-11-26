# `mq3.client.ui_players.PlayerInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-playerinfo-struct-playerinfo-src-mq3-client-ui-players-ml-753952165"></a>
## PlayerInfo

```ml
struct PlayerInfo
```

Stores UI players player info record, including `legsModel`, `legsSkin`, `legs`, `torsoModel`, `torsoSkin`, `torso` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L206)

## Members

<a id="field-field-mq3-client-ui-players-playerinfo-actions-actions-src-mq3-client-ui-players-ml-1186693950"></a>
### actions

```ml
actions
```

Host requests queued while loading model parts and drawing the animated base-game player preview, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L281)

<a id="field-field-mq3-client-ui-players-playerinfo-animations-animations-src-mq3-client-ui-players-ml-844152784"></a>
### animations

```ml
animations
```

Animation descriptions indexed by the native player-animation identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L224)

<a id="field-field-mq3-client-ui-players-playerinfo-barrelangle-barrelangle-src-mq3-client-ui-players-ml-936612518"></a>
### barrelAngle

```ml
barrelAngle
```

Current rotational angle of the spinning weapon barrel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L270)

<a id="field-field-mq3-client-ui-players-playerinfo-barrelmodel-barrelmodel-src-mq3-client-ui-players-ml-903560514"></a>
### barrelModel

```ml
barrelModel
```

Model resource selected for the barrel presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L228)

<a id="field-field-mq3-client-ui-players-playerinfo-barrelspinning-barrelspinning-src-mq3-client-ui-players-ml-891915310"></a>
### barrelSpinning

```ml
barrelSpinning
```

True while the weapon barrel is in its spinning state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L268)

<a id="field-field-mq3-client-ui-players-playerinfo-barreltime-barreltime-src-mq3-client-ui-players-ml-343700976"></a>
### barrelTime

```ml
barrelTime
```

Client timestamp used to advance or stop weapon-barrel rotation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L272)

<a id="field-field-mq3-client-ui-players-playerinfo-chat-chat-src-mq3-client-ui-players-ml-887746442"></a>
### chat

```ml
chat
```

True when the player preview should draw the talk balloon above the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L264)

<a id="field-field-mq3-client-ui-players-playerinfo-currentweapon-currentweapon-src-mq3-client-ui-players-ml-592421558"></a>
### currentWeapon

```ml
currentWeapon
```

When constructing this record, `create` supplies `WP_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L240)

<a id="field-field-mq3-client-ui-players-playerinfo-flashdlightcolor-flashdlightcolor-src-mq3-client-ui-players-ml-1706570808"></a>
### flashDlightColor

```ml
flashDlightColor
```

RGB components of the weapon's muzzle-flash dynamic light.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L232)

<a id="field-field-mq3-client-ui-players-playerinfo-flashmodel-flashmodel-src-mq3-client-ui-players-ml-1208528044"></a>
### flashModel

```ml
flashModel
```

Model resource selected for the flash presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L230)

<a id="field-field-mq3-client-ui-players-playerinfo-headmodel-headmodel-src-mq3-client-ui-players-ml-289804618"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L220)

<a id="field-field-mq3-client-ui-players-playerinfo-headskin-headskin-src-mq3-client-ui-players-ml-1135492112"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L222)

<a id="field-field-mq3-client-ui-players-playerinfo-jumpheight-jumpheight-src-mq3-client-ui-players-ml-111466456"></a>
### jumpHeight

```ml
jumpHeight
```

When constructing this record, `create` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L276)

<a id="field-field-mq3-client-ui-players-playerinfo-lastweapon-lastweapon-src-mq3-client-ui-players-ml-838584746"></a>
### lastWeapon

```ml
lastWeapon
```

When constructing this record, `create` supplies `WP_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L248)

<a id="field-field-mq3-client-ui-players-playerinfo-legs-legs-src-mq3-client-ui-players-ml-182986520"></a>
### legs

```ml
legs
```

Animation and interpolation state for the player's legs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L212)

<a id="field-field-mq3-client-ui-players-playerinfo-legsanim-legsanim-src-mq3-client-ui-players-ml-495661946"></a>
### legsAnim

```ml
legsAnim
```

Current preview leg-animation identifier, including the toggle bit used to restart an animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L242)

<a id="field-field-mq3-client-ui-players-playerinfo-legsanimationtimer-legsanimationtimer-src-mq3-client-ui-players-ml-235075670"></a>
### legsAnimationTimer

```ml
legsAnimationTimer
```

Milliseconds remaining in a forced leg animation, also used to calculate the preview's jump height.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L262)

<a id="field-field-mq3-client-ui-players-playerinfo-legsmodel-legsmodel-src-mq3-client-ui-players-ml-1985652146"></a>
### legsModel

```ml
legsModel
```

Model resource selected for the legs presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L208)

<a id="field-field-mq3-client-ui-players-playerinfo-legsskin-legsskin-src-mq3-client-ui-players-ml-930930554"></a>
### legsSkin

```ml
legsSkin
```

Skin resource applied to the legs model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L210)

<a id="field-field-mq3-client-ui-players-playerinfo-moveangles-moveangles-src-mq3-client-ui-players-ml-1670628464"></a>
### moveAngles

```ml
moveAngles
```

When constructing this record, `create` supplies `[0.0,0.0,0.0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L238)

<a id="field-field-mq3-client-ui-players-playerinfo-muzzleflashtime-muzzleflashtime-src-mq3-client-ui-players-ml-1953275586"></a>
### muzzleFlashTime

```ml
muzzleFlashTime
```

Client timestamp at which the entity's muzzle-flash effect began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L234)

<a id="field-field-mq3-client-ui-players-playerinfo-newmodel-newmodel-src-mq3-client-ui-players-ml-483468608"></a>
### newModel

```ml
newModel
```

Model resource selected for the new presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L266)

<a id="field-field-mq3-client-ui-players-playerinfo-pendinglegsanim-pendinglegsanim-src-mq3-client-ui-players-ml-430324542"></a>
### pendingLegsAnim

```ml
pendingLegsAnim
```

Deferred leg animation applied when the current forced jump or landing sequence allows a transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L255)

<a id="field-field-mq3-client-ui-players-playerinfo-pendingtorsoanim-pendingtorsoanim-src-mq3-client-ui-players-ml-1954894388"></a>
### pendingTorsoAnim

```ml
pendingTorsoAnim
```

Deferred torso animation applied after the current forced torso sequence permits a transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L259)

<a id="field-field-mq3-client-ui-players-playerinfo-pendingweapon-pendingweapon-src-mq3-client-ui-players-ml-441156274"></a>
### pendingWeapon

```ml
pendingWeapon
```

When constructing this record, `create` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L250)

<a id="field-field-mq3-client-ui-players-playerinfo-realtime-realtime-src-mq3-client-ui-players-ml-62127084"></a>
### realtime

```ml
realtime
```

Preview draw timestamp in milliseconds retained for player animation and delayed weapon changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L278)

<a id="field-field-mq3-client-ui-players-playerinfo-realweapon-realweapon-src-mq3-client-ui-players-ml-1613117738"></a>
### realWeapon

```ml
realWeapon
```

When constructing this record, `create` supplies `WP_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L274)

<a id="field-field-mq3-client-ui-players-playerinfo-torso-torso-src-mq3-client-ui-players-ml-1526252390"></a>
### torso

```ml
torso
```

Animation and interpolation state for the player's torso.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L218)

<a id="field-field-mq3-client-ui-players-playerinfo-torsoanim-torsoanim-src-mq3-client-ui-players-ml-1939051690"></a>
### torsoAnim

```ml
torsoAnim
```

Current preview torso-animation identifier, including the toggle bit used to restart an animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L244)

<a id="field-field-mq3-client-ui-players-playerinfo-torsoanimationtimer-torsoanimationtimer-src-mq3-client-ui-players-ml-827382226"></a>
### torsoAnimationTimer

```ml
torsoAnimationTimer
```

Milliseconds remaining in a forced torso gesture, attack, or weapon-change animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L257)

<a id="field-field-mq3-client-ui-players-playerinfo-torsomodel-torsomodel-src-mq3-client-ui-players-ml-1631963914"></a>
### torsoModel

```ml
torsoModel
```

Model resource selected for the torso presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L214)

<a id="field-field-mq3-client-ui-players-playerinfo-torsoskin-torsoskin-src-mq3-client-ui-players-ml-266692138"></a>
### torsoSkin

```ml
torsoSkin
```

Skin resource applied to the torso model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L216)

<a id="field-field-mq3-client-ui-players-playerinfo-viewangles-viewangles-src-mq3-client-ui-players-ml-316797224"></a>
### viewAngles

```ml
viewAngles
```

Euler camera angles used to construct the client view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L236)

<a id="field-field-mq3-client-ui-players-playerinfo-weapon-weapon-src-mq3-client-ui-players-ml-531698666"></a>
### weapon

```ml
weapon
```

Desired preview weapon identifier; the current model changes after the weapon-drop animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L246)

<a id="field-field-mq3-client-ui-players-playerinfo-weaponmodel-weaponmodel-src-mq3-client-ui-players-ml-876819834"></a>
### weaponModel

```ml
weaponModel
```

Model resource selected for the weapon presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L226)

<a id="field-field-mq3-client-ui-players-playerinfo-weapontimer-weapontimer-src-mq3-client-ui-players-ml-1528612774"></a>
### weaponTimer

```ml
weaponTimer
```

Preview timestamp after which a pending weapon selection becomes active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L252)
