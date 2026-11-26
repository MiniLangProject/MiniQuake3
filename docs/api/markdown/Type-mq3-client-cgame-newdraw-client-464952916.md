# `mq3.client.cgame_newdraw.Client`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-newdraw-ml-909882749.md)

<a id="struct-struct-mq3-client-cgame-newdraw-client-struct-client-src-mq3-client-cgame-newdraw-ml-174175"></a>
## Client

```ml
struct Client
```

Stores client game newdraw client record, including `infoValid`, `name`, `team`, `health`, `armor`, `teamTask` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L259)

## Members

<a id="field-field-mq3-client-cgame-newdraw-client-armor-armor-src-mq3-client-cgame-newdraw-ml-383428578"></a>
### armor

```ml
armor
```

Reported teammate armor available to selected-player and team-status owner draws.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L269)

<a id="field-field-mq3-client-cgame-newdraw-client-curweapon-curweapon-src-mq3-client-cgame-newdraw-ml-181899886"></a>
### curWeapon

```ml
curWeapon
```

Currently selected weapon identifier for the client-information entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L275)

<a id="field-field-mq3-client-cgame-newdraw-client-deferred-deferred-src-mq3-client-cgame-newdraw-ml-1484793064"></a>
### deferred

```ml
deferred
```

True while the player's full media registration is deferred to a later load step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L285)

<a id="field-field-mq3-client-cgame-newdraw-client-headmodel-headmodel-src-mq3-client-cgame-newdraw-ml-438416622"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L279)

<a id="field-field-mq3-client-cgame-newdraw-client-headoffset-headoffset-src-mq3-client-cgame-newdraw-ml-1539997268"></a>
### headOffset

```ml
headOffset
```

Offset applied to position the head model in icon or preview views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L287)

<a id="field-field-mq3-client-cgame-newdraw-client-headskin-headskin-src-mq3-client-cgame-newdraw-ml-973376364"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L281)

<a id="field-field-mq3-client-cgame-newdraw-client-health-health-src-mq3-client-cgame-newdraw-ml-712369014"></a>
### health

```ml
health
```

Reported teammate health available to team-status and selected-player owner draws.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L267)

<a id="field-field-mq3-client-cgame-newdraw-client-infovalid-infovalid-src-mq3-client-cgame-newdraw-ml-1490855270"></a>
### infoValid

```ml
infoValid
```

True when the client-information entry has been populated from valid server data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L261)

<a id="field-field-mq3-client-cgame-newdraw-client-location-location-src-mq3-client-cgame-newdraw-ml-1900883948"></a>
### location

```ml
location
```

When constructing this record, `client` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L273)

<a id="field-field-mq3-client-cgame-newdraw-client-modelicon-modelicon-src-mq3-client-cgame-newdraw-ml-235116950"></a>
### modelIcon

```ml
modelIcon
```

Image or shader resource used to draw the model icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L283)

<a id="field-field-mq3-client-cgame-newdraw-client-name-name-src-mq3-client-cgame-newdraw-ml-529363420"></a>
### name

```ml
name
```

Player name available to Missionpack owner-drawn HUD and selected-team-player displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L263)

<a id="field-field-mq3-client-cgame-newdraw-client-powerups-powerups-src-mq3-client-cgame-newdraw-ml-388562708"></a>
### powerups

```ml
powerups
```

Player powerup bitmask used by owner-drawn icons and team flag-carrier selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L277)

<a id="field-field-mq3-client-cgame-newdraw-client-team-team-src-mq3-client-cgame-newdraw-ml-1462325636"></a>
### team

```ml
team
```

Teammate affiliation used to filter team-status and selected-player owner draws.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L265)

<a id="field-field-mq3-client-cgame-newdraw-client-teamtask-teamtask-src-mq3-client-cgame-newdraw-ml-606130074"></a>
### teamTask

```ml
teamTask
```

Team-order role identifying the player's current tactical assignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L271)
