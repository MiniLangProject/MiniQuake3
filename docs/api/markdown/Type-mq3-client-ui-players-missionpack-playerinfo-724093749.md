# `mq3.client.ui_players_missionpack.PlayerInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-playerinfo-struct-playerinfo-src-mq3-client-ui-players-missionpack-ml-776343997"></a>
## PlayerInfo

```ml
struct PlayerInfo
```

Stores UI players missionpack player info record, including `legsModel`, `legsSkin`, `legs`, `torsoModel`, `torsoSkin`, `torso` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L207)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-actions-actions-src-mq3-client-ui-players-missionpack-ml-795439986"></a>
### actions

```ml
actions
```

Host requests queued while loading team-aware model parts and drawing the Missionpack player preview, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L284)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-animations-animations-src-mq3-client-ui-players-missionpack-ml-1503297672"></a>
### animations

```ml
animations
```

Animation descriptions indexed by the native player-animation identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L225)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-barrelangle-barrelangle-src-mq3-client-ui-players-missionpack-ml-1847708250"></a>
### barrelAngle

```ml
barrelAngle
```

Current rotational angle of the spinning weapon barrel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L272)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-barrelmodel-barrelmodel-src-mq3-client-ui-players-missionpack-ml-1329962998"></a>
### barrelModel

```ml
barrelModel
```

Model resource selected for the barrel presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L229)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-barrelspinning-barrelspinning-src-mq3-client-ui-players-missionpack-ml-708936066"></a>
### barrelSpinning

```ml
barrelSpinning
```

True while the weapon barrel is in its spinning state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L270)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-barreltime-barreltime-src-mq3-client-ui-players-missionpack-ml-625113768"></a>
### barrelTime

```ml
barrelTime
```

Client timestamp used to advance or stop weapon-barrel rotation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L274)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-chat-chat-src-mq3-client-ui-players-missionpack-ml-1180153678"></a>
### chat

```ml
chat
```

True when the player preview should draw the talk balloon above the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L266)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-currentweapon-currentweapon-src-mq3-client-ui-players-missionpack-ml-944318458"></a>
### currentWeapon

```ml
currentWeapon
```

When constructing this record, `create` supplies `WP_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L241)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-flashdlightcolor-flashdlightcolor-src-mq3-client-ui-players-missionpack-ml-5335904"></a>
### flashDlightColor

```ml
flashDlightColor
```

RGB components of the weapon's muzzle-flash dynamic light.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L233)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-flashmodel-flashmodel-src-mq3-client-ui-players-missionpack-ml-1949870948"></a>
### flashModel

```ml
flashModel
```

Model resource selected for the flash presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L231)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-headmodel-headmodel-src-mq3-client-ui-players-missionpack-ml-842503438"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L221)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-headskin-headskin-src-mq3-client-ui-players-missionpack-ml-2101110104"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L223)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-jumpheight-jumpheight-src-mq3-client-ui-players-missionpack-ml-1153568544"></a>
### jumpHeight

```ml
jumpHeight
```

When constructing this record, `create` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L278)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-lastweapon-lastweapon-src-mq3-client-ui-players-missionpack-ml-1531484910"></a>
### lastWeapon

```ml
lastWeapon
```

When constructing this record, `create` supplies `WP_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L250)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-legs-legs-src-mq3-client-ui-players-missionpack-ml-294265296"></a>
### legs

```ml
legs
```

Animation and interpolation state for the player's legs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L213)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-legsanim-legsanim-src-mq3-client-ui-players-missionpack-ml-496473630"></a>
### legsAnim

```ml
legsAnim
```

Current preview leg-animation identifier, including the toggle bit used to restart an animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L243)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-legsanimationtimer-legsanimationtimer-src-mq3-client-ui-players-missionpack-ml-1904487866"></a>
### legsAnimationTimer

```ml
legsAnimationTimer
```

Milliseconds remaining in a forced leg animation, also used to calculate the preview's jump height.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L264)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-legsmodel-legsmodel-src-mq3-client-ui-players-missionpack-ml-56274934"></a>
### legsModel

```ml
legsModel
```

Model resource selected for the legs presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L209)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-legsskin-legsskin-src-mq3-client-ui-players-missionpack-ml-1561060158"></a>
### legsSkin

```ml
legsSkin
```

Skin resource applied to the legs model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L211)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-moveangles-moveangles-src-mq3-client-ui-players-missionpack-ml-483198280"></a>
### moveAngles

```ml
moveAngles
```

When constructing this record, `create` supplies `[0.0,0.0,0.0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L239)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-muzzleflashtime-muzzleflashtime-src-mq3-client-ui-players-missionpack-ml-327992726"></a>
### muzzleFlashTime

```ml
muzzleFlashTime
```

Client timestamp at which the entity's muzzle-flash effect began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L235)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-newmodel-newmodel-src-mq3-client-ui-players-missionpack-ml-1966897736"></a>
### newModel

```ml
newModel
```

Model resource selected for the new presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L268)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-pendinglegsanim-pendinglegsanim-src-mq3-client-ui-players-missionpack-ml-104398354"></a>
### pendingLegsAnim

```ml
pendingLegsAnim
```

Deferred leg animation applied when the current forced jump or landing sequence allows a transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L257)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-pendingtorsoanim-pendingtorsoanim-src-mq3-client-ui-players-missionpack-ml-494678060"></a>
### pendingTorsoAnim

```ml
pendingTorsoAnim
```

Deferred torso animation applied after the current forced torso sequence permits a transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L261)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-pendingweapon-pendingweapon-src-mq3-client-ui-players-missionpack-ml-1722198934"></a>
### pendingWeapon

```ml
pendingWeapon
```

When constructing this record, `create` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L252)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-realtime-realtime-src-mq3-client-ui-players-missionpack-ml-812092884"></a>
### realtime

```ml
realtime
```

Mission-pack player-preview timestamp in milliseconds retained for animation and weapon-change timers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L281)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-realweapon-realweapon-src-mq3-client-ui-players-missionpack-ml-892651566"></a>
### realWeapon

```ml
realWeapon
```

When constructing this record, `create` supplies `WP_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L276)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-torso-torso-src-mq3-client-ui-players-missionpack-ml-817158730"></a>
### torso

```ml
torso
```

Animation and interpolation state for the player's torso.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L219)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-torsoanim-torsoanim-src-mq3-client-ui-players-missionpack-ml-892219310"></a>
### torsoAnim

```ml
torsoAnim
```

Current preview torso-animation identifier, including the toggle bit used to restart an animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L245)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-torsoanimationtimer-torsoanimationtimer-src-mq3-client-ui-players-missionpack-ml-1470094998"></a>
### torsoAnimationTimer

```ml
torsoAnimationTimer
```

Milliseconds remaining in a forced torso gesture, attack, or weapon-change animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L259)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-torsomodel-torsomodel-src-mq3-client-ui-players-missionpack-ml-1083626286"></a>
### torsoModel

```ml
torsoModel
```

Model resource selected for the torso presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L215)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-torsoskin-torsoskin-src-mq3-client-ui-players-missionpack-ml-853550254"></a>
### torsoSkin

```ml
torsoSkin
```

Skin resource applied to the torso model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L217)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-viewangles-viewangles-src-mq3-client-ui-players-missionpack-ml-1944942928"></a>
### viewAngles

```ml
viewAngles
```

Euler camera angles used to construct the client view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L237)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-weapon-weapon-src-mq3-client-ui-players-missionpack-ml-1557353598"></a>
### weapon

```ml
weapon
```

Desired mission-pack preview weapon identifier applied when the torso weapon-switch animation advances.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L248)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-weaponmodel-weaponmodel-src-mq3-client-ui-players-missionpack-ml-1808468670"></a>
### weaponModel

```ml
weaponModel
```

Model resource selected for the weapon presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L227)

<a id="field-field-mq3-client-ui-players-missionpack-playerinfo-weapontimer-weapontimer-src-mq3-client-ui-players-missionpack-ml-1016134970"></a>
### weaponTimer

```ml
weaponTimer
```

Preview timestamp after which a pending weapon selection becomes active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L254)
