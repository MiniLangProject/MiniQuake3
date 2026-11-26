# `src/mq3/botlib/public_headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.public_headers`](Package-mq3-botlib-public-headers-1916277508.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-botlib-public-headers-aas-altroutegoal-tfields-function-aas-altroutegoal-tfields-src-mq3-botlib-public-headers-ml-1424312868"></a>
### aas_altroutegoal_tFields

```ml
function aas_altroutegoal_tFields()
```

Return a new array `["origin","areanum","starttraveltime","goaltraveltime","extratraveltime"]` for `aas_altroutegoal_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L184)

<a id="function-function-mq3-botlib-public-headers-aas-areainfo-tfields-function-aas-areainfo-tfields-src-mq3-botlib-public-headers-ml-880371468"></a>
### aas_areainfo_tFields

```ml
function aas_areainfo_tFields()
```

Return a new array `["contents","flags","presencetype","cluster","mins","maxs","center"]` for `aas_areainfo_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L180)

<a id="function-function-mq3-botlib-public-headers-aas-clientmove-tfields-function-aas-clientmove-tfields-src-mq3-botlib-public-headers-ml-699581376"></a>
### aas_clientmove_tFields

```ml
function aas_clientmove_tFields()
```

Return a new array `["endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames"]` for `aas_clientmove_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L182)

<a id="function-function-mq3-botlib-public-headers-aas-entityinfo-tfields-function-aas-entityinfo-tfields-src-mq3-botlib-public-headers-ml-337602512"></a>
### aas_entityinfo_tFields

```ml
function aas_entityinfo_tFields()
```

Return the ordered aas entityinfo t fields table for public headers: 23 entries beginning with `"valid"` and `"type"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L178)

<a id="function-function-mq3-botlib-public-headers-aas-export-tfields-function-aas-export-tfields-src-mq3-botlib-public-headers-ml-220075792"></a>
### aas_export_tFields

```ml
function aas_export_tFields()
```

Return the ordered aas export t fields table for public headers: 22 entries beginning with `"AAS_EntityInfo"` and `"AAS_Initialized"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L216)

<a id="function-function-mq3-botlib-public-headers-aas-predictroute-tfields-function-aas-predictroute-tfields-src-mq3-botlib-public-headers-ml-35507672"></a>
### aas_predictroute_tFields

```ml
function aas_predictroute_tFields()
```

Return a new array `["endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time"]` for `aas_predictroute_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L186)

<a id="function-function-mq3-botlib-public-headers-aas-trace-tfields-function-aas-trace-tfields-src-mq3-botlib-public-headers-ml-143144814"></a>
### aas_trace_tFields

```ml
function aas_trace_tFields()
```

Return a new array `["startsolid","fraction","endpos","ent","lastarea","area","planenum"]` for `aas_trace_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L176)

<a id="function-function-mq3-botlib-public-headers-abisizes-function-abisizes-src-mq3-botlib-public-headers-ml-1815989364"></a>
### abiSizes

```ml
function abiSizes()
```

Return a new array `[4,36,140,52,84,24,36,276,8,328,56,68,52,20,208,552,40,24,84,112,88,88,96,300,536]` for `abiSizes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L238)

<a id="constant-constant-mq3-botlib-public-headers-action-affirmative-const-action-affirmative-1048576-src-mq3-botlib-public-headers-ml-1866143986"></a>
### ACTION_AFFIRMATIVE

```ml
const ACTION_AFFIRMATIVE = 1048576
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L156)

<a id="constant-constant-mq3-botlib-public-headers-action-attack-const-action-attack-1-src-mq3-botlib-public-headers-ml-1239915868"></a>
### ACTION_ATTACK

```ml
const ACTION_ATTACK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L141)

<a id="constant-constant-mq3-botlib-public-headers-action-crouch-const-action-crouch-128-src-mq3-botlib-public-headers-ml-717222514"></a>
### ACTION_CROUCH

```ml
const ACTION_CROUCH = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L146)

<a id="constant-constant-mq3-botlib-public-headers-action-delayedjump-const-action-delayedjump-32768-src-mq3-botlib-public-headers-ml-641148261"></a>
### ACTION_DELAYEDJUMP

```ml
const ACTION_DELAYEDJUMP = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L152)

<a id="constant-constant-mq3-botlib-public-headers-action-followme-const-action-followme-134217728-src-mq3-botlib-public-headers-ml-1044641778"></a>
### ACTION_FOLLOWME

```ml
const ACTION_FOLLOWME = 134217728
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L161)

<a id="constant-constant-mq3-botlib-public-headers-action-gesture-const-action-gesture-131072-src-mq3-botlib-public-headers-ml-2007184371"></a>
### ACTION_GESTURE

```ml
const ACTION_GESTURE = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L154)

<a id="constant-constant-mq3-botlib-public-headers-action-getflag-const-action-getflag-8388608-src-mq3-botlib-public-headers-ml-912158086"></a>
### ACTION_GETFLAG

```ml
const ACTION_GETFLAG = 8388608
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L158)

<a id="constant-constant-mq3-botlib-public-headers-action-guardbase-const-action-guardbase-16777216-src-mq3-botlib-public-headers-ml-433352100"></a>
### ACTION_GUARDBASE

```ml
const ACTION_GUARDBASE = 16777216
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L159)

<a id="constant-constant-mq3-botlib-public-headers-action-jump-const-action-jump-16-src-mq3-botlib-public-headers-ml-1175015988"></a>
### ACTION_JUMP

```ml
const ACTION_JUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L144)

<a id="constant-constant-mq3-botlib-public-headers-action-moveback-const-action-moveback-2048-src-mq3-botlib-public-headers-ml-255937247"></a>
### ACTION_MOVEBACK

```ml
const ACTION_MOVEBACK = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L149)

<a id="constant-constant-mq3-botlib-public-headers-action-movedown-const-action-movedown-256-src-mq3-botlib-public-headers-ml-1759061858"></a>
### ACTION_MOVEDOWN

```ml
const ACTION_MOVEDOWN = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L147)

<a id="constant-constant-mq3-botlib-public-headers-action-moveforward-const-action-moveforward-512-src-mq3-botlib-public-headers-ml-1050615857"></a>
### ACTION_MOVEFORWARD

```ml
const ACTION_MOVEFORWARD = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L148)

<a id="constant-constant-mq3-botlib-public-headers-action-moveleft-const-action-moveleft-4096-src-mq3-botlib-public-headers-ml-871546120"></a>
### ACTION_MOVELEFT

```ml
const ACTION_MOVELEFT = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L150)

<a id="constant-constant-mq3-botlib-public-headers-action-moveright-const-action-moveright-8192-src-mq3-botlib-public-headers-ml-2055700783"></a>
### ACTION_MOVERIGHT

```ml
const ACTION_MOVERIGHT = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L151)

<a id="constant-constant-mq3-botlib-public-headers-action-moveup-const-action-moveup-32-src-mq3-botlib-public-headers-ml-1386919850"></a>
### ACTION_MOVEUP

```ml
const ACTION_MOVEUP = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L145)

<a id="constant-constant-mq3-botlib-public-headers-action-negative-const-action-negative-2097152-src-mq3-botlib-public-headers-ml-1839380347"></a>
### ACTION_NEGATIVE

```ml
const ACTION_NEGATIVE = 2097152
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L157)

<a id="constant-constant-mq3-botlib-public-headers-action-patrol-const-action-patrol-33554432-src-mq3-botlib-public-headers-ml-217082862"></a>
### ACTION_PATROL

```ml
const ACTION_PATROL = 33554432
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L160)

<a id="constant-constant-mq3-botlib-public-headers-action-respawn-const-action-respawn-8-src-mq3-botlib-public-headers-ml-737157641"></a>
### ACTION_RESPAWN

```ml
const ACTION_RESPAWN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L143)

<a id="constant-constant-mq3-botlib-public-headers-action-talk-const-action-talk-65536-src-mq3-botlib-public-headers-ml-1418384278"></a>
### ACTION_TALK

```ml
const ACTION_TALK = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L153)

<a id="constant-constant-mq3-botlib-public-headers-action-use-const-action-use-2-src-mq3-botlib-public-headers-ml-99046973"></a>
### ACTION_USE

```ml
const ACTION_USE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L142)

<a id="constant-constant-mq3-botlib-public-headers-action-walk-const-action-walk-524288-src-mq3-botlib-public-headers-ml-571566302"></a>
### ACTION_WALK

```ml
const ACTION_WALK = 524288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L155)

<a id="function-function-mq3-botlib-public-headers-ai-export-tfields-function-ai-export-tfields-src-mq3-botlib-public-headers-ml-692618738"></a>
### ai_export_tFields

```ml
function ai_export_tFields()
```

Return the ordered ai export t fields table for public headers: 75 entries beginning with `"BotLoadCharacter"` and `"BotFreeCharacter"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L220)

<a id="constant-constant-mq3-botlib-public-headers-altroutegoal-all-const-altroutegoal-all-1-src-mq3-botlib-public-headers-ml-2081789204"></a>
### ALTROUTEGOAL_ALL

```ml
const ALTROUTEGOAL_ALL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L50)

<a id="constant-constant-mq3-botlib-public-headers-altroutegoal-clusterportals-const-altroutegoal-clusterportals-2-src-mq3-botlib-public-headers-ml-1279268463"></a>
### ALTROUTEGOAL_CLUSTERPORTALS

```ml
const ALTROUTEGOAL_CLUSTERPORTALS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L51)

<a id="constant-constant-mq3-botlib-public-headers-altroutegoal-viewportals-const-altroutegoal-viewportals-4-src-mq3-botlib-public-headers-ml-39589111"></a>
### ALTROUTEGOAL_VIEWPORTALS

```ml
const ALTROUTEGOAL_VIEWPORTALS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L52)

<a id="constant-constant-mq3-botlib-public-headers-avoid-always-const-avoid-always-1-src-mq3-botlib-public-headers-ml-718994788"></a>
### AVOID_ALWAYS

```ml
const AVOID_ALWAYS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L101)

<a id="constant-constant-mq3-botlib-public-headers-avoid-clear-const-avoid-clear-0-src-mq3-botlib-public-headers-ml-1884291013"></a>
### AVOID_CLEAR

```ml
const AVOID_CLEAR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L100)

<a id="constant-constant-mq3-botlib-public-headers-avoid-dontblock-const-avoid-dontblock-2-src-mq3-botlib-public-headers-ml-557458531"></a>
### AVOID_DONTBLOCK

```ml
const AVOID_DONTBLOCK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L102)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotloadichat-const-blerr-cannotloadichat-8-src-mq3-botlib-public-headers-ml-1973642405"></a>
### BLERR_CANNOTLOADICHAT

```ml
const BLERR_CANNOTLOADICHAT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L136)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotloaditemconfig-const-blerr-cannotloaditemconfig-10-src-mq3-botlib-public-headers-ml-1015884880"></a>
### BLERR_CANNOTLOADITEMCONFIG

```ml
const BLERR_CANNOTLOADITEMCONFIG = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L138)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotloaditemweights-const-blerr-cannotloaditemweights-9-src-mq3-botlib-public-headers-ml-1475773188"></a>
### BLERR_CANNOTLOADITEMWEIGHTS

```ml
const BLERR_CANNOTLOADITEMWEIGHTS = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L137)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotloadweaponconfig-const-blerr-cannotloadweaponconfig-12-src-mq3-botlib-public-headers-ml-1268906676"></a>
### BLERR_CANNOTLOADWEAPONCONFIG

```ml
const BLERR_CANNOTLOADWEAPONCONFIG = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L140)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotloadweaponweights-const-blerr-cannotloadweaponweights-11-src-mq3-botlib-public-headers-ml-381573235"></a>
### BLERR_CANNOTLOADWEAPONWEIGHTS

```ml
const BLERR_CANNOTLOADWEAPONWEIGHTS = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L139)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotopenaasfile-const-blerr-cannotopenaasfile-4-src-mq3-botlib-public-headers-ml-1793751681"></a>
### BLERR_CANNOTOPENAASFILE

```ml
const BLERR_CANNOTOPENAASFILE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L132)

<a id="constant-constant-mq3-botlib-public-headers-blerr-cannotreadaaslump-const-blerr-cannotreadaaslump-7-src-mq3-botlib-public-headers-ml-251005026"></a>
### BLERR_CANNOTREADAASLUMP

```ml
const BLERR_CANNOTREADAASLUMP = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L135)

<a id="constant-constant-mq3-botlib-public-headers-blerr-invalidentitynumber-const-blerr-invalidentitynumber-2-src-mq3-botlib-public-headers-ml-357346583"></a>
### BLERR_INVALIDENTITYNUMBER

```ml
const BLERR_INVALIDENTITYNUMBER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L130)

<a id="constant-constant-mq3-botlib-public-headers-blerr-librarynotsetup-const-blerr-librarynotsetup-1-src-mq3-botlib-public-headers-ml-1551893228"></a>
### BLERR_LIBRARYNOTSETUP

```ml
const BLERR_LIBRARYNOTSETUP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L129)

<a id="constant-constant-mq3-botlib-public-headers-blerr-noaasfile-const-blerr-noaasfile-3-src-mq3-botlib-public-headers-ml-485782802"></a>
### BLERR_NOAASFILE

```ml
const BLERR_NOAASFILE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L131)

<a id="constant-constant-mq3-botlib-public-headers-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-public-headers-ml-1787734673"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L128)

<a id="constant-constant-mq3-botlib-public-headers-blerr-wrongaasfileid-const-blerr-wrongaasfileid-5-src-mq3-botlib-public-headers-ml-906281200"></a>
### BLERR_WRONGAASFILEID

```ml
const BLERR_WRONGAASFILEID = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L133)

<a id="constant-constant-mq3-botlib-public-headers-blerr-wrongaasfileversion-const-blerr-wrongaasfileversion-6-src-mq3-botlib-public-headers-ml-356380211"></a>
### BLERR_WRONGAASFILEVERSION

```ml
const BLERR_WRONGAASFILEVERSION = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L134)

<a id="function-function-mq3-botlib-public-headers-bot-avoidspot-tfields-function-bot-avoidspot-tfields-src-mq3-botlib-public-headers-ml-1207869358"></a>
### bot_avoidspot_tFields

```ml
function bot_avoidspot_tFields()
```

Return a new array `["origin","radius","type"]` for `bot_avoidspot_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L200)

<a id="function-function-mq3-botlib-public-headers-bot-consolemessage-tfields-function-bot-consolemessage-tfields-src-mq3-botlib-public-headers-ml-332567996"></a>
### bot_consolemessage_tFields

```ml
function bot_consolemessage_tFields()
```

Return a new array `["handle","time","type","message","prev","next"]` for `bot_consolemessage_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L188)

<a id="function-function-mq3-botlib-public-headers-bot-entitystate-tfields-function-bot-entitystate-tfields-src-mq3-botlib-public-headers-ml-1853256480"></a>
### bot_entitystate_tFields

```ml
function bot_entitystate_tFields()
```

Return the ordered bot entitystate t fields table for public headers: 18 entries beginning with `"type"` and `"flags"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L212)

<a id="function-function-mq3-botlib-public-headers-bot-goal-tfields-function-bot-goal-tfields-src-mq3-botlib-public-headers-ml-778823380"></a>
### bot_goal_tFields

```ml
function bot_goal_tFields()
```

Return a new array `["origin","areanum","mins","maxs","entitynum","number","flags","iteminfo"]` for `bot_goal_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L194)

<a id="function-function-mq3-botlib-public-headers-bot-initmove-tfields-function-bot-initmove-tfields-src-mq3-botlib-public-headers-ml-548715372"></a>
### bot_initmove_tFields

```ml
function bot_initmove_tFields()
```

Return a new array `["origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags"]` for `bot_initmove_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L196)

<a id="function-function-mq3-botlib-public-headers-bot-input-tfields-function-bot-input-tfields-src-mq3-botlib-public-headers-ml-1500996804"></a>
### bot_input_tFields

```ml
function bot_input_tFields()
```

Return a new array `["thinktime","dir","speed","viewangles","actionflags","weapon"]` for `bot_input_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L206)

<a id="function-function-mq3-botlib-public-headers-bot-match-tfields-function-bot-match-tfields-src-mq3-botlib-public-headers-ml-1076879398"></a>
### bot_match_tFields

```ml
function bot_match_tFields()
```

Return a new array `["string","type","subtype","variables"]` for `bot_match_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L192)

<a id="function-function-mq3-botlib-public-headers-bot-matchvariable-tfields-function-bot-matchvariable-tfields-src-mq3-botlib-public-headers-ml-1066377158"></a>
### bot_matchvariable_tFields

```ml
function bot_matchvariable_tFields()
```

Return a new array `["offset","length"]` for `bot_matchvariable_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L190)

<a id="function-function-mq3-botlib-public-headers-bot-moveresult-tfields-function-bot-moveresult-tfields-src-mq3-botlib-public-headers-ml-598159292"></a>
### bot_moveresult_tFields

```ml
function bot_moveresult_tFields()
```

Return a new array `["failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles"]` for `bot_moveresult_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L198)

<a id="constant-constant-mq3-botlib-public-headers-botfilesbasefolder-const-botfilesbasefolder-botfiles-src-mq3-botlib-public-headers-ml-1354435581"></a>
### BOTFILESBASEFOLDER

```ml
const BOTFILESBASEFOLDER = "botfiles"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L114)

<a id="constant-constant-mq3-botlib-public-headers-botlib-api-version-const-botlib-api-version-2-src-mq3-botlib-public-headers-ml-905881725"></a>
### BOTLIB_API_VERSION

```ml
const BOTLIB_API_VERSION = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L113)

<a id="function-function-mq3-botlib-public-headers-botlib-export-tfields-function-botlib-export-tfields-src-mq3-botlib-public-headers-ml-2123197550"></a>
### botlib_export_tFields

```ml
function botlib_export_tFields()
```

Return the ordered botlib export t fields table for public headers: 16 entries beginning with `"BotLibSetup"` and `"BotLibShutdown"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L222)

<a id="function-function-mq3-botlib-public-headers-botlib-import-tfields-function-botlib-import-tfields-src-mq3-botlib-public-headers-ml-448247344"></a>
### botlib_import_tFields

```ml
function botlib_import_tFields()
```

Return the ordered botlib import t fields table for public headers: 22 entries beginning with `"Print"` and `"Trace"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L214)

<a id="function-function-mq3-botlib-public-headers-bsp-surface-tfields-function-bsp-surface-tfields-src-mq3-botlib-public-headers-ml-687778150"></a>
### bsp_surface_tFields

```ml
function bsp_surface_tFields()
```

Return a new array `["name","flags","value"]` for `bsp_surface_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L208)

<a id="function-function-mq3-botlib-public-headers-bsp-trace-tfields-function-bsp-trace-tfields-src-mq3-botlib-public-headers-ml-2091723506"></a>
### bsp_trace_tFields

```ml
function bsp_trace_tFields()
```

Return a new array `["allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent"]` for `bsp_trace_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L210)

<a id="constant-constant-mq3-botlib-public-headers-chat-all-const-chat-all-0-src-mq3-botlib-public-headers-ml-1901105999"></a>
### CHAT_ALL

```ml
const CHAT_ALL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L64)

<a id="constant-constant-mq3-botlib-public-headers-chat-genderfemale-const-chat-genderfemale-1-src-mq3-botlib-public-headers-ml-929328720"></a>
### CHAT_GENDERFEMALE

```ml
const CHAT_GENDERFEMALE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L62)

<a id="constant-constant-mq3-botlib-public-headers-chat-genderless-const-chat-genderless-0-src-mq3-botlib-public-headers-ml-1392951597"></a>
### CHAT_GENDERLESS

```ml
const CHAT_GENDERLESS = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L61)

<a id="constant-constant-mq3-botlib-public-headers-chat-gendermale-const-chat-gendermale-2-src-mq3-botlib-public-headers-ml-769097627"></a>
### CHAT_GENDERMALE

```ml
const CHAT_GENDERMALE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L63)

<a id="constant-constant-mq3-botlib-public-headers-chat-team-const-chat-team-1-src-mq3-botlib-public-headers-ml-873857436"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L65)

<a id="constant-constant-mq3-botlib-public-headers-chat-tell-const-chat-tell-2-src-mq3-botlib-public-headers-ml-444058267"></a>
### CHAT_TELL

```ml
const CHAT_TELL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L66)

<a id="constant-constant-mq3-botlib-public-headers-cms-chat-const-cms-chat-1-src-mq3-botlib-public-headers-ml-1030305326"></a>
### CMS_CHAT

```ml
const CMS_CHAT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L127)

<a id="constant-constant-mq3-botlib-public-headers-cms-normal-const-cms-normal-0-src-mq3-botlib-public-headers-ml-821070969"></a>
### CMS_NORMAL

```ml
const CMS_NORMAL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L126)

<a id="function-function-mq3-botlib-public-headers-constantnames-function-constantnames-src-mq3-botlib-public-headers-ml-72837476"></a>
### constantNames

```ml
function constantNames()
```

Return the ordered constant names table for public headers: 156 entries beginning with `"MAX_STRINGFIELD"` and `"TFL_INVALID"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L164)

<a id="function-function-mq3-botlib-public-headers-constantvalues-function-constantvalues-src-mq3-botlib-public-headers-ml-309672368"></a>
### constantValues

```ml
function constantValues()
```

Return the ordered constant values table for public headers: 156 entries beginning with `MAX_STRINGFIELD` and `TFL_INVALID`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L166)

<a id="constant-constant-mq3-botlib-public-headers-damagetype-impact-const-damagetype-impact-1-src-mq3-botlib-public-headers-ml-1772285012"></a>
### DAMAGETYPE_IMPACT

```ml
const DAMAGETYPE_IMPACT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L110)

<a id="constant-constant-mq3-botlib-public-headers-damagetype-radial-const-damagetype-radial-2-src-mq3-botlib-public-headers-ml-873574503"></a>
### DAMAGETYPE_RADIAL

```ml
const DAMAGETYPE_RADIAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L111)

<a id="constant-constant-mq3-botlib-public-headers-damagetype-visible-const-damagetype-visible-4-src-mq3-botlib-public-headers-ml-560763215"></a>
### DAMAGETYPE_VISIBLE

```ml
const DAMAGETYPE_VISIBLE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L112)

<a id="function-function-mq3-botlib-public-headers-declarationnames-function-declarationnames-src-mq3-botlib-public-headers-ml-1222229188"></a>
### declarationNames

```ml
function declarationNames()
```

Return the ordered declaration names table for public headers: 113 entries beginning with `"BotLoadCharacter"` and `"BotFreeCharacter"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L170)

<a id="function-function-mq3-botlib-public-headers-defaulttravelflags-function-defaulttravelflags-src-mq3-botlib-public-headers-ml-249028092"></a>
### defaultTravelFlags

```ml
function defaultTravelFlags()
```

Return `TFL_DEFAULT` for `defaultTravelFlags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L234)

<a id="function-function-mq3-botlib-public-headers-ea-export-tfields-function-ea-export-tfields-src-mq3-botlib-public-headers-ml-687447098"></a>
### ea_export_tFields

```ml
function ea_export_tFields()
```

Return the ordered ea export t fields table for public headers: 24 entries beginning with `"EA_Command"` and `"EA_Say"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L218)

<a id="function-function-mq3-botlib-public-headers-fieldnames-function-fieldnames-src-mq3-botlib-public-headers-ml-1143968288"></a>
### fieldNames

```ml
function fieldNames()
```

Return the ordered field names table for public headers: 333 entries beginning with `"startsolid"` and `"fraction"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L174)

<a id="constant-constant-mq3-botlib-public-headers-gfl-dropped-const-gfl-dropped-4-src-mq3-botlib-public-headers-ml-1007581005"></a>
### GFL_DROPPED

```ml
const GFL_DROPPED = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L72)

<a id="constant-constant-mq3-botlib-public-headers-gfl-item-const-gfl-item-1-src-mq3-botlib-public-headers-ml-1496768316"></a>
### GFL_ITEM

```ml
const GFL_ITEM = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L70)

<a id="constant-constant-mq3-botlib-public-headers-gfl-none-const-gfl-none-0-src-mq3-botlib-public-headers-ml-270203531"></a>
### GFL_NONE

```ml
const GFL_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L69)

<a id="constant-constant-mq3-botlib-public-headers-gfl-roam-const-gfl-roam-2-src-mq3-botlib-public-headers-ml-2111531087"></a>
### GFL_ROAM

```ml
const GFL_ROAM = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L71)

<a id="function-function-mq3-botlib-public-headers-hastravel-function-hastravel-flags-required-src-mq3-botlib-public-headers-ml-1296102394"></a>
### hasTravel

```ml
function hasTravel(flags, required)
```

Test `(flags&required)==required` as the condition for `hasTravel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Operand used to evaluate the returned expression `(flags&required)==required`. |
| `required` | `dynamic` | — | Operand used to evaluate the returned expression `(flags&required)==required`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L232)

<a id="function-function-mq3-botlib-public-headers-inventorycounts-function-inventorycounts-src-mq3-botlib-public-headers-ml-573568740"></a>
### inventoryCounts

```ml
function inventoryCounts()
```

Return a new array `[156,25,113,24,333]` for `inventoryCounts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L236)

<a id="constant-constant-mq3-botlib-public-headers-linecolor-blue-const-linecolor-blue-3-src-mq3-botlib-public-headers-ml-1893741788"></a>
### LINECOLOR_BLUE

```ml
const LINECOLOR_BLUE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L118)

<a id="constant-constant-mq3-botlib-public-headers-linecolor-green-const-linecolor-green-2-src-mq3-botlib-public-headers-ml-1106740279"></a>
### LINECOLOR_GREEN

```ml
const LINECOLOR_GREEN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L117)

<a id="constant-constant-mq3-botlib-public-headers-linecolor-none-const-linecolor-none-1-src-mq3-botlib-public-headers-ml-256830109"></a>
### LINECOLOR_NONE

```ml
const LINECOLOR_NONE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L115)

<a id="constant-constant-mq3-botlib-public-headers-linecolor-orange-const-linecolor-orange-5-src-mq3-botlib-public-headers-ml-1651895970"></a>
### LINECOLOR_ORANGE

```ml
const LINECOLOR_ORANGE = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L120)

<a id="constant-constant-mq3-botlib-public-headers-linecolor-red-const-linecolor-red-1-src-mq3-botlib-public-headers-ml-669696052"></a>
### LINECOLOR_RED

```ml
const LINECOLOR_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L116)

<a id="constant-constant-mq3-botlib-public-headers-linecolor-yellow-const-linecolor-yellow-4-src-mq3-botlib-public-headers-ml-1390421827"></a>
### LINECOLOR_YELLOW

```ml
const LINECOLOR_YELLOW = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L119)

<a id="constant-constant-mq3-botlib-public-headers-max-avoidgoals-const-max-avoidgoals-256-src-mq3-botlib-public-headers-ml-117659372"></a>
### MAX_AVOIDGOALS

```ml
const MAX_AVOIDGOALS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L67)

<a id="constant-constant-mq3-botlib-public-headers-max-avoidreach-const-max-avoidreach-1-src-mq3-botlib-public-headers-ml-671122684"></a>
### MAX_AVOIDREACH

```ml
const MAX_AVOIDREACH = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L98)

<a id="constant-constant-mq3-botlib-public-headers-max-avoidspots-const-max-avoidspots-32-src-mq3-botlib-public-headers-ml-1091909490"></a>
### MAX_AVOIDSPOTS

```ml
const MAX_AVOIDSPOTS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L99)

<a id="constant-constant-mq3-botlib-public-headers-max-chattype-name-const-max-chattype-name-32-src-mq3-botlib-public-headers-ml-1176448434"></a>
### MAX_CHATTYPE_NAME

```ml
const MAX_CHATTYPE_NAME = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L59)

<a id="constant-constant-mq3-botlib-public-headers-max-goalstack-const-max-goalstack-8-src-mq3-botlib-public-headers-ml-377364761"></a>
### MAX_GOALSTACK

```ml
const MAX_GOALSTACK = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L68)

<a id="constant-constant-mq3-botlib-public-headers-max-matchvariables-const-max-matchvariables-8-src-mq3-botlib-public-headers-ml-341548265"></a>
### MAX_MATCHVARIABLES

```ml
const MAX_MATCHVARIABLES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L60)

<a id="constant-constant-mq3-botlib-public-headers-max-message-size-const-max-message-size-256-src-mq3-botlib-public-headers-ml-105971560"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L58)

<a id="constant-constant-mq3-botlib-public-headers-max-stringfield-const-max-stringfield-80-src-mq3-botlib-public-headers-ml-564467313"></a>
### MAX_STRINGFIELD

```ml
const MAX_STRINGFIELD = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L6)

<a id="constant-constant-mq3-botlib-public-headers-mfl-activegrapple-const-mfl-activegrapple-128-src-mq3-botlib-public-headers-ml-1005252994"></a>
### MFL_ACTIVEGRAPPLE

```ml
const MFL_ACTIVEGRAPPLE = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L86)

<a id="constant-constant-mq3-botlib-public-headers-mfl-againstladder-const-mfl-againstladder-8-src-mq3-botlib-public-headers-ml-163407849"></a>
### MFL_AGAINSTLADDER

```ml
const MFL_AGAINSTLADDER = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L82)

<a id="constant-constant-mq3-botlib-public-headers-mfl-barrierjump-const-mfl-barrierjump-1-src-mq3-botlib-public-headers-ml-2077645268"></a>
### MFL_BARRIERJUMP

```ml
const MFL_BARRIERJUMP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L79)

<a id="constant-constant-mq3-botlib-public-headers-mfl-grapplepull-const-mfl-grapplepull-64-src-mq3-botlib-public-headers-ml-1456609607"></a>
### MFL_GRAPPLEPULL

```ml
const MFL_GRAPPLEPULL = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L85)

<a id="constant-constant-mq3-botlib-public-headers-mfl-grapplereset-const-mfl-grapplereset-256-src-mq3-botlib-public-headers-ml-1389552896"></a>
### MFL_GRAPPLERESET

```ml
const MFL_GRAPPLERESET = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L87)

<a id="constant-constant-mq3-botlib-public-headers-mfl-onground-const-mfl-onground-2-src-mq3-botlib-public-headers-ml-1916009961"></a>
### MFL_ONGROUND

```ml
const MFL_ONGROUND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L80)

<a id="constant-constant-mq3-botlib-public-headers-mfl-swimming-const-mfl-swimming-4-src-mq3-botlib-public-headers-ml-1893334729"></a>
### MFL_SWIMMING

```ml
const MFL_SWIMMING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L81)

<a id="constant-constant-mq3-botlib-public-headers-mfl-teleported-const-mfl-teleported-32-src-mq3-botlib-public-headers-ml-36313640"></a>
### MFL_TELEPORTED

```ml
const MFL_TELEPORTED = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L84)

<a id="constant-constant-mq3-botlib-public-headers-mfl-walk-const-mfl-walk-512-src-mq3-botlib-public-headers-ml-748200245"></a>
### MFL_WALK

```ml
const MFL_WALK = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L88)

<a id="constant-constant-mq3-botlib-public-headers-mfl-waterjump-const-mfl-waterjump-16-src-mq3-botlib-public-headers-ml-832671680"></a>
### MFL_WATERJUMP

```ml
const MFL_WATERJUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L83)

<a id="constant-constant-mq3-botlib-public-headers-move-bfgjump-const-move-bfgjump-32-src-mq3-botlib-public-headers-ml-908080122"></a>
### MOVE_BFGJUMP

```ml
const MOVE_BFGJUMP = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L78)

<a id="constant-constant-mq3-botlib-public-headers-move-crouch-const-move-crouch-2-src-mq3-botlib-public-headers-ml-341956379"></a>
### MOVE_CROUCH

```ml
const MOVE_CROUCH = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L74)

<a id="constant-constant-mq3-botlib-public-headers-move-grapple-const-move-grapple-8-src-mq3-botlib-public-headers-ml-1279986945"></a>
### MOVE_GRAPPLE

```ml
const MOVE_GRAPPLE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L76)

<a id="constant-constant-mq3-botlib-public-headers-move-jump-const-move-jump-4-src-mq3-botlib-public-headers-ml-1088136277"></a>
### MOVE_JUMP

```ml
const MOVE_JUMP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L75)

<a id="constant-constant-mq3-botlib-public-headers-move-rocketjump-const-move-rocketjump-16-src-mq3-botlib-public-headers-ml-1175090672"></a>
### MOVE_ROCKETJUMP

```ml
const MOVE_ROCKETJUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L77)

<a id="constant-constant-mq3-botlib-public-headers-move-walk-const-move-walk-1-src-mq3-botlib-public-headers-ml-170277864"></a>
### MOVE_WALK

```ml
const MOVE_WALK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L73)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-blockedbyavoidspot-const-moveresult-blockedbyavoidspot-256-src-mq3-botlib-public-headers-ml-1647472518"></a>
### MOVERESULT_BLOCKEDBYAVOIDSPOT

```ml
const MOVERESULT_BLOCKEDBYAVOIDSPOT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L97)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-movementview-const-moveresult-movementview-1-src-mq3-botlib-public-headers-ml-365115868"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L89)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-movementviewset-const-moveresult-movementviewset-8-src-mq3-botlib-public-headers-ml-567727057"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L92)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-botlib-public-headers-ml-153037744"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L93)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-ontopof-elevator-const-moveresult-ontopof-elevator-128-src-mq3-botlib-public-headers-ml-1081743618"></a>
### MOVERESULT_ONTOPOF_ELEVATOR

```ml
const MOVERESULT_ONTOPOF_ELEVATOR = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L96)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-ontopof-funcbob-const-moveresult-ontopof-funcbob-64-src-mq3-botlib-public-headers-ml-1643480621"></a>
### MOVERESULT_ONTOPOF_FUNCBOB

```ml
const MOVERESULT_ONTOPOF_FUNCBOB = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L95)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-ontopofobstacle-const-moveresult-ontopofobstacle-32-src-mq3-botlib-public-headers-ml-25855150"></a>
### MOVERESULT_ONTOPOFOBSTACLE

```ml
const MOVERESULT_ONTOPOFOBSTACLE = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L94)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-swimview-const-moveresult-swimview-2-src-mq3-botlib-public-headers-ml-1320148647"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L90)

<a id="constant-constant-mq3-botlib-public-headers-moveresult-waiting-const-moveresult-waiting-4-src-mq3-botlib-public-headers-ml-1998684591"></a>
### MOVERESULT_WAITING

```ml
const MOVERESULT_WAITING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L91)

<a id="constant-constant-mq3-botlib-public-headers-pfl-return-const-pfl-return-2-src-mq3-botlib-public-headers-ml-1517083831"></a>
### PFL_RETURN

```ml
const PFL_RETURN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L108)

<a id="constant-constant-mq3-botlib-public-headers-pfl-windowdamage-const-pfl-windowdamage-1-src-mq3-botlib-public-headers-ml-1437369954"></a>
### PFL_WINDOWDAMAGE

```ml
const PFL_WINDOWDAMAGE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L107)

<a id="function-function-mq3-botlib-public-headers-projectileinfo-tfields-function-projectileinfo-tfields-src-mq3-botlib-public-headers-ml-876279020"></a>
### projectileinfo_tFields

```ml
function projectileinfo_tFields()
```

Return a new array `["name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop"]` for `projectileinfo_tFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L202)

<a id="constant-constant-mq3-botlib-public-headers-prt-error-const-prt-error-3-src-mq3-botlib-public-headers-ml-1604777466"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L123)

<a id="constant-constant-mq3-botlib-public-headers-prt-exit-const-prt-exit-5-src-mq3-botlib-public-headers-ml-756990564"></a>
### PRT_EXIT

```ml
const PRT_EXIT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L125)

<a id="constant-constant-mq3-botlib-public-headers-prt-fatal-const-prt-fatal-4-src-mq3-botlib-public-headers-ml-1121507921"></a>
### PRT_FATAL

```ml
const PRT_FATAL = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L124)

<a id="constant-constant-mq3-botlib-public-headers-prt-message-const-prt-message-1-src-mq3-botlib-public-headers-ml-1546341504"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L121)

<a id="constant-constant-mq3-botlib-public-headers-prt-warning-const-prt-warning-2-src-mq3-botlib-public-headers-ml-1756855975"></a>
### PRT_WARNING

```ml
const PRT_WARNING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L122)

<a id="constant-constant-mq3-botlib-public-headers-resulttype-badgrapplepath-const-resulttype-badgrapplepath-4-src-mq3-botlib-public-headers-ml-618719053"></a>
### RESULTTYPE_BADGRAPPLEPATH

```ml
const RESULTTYPE_BADGRAPPLEPATH = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L105)

<a id="constant-constant-mq3-botlib-public-headers-resulttype-elevatorup-const-resulttype-elevatorup-1-src-mq3-botlib-public-headers-ml-1686204220"></a>
### RESULTTYPE_ELEVATORUP

```ml
const RESULTTYPE_ELEVATORUP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L103)

<a id="constant-constant-mq3-botlib-public-headers-resulttype-insolidarea-const-resulttype-insolidarea-8-src-mq3-botlib-public-headers-ml-1307801513"></a>
### RESULTTYPE_INSOLIDAREA

```ml
const RESULTTYPE_INSOLIDAREA = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L106)

<a id="constant-constant-mq3-botlib-public-headers-resulttype-waitforfuncbobbing-const-resulttype-waitforfuncbobbing-2-src-mq3-botlib-public-headers-ml-51659487"></a>
### RESULTTYPE_WAITFORFUNCBOBBING

```ml
const RESULTTYPE_WAITFORFUNCBOBBING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L104)

<a id="constant-constant-mq3-botlib-public-headers-rse-enterarea-const-rse-enterarea-8-src-mq3-botlib-public-headers-ml-1718738573"></a>
### RSE_ENTERAREA

```ml
const RSE_ENTERAREA = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L57)

<a id="constant-constant-mq3-botlib-public-headers-rse-entercontents-const-rse-entercontents-4-src-mq3-botlib-public-headers-ml-612995109"></a>
### RSE_ENTERCONTENTS

```ml
const RSE_ENTERCONTENTS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L56)

<a id="constant-constant-mq3-botlib-public-headers-rse-none-const-rse-none-0-src-mq3-botlib-public-headers-ml-1428205961"></a>
### RSE_NONE

```ml
const RSE_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L53)

<a id="constant-constant-mq3-botlib-public-headers-rse-noroute-const-rse-noroute-1-src-mq3-botlib-public-headers-ml-1824007100"></a>
### RSE_NOROUTE

```ml
const RSE_NOROUTE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L54)

<a id="constant-constant-mq3-botlib-public-headers-rse-usetraveltype-const-rse-usetraveltype-2-src-mq3-botlib-public-headers-ml-1600646227"></a>
### RSE_USETRAVELTYPE

```ml
const RSE_USETRAVELTYPE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L55)

<a id="constant-constant-mq3-botlib-public-headers-se-enterarea-const-se-enterarea-512-src-mq3-botlib-public-headers-ml-1538792931"></a>
### SE_ENTERAREA

```ml
const SE_ENTERAREA = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L46)

<a id="constant-constant-mq3-botlib-public-headers-se-enterlava-const-se-enterlava-16-src-mq3-botlib-public-headers-ml-1227665880"></a>
### SE_ENTERLAVA

```ml
const SE_ENTERLAVA = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L41)

<a id="constant-constant-mq3-botlib-public-headers-se-enterslime-const-se-enterslime-8-src-mq3-botlib-public-headers-ml-1358586669"></a>
### SE_ENTERSLIME

```ml
const SE_ENTERSLIME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L40)

<a id="constant-constant-mq3-botlib-public-headers-se-enterwater-const-se-enterwater-4-src-mq3-botlib-public-headers-ml-575712565"></a>
### SE_ENTERWATER

```ml
const SE_ENTERWATER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L39)

<a id="constant-constant-mq3-botlib-public-headers-se-gap-const-se-gap-64-src-mq3-botlib-public-headers-ml-2047665435"></a>
### SE_GAP

```ml
const SE_GAP = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L43)

<a id="constant-constant-mq3-botlib-public-headers-se-hitboundingbox-const-se-hitboundingbox-2048-src-mq3-botlib-public-headers-ml-575646475"></a>
### SE_HITBOUNDINGBOX

```ml
const SE_HITBOUNDINGBOX = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L48)

<a id="constant-constant-mq3-botlib-public-headers-se-hitground-const-se-hitground-1-src-mq3-botlib-public-headers-ml-1729905244"></a>
### SE_HITGROUND

```ml
const SE_HITGROUND = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L37)

<a id="constant-constant-mq3-botlib-public-headers-se-hitgroundarea-const-se-hitgroundarea-1024-src-mq3-botlib-public-headers-ml-1547140910"></a>
### SE_HITGROUNDAREA

```ml
const SE_HITGROUNDAREA = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L47)

<a id="constant-constant-mq3-botlib-public-headers-se-hitgrounddamage-const-se-hitgrounddamage-32-src-mq3-botlib-public-headers-ml-1990114568"></a>
### SE_HITGROUNDDAMAGE

```ml
const SE_HITGROUNDDAMAGE = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L42)

<a id="constant-constant-mq3-botlib-public-headers-se-leaveground-const-se-leaveground-2-src-mq3-botlib-public-headers-ml-1913900335"></a>
### SE_LEAVEGROUND

```ml
const SE_LEAVEGROUND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L38)

<a id="constant-constant-mq3-botlib-public-headers-se-none-const-se-none-0-src-mq3-botlib-public-headers-ml-683636125"></a>
### SE_NONE

```ml
const SE_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L36)

<a id="constant-constant-mq3-botlib-public-headers-se-touchclusterportal-const-se-touchclusterportal-4096-src-mq3-botlib-public-headers-ml-848375160"></a>
### SE_TOUCHCLUSTERPORTAL

```ml
const SE_TOUCHCLUSTERPORTAL = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L49)

<a id="constant-constant-mq3-botlib-public-headers-se-touchjumppad-const-se-touchjumppad-128-src-mq3-botlib-public-headers-ml-1788261042"></a>
### SE_TOUCHJUMPPAD

```ml
const SE_TOUCHJUMPPAD = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L44)

<a id="constant-constant-mq3-botlib-public-headers-se-touchteleporter-const-se-touchteleporter-256-src-mq3-botlib-public-headers-ml-333889196"></a>
### SE_TOUCHTELEPORTER

```ml
const SE_TOUCHTELEPORTER = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L45)

<a id="function-function-mq3-botlib-public-headers-structnames-function-structnames-src-mq3-botlib-public-headers-ml-1498899338"></a>
### structNames

```ml
function structNames()
```

Return the ordered struct names table for public headers: 24 entries beginning with `"aas_trace_t"` and `"aas_entityinfo_t"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L172)

<a id="constant-constant-mq3-botlib-public-headers-tfl-air-const-tfl-air-524288-src-mq3-botlib-public-headers-ml-1810281850"></a>
### TFL_AIR

```ml
const TFL_AIR = 524288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L25)

<a id="constant-constant-mq3-botlib-public-headers-tfl-barrierjump-const-tfl-barrierjump-8-src-mq3-botlib-public-headers-ml-1933012597"></a>
### TFL_BARRIERJUMP

```ml
const TFL_BARRIERJUMP = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L10)

<a id="constant-constant-mq3-botlib-public-headers-tfl-bfgjump-const-tfl-bfgjump-8192-src-mq3-botlib-public-headers-ml-528991809"></a>
### TFL_BFGJUMP

```ml
const TFL_BFGJUMP = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L19)

<a id="constant-constant-mq3-botlib-public-headers-tfl-bridge-const-tfl-bridge-67108864-src-mq3-botlib-public-headers-ml-462623027"></a>
### TFL_BRIDGE

```ml
const TFL_BRIDGE = 67108864
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L32)

<a id="constant-constant-mq3-botlib-public-headers-tfl-crouch-const-tfl-crouch-4-src-mq3-botlib-public-headers-ml-1990610197"></a>
### TFL_CROUCH

```ml
const TFL_CROUCH = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L9)

<a id="constant-constant-mq3-botlib-public-headers-tfl-default-const-tfl-default-tfl-walk-tfl-crouch-tfl-barrierjump-tfl-jump-tfl-ladder-tfl-walkoffledge-tfl-swim-tfl-waterjump-tfl-teleport-tfl-elevator-tfl-air-tfl-water-tfl-jumppad-tfl-funcbob-src-mq3-botlib-public-headers-ml-239237661"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = TFL_WALK | TFL_CROUCH | TFL_BARRIERJUMP | TFL_JUMP | TFL_LADDER | TFL_WALKOFFLEDGE | TFL_SWIM | TFL_WATERJUMP | TFL_TELEPORT | TFL_ELEVATOR | TFL_AIR | TFL_WATER | TFL_JUMPPAD | TFL_FUNCBOB
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L35)

<a id="constant-constant-mq3-botlib-public-headers-tfl-donotenter-const-tfl-donotenter-8388608-src-mq3-botlib-public-headers-ml-474136966"></a>
### TFL_DONOTENTER

```ml
const TFL_DONOTENTER = 8388608
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L29)

<a id="constant-constant-mq3-botlib-public-headers-tfl-doublejump-const-tfl-doublejump-32768-src-mq3-botlib-public-headers-ml-1621942639"></a>
### TFL_DOUBLEJUMP

```ml
const TFL_DOUBLEJUMP = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L21)

<a id="constant-constant-mq3-botlib-public-headers-tfl-elevator-const-tfl-elevator-2048-src-mq3-botlib-public-headers-ml-1641602087"></a>
### TFL_ELEVATOR

```ml
const TFL_ELEVATOR = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L17)

<a id="constant-constant-mq3-botlib-public-headers-tfl-flight-const-tfl-flight-33554432-src-mq3-botlib-public-headers-ml-203797518"></a>
### TFL_FLIGHT

```ml
const TFL_FLIGHT = 33554432
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L31)

<a id="constant-constant-mq3-botlib-public-headers-tfl-funcbob-const-tfl-funcbob-16777216-src-mq3-botlib-public-headers-ml-677967304"></a>
### TFL_FUNCBOB

```ml
const TFL_FUNCBOB = 16777216
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L30)

<a id="constant-constant-mq3-botlib-public-headers-tfl-grapplehook-const-tfl-grapplehook-16384-src-mq3-botlib-public-headers-ml-828154241"></a>
### TFL_GRAPPLEHOOK

```ml
const TFL_GRAPPLEHOOK = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L20)

<a id="constant-constant-mq3-botlib-public-headers-tfl-invalid-const-tfl-invalid-1-src-mq3-botlib-public-headers-ml-989285632"></a>
### TFL_INVALID

```ml
const TFL_INVALID = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L7)

<a id="constant-constant-mq3-botlib-public-headers-tfl-jump-const-tfl-jump-16-src-mq3-botlib-public-headers-ml-54422968"></a>
### TFL_JUMP

```ml
const TFL_JUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L11)

<a id="constant-constant-mq3-botlib-public-headers-tfl-jumppad-const-tfl-jumppad-262144-src-mq3-botlib-public-headers-ml-1962330202"></a>
### TFL_JUMPPAD

```ml
const TFL_JUMPPAD = 262144
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L24)

<a id="constant-constant-mq3-botlib-public-headers-tfl-ladder-const-tfl-ladder-32-src-mq3-botlib-public-headers-ml-909442578"></a>
### TFL_LADDER

```ml
const TFL_LADDER = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L12)

<a id="constant-constant-mq3-botlib-public-headers-tfl-lava-const-tfl-lava-4194304-src-mq3-botlib-public-headers-ml-1042342016"></a>
### TFL_LAVA

```ml
const TFL_LAVA = 4194304
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L28)

<a id="constant-constant-mq3-botlib-public-headers-tfl-notteam1-const-tfl-notteam1-134217728-src-mq3-botlib-public-headers-ml-1987495324"></a>
### TFL_NOTTEAM1

```ml
const TFL_NOTTEAM1 = 134217728
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L33)

<a id="constant-constant-mq3-botlib-public-headers-tfl-notteam2-const-tfl-notteam2-268435456-src-mq3-botlib-public-headers-ml-1744013736"></a>
### TFL_NOTTEAM2

```ml
const TFL_NOTTEAM2 = 268435456
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L34)

<a id="constant-constant-mq3-botlib-public-headers-tfl-rampjump-const-tfl-rampjump-65536-src-mq3-botlib-public-headers-ml-1254335058"></a>
### TFL_RAMPJUMP

```ml
const TFL_RAMPJUMP = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L22)

<a id="constant-constant-mq3-botlib-public-headers-tfl-rocketjump-const-tfl-rocketjump-4096-src-mq3-botlib-public-headers-ml-927609428"></a>
### TFL_ROCKETJUMP

```ml
const TFL_ROCKETJUMP = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L18)

<a id="constant-constant-mq3-botlib-public-headers-tfl-slime-const-tfl-slime-2097152-src-mq3-botlib-public-headers-ml-98163115"></a>
### TFL_SLIME

```ml
const TFL_SLIME = 2097152
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L27)

<a id="constant-constant-mq3-botlib-public-headers-tfl-strafejump-const-tfl-strafejump-131072-src-mq3-botlib-public-headers-ml-759917455"></a>
### TFL_STRAFEJUMP

```ml
const TFL_STRAFEJUMP = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L23)

<a id="constant-constant-mq3-botlib-public-headers-tfl-swim-const-tfl-swim-256-src-mq3-botlib-public-headers-ml-1833793802"></a>
### TFL_SWIM

```ml
const TFL_SWIM = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L14)

<a id="constant-constant-mq3-botlib-public-headers-tfl-teleport-const-tfl-teleport-1024-src-mq3-botlib-public-headers-ml-1698600098"></a>
### TFL_TELEPORT

```ml
const TFL_TELEPORT = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L16)

<a id="constant-constant-mq3-botlib-public-headers-tfl-walk-const-tfl-walk-2-src-mq3-botlib-public-headers-ml-1298414925"></a>
### TFL_WALK

```ml
const TFL_WALK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L8)

<a id="constant-constant-mq3-botlib-public-headers-tfl-walkoffledge-const-tfl-walkoffledge-128-src-mq3-botlib-public-headers-ml-804117652"></a>
### TFL_WALKOFFLEDGE

```ml
const TFL_WALKOFFLEDGE = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L13)

<a id="constant-constant-mq3-botlib-public-headers-tfl-water-const-tfl-water-1048576-src-mq3-botlib-public-headers-ml-1384032210"></a>
### TFL_WATER

```ml
const TFL_WATER = 1048576
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L26)

<a id="constant-constant-mq3-botlib-public-headers-tfl-waterjump-const-tfl-waterjump-512-src-mq3-botlib-public-headers-ml-99668961"></a>
### TFL_WATERJUMP

```ml
const TFL_WATERJUMP = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L15)

<a id="function-function-mq3-botlib-public-headers-typenames-function-typenames-src-mq3-botlib-public-headers-ml-222609704"></a>
### typeNames

```ml
function typeNames()
```

Return the ordered type names table for public headers: 25 entries beginning with `"solid_t"` and `"aas_trace_t"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L168)

<a id="function-function-mq3-botlib-public-headers-validapiversion-function-validapiversion-value-src-mq3-botlib-public-headers-ml-440841125"></a>
### validApiVersion

```ml
function validApiVersion(value)
```

Test `value==BOTLIB_API_VERSION` as the condition for `validApiVersion`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value==BOTLIB_API_VERSION`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L225)

<a id="function-function-mq3-botlib-public-headers-validchatgender-function-validchatgender-value-src-mq3-botlib-public-headers-ml-1043912907"></a>
### validChatGender

```ml
function validChatGender(value)
```

Test `value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE` as the condition for `validChatGender`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L228)

<a id="function-function-mq3-botlib-public-headers-weaponinfo-tfields-function-weaponinfo-tfields-src-mq3-botlib-public-headers-ml-1695962352"></a>
### weaponinfo_tFields

```ml
function weaponinfo_tFields()
```

Return the ordered weaponinfo t fields table for public headers: 24 entries beginning with `"valid"` and `"number"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L204)

<a id="constant-constant-mq3-botlib-public-headers-wfl-firereleased-const-wfl-firereleased-1-src-mq3-botlib-public-headers-ml-1198539676"></a>
### WFL_FIRERELEASED

```ml
const WFL_FIRERELEASED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/public_headers.ml#L109)
