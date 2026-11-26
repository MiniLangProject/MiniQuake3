# `mq3.game.entities.Level`

[Home](README.md) · [Source file](File-src-mq3-game-entities-ml-1863725345.md)

<a id="struct-struct-mq3-game-entities-level-struct-level-src-mq3-game-entities-ml-36424445"></a>
## Level

```ml
struct Level
```

`Level` record for entities, containing `scene`, `entities`, `num_entities`, `time` and `startTime` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L294)

## Members

<a id="field-field-mq3-game-entities-level-allowvote-allowvote-src-mq3-game-entities-ml-1290767555"></a>
### allowVote

```ml
allowVote
```

Setting controlling whether clients may initiate votes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L516)

<a id="field-field-mq3-game-entities-level-blood-blood-src-mq3-game-entities-ml-296468055"></a>
### blood

```ml
blood
```

Setting controlling blood and gib effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L339)

<a id="field-field-mq3-game-entities-level-blueflagstatus-blueflagstatus-src-mq3-game-entities-ml-1946984827"></a>
### blueFlagStatus

```ml
blueFlagStatus
```

Current capture-the-flag state of the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L403)

<a id="field-field-mq3-game-entities-level-blueobeliskattackedtime-blueobeliskattackedtime-src-mq3-game-entities-ml-1421881179"></a>
### blueObeliskAttackedTime

```ml
blueObeliskAttackedTime
```

Next allowed blue-base-under-attack announcement time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L564)

<a id="field-field-mq3-game-entities-level-bluetakentime-bluetakentime-src-mq3-game-entities-ml-273895499"></a>
### blueTakenTime

```ml
blueTakenTime
```

Timestamp at which the blue flag was most recently taken.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L409)

<a id="field-field-mq3-game-entities-level-bodyque-bodyque-src-mq3-game-entities-ml-959698047"></a>
### bodyQue

```ml
bodyQue
```

Reusable corpse-entity slots maintained by the level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L343)

<a id="field-field-mq3-game-entities-level-bodyqueindex-bodyqueindex-src-mq3-game-entities-ml-1393375885"></a>
### bodyQueIndex

```ml
bodyQueIndex
```

Next corpse-queue slot to reuse when a player body is copied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L341)

<a id="field-field-mq3-game-entities-level-botconnectfn-botconnectfn-src-mq3-game-entities-ml-606918349"></a>
### botConnectFn

```ml
botConnectFn
```

Injected callback for bot connect; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L526)

<a id="field-field-mq3-game-entities-level-botinterbreedendmatchfn-botinterbreedendmatchfn-src-mq3-game-entities-ml-803170683"></a>
### botInterbreedEndMatchFn

```ml
botInterbreedEndMatchFn
```

Injected callback for bot interbreed end match; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L540)

<a id="field-field-mq3-game-entities-level-botlifecyclestate-botlifecyclestate-src-mq3-game-entities-ml-263342875"></a>
### botLifecycleState

```ml
botLifecycleState
```

Level-owned bot creation, initialization, and cleanup state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L578)

<a id="field-field-mq3-game-entities-level-botshutdownfn-botshutdownfn-src-mq3-game-entities-ml-219583719"></a>
### botShutdownFn

```ml
botShutdownFn
```

Injected callback for bot shutdown; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L536)

<a id="field-field-mq3-game-entities-level-bottestaasfn-bottestaasfn-src-mq3-game-entities-ml-1062773179"></a>
### botTestAasFn

```ml
botTestAasFn
```

Injected callback for bot test AAS; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L461)

<a id="field-field-mq3-game-entities-level-capturelimit-capturelimit-src-mq3-game-entities-ml-1013178849"></a>
### capturelimit

```ml
capturelimit
```

Configured number of flag captures that ends the match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L379)

<a id="field-field-mq3-game-entities-level-changemap-changemap-src-mq3-game-entities-ml-680979731"></a>
### changemap

```ml
changemap
```

Map name selected for the next level transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L538)

<a id="field-field-mq3-game-entities-level-cheats-cheats-src-mq3-game-entities-ml-1601660763"></a>
### cheats

```ml
cheats
```

Setting controlling whether cheat commands are allowed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L546)

<a id="field-field-mq3-game-entities-level-clientbeginfn-clientbeginfn-src-mq3-game-entities-ml-799507575"></a>
### clientBeginFn

```ml
clientBeginFn
```

Injected callback for client begin; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L435)

<a id="field-field-mq3-game-entities-level-clientendframefn-clientendframefn-src-mq3-game-entities-ml-1977390001"></a>
### clientEndFrameFn

```ml
clientEndFrameFn
```

Injected callback for client end frame; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L427)

<a id="field-field-mq3-game-entities-level-clients-clients-src-mq3-game-entities-ml-83357631"></a>
### clients

```ml
clients
```

Client records indexed by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L349)

<a id="field-field-mq3-game-entities-level-clientspawnfn-clientspawnfn-src-mq3-game-entities-ml-362313467"></a>
### clientSpawnFn

```ml
clientSpawnFn
```

Injected callback for client spawn; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L399)

<a id="field-field-mq3-game-entities-level-clientthinkfn-clientthinkfn-src-mq3-game-entities-ml-2067526523"></a>
### clientThinkFn

```ml
clientThinkFn
```

Injected callback for client think; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L425)

<a id="field-field-mq3-game-entities-level-clientuserinfochangedfn-clientuserinfochangedfn-src-mq3-game-entities-ml-67464347"></a>
### clientUserinfoChangedFn

```ml
clientUserinfoChangedFn
```

Injected callback for client user information changed; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L504)

<a id="field-field-mq3-game-entities-level-consolecommandfn-consolecommandfn-src-mq3-game-entities-ml-295179191"></a>
### consoleCommandFn

```ml
consoleCommandFn
```

Injected callback for console command; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L483)

<a id="field-field-mq3-game-entities-level-context-context-src-mq3-game-entities-ml-1103278019"></a>
### context

```ml
context
```

Opaque caller-supplied context available to level simulation, entity, client, match, and host-observation callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L315)

<a id="field-field-mq3-game-entities-level-cvarmaintenance-cvarmaintenance-src-mq3-game-entities-ml-354548511"></a>
### cvarMaintenance

```ml
cvarMaintenance
```

State for periodic cvar synchronization and side effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L508)

<a id="field-field-mq3-game-entities-level-cvarsetfn-cvarsetfn-src-mq3-game-entities-ml-1764684219"></a>
### cvarSetFn

```ml
cvarSetFn
```

Injected callback for console variable set; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L451)

<a id="field-field-mq3-game-entities-level-cvarstringfn-cvarstringfn-src-mq3-game-entities-ml-558301817"></a>
### cvarStringFn

```ml
cvarStringFn
```

Injected callback for console variable string; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L530)

<a id="field-field-mq3-game-entities-level-damagefn-damagefn-src-mq3-game-entities-ml-1384692337"></a>
### damageFn

```ml
damageFn
```

Injected callback for damage; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L308)

<a id="field-field-mq3-game-entities-level-deathanimindex-deathanimindex-src-mq3-game-entities-ml-1817579525"></a>
### deathAnimIndex

```ml
deathAnimIndex
```

Next death-animation variant selected by game death logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L391)

<a id="field-field-mq3-game-entities-level-dedicated-dedicated-src-mq3-game-entities-ml-711933343"></a>
### dedicated

```ml
dedicated
```

Setting selecting dedicated-server operation and its mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L548)

<a id="field-field-mq3-game-entities-level-dmflags-dmflags-src-mq3-game-entities-ml-1816040411"></a>
### dmflags

```ml
dmflags
```

Deathmatch-option bit mask supplied by server configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L441)

<a id="field-field-mq3-game-entities-level-doortouch-doortouch-src-mq3-game-entities-ml-2078917559"></a>
### doorTouch

```ml
doorTouch
```

Door-touch handler retained by the level for mover interaction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L310)

<a id="field-field-mq3-game-entities-level-dropclientfn-dropclientfn-src-mq3-game-entities-ml-2049000271"></a>
### dropClientFn

```ml
dropClientFn
```

Injected callback for drop client; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L453)

<a id="field-field-mq3-game-entities-level-entities-entities-src-mq3-game-entities-ml-1100235141"></a>
### entities

```ml
entities
```

Game entity records indexed by entity number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L298)

<a id="field-field-mq3-game-entities-level-exittime-exittime-src-mq3-game-entities-ml-1287628613"></a>
### exitTime

```ml
exitTime
```

Timestamp controlling the transition out of intermission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L383)

<a id="field-field-mq3-game-entities-level-filterpacketfn-filterpacketfn-src-mq3-game-entities-ml-1435174727"></a>
### filterPacketFn

```ml
filterPacketFn
```

Injected callback for filter packet; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L524)

<a id="field-field-mq3-game-entities-level-fireweaponfn-fireweaponfn-src-mq3-game-entities-ml-2094299803"></a>
### fireWeaponFn

```ml
fireWeaponFn
```

Injected callback for fire weapon; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L459)

<a id="field-field-mq3-game-entities-level-flagreturnfn-flagreturnfn-src-mq3-game-entities-ml-1270255891"></a>
### flagReturnFn

```ml
flagReturnFn
```

Injected callback for flag return; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L395)

<a id="field-field-mq3-game-entities-level-follow1-follow1-src-mq3-game-entities-ml-1983704443"></a>
### follow1

```ml
follow1
```

First active client automatically selected for spectator following.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L359)

<a id="field-field-mq3-game-entities-level-follow2-follow2-src-mq3-game-entities-ml-561707191"></a>
### follow2

```ml
follow2
```

Second active client automatically selected for spectator following.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L361)

<a id="field-field-mq3-game-entities-level-followcyclefn-followcyclefn-src-mq3-game-entities-ml-1459430687"></a>
### followCycleFn

```ml
followCycleFn
```

Injected callback for follow cycle; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L455)

<a id="field-field-mq3-game-entities-level-forcerespawn-forcerespawn-src-mq3-game-entities-ml-1054839001"></a>
### forceRespawn

```ml
forceRespawn
```

Configured delay after which a dead client is forced to respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L449)

<a id="field-field-mq3-game-entities-level-fraglimit-fraglimit-src-mq3-game-entities-ml-1618166895"></a>
### fraglimit

```ml
fraglimit
```

Configured score/frag threshold that ends the match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L377)

<a id="field-field-mq3-game-entities-level-framenum-framenum-src-mq3-game-entities-ml-1544396241"></a>
### framenum

```ml
framenum
```

Game frames processed since level initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L467)

<a id="field-field-mq3-game-entities-level-framestagefn-framestagefn-src-mq3-game-entities-ml-358956257"></a>
### frameStageFn

```ml
frameStageFn
```

Injected callback for frame stage; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L471)

<a id="field-field-mq3-game-entities-level-friendlyfire-friendlyfire-src-mq3-game-entities-ml-1904249933"></a>
### friendlyFire

```ml
friendlyFire
```

Nonzero when teammates may damage each other.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L331)

<a id="field-field-mq3-game-entities-level-gamecvars-gamecvars-src-mq3-game-entities-ml-598863399"></a>
### gameCvars

```ml
gameCvars
```

Game cvar table and its VM-facing variable records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L510)

<a id="field-field-mq3-game-entities-level-gamelogfn-gamelogfn-src-mq3-game-entities-ml-304401223"></a>
### gameLogFn

```ml
gameLogFn
```

Injected callback for game log; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L387)

<a id="field-field-mq3-game-entities-level-gameprintfn-gameprintfn-src-mq3-game-entities-ml-1681696051"></a>
### gamePrintFn

```ml
gamePrintFn
```

Injected callback for game print; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L528)

<a id="field-field-mq3-game-entities-level-gauntletattackfn-gauntletattackfn-src-mq3-game-entities-ml-1889192047"></a>
### gauntletAttackFn

```ml
gauntletAttackFn
```

Injected callback for gauntlet attack; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L457)

<a id="field-field-mq3-game-entities-level-gravity-gravity-src-mq3-game-entities-ml-846705723"></a>
### gravity

```ml
gravity
```

Downward acceleration used by the player or entity movement simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L437)

<a id="field-field-mq3-game-entities-level-inactivity-inactivity-src-mq3-game-entities-ml-563852467"></a>
### inactivity

```ml
inactivity
```

Configured inactivity timeout applied to clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L419)

<a id="field-field-mq3-game-entities-level-intermission-angle-intermission-angle-src-mq3-game-entities-ml-2049108307"></a>
### intermission_angle

```ml
intermission_angle
```

Camera orientation chosen for the intermission view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L347)

<a id="field-field-mq3-game-entities-level-intermission-origin-intermission-origin-src-mq3-game-entities-ml-1083346903"></a>
### intermission_origin

```ml
intermission_origin
```

Camera position chosen for the intermission view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L345)

<a id="field-field-mq3-game-entities-level-intermissionqueued-intermissionqueued-src-mq3-game-entities-ml-1788498929"></a>
### intermissionQueued

```ml
intermissionQueued
```

Timestamp/marker recording that an intermission transition has been queued.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L327)

<a id="field-field-mq3-game-entities-level-intermissiontime-intermissiontime-src-mq3-game-entities-ml-629141201"></a>
### intermissiontime

```ml
intermissiontime
```

Timestamp at which the intermission began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L373)

<a id="field-field-mq3-game-entities-level-ipfilters-ipfilters-src-mq3-game-entities-ml-2076766735"></a>
### ipFilters

```ml
ipFilters
```

IP filtering state used by connection checks and server commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L556)

<a id="field-field-mq3-game-entities-level-itemdropfn-itemdropfn-src-mq3-game-entities-ml-1371623599"></a>
### itemDropFn

```ml
itemDropFn
```

Injected callback for item drop; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L393)

<a id="field-field-mq3-game-entities-level-itemregistered-itemregistered-src-mq3-game-entities-ml-841939993"></a>
### itemRegistered

```ml
itemRegistered
```

Per-item registration markers used to advertise required pickup assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L337)

<a id="field-field-mq3-game-entities-level-knockback-knockback-src-mq3-game-entities-ml-637013999"></a>
### knockback

```ml
knockback
```

Configured scale applied to damage-induced knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L329)

<a id="field-field-mq3-game-entities-level-lastcaptureteam-lastcaptureteam-src-mq3-game-entities-ml-1523092507"></a>
### lastCaptureTeam

```ml
lastCaptureTeam
```

Team credited with the most recent flag capture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L413)

<a id="field-field-mq3-game-entities-level-lastflagcapture-lastflagcapture-src-mq3-game-entities-ml-1968244679"></a>
### lastFlagCapture

```ml
lastFlagCapture
```

Timestamp of the most recent flag capture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L411)

<a id="field-field-mq3-game-entities-level-lastteamlocationtime-lastteamlocationtime-src-mq3-game-entities-ml-1609413761"></a>
### lastTeamLocationTime

```ml
lastTeamLocationTime
```

Timestamp of the most recent team-location broadcast.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L506)

<a id="field-field-mq3-game-entities-level-lifecyclestate-lifecyclestate-src-mq3-game-entities-ml-1644552961"></a>
### lifecycleState

```ml
lifecycleState
```

State shared by bot allocation, setup, shutdown, and frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L566)

<a id="field-field-mq3-game-entities-level-listentity-listentity-src-mq3-game-entities-ml-1089113377"></a>
### listEntity

```ml
listEntity
```

Control value requesting a listing of allocated entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L473)

<a id="field-field-mq3-game-entities-level-locationhead-locationhead-src-mq3-game-entities-ml-2079352453"></a>
### locationHead

```ml
locationHead
```

Head of the linked list of level location entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L325)

<a id="field-field-mq3-game-entities-level-locationlinked-locationlinked-src-mq3-game-entities-ml-1624613399"></a>
### locationLinked

```ml
locationLinked
```

Nonzero after target-location entities have been linked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L323)

<a id="field-field-mq3-game-entities-level-logfile-logfile-src-mq3-game-entities-ml-1095124839"></a>
### logFile

```ml
logFile
```

Handle of the game event log file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L568)

<a id="field-field-mq3-game-entities-level-logwritefn-logwritefn-src-mq3-game-entities-ml-1885572713"></a>
### logWriteFn

```ml
logWriteFn
```

Injected callback for log write; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L570)

<a id="field-field-mq3-game-entities-level-matchtransitionfn-matchtransitionfn-src-mq3-game-entities-ml-1087603003"></a>
### matchTransitionFn

```ml
matchTransitionFn
```

Injected callback for match transition; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L389)

<a id="field-field-mq3-game-entities-level-maxclients-maxclients-src-mq3-game-entities-ml-267023907"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L351)

<a id="field-field-mq3-game-entities-level-maxclientscvar-maxclientscvar-src-mq3-game-entities-ml-1919368411"></a>
### maxclientsCvar

```ml
maxclientsCvar
```

VM console-variable record controlling the active client limit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L353)

<a id="field-field-mq3-game-entities-level-maxgameclients-maxgameclients-src-mq3-game-entities-ml-1535778379"></a>
### maxGameClients

```ml
maxGameClients
```

Maximum number of clients permitted to participate in play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L522)

<a id="field-field-mq3-game-entities-level-memorystate-memorystate-src-mq3-game-entities-ml-664201199"></a>
### memoryState

```ml
memoryState
```

Fixed game-arena allocation state owned by the level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L558)

<a id="field-field-mq3-game-entities-level-moveintermissionfn-moveintermissionfn-src-mq3-game-entities-ml-1179190905"></a>
### moveIntermissionFn

```ml
moveIntermissionFn
```

Injected callback for move intermission; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L429)

<a id="field-field-mq3-game-entities-level-neutralflagstatus-neutralflagstatus-src-mq3-game-entities-ml-2051893031"></a>
### neutralFlagStatus

```ml
neutralFlagStatus
```

Current state of the neutral flag in one-flag capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L405)

<a id="field-field-mq3-game-entities-level-neutralobelisk-neutralobelisk-src-mq3-game-entities-ml-532527979"></a>
### neutralObelisk

```ml
neutralObelisk
```

Goal/entity reference for the neutral harvester obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L580)

<a id="field-field-mq3-game-entities-level-newsession-newsession-src-mq3-game-entities-ml-1224681971"></a>
### newSession

```ml
newSession
```

Nonzero when prior session data must be discarded during level setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L518)

<a id="field-field-mq3-game-entities-level-num-entities-num-entities-src-mq3-game-entities-ml-934295759"></a>
### num_entities

```ml
num_entities
```

Number of entity slots currently included in the level entity table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L300)

<a id="field-field-mq3-game-entities-level-numconnectedclients-numconnectedclients-src-mq3-game-entities-ml-1861793103"></a>
### numConnectedClients

```ml
numConnectedClients
```

Number of clients currently connected to the game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L363)

<a id="field-field-mq3-game-entities-level-numnonspectatorclients-numnonspectatorclients-src-mq3-game-entities-ml-306643643"></a>
### numNonSpectatorClients

```ml
numNonSpectatorClients
```

Number of connected clients assigned to a playing team rather than spectators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L365)

<a id="field-field-mq3-game-entities-level-numplayingclients-numplayingclients-src-mq3-game-entities-ml-355710331"></a>
### numPlayingClients

```ml
numPlayingClients
```

Number of clients currently participating in play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L367)

<a id="field-field-mq3-game-entities-level-numteamvotingclients-numteamvotingclients-src-mq3-game-entities-ml-67215303"></a>
### numteamVotingClients

```ml
numteamVotingClients
```

Counts of clients eligible to participate in each team vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L371)

<a id="field-field-mq3-game-entities-level-numvotingclients-numvotingclients-src-mq3-game-entities-ml-1886926529"></a>
### numVotingClients

```ml
numVotingClients
```

Number of clients eligible to participate in the global vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L369)

<a id="field-field-mq3-game-entities-level-obeliskattackfn-obeliskattackfn-src-mq3-game-entities-ml-1835349771"></a>
### obeliskAttackFn

```ml
obeliskAttackFn
```

Injected callback for obelisk attack; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L590)

<a id="field-field-mq3-game-entities-level-obeliskhealth-obeliskhealth-src-mq3-game-entities-ml-426150583"></a>
### obeliskHealth

```ml
obeliskHealth
```

Configured maximum health of a mission-pack obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L582)

<a id="field-field-mq3-game-entities-level-obeliskregenamount-obeliskregenamount-src-mq3-game-entities-ml-906397643"></a>
### obeliskRegenAmount

```ml
obeliskRegenAmount
```

Health restored by one obelisk regeneration step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L586)

<a id="field-field-mq3-game-entities-level-obeliskregenperiod-obeliskregenperiod-src-mq3-game-entities-ml-1960592781"></a>
### obeliskRegenPeriod

```ml
obeliskRegenPeriod
```

Interval between obelisk health regeneration steps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L584)

<a id="field-field-mq3-game-entities-level-obeliskrespawndelay-obeliskrespawndelay-src-mq3-game-entities-ml-1844501643"></a>
### obeliskRespawnDelay

```ml
obeliskRespawnDelay
```

Delay before a destroyed obelisk becomes active again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L588)

<a id="field-field-mq3-game-entities-level-observefn-observefn-src-mq3-game-entities-ml-988562167"></a>
### observeFn

```ml
observeFn
```

Injected callback for observe; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L312)

<a id="field-field-mq3-game-entities-level-playerdiefn-playerdiefn-src-mq3-game-entities-ml-645879119"></a>
### playerDieFn

```ml
playerDieFn
```

Injected callback for player die; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L465)

<a id="field-field-mq3-game-entities-level-playerspeed-playerspeed-src-mq3-game-entities-ml-1084621507"></a>
### playerSpeed

```ml
playerSpeed
```

Configured normal player movement speed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L439)

<a id="field-field-mq3-game-entities-level-pmovefixed-pmovefixed-src-mq3-game-entities-ml-1998185957"></a>
### pmoveFixed

```ml
pmoveFixed
```

Nonzero when player movement uses a fixed simulation step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L443)

<a id="field-field-mq3-game-entities-level-pmovemsec-pmovemsec-src-mq3-game-entities-ml-1364955823"></a>
### pmoveMsec

```ml
pmoveMsec
```

Fixed movement-step duration in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L445)

<a id="field-field-mq3-game-entities-level-podium1-podium1-src-mq3-game-entities-ml-1529780035"></a>
### podium1

```ml
podium1
```

Entity representing first place on the victory podium.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L572)

<a id="field-field-mq3-game-entities-level-podium2-podium2-src-mq3-game-entities-ml-304357579"></a>
### podium2

```ml
podium2
```

Entity representing second place on the victory podium.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L574)

<a id="field-field-mq3-game-entities-level-podium3-podium3-src-mq3-game-entities-ml-808449991"></a>
### podium3

```ml
podium3
```

Entity representing third place on the victory podium.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L576)

<a id="field-field-mq3-game-entities-level-previoustime-previoustime-src-mq3-game-entities-ml-1764278019"></a>
### previousTime

```ml
previousTime
```

Previous game-frame time used for motion and rollback calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L335)

<a id="field-field-mq3-game-entities-level-quadfactor-quadfactor-src-mq3-game-entities-ml-781487731"></a>
### quadfactor

```ml
quadfactor
```

Damage multiplier applied by the active quad-damage effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L552)

<a id="field-field-mq3-game-entities-level-randseed-randseed-src-mq3-game-entities-ml-846562035"></a>
### randSeed

```ml
randSeed
```

Pseudo-random seed carried by the game state for repeatable random choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L306)

<a id="field-field-mq3-game-entities-level-readytoexit-readytoexit-src-mq3-game-entities-ml-1283008147"></a>
### readyToExit

```ml
readyToExit
```

Nonzero when this client or match is ready to leave the intermission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L381)

<a id="field-field-mq3-game-entities-level-redflagstatus-redflagstatus-src-mq3-game-entities-ml-187316839"></a>
### redFlagStatus

```ml
redFlagStatus
```

Current capture-the-flag state of the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L401)

<a id="field-field-mq3-game-entities-level-redobeliskattackedtime-redobeliskattackedtime-src-mq3-game-entities-ml-1248916859"></a>
### redObeliskAttackedTime

```ml
redObeliskAttackedTime
```

Next allowed red-base-under-attack announcement time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L562)

<a id="field-field-mq3-game-entities-level-redtakentime-redtakentime-src-mq3-game-entities-ml-1063746153"></a>
### redTakenTime

```ml
redTakenTime
```

Timestamp at which the red flag was most recently taken.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L407)

<a id="field-field-mq3-game-entities-level-removequeuedbotbeginfn-removequeuedbotbeginfn-src-mq3-game-entities-ml-841893925"></a>
### removeQueuedBotBeginFn

```ml
removeQueuedBotBeginFn
```

Injected callback for remove queued bot begin; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L534)

<a id="field-field-mq3-game-entities-level-respawnfn-respawnfn-src-mq3-game-entities-ml-647132883"></a>
### respawnFn

```ml
respawnFn
```

Injected callback for respawn; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L463)

<a id="field-field-mq3-game-entities-level-restarted-restarted-src-mq3-game-entities-ml-10845563"></a>
### restarted

```ml
restarted
```

Nonzero while waiting for a requested map restart to take effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L469)

<a id="field-field-mq3-game-entities-level-runentityfn-runentityfn-src-mq3-game-entities-ml-645156531"></a>
### runEntityFn

```ml
runEntityFn
```

Injected callback for run entity; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L321)

<a id="field-field-mq3-game-entities-level-scene-scene-src-mq3-game-entities-ml-929997263"></a>
### scene

```ml
scene
```

Shared scene/world representation used by game entities and collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L296)

<a id="field-field-mq3-game-entities-level-servercommandfn-servercommandfn-src-mq3-game-entities-ml-1098017871"></a>
### serverCommandFn

```ml
serverCommandFn
```

Injected callback for server command; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L385)

<a id="field-field-mq3-game-entities-level-servercommands-servercommands-src-mq3-game-entities-ml-1924910905"></a>
### serverCommands

```ml
serverCommands
```

Server-command dispatcher and associated game command state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L560)

<a id="field-field-mq3-game-entities-level-shaderremaps-shaderremaps-src-mq3-game-entities-ml-1976154061"></a>
### shaderRemaps

```ml
shaderRemaps
```

Accumulated shader-name remappings applied by map targets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L319)

<a id="field-field-mq3-game-entities-level-smoothclients-smoothclients-src-mq3-game-entities-ml-285853947"></a>
### smoothClients

```ml
smoothClients
```

Setting controlling client movement extrapolation/smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L433)

<a id="field-field-mq3-game-entities-level-sndfry-sndfry-src-mq3-game-entities-ml-686513679"></a>
### sndFry

```ml
sndFry
```

Registered sound index for the environmental frying sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L431)

<a id="field-field-mq3-game-entities-level-sortedclients-sortedclients-src-mq3-game-entities-ml-756207219"></a>
### sortedClients

```ml
sortedClients
```

Client slot numbers ordered by the current rank/score calculation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L355)

<a id="field-field-mq3-game-entities-level-spawner-spawner-src-mq3-game-entities-ml-588654891"></a>
### spawner

```ml
spawner
```

Map-entity spawning state or dispatcher associated with the level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L317)

<a id="field-field-mq3-game-entities-level-spawnvictorypadsfn-spawnvictorypadsfn-src-mq3-game-entities-ml-1642217333"></a>
### spawnVictoryPadsFn

```ml
spawnVictoryPadsFn
```

Injected callback for spawn victory pads; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L544)

<a id="field-field-mq3-game-entities-level-starttime-starttime-src-mq3-game-entities-ml-193646895"></a>
### startTime

```ml
startTime
```

Server timestamp at which the level began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L304)

<a id="field-field-mq3-game-entities-level-synchronousclients-synchronousclients-src-mq3-game-entities-ml-1134753937"></a>
### synchronousClients

```ml
synchronousClients
```

Nonzero when commands are processed synchronously with game frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L447)

<a id="field-field-mq3-game-entities-level-teamautojoin-teamautojoin-src-mq3-game-entities-ml-1715809631"></a>
### teamAutoJoin

```ml
teamAutoJoin
```

Setting allowing clients to join a playing team automatically.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L520)

<a id="field-field-mq3-game-entities-level-teamforcebalance-teamforcebalance-src-mq3-game-entities-ml-1476252883"></a>
### teamForceBalance

```ml
teamForceBalance
```

Setting requiring balanced player counts when changing teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L532)

<a id="field-field-mq3-game-entities-level-teammessagefn-teammessagefn-src-mq3-game-entities-ml-725435815"></a>
### teamMessageFn

```ml
teamMessageFn
```

Injected callback for team message; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L397)

<a id="field-field-mq3-game-entities-level-teamscores-teamscores-src-mq3-game-entities-ml-364800955"></a>
### teamScores

```ml
teamScores
```

Scores indexed by the active team identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L357)

<a id="field-field-mq3-game-entities-level-teamvoteno-teamvoteno-src-mq3-game-entities-ml-2040202287"></a>
### teamVoteNo

```ml
teamVoteNo
```

Per-team counts of no votes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L501)

<a id="field-field-mq3-game-entities-level-teamvotestring-teamvotestring-src-mq3-game-entities-ml-1593398811"></a>
### teamVoteString

```ml
teamVoteString
```

Per-team commands/text associated with active team votes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L495)

<a id="field-field-mq3-game-entities-level-teamvotetime-teamvotetime-src-mq3-game-entities-ml-388545803"></a>
### teamVoteTime

```ml
teamVoteTime
```

Per-team start timestamps of active team votes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L497)

<a id="field-field-mq3-game-entities-level-teamvoteyes-teamvoteyes-src-mq3-game-entities-ml-895923031"></a>
### teamVoteYes

```ml
teamVoteYes
```

Per-team counts of yes votes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L499)

<a id="field-field-mq3-game-entities-level-time-time-src-mq3-game-entities-ml-1015588741"></a>
### time

```ml
time
```

Current server game time in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L302)

<a id="field-field-mq3-game-entities-level-timelimit-timelimit-src-mq3-game-entities-ml-1206827299"></a>
### timelimit

```ml
timelimit
```

Configured match time limit in minutes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L375)

<a id="field-field-mq3-game-entities-level-tournamentaddfn-tournamentaddfn-src-mq3-game-entities-ml-1502775979"></a>
### tournamentAddFn

```ml
tournamentAddFn
```

Injected callback for tournament add; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L481)

<a id="field-field-mq3-game-entities-level-traceobservefn-traceobservefn-src-mq3-game-entities-ml-889926777"></a>
### traceObserveFn

```ml
traceObserveFn
```

Injected callback for trace observe; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L333)

<a id="field-field-mq3-game-entities-level-updatecvarsfn-updatecvarsfn-src-mq3-game-entities-ml-750276883"></a>
### updateCvarsFn

```ml
updateCvarsFn
```

Injected callback for update console variables; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L512)

<a id="field-field-mq3-game-entities-level-updatetournamentinfofn-updatetournamentinfofn-src-mq3-game-entities-ml-1330425651"></a>
### updateTournamentInfoFn

```ml
updateTournamentInfoFn
```

Injected callback for update tournament info; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L542)

<a id="field-field-mq3-game-entities-level-usercmdfn-usercmdfn-src-mq3-game-entities-ml-517797419"></a>
### usercmdFn

```ml
usercmdFn
```

Injected callback for user command; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L423)

<a id="field-field-mq3-game-entities-level-userinfofn-userinfofn-src-mq3-game-entities-ml-1020951909"></a>
### userinfoFn

```ml
userinfoFn
```

Injected callback for user information; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L421)

<a id="field-field-mq3-game-entities-level-userinfosetfn-userinfosetfn-src-mq3-game-entities-ml-599033095"></a>
### userinfoSetFn

```ml
userinfoSetFn
```

Injected callback for user information set; invoked through the Level service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L550)

<a id="field-field-mq3-game-entities-level-votedisplaystring-votedisplaystring-src-mq3-game-entities-ml-405580175"></a>
### voteDisplayString

```ml
voteDisplayString
```

Human-readable description advertised for the active global vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L514)

<a id="field-field-mq3-game-entities-level-voteexecutetime-voteexecutetime-src-mq3-game-entities-ml-1644916819"></a>
### voteExecuteTime

```ml
voteExecuteTime
```

Scheduled time for executing a successful vote command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L489)

<a id="field-field-mq3-game-entities-level-voteno-voteno-src-mq3-game-entities-ml-788364541"></a>
### voteNo

```ml
voteNo
```

Number of no votes received for the active global vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L493)

<a id="field-field-mq3-game-entities-level-votestring-votestring-src-mq3-game-entities-ml-265669301"></a>
### voteString

```ml
voteString
```

Console command or text associated with the active global vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L485)

<a id="field-field-mq3-game-entities-level-votetime-votetime-src-mq3-game-entities-ml-1239239129"></a>
### voteTime

```ml
voteTime
```

Timestamp at which the active global vote began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L487)

<a id="field-field-mq3-game-entities-level-voteyes-voteyes-src-mq3-game-entities-ml-1745025083"></a>
### voteYes

```ml
voteYes
```

Number of yes votes received for the active global vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L491)

<a id="field-field-mq3-game-entities-level-warmup-warmup-src-mq3-game-entities-ml-2136349819"></a>
### warmup

```ml
warmup
```

Warmup deadline/state advertised to clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L475)

<a id="field-field-mq3-game-entities-level-warmupcvarmodificationcount-warmupcvarmodificationcount-src-mq3-game-entities-ml-507649503"></a>
### warmupCvarModificationCount

```ml
warmupCvarModificationCount
```

Current revision of the warmup console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L479)

<a id="field-field-mq3-game-entities-level-warmupmodificationcount-warmupmodificationcount-src-mq3-game-entities-ml-197585031"></a>
### warmupModificationCount

```ml
warmupModificationCount
```

Warmup-setting revision already processed by game logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L477)

<a id="field-field-mq3-game-entities-level-weaponrespawn-weaponrespawn-src-mq3-game-entities-ml-1741926111"></a>
### weaponRespawn

```ml
weaponRespawn
```

Configured respawn delay for weapon pickups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L415)

<a id="field-field-mq3-game-entities-level-weaponstate-weaponstate-src-mq3-game-entities-ml-1291153807"></a>
### weaponState

```ml
weaponState
```

Shared weapon firing/projectile state maintained by the level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L554)

<a id="field-field-mq3-game-entities-level-weaponteamrespawn-weaponteamrespawn-src-mq3-game-entities-ml-1215028087"></a>
### weaponTeamRespawn

```ml
weaponTeamRespawn
```

Configured weapon-pickup respawn delay in team games.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L417)
