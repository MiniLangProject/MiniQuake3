# `mq3.engine.local_qvm_match.Context`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-context-struct-context-src-mq3-engine-local-qvm-match-ml-479626575"></a>
## Context

```ml
struct Context
```

Context record for engine.local_qvm_match, containing `archive`, `entityParser`, `cvars`, `commandState`, `configstrings`, `userinfos`, and 106 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L246)

## Members

<a id="field-field-mq3-engine-local-qvm-match-context-aas-aas-src-mq3-engine-local-qvm-match-ml-819240786"></a>
### aas

```ml
aas
```

Loaded area-awareness navigation data used by bot queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L344)

<a id="field-field-mq3-engine-local-qvm-match-context-aascachepath-aascachepath-src-mq3-engine-local-qvm-match-ml-1450307926"></a>
### aasCachePath

```ml
aasCachePath
```

File path used to load or persist the AAS routing cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L350)

<a id="field-field-mq3-engine-local-qvm-match-context-aasentities-aasentities-src-mq3-engine-local-qvm-match-ml-953124778"></a>
### aasEntities

```ml
aasEntities
```

Dynamic entity states supplied to the AAS navigation subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L366)

<a id="field-field-mq3-engine-local-qvm-match-context-aasmovement-aasmovement-src-mq3-engine-local-qvm-match-ml-618287774"></a>
### aasMovement

```ml
aasMovement
```

State and scratch data for predicted AAS movement queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L372)

<a id="field-field-mq3-engine-local-qvm-match-context-aasroutecache-aasroutecache-src-mq3-engine-local-qvm-match-ml-166687158"></a>
### aasRouteCache

```ml
aasRouteCache
```

Cached travel-time and route results for the AAS graph.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L348)

<a id="field-field-mq3-engine-local-qvm-match-context-aasrouter-aasrouter-src-mq3-engine-local-qvm-match-ml-962988510"></a>
### aasRouter

```ml
aasRouter
```

Routing state used to find paths through the AAS navigation graph.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L346)

<a id="field-field-mq3-engine-local-qvm-match-context-aicharacters-aicharacters-src-mq3-engine-local-qvm-match-ml-383703766"></a>
### aiCharacters

```ml
aiCharacters
```

Loaded bot-character profiles and characteristic values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L368)

<a id="field-field-mq3-engine-local-qvm-match-context-aichat-aichat-src-mq3-engine-local-qvm-match-ml-606199406"></a>
### aiChat

```ml
aiChat
```

Bot chat contexts and conversation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L376)

<a id="field-field-mq3-engine-local-qvm-match-context-aichatgoaltail-aichatgoaltail-src-mq3-engine-local-qvm-match-ml-1606847856"></a>
### aiChatGoalTail

```ml
aiChatGoalTail
```

Extended chat and goal trap state maintained by the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L396)

<a id="field-field-mq3-engine-local-qvm-match-context-aichatmatches-aichatmatches-src-mq3-engine-local-qvm-match-ml-1235762406"></a>
### aiChatMatches

```ml
aiChatMatches
```

Chat-message matching rules and captured variables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L394)

<a id="field-field-mq3-engine-local-qvm-match-context-aichatoutput-aichatoutput-src-mq3-engine-local-qvm-match-ml-636387556"></a>
### aiChatOutput

```ml
aiChatOutput
```

Generated chat messages awaiting delivery to the game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L402)

<a id="field-field-mq3-engine-local-qvm-match-context-aichatstrings-aichatstrings-src-mq3-engine-local-qvm-match-ml-1356115654"></a>
### aiChatStrings

```ml
aiChatStrings
```

Named chat strings and substitution data for bot conversations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L392)

<a id="field-field-mq3-engine-local-qvm-match-context-aiconsole-aiconsole-src-mq3-engine-local-qvm-match-ml-518681314"></a>
### aiConsole

```ml
aiConsole
```

Console-message queues consumed by bot AI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L382)

<a id="field-field-mq3-engine-local-qvm-match-context-aigoalselection-aigoalselection-src-mq3-engine-local-qvm-match-ml-1207451118"></a>
### aiGoalSelection

```ml
aiGoalSelection
```

State used to select long-term and nearby bot goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L390)

<a id="field-field-mq3-engine-local-qvm-match-context-aigoalstate-aigoalstate-src-mq3-engine-local-qvm-match-ml-1502415286"></a>
### aiGoalState

```ml
aiGoalState
```

Goal stacks and avoid-goal state for active bots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L388)

<a id="field-field-mq3-engine-local-qvm-match-context-aiitemweights-aiitemweights-src-mq3-engine-local-qvm-match-ml-166657238"></a>
### aiItemWeights

```ml
aiItemWeights
```

Item desirability weights used by bot goal selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L374)

<a id="field-field-mq3-engine-local-qvm-match-context-ailevelitems-ailevelitems-src-mq3-engine-local-qvm-match-ml-1441847014"></a>
### aiLevelItems

```ml
aiLevelItems
```

Level item catalog used by bot goal queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L386)

<a id="field-field-mq3-engine-local-qvm-match-context-aimapgoals-aimapgoals-src-mq3-engine-local-qvm-match-ml-1195212294"></a>
### aiMapGoals

```ml
aiMapGoals
```

Map-defined goal records used by bot navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L404)

<a id="field-field-mq3-engine-local-qvm-match-context-aimoveruntime-aimoveruntime-src-mq3-engine-local-qvm-match-ml-340529546"></a>
### aiMoveRuntime

```ml
aiMoveRuntime
```

Bot movement contexts used by movement decision traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L398)

<a id="field-field-mq3-engine-local-qvm-match-context-airesources-airesources-src-mq3-engine-local-qvm-match-ml-1136346162"></a>
### aiResources

```ml
aiResources
```

Handle pools and resources owned by the bot AI subsystems.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L370)

<a id="field-field-mq3-engine-local-qvm-match-context-aivisibleposition-aivisibleposition-src-mq3-engine-local-qvm-match-ml-434794794"></a>
### aiVisiblePosition

```ml
aiVisiblePosition
```

State used to predict positions visible to a bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L400)

<a id="field-field-mq3-engine-local-qvm-match-context-aiweaponweights-aiweaponweights-src-mq3-engine-local-qvm-match-ml-831936850"></a>
### aiWeaponWeights

```ml
aiWeaponWeights
```

Weapon preference weights used by bot combat decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L378)

<a id="field-field-mq3-engine-local-qvm-match-context-archive-archive-src-mq3-engine-local-qvm-match-ml-125515174"></a>
### archive

```ml
archive
```

Asset archive used to resolve game resources by virtual path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L248)

<a id="field-field-mq3-engine-local-qvm-match-context-assetkinds-assetkinds-src-mq3-engine-local-qvm-match-ml-1260132992"></a>
### assetKinds

```ml
assetKinds
```

Resource kinds associated with registered asset handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L290)

<a id="field-field-mq3-engine-local-qvm-match-context-assets-assets-src-mq3-engine-local-qvm-match-ml-1086702948"></a>
### assets

```ml
assets
```

Registered resource handles and their backing asset data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L288)

<a id="field-field-mq3-engine-local-qvm-match-context-botallocations-botallocations-src-mq3-engine-local-qvm-match-ml-1269188550"></a>
### botAllocations

```ml
botAllocations
```

Number of bot-client allocations requested through VM traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L358)

<a id="field-field-mq3-engine-local-qvm-match-context-botbspentities-botbspentities-src-mq3-engine-local-qvm-match-ml-1089840676"></a>
### botBspEntities

```ml
botBspEntities
```

BSP entity data exposed to bot-library queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L352)

<a id="field-field-mq3-engine-local-qvm-match-context-botfrees-botfrees-src-mq3-engine-local-qvm-match-ml-1758501638"></a>
### botFrees

```ml
botFrees
```

Number of bot-client releases requested through VM traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L360)

<a id="field-field-mq3-engine-local-qvm-match-context-botlib-botlib-src-mq3-engine-local-qvm-match-ml-1999746566"></a>
### botlib

```ml
botlib
```

Bot-library state exposed to game VM system calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L342)

<a id="field-field-mq3-engine-local-qvm-match-context-botserver-botserver-src-mq3-engine-local-qvm-match-ml-295495190"></a>
### botServer

```ml
botServer
```

Server-side adapter for bot clients and bot frame updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L380)

<a id="field-field-mq3-engine-local-qvm-match-context-cgamecollisionqueries-cgamecollisionqueries-src-mq3-engine-local-qvm-match-ml-1820065850"></a>
### cgameCollisionQueries

```ml
cgameCollisionQueries
```

Client-game collision query adapter and scratch state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L320)

<a id="field-field-mq3-engine-local-qvm-match-context-cgamekeys-cgamekeys-src-mq3-engine-local-qvm-match-ml-87005242"></a>
### cgameKeys

```ml
cgameKeys
```

Key bindings and key-capture state exposed to the client-game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L408)

<a id="field-field-mq3-engine-local-qvm-match-context-cgamequerymemo-cgamequerymemo-src-mq3-engine-local-qvm-match-ml-1743772388"></a>
### cgameQueryMemo

```ml
cgameQueryMemo
```

Memoized client-game queries reused within the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L460)

<a id="field-field-mq3-engine-local-qvm-match-context-cgameservercommands-cgameservercommands-src-mq3-engine-local-qvm-match-ml-1831139830"></a>
### cgameServerCommands

```ml
cgameServerCommands
```

Server-command history exposed to the client-game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L420)

<a id="field-field-mq3-engine-local-qvm-match-context-cgamesnapshotscratch-cgamesnapshotscratch-src-mq3-engine-local-qvm-match-ml-1705492964"></a>
### cgameSnapshotScratch

```ml
cgameSnapshotScratch
```

Reusable storage for client-game snapshot trap results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L468)

<a id="field-field-mq3-engine-local-qvm-match-context-cgametagqueries-cgametagqueries-src-mq3-engine-local-qvm-match-ml-248418782"></a>
### cgameTagQueries

```ml
cgameTagQueries
```

Client-game model-tag lookup adapter and scratch state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L322)

<a id="field-field-mq3-engine-local-qvm-match-context-cgametrapcounts-cgametrapcounts-src-mq3-engine-local-qvm-match-ml-1565453266"></a>
### cgameTrapCounts

```ml
cgameTrapCounts
```

Invocation counts for client-game VM system calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L340)

<a id="field-field-mq3-engine-local-qvm-match-context-cgameusercmd-cgameusercmd-src-mq3-engine-local-qvm-match-ml-1574202174"></a>
### cgameUsercmd

```ml
cgameUsercmd
```

Client-game overrides applied when constructing user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L412)

<a id="field-field-mq3-engine-local-qvm-match-context-cinematics-cinematics-src-mq3-engine-local-qvm-match-ml-962921362"></a>
### cinematics

```ml
cinematics
```

Active cinematic handles, decoded frames, and playback state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L338)

<a id="field-field-mq3-engine-local-qvm-match-context-clientstates-clientstates-src-mq3-engine-local-qvm-match-ml-1326850640"></a>
### clientStates

```ml
clientStates
```

Per-client state maintained by the local game host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L356)

<a id="field-field-mq3-engine-local-qvm-match-context-clientstride-clientstride-src-mq3-engine-local-qvm-match-ml-1799157418"></a>
### clientStride

```ml
clientStride
```

Distance in bytes between consecutive game client records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L280)

<a id="field-field-mq3-engine-local-qvm-match-context-clienttextinput-clienttextinput-src-mq3-engine-local-qvm-match-ml-1163664682"></a>
### clientTextInput

```ml
clientTextInput
```

Text-entry state for client console and UI input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L426)

<a id="field-field-mq3-engine-local-qvm-match-context-collisionworld-collisionworld-src-mq3-engine-local-qvm-match-ml-1410482374"></a>
### collisionWorld

```ml
collisionWorld
```

Loaded world data used for point contents and collision traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L310)

<a id="field-field-mq3-engine-local-qvm-match-context-commandnumber-commandnumber-src-mq3-engine-local-qvm-match-ml-542267286"></a>
### commandNumber

```ml
commandNumber
```

Sequence number of the current client user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L316)

<a id="field-field-mq3-engine-local-qvm-match-context-commandstate-commandstate-src-mq3-engine-local-qvm-match-ml-443747530"></a>
### commandState

```ml
commandState
```

Runtime state of the command parser and command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L254)

<a id="field-field-mq3-engine-local-qvm-match-context-configstrings-configstrings-src-mq3-engine-local-qvm-match-ml-1306329998"></a>
### configstrings

```ml
configstrings
```

Server configuration strings exposed to game and client VMs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L256)

<a id="field-field-mq3-engine-local-qvm-match-context-console-console-src-mq3-engine-local-qvm-match-ml-623387530"></a>
### console

```ml
console
```

Console output and commands exchanged with the VM host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L270)

<a id="field-field-mq3-engine-local-qvm-match-context-cvars-cvars-src-mq3-engine-local-qvm-match-ml-1385178938"></a>
### cvars

```ml
cvars
```

Console variables and their current runtime values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L252)

<a id="field-field-mq3-engine-local-qvm-match-context-elementaryactions-elementaryactions-src-mq3-engine-local-qvm-match-ml-1619587106"></a>
### elementaryActions

```ml
elementaryActions
```

Movement and button actions accumulated by bot elementary-action traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L362)

<a id="field-field-mq3-engine-local-qvm-match-context-entitycount-entitycount-src-mq3-engine-local-qvm-match-ml-846467518"></a>
### entityCount

```ml
entityCount
```

Number of game entities currently exposed by the VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L276)

<a id="field-field-mq3-engine-local-qvm-match-context-entityparser-entityparser-src-mq3-engine-local-qvm-match-ml-2047495814"></a>
### entityParser

```ml
entityParser
```

Cursor used to read key/value entities from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L250)

<a id="field-field-mq3-engine-local-qvm-match-context-entitystride-entitystride-src-mq3-engine-local-qvm-match-ml-722455166"></a>
### entityStride

```ml
entityStride
```

Distance in bytes between consecutive game entity records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L278)

<a id="field-field-mq3-engine-local-qvm-match-context-errors-errors-src-mq3-engine-local-qvm-match-ml-159137892"></a>
### errors

```ml
errors
```

Errors recorded by this subsystem or its host callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L268)

<a id="field-field-mq3-engine-local-qvm-match-context-files-files-src-mq3-engine-local-qvm-match-ml-1999833266"></a>
### files

```ml
files
```

Open VM file handles and their associated cursors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L262)

<a id="field-field-mq3-engine-local-qvm-match-context-fontregistry-fontregistry-src-mq3-engine-local-qvm-match-ml-461380470"></a>
### fontRegistry

```ml
fontRegistry
```

Font assets and glyph metadata registered by the VMs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L334)

<a id="field-field-mq3-engine-local-qvm-match-context-frames-frames-src-mq3-engine-local-qvm-match-ml-599355278"></a>
### frames

```ml
frames
```

Number of local game-host frames executed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L284)

<a id="field-field-mq3-engine-local-qvm-match-context-game-game-src-mq3-engine-local-qvm-match-ml-861605110"></a>
### game

```ml
game
```

Loaded game VM instance or native game state used by the local match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L458)

<a id="field-field-mq3-engine-local-qvm-match-context-gameclients-gameclients-src-mq3-engine-local-qvm-match-ml-2056164854"></a>
### gameClients

```ml
gameClients
```

Game client records shared with the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L274)

<a id="field-field-mq3-engine-local-qvm-match-context-gameentities-gameentities-src-mq3-engine-local-qvm-match-ml-226382868"></a>
### gameEntities

```ml
gameEntities
```

Game entity records shared with the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L272)

<a id="field-field-mq3-engine-local-qvm-match-context-inputclearcontext-inputclearcontext-src-mq3-engine-local-qvm-match-ml-1341116406"></a>
### inputClearContext

```ml
inputClearContext
```

Host state supplied when captured input must be cleared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L462)

<a id="field-field-mq3-engine-local-qvm-match-context-inputclearfn-inputclearfn-src-mq3-engine-local-qvm-match-ml-1599269012"></a>
### inputClearFn

```ml
inputClearFn
```

Host callback used to perform input clear operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L464)

<a id="field-field-mq3-engine-local-qvm-match-context-lastbottrap-lastbottrap-src-mq3-engine-local-qvm-match-ml-1555225910"></a>
### lastBotTrap

```ml
lastBotTrap
```

Most recently dispatched bot-library system-call identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L364)

<a id="field-field-mq3-engine-local-qvm-match-context-latestrefdef-latestrefdef-src-mq3-engine-local-qvm-match-ml-1729306080"></a>
### latestRefdef

```ml
latestRefdef
```

Most recent camera and viewport definition submitted by the client VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L302)

<a id="field-field-mq3-engine-local-qvm-match-context-latestsnapshot-latestsnapshot-src-mq3-engine-local-qvm-match-ml-2007855420"></a>
### latestSnapshot

```ml
latestSnapshot
```

Most recently published client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L298)

<a id="field-field-mq3-engine-local-qvm-match-context-lightgrid-lightgrid-src-mq3-engine-local-qvm-match-ml-161831618"></a>
### lightGrid

```ml
lightGrid
```

Baked lighting grid used to light dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L324)

<a id="field-field-mq3-engine-local-qvm-match-context-linked-linked-src-mq3-engine-local-qvm-match-ml-1829648832"></a>
### linked

```ml
linked
```

Entity-link state used by server collision and spatial queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L286)

<a id="field-field-mq3-engine-local-qvm-match-context-machineruntime-machineruntime-src-mq3-engine-local-qvm-match-ml-1992009048"></a>
### machineRuntime

```ml
machineRuntime
```

Runtime services used to execute the loaded QVM machines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L314)

<a id="field-field-mq3-engine-local-qvm-match-context-markgeometry-markgeometry-src-mq3-engine-local-qvm-match-ml-715590768"></a>
### markGeometry

```ml
markGeometry
```

Cached world geometry used when projecting impact marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L294)

<a id="field-field-mq3-engine-local-qvm-match-context-markmap-markmap-src-mq3-engine-local-qvm-match-ml-542141722"></a>
### markMap

```ml
markMap
```

World-surface map used when clipping projected marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L332)

<a id="field-field-mq3-engine-local-qvm-match-context-modelassets-modelassets-src-mq3-engine-local-qvm-match-ml-524098102"></a>
### modelAssets

```ml
modelAssets
```

Model data associated with registered model handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L292)

<a id="field-field-mq3-engine-local-qvm-match-context-nativecgamecommands-nativecgamecommands-src-mq3-engine-local-qvm-match-ml-1030283718"></a>
### nativeCgameCommands

```ml
nativeCgameCommands
```

Native client-game command processing state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L424)

<a id="field-field-mq3-engine-local-qvm-match-context-nativedraw-nativedraw-src-mq3-engine-local-qvm-match-ml-731049220"></a>
### nativeDraw

```ml
nativeDraw
```

Native client-game HUD and overlay drawing state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L446)

<a id="field-field-mq3-engine-local-qvm-match-context-nativedrawtools-nativedrawtools-src-mq3-engine-local-qvm-match-ml-529936506"></a>
### nativeDrawtools

```ml
nativeDrawtools
```

Native client-game drawing primitives and HUD helpers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L444)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeeffects-nativeeffects-src-mq3-engine-local-qvm-match-ml-2035136950"></a>
### nativeEffects

```ml
nativeEffects
```

Native client-game transient visual-effect state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L438)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeentities-nativeentities-src-mq3-engine-local-qvm-match-ml-1309360934"></a>
### nativeEntities

```ml
nativeEntities
```

Native client-game entity presentation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L434)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeevents-nativeevents-src-mq3-engine-local-qvm-match-ml-1613130990"></a>
### nativeEvents

```ml
nativeEvents
```

Native client-game entity-event processing state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L432)

<a id="field-field-mq3-engine-local-qvm-match-context-nativelocalentities-nativelocalentities-src-mq3-engine-local-qvm-match-ml-697598314"></a>
### nativeLocalEntities

```ml
nativeLocalEntities
```

Native client-game temporary and local entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L436)

<a id="field-field-mq3-engine-local-qvm-match-context-nativemain-nativemain-src-mq3-engine-local-qvm-match-ml-412937374"></a>
### nativeMain

```ml
nativeMain
```

Native client-game lifecycle and frame orchestration state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L452)

<a id="field-field-mq3-engine-local-qvm-match-context-nativemarks-nativemarks-src-mq3-engine-local-qvm-match-ml-1354458662"></a>
### nativeMarks

```ml
nativeMarks
```

Native client-game persistent impact-mark state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L454)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeparticles-nativeparticles-src-mq3-engine-local-qvm-match-ml-1101946630"></a>
### nativeParticles

```ml
nativeParticles
```

Native client-game particle simulation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L448)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeplayers-nativeplayers-src-mq3-engine-local-qvm-match-ml-1940376430"></a>
### nativePlayers

```ml
nativePlayers
```

Native client-game player model and animation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L456)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeplayerstate-nativeplayerstate-src-mq3-engine-local-qvm-match-ml-2089437822"></a>
### nativePlayerState

```ml
nativePlayerState
```

Native client-game player-state transition state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L430)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeservercmds-nativeservercmds-src-mq3-engine-local-qvm-match-ml-1272135696"></a>
### nativeServerCmds

```ml
nativeServerCmds
```

Native client-game server-command dispatch state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L450)

<a id="field-field-mq3-engine-local-qvm-match-context-nativesnapshots-nativesnapshots-src-mq3-engine-local-qvm-match-ml-610905874"></a>
### nativeSnapshots

```ml
nativeSnapshots
```

Native client-game snapshot processing state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L428)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeview-nativeview-src-mq3-engine-local-qvm-match-ml-1101752890"></a>
### nativeView

```ml
nativeView
```

Native client-game camera and view calculation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L442)

<a id="field-field-mq3-engine-local-qvm-match-context-nativeweapons-nativeweapons-src-mq3-engine-local-qvm-match-ml-2140738382"></a>
### nativeWeapons

```ml
nativeWeapons
```

Native client-game weapon rendering and effect state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L440)

<a id="field-field-mq3-engine-local-qvm-match-context-nextfile-nextfile-src-mq3-engine-local-qvm-match-ml-847133076"></a>
### nextFile

```ml
nextFile
```

Next handle identifier allocated when a VM opens a file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L264)

<a id="field-field-mq3-engine-local-qvm-match-context-now-now-src-mq3-engine-local-qvm-match-ml-1564396082"></a>
### now

```ml
now
```

Current host time in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L282)

<a id="field-field-mq3-engine-local-qvm-match-context-pcregistry-pcregistry-src-mq3-engine-local-qvm-match-ml-421381198"></a>
### pcRegistry

```ml
pcRegistry
```

Parser-source handles used by the VM parser traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L336)

<a id="field-field-mq3-engine-local-qvm-match-context-pendingclientcommands-pendingclientcommands-src-mq3-engine-local-qvm-match-ml-1943602478"></a>
### pendingClientCommands

```ml
pendingClientCommands
```

Client console commands waiting for execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L466)

<a id="field-field-mq3-engine-local-qvm-match-context-prints-prints-src-mq3-engine-local-qvm-match-ml-1901903382"></a>
### prints

```ml
prints
```

Messages captured from diagnostic print operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L266)

<a id="field-field-mq3-engine-local-qvm-match-context-qvmroot-qvmroot-src-mq3-engine-local-qvm-match-ml-875696838"></a>
### qvmRoot

```ml
qvmRoot
```

Filesystem root used to resolve game, client-game, and UI QVM modules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L308)

<a id="field-field-mq3-engine-local-qvm-match-context-rendererentitytokens-rendererentitytokens-src-mq3-engine-local-qvm-match-ml-1926693238"></a>
### rendererEntityTokens

```ml
rendererEntityTokens
```

Cursor over map entity text exposed by renderer traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L384)

<a id="field-field-mq3-engine-local-qvm-match-context-renderqueue-renderqueue-src-mq3-engine-local-qvm-match-ml-1123014014"></a>
### renderQueue

```ml
renderQueue
```

Queued scene and drawing commands produced by the client VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L306)

<a id="field-field-mq3-engine-local-qvm-match-context-renderviews-renderviews-src-mq3-engine-local-qvm-match-ml-1236040294"></a>
### renderViews

```ml
renderViews
```

Camera and scene submissions collected for rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L330)

<a id="field-field-mq3-engine-local-qvm-match-context-scene-scene-src-mq3-engine-local-qvm-match-ml-1628752298"></a>
### scene

```ml
scene
```

Scene entities, lights, and polygons collected for drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L304)

<a id="field-field-mq3-engine-local-qvm-match-context-serverstream-serverstream-src-mq3-engine-local-qvm-match-ml-769423220"></a>
### serverStream

```ml
serverStream
```

Stream that carries local server messages to the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L470)

<a id="field-field-mq3-engine-local-qvm-match-context-shaderremaps-shaderremaps-src-mq3-engine-local-qvm-match-ml-157543884"></a>
### shaderRemaps

```ml
shaderRemaps
```

Shader name substitutions and associated effect-time offsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L354)

<a id="field-field-mq3-engine-local-qvm-match-context-snapshotnumber-snapshotnumber-src-mq3-engine-local-qvm-match-ml-1630049280"></a>
### snapshotNumber

```ml
snapshotNumber
```

Sequence number of the latest available client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L300)

<a id="field-field-mq3-engine-local-qvm-match-context-soundcommands-soundcommands-src-mq3-engine-local-qvm-match-ml-925054470"></a>
### soundCommands

```ml
soundCommands
```

Sound requests collected from game or client VM traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L296)

<a id="field-field-mq3-engine-local-qvm-match-context-spatialscene-spatialscene-src-mq3-engine-local-qvm-match-ml-1796717198"></a>
### spatialScene

```ml
spatialScene
```

Spatial index containing entities used by collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L312)

<a id="field-field-mq3-engine-local-qvm-match-context-uiclient-uiclient-src-mq3-engine-local-qvm-match-ml-1580314644"></a>
### uiClient

```ml
uiClient
```

Client connection state exposed to UI system calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L422)

<a id="field-field-mq3-engine-local-qvm-match-context-uiframes-uiframes-src-mq3-engine-local-qvm-match-ml-807622934"></a>
### uiFrames

```ml
uiFrames
```

Number of UI frame updates processed by the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L328)

<a id="field-field-mq3-engine-local-qvm-match-context-uikeycatcher-uikeycatcher-src-mq3-engine-local-qvm-match-ml-579909532"></a>
### uiKeyCatcher

```ml
uiKeyCatcher
```

Input-capture flags controlling which keys are routed to the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L326)

<a id="field-field-mq3-engine-local-qvm-match-context-uilan-uilan-src-mq3-engine-local-qvm-match-ml-742384962"></a>
### uiLan

```ml
uiLan
```

LAN server browser state exposed to the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L406)

<a id="field-field-mq3-engine-local-qvm-match-context-uilancachehost-uilancachehost-src-mq3-engine-local-qvm-match-ml-1675381788"></a>
### uiLanCacheHost

```ml
uiLanCacheHost
```

Host adapter used to persist or restore the UI server cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L410)

<a id="field-field-mq3-engine-local-qvm-match-context-uilaningress-uilaningress-src-mq3-engine-local-qvm-match-ml-214322822"></a>
### uiLanIngress

```ml
uiLanIngress
```

Incoming network data routed to the UI LAN browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L414)

<a id="field-field-mq3-engine-local-qvm-match-context-uilanqueries-uilanqueries-src-mq3-engine-local-qvm-match-ml-1748898220"></a>
### uiLanQueries

```ml
uiLanQueries
```

Outstanding LAN server-information and status queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L416)

<a id="field-field-mq3-engine-local-qvm-match-context-uilanudp-uilanudp-src-mq3-engine-local-qvm-match-ml-19824390"></a>
### uiLanUdp

```ml
uiLanUdp
```

UDP transport used by UI LAN browser requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L418)

<a id="field-field-mq3-engine-local-qvm-match-context-usercmdhistory-usercmdhistory-src-mq3-engine-local-qvm-match-ml-248760124"></a>
### usercmdHistory

```ml
usercmdHistory
```

Ring or history buffer containing recent client user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L318)

<a id="field-field-mq3-engine-local-qvm-match-context-usercmds-usercmds-src-mq3-engine-local-qvm-match-ml-1720748530"></a>
### usercmds

```ml
usercmds
```

Latest input commands supplied to the game VM for each client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L260)

<a id="field-field-mq3-engine-local-qvm-match-context-userinfos-userinfos-src-mq3-engine-local-qvm-match-ml-1673429126"></a>
### userinfos

```ml
userinfos
```

Per-client user-information strings exposed through VM traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L258)
