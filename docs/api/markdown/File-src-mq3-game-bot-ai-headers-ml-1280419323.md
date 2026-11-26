# `src/mq3/game/bot_ai_headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_ai_headers`](Package-mq3-game-bot-ai-headers-449198983.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-game-bot-ai-headers-activategoalfieldnames-function-activategoalfieldnames-src-mq3-game-bot-ai-headers-ml-1072566398"></a>
### activateGoalFieldNames

```ml
function activateGoalFieldNames()
```

Return a new array `["inuse","goal","time","start_time","justused_time","shoot","weapon","target","origin","areas","numareas","areasdisabled","next"]` for `activateGoalFieldNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L126)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-aimatenemy-const-bfl-aimatenemy-8-src-mq3-game-bot-ai-headers-ml-714345961"></a>
### BFL_AIMATENEMY

```ml
const BFL_AIMATENEMY = 8
```

Bot-state flag marking aimatenemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L27)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-attacked-const-bfl-attacked-2-src-mq3-game-bot-ai-headers-ml-110856461"></a>
### BFL_ATTACKED

```ml
const BFL_ATTACKED = 2
```

Bot-state flag marking attacked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L23)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-attackjumped-const-bfl-attackjumped-4-src-mq3-game-bot-ai-headers-ml-1468816991"></a>
### BFL_ATTACKJUMPED

```ml
const BFL_ATTACKJUMPED = 4
```

Bot-state flag marking attackjumped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L25)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-avoidright-const-bfl-avoidright-16-src-mq3-game-bot-ai-headers-ml-716786164"></a>
### BFL_AVOIDRIGHT

```ml
const BFL_AVOIDRIGHT = 16
```

Bot-state flag marking avoidright.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L29)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-fightsuicidal-const-bfl-fightsuicidal-64-src-mq3-game-bot-ai-headers-ml-197252021"></a>
### BFL_FIGHTSUICIDAL

```ml
const BFL_FIGHTSUICIDAL = 64
```

Bot-state flag marking fightsuicidal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L33)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-idealviewset-const-bfl-idealviewset-32-src-mq3-game-bot-ai-headers-ml-1663650444"></a>
### BFL_IDEALVIEWSET

```ml
const BFL_IDEALVIEWSET = 32
```

Bot-state flag marking idealviewset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L31)

<a id="constant-constant-mq3-game-bot-ai-headers-bfl-straferight-const-bfl-straferight-1-src-mq3-game-bot-ai-headers-ml-1030987568"></a>
### BFL_STRAFERIGHT

```ml
const BFL_STRAFERIGHT = 1
```

Bot-state flag marking straferight.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L21)

<a id="function-function-mq3-game-bot-ai-headers-botstatefieldnames-function-botstatefieldnames-src-mq3-game-bot-ai-headers-ml-1865487398"></a>
### botStateFieldNames

```ml
function botStateFieldNames()
```

Return the ordered bot state field names table for bot ai headers: 145 entries beginning with `"inuse"` and `"botthink_residual"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L128)

<a id="function-function-mq3-game-bot-ai-headers-constantnames-function-constantnames-src-mq3-game-bot-ai-headers-ml-29591718"></a>
### constantNames

```ml
function constantNames()
```

Return the ordered constant names table for bot ai headers: 55 entries beginning with `"MAX_NODESWITCHES"` and `"CTF_FLAG_NONE"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L118)

<a id="function-function-mq3-game-bot-ai-headers-constantvalues-function-constantvalues-src-mq3-game-bot-ai-headers-ml-1497668422"></a>
### constantValues

```ml
function constantValues()
```

Return the ordered constant values table for bot ai headers: 55 entries beginning with `MAX_NODESWITCHES` and `CTF_FLAG_NONE`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L120)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-flag-blue-const-ctf-flag-blue-2-src-mq3-game-bot-ai-headers-ml-1581709955"></a>
### CTF_FLAG_BLUE

```ml
const CTF_FLAG_BLUE = 2
```

Capture-the-flag scoring or timing parameter for flag blue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L13)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-flag-none-const-ctf-flag-none-0-src-mq3-game-bot-ai-headers-ml-1221615693"></a>
### CTF_FLAG_NONE

```ml
const CTF_FLAG_NONE = 0
```

Capture-the-flag scoring or timing parameter for flag none.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L9)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-flag-red-const-ctf-flag-red-1-src-mq3-game-bot-ai-headers-ml-1339436114"></a>
### CTF_FLAG_RED

```ml
const CTF_FLAG_RED = 1
```

Capture-the-flag scoring or timing parameter for flag red.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L11)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-getflag-time-const-ctf-getflag-time-600-src-mq3-game-bot-ai-headers-ml-558832725"></a>
### CTF_GETFLAG_TIME

```ml
const CTF_GETFLAG_TIME = 600
```

Capture-the-flag scoring or timing parameter for capture the flag time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L85)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-returnflag-time-const-ctf-returnflag-time-180-src-mq3-game-bot-ai-headers-ml-219432308"></a>
### CTF_RETURNFLAG_TIME

```ml
const CTF_RETURNFLAG_TIME = 180
```

Capture-the-flag scoring or timing parameter for return the flag time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L89)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-roam-time-const-ctf-roam-time-60-src-mq3-game-bot-ai-headers-ml-747116489"></a>
### CTF_ROAM_TIME

```ml
const CTF_ROAM_TIME = 60
```

Capture-the-flag scoring or timing parameter for roam time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L91)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-rushbase-time-const-ctf-rushbase-time-120-src-mq3-game-bot-ai-headers-ml-244510114"></a>
### CTF_RUSHBASE_TIME

```ml
const CTF_RUSHBASE_TIME = 120
```

Capture-the-flag scoring or timing parameter for rush the base time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L87)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-skin-blueteam-const-ctf-skin-blueteam-blue-src-mq3-game-bot-ai-headers-ml-938581959"></a>
### CTF_SKIN_BLUETEAM

```ml
const CTF_SKIN_BLUETEAM = "blue"
```

Capture-the-flag scoring or timing parameter for skin blueteam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L17)

<a id="constant-constant-mq3-game-bot-ai-headers-ctf-skin-redteam-const-ctf-skin-redteam-red-src-mq3-game-bot-ai-headers-ml-1818362284"></a>
### CTF_SKIN_REDTEAM

```ml
const CTF_SKIN_REDTEAM = "red"
```

Capture-the-flag scoring or timing parameter for skin redteam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L15)

<a id="constant-constant-mq3-game-bot-ai-headers-ctfs-agressive-const-ctfs-agressive-1-src-mq3-game-bot-ai-headers-ml-356431654"></a>
### CTFS_AGRESSIVE

```ml
const CTFS_AGRESSIVE = 1
```

Capture-the-flag strategy identifier selecting agressive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L103)

<a id="function-function-mq3-game-bot-ai-headers-declarationnames-function-declarationnames-src-mq3-game-bot-ai-headers-ml-569060186"></a>
### declarationNames

```ml
function declarationNames()
```

Return the ordered declaration names table for bot ai headers: 135 entries beginning with `"BotChat_EnterGame"` and `"BotChat_ExitGame"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L130)

<a id="function-function-mq3-game-bot-ai-headers-globalnames-function-globalnames-src-mq3-game-bot-ai-headers-ml-16459456"></a>
### globalNames

```ml
function globalNames()
```

Return the ordered global names table for bot ai headers: 16 entries beginning with `"notleader"` and `"gametype"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L132)

<a id="function-function-mq3-game-bot-ai-headers-headercounts-function-headercounts-src-mq3-game-bot-ai-headers-ml-830346282"></a>
### headerCounts

```ml
function headerCounts()
```

Return a new array `[55,3,135,16,163]` for `headerCounts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L146)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-bot-ai-headers-ml-1090688939"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```

Long-term bot goal identifier selecting attackenemybase behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L59)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-camp-const-ltg-camp-7-src-mq3-game-bot-ai-headers-ml-300144890"></a>
### LTG_CAMP

```ml
const LTG_CAMP = 7
```

Long-term bot goal identifier selecting camp behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L47)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-camporder-const-ltg-camporder-8-src-mq3-game-bot-ai-headers-ml-1061321973"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = 8
```

Long-term bot goal identifier selecting follow a camp order behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L49)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-ai-headers-ml-220519742"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```

Long-term bot goal identifier selecting defend a key area behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L39)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-ai-headers-ml-229840669"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```

Long-term bot goal identifier selecting capture the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L41)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-getitem-const-ltg-getitem-10-src-mq3-game-bot-ai-headers-ml-777219284"></a>
### LTG_GETITEM

```ml
const LTG_GETITEM = 10
```

Long-term bot goal identifier selecting getitem behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L53)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-harvest-const-ltg-harvest-12-src-mq3-game-bot-ai-headers-ml-1227849458"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```

Long-term bot goal identifier selecting harvest behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L57)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-kill-const-ltg-kill-11-src-mq3-game-bot-ai-headers-ml-870932855"></a>
### LTG_KILL

```ml
const LTG_KILL = 11
```

Long-term bot goal identifier selecting kill behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L55)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-makelove-ontop-const-ltg-makelove-ontop-15-src-mq3-game-bot-ai-headers-ml-1882318281"></a>
### LTG_MAKELOVE_ONTOP

```ml
const LTG_MAKELOVE_ONTOP = 15
```

Long-term bot goal identifier selecting makelove ontop behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L63)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-makelove-under-const-ltg-makelove-under-14-src-mq3-game-bot-ai-headers-ml-1756875164"></a>
### LTG_MAKELOVE_UNDER

```ml
const LTG_MAKELOVE_UNDER = 14
```

Long-term bot goal identifier selecting makelove under behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L61)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-patrol-const-ltg-patrol-9-src-mq3-game-bot-ai-headers-ml-1699630094"></a>
### LTG_PATROL

```ml
const LTG_PATROL = 9
```

Long-term bot goal identifier selecting patrol behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L51)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-bot-ai-headers-ml-1755450949"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```

Long-term bot goal identifier selecting return the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L45)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-rushbase-const-ltg-rushbase-5-src-mq3-game-bot-ai-headers-ml-504447052"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = 5
```

Long-term bot goal identifier selecting rush the base behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L43)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-teamaccompany-const-ltg-teamaccompany-2-src-mq3-game-bot-ai-headers-ml-434944871"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = 2
```

Long-term bot goal identifier selecting teamaccompany behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L37)

<a id="constant-constant-mq3-game-bot-ai-headers-ltg-teamhelp-const-ltg-teamhelp-1-src-mq3-game-bot-ai-headers-ml-1693057554"></a>
### LTG_TEAMHELP

```ml
const LTG_TEAMHELP = 1
```

Long-term bot goal identifier selecting teamhelp behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L35)

<a id="constant-constant-mq3-game-bot-ai-headers-max-activateareas-const-max-activateareas-32-src-mq3-game-bot-ai-headers-ml-1038970496"></a>
### MAX_ACTIVATEAREAS

```ml
const MAX_ACTIVATEAREAS = 32
```

Upper bound on activateareas represented by mq3.game.bot_ai_headers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L115)

<a id="constant-constant-mq3-game-bot-ai-headers-max-activatestack-const-max-activatestack-8-src-mq3-game-bot-ai-headers-ml-111944689"></a>
### MAX_ACTIVATESTACK

```ml
const MAX_ACTIVATESTACK = 8
```

Upper bound on activatestack represented by mq3.game.bot_ai_headers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L113)

<a id="constant-constant-mq3-game-bot-ai-headers-max-items-const-max-items-256-src-mq3-game-bot-ai-headers-ml-1982686918"></a>
### MAX_ITEMS

```ml
const MAX_ITEMS = 256
```

Maximum number of item definitions indexed by the game and client game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L19)

<a id="constant-constant-mq3-game-bot-ai-headers-max-nodeswitches-const-max-nodeswitches-50-src-mq3-game-bot-ai-headers-ml-1646708440"></a>
### MAX_NODESWITCHES

```ml
const MAX_NODESWITCHES = 50
```

Upper bound on nodeswitches represented by mq3.game.bot_ai_headers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L7)

<a id="constant-constant-mq3-game-bot-ai-headers-max-proxmines-const-max-proxmines-64-src-mq3-game-bot-ai-headers-ml-1260574497"></a>
### MAX_PROXMINES

```ml
const MAX_PROXMINES = 64
```

Upper bound on proxmines represented by mq3.game.bot_ai_headers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L111)

<a id="function-function-mq3-game-bot-ai-headers-nextpatroldirection-function-nextpatroldirection-flags-src-mq3-game-bot-ai-headers-ml-1014157463"></a>
### nextPatrolDirection

```ml
function nextPatrolDirection(flags)
```

Choose reverse or looping patrol traversal from the patrol flag mask.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Value used by `nextPatrolDirection` in `if (flags&PATROL_REVERSE)!=0 then return PATROL_BACK end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L144)

<a id="constant-constant-mq3-game-bot-ai-headers-patrol-back-const-patrol-back-4-src-mq3-game-bot-ai-headers-ml-142150257"></a>
### PATROL_BACK

```ml
const PATROL_BACK = 4
```

Patrol behavior flag enabling back.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L97)

<a id="constant-constant-mq3-game-bot-ai-headers-patrol-loop-const-patrol-loop-1-src-mq3-game-bot-ai-headers-ml-1692712396"></a>
### PATROL_LOOP

```ml
const PATROL_LOOP = 1
```

Patrol behavior flag enabling loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L93)

<a id="constant-constant-mq3-game-bot-ai-headers-patrol-reverse-const-patrol-reverse-2-src-mq3-game-bot-ai-headers-ml-74628223"></a>
### PATROL_REVERSE

```ml
const PATROL_REVERSE = 2
```

Patrol behavior flag enabling reverse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L95)

<a id="constant-constant-mq3-game-bot-ai-headers-presence-crouch-const-presence-crouch-4-src-mq3-game-bot-ai-headers-ml-1791457997"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = 4
```

AAS presence-mask value selecting the crouch collision shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L109)

<a id="constant-constant-mq3-game-bot-ai-headers-presence-none-const-presence-none-1-src-mq3-game-bot-ai-headers-ml-1957290708"></a>
### PRESENCE_NONE

```ml
const PRESENCE_NONE = 1
```

AAS presence-mask value selecting the none collision shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L105)

<a id="constant-constant-mq3-game-bot-ai-headers-presence-normal-const-presence-normal-2-src-mq3-game-bot-ai-headers-ml-1744126967"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```

AAS presence-mask value selecting the normal collision shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L107)

<a id="constant-constant-mq3-game-bot-ai-headers-team-accompany-time-const-team-accompany-time-600-src-mq3-game-bot-ai-headers-ml-1319563811"></a>
### TEAM_ACCOMPANY_TIME

```ml
const TEAM_ACCOMPANY_TIME = 600
```

Duration in seconds allowed for the bot team task to accompany.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L67)

<a id="constant-constant-mq3-game-bot-ai-headers-team-attackenemybase-time-const-team-attackenemybase-time-600-src-mq3-game-bot-ai-headers-ml-774729283"></a>
### TEAM_ATTACKENEMYBASE_TIME

```ml
const TEAM_ATTACKENEMYBASE_TIME = 600
```

Duration in seconds allowed for the bot team task to attackenemybase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L81)

<a id="constant-constant-mq3-game-bot-ai-headers-team-camp-time-const-team-camp-time-600-src-mq3-game-bot-ai-headers-ml-1826434715"></a>
### TEAM_CAMP_TIME

```ml
const TEAM_CAMP_TIME = 600
```

Duration in seconds allowed for the bot team task to camp.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L71)

<a id="constant-constant-mq3-game-bot-ai-headers-team-defendkeyarea-time-const-team-defendkeyarea-time-600-src-mq3-game-bot-ai-headers-ml-1051336855"></a>
### TEAM_DEFENDKEYAREA_TIME

```ml
const TEAM_DEFENDKEYAREA_TIME = 600
```

Duration in seconds allowed for the bot team task to defend a key area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L69)

<a id="constant-constant-mq3-game-bot-ai-headers-team-getitem-time-const-team-getitem-time-60-src-mq3-game-bot-ai-headers-ml-504494733"></a>
### TEAM_GETITEM_TIME

```ml
const TEAM_GETITEM_TIME = 60
```

Duration in seconds allowed for the bot team task to getitem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L77)

<a id="constant-constant-mq3-game-bot-ai-headers-team-harvest-time-const-team-harvest-time-120-src-mq3-game-bot-ai-headers-ml-1550298386"></a>
### TEAM_HARVEST_TIME

```ml
const TEAM_HARVEST_TIME = 120
```

Duration in seconds allowed for the bot team task to harvest.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L83)

<a id="constant-constant-mq3-game-bot-ai-headers-team-help-time-const-team-help-time-60-src-mq3-game-bot-ai-headers-ml-1584258209"></a>
### TEAM_HELP_TIME

```ml
const TEAM_HELP_TIME = 60
```

Duration in seconds allowed for the bot team task to help.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L65)

<a id="constant-constant-mq3-game-bot-ai-headers-team-kill-someone-const-team-kill-someone-180-src-mq3-game-bot-ai-headers-ml-1373475564"></a>
### TEAM_KILL_SOMEONE

```ml
const TEAM_KILL_SOMEONE = 180
```

Lifetime in seconds of a bot order to kill a designated enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L79)

<a id="constant-constant-mq3-game-bot-ai-headers-team-lead-time-const-team-lead-time-600-src-mq3-game-bot-ai-headers-ml-1106106325"></a>
### TEAM_LEAD_TIME

```ml
const TEAM_LEAD_TIME = 600
```

Duration in seconds allowed for the bot team task to lead.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L75)

<a id="constant-constant-mq3-game-bot-ai-headers-team-patrol-time-const-team-patrol-time-600-src-mq3-game-bot-ai-headers-ml-2027633577"></a>
### TEAM_PATROL_TIME

```ml
const TEAM_PATROL_TIME = 600
```

Duration in seconds allowed for the bot team task to patrol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L73)

<a id="constant-constant-mq3-game-bot-ai-headers-teamtp-attacker-const-teamtp-attacker-2-src-mq3-game-bot-ai-headers-ml-159171807"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = 2
```

Bot team-task preference bit indicating a preference for attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L101)

<a id="constant-constant-mq3-game-bot-ai-headers-teamtp-defender-const-teamtp-defender-1-src-mq3-game-bot-ai-headers-ml-337035828"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = 1
```

Bot team-task preference bit indicating a preference for defender.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L99)

<a id="function-function-mq3-game-bot-ai-headers-typenames-function-typenames-src-mq3-game-bot-ai-headers-ml-1960059566"></a>
### typeNames

```ml
function typeNames()
```

Return a new array `["bot_waypoint_t","bot_activategoal_t","bot_state_t"]` for `typeNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L122)

<a id="function-function-mq3-game-bot-ai-headers-validlongtermgoal-function-validlongtermgoal-value-src-mq3-game-bot-ai-headers-ml-195651919"></a>
### validLongTermGoal

```ml
function validLongTermGoal(value)
```

Test `value>=LTG_TEAMHELP and value<=LTG_MAKELOVE_ONTOP` as the condition for `validLongTermGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value>=LTG_TEAMHELP and value<=LTG_MAKELOVE_ONTOP`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L141)

<a id="function-function-mq3-game-bot-ai-headers-validpresence-function-validpresence-value-src-mq3-game-bot-ai-headers-ml-1517209415"></a>
### validPresence

```ml
function validPresence(value)
```

Test `value==PRESENCE_NONE or value==PRESENCE_NORMAL or value==PRESENCE_CROUCH` as the condition for `validPresence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value==PRESENCE_NONE or value==PRESENCE_NORMAL or value==PRESENCE_CROUCH`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L135)

<a id="function-function-mq3-game-bot-ai-headers-validteamtaskpreference-function-validteamtaskpreference-value-src-mq3-game-bot-ai-headers-ml-837319715"></a>
### validTeamTaskPreference

```ml
function validTeamTaskPreference(value)
```

Test `value==TEAMTP_DEFENDER or value==TEAMTP_ATTACKER` as the condition for `validTeamTaskPreference`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value==TEAMTP_DEFENDER or value==TEAMTP_ATTACKER`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L138)

<a id="function-function-mq3-game-bot-ai-headers-waypointfieldnames-function-waypointfieldnames-src-mq3-game-bot-ai-headers-ml-897021922"></a>
### waypointFieldNames

```ml
function waypointFieldNames()
```

Return a new array `["inuse","name","goal","next","prev"]` for `waypointFieldNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_headers.ml#L124)
