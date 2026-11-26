# `mq3.client.cgame_players.ClientInfo`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-clientinfo-struct-clientinfo-src-mq3-client-cgame-players-ml-26465647"></a>
## ClientInfo

```ml
struct ClientInfo
```

Stores client game players client info record, including `infoValid`, `deferred`, `name`, `team`, `modelName`, `skinName` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L173)

## Members

<a id="field-field-mq3-client-cgame-players-clientinfo-animations-animations-src-mq3-client-cgame-players-ml-2087684328"></a>
### animations

```ml
animations
```

Animation descriptions indexed by the native player-animation identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L227)

<a id="field-field-mq3-client-cgame-players-clientinfo-blueteam-blueteam-src-mq3-client-cgame-players-ml-1982770384"></a>
### blueTeam

```ml
blueTeam
```

Blue-team model or identity name used by the player's media selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L193)

<a id="field-field-mq3-client-cgame-players-clientinfo-breathpufftime-breathpufftime-src-mq3-client-cgame-players-ml-643160794"></a>
### breathPuffTime

```ml
breathPuffTime
```

When constructing this record, `clientInfo` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L233)

<a id="field-field-mq3-client-cgame-players-clientinfo-color1-color1-src-mq3-client-cgame-players-ml-2107002086"></a>
### color1

```ml
color1
```

Primary player color used for team and weapon-effect presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L195)

<a id="field-field-mq3-client-cgame-players-clientinfo-color2-color2-src-mq3-client-cgame-players-ml-332754216"></a>
### color2

```ml
color2
```

Secondary player color used for team and weapon-effect presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L197)

<a id="field-field-mq3-client-cgame-players-clientinfo-deferred-deferred-src-mq3-client-cgame-players-ml-1550359784"></a>
### deferred

```ml
deferred
```

True while the player's full media registration is deferred to a later load step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L177)

<a id="field-field-mq3-client-cgame-players-clientinfo-fixedlegs-fixedlegs-src-mq3-client-cgame-players-ml-223113094"></a>
### fixedlegs

```ml
fixedlegs
```

True when the model requires leg yaw to remain aligned with torso yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L205)

<a id="field-field-mq3-client-cgame-players-clientinfo-fixedtorso-fixedtorso-src-mq3-client-cgame-players-ml-1081011408"></a>
### fixedtorso

```ml
fixedtorso
```

True when the model requires the torso to keep a fixed yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L207)

<a id="field-field-mq3-client-cgame-players-clientinfo-footsteps-footsteps-src-mq3-client-cgame-players-ml-475301302"></a>
### footsteps

```ml
footsteps
```

Footstep-sound category selected by the player model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L199)

<a id="field-field-mq3-client-cgame-players-clientinfo-gender-gender-src-mq3-client-cgame-players-ml-506621956"></a>
### gender

```ml
gender
```

Model gender used when selecting gender-specific player sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L203)

<a id="field-field-mq3-client-cgame-players-clientinfo-headmodel-headmodel-src-mq3-client-cgame-players-ml-1029158654"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L215)

<a id="field-field-mq3-client-cgame-players-clientinfo-headmodelname-headmodelname-src-mq3-client-cgame-players-ml-2111294078"></a>
### headModelName

```ml
headModelName
```

Virtual model name selected for the player's head.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L187)

<a id="field-field-mq3-client-cgame-players-clientinfo-headoffset-headoffset-src-mq3-client-cgame-players-ml-1325737180"></a>
### headOffset

```ml
headOffset
```

Offset applied to position the head model in icon or preview views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L201)

<a id="field-field-mq3-client-cgame-players-clientinfo-headskin-headskin-src-mq3-client-cgame-players-ml-1802775564"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L221)

<a id="field-field-mq3-client-cgame-players-clientinfo-headskinname-headskinname-src-mq3-client-cgame-players-ml-798677762"></a>
### headSkinName

```ml
headSkinName
```

Skin name selected for the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L189)

<a id="field-field-mq3-client-cgame-players-clientinfo-infovalid-infovalid-src-mq3-client-cgame-players-ml-2043662310"></a>
### infoValid

```ml
infoValid
```

True when the client-information entry has been populated from valid server data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L175)

<a id="field-field-mq3-client-cgame-players-clientinfo-legsmodel-legsmodel-src-mq3-client-cgame-players-ml-2254694"></a>
### legsModel

```ml
legsModel
```

Model resource selected for the legs presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L211)

<a id="field-field-mq3-client-cgame-players-clientinfo-legsskin-legsskin-src-mq3-client-cgame-players-ml-1788930694"></a>
### legsSkin

```ml
legsSkin
```

Skin resource applied to the legs model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L217)

<a id="field-field-mq3-client-cgame-players-clientinfo-modelicon-modelicon-src-mq3-client-cgame-players-ml-2057202382"></a>
### modelIcon

```ml
modelIcon
```

Image or shader resource used to draw the model icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L223)

<a id="field-field-mq3-client-cgame-players-clientinfo-modelname-modelname-src-mq3-client-cgame-players-ml-1390518630"></a>
### modelName

```ml
modelName
```

Virtual model name selected for the player or preview model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L183)

<a id="field-field-mq3-client-cgame-players-clientinfo-name-name-src-mq3-client-cgame-players-ml-1395646076"></a>
### name

```ml
name
```

Player display name received from the server's client-information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L179)

<a id="field-field-mq3-client-cgame-players-clientinfo-newanims-newanims-src-mq3-client-cgame-players-ml-1403296954"></a>
### newAnims

```ml
newAnims
```

True when the player model uses the Missionpack animation set.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L209)

<a id="field-field-mq3-client-cgame-players-clientinfo-powerups-powerups-src-mq3-client-cgame-players-ml-273354820"></a>
### powerups

```ml
powerups
```

Reported player powerup bitmask stored alongside model and identity information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L231)

<a id="field-field-mq3-client-cgame-players-clientinfo-redteam-redteam-src-mq3-client-cgame-players-ml-1478597238"></a>
### redTeam

```ml
redTeam
```

Red-team model or identity name used by the player's media selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L191)

<a id="field-field-mq3-client-cgame-players-clientinfo-score-score-src-mq3-client-cgame-players-ml-1476740142"></a>
### score

```ml
score
```

Reported player score cached alongside the player model and identity information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L229)

<a id="field-field-mq3-client-cgame-players-clientinfo-skinname-skinname-src-mq3-client-cgame-players-ml-289263334"></a>
### skinName

```ml
skinName
```

Skin name selected for the player's body model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L185)

<a id="field-field-mq3-client-cgame-players-clientinfo-sounds-sounds-src-mq3-client-cgame-players-ml-1535054626"></a>
### sounds

```ml
sounds
```

Registered sound resources associated with the player model or media group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L225)

<a id="field-field-mq3-client-cgame-players-clientinfo-team-team-src-mq3-client-cgame-players-ml-78014044"></a>
### team

```ml
team
```

Player team affiliation used to choose model skins, team colors, and friend markers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L181)

<a id="field-field-mq3-client-cgame-players-clientinfo-torsomodel-torsomodel-src-mq3-client-cgame-players-ml-409554022"></a>
### torsoModel

```ml
torsoModel
```

Model resource selected for the torso presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L213)

<a id="field-field-mq3-client-cgame-players-clientinfo-torsoskin-torsoskin-src-mq3-client-cgame-players-ml-982956646"></a>
### torsoSkin

```ml
torsoSkin
```

Skin resource applied to the torso model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L219)
