# `mq3.client.cgame_playerstate.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-playerstate-ml-1837037411.md)

<a id="struct-struct-mq3-client-cgame-playerstate-state-struct-state-src-mq3-client-cgame-playerstate-ml-1943649839"></a>
## State

```ml
struct State
```

Stores client game playerstate state, including `time`, `serverTime`, `gametype`, `timelimit`, `levelStartTime`, `fraglimit` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L141)

## Members

<a id="field-field-mq3-client-cgame-playerstate-state-actions-actions-src-mq3-client-cgame-playerstate-ml-1132142190"></a>
### actions

```ml
actions
```

Host requests queued while handling player-state changes such as damage, pickups, and local sounds, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L217)

<a id="field-field-mq3-client-cgame-playerstate-state-attackertime-attackertime-src-mq3-client-cgame-playerstate-ml-2084529202"></a>
### attackerTime

```ml
attackerTime
```

Timestamp used to time the latest attacker's HUD indication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L171)

<a id="field-field-mq3-client-cgame-playerstate-state-damagetime-damagetime-src-mq3-client-cgame-playerstate-ml-471854146"></a>
### damageTime

```ml
damageTime
```

Timestamp used to fade the latest damage overlay or view-kick effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L188)

<a id="field-field-mq3-client-cgame-playerstate-state-damagevalue-damagevalue-src-mq3-client-cgame-playerstate-ml-1214771122"></a>
### damageValue

```ml
damageValue
```

Magnitude of the latest damage event used to scale view kick and indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L183)

<a id="field-field-mq3-client-cgame-playerstate-state-damagex-damagex-src-mq3-client-cgame-playerstate-ml-1393604870"></a>
### damageX

```ml
damageX
```

Horizontal direction component of the latest damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L173)

<a id="field-field-mq3-client-cgame-playerstate-state-damagey-damagey-src-mq3-client-cgame-playerstate-ml-143662326"></a>
### damageY

```ml
damageY
```

Vertical direction component of the latest damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L175)

<a id="field-field-mq3-client-cgame-playerstate-state-duckchange-duckchange-src-mq3-client-cgame-playerstate-ml-1444569092"></a>
### duckChange

```ml
duckChange
```

Eye-height displacement being smoothed after a crouch transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L196)

<a id="field-field-mq3-client-cgame-playerstate-state-ducktime-ducktime-src-mq3-client-cgame-playerstate-ml-622748110"></a>
### duckTime

```ml
duckTime
```

Client timestamp at which crouch-height smoothing began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L198)

<a id="field-field-mq3-client-cgame-playerstate-state-eventsequence-eventsequence-src-mq3-client-cgame-playerstate-ml-1973550838"></a>
### eventSequence

```ml
eventSequence
```

Next sequence number in the predicted or entity event stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L200)

<a id="field-field-mq3-client-cgame-playerstate-state-fraglimit-fraglimit-src-mq3-client-cgame-playerstate-ml-1420211350"></a>
### fraglimit

```ml
fraglimit
```

When constructing this record, `create` supplies `0` for this member. Used by `checkLocalSounds` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L156)

<a id="field-field-mq3-client-cgame-playerstate-state-fraglimitwarnings-fraglimitwarnings-src-mq3-client-cgame-playerstate-ml-741338210"></a>
### fraglimitWarnings

```ml
fraglimitWarnings
```

Bitset recording which frag-limit warning thresholds have already been announced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L214)

<a id="field-field-mq3-client-cgame-playerstate-state-gametype-gametype-src-mq3-client-cgame-playerstate-ml-639853498"></a>
### gametype

```ml
gametype
```

Active game-rule identifier controlling rank, flag, reward, and frag-limit announcements.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L148)

<a id="field-field-mq3-client-cgame-playerstate-state-intermissionstarted-intermissionstarted-src-mq3-client-cgame-playerstate-ml-307928610"></a>
### intermissionStarted

```ml
intermissionStarted
```

True after intermission begins, suppressing gameplay-only presentation such as voice rewards.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L162)

<a id="field-field-mq3-client-cgame-playerstate-state-levelstarttime-levelstarttime-src-mq3-client-cgame-playerstate-ml-2063177540"></a>
### levelStartTime

```ml
levelStartTime
```

Server timestamp at which the level began, used by elapsed-match-time displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L153)

<a id="field-field-mq3-client-cgame-playerstate-state-lowammowarning-lowammowarning-src-mq3-client-cgame-playerstate-ml-809009998"></a>
### lowAmmoWarning

```ml
lowAmmoWarning
```

Ammunition-warning state: one means low ammunition and two means empty.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L169)

<a id="field-field-mq3-client-cgame-playerstate-state-maprestart-maprestart-src-mq3-client-cgame-playerstate-ml-1626150716"></a>
### mapRestart

```ml
mapRestart
```

True after a map restart, causing presentation and prediction state to be reinitialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L164)

<a id="field-field-mq3-client-cgame-playerstate-state-predictableevents-predictableevents-src-mq3-client-cgame-playerstate-ml-1034456234"></a>
### predictableEvents

```ml
predictableEvents
```

Ring of events generated by local player prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L202)

<a id="field-field-mq3-client-cgame-playerstate-state-rewardcount-rewardcount-src-mq3-client-cgame-playerstate-ml-1773520498"></a>
### rewardCount

```ml
rewardCount
```

Award count associated with each queued reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L210)

<a id="field-field-mq3-client-cgame-playerstate-state-rewardshader-rewardshader-src-mq3-client-cgame-playerstate-ml-328204394"></a>
### rewardShader

```ml
rewardShader
```

HUD shader associated with each queued reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L208)

<a id="field-field-mq3-client-cgame-playerstate-state-rewardsound-rewardsound-src-mq3-client-cgame-playerstate-ml-2029576786"></a>
### rewardSound

```ml
rewardSound
```

Sound resource associated with each queued reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L206)

<a id="field-field-mq3-client-cgame-playerstate-state-rewardstack-rewardstack-src-mq3-client-cgame-playerstate-ml-225913134"></a>
### rewardStack

```ml
rewardStack
```

Number or top position of queued reward announcements awaiting presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L204)

<a id="field-field-mq3-client-cgame-playerstate-state-scores1-scores1-src-mq3-client-cgame-playerstate-ml-1485525002"></a>
### scores1

```ml
scores1
```

First team or leading player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L158)

<a id="field-field-mq3-client-cgame-playerstate-state-servertime-servertime-src-mq3-client-cgame-playerstate-ml-180046450"></a>
### serverTime

```ml
serverTime
```

Server-state timestamp in milliseconds used to anchor recorded damage feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L146)

<a id="field-field-mq3-client-cgame-playerstate-state-thisframeteleport-thisframeteleport-src-mq3-client-cgame-playerstate-ml-1691938226"></a>
### thisFrameTeleport

```ml
thisFrameTeleport
```

True when the current snapshot transition represents a teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L190)

<a id="field-field-mq3-client-cgame-playerstate-state-time-time-src-mq3-client-cgame-playerstate-ml-154558864"></a>
### time

```ml
time
```

Client-game time in milliseconds used for damage feedback, respawn effects, and player-state announcements.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L144)

<a id="field-field-mq3-client-cgame-playerstate-state-timelimit-timelimit-src-mq3-client-cgame-playerstate-ml-223234866"></a>
### timelimit

```ml
timelimit
```

When constructing this record, `create` supplies `0` for this member. Used by `checkLocalSounds` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L151)

<a id="field-field-mq3-client-cgame-playerstate-state-timelimitwarnings-timelimitwarnings-src-mq3-client-cgame-playerstate-ml-190738022"></a>
### timelimitWarnings

```ml
timelimitWarnings
```

Bitset recording which time-limit warning thresholds have already been announced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L212)

<a id="field-field-mq3-client-cgame-playerstate-state-transitions-transitions-src-mq3-client-cgame-playerstate-ml-258894794"></a>
### transitions

```ml
transitions
```

When constructing this record, `create` supplies `0` for this member. Used by `transitionPlayerState` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L220)

<a id="field-field-mq3-client-cgame-playerstate-state-vdmgpitch-vdmgpitch-src-mq3-client-cgame-playerstate-ml-1356804414"></a>
### vDmgPitch

```ml
vDmgPitch
```

When constructing this record, `create` supplies `0.0` for this member. Used by `damageFeedback` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L181)

<a id="field-field-mq3-client-cgame-playerstate-state-vdmgroll-vdmgroll-src-mq3-client-cgame-playerstate-ml-1807956064"></a>
### vDmgRoll

```ml
vDmgRoll
```

When constructing this record, `create` supplies `0.0` for this member. Used by `damageFeedback` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L178)

<a id="field-field-mq3-client-cgame-playerstate-state-vdmgtime-vdmgtime-src-mq3-client-cgame-playerstate-ml-871729636"></a>
### vDmgTime

```ml
vDmgTime
```

When constructing this record, `create` supplies `0` for this member. Used by `damageFeedback` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L186)

<a id="field-field-mq3-client-cgame-playerstate-state-viewaxis-viewaxis-src-mq3-client-cgame-playerstate-ml-1221530946"></a>
### viewaxis

```ml
viewaxis
```

When constructing this record, `create` supplies `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for this member. Used by `damageFeedback` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L167)

<a id="field-field-mq3-client-cgame-playerstate-state-warmup-warmup-src-mq3-client-cgame-playerstate-ml-1133623510"></a>
### warmup

```ml
warmup
```

Warmup deadline or state supplied by the server's warmup configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L160)

<a id="field-field-mq3-client-cgame-playerstate-state-weaponselect-weaponselect-src-mq3-client-cgame-playerstate-ml-718103394"></a>
### weaponSelect

```ml
weaponSelect
```

Weapon identifier currently selected by the local player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L194)

<a id="field-field-mq3-client-cgame-playerstate-state-weaponselecttime-weaponselecttime-src-mq3-client-cgame-playerstate-ml-385826024"></a>
### weaponSelectTime

```ml
weaponSelectTime
```

Timestamp at which the weapon-selection display was last refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_playerstate.ml#L192)
