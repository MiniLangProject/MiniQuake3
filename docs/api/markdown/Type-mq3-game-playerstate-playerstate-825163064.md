# `mq3.game.playerstate.PlayerState`

[Home](README.md) · [Source file](File-src-mq3-game-playerstate-ml-1407876292.md)

<a id="struct-struct-mq3-game-playerstate-playerstate-struct-playerstate-src-mq3-game-playerstate-ml-242082081"></a>
## PlayerState

```ml
struct PlayerState
```

`PlayerState` record for playerstate, containing `commandTime`, `pm_type`, `bobCycle`, `pm_flags` and `pm_time` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L10)

## Members

<a id="field-field-mq3-game-playerstate-playerstate-ammo-ammo-src-mq3-game-playerstate-ml-1172473263"></a>
### ammo

```ml
ammo
```

Per-weapon ammunition counts carried by the player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L86)

<a id="field-field-mq3-game-playerstate-playerstate-bobcycle-bobcycle-src-mq3-game-playerstate-ml-1190934889"></a>
### bobCycle

```ml
bobCycle
```

Walking-bob phase counter used to synchronize player movement and presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L16)

<a id="field-field-mq3-game-playerstate-playerstate-clientnum-clientnum-src-mq3-game-playerstate-ml-775416219"></a>
### clientNum

```ml
clientNum
```

Client slot number represented by this player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L62)

<a id="field-field-mq3-game-playerstate-playerstate-commandtime-commandtime-src-mq3-game-playerstate-ml-223777171"></a>
### commandTime

```ml
commandTime
```

Server timestamp of the last user command represented by this player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L12)

<a id="field-field-mq3-game-playerstate-playerstate-damagecount-damagecount-src-mq3-game-playerstate-ml-1245394991"></a>
### damageCount

```ml
damageCount
```

Damage amount exposed to the client for the current damage response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L78)

<a id="field-field-mq3-game-playerstate-playerstate-damageevent-damageevent-src-mq3-game-playerstate-ml-144624019"></a>
### damageEvent

```ml
damageEvent
```

Sequence/toggle value notifying the client that a new damage response is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L72)

<a id="field-field-mq3-game-playerstate-playerstate-damagepitch-damagepitch-src-mq3-game-playerstate-ml-1783383995"></a>
### damagePitch

```ml
damagePitch
```

Encoded vertical direction from which the last damage arrived.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L76)

<a id="field-field-mq3-game-playerstate-playerstate-damageyaw-damageyaw-src-mq3-game-playerstate-ml-2109611695"></a>
### damageYaw

```ml
damageYaw
```

Encoded horizontal direction from which the last damage arrived.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L74)

<a id="field-field-mq3-game-playerstate-playerstate-delta-angles-delta-angles-src-mq3-game-playerstate-ml-654631433"></a>
### delta_angles

```ml
delta_angles
```

Angle offsets added to user-command angles to obtain the current view direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L32)

<a id="field-field-mq3-game-playerstate-playerstate-eflags-eflags-src-mq3-game-playerstate-ml-62416247"></a>
### eFlags

```ml
eFlags
```

Network-visible entity flags selected from the EF_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L48)

<a id="field-field-mq3-game-playerstate-playerstate-entityeventsequence-entityeventsequence-src-mq3-game-playerstate-ml-2079911471"></a>
### entityEventSequence

```ml
entityEventSequence
```

Player event sequence already propagated into entity-state events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L101)

<a id="field-field-mq3-game-playerstate-playerstate-eventparms-eventparms-src-mq3-game-playerstate-ml-462522677"></a>
### eventParms

```ml
eventParms
```

Parameters paired with the predictable event identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L54)

<a id="field-field-mq3-game-playerstate-playerstate-events-events-src-mq3-game-playerstate-ml-1484875413"></a>
### events

```ml
events
```

Event identifiers retained by this player or game-state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L52)

<a id="field-field-mq3-game-playerstate-playerstate-eventsequence-eventsequence-src-mq3-game-playerstate-ml-572567315"></a>
### eventSequence

```ml
eventSequence
```

Sequence number used to distinguish new predictable player events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L50)

<a id="field-field-mq3-game-playerstate-playerstate-externalevent-externalevent-src-mq3-game-playerstate-ml-1883845475"></a>
### externalEvent

```ml
externalEvent
```

Event injected by the server outside the normal predictable event ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L56)

<a id="field-field-mq3-game-playerstate-playerstate-externaleventparm-externaleventparm-src-mq3-game-playerstate-ml-1012486387"></a>
### externalEventParm

```ml
externalEventParm
```

Parameter paired with the externally injected event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L58)

<a id="field-field-mq3-game-playerstate-playerstate-externaleventtime-externaleventtime-src-mq3-game-playerstate-ml-2080762719"></a>
### externalEventTime

```ml
externalEventTime
```

Timestamp of the externally injected event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L60)

<a id="field-field-mq3-game-playerstate-playerstate-generic1-generic1-src-mq3-game-playerstate-ml-505593179"></a>
### generic1

```ml
generic1
```

Protocol-defined auxiliary entity/player value whose interpretation depends on the game object type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L89)

<a id="field-field-mq3-game-playerstate-playerstate-grapplepoint-grapplepoint-src-mq3-game-playerstate-ml-1326384425"></a>
### grapplePoint

```ml
grapplePoint
```

World-space attachment point of the active grappling hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L46)

<a id="field-field-mq3-game-playerstate-playerstate-gravity-gravity-src-mq3-game-playerstate-ml-1812339175"></a>
### gravity

```ml
gravity
```

Downward acceleration used by the player or entity movement simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L28)

<a id="field-field-mq3-game-playerstate-playerstate-groundentitynum-groundentitynum-src-mq3-game-playerstate-ml-1447392847"></a>
### groundEntityNum

```ml
groundEntityNum
```

Entity number supporting the player, or ENTITYNUM_NONE while airborne.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L34)

<a id="field-field-mq3-game-playerstate-playerstate-jumppad-ent-jumppad-ent-src-mq3-game-playerstate-ml-655140299"></a>
### jumppad_ent

```ml
jumppad_ent
```

Entity number of the jump pad most recently affecting this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L93)

<a id="field-field-mq3-game-playerstate-playerstate-jumppad-frame-jumppad-frame-src-mq3-game-playerstate-ml-897304051"></a>
### jumppad_frame

```ml
jumppad_frame
```

Movement-frame number on which the jump pad last affected this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L99)

<a id="field-field-mq3-game-playerstate-playerstate-legsanim-legsanim-src-mq3-game-playerstate-ml-1421326407"></a>
### legsAnim

```ml
legsAnim
```

Leg-animation identifier including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L38)

<a id="field-field-mq3-game-playerstate-playerstate-legstimer-legstimer-src-mq3-game-playerstate-ml-219641191"></a>
### legsTimer

```ml
legsTimer
```

Remaining time for an uninterruptible leg animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L36)

<a id="field-field-mq3-game-playerstate-playerstate-loopsound-loopsound-src-mq3-game-playerstate-ml-1516486151"></a>
### loopSound

```ml
loopSound
```

Continuously playing sound identifier associated with the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L91)

<a id="field-field-mq3-game-playerstate-playerstate-movementdir-movementdir-src-mq3-game-playerstate-ml-292736263"></a>
### movementDir

```ml
movementDir
```

Encoded movement direction used to orient the player animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L44)

<a id="field-field-mq3-game-playerstate-playerstate-origin-origin-src-mq3-game-playerstate-ml-828843319"></a>
### origin

```ml
origin
```

Player world-space position stored in the shared movement and snapshot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L22)

<a id="field-field-mq3-game-playerstate-playerstate-persistant-persistant-src-mq3-game-playerstate-ml-836281989"></a>
### persistant

```ml
persistant
```

Player statistics indexed by PERS_* that survive ordinary respawns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L82)

<a id="field-field-mq3-game-playerstate-playerstate-ping-ping-src-mq3-game-playerstate-ml-1406229763"></a>
### ping

```ml
ping
```

Most recently measured client latency value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L95)

<a id="field-field-mq3-game-playerstate-playerstate-pm-flags-pm-flags-src-mq3-game-playerstate-ml-1286804925"></a>
### pm_flags

```ml
pm_flags
```

Player movement flags selected from the PMF_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L18)

<a id="field-field-mq3-game-playerstate-playerstate-pm-time-pm-time-src-mq3-game-playerstate-ml-1116067843"></a>
### pm_time

```ml
pm_time
```

Remaining movement-timer value used by timed movement restrictions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L20)

<a id="field-field-mq3-game-playerstate-playerstate-pm-type-pm-type-src-mq3-game-playerstate-ml-29205251"></a>
### pm_type

```ml
pm_type
```

Player movement mode, such as normal movement, spectator movement, or death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L14)

<a id="field-field-mq3-game-playerstate-playerstate-pmove-framecount-pmove-framecount-src-mq3-game-playerstate-ml-1067074295"></a>
### pmove_framecount

```ml
pmove_framecount
```

Counter of completed player-movement frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L97)

<a id="field-field-mq3-game-playerstate-playerstate-powerups-powerups-src-mq3-game-playerstate-ml-347125"></a>
### powerups

```ml
powerups
```

Powerup state or expiration values indexed by PW_* identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L84)

<a id="field-field-mq3-game-playerstate-playerstate-speed-speed-src-mq3-game-playerstate-ml-1351666115"></a>
### speed

```ml
speed
```

Movement or travel speed used by this game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L30)

<a id="field-field-mq3-game-playerstate-playerstate-stats-stats-src-mq3-game-playerstate-ml-1027578891"></a>
### stats

```ml
stats
```

Player statistics indexed by the STAT_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L80)

<a id="field-field-mq3-game-playerstate-playerstate-torsoanim-torsoanim-src-mq3-game-playerstate-ml-598397431"></a>
### torsoAnim

```ml
torsoAnim
```

Torso-animation identifier including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L42)

<a id="field-field-mq3-game-playerstate-playerstate-torsotimer-torsotimer-src-mq3-game-playerstate-ml-102654967"></a>
### torsoTimer

```ml
torsoTimer
```

Remaining time for an uninterruptible torso animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L40)

<a id="field-field-mq3-game-playerstate-playerstate-velocity-velocity-src-mq3-game-playerstate-ml-1073853617"></a>
### velocity

```ml
velocity
```

Velocity vector used to advance movement or predict a position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L24)

<a id="field-field-mq3-game-playerstate-playerstate-viewangles-viewangles-src-mq3-game-playerstate-ml-1384780501"></a>
### viewangles

```ml
viewangles
```

Player or bot viewing angles used for aiming and command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L68)

<a id="field-field-mq3-game-playerstate-playerstate-viewheight-viewheight-src-mq3-game-playerstate-ml-698316759"></a>
### viewheight

```ml
viewheight
```

Eye-height offset above the player origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L70)

<a id="field-field-mq3-game-playerstate-playerstate-weapon-weapon-src-mq3-game-playerstate-ml-35515191"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L64)

<a id="field-field-mq3-game-playerstate-playerstate-weaponstate-weaponstate-src-mq3-game-playerstate-ml-872712587"></a>
### weaponstate

```ml
weaponstate
```

Current weapon-state-machine stage, such as ready, firing, or changing weapons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L66)

<a id="field-field-mq3-game-playerstate-playerstate-weapontime-weapontime-src-mq3-game-playerstate-ml-288689597"></a>
### weaponTime

```ml
weaponTime
```

Remaining weapon cooldown or transition time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/playerstate.ml#L26)
