# `mq3.client.cgame_draw.Client`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-draw-ml-658265827.md)

<a id="struct-struct-mq3-client-cgame-draw-client-struct-client-src-mq3-client-cgame-draw-ml-852738015"></a>
## Client

```ml
struct Client
```

Stores client game draw client record, including `name`, `team`, `infoValid`, `health`, `armor`, `location` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L121)

## Members

<a id="field-field-mq3-client-cgame-draw-client-armor-armor-src-mq3-client-cgame-draw-ml-1208761750"></a>
### armor

```ml
armor
```

Armor reported for this teammate and shown beside health in the team overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L131)

<a id="field-field-mq3-client-cgame-draw-client-deferred-deferred-src-mq3-client-cgame-draw-ml-948073304"></a>
### deferred

```ml
deferred
```

True while the player's full media registration is deferred to a later load step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L139)

<a id="field-field-mq3-client-cgame-draw-client-headmodel-headmodel-src-mq3-client-cgame-draw-ml-1302306370"></a>
### headModel

```ml
headModel
```

Head-model resource used when drawing a player, head icon, or preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L141)

<a id="field-field-mq3-client-cgame-draw-client-headskin-headskin-src-mq3-client-cgame-draw-ml-265627660"></a>
### headSkin

```ml
headSkin
```

Skin resource applied to the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L143)

<a id="field-field-mq3-client-cgame-draw-client-health-health-src-mq3-client-cgame-draw-ml-1295505098"></a>
### health

```ml
health
```

Health reported for this teammate and displayed in the team overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L129)

<a id="field-field-mq3-client-cgame-draw-client-infovalid-infovalid-src-mq3-client-cgame-draw-ml-2119801274"></a>
### infoValid

```ml
infoValid
```

True when the client-information entry has been populated from valid server data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L127)

<a id="field-field-mq3-client-cgame-draw-client-location-location-src-mq3-client-cgame-draw-ml-2096957132"></a>
### location

```ml
location
```

When constructing this record, `client` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L133)

<a id="field-field-mq3-client-cgame-draw-client-modelicon-modelicon-src-mq3-client-cgame-draw-ml-1241169130"></a>
### modelIcon

```ml
modelIcon
```

Image or shader resource used to draw the model icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L145)

<a id="field-field-mq3-client-cgame-draw-client-name-name-src-mq3-client-cgame-draw-ml-1891580"></a>
### name

```ml
name
```

Player display name available to the ordinary HUD and team-overlay drawing code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L123)

<a id="field-field-mq3-client-cgame-draw-client-powerups-powerups-src-mq3-client-cgame-draw-ml-84481204"></a>
### powerups

```ml
powerups
```

Player powerup bitmask used by HUD and team-overlay icon rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L137)

<a id="field-field-mq3-client-cgame-draw-client-team-team-src-mq3-client-cgame-draw-ml-673706724"></a>
### team

```ml
team
```

Reported team membership used to include this client in the local team overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L125)

<a id="field-field-mq3-client-cgame-draw-client-weapon-weapon-src-mq3-client-cgame-draw-ml-307168114"></a>
### weapon

```ml
weapon
```

Native weapon identifier reported for this teammate and used by the team-overlay weapon icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L135)
