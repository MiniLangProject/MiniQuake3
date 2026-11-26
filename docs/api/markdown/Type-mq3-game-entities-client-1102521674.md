# `mq3.game.entities.Client`

[Home](README.md) · [Source file](File-src-mq3-game-entities-ml-1863725345.md)

<a id="struct-struct-mq3-game-entities-client-struct-client-src-mq3-game-entities-ml-16478019"></a>
## Client

```ml
struct Client
```

`Client` record for entities, containing `ps`, `team`, `cmdAngles`, `noclip` and `damage_armor` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L16)

## Members

<a id="field-field-mq3-game-entities-client-accuracy-hits-accuracy-hits-src-mq3-game-entities-ml-556037246"></a>
### accuracy_hits

```ml
accuracy_hits
```

Number of accuracy-eligible weapon hits credited to the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L42)

<a id="field-field-mq3-game-entities-client-accuracy-shots-accuracy-shots-src-mq3-game-entities-ml-555119944"></a>
### accuracy_shots

```ml
accuracy_shots
```

Number of accuracy-eligible shots fired by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L56)

<a id="field-field-mq3-game-entities-client-accuratecount-accuratecount-src-mq3-game-entities-ml-1470640738"></a>
### accurateCount

```ml
accurateCount
```

Consecutive accuracy/hit count used by player award logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L136)

<a id="field-field-mq3-game-entities-client-airouttime-airouttime-src-mq3-game-entities-ml-597124964"></a>
### airOutTime

```ml
airOutTime
```

Game timestamp at which the player runs out of breathable air.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L142)

<a id="field-field-mq3-game-entities-client-ammotimes-ammotimes-src-mq3-game-entities-ml-1695643174"></a>
### ammoTimes

```ml
ammoTimes
```

Per-weapon timing state used while replenishing or consuming ammunition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L152)

<a id="field-field-mq3-game-entities-client-assists-assists-src-mq3-game-entities-ml-1982837774"></a>
### assists

```ml
assists
```

Number of capture assists credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L86)

<a id="field-field-mq3-game-entities-client-basedefense-basedefense-src-mq3-game-entities-ml-1214589158"></a>
### basedefense

```ml
basedefense
```

Count of base-defense awards credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L78)

<a id="field-field-mq3-game-entities-client-buttons-buttons-src-mq3-game-entities-ml-1183319642"></a>
### buttons

```ml
buttons
```

Button bits from the current user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L128)

<a id="field-field-mq3-game-entities-client-captures-captures-src-mq3-game-entities-ml-1933337760"></a>
### captures

```ml
captures
```

Number of flag captures credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L82)

<a id="field-field-mq3-game-entities-client-carrierdefense-carrierdefense-src-mq3-game-entities-ml-1653169726"></a>
### carrierdefense

```ml
carrierdefense
```

Count of flag-carrier defense awards credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L76)

<a id="field-field-mq3-game-entities-client-cmdangles-cmdangles-src-mq3-game-entities-ml-1612164462"></a>
### cmdAngles

```ml
cmdAngles
```

View-angle values supplied by the current input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L22)

<a id="field-field-mq3-game-entities-client-cmdbuttons-cmdbuttons-src-mq3-game-entities-ml-846540240"></a>
### cmdButtons

```ml
cmdButtons
```

Button bits supplied by the current input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L118)

<a id="field-field-mq3-game-entities-client-cmdforwardmove-cmdforwardmove-src-mq3-game-entities-ml-574977698"></a>
### cmdForwardmove

```ml
cmdForwardmove
```

Forward/backward movement request carried by the input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L120)

<a id="field-field-mq3-game-entities-client-cmdrightmove-cmdrightmove-src-mq3-game-entities-ml-1306078924"></a>
### cmdRightmove

```ml
cmdRightmove
```

Right/left movement request carried by the input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L122)

<a id="field-field-mq3-game-entities-client-cmdservertime-cmdservertime-src-mq3-game-entities-ml-2029254974"></a>
### cmdServerTime

```ml
cmdServerTime
```

Server-time value carried by the current input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L116)

<a id="field-field-mq3-game-entities-client-cmdupmove-cmdupmove-src-mq3-game-entities-ml-1777130274"></a>
### cmdUpmove

```ml
cmdUpmove
```

Up/down movement request carried by the input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L124)

<a id="field-field-mq3-game-entities-client-cmdweapon-cmdweapon-src-mq3-game-entities-ml-1558123918"></a>
### cmdWeapon

```ml
cmdWeapon
```

Weapon selection requested by the input command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L70)

<a id="field-field-mq3-game-entities-client-connected-connected-src-mq3-game-entities-ml-2090287342"></a>
### connected

```ml
connected
```

Client connection state used to distinguish disconnected, connecting, and active clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L46)

<a id="field-field-mq3-game-entities-client-damage-armor-damage-armor-src-mq3-game-entities-ml-1545757928"></a>
### damage_armor

```ml
damage_armor
```

Accumulated damage absorbed by armor before the damage feedback is emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L26)

<a id="field-field-mq3-game-entities-client-damage-blood-damage-blood-src-mq3-game-entities-ml-806630950"></a>
### damage_blood

```ml
damage_blood
```

Accumulated damage applied to health before the damage feedback is emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L28)

<a id="field-field-mq3-game-entities-client-damage-from-damage-from-src-mq3-game-entities-ml-1506764054"></a>
### damage_from

```ml
damage_from
```

Direction or position used to calculate the incoming-damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L32)

<a id="field-field-mq3-game-entities-client-damage-fromworld-damage-fromworld-src-mq3-game-entities-ml-604758670"></a>
### damage_fromWorld

```ml
damage_fromWorld
```

Nonzero when the accumulated damage came from the world rather than an ordinary attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L34)

<a id="field-field-mq3-game-entities-client-damage-knockback-damage-knockback-src-mq3-game-entities-ml-1194698264"></a>
### damage_knockback

```ml
damage_knockback
```

Accumulated knockback contribution of recent damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L30)

<a id="field-field-mq3-game-entities-client-entertime-entertime-src-mq3-game-entities-ml-223177318"></a>
### enterTime

```ml
enterTime
```

Game timestamp at which the client entered play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L54)

<a id="field-field-mq3-game-entities-client-fireheld-fireheld-src-mq3-game-entities-ml-1523982208"></a>
### fireHeld

```ml
fireHeld
```

Nonzero while the weapon firing control is held across frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L144)

<a id="field-field-mq3-game-entities-client-flagrecovery-flagrecovery-src-mq3-game-entities-ml-421444004"></a>
### flagrecovery

```ml
flagrecovery
```

Number of own-flag recoveries credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L84)

<a id="field-field-mq3-game-entities-client-flagsince-flagsince-src-mq3-game-entities-ml-1136876306"></a>
### flagsince

```ml
flagsince
```

Timestamp at which the player started carrying the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L90)

<a id="field-field-mq3-game-entities-client-fragcarrier-fragcarrier-src-mq3-game-entities-ml-1717862594"></a>
### fragcarrier

```ml
fragcarrier
```

Number of enemy flag-carrier kills credited to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L74)

<a id="field-field-mq3-game-entities-client-hook-hook-src-mq3-game-entities-ml-834527896"></a>
### hook

```ml
hook
```

Active grappling-hook entity associated with the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L44)

<a id="field-field-mq3-game-entities-client-inactivitytime-inactivitytime-src-mq3-game-entities-ml-30316112"></a>
### inactivityTime

```ml
inactivityTime
```

Deadline after which an inactive client is removed or moved to spectators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L138)

<a id="field-field-mq3-game-entities-client-inactivitywarning-inactivitywarning-src-mq3-game-entities-ml-1903817894"></a>
### inactivityWarning

```ml
inactivityWarning
```

Nonzero after the client has received its inactivity warning.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L140)

<a id="field-field-mq3-game-entities-client-initialspawn-initialspawn-src-mq3-game-entities-ml-41603092"></a>
### initialSpawn

```ml
initialSpawn
```

Nonzero while selecting or performing the client first spawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L94)

<a id="field-field-mq3-game-entities-client-invulnerabilitytime-invulnerabilitytime-src-mq3-game-entities-ml-716790174"></a>
### invulnerabilityTime

```ml
invulnerabilityTime
```

Expiration time of the mission-pack invulnerability effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L154)

<a id="field-field-mq3-game-entities-client-lastcmdtime-lastcmdtime-src-mq3-game-entities-ml-1328847006"></a>
### lastCmdTime

```ml
lastCmdTime
```

Timestamp of the most recently received user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L126)

<a id="field-field-mq3-game-entities-client-lastfraggedcarrier-lastfraggedcarrier-src-mq3-game-entities-ml-1197256686"></a>
### lastfraggedcarrier

```ml
lastfraggedcarrier
```

Timestamp at which this player last killed an enemy flag carrier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L72)

<a id="field-field-mq3-game-entities-client-lasthurt-client-lasthurt-client-src-mq3-game-entities-ml-833944034"></a>
### lasthurt_client

```ml
lasthurt_client
```

Client identifier credited with the most recent incoming damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L36)

<a id="field-field-mq3-game-entities-client-lasthurt-mod-lasthurt-mod-src-mq3-game-entities-ml-1290911646"></a>
### lasthurt_mod

```ml
lasthurt_mod
```

Cause-of-damage identifier for the most recent incoming damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L38)

<a id="field-field-mq3-game-entities-client-lasthurtcarrier-lasthurtcarrier-src-mq3-game-entities-ml-658204646"></a>
### lasthurtcarrier

```ml
lasthurtcarrier
```

Timestamp at which this player last damaged the flag carrier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L40)

<a id="field-field-mq3-game-entities-client-lastkilled-client-lastkilled-client-src-mq3-game-entities-ml-680616346"></a>
### lastkilled_client

```ml
lastkilled_client
```

Client identifier of the most recent player killed by this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L62)

<a id="field-field-mq3-game-entities-client-lastkilltime-lastkilltime-src-mq3-game-entities-ml-1669863992"></a>
### lastKillTime

```ml
lastKillTime
```

Timestamp of the most recent kill credited to this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L68)

<a id="field-field-mq3-game-entities-client-lastreturnedflag-lastreturnedflag-src-mq3-game-entities-ml-1701331864"></a>
### lastreturnedflag

```ml
lastreturnedflag
```

Timestamp at which the player last returned its team flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L88)

<a id="field-field-mq3-game-entities-client-latched-buttons-latched-buttons-src-mq3-game-entities-ml-1178084522"></a>
### latched_buttons

```ml
latched_buttons
```

Button presses retained until game logic consumes the transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L132)

<a id="field-field-mq3-game-entities-client-localclient-localclient-src-mq3-game-entities-ml-324905894"></a>
### localClient

```ml
localClient
```

Nonzero when this client is the local listen-server client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L92)

<a id="field-field-mq3-game-entities-client-losses-losses-src-mq3-game-entities-ml-1915912964"></a>
### losses

```ml
losses
```

Tournament losses retained in the client session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L112)

<a id="field-field-mq3-game-entities-client-maxhealth-maxhealth-src-mq3-game-entities-ml-412086150"></a>
### maxHealth

```ml
maxHealth
```

Maximum normal health used when spawning or replenishing the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L98)

<a id="field-field-mq3-game-entities-client-netname-netname-src-mq3-game-entities-ml-2134325486"></a>
### netname

```ml
netname
```

Player name advertised in user information and score/chat messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L58)

<a id="field-field-mq3-game-entities-client-noclip-noclip-src-mq3-game-entities-ml-384334480"></a>
### noclip

```ml
noclip
```

Nonzero when movement bypasses normal world collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L24)

<a id="field-field-mq3-game-entities-client-oldbuttons-oldbuttons-src-mq3-game-entities-ml-266727822"></a>
### oldbuttons

```ml
oldbuttons
```

Button bits from the preceding user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L130)

<a id="field-field-mq3-game-entities-client-oldorigin-oldorigin-src-mq3-game-entities-ml-310349142"></a>
### oldOrigin

```ml
oldOrigin
```

Previously recorded origin, used to compare or interpolate movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L134)

<a id="field-field-mq3-game-entities-client-persistantpowerup-persistantpowerup-src-mq3-game-entities-ml-1528498878"></a>
### persistantPowerup

```ml
persistantPowerup
```

Persistent team-arena powerup currently associated with the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L150)

<a id="field-field-mq3-game-entities-client-pmovefixed-pmovefixed-src-mq3-game-entities-ml-2107344100"></a>
### pmoveFixed

```ml
pmoveFixed
```

Nonzero when player movement uses a fixed simulation step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L96)

<a id="field-field-mq3-game-entities-client-portalid-portalid-src-mq3-game-entities-ml-1242485548"></a>
### portalID

```ml
portalID
```

Identifier linking a client portal source and destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L156)

<a id="field-field-mq3-game-entities-client-predictitempickup-predictitempickup-src-mq3-game-entities-ml-1388260414"></a>
### predictItemPickup

```ml
predictItemPickup
```

Nonzero when the client is allowed to predict item pickups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L80)

<a id="field-field-mq3-game-entities-client-ps-ps-src-mq3-game-entities-ml-1862165752"></a>
### ps

```ml
ps
```

Authoritative player state used for movement, prediction, and snapshot delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L18)

<a id="field-field-mq3-game-entities-client-readytoexit-readytoexit-src-mq3-game-entities-ml-778227910"></a>
### readyToExit

```ml
readyToExit
```

Nonzero when this client or match is ready to leave the intermission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L60)

<a id="field-field-mq3-game-entities-client-respawntime-respawntime-src-mq3-game-entities-ml-1432941410"></a>
### respawnTime

```ml
respawnTime
```

Timestamp associated with the client or bot next respawn decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L64)

<a id="field-field-mq3-game-entities-client-rewardtime-rewardtime-src-mq3-game-entities-ml-1969675134"></a>
### rewardTime

```ml
rewardTime
```

Timestamp at which the current player award/reward display expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L66)

<a id="field-field-mq3-game-entities-client-spectatorclient-spectatorclient-src-mq3-game-entities-ml-253613438"></a>
### spectatorClient

```ml
spectatorClient
```

Client slot being followed by a spectator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L50)

<a id="field-field-mq3-game-entities-client-spectatorstate-spectatorstate-src-mq3-game-entities-ml-247794942"></a>
### spectatorState

```ml
spectatorState
```

Spectator mode selected from the SPECTATOR_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L48)

<a id="field-field-mq3-game-entities-client-spectatortime-spectatortime-src-mq3-game-entities-ml-1027260518"></a>
### spectatorTime

```ml
spectatorTime
```

Timestamp used to order spectators waiting to enter play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L52)

<a id="field-field-mq3-game-entities-client-switchteamtime-switchteamtime-src-mq3-game-entities-ml-1636177206"></a>
### switchTeamTime

```ml
switchTeamTime
```

Deadline before which the client may not switch teams again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L146)

<a id="field-field-mq3-game-entities-client-team-team-src-mq3-game-entities-ml-1434104640"></a>
### team

```ml
team
```

Team assignment associated with the client, bot, or action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L20)

<a id="field-field-mq3-game-entities-client-teaminfo-teaminfo-src-mq3-game-entities-ml-1174172644"></a>
### teamInfo

```ml
teamInfo
```

Nonzero when this client requests team-overlay information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L108)

<a id="field-field-mq3-game-entities-client-teamleader-teamleader-src-mq3-game-entities-ml-2143785854"></a>
### teamLeader

```ml
teamLeader
```

Nonzero when this client is the designated leader of its team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L114)

<a id="field-field-mq3-game-entities-client-teamstatelocation-teamstatelocation-src-mq3-game-entities-ml-2106880610"></a>
### teamStateLocation

```ml
teamStateLocation
```

Team-location identifier advertised for the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L102)

<a id="field-field-mq3-game-entities-client-teamstatestate-teamstatestate-src-mq3-game-entities-ml-2015843292"></a>
### teamStateState

```ml
teamStateState
```

Team participation state used by spawn/team rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L100)

<a id="field-field-mq3-game-entities-client-teamvotecount-teamvotecount-src-mq3-game-entities-ml-1557174322"></a>
### teamVoteCount

```ml
teamVoteCount
```

Number of team votes initiated by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L106)

<a id="field-field-mq3-game-entities-client-timeresidual-timeresidual-src-mq3-game-entities-ml-1570919502"></a>
### timeResidual

```ml
timeResidual
```

Unconsumed time accumulated for periodic client effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L148)

<a id="field-field-mq3-game-entities-client-votecount-votecount-src-mq3-game-entities-ml-177555726"></a>
### voteCount

```ml
voteCount
```

Number of global votes initiated by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L104)

<a id="field-field-mq3-game-entities-client-wins-wins-src-mq3-game-entities-ml-1931435684"></a>
### wins

```ml
wins
```

Tournament wins retained in the client session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L110)
