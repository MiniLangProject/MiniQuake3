# `mq3.client.cg_local.ClientInfo`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-clientinfo-struct-clientinfo-src-mq3-client-cg-local-ml-1578610459"></a>
## ClientInfo

```ml
struct ClientInfo
```

Stores client game local client info record, including `infoValid`, `name`, `team`, `botSkill`, `color1`, `color2` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L382)

## Members

<a id="field-field-mq3-client-cg-local-clientinfo-animations-animations-src-mq3-client-cg-local-ml-1577720680"></a>
### animations

```ml
animations
```

Animation descriptions indexed by the native player-animation identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L470)

<a id="field-field-mq3-client-cg-local-clientinfo-armor-armor-src-mq3-client-cg-local-ml-117193582"></a>
### armor

```ml
armor
```

Native-compatible client-info armor value retained for team-overlay rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L402)

<a id="field-field-mq3-client-cg-local-clientinfo-blueteam-blueteam-src-mq3-client-cg-local-ml-80005768"></a>
### blueTeam

```ml
blueTeam
```

Blue-team model or identity name used by the player's media selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L440)

<a id="field-field-mq3-client-cg-local-clientinfo-botskill-botskill-src-mq3-client-cg-local-ml-1830297538"></a>
### botSkill

```ml
botSkill
```

Bot difficulty level; zero denotes a human player and native bot levels range from one to five.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L390)

<a id="field-field-mq3-client-cg-local-clientinfo-breathpufftime-breathpufftime-src-mq3-client-cg-local-ml-156081406"></a>
### breathPuffTime

```ml
breathPuffTime
```

Compatibility member corresponding to native `clientInfo_t.breathPuffTime`; the original declaration is `int breathPuffTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L428)

<a id="field-field-mq3-client-cg-local-clientinfo-color1-color1-src-mq3-client-cg-local-ml-1259799138"></a>
### color1

```ml
color1
```

Primary player color used for team and weapon-effect presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L392)

<a id="field-field-mq3-client-cg-local-clientinfo-color2-color2-src-mq3-client-cg-local-ml-505688296"></a>
### color2

```ml
color2
```

Secondary player color used for team and weapon-effect presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L394)

<a id="field-field-mq3-client-cg-local-clientinfo-curweapon-curweapon-src-mq3-client-cg-local-ml-1149520930"></a>
### curWeapon

```ml
curWeapon
```

Currently selected weapon identifier for the client-information entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L404)

<a id="field-field-mq3-client-cg-local-clientinfo-deferred-deferred-src-mq3-client-cg-local-ml-1833509648"></a>
### deferred

```ml
deferred
```

True while the player's full media registration is deferred to a later load step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L442)

<a id="field-field-mq3-client-cg-local-clientinfo-fixedlegs-fixedlegs-src-mq3-client-cg-local-ml-1119036362"></a>
### fixedlegs

```ml
fixedlegs
```

True when the model requires leg yaw to remain aligned with torso yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L446)

<a id="field-field-mq3-client-cg-local-clientinfo-fixedtorso-fixedtorso-src-mq3-client-cg-local-ml-1119152272"></a>
### fixedtorso

```ml
fixedtorso
```

True when the model requires the torso to keep a fixed yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L448)

<a id="field-field-mq3-client-cg-local-clientinfo-footsteps-footsteps-src-mq3-client-cg-local-ml-2072696538"></a>
### footsteps

```ml
footsteps
```

Footstep-sound category selected by the player model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L452)

<a id="field-field-mq3-client-cg-local-clientinfo-gender-gender-src-mq3-client-cg-local-ml-890127964"></a>
### gender

```ml
gender
```

Model gender used when selecting gender-specific player sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L454)

<a id="field-field-mq3-client-cg-local-clientinfo-handicap-handicap-src-mq3-client-cg-local-ml-377717014"></a>
### handicap

```ml
handicap
```

Player handicap setting used by the user-info and team-display paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L406)

<a id="field-field-mq3-client-cg-local-clientinfo-headmodel-headmodel-src-mq3-client-cg-local-ml-1369662306"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L464)

<a id="field-field-mq3-client-cg-local-clientinfo-headmodelname-headmodelname-src-mq3-client-cg-local-ml-1031863978"></a>
### headModelName

```ml
headModelName
```

Virtual model name selected for the player's head.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L434)

<a id="field-field-mq3-client-cg-local-clientinfo-headoffset-headoffset-src-mq3-client-cg-local-ml-205500852"></a>
### headOffset

```ml
headOffset
```

Offset applied to position the head model in icon or preview views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L450)

<a id="field-field-mq3-client-cg-local-clientinfo-headskin-headskin-src-mq3-client-cg-local-ml-143553260"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L466)

<a id="field-field-mq3-client-cg-local-clientinfo-headskinname-headskinname-src-mq3-client-cg-local-ml-1897631686"></a>
### headSkinName

```ml
headSkinName
```

Skin name selected for the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L436)

<a id="field-field-mq3-client-cg-local-clientinfo-health-health-src-mq3-client-cg-local-ml-936476938"></a>
### health

```ml
health
```

Native-compatible client-info health value retained for the team overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L400)

<a id="field-field-mq3-client-cg-local-clientinfo-infovalid-infovalid-src-mq3-client-cg-local-ml-1905907802"></a>
### infoValid

```ml
infoValid
```

True when the client-information entry has been populated from valid server data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L384)

<a id="field-field-mq3-client-cg-local-clientinfo-invulnerabilitystarttime-invulnerabilitystarttime-src-mq3-client-cg-local-ml-714389666"></a>
### invulnerabilityStartTime

```ml
invulnerabilityStartTime
```

Compatibility member corresponding to native `clientInfo_t.invulnerabilityStartTime`; the original declaration is `int invulnerabilityStartTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L422)

<a id="field-field-mq3-client-cg-local-clientinfo-invulnerabilitystoptime-invulnerabilitystoptime-src-mq3-client-cg-local-ml-220624418"></a>
### invulnerabilityStopTime

```ml
invulnerabilityStopTime
```

Compatibility member corresponding to native `clientInfo_t.invulnerabilityStopTime`; the original declaration is `int invulnerabilityStopTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L425)

<a id="field-field-mq3-client-cg-local-clientinfo-legsmodel-legsmodel-src-mq3-client-cg-local-ml-1407163874"></a>
### legsModel

```ml
legsModel
```

Model resource selected for the legs presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L456)

<a id="field-field-mq3-client-cg-local-clientinfo-legsskin-legsskin-src-mq3-client-cg-local-ml-238815714"></a>
### legsSkin

```ml
legsSkin
```

Skin resource applied to the legs model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L458)

<a id="field-field-mq3-client-cg-local-clientinfo-location-location-src-mq3-client-cg-local-ml-180204844"></a>
### location

```ml
location
```

Team-location index reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L398)

<a id="field-field-mq3-client-cg-local-clientinfo-losses-losses-src-mq3-client-cg-local-ml-1238092624"></a>
### losses

```ml
losses
```

Tournament losses reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L410)

<a id="field-field-mq3-client-cg-local-clientinfo-medkitusagetime-medkitusagetime-src-mq3-client-cg-local-ml-345464854"></a>
### medkitUsageTime

```ml
medkitUsageTime
```

Compatibility member corresponding to native `clientInfo_t.medkitUsageTime`; the original declaration is `int medkitUsageTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L419)

<a id="field-field-mq3-client-cg-local-clientinfo-modelicon-modelicon-src-mq3-client-cg-local-ml-1350469354"></a>
### modelIcon

```ml
modelIcon
```

Image or shader resource used to draw the model icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L468)

<a id="field-field-mq3-client-cg-local-clientinfo-modelname-modelname-src-mq3-client-cg-local-ml-1011140938"></a>
### modelName

```ml
modelName
```

Virtual model name selected for the player or preview model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L430)

<a id="field-field-mq3-client-cg-local-clientinfo-name-name-src-mq3-client-cg-local-ml-591101468"></a>
### name

```ml
name
```

Player display name received from the server's client-information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L386)

<a id="field-field-mq3-client-cg-local-clientinfo-newanims-newanims-src-mq3-client-cg-local-ml-358266758"></a>
### newAnims

```ml
newAnims
```

True when the player model uses the Missionpack animation set.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L444)

<a id="field-field-mq3-client-cg-local-clientinfo-powerups-powerups-src-mq3-client-cg-local-ml-1674153012"></a>
### powerups

```ml
powerups
```

Player powerup bitmask cached in the shared client-information structure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L416)

<a id="field-field-mq3-client-cg-local-clientinfo-redteam-redteam-src-mq3-client-cg-local-ml-249099506"></a>
### redTeam

```ml
redTeam
```

Red-team model or identity name used by the player's media selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L438)

<a id="field-field-mq3-client-cg-local-clientinfo-score-score-src-mq3-client-cg-local-ml-933187506"></a>
### score

```ml
score
```

Latest player score retained in the shared client-information structure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L396)

<a id="field-field-mq3-client-cg-local-clientinfo-skinname-skinname-src-mq3-client-cg-local-ml-85846434"></a>
### skinName

```ml
skinName
```

Skin name selected for the player's body model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L432)

<a id="field-field-mq3-client-cg-local-clientinfo-sounds-sounds-src-mq3-client-cg-local-ml-1517799606"></a>
### sounds

```ml
sounds
```

Registered sound resources associated with the player model or media group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L472)

<a id="field-field-mq3-client-cg-local-clientinfo-team-team-src-mq3-client-cg-local-ml-1049550468"></a>
### team

```ml
team
```

Team affiliation retained in the native-compatible client presentation record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L388)

<a id="field-field-mq3-client-cg-local-clientinfo-teamleader-teamleader-src-mq3-client-cg-local-ml-273177666"></a>
### teamLeader

```ml
teamLeader
```

True when this client is the designated leader of its team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L414)

<a id="field-field-mq3-client-cg-local-clientinfo-teamtask-teamtask-src-mq3-client-cg-local-ml-397961414"></a>
### teamTask

```ml
teamTask
```

Team-order role identifying the player's current tactical assignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L412)

<a id="field-field-mq3-client-cg-local-clientinfo-torsomodel-torsomodel-src-mq3-client-cg-local-ml-1956095906"></a>
### torsoModel

```ml
torsoModel
```

Model resource selected for the torso presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L460)

<a id="field-field-mq3-client-cg-local-clientinfo-torsoskin-torsoskin-src-mq3-client-cg-local-ml-414589058"></a>
### torsoSkin

```ml
torsoSkin
```

Skin resource applied to the torso model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L462)

<a id="field-field-mq3-client-cg-local-clientinfo-wins-wins-src-mq3-client-cg-local-ml-1423823400"></a>
### wins

```ml
wins
```

Tournament victories reported for this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L408)
