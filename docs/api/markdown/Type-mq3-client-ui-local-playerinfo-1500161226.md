# `mq3.client.ui_local.PlayerInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-playerinfo-struct-playerinfo-src-mq3-client-ui-local-ml-1510029243"></a>
## PlayerInfo

```ml
struct PlayerInfo
```

Stores UI local player info record, including `legsModel`, `legsSkin`, `legs`, `torsoModel`, `torsoSkin`, `torso` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L322)

## Members

<a id="field-field-mq3-client-ui-local-playerinfo-animations-animations-src-mq3-client-ui-local-ml-1122529450"></a>
### animations

```ml
animations
```

Animation descriptions indexed by the native player-animation identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L340)

<a id="field-field-mq3-client-ui-local-playerinfo-barrelangle-barrelangle-src-mq3-client-ui-local-ml-97075080"></a>
### barrelAngle

```ml
barrelAngle
```

Current rotational angle of the spinning weapon barrel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L397)

<a id="field-field-mq3-client-ui-local-playerinfo-barrelmodel-barrelmodel-src-mq3-client-ui-local-ml-1622095132"></a>
### barrelModel

```ml
barrelModel
```

Model resource selected for the barrel presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L344)

<a id="field-field-mq3-client-ui-local-playerinfo-barrelspinning-barrelspinning-src-mq3-client-ui-local-ml-1774980468"></a>
### barrelSpinning

```ml
barrelSpinning
```

True while the weapon barrel is in its spinning state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L395)

<a id="field-field-mq3-client-ui-local-playerinfo-barreltime-barreltime-src-mq3-client-ui-local-ml-1131356438"></a>
### barrelTime

```ml
barrelTime
```

Client timestamp used to advance or stop weapon-barrel rotation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L399)

<a id="field-field-mq3-client-ui-local-playerinfo-chat-chat-src-mq3-client-ui-local-ml-2084410468"></a>
### chat

```ml
chat
```

Compatibility member corresponding to native `playerInfo_t.chat`; the original declaration is `qboolean chat`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L391)

<a id="field-field-mq3-client-ui-local-playerinfo-currentweapon-currentweapon-src-mq3-client-ui-local-ml-281328920"></a>
### currentWeapon

```ml
currentWeapon
```

Compatibility member corresponding to native `playerInfo_t.currentWeapon`; the original declaration is `weapon_t currentWeapon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L358)

<a id="field-field-mq3-client-ui-local-playerinfo-flashdlightcolor-flashdlightcolor-src-mq3-client-ui-local-ml-512531702"></a>
### flashDlightColor

```ml
flashDlightColor
```

RGB components of the weapon's muzzle-flash dynamic light.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L348)

<a id="field-field-mq3-client-ui-local-playerinfo-flashmodel-flashmodel-src-mq3-client-ui-local-ml-1384964314"></a>
### flashModel

```ml
flashModel
```

Model resource selected for the flash presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L346)

<a id="field-field-mq3-client-ui-local-playerinfo-headmodel-headmodel-src-mq3-client-ui-local-ml-1517513980"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L336)

<a id="field-field-mq3-client-ui-local-playerinfo-headskin-headskin-src-mq3-client-ui-local-ml-1908967390"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L338)

<a id="field-field-mq3-client-ui-local-playerinfo-lastweapon-lastweapon-src-mq3-client-ui-local-ml-1737832952"></a>
### lastWeapon

```ml
lastWeapon
```

Compatibility member corresponding to native `playerInfo_t.lastWeapon`; the original declaration is `weapon_t lastWeapon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L370)

<a id="field-field-mq3-client-ui-local-playerinfo-legs-legs-src-mq3-client-ui-local-ml-1193667386"></a>
### legs

```ml
legs
```

Animation and interpolation state for the player's legs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L328)

<a id="field-field-mq3-client-ui-local-playerinfo-legsanim-legsanim-src-mq3-client-ui-local-ml-78337204"></a>
### legsAnim

```ml
legsAnim
```

Compatibility member corresponding to native `playerInfo_t.legsAnim`; the original declaration is `int legsAnim`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L361)

<a id="field-field-mq3-client-ui-local-playerinfo-legsanimationtimer-legsanimationtimer-src-mq3-client-ui-local-ml-359621156"></a>
### legsAnimationTimer

```ml
legsAnimationTimer
```

Compatibility member corresponding to native `playerInfo_t.legsAnimationTimer`; the original declaration is `int legsAnimationTimer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L388)

<a id="field-field-mq3-client-ui-local-playerinfo-legsmodel-legsmodel-src-mq3-client-ui-local-ml-1019281764"></a>
### legsModel

```ml
legsModel
```

Model resource selected for the legs presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L324)

<a id="field-field-mq3-client-ui-local-playerinfo-legsskin-legsskin-src-mq3-client-ui-local-ml-1511046772"></a>
### legsSkin

```ml
legsSkin
```

Skin resource applied to the legs model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L326)

<a id="field-field-mq3-client-ui-local-playerinfo-moveangles-moveangles-src-mq3-client-ui-local-ml-896039014"></a>
### moveAngles

```ml
moveAngles
```

Compatibility member corresponding to native `playerInfo_t.moveAngles`; the original declaration is `vec3_t moveAngles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L355)

<a id="field-field-mq3-client-ui-local-playerinfo-muzzleflashtime-muzzleflashtime-src-mq3-client-ui-local-ml-1097770956"></a>
### muzzleFlashTime

```ml
muzzleFlashTime
```

Client timestamp at which the entity's muzzle-flash effect began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L350)

<a id="field-field-mq3-client-ui-local-playerinfo-newmodel-newmodel-src-mq3-client-ui-local-ml-1625978150"></a>
### newModel

```ml
newModel
```

Model resource selected for the new presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L393)

<a id="field-field-mq3-client-ui-local-playerinfo-pendinglegsanim-pendinglegsanim-src-mq3-client-ui-local-ml-1404410400"></a>
### pendingLegsAnim

```ml
pendingLegsAnim
```

Compatibility member corresponding to native `playerInfo_t.pendingLegsAnim`; the original declaration is `int pendingLegsAnim`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L379)

<a id="field-field-mq3-client-ui-local-playerinfo-pendingtorsoanim-pendingtorsoanim-src-mq3-client-ui-local-ml-826786702"></a>
### pendingTorsoAnim

```ml
pendingTorsoAnim
```

Compatibility member corresponding to native `playerInfo_t.pendingTorsoAnim`; the original declaration is `int pendingTorsoAnim`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L385)

<a id="field-field-mq3-client-ui-local-playerinfo-pendingweapon-pendingweapon-src-mq3-client-ui-local-ml-342230436"></a>
### pendingWeapon

```ml
pendingWeapon
```

Compatibility member corresponding to native `playerInfo_t.pendingWeapon`; the original declaration is `weapon_t pendingWeapon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L373)

<a id="field-field-mq3-client-ui-local-playerinfo-realweapon-realweapon-src-mq3-client-ui-local-ml-561317096"></a>
### realWeapon

```ml
realWeapon
```

Compatibility member corresponding to native `playerInfo_t.realWeapon`; the original declaration is `int realWeapon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L402)

<a id="field-field-mq3-client-ui-local-playerinfo-torso-torso-src-mq3-client-ui-local-ml-105290416"></a>
### torso

```ml
torso
```

Animation and interpolation state for the player's torso.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L334)

<a id="field-field-mq3-client-ui-local-playerinfo-torsoanim-torsoanim-src-mq3-client-ui-local-ml-858223652"></a>
### torsoAnim

```ml
torsoAnim
```

Compatibility member corresponding to native `playerInfo_t.torsoAnim`; the original declaration is `int torsoAnim`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L364)

<a id="field-field-mq3-client-ui-local-playerinfo-torsoanimationtimer-torsoanimationtimer-src-mq3-client-ui-local-ml-1292280692"></a>
### torsoAnimationTimer

```ml
torsoAnimationTimer
```

Compatibility member corresponding to native `playerInfo_t.torsoAnimationTimer`; the original declaration is `int torsoAnimationTimer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L382)

<a id="field-field-mq3-client-ui-local-playerinfo-torsomodel-torsomodel-src-mq3-client-ui-local-ml-2044430676"></a>
### torsoModel

```ml
torsoModel
```

Model resource selected for the torso presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L330)

<a id="field-field-mq3-client-ui-local-playerinfo-torsoskin-torsoskin-src-mq3-client-ui-local-ml-1825873252"></a>
### torsoSkin

```ml
torsoSkin
```

Skin resource applied to the torso model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L332)

<a id="field-field-mq3-client-ui-local-playerinfo-viewangles-viewangles-src-mq3-client-ui-local-ml-998682774"></a>
### viewAngles

```ml
viewAngles
```

Euler camera angles used to construct the client view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L352)

<a id="field-field-mq3-client-ui-local-playerinfo-weapon-weapon-src-mq3-client-ui-local-ml-737714164"></a>
### weapon

```ml
weapon
```

Requested preview weapon identifier retained in the native-compatible player-info record during a weapon switch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L367)

<a id="field-field-mq3-client-ui-local-playerinfo-weaponmodel-weaponmodel-src-mq3-client-ui-local-ml-96348884"></a>
### weaponModel

```ml
weaponModel
```

Model resource selected for the weapon presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L342)

<a id="field-field-mq3-client-ui-local-playerinfo-weapontimer-weapontimer-src-mq3-client-ui-local-ml-1059100864"></a>
### weaponTimer

```ml
weaponTimer
```

Compatibility member corresponding to native `playerInfo_t.weaponTimer`; the original declaration is `int weaponTimer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L376)
