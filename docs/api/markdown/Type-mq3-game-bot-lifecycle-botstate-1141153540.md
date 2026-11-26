# `mq3.game.bot_lifecycle.BotState`

[Home](README.md) · [Source file](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)

<a id="struct-struct-mq3-game-bot-lifecycle-botstate-struct-botstate-src-mq3-game-bot-lifecycle-ml-2128052351"></a>
## BotState

```ml
struct BotState
```

`BotState` record for bot lifecycle, containing `inuse`, `client`, `entitynum`, `settings` and `curPs` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L16)

## Members

<a id="field-field-mq3-game-bot-lifecycle-botstate-activategoalheap-activategoalheap-src-mq3-game-bot-lifecycle-ml-1445599491"></a>
### activateGoalHeap

```ml
activateGoalHeap
```

Storage for activation goals required to traverse interactive obstacles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L130)

<a id="field-field-mq3-game-bot-lifecycle-botstate-activatestackindex-activatestackindex-src-mq3-game-bot-lifecycle-ml-47475477"></a>
### activateStackIndex

```ml
activateStackIndex
```

Top/current index in the bot activation-goal stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L132)

<a id="field-field-mq3-game-bot-lifecycle-botstate-aimtarget-aimtarget-src-mq3-game-bot-lifecycle-ml-1712723487"></a>
### aimTarget

```ml
aimTarget
```

World-space point toward which the bot aims its weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L98)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ainode-ainode-src-mq3-game-bot-lifecycle-ml-2016397103"></a>
### aiNode

```ml
aiNode
```

Current bot decision-network node or its callable entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L162)

<a id="field-field-mq3-game-bot-lifecycle-botstate-altroutegoal-altroutegoal-src-mq3-game-bot-lifecycle-ml-1769517661"></a>
### altRouteGoal

```ml
altRouteGoal
```

Intermediate goal selected to approach the main target by an alternate route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L92)

<a id="field-field-mq3-game-bot-lifecycle-botstate-areanum-areanum-src-mq3-game-bot-lifecycle-ml-395538519"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L82)

<a id="field-field-mq3-game-bot-lifecycle-botstate-arrivetime-arrivetime-src-mq3-game-bot-lifecycle-ml-294405751"></a>
### arriveTime

```ml
arriveTime
```

Timestamp at which the bot arrived at the current team goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L156)

<a id="field-field-mq3-game-bot-lifecycle-botstate-attackawaytime-attackawaytime-src-mq3-game-bot-lifecycle-ml-473572413"></a>
### attackawayTime

```ml
attackawayTime
```

Time controlling temporary excursions from an attack-base goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L226)

<a id="field-field-mq3-game-bot-lifecycle-botstate-attackchasetime-attackchasetime-src-mq3-game-bot-lifecycle-ml-1987694387"></a>
### attackchaseTime

```ml
attackchaseTime
```

Deadline associated with chasing an enemy during combat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L120)

<a id="field-field-mq3-game-bot-lifecycle-botstate-attackcrouchtime-attackcrouchtime-src-mq3-game-bot-lifecycle-ml-859718309"></a>
### attackcrouchTime

```ml
attackcrouchTime
```

Time controlling a combat crouch interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L124)

<a id="field-field-mq3-game-bot-lifecycle-botstate-attackjumptime-attackjumptime-src-mq3-game-bot-lifecycle-ml-170478205"></a>
### attackjumpTime

```ml
attackjumpTime
```

Time controlling a combat jump interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L126)

<a id="field-field-mq3-game-bot-lifecycle-botstate-attackstrafetime-attackstrafetime-src-mq3-game-bot-lifecycle-ml-1156488655"></a>
### attackstrafeTime

```ml
attackstrafeTime
```

Time controlling a combat strafe interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L128)

<a id="field-field-mq3-game-bot-lifecycle-botstate-blockedbyavoidspottime-blockedbyavoidspottime-src-mq3-game-bot-lifecycle-ml-385802593"></a>
### blockedByAvoidSpotTime

```ml
blockedByAvoidSpotTime
```

Time of the last movement blockage caused by an avoid spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L232)

<a id="field-field-mq3-game-bot-lifecycle-botstate-blueflagstatus-blueflagstatus-src-mq3-game-bot-lifecycle-ml-618245703"></a>
### blueflagstatus

```ml
blueflagstatus
```

Bot-tracked status of the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L194)

<a id="field-field-mq3-game-bot-lifecycle-botstate-camprange-camprange-src-mq3-game-bot-lifecycle-ml-1571415759"></a>
### campRange

```ml
campRange
```

Allowed movement radius around the camp goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L186)

<a id="field-field-mq3-game-bot-lifecycle-botstate-camptime-camptime-src-mq3-game-bot-lifecycle-ml-851725327"></a>
### campTime

```ml
campTime
```

Deadline associated with the current camping behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L154)

<a id="field-field-mq3-game-bot-lifecycle-botstate-character-character-src-mq3-game-bot-lifecycle-ml-1768343803"></a>
### character

```ml
character
```

Loaded bot-character handle used to query behavioral characteristics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L28)

<a id="field-field-mq3-game-bot-lifecycle-botstate-chasetime-chasetime-src-mq3-game-bot-lifecycle-ml-767869639"></a>
### chaseTime

```ml
chaseTime
```

Deadline associated with the current enemy chase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L172)

<a id="field-field-mq3-game-bot-lifecycle-botstate-chatto-chatto-src-mq3-game-bot-lifecycle-ml-1669560593"></a>
### chatto

```ml
chatto
```

Recipient mode selecting global, team, or other chat delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L224)

<a id="field-field-mq3-game-bot-lifecycle-botstate-checkpoints-checkpoints-src-mq3-game-bot-lifecycle-ml-1955773383"></a>
### checkpoints

```ml
checkpoints
```

Linked or indexed checkpoint goals available to the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L44)

<a id="field-field-mq3-game-bot-lifecycle-botstate-checktime-checktime-src-mq3-game-bot-lifecycle-ml-349445407"></a>
### checkTime

```ml
checkTime
```

Deadline for the next periodic condition check.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L210)

<a id="field-field-mq3-game-bot-lifecycle-botstate-client-client-src-mq3-game-bot-lifecycle-ml-733657173"></a>
### client

```ml
client
```

Client slot assigned to this live bot lifecycle record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L20)

<a id="field-field-mq3-game-bot-lifecycle-botstate-combatflags-combatflags-src-mq3-game-bot-lifecycle-ml-194605959"></a>
### combatFlags

```ml
combatFlags
```

Bit flags describing bot combat behavior and transient combat conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L118)

<a id="field-field-mq3-game-bot-lifecycle-botstate-cs-cs-src-mq3-game-bot-lifecycle-ml-1685202719"></a>
### cs

```ml
cs
```

Botlib chat-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L34)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ctfstrategy-ctfstrategy-src-mq3-game-bot-lifecycle-ml-238635063"></a>
### ctfstrategy

```ml
ctfstrategy
```

Selected capture-the-flag team strategy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L144)

<a id="field-field-mq3-game-bot-lifecycle-botstate-curpatrolpoint-curpatrolpoint-src-mq3-game-bot-lifecycle-ml-140957623"></a>
### curpatrolpoint

```ml
curpatrolpoint
```

Patrol goal currently being approached.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L188)

<a id="field-field-mq3-game-bot-lifecycle-botstate-curps-curps-src-mq3-game-bot-lifecycle-ml-4059459"></a>
### curPs

```ml
curPs
```

Most recently retrieved player state for this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L26)

<a id="field-field-mq3-game-bot-lifecycle-botstate-decisionmaker-decisionmaker-src-mq3-game-bot-lifecycle-ml-515376463"></a>
### decisionmaker

```ml
decisionmaker
```

Client/entity currently responsible for the bot team decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L146)

<a id="field-field-mq3-game-bot-lifecycle-botstate-defendawayrange-defendawayrange-src-mq3-game-bot-lifecycle-ml-904596907"></a>
### defendawayRange

```ml
defendawayRange
```

Maximum distance for an excursion from a defense goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L182)

<a id="field-field-mq3-game-bot-lifecycle-botstate-defendawaytime-defendawaytime-src-mq3-game-bot-lifecycle-ml-1373100441"></a>
### defendawayTime

```ml
defendawayTime
```

Time controlling how long the bot may leave its defense goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L180)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemy-enemy-src-mq3-game-bot-lifecycle-ml-854769699"></a>
### enemy

```ml
enemy
```

Current enemy entity selected by the bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L60)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemydeathtime-enemydeathtime-src-mq3-game-bot-lifecycle-ml-1171870913"></a>
### enemyDeathTime

```ml
enemyDeathTime
```

Timestamp associated with the tracked enemy death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L108)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemyorigin-enemyorigin-src-mq3-game-bot-lifecycle-ml-1250995999"></a>
### enemyOrigin

```ml
enemyOrigin
```

Most recently tracked position of the selected enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L134)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemypositiontime-enemypositiontime-src-mq3-game-bot-lifecycle-ml-2048381535"></a>
### enemyPositionTime

```ml
enemyPositionTime
```

Timestamp of the most recently recorded enemy position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L138)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemysighttime-enemysighttime-src-mq3-game-bot-lifecycle-ml-1647817927"></a>
### enemySightTime

```ml
enemySightTime
```

Timestamp associated with acquiring the selected enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L104)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemysuicide-enemysuicide-src-mq3-game-bot-lifecycle-ml-1712773831"></a>
### enemySuicide

```ml
enemySuicide
```

Nonzero when the tracked enemy death was a suicide.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L106)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemyvelocity-enemyvelocity-src-mq3-game-bot-lifecycle-ml-2010162727"></a>
### enemyVelocity

```ml
enemyVelocity
```

Most recently tracked velocity of the selected enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L136)

<a id="field-field-mq3-game-bot-lifecycle-botstate-enemyvisibletime-enemyvisibletime-src-mq3-game-bot-lifecycle-ml-9952733"></a>
### enemyVisibleTime

```ml
enemyVisibleTime
```

Most recent time at which the selected enemy was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L110)

<a id="field-field-mq3-game-bot-lifecycle-botstate-entergametime-entergametime-src-mq3-game-bot-lifecycle-ml-1724251459"></a>
### entergameTime

```ml
entergameTime
```

Timestamp at which this bot entered the game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L38)

<a id="field-field-mq3-game-bot-lifecycle-botstate-entitynum-entitynum-src-mq3-game-bot-lifecycle-ml-302468043"></a>
### entitynum

```ml
entitynum
```

Game entity number assigned to the bot represented by this lifecycle state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L22)

<a id="field-field-mq3-game-bot-lifecycle-botstate-eye-eye-src-mq3-game-bot-lifecycle-ml-1108274887"></a>
### eye

```ml
eye
```

Eye position used as the origin of visibility and aiming queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L96)

<a id="field-field-mq3-game-bot-lifecycle-botstate-firethrottleshoottime-firethrottleshoottime-src-mq3-game-bot-lifecycle-ml-936456567"></a>
### firethrottleshootTime

```ml
firethrottleshootTime
```

Deadline of the current bot firing burst.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L116)

<a id="field-field-mq3-game-bot-lifecycle-botstate-firethrottlewaittime-firethrottlewaittime-src-mq3-game-bot-lifecycle-ml-1849975719"></a>
### firethrottlewaitTime

```ml
firethrottlewaitTime
```

Deadline of the current pause between bot firing bursts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L114)

<a id="field-field-mq3-game-bot-lifecycle-botstate-flagcarrier-flagcarrier-src-mq3-game-bot-lifecycle-ml-755881871"></a>
### flagcarrier

```ml
flagcarrier
```

Client/entity currently carrying the flag of interest.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L142)

<a id="field-field-mq3-game-bot-lifecycle-botstate-formationdist-formationdist-src-mq3-game-bot-lifecycle-ml-581031151"></a>
### formationDist

```ml
formationDist
```

Desired separation from the teammate or formation leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L178)

<a id="field-field-mq3-game-bot-lifecycle-botstate-gs-gs-src-mq3-game-bot-lifecycle-ml-1447370463"></a>
### gs

```ml
gs
```

Botlib goal-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L32)

<a id="field-field-mq3-game-bot-lifecycle-botstate-harvestawaytime-harvestawaytime-src-mq3-game-bot-lifecycle-ml-146561567"></a>
### harvestawayTime

```ml
harvestawayTime
```

Time controlling temporary excursions from a harvesting goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L228)

<a id="field-field-mq3-game-bot-lifecycle-botstate-idealviewangles-idealviewangles-src-mq3-game-bot-lifecycle-ml-1867345787"></a>
### idealViewangles

```ml
idealViewangles
```

Target viewing angles toward which the bot should turn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L56)

<a id="field-field-mq3-game-bot-lifecycle-botstate-inuse-inuse-src-mq3-game-bot-lifecycle-ml-848334127"></a>
### inuse

```ml
inuse
```

Nonzero when this entity, client, or bot record currently represents a live allocated object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L18)

<a id="field-field-mq3-game-bot-lifecycle-botstate-inventory-inventory-src-mq3-game-bot-lifecycle-ml-1523609651"></a>
### inventory

```ml
inventory
```

Bot inventory slots containing weapon ownership, ammunition, health, and tactical observations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L72)

<a id="field-field-mq3-game-bot-lifecycle-botstate-kamikazebody-kamikazebody-src-mq3-game-bot-lifecycle-ml-1031482337"></a>
### kamikazeBody

```ml
kamikazeBody
```

Corpse/entity selected for kamikaze-related handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L230)

<a id="field-field-mq3-game-bot-lifecycle-botstate-killedenemytime-killedenemytime-src-mq3-game-bot-lifecycle-ml-1790420335"></a>
### killedEnemyTime

```ml
killedEnemyTime
```

Timestamp at which the bot killed its selected enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L214)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lastairtime-lastairtime-src-mq3-game-bot-lifecycle-ml-1719330871"></a>
### lastairTime

```ml
lastairTime
```

Most recent time at which the bot had breathable air.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L174)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lasteflags-lasteflags-src-mq3-game-bot-lifecycle-ml-1252446223"></a>
### lastEFlags

```ml
lastEFlags
```

Entity-flag value retained from the preceding bot update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L76)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lastenemyareanum-lastenemyareanum-src-mq3-game-bot-lifecycle-ml-1949132101"></a>
### lastEnemyAreaNum

```ml
lastEnemyAreaNum
```

AAS area of the last observed enemy position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L122)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lastenemyorigin-lastenemyorigin-src-mq3-game-bot-lifecycle-ml-1383056367"></a>
### lastEnemyOrigin

```ml
lastEnemyOrigin
```

Enemy position retained from the previous observation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L100)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lastframehealth-lastframehealth-src-mq3-game-bot-lifecycle-ml-657963775"></a>
### lastframeHealth

```ml
lastframeHealth
```

Health value retained from the preceding bot frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L168)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lastgoalltgtype-lastgoalltgtype-src-mq3-game-bot-lifecycle-ml-1063362375"></a>
### lastgoalLtgtype

```ml
lastgoalLtgtype
```

Long-term goal type retained from the preceding team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L184)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lasthealth-lasthealth-src-mq3-game-bot-lifecycle-ml-1316397303"></a>
### lastHealth

```ml
lastHealth
```

Health value retained from the preceding bot update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L102)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lasthitcount-lasthitcount-src-mq3-game-bot-lifecycle-ml-1501595371"></a>
### lastHitCount

```ml
lastHitCount
```

Hit counter retained from the preceding bot frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L170)

<a id="field-field-mq3-game-bot-lifecycle-botstate-lastkilledplayer-lastkilledplayer-src-mq3-game-bot-lifecycle-ml-1424975535"></a>
### lastKilledPlayer

```ml
lastKilledPlayer
```

Client identifier of the player most recently killed by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L164)

<a id="field-field-mq3-game-bot-lifecycle-botstate-leadbackuptime-leadbackuptime-src-mq3-game-bot-lifecycle-ml-758804709"></a>
### leadbackupTime

```ml
leadbackupTime
```

Time controlling when the bot backs up to help a trailing teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L208)

<a id="field-field-mq3-game-bot-lifecycle-botstate-leadmessagetime-leadmessagetime-src-mq3-game-bot-lifecycle-ml-1518536643"></a>
### leadmessageTime

```ml
leadmessageTime
```

Time controlling the next message to the teammate being led.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L202)

<a id="field-field-mq3-game-bot-lifecycle-botstate-leadteamgoal-leadteamgoal-src-mq3-game-bot-lifecycle-ml-1690293067"></a>
### leadTeamGoal

```ml
leadTeamGoal
```

Navigation goal toward which the bot is leading a teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L204)

<a id="field-field-mq3-game-bot-lifecycle-botstate-leadteammate-leadteammate-src-mq3-game-bot-lifecycle-ml-1359190863"></a>
### leadTeammate

```ml
leadTeammate
```

Client/entity identifier of the teammate being led.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L200)

<a id="field-field-mq3-game-bot-lifecycle-botstate-leadtime-leadtime-src-mq3-game-bot-lifecycle-ml-1598991517"></a>
### leadTime

```ml
leadTime
```

Deadline associated with leading a teammate toward a goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L198)

<a id="field-field-mq3-game-bot-lifecycle-botstate-leadvisibletime-leadvisibletime-src-mq3-game-bot-lifecycle-ml-889756891"></a>
### leadvisibleTime

```ml
leadvisibleTime
```

Last time the teammate being led was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L206)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ltgtime-ltgtime-src-mq3-game-bot-lifecycle-ml-56525235"></a>
### ltgTime

```ml
ltgTime
```

Deadline or timing value associated with the current long-term goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L160)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ltgtype-ltgtype-src-mq3-game-bot-lifecycle-ml-1095610867"></a>
### ltgtype

```ml
ltgtype
```

Current long-term goal category selected from the LTG_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L64)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ms-ms-src-mq3-game-bot-lifecycle-ml-1210097903"></a>
### ms

```ml
ms
```

Botlib movement-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L30)

<a id="field-field-mq3-game-bot-lifecycle-botstate-nbgtime-nbgtime-src-mq3-game-bot-lifecycle-ml-1649331123"></a>
### nbgTime

```ml
nbgTime
```

Deadline associated with the current nearby-item goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L212)

<a id="field-field-mq3-game-bot-lifecycle-botstate-numdeaths-numdeaths-src-mq3-game-bot-lifecycle-ml-506379899"></a>
### numDeaths

```ml
numDeaths
```

Number of deaths recorded for this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L50)

<a id="field-field-mq3-game-bot-lifecycle-botstate-numkills-numkills-src-mq3-game-bot-lifecycle-ml-1396278129"></a>
### numKills

```ml
numKills
```

Number of kills credited to this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L48)

<a id="field-field-mq3-game-bot-lifecycle-botstate-numteammates-numteammates-src-mq3-game-bot-lifecycle-ml-1022304841"></a>
### numteammates

```ml
numteammates
```

Number of teammates considered by the team decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L140)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ordered-ordered-src-mq3-game-bot-lifecycle-ml-557685023"></a>
### ordered

```ml
ordered
```

Nonzero when a teammate explicitly ordered the current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L158)

<a id="field-field-mq3-game-bot-lifecycle-botstate-origin-origin-src-mq3-game-bot-lifecycle-ml-152640223"></a>
### origin

```ml
origin
```

Current world-space position retained in the live bot lifecycle state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L80)

<a id="field-field-mq3-game-bot-lifecycle-botstate-patrolflags-patrolflags-src-mq3-game-bot-lifecycle-ml-1894222619"></a>
### patrolflags

```ml
patrolflags
```

PATROL_* behavior flags associated with the current patrol route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L190)

<a id="field-field-mq3-game-bot-lifecycle-botstate-patrolpoints-patrolpoints-src-mq3-game-bot-lifecycle-ml-1728851601"></a>
### patrolpoints

```ml
patrolpoints
```

Patrol goals traversed by the bot patrol behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L46)

<a id="field-field-mq3-game-bot-lifecycle-botstate-predictobstaclesgoalareanum-predictobstaclesgoalareanum-src-mq3-game-bot-lifecycle-ml-7762351"></a>
### predictobstaclesGoalareanum

```ml
predictobstaclesGoalareanum
```

Goal AAS area used by the latest obstacle-prediction query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L88)

<a id="field-field-mq3-game-bot-lifecycle-botstate-predictobstaclestime-predictobstaclestime-src-mq3-game-bot-lifecycle-ml-1058499527"></a>
### predictobstaclesTime

```ml
predictobstaclesTime
```

Time controlling when obstacle prediction is refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L90)

<a id="field-field-mq3-game-bot-lifecycle-botstate-proxmines-proxmines-src-mq3-game-bot-lifecycle-ml-1072191119"></a>
### proxMines

```ml
proxMines
```

Proximity mines tracked by bot hazard logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L234)

<a id="field-field-mq3-game-bot-lifecycle-botstate-reachedaltroutegoaltime-reachedaltroutegoaltime-src-mq3-game-bot-lifecycle-ml-835911471"></a>
### reachedAltRouteGoalTime

```ml
reachedAltRouteGoalTime
```

Timestamp at which the alternate-route waypoint was reached.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L94)

<a id="field-field-mq3-game-bot-lifecycle-botstate-redflagstatus-redflagstatus-src-mq3-game-bot-lifecycle-ml-650242395"></a>
### redflagstatus

```ml
redflagstatus
```

Bot-tracked status of the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L192)

<a id="field-field-mq3-game-bot-lifecycle-botstate-respawnchattime-respawnchattime-src-mq3-game-bot-lifecycle-ml-1935136579"></a>
### respawnChatTime

```ml
respawnChatTime
```

Time controlling a chat message associated with respawning.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L220)

<a id="field-field-mq3-game-bot-lifecycle-botstate-respawntime-respawntime-src-mq3-game-bot-lifecycle-ml-891764635"></a>
### respawnTime

```ml
respawnTime
```

Timestamp associated with the client or bot next respawn decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L218)

<a id="field-field-mq3-game-bot-lifecycle-botstate-respawnwait-respawnwait-src-mq3-game-bot-lifecycle-ml-601452163"></a>
### respawnWait

```ml
respawnWait
```

Nonzero while the bot waits to issue its respawn action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L222)

<a id="field-field-mq3-game-bot-lifecycle-botstate-rushbaseawaytime-rushbaseawaytime-src-mq3-game-bot-lifecycle-ml-1840835927"></a>
### rushbaseawayTime

```ml
rushbaseawayTime
```

Time controlling temporary excursions from a rush-base goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L196)

<a id="field-field-mq3-game-bot-lifecycle-botstate-settings-settings-src-mq3-game-bot-lifecycle-ml-444662317"></a>
### settings

```ml
settings
```

Bot creation settings containing character file, skill, and team choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L24)

<a id="field-field-mq3-game-bot-lifecycle-botstate-setupcount-setupcount-src-mq3-game-bot-lifecycle-ml-153094779"></a>
### setupcount

```ml
setupcount
```

Counter controlling initial bot setup before normal decision processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L42)

<a id="field-field-mq3-game-bot-lifecycle-botstate-standfindenemytime-standfindenemytime-src-mq3-game-bot-lifecycle-ml-373103071"></a>
### standFindEnemyTime

```ml
standFindEnemyTime
```

Time controlling the next enemy search while standing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L216)

<a id="field-field-mq3-game-bot-lifecycle-botstate-standtime-standtime-src-mq3-game-bot-lifecycle-ml-1200872571"></a>
### standTime

```ml
standTime
```

Deadline associated with temporary standing/waiting behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L166)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teamgoal-teamgoal-src-mq3-game-bot-lifecycle-ml-1851291855"></a>
### teamGoal

```ml
teamGoal
```

Navigation goal associated with the bot current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L150)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teamgoalentitynum-teamgoalentitynum-src-mq3-game-bot-lifecycle-ml-1594388915"></a>
### teamgoalEntitynum

```ml
teamgoalEntitynum
```

Entity number associated with the bot current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L70)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teamgoalnumber-teamgoalnumber-src-mq3-game-bot-lifecycle-ml-754413825"></a>
### teamgoalNumber

```ml
teamgoalNumber
```

Goal number associated with the bot current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L68)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teamgoaltime-teamgoaltime-src-mq3-game-bot-lifecycle-ml-1171794481"></a>
### teamgoalTime

```ml
teamgoalTime
```

Deadline associated with the current cooperative team goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L152)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teamleader-teamleader-src-mq3-game-bot-lifecycle-ml-363809807"></a>
### teamleader

```ml
teamleader
```

Name or identifier of the current bot-team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L62)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teammate-teammate-src-mq3-game-bot-lifecycle-ml-1531813563"></a>
### teammate

```ml
teammate
```

Teammate entity/client selected for the current cooperative task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L66)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teammatevisibletime-teammatevisibletime-src-mq3-game-bot-lifecycle-ml-1102957995"></a>
### teammatevisibleTime

```ml
teammatevisibleTime
```

Last time the teammate associated with the task was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L176)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teammessagetime-teammessagetime-src-mq3-game-bot-lifecycle-ml-1002980867"></a>
### teammessageTime

```ml
teammessageTime
```

Time controlling the next bot team message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L148)

<a id="field-field-mq3-game-bot-lifecycle-botstate-teleporttime-teleporttime-src-mq3-game-bot-lifecycle-ml-1711487679"></a>
### teleportTime

```ml
teleportTime
```

Time of the last teleport detected by the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L78)

<a id="field-field-mq3-game-bot-lifecycle-botstate-tfl-tfl-src-mq3-game-bot-lifecycle-ml-1376276687"></a>
### tfl

```ml
tfl
```

Travel flags controlling which AAS travel types the bot may use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L86)

<a id="field-field-mq3-game-bot-lifecycle-botstate-thinktime-thinktime-src-mq3-game-bot-lifecycle-ml-1935763443"></a>
### thinktime

```ml
thinktime
```

Time interval used for the current bot thinking/update step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L84)

<a id="field-field-mq3-game-bot-lifecycle-botstate-transient-transient-src-mq3-game-bot-lifecycle-ml-1919140623"></a>
### transient

```ml
transient
```

Transient input/decision state reset independently of persistent bot data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L52)

<a id="field-field-mq3-game-bot-lifecycle-botstate-viewangles-viewangles-src-mq3-game-bot-lifecycle-ml-522835117"></a>
### viewangles

```ml
viewangles
```

Player or bot viewing angles used for aiming and command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L54)

<a id="field-field-mq3-game-bot-lifecycle-botstate-viewanglespeed-viewanglespeed-src-mq3-game-bot-lifecycle-ml-1351210849"></a>
### viewanglespeed

```ml
viewanglespeed
```

Current angular turn speed used by the bot view controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L58)

<a id="field-field-mq3-game-bot-lifecycle-botstate-walker-walker-src-mq3-game-bot-lifecycle-ml-177473455"></a>
### walker

```ml
walker
```

Nonzero when the bot movement preference is to walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L40)

<a id="field-field-mq3-game-bot-lifecycle-botstate-weaponchangetime-weaponchangetime-src-mq3-game-bot-lifecycle-ml-249401589"></a>
### weaponchangeTime

```ml
weaponchangeTime
```

Timestamp of the most recent weapon change.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L112)

<a id="field-field-mq3-game-bot-lifecycle-botstate-weaponnum-weaponnum-src-mq3-game-bot-lifecycle-ml-1875030887"></a>
### weaponnum

```ml
weaponnum
```

Weapon identifier selected by the bot weapon state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L74)

<a id="field-field-mq3-game-bot-lifecycle-botstate-ws-ws-src-mq3-game-bot-lifecycle-ml-1767203743"></a>
### ws

```ml
ws
```

Botlib weapon-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_lifecycle.ml#L36)
