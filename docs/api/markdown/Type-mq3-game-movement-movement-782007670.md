# `mq3.game.movement.Movement`

[Home](README.md) · [Source file](File-src-mq3-game-movement-ml-621504687.md)

<a id="struct-struct-mq3-game-movement-movement-struct-movement-src-mq3-game-movement-ml-548431451"></a>
## Movement

```ml
struct Movement
```

`Movement` record for movement, containing `origin`, `velocity`, `mins`, `maxs` and `clientNum` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L20)

## Members

<a id="field-field-mq3-game-movement-movement-clientnum-clientnum-src-mq3-game-movement-ml-110649608"></a>
### clientNum

```ml
clientNum
```

Client slot number represented by this player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L30)

<a id="field-field-mq3-game-movement-movement-context-context-src-mq3-game-movement-ml-2054418108"></a>
### context

```ml
context
```

Opaque caller-supplied context available to the movement collision-trace callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L70)

<a id="field-field-mq3-game-movement-movement-eventparms-eventparms-src-mq3-game-movement-ml-2040758242"></a>
### eventParms

```ml
eventParms
```

Parameters paired with the predictable event identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L64)

<a id="field-field-mq3-game-movement-movement-events-events-src-mq3-game-movement-ml-510202298"></a>
### events

```ml
events
```

Event identifiers retained by this player or game-state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L62)

<a id="field-field-mq3-game-movement-movement-eventsequence-eventsequence-src-mq3-game-movement-ml-1205251928"></a>
### eventSequence

```ml
eventSequence
```

Sequence number used to distinguish new predictable player events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L66)

<a id="field-field-mq3-game-movement-movement-flight-flight-src-mq3-game-movement-ml-1722740812"></a>
### flight

```ml
flight
```

Nonzero while the flight powerup changes player movement behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L44)

<a id="field-field-mq3-game-movement-movement-frametime-frametime-src-mq3-game-movement-ml-101115052"></a>
### frametime

```ml
frametime
```

Duration of the current movement or simulation step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L48)

<a id="field-field-mq3-game-movement-movement-gravity-gravity-src-mq3-game-movement-ml-666756476"></a>
### gravity

```ml
gravity
```

Downward acceleration used by the player or entity movement simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L34)

<a id="field-field-mq3-game-movement-movement-groundflags-groundflags-src-mq3-game-movement-ml-1794782412"></a>
### groundFlags

```ml
groundFlags
```

Flags associated with the supporting surface or ground contact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L56)

<a id="field-field-mq3-game-movement-movement-groundnormal-groundnormal-src-mq3-game-movement-ml-691282132"></a>
### groundNormal

```ml
groundNormal
```

Surface normal of the detected supporting ground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L54)

<a id="field-field-mq3-game-movement-movement-groundplane-groundplane-src-mq3-game-movement-ml-1432788296"></a>
### groundPlane

```ml
groundPlane
```

Nonzero when a usable ground plane has been detected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L52)

<a id="field-field-mq3-game-movement-movement-impactspeed-impactspeed-src-mq3-game-movement-ml-2093623068"></a>
### impactSpeed

```ml
impactSpeed
```

Speed projected onto a collision normal for impact handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L58)

<a id="field-field-mq3-game-movement-movement-mask-mask-src-mq3-game-movement-ml-1209622464"></a>
### mask

```ml
mask
```

Mask selecting the collision or filter categories used by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L32)

<a id="field-field-mq3-game-movement-movement-maxs-maxs-src-mq3-game-movement-ml-685996694"></a>
### maxs

```ml
maxs
```

Upper player collision-box corner relative to the working movement origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L28)

<a id="field-field-mq3-game-movement-movement-mins-mins-src-mq3-game-movement-ml-163993358"></a>
### mins

```ml
mins
```

Lower player collision-box corner relative to the working movement origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L26)

<a id="field-field-mq3-game-movement-movement-origin-origin-src-mq3-game-movement-ml-702060012"></a>
### origin

```ml
origin
```

Working player position updated by collision-aware movement integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L22)

<a id="field-field-mq3-game-movement-movement-pmflags-pmflags-src-mq3-game-movement-ml-2121022532"></a>
### pmFlags

```ml
pmFlags
```

Player movement flags supplied to the bot or movement adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L38)

<a id="field-field-mq3-game-movement-movement-pmtime-pmtime-src-mq3-game-movement-ml-567692716"></a>
### pmTime

```ml
pmTime
```

Remaining movement timer supplied to the bot or movement adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L36)

<a id="field-field-mq3-game-movement-movement-pmtype-pmtype-src-mq3-game-movement-ml-682613482"></a>
### pmType

```ml
pmType
```

Player movement mode supplied to the bot or movement adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L40)

<a id="field-field-mq3-game-movement-movement-speed-speed-src-mq3-game-movement-ml-153713680"></a>
### speed

```ml
speed
```

Movement or travel speed used by this game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L42)

<a id="field-field-mq3-game-movement-movement-touches-touches-src-mq3-game-movement-ml-716275744"></a>
### touches

```ml
touches
```

Entity contacts collected during the movement step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L60)

<a id="field-field-mq3-game-movement-movement-tracefn-tracefn-src-mq3-game-movement-ml-1773679352"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Movement service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L68)

<a id="field-field-mq3-game-movement-movement-velocity-velocity-src-mq3-game-movement-ml-1733754478"></a>
### velocity

```ml
velocity
```

Velocity vector used to advance movement or predict a position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L24)

<a id="field-field-mq3-game-movement-movement-walking-walking-src-mq3-game-movement-ml-695414896"></a>
### walking

```ml
walking
```

Nonzero when the movement controller established walkable ground contact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L50)

<a id="field-field-mq3-game-movement-movement-waterlevel-waterlevel-src-mq3-game-movement-ml-2103226462"></a>
### waterlevel

```ml
waterlevel
```

Depth classification of the player immersion in liquid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L46)
