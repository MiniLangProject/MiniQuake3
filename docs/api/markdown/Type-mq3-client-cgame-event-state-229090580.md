# `mq3.client.cgame_event.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-event-ml-1436945917.md)

<a id="struct-struct-mq3-client-cgame-event-state-struct-state-src-mq3-client-cgame-event-ml-1257389307"></a>
## State

```ml
struct State
```

Stores client game event state, including `previousEvents`, `eventOnly`, `seenTime`, `painTime`, `painDirection`, `time` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L84)

## Members

<a id="field-field-mq3-client-cgame-event-state-audio-audio-src-mq3-client-cgame-event-ml-2057469718"></a>
### audio

```ml
audio
```

Decoded event actions addressed to sound playback, separated from rendering and HUD requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L134)

<a id="field-field-mq3-client-cgame-event-state-decoded-decoded-src-mq3-client-cgame-event-ml-1869872966"></a>
### decoded

```ml
decoded
```

Number of entity events successfully decoded into event records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L145)

<a id="field-field-mq3-client-cgame-event-state-demoplayback-demoplayback-src-mq3-client-cgame-event-ml-1517648726"></a>
### demoPlayback

```ml
demoPlayback
```

True when snapshots and commands are being read from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L101)

<a id="field-field-mq3-client-cgame-event-state-dispatched-dispatched-src-mq3-client-cgame-event-ml-1385441996"></a>
### dispatched

```ml
dispatched
```

Number of decoded event actions marked for native dispatch rather than suppressed by retail-QVM ownership.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L148)

<a id="field-field-mq3-client-cgame-event-state-errors-errors-src-mq3-client-cgame-event-ml-820635160"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L143)

<a id="field-field-mq3-client-cgame-event-state-eventonly-eventonly-src-mq3-client-cgame-event-ml-1262074838"></a>
### eventOnly

```ml
eventOnly
```

When constructing this record, `create` supplies `array(maxEntities,false)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L88)

<a id="field-field-mq3-client-cgame-event-state-follow-follow-src-mq3-client-cgame-event-ml-236183204"></a>
### follow

```ml
follow
```

True when the snapshot player state follows another client, disabling the local prediction-only movement feedback path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L104)

<a id="field-field-mq3-client-cgame-event-state-hud-hud-src-mq3-client-cgame-event-ml-1840781022"></a>
### hud

```ml
hud
```

Decoded event actions that update the local HUD, including item and weapon feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L138)

<a id="field-field-mq3-client-cgame-event-state-itempickup-itempickup-src-mq3-client-cgame-event-ml-1889906984"></a>
### itemPickup

```ml
itemPickup
```

Item identifier shown by the most recent pickup notification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L118)

<a id="field-field-mq3-client-cgame-event-state-itempickupblendtime-itempickupblendtime-src-mq3-client-cgame-event-ml-70566930"></a>
### itemPickupBlendTime

```ml
itemPickupBlendTime
```

Independent timestamp for the pickup pulse around the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L122)

<a id="field-field-mq3-client-cgame-event-state-itempickuptime-itempickuptime-src-mq3-client-cgame-event-ml-1904610990"></a>
### itemPickupTime

```ml
itemPickupTime
```

Timestamp at which the most recent item-pickup notification began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L120)

<a id="field-field-mq3-client-cgame-event-state-landchange-landchange-src-mq3-client-cgame-event-ml-925136288"></a>
### landChange

```ml
landChange
```

Eye-height displacement used for the landing camera kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L116)

<a id="field-field-mq3-client-cgame-event-state-landtime-landtime-src-mq3-client-cgame-event-ml-1155914070"></a>
### landTime

```ml
landTime
```

Client timestamp at which the landing camera kick began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L114)

<a id="field-field-mq3-client-cgame-event-state-nopredict-nopredict-src-mq3-client-cgame-event-ml-815550006"></a>
### noPredict

```ml
noPredict
```

Disables the prediction-only event feedback used for the local player's movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L106)

<a id="field-field-mq3-client-cgame-event-state-paindirection-paindirection-src-mq3-client-cgame-event-ml-1769885914"></a>
### painDirection

```ml
painDirection
```

Alternating direction selector used for the player's pain animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L94)

<a id="field-field-mq3-client-cgame-event-state-paintime-paintime-src-mq3-client-cgame-event-ml-249905244"></a>
### painTime

```ml
painTime
```

Client timestamp of the last pain reaction, used to animate the flinch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L92)

<a id="field-field-mq3-client-cgame-event-state-powerupactive-powerupactive-src-mq3-client-cgame-event-ml-34050790"></a>
### powerupActive

```ml
powerupActive
```

Powerup identifier currently emphasized by the HUD flash animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L128)

<a id="field-field-mq3-client-cgame-event-state-poweruptime-poweruptime-src-mq3-client-cgame-event-ml-329647886"></a>
### powerupTime

```ml
powerupTime
```

Timestamp at which the active powerup's HUD emphasis began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L130)

<a id="field-field-mq3-client-cgame-event-state-predictedclient-predictedclient-src-mq3-client-cgame-event-ml-1036865466"></a>
### predictedClient

```ml
predictedClient
```

Client slot from the snapshot player state, used to restrict local pickup and movement feedback to the viewed player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L99)

<a id="field-field-mq3-client-cgame-event-state-previousevents-previousevents-src-mq3-client-cgame-event-ml-486224374"></a>
### previousEvents

```ml
previousEvents
```

When constructing this record, `create` supplies `array(maxEntities,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L86)

<a id="field-field-mq3-client-cgame-event-state-records-records-src-mq3-client-cgame-event-ml-1382224454"></a>
### records

```ml
records
```

Decoded entity-event records, including their effective source entity and generated host actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L132)

<a id="field-field-mq3-client-cgame-event-state-render-render-src-mq3-client-cgame-event-ml-1570832814"></a>
### render

```ml
render
```

Decoded event actions addressed to scene effects, separated from audio and HUD requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L136)

<a id="field-field-mq3-client-cgame-event-state-seentime-seentime-src-mq3-client-cgame-event-ml-298099878"></a>
### seenTime

```ml
seenTime
```

When constructing this record, `create` supplies `array(maxEntities,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L90)

<a id="field-field-mq3-client-cgame-event-state-stateactions-stateactions-src-mq3-client-cgame-event-ml-1721262718"></a>
### stateActions

```ml
stateActions
```

Decoded event actions outside the audio, render, and HUD queues, retained for client-state handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L141)

<a id="field-field-mq3-client-cgame-event-state-stepchange-stepchange-src-mq3-client-cgame-event-ml-1317314238"></a>
### stepChange

```ml
stepChange
```

Vertical step displacement being smoothed by the first-person camera.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L112)

<a id="field-field-mq3-client-cgame-event-state-steptime-steptime-src-mq3-client-cgame-event-ml-78656196"></a>
### stepTime

```ml
stepTime
```

Client timestamp at which stair-step smoothing began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L110)

<a id="field-field-mq3-client-cgame-event-state-suppressed-suppressed-src-mq3-client-cgame-event-ml-1653868294"></a>
### suppressed

```ml
suppressed
```

Number of decoded event actions withheld from native dispatch because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L151)

<a id="field-field-mq3-client-cgame-event-state-synchronous-synchronous-src-mq3-client-cgame-event-ml-2075851930"></a>
### synchronous

```ml
synchronous
```

Marks synchronous-client operation, which bypasses prediction-only local movement feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L108)

<a id="field-field-mq3-client-cgame-event-state-time-time-src-mq3-client-cgame-event-ml-1856455012"></a>
### time

```ml
time
```

Current event-processing time in milliseconds, set from the snapshot being consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L96)

<a id="field-field-mq3-client-cgame-event-state-weaponselect-weaponselect-src-mq3-client-cgame-event-ml-1171536310"></a>
### weaponSelect

```ml
weaponSelect
```

Weapon identifier currently selected by the local player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L124)

<a id="field-field-mq3-client-cgame-event-state-weaponselecttime-weaponselecttime-src-mq3-client-cgame-event-ml-1426912052"></a>
### weaponSelectTime

```ml
weaponSelectTime
```

Timestamp at which the weapon-selection display was last refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_event.ml#L126)
