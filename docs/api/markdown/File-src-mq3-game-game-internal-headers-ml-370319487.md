# `src/mq3/game/game_internal_headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.game_internal_headers`](Package-mq3-game-game-internal-headers-1115919457.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-game-game-internal-headers-bglibfunctionnames-function-bglibfunctionnames-src-mq3-game-game-internal-headers-ml-523711762"></a>
### bgLibFunctionNames

```ml
function bgLibFunctionNames()
```

Return the ordered bg lib function names table for game internal headers: 31 entries beginning with `"qsort"` and `"srand"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L566)

<a id="function-function-mq3-game-game-internal-headers-bglibmacronames-function-bglibmacronames-src-mq3-game-game-internal-headers-ml-180793250"></a>
### bgLibMacroNames

```ml
function bgLibMacroNames()
```

Return the ordered bg lib macro names table for game internal headers: 17 entries beginning with `"_INTSIZEOF"` and `"va_start"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L562)

<a id="function-function-mq3-game-game-internal-headers-bglibtypenames-function-bglibtypenames-src-mq3-game-game-internal-headers-ml-669958162"></a>
### bgLibTypeNames

```ml
function bgLibTypeNames()
```

Return a new array `["size_t","va_list","cmp_t"]` for `bgLibTypeNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L564)

<a id="function-function-mq3-game-game-internal-headers-bglocalconstantnames-function-bglocalconstantnames-src-mq3-game-game-internal-headers-ml-415464962"></a>
### bgLocalConstantNames

```ml
function bgLocalConstantNames()
```

Return a new array `["MIN_WALK_NORMAL","STEPSIZE","JUMP_VELOCITY","TIMER_LAND","TIMER_GESTURE","OVERCLIP"]` for `bgLocalConstantNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L568)

<a id="function-function-mq3-game-game-internal-headers-bglocalconstantvalues-function-bglocalconstantvalues-src-mq3-game-game-internal-headers-ml-405672890"></a>
### bgLocalConstantValues

```ml
function bgLocalConstantValues()
```

Return a new array `[MIN_WALK_NORMAL,STEPSIZE,JUMP_VELOCITY,TIMER_LAND,TIMER_GESTURE,OVERCLIP]` for `bgLocalConstantValues`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L570)

<a id="function-function-mq3-game-game-internal-headers-bglocalfunctionnames-function-bglocalfunctionnames-src-mq3-game-game-internal-headers-ml-1605406706"></a>
### bgLocalFunctionNames

```ml
function bgLocalFunctionNames()
```

Return a new array `["PM_ClipVelocity","PM_AddTouchEnt","PM_AddEvent","PM_SlideMove","PM_StepSlideMove"]` for `bgLocalFunctionNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L574)

<a id="function-function-mq3-game-game-internal-headers-bglocalglobalnames-function-bglocalglobalnames-src-mq3-game-game-internal-headers-ml-516382290"></a>
### bgLocalGlobalNames

```ml
function bgLocalGlobalNames()
```

Return the ordered bg local global names table for game internal headers: 14 entries beginning with `"pm"` and `"pml"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L576)

<a id="constant-constant-mq3-game-game-internal-headers-char-bit-const-char-bit-8-src-mq3-game-game-internal-headers-ml-1349824277"></a>
### CHAR_BIT

```ml
const CHAR_BIT = 8
```

Number of bits in one byte in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L7)

<a id="function-function-mq3-game-game-internal-headers-headercounts-function-headercounts-src-mq3-game-game-internal-headers-ml-1019122694"></a>
### headerCounts

```ml
function headerCounts()
```

Return a new array `[17,3,31,6,12,5,14,257]` for `headerCounts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L582)

<a id="constant-constant-mq3-game-game-internal-headers-int-max-const-int-max-2147483647-src-mq3-game-game-internal-headers-ml-1069782461"></a>
### INT_MAX

```ml
const INT_MAX = 2147483647
```

Maximum signed 32-bit integer value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L23)

<a id="constant-constant-mq3-game-game-internal-headers-int-min-const-int-min-2147483648-src-mq3-game-game-internal-headers-ml-973220477"></a>
### INT_MIN

```ml
const INT_MIN = -2147483648
```

Minimum signed 32-bit integer value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L21)

<a id="constant-constant-mq3-game-game-internal-headers-jump-velocity-const-jump-velocity-270-src-mq3-game-game-internal-headers-ml-329298246"></a>
### JUMP_VELOCITY

```ml
const JUMP_VELOCITY = 270
```

Initial upward velocity assigned when a normal player jump starts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L38)

<a id="constant-constant-mq3-game-game-internal-headers-long-max-const-long-max-2147483647-src-mq3-game-game-internal-headers-ml-337964881"></a>
### LONG_MAX

```ml
const LONG_MAX = 2147483647
```

Maximum signed 32-bit integer value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L29)

<a id="constant-constant-mq3-game-game-internal-headers-long-min-const-long-min-2147483648-src-mq3-game-game-internal-headers-ml-2012775881"></a>
### LONG_MIN

```ml
const LONG_MIN = -2147483648
```

Minimum signed 32-bit integer value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L27)

<a id="constant-constant-mq3-game-game-internal-headers-min-walk-normal-const-min-walk-normal-0-7-src-mq3-game-game-internal-headers-ml-949785700"></a>
### MIN_WALK_NORMAL

```ml
const MIN_WALK_NORMAL = 0.7
```

Minimum upward collision-normal component that can be treated as walkable ground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L34)

<a id="constant-constant-mq3-game-game-internal-headers-overclip-const-overclip-1-001-src-mq3-game-game-internal-headers-ml-662939875"></a>
### OVERCLIP

```ml
const OVERCLIP = 1.001
```

Small collision-plane overbounce factor that prevents motion from sticking to a surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L44)

<a id="function-function-mq3-game-game-internal-headers-pmlfieldnames-function-pmlfieldnames-src-mq3-game-game-internal-headers-ml-946379288"></a>
### pmlFieldNames

```ml
function pmlFieldNames()
```

Return the ordered pml field names table for game internal headers: 12 entries beginning with `"forward"` and `"right"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L572)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-ammoregen-const-qgr-key-ammoregen-1111160803-src-mq3-game-game-internal-headers-ml-1228546983"></a>
### QGR_KEY_AMMOREGEN

```ml
const QGR_KEY_AMMOREGEN = 1111160803
```

Ranking-report key used to identify ammoregen statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L495)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-armor-const-qgr-key-armor-1111050000-src-mq3-game-game-internal-headers-ml-52596546"></a>
### QGR_KEY_ARMOR

```ml
const QGR_KEY_ARMOR = 1111050000
```

Ranking-report key used to identify armor statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L465)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-armor-red-const-qgr-key-armor-red-1111050300-src-mq3-game-game-internal-headers-ml-1248176271"></a>
### QGR_KEY_ARMOR_RED

```ml
const QGR_KEY_ARMOR_RED = 1111050300
```

Ranking-report key used to identify armor red statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L473)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-armor-shard-const-qgr-key-armor-shard-1111050100-src-mq3-game-game-internal-headers-ml-1022250305"></a>
### QGR_KEY_ARMOR_SHARD

```ml
const QGR_KEY_ARMOR_SHARD = 1111050100
```

Ranking-report key used to identify armor shard statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L469)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-armor-total-const-qgr-key-armor-total-1111050001-src-mq3-game-game-internal-headers-ml-1043386673"></a>
### QGR_KEY_ARMOR_TOTAL

```ml
const QGR_KEY_ARMOR_TOTAL = 1111050001
```

Ranking-report key used to identify armor total statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L467)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-armor-yellow-const-qgr-key-armor-yellow-1111050200-src-mq3-game-game-internal-headers-ml-1357109556"></a>
### QGR_KEY_ARMOR_YELLOW

```ml
const QGR_KEY_ARMOR_YELLOW = 1111050200
```

Ranking-report key used to identify armor yellow statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L471)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-const-qgr-key-boxes-1111030000-src-mq3-game-game-internal-headers-ml-1399047604"></a>
### QGR_KEY_BOXES

```ml
const QGR_KEY_BOXES = 1111030000
```

Ranking-report key used to identify boxes statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L405)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-bfg-ammo-const-qgr-key-boxes-bfg-ammo-1111030800-src-mq3-game-game-internal-headers-ml-1466499852"></a>
### QGR_KEY_BOXES_BFG_AMMO

```ml
const QGR_KEY_BOXES_BFG_AMMO = 1111030800
```

Ranking-report key used to identify boxes BFG ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L437)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-bullets-const-qgr-key-boxes-bullets-1111030100-src-mq3-game-game-internal-headers-ml-2027908099"></a>
### QGR_KEY_BOXES_BULLETS

```ml
const QGR_KEY_BOXES_BULLETS = 1111030100
```

Ranking-report key used to identify boxes bullets statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L409)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-cells-const-qgr-key-boxes-cells-1111030500-src-mq3-game-game-internal-headers-ml-1734637207"></a>
### QGR_KEY_BOXES_CELLS

```ml
const QGR_KEY_BOXES_CELLS = 1111030500
```

Ranking-report key used to identify boxes cells statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L425)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-chaingun-ammo-const-qgr-key-boxes-chaingun-ammo-1111031100-src-mq3-game-game-internal-headers-ml-633819626"></a>
### QGR_KEY_BOXES_CHAINGUN_AMMO

```ml
const QGR_KEY_BOXES_CHAINGUN_AMMO = 1111031100
```

Ranking-report key used to identify boxes chaingun ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L449)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-grenades-const-qgr-key-boxes-grenades-1111030300-src-mq3-game-game-internal-headers-ml-1754068391"></a>
### QGR_KEY_BOXES_GRENADES

```ml
const QGR_KEY_BOXES_GRENADES = 1111030300
```

Ranking-report key used to identify boxes grenades statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L417)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-lg-ammo-const-qgr-key-boxes-lg-ammo-1111030700-src-mq3-game-game-internal-headers-ml-1602031857"></a>
### QGR_KEY_BOXES_LG_AMMO

```ml
const QGR_KEY_BOXES_LG_AMMO = 1111030700
```

Ranking-report key used to identify boxes lg ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L433)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-nailgun-ammo-const-qgr-key-boxes-nailgun-ammo-1111030900-src-mq3-game-game-internal-headers-ml-1874694277"></a>
### QGR_KEY_BOXES_NAILGUN_AMMO

```ml
const QGR_KEY_BOXES_NAILGUN_AMMO = 1111030900
```

Ranking-report key used to identify boxes nailgun ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L441)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-prox-launcher-ammo-const-qgr-key-boxes-prox-launcher-ammo-1111031000-src-mq3-game-game-internal-headers-ml-1208808767"></a>
### QGR_KEY_BOXES_PROX_LAUNCHER_AMMO

```ml
const QGR_KEY_BOXES_PROX_LAUNCHER_AMMO = 1111031000
```

Ranking-report key used to identify boxes prox launcher ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L445)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-rockets-const-qgr-key-boxes-rockets-1111030400-src-mq3-game-game-internal-headers-ml-451482360"></a>
### QGR_KEY_BOXES_ROCKETS

```ml
const QGR_KEY_BOXES_ROCKETS = 1111030400
```

Ranking-report key used to identify boxes rockets statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L421)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-shells-const-qgr-key-boxes-shells-1111030200-src-mq3-game-game-internal-headers-ml-1137267996"></a>
### QGR_KEY_BOXES_SHELLS

```ml
const QGR_KEY_BOXES_SHELLS = 1111030200
```

Ranking-report key used to identify boxes shells statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L413)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-boxes-slugs-const-qgr-key-boxes-slugs-1111030600-src-mq3-game-game-internal-headers-ml-1410331590"></a>
### QGR_KEY_BOXES_SLUGS

```ml
const QGR_KEY_BOXES_SLUGS = 1111030600
```

Ranking-report key used to identify boxes slugs statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L429)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-crush-const-qgr-key-crush-1111080400-src-mq3-game-game-internal-headers-ml-1072455541"></a>
### QGR_KEY_CRUSH

```ml
const QGR_KEY_CRUSH = 1111080400
```

Ranking-report key used to identify crush statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L525)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-const-qgr-key-damage-given-1111020005-src-mq3-game-game-internal-headers-ml-648381866"></a>
### QGR_KEY_DAMAGE_GIVEN

```ml
const QGR_KEY_DAMAGE_GIVEN = 1111020005
```

Ranking-report key for damage dealt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L85)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-bfg-const-qgr-key-damage-given-bfg-1111020905-src-mq3-game-game-internal-headers-ml-402738893"></a>
### QGR_KEY_DAMAGE_GIVEN_BFG

```ml
const QGR_KEY_DAMAGE_GIVEN_BFG = 1111020905
```

Ranking-report key for damage dealt associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L283)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-chaingun-const-qgr-key-damage-given-chaingun-1111021405-src-mq3-game-game-internal-headers-ml-311183161"></a>
### QGR_KEY_DAMAGE_GIVEN_CHAINGUN

```ml
const QGR_KEY_DAMAGE_GIVEN_CHAINGUN = 1111021405
```

Ranking-report key for damage dealt associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L393)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-gauntlet-const-qgr-key-damage-given-gauntlet-1111020105-src-mq3-game-game-internal-headers-ml-471665571"></a>
### QGR_KEY_DAMAGE_GIVEN_GAUNTLET

```ml
const QGR_KEY_DAMAGE_GIVEN_GAUNTLET = 1111020105
```

Ranking-report key for damage dealt associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L107)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-grapple-const-qgr-key-damage-given-grapple-1111021005-src-mq3-game-game-internal-headers-ml-294893343"></a>
### QGR_KEY_DAMAGE_GIVEN_GRAPPLE

```ml
const QGR_KEY_DAMAGE_GIVEN_GRAPPLE = 1111021005
```

Ranking-report key for damage dealt associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L305)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-grenade-const-qgr-key-damage-given-grenade-1111020405-src-mq3-game-game-internal-headers-ml-12284508"></a>
### QGR_KEY_DAMAGE_GIVEN_GRENADE

```ml
const QGR_KEY_DAMAGE_GIVEN_GRENADE = 1111020405
```

Ranking-report key for damage dealt associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L173)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-lightning-const-qgr-key-damage-given-lightning-1111020805-src-mq3-game-game-internal-headers-ml-1939218460"></a>
### QGR_KEY_DAMAGE_GIVEN_LIGHTNING

```ml
const QGR_KEY_DAMAGE_GIVEN_LIGHTNING = 1111020805
```

Ranking-report key for damage dealt associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L261)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-machinegun-const-qgr-key-damage-given-machinegun-1111020205-src-mq3-game-game-internal-headers-ml-207700262"></a>
### QGR_KEY_DAMAGE_GIVEN_MACHINEGUN

```ml
const QGR_KEY_DAMAGE_GIVEN_MACHINEGUN = 1111020205
```

Ranking-report key for damage dealt associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L129)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-nailgin-const-qgr-key-damage-given-nailgin-1111021205-src-mq3-game-game-internal-headers-ml-1142697939"></a>
### QGR_KEY_DAMAGE_GIVEN_NAILGIN

```ml
const QGR_KEY_DAMAGE_GIVEN_NAILGIN = 1111021205
```

Ranking-report key for damage dealt associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L349)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-plasma-const-qgr-key-damage-given-plasma-1111020605-src-mq3-game-game-internal-headers-ml-1111674682"></a>
### QGR_KEY_DAMAGE_GIVEN_PLASMA

```ml
const QGR_KEY_DAMAGE_GIVEN_PLASMA = 1111020605
```

Ranking-report key for damage dealt associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L217)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-prox-launcher-const-qgr-key-damage-given-prox-launcher-1111021305-src-mq3-game-game-internal-headers-ml-1436054108"></a>
### QGR_KEY_DAMAGE_GIVEN_PROX_LAUNCHER

```ml
const QGR_KEY_DAMAGE_GIVEN_PROX_LAUNCHER = 1111021305
```

Ranking-report key for damage dealt associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L371)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-railgun-const-qgr-key-damage-given-railgun-1111020705-src-mq3-game-game-internal-headers-ml-1072800593"></a>
### QGR_KEY_DAMAGE_GIVEN_RAILGUN

```ml
const QGR_KEY_DAMAGE_GIVEN_RAILGUN = 1111020705
```

Ranking-report key for damage dealt associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L239)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-rocket-const-qgr-key-damage-given-rocket-1111020505-src-mq3-game-game-internal-headers-ml-690678283"></a>
### QGR_KEY_DAMAGE_GIVEN_ROCKET

```ml
const QGR_KEY_DAMAGE_GIVEN_ROCKET = 1111020505
```

Ranking-report key for damage dealt associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L195)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-shotgun-const-qgr-key-damage-given-shotgun-1111020305-src-mq3-game-game-internal-headers-ml-642224009"></a>
### QGR_KEY_DAMAGE_GIVEN_SHOTGUN

```ml
const QGR_KEY_DAMAGE_GIVEN_SHOTGUN = 1111020305
```

Ranking-report key for damage dealt associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L151)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-given-unknown-const-qgr-key-damage-given-unknown-1111021105-src-mq3-game-game-internal-headers-ml-1805966054"></a>
### QGR_KEY_DAMAGE_GIVEN_UNKNOWN

```ml
const QGR_KEY_DAMAGE_GIVEN_UNKNOWN = 1111021105
```

Ranking-report key for damage dealt associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L327)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-const-qgr-key-damage-taken-1111020006-src-mq3-game-game-internal-headers-ml-391079767"></a>
### QGR_KEY_DAMAGE_TAKEN

```ml
const QGR_KEY_DAMAGE_TAKEN = 1111020006
```

Ranking-report key for damage received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L87)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-bfg-const-qgr-key-damage-taken-bfg-1111020906-src-mq3-game-game-internal-headers-ml-768451192"></a>
### QGR_KEY_DAMAGE_TAKEN_BFG

```ml
const QGR_KEY_DAMAGE_TAKEN_BFG = 1111020906
```

Ranking-report key for damage received associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L285)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-chaingun-const-qgr-key-damage-taken-chaingun-1111021406-src-mq3-game-game-internal-headers-ml-1713707164"></a>
### QGR_KEY_DAMAGE_TAKEN_CHAINGUN

```ml
const QGR_KEY_DAMAGE_TAKEN_CHAINGUN = 1111021406
```

Ranking-report key for damage received associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L395)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-gauntlet-const-qgr-key-damage-taken-gauntlet-1111020106-src-mq3-game-game-internal-headers-ml-978575838"></a>
### QGR_KEY_DAMAGE_TAKEN_GAUNTLET

```ml
const QGR_KEY_DAMAGE_TAKEN_GAUNTLET = 1111020106
```

Ranking-report key for damage received associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L109)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-grapple-const-qgr-key-damage-taken-grapple-1111021006-src-mq3-game-game-internal-headers-ml-1607667742"></a>
### QGR_KEY_DAMAGE_TAKEN_GRAPPLE

```ml
const QGR_KEY_DAMAGE_TAKEN_GRAPPLE = 1111021006
```

Ranking-report key for damage received associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L307)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-grenade-const-qgr-key-damage-taken-grenade-1111020406-src-mq3-game-game-internal-headers-ml-2042234565"></a>
### QGR_KEY_DAMAGE_TAKEN_GRENADE

```ml
const QGR_KEY_DAMAGE_TAKEN_GRENADE = 1111020406
```

Ranking-report key for damage received associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L175)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-lightning-const-qgr-key-damage-taken-lightning-1111020806-src-mq3-game-game-internal-headers-ml-342220817"></a>
### QGR_KEY_DAMAGE_TAKEN_LIGHTNING

```ml
const QGR_KEY_DAMAGE_TAKEN_LIGHTNING = 1111020806
```

Ranking-report key for damage received associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L263)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-machinegun-const-qgr-key-damage-taken-machinegun-1111020206-src-mq3-game-game-internal-headers-ml-624674159"></a>
### QGR_KEY_DAMAGE_TAKEN_MACHINEGUN

```ml
const QGR_KEY_DAMAGE_TAKEN_MACHINEGUN = 1111020206
```

Ranking-report key for damage received associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L131)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-nailgin-const-qgr-key-damage-taken-nailgin-1111021206-src-mq3-game-game-internal-headers-ml-573786030"></a>
### QGR_KEY_DAMAGE_TAKEN_NAILGIN

```ml
const QGR_KEY_DAMAGE_TAKEN_NAILGIN = 1111021206
```

Ranking-report key for damage received associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L351)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-plasma-const-qgr-key-damage-taken-plasma-1111020606-src-mq3-game-game-internal-headers-ml-1024802979"></a>
### QGR_KEY_DAMAGE_TAKEN_PLASMA

```ml
const QGR_KEY_DAMAGE_TAKEN_PLASMA = 1111020606
```

Ranking-report key for damage received associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L219)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-prox-launcher-const-qgr-key-damage-taken-prox-launcher-1111021306-src-mq3-game-game-internal-headers-ml-1284594681"></a>
### QGR_KEY_DAMAGE_TAKEN_PROX_LAUNCHER

```ml
const QGR_KEY_DAMAGE_TAKEN_PROX_LAUNCHER = 1111021306
```

Ranking-report key for damage received associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L373)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-railgun-const-qgr-key-damage-taken-railgun-1111020706-src-mq3-game-game-internal-headers-ml-325333136"></a>
### QGR_KEY_DAMAGE_TAKEN_RAILGUN

```ml
const QGR_KEY_DAMAGE_TAKEN_RAILGUN = 1111020706
```

Ranking-report key for damage received associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L241)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-rocket-const-qgr-key-damage-taken-rocket-1111020506-src-mq3-game-game-internal-headers-ml-326821962"></a>
### QGR_KEY_DAMAGE_TAKEN_ROCKET

```ml
const QGR_KEY_DAMAGE_TAKEN_ROCKET = 1111020506
```

Ranking-report key for damage received associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L197)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-shotgun-const-qgr-key-damage-taken-shotgun-1111020306-src-mq3-game-game-internal-headers-ml-509162124"></a>
### QGR_KEY_DAMAGE_TAKEN_SHOTGUN

```ml
const QGR_KEY_DAMAGE_TAKEN_SHOTGUN = 1111020306
```

Ranking-report key for damage received associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L153)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-damage-taken-unknown-const-qgr-key-damage-taken-unknown-1111021106-src-mq3-game-game-internal-headers-ml-538840647"></a>
### QGR_KEY_DAMAGE_TAKEN_UNKNOWN

```ml
const QGR_KEY_DAMAGE_TAKEN_UNKNOWN = 1111021106
```

Ranking-report key for damage received associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L329)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-dedicated-const-qgr-key-dedicated-1010010010-src-mq3-game-game-internal-headers-ml-980702007"></a>
### QGR_KEY_DEDICATED

```ml
const QGR_KEY_DEDICATED = 1010010010
```

Ranking-report key used to identify dedicated statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L71)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-doubler-const-qgr-key-doubler-1111160802-src-mq3-game-game-internal-headers-ml-1910193432"></a>
### QGR_KEY_DOUBLER

```ml
const QGR_KEY_DOUBLER = 1111160802
```

Ranking-report key used to identify doubler statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L493)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-excellent-const-qgr-key-excellent-1111090100-src-mq3-game-game-internal-headers-ml-148943017"></a>
### QGR_KEY_EXCELLENT

```ml
const QGR_KEY_EXCELLENT = 1111090100
```

Ranking-report key used to identify excellent statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L539)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-falling-const-qgr-key-falling-1111080600-src-mq3-game-game-internal-headers-ml-1995335911"></a>
### QGR_KEY_FALLING

```ml
const QGR_KEY_FALLING = 1111080600
```

Ranking-report key used to identify falling statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L529)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-flag-capture-const-qgr-key-flag-capture-1111110001-src-mq3-game-game-internal-headers-ml-1553912130"></a>
### QGR_KEY_FLAG_CAPTURE

```ml
const QGR_KEY_FLAG_CAPTURE = 1111110001
```

Ranking-report key used to identify flag capture statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L559)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-flag-pickup-const-qgr-key-flag-pickup-1111110000-src-mq3-game-game-internal-headers-ml-129148619"></a>
### QGR_KEY_FLAG_PICKUP

```ml
const QGR_KEY_FLAG_PICKUP = 1111110000
```

Ranking-report key used to identify flag pickup statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L557)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-flight-const-qgr-key-flight-1111060600-src-mq3-game-game-internal-headers-ml-1301644757"></a>
### QGR_KEY_FLIGHT

```ml
const QGR_KEY_FLIGHT = 1111060600
```

Ranking-report key used to identify flight statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L487)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-const-qgr-key-frag-1211020000-src-mq3-game-game-internal-headers-ml-1280565658"></a>
### QGR_KEY_FRAG

```ml
const QGR_KEY_FRAG = 1211020000
```

Ranking-report key for kills scored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L75)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-bfg-const-qgr-key-frag-bfg-1211020900-src-mq3-game-game-internal-headers-ml-846760105"></a>
### QGR_KEY_FRAG_BFG

```ml
const QGR_KEY_FRAG_BFG = 1211020900
```

Ranking-report key for kills scored associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L273)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-chaingun-const-qgr-key-frag-chaingun-1211021400-src-mq3-game-game-internal-headers-ml-412184879"></a>
### QGR_KEY_FRAG_CHAINGUN

```ml
const QGR_KEY_FRAG_CHAINGUN = 1211021400
```

Ranking-report key for kills scored associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L383)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-gauntlet-const-qgr-key-frag-gauntlet-1211020100-src-mq3-game-game-internal-headers-ml-1507457833"></a>
### QGR_KEY_FRAG_GAUNTLET

```ml
const QGR_KEY_FRAG_GAUNTLET = 1211020100
```

Ranking-report key for kills scored associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L97)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-grapple-const-qgr-key-frag-grapple-1211021000-src-mq3-game-game-internal-headers-ml-115279331"></a>
### QGR_KEY_FRAG_GRAPPLE

```ml
const QGR_KEY_FRAG_GRAPPLE = 1211021000
```

Ranking-report key for kills scored associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L295)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-grenade-const-qgr-key-frag-grenade-1211020400-src-mq3-game-game-internal-headers-ml-651960296"></a>
### QGR_KEY_FRAG_GRENADE

```ml
const QGR_KEY_FRAG_GRENADE = 1211020400
```

Ranking-report key for kills scored associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L163)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-lightning-const-qgr-key-frag-lightning-1211020800-src-mq3-game-game-internal-headers-ml-139974736"></a>
### QGR_KEY_FRAG_LIGHTNING

```ml
const QGR_KEY_FRAG_LIGHTNING = 1211020800
```

Ranking-report key for kills scored associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L251)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-machinegun-const-qgr-key-frag-machinegun-1211020200-src-mq3-game-game-internal-headers-ml-874690344"></a>
### QGR_KEY_FRAG_MACHINEGUN

```ml
const QGR_KEY_FRAG_MACHINEGUN = 1211020200
```

Ranking-report key for kills scored associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L119)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-nailgin-const-qgr-key-frag-nailgin-1211021200-src-mq3-game-game-internal-headers-ml-1393752459"></a>
### QGR_KEY_FRAG_NAILGIN

```ml
const QGR_KEY_FRAG_NAILGIN = 1211021200
```

Ranking-report key for kills scored associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L339)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-plasma-const-qgr-key-frag-plasma-1211020600-src-mq3-game-game-internal-headers-ml-373992424"></a>
### QGR_KEY_FRAG_PLASMA

```ml
const QGR_KEY_FRAG_PLASMA = 1211020600
```

Ranking-report key for kills scored associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L207)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-prox-launcher-const-qgr-key-frag-prox-launcher-1211021300-src-mq3-game-game-internal-headers-ml-281585924"></a>
### QGR_KEY_FRAG_PROX_LAUNCHER

```ml
const QGR_KEY_FRAG_PROX_LAUNCHER = 1211021300
```

Ranking-report key for kills scored associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L361)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-railgun-const-qgr-key-frag-railgun-1211020700-src-mq3-game-game-internal-headers-ml-1683769213"></a>
### QGR_KEY_FRAG_RAILGUN

```ml
const QGR_KEY_FRAG_RAILGUN = 1211020700
```

Ranking-report key for kills scored associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L229)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-rocket-const-qgr-key-frag-rocket-1211020500-src-mq3-game-game-internal-headers-ml-156566297"></a>
### QGR_KEY_FRAG_ROCKET

```ml
const QGR_KEY_FRAG_ROCKET = 1211020500
```

Ranking-report key for kills scored associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L185)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-shotgun-const-qgr-key-frag-shotgun-1211020300-src-mq3-game-game-internal-headers-ml-795364405"></a>
### QGR_KEY_FRAG_SHOTGUN

```ml
const QGR_KEY_FRAG_SHOTGUN = 1211020300
```

Ranking-report key for kills scored associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L141)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-frag-unknown-const-qgr-key-frag-unknown-1211021100-src-mq3-game-game-internal-headers-ml-45674002"></a>
### QGR_KEY_FRAG_UNKNOWN

```ml
const QGR_KEY_FRAG_UNKNOWN = 1211021100
```

Ranking-report key for kills scored associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L317)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-fraglimit-const-qgr-key-fraglimit-1010010004-src-mq3-game-game-internal-headers-ml-1843570038"></a>
### QGR_KEY_FRAGLIMIT

```ml
const QGR_KEY_FRAGLIMIT = 1010010004
```

Ranking-report key used to identify frag limit statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L59)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-gametype-const-qgr-key-gametype-1010010003-src-mq3-game-game-internal-headers-ml-657091899"></a>
### QGR_KEY_GAMETYPE

```ml
const QGR_KEY_GAMETYPE = 1010010003
```

Ranking-report key for the selected game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L57)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-guard-const-qgr-key-guard-1111160801-src-mq3-game-game-internal-headers-ml-1657270985"></a>
### QGR_KEY_GUARD

```ml
const QGR_KEY_GUARD = 1111160801
```

Ranking-report key used to identify guard statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L491)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-haste-const-qgr-key-haste-1111060300-src-mq3-game-game-internal-headers-ml-1505127034"></a>
### QGR_KEY_HASTE

```ml
const QGR_KEY_HASTE = 1111060300
```

Ranking-report key used to identify haste statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L481)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hazard-death-const-qgr-key-hazard-death-1111080000-src-mq3-game-game-internal-headers-ml-608109523"></a>
### QGR_KEY_HAZARD_DEATH

```ml
const QGR_KEY_HAZARD_DEATH = 1111080000
```

Ranking-report key used to identify hazard death statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L517)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hazard-misc-const-qgr-key-hazard-misc-1111080900-src-mq3-game-game-internal-headers-ml-1211577614"></a>
### QGR_KEY_HAZARD_MISC

```ml
const QGR_KEY_HAZARD_MISC = 1111080900
```

Ranking-report key used to identify hazard misc statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L535)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-health-const-qgr-key-health-1111040000-src-mq3-game-game-internal-headers-ml-1888502833"></a>
### QGR_KEY_HEALTH

```ml
const QGR_KEY_HEALTH = 1111040000
```

Ranking-report key used to identify health statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L453)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-health-25-const-qgr-key-health-25-1111040200-src-mq3-game-game-internal-headers-ml-1712070779"></a>
### QGR_KEY_HEALTH_25

```ml
const QGR_KEY_HEALTH_25 = 1111040200
```

Ranking-report key used to identify health 25 statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L459)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-health-5-const-qgr-key-health-5-1111040100-src-mq3-game-game-internal-headers-ml-1712692530"></a>
### QGR_KEY_HEALTH_5

```ml
const QGR_KEY_HEALTH_5 = 1111040100
```

Ranking-report key used to identify health 5 statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L457)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-health-50-const-qgr-key-health-50-1111040300-src-mq3-game-game-internal-headers-ml-1637405740"></a>
### QGR_KEY_HEALTH_50

```ml
const QGR_KEY_HEALTH_50 = 1111040300
```

Ranking-report key used to identify health 50 statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L461)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-health-mega-const-qgr-key-health-mega-1111040400-src-mq3-game-game-internal-headers-ml-1396327761"></a>
### QGR_KEY_HEALTH_MEGA

```ml
const QGR_KEY_HEALTH_MEGA = 1111040400
```

Ranking-report key used to identify health mega statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L463)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-health-total-const-qgr-key-health-total-1111040001-src-mq3-game-game-internal-headers-ml-1644839512"></a>
### QGR_KEY_HEALTH_TOTAL

```ml
const QGR_KEY_HEALTH_TOTAL = 1111040001
```

Ranking-report key used to identify health total statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L455)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-const-qgr-key-hit-given-1111020003-src-mq3-game-game-internal-headers-ml-2097035238"></a>
### QGR_KEY_HIT_GIVEN

```ml
const QGR_KEY_HIT_GIVEN = 1111020003
```

Ranking-report key for hits delivered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L81)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-bfg-const-qgr-key-hit-given-bfg-1111020903-src-mq3-game-game-internal-headers-ml-1759225521"></a>
### QGR_KEY_HIT_GIVEN_BFG

```ml
const QGR_KEY_HIT_GIVEN_BFG = 1111020903
```

Ranking-report key for hits delivered associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L279)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-chaingun-const-qgr-key-hit-given-chaingun-1111021403-src-mq3-game-game-internal-headers-ml-459494773"></a>
### QGR_KEY_HIT_GIVEN_CHAINGUN

```ml
const QGR_KEY_HIT_GIVEN_CHAINGUN = 1111021403
```

Ranking-report key for hits delivered associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L389)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-gauntlet-const-qgr-key-hit-given-gauntlet-1111020103-src-mq3-game-game-internal-headers-ml-1915508737"></a>
### QGR_KEY_HIT_GIVEN_GAUNTLET

```ml
const QGR_KEY_HIT_GIVEN_GAUNTLET = 1111020103
```

Ranking-report key for hits delivered associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L103)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-grapple-const-qgr-key-hit-given-grapple-1111021003-src-mq3-game-game-internal-headers-ml-93955219"></a>
### QGR_KEY_HIT_GIVEN_GRAPPLE

```ml
const QGR_KEY_HIT_GIVEN_GRAPPLE = 1111021003
```

Ranking-report key for hits delivered associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L301)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-grenade-const-qgr-key-hit-given-grenade-1111020403-src-mq3-game-game-internal-headers-ml-885923650"></a>
### QGR_KEY_HIT_GIVEN_GRENADE

```ml
const QGR_KEY_HIT_GIVEN_GRENADE = 1111020403
```

Ranking-report key for hits delivered associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L169)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-lightning-const-qgr-key-hit-given-lightning-1111020803-src-mq3-game-game-internal-headers-ml-1284840250"></a>
### QGR_KEY_HIT_GIVEN_LIGHTNING

```ml
const QGR_KEY_HIT_GIVEN_LIGHTNING = 1111020803
```

Ranking-report key for hits delivered associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L257)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-machinegun-const-qgr-key-hit-given-machinegun-1111020203-src-mq3-game-game-internal-headers-ml-25395174"></a>
### QGR_KEY_HIT_GIVEN_MACHINEGUN

```ml
const QGR_KEY_HIT_GIVEN_MACHINEGUN = 1111020203
```

Ranking-report key for hits delivered associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L125)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-nailgin-const-qgr-key-hit-given-nailgin-1111021203-src-mq3-game-game-internal-headers-ml-1554989905"></a>
### QGR_KEY_HIT_GIVEN_NAILGIN

```ml
const QGR_KEY_HIT_GIVEN_NAILGIN = 1111021203
```

Ranking-report key for hits delivered associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L345)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-plasma-const-qgr-key-hit-given-plasma-1111020603-src-mq3-game-game-internal-headers-ml-888174084"></a>
### QGR_KEY_HIT_GIVEN_PLASMA

```ml
const QGR_KEY_HIT_GIVEN_PLASMA = 1111020603
```

Ranking-report key for hits delivered associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L213)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-prox-launcher-const-qgr-key-hit-given-prox-launcher-1111021303-src-mq3-game-game-internal-headers-ml-1849609498"></a>
### QGR_KEY_HIT_GIVEN_PROX_LAUNCHER

```ml
const QGR_KEY_HIT_GIVEN_PROX_LAUNCHER = 1111021303
```

Ranking-report key for hits delivered associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L367)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-railgun-const-qgr-key-hit-given-railgun-1111020703-src-mq3-game-game-internal-headers-ml-820019203"></a>
### QGR_KEY_HIT_GIVEN_RAILGUN

```ml
const QGR_KEY_HIT_GIVEN_RAILGUN = 1111020703
```

Ranking-report key for hits delivered associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L235)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-rocket-const-qgr-key-hit-given-rocket-1111020503-src-mq3-game-game-internal-headers-ml-1675724249"></a>
### QGR_KEY_HIT_GIVEN_ROCKET

```ml
const QGR_KEY_HIT_GIVEN_ROCKET = 1111020503
```

Ranking-report key for hits delivered associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L191)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-shotgun-const-qgr-key-hit-given-shotgun-1111020303-src-mq3-game-game-internal-headers-ml-1449557443"></a>
### QGR_KEY_HIT_GIVEN_SHOTGUN

```ml
const QGR_KEY_HIT_GIVEN_SHOTGUN = 1111020303
```

Ranking-report key for hits delivered associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L147)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-given-unknown-const-qgr-key-hit-given-unknown-1111021103-src-mq3-game-game-internal-headers-ml-947705744"></a>
### QGR_KEY_HIT_GIVEN_UNKNOWN

```ml
const QGR_KEY_HIT_GIVEN_UNKNOWN = 1111021103
```

Ranking-report key for hits delivered associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L323)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-const-qgr-key-hit-taken-1111020004-src-mq3-game-game-internal-headers-ml-972516131"></a>
### QGR_KEY_HIT_TAKEN

```ml
const QGR_KEY_HIT_TAKEN = 1111020004
```

Ranking-report key for hits received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L83)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-bfg-const-qgr-key-hit-taken-bfg-1111020904-src-mq3-game-game-internal-headers-ml-1093891876"></a>
### QGR_KEY_HIT_TAKEN_BFG

```ml
const QGR_KEY_HIT_TAKEN_BFG = 1111020904
```

Ranking-report key for hits received associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L281)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-chaingun-const-qgr-key-hit-taken-chaingun-1111021404-src-mq3-game-game-internal-headers-ml-1586995080"></a>
### QGR_KEY_HIT_TAKEN_CHAINGUN

```ml
const QGR_KEY_HIT_TAKEN_CHAINGUN = 1111021404
```

Ranking-report key for hits received associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L391)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-gauntlet-const-qgr-key-hit-taken-gauntlet-1111020104-src-mq3-game-game-internal-headers-ml-2122852868"></a>
### QGR_KEY_HIT_TAKEN_GAUNTLET

```ml
const QGR_KEY_HIT_TAKEN_GAUNTLET = 1111020104
```

Ranking-report key for hits received associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L105)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-grapple-const-qgr-key-hit-taken-grapple-1111021004-src-mq3-game-game-internal-headers-ml-1216380842"></a>
### QGR_KEY_HIT_TAKEN_GRAPPLE

```ml
const QGR_KEY_HIT_TAKEN_GRAPPLE = 1111021004
```

Ranking-report key for hits received associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L303)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-grenade-const-qgr-key-hit-taken-grenade-1111020404-src-mq3-game-game-internal-headers-ml-983700459"></a>
### QGR_KEY_HIT_TAKEN_GRENADE

```ml
const QGR_KEY_HIT_TAKEN_GRENADE = 1111020404
```

Ranking-report key for hits received associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L171)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-lightning-const-qgr-key-hit-taken-lightning-1111020804-src-mq3-game-game-internal-headers-ml-37030559"></a>
### QGR_KEY_HIT_TAKEN_LIGHTNING

```ml
const QGR_KEY_HIT_TAKEN_LIGHTNING = 1111020804
```

Ranking-report key for hits received associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L259)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-machinegun-const-qgr-key-hit-taken-machinegun-1111020204-src-mq3-game-game-internal-headers-ml-197342351"></a>
### QGR_KEY_HIT_TAKEN_MACHINEGUN

```ml
const QGR_KEY_HIT_TAKEN_MACHINEGUN = 1111020204
```

Ranking-report key for hits received associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L127)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-nailgin-const-qgr-key-hit-taken-nailgin-1111021204-src-mq3-game-game-internal-headers-ml-371330212"></a>
### QGR_KEY_HIT_TAKEN_NAILGIN

```ml
const QGR_KEY_HIT_TAKEN_NAILGIN = 1111021204
```

Ranking-report key for hits received associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L347)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-plasma-const-qgr-key-hit-taken-plasma-1111020604-src-mq3-game-game-internal-headers-ml-1753045613"></a>
### QGR_KEY_HIT_TAKEN_PLASMA

```ml
const QGR_KEY_HIT_TAKEN_PLASMA = 1111020604
```

Ranking-report key for hits received associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L215)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-prox-launcher-const-qgr-key-hit-taken-prox-launcher-1111021304-src-mq3-game-game-internal-headers-ml-751120759"></a>
### QGR_KEY_HIT_TAKEN_PROX_LAUNCHER

```ml
const QGR_KEY_HIT_TAKEN_PROX_LAUNCHER = 1111021304
```

Ranking-report key for hits received associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L369)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-railgun-const-qgr-key-hit-taken-railgun-1111020704-src-mq3-game-game-internal-headers-ml-1384863882"></a>
### QGR_KEY_HIT_TAKEN_RAILGUN

```ml
const QGR_KEY_HIT_TAKEN_RAILGUN = 1111020704
```

Ranking-report key for hits received associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L237)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-rocket-const-qgr-key-hit-taken-rocket-1111020504-src-mq3-game-game-internal-headers-ml-1008901216"></a>
### QGR_KEY_HIT_TAKEN_ROCKET

```ml
const QGR_KEY_HIT_TAKEN_ROCKET = 1111020504
```

Ranking-report key for hits received associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L193)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-shotgun-const-qgr-key-hit-taken-shotgun-1111020304-src-mq3-game-game-internal-headers-ml-1019999454"></a>
### QGR_KEY_HIT_TAKEN_SHOTGUN

```ml
const QGR_KEY_HIT_TAKEN_SHOTGUN = 1111020304
```

Ranking-report key for hits received associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L149)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hit-taken-unknown-const-qgr-key-hit-taken-unknown-1111021104-src-mq3-game-game-internal-headers-ml-585886265"></a>
### QGR_KEY_HIT_TAKEN_UNKNOWN

```ml
const QGR_KEY_HIT_TAKEN_UNKNOWN = 1111021104
```

Ranking-report key for hits received associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L325)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-hostname-const-qgr-key-hostname-1000010000-src-mq3-game-game-internal-headers-ml-2053942509"></a>
### QGR_KEY_HOSTNAME

```ml
const QGR_KEY_HOSTNAME = 1000010000
```

Ranking-report key for the server host name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L51)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-impressive-const-qgr-key-impressive-1111090000-src-mq3-game-game-internal-headers-ml-31575560"></a>
### QGR_KEY_IMPRESSIVE

```ml
const QGR_KEY_IMPRESSIVE = 1111090000
```

Ranking-report key used to identify impressive statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L537)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-invis-const-qgr-key-invis-1111060400-src-mq3-game-game-internal-headers-ml-1205410795"></a>
### QGR_KEY_INVIS

```ml
const QGR_KEY_INVIS = 1111060400
```

Ranking-report key used to identify invis statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L483)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-invulnerability-const-qgr-key-invulnerability-1111070400-src-mq3-game-game-internal-headers-ml-1884155084"></a>
### QGR_KEY_INVULNERABILITY

```ml
const QGR_KEY_INVULNERABILITY = 1111070400
```

Ranking-report key used to identify invulnerability statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L513)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-invulnerability-use-const-qgr-key-invulnerability-use-1111070401-src-mq3-game-game-internal-headers-ml-887510767"></a>
### QGR_KEY_INVULNERABILITY_USE

```ml
const QGR_KEY_INVULNERABILITY_USE = 1111070401
```

Ranking-report key used to identify invulnerability use statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L515)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-kamikaze-const-qgr-key-kamikaze-1111070200-src-mq3-game-game-internal-headers-ml-977533692"></a>
### QGR_KEY_KAMIKAZE

```ml
const QGR_KEY_KAMIKAZE = 1111070200
```

Ranking-report key used to identify kamikaze statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L505)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-kamikaze-use-const-qgr-key-kamikaze-use-1111070201-src-mq3-game-game-internal-headers-ml-1128483543"></a>
### QGR_KEY_KAMIKAZE_USE

```ml
const QGR_KEY_KAMIKAZE_USE = 1111070201
```

Ranking-report key used to identify kamikaze use statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L507)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-lava-const-qgr-key-lava-1111080300-src-mq3-game-game-internal-headers-ml-2131945444"></a>
### QGR_KEY_LAVA

```ml
const QGR_KEY_LAVA = 1111080300
```

Ranking-report key used to identify lava statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L523)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-map-const-qgr-key-map-1000010001-src-mq3-game-game-internal-headers-ml-752556348"></a>
### QGR_KEY_MAP

```ml
const QGR_KEY_MAP = 1000010001
```

Ranking-report key for the played map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L53)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-match-rating-const-qgr-key-match-rating-1112000001-src-mq3-game-game-internal-headers-ml-778409641"></a>
### QGR_KEY_MATCH_RATING

```ml
const QGR_KEY_MATCH_RATING = 1112000001
```

Ranking-report key for the match rating.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L47)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-maxclients-const-qgr-key-maxclients-1010010006-src-mq3-game-game-internal-headers-ml-1024461460"></a>
### QGR_KEY_MAXCLIENTS

```ml
const QGR_KEY_MAXCLIENTS = 1010010006
```

Ranking-report key used to identify client limit statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L63)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-maxping-const-qgr-key-maxping-1010010009-src-mq3-game-game-internal-headers-ml-1618573421"></a>
### QGR_KEY_MAXPING

```ml
const QGR_KEY_MAXPING = 1010010009
```

Ranking-report key used to identify maximum ping statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L69)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-maxrate-const-qgr-key-maxrate-1010010007-src-mq3-game-game-internal-headers-ml-948189307"></a>
### QGR_KEY_MAXRATE

```ml
const QGR_KEY_MAXRATE = 1010010007
```

Ranking-report key used to identify maximum network rate statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L65)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-medkit-const-qgr-key-medkit-1111070000-src-mq3-game-game-internal-headers-ml-365222088"></a>
### QGR_KEY_MEDKIT

```ml
const QGR_KEY_MEDKIT = 1111070000
```

Ranking-report key used to identify medkit statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L497)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-medkit-use-const-qgr-key-medkit-use-1111070001-src-mq3-game-game-internal-headers-ml-2096319523"></a>
### QGR_KEY_MEDKIT_USE

```ml
const QGR_KEY_MEDKIT_USE = 1111070001
```

Ranking-report key used to identify medkit use statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L499)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-minping-const-qgr-key-minping-1010010008-src-mq3-game-game-internal-headers-ml-1112032646"></a>
### QGR_KEY_MINPING

```ml
const QGR_KEY_MINPING = 1010010008
```

Ranking-report key used to identify minimum ping statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L67)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-mod-const-qgr-key-mod-1000010002-src-mq3-game-game-internal-headers-ml-1485724949"></a>
### QGR_KEY_MOD

```ml
const QGR_KEY_MOD = 1000010002
```

Ranking-report key for the game modification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L55)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-bfg-const-qgr-key-pickup-bfg-1111020909-src-mq3-game-game-internal-headers-ml-121040491"></a>
### QGR_KEY_PICKUP_BFG

```ml
const QGR_KEY_PICKUP_BFG = 1111020909
```

Ranking-report key for pickups associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L291)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-chaingun-const-qgr-key-pickup-chaingun-1111021409-src-mq3-game-game-internal-headers-ml-1980190969"></a>
### QGR_KEY_PICKUP_CHAINGUN

```ml
const QGR_KEY_PICKUP_CHAINGUN = 1111021409
```

Ranking-report key for pickups associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L401)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-gauntlet-const-qgr-key-pickup-gauntlet-1111020109-src-mq3-game-game-internal-headers-ml-1542361623"></a>
### QGR_KEY_PICKUP_GAUNTLET

```ml
const QGR_KEY_PICKUP_GAUNTLET = 1111020109
```

Ranking-report key for pickups associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L115)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-grapple-const-qgr-key-pickup-grapple-1111021009-src-mq3-game-game-internal-headers-ml-1166332341"></a>
### QGR_KEY_PICKUP_GRAPPLE

```ml
const QGR_KEY_PICKUP_GRAPPLE = 1111021009
```

Ranking-report key for pickups associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L313)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-grenade-const-qgr-key-pickup-grenade-1111020409-src-mq3-game-game-internal-headers-ml-1527349582"></a>
### QGR_KEY_PICKUP_GRENADE

```ml
const QGR_KEY_PICKUP_GRENADE = 1111020409
```

Ranking-report key for pickups associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L181)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-lightning-const-qgr-key-pickup-lightning-1111020809-src-mq3-game-game-internal-headers-ml-700144054"></a>
### QGR_KEY_PICKUP_LIGHTNING

```ml
const QGR_KEY_PICKUP_LIGHTNING = 1111020809
```

Ranking-report key for pickups associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L269)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-machinegun-const-qgr-key-pickup-machinegun-1111020209-src-mq3-game-game-internal-headers-ml-1117022394"></a>
### QGR_KEY_PICKUP_MACHINEGUN

```ml
const QGR_KEY_PICKUP_MACHINEGUN = 1111020209
```

Ranking-report key for pickups associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L137)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-nailgin-const-qgr-key-pickup-nailgin-1111021209-src-mq3-game-game-internal-headers-ml-555497825"></a>
### QGR_KEY_PICKUP_NAILGIN

```ml
const QGR_KEY_PICKUP_NAILGIN = 1111021209
```

Ranking-report key for pickups associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L357)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-plasma-const-qgr-key-pickup-plasma-1111020609-src-mq3-game-game-internal-headers-ml-2106914506"></a>
### QGR_KEY_PICKUP_PLASMA

```ml
const QGR_KEY_PICKUP_PLASMA = 1111020609
```

Ranking-report key for pickups associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L225)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-prox-launcher-const-qgr-key-pickup-prox-launcher-1111021309-src-mq3-game-game-internal-headers-ml-1155177786"></a>
### QGR_KEY_PICKUP_PROX_LAUNCHER

```ml
const QGR_KEY_PICKUP_PROX_LAUNCHER = 1111021309
```

Ranking-report key for pickups associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L379)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-railgun-const-qgr-key-pickup-railgun-1111020709-src-mq3-game-game-internal-headers-ml-2129955215"></a>
### QGR_KEY_PICKUP_RAILGUN

```ml
const QGR_KEY_PICKUP_RAILGUN = 1111020709
```

Ranking-report key for pickups associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L247)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-rocket-const-qgr-key-pickup-rocket-1111020509-src-mq3-game-game-internal-headers-ml-1199057659"></a>
### QGR_KEY_PICKUP_ROCKET

```ml
const QGR_KEY_PICKUP_ROCKET = 1111020509
```

Ranking-report key for pickups associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L203)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-shotgun-const-qgr-key-pickup-shotgun-1111020309-src-mq3-game-game-internal-headers-ml-2045628927"></a>
### QGR_KEY_PICKUP_SHOTGUN

```ml
const QGR_KEY_PICKUP_SHOTGUN = 1111020309
```

Ranking-report key for pickups associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L159)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-unknown-const-qgr-key-pickup-unknown-1111021109-src-mq3-game-game-internal-headers-ml-254097156"></a>
### QGR_KEY_PICKUP_UNKNOWN

```ml
const QGR_KEY_PICKUP_UNKNOWN = 1111021109
```

Ranking-report key for pickups associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L335)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-pickup-weapon-const-qgr-key-pickup-weapon-1111020009-src-mq3-game-game-internal-headers-ml-834799140"></a>
### QGR_KEY_PICKUP_WEAPON

```ml
const QGR_KEY_PICKUP_WEAPON = 1111020009
```

Ranking-report key for weapon pickups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L93)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-played-with-const-qgr-key-played-with-1210000002-src-mq3-game-game-internal-headers-ml-1646971421"></a>
### QGR_KEY_PLAYED_WITH

```ml
const QGR_KEY_PLAYED_WITH = 1210000002
```

Ranking-report key for the pairing of participating players.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L49)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-portal-const-qgr-key-portal-1111070300-src-mq3-game-game-internal-headers-ml-2073708345"></a>
### QGR_KEY_PORTAL

```ml
const QGR_KEY_PORTAL = 1111070300
```

Ranking-report key used to identify portal statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L509)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-portal-use-const-qgr-key-portal-use-1111070301-src-mq3-game-game-internal-headers-ml-1753778454"></a>
### QGR_KEY_PORTAL_USE

```ml
const QGR_KEY_PORTAL_USE = 1111070301
```

Ranking-report key used to identify portal use statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L511)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-powerup-const-qgr-key-powerup-1111060000-src-mq3-game-game-internal-headers-ml-1629415335"></a>
### QGR_KEY_POWERUP

```ml
const QGR_KEY_POWERUP = 1111060000
```

Ranking-report key used to identify powerup statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L475)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-quad-const-qgr-key-quad-1111060100-src-mq3-game-game-internal-headers-ml-1947106002"></a>
### QGR_KEY_QUAD

```ml
const QGR_KEY_QUAD = 1111060100
```

Ranking-report key used to identify quad statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L477)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-regen-const-qgr-key-regen-1111060500-src-mq3-game-game-internal-headers-ml-790508360"></a>
### QGR_KEY_REGEN

```ml
const QGR_KEY_REGEN = 1111060500
```

Ranking-report key used to identify regen statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L485)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-const-qgr-key-rounds-1111030001-src-mq3-game-game-internal-headers-ml-1673803937"></a>
### QGR_KEY_ROUNDS

```ml
const QGR_KEY_ROUNDS = 1111030001
```

Ranking-report key used to identify rounds statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L407)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-bfg-ammo-const-qgr-key-rounds-bfg-ammo-1111030801-src-mq3-game-game-internal-headers-ml-1291611103"></a>
### QGR_KEY_ROUNDS_BFG_AMMO

```ml
const QGR_KEY_ROUNDS_BFG_AMMO = 1111030801
```

Ranking-report key used to identify rounds BFG ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L439)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-bullets-const-qgr-key-rounds-bullets-1111030101-src-mq3-game-game-internal-headers-ml-1716607806"></a>
### QGR_KEY_ROUNDS_BULLETS

```ml
const QGR_KEY_ROUNDS_BULLETS = 1111030101
```

Ranking-report key used to identify rounds bullets statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L411)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-cells-const-qgr-key-rounds-cells-1111030501-src-mq3-game-game-internal-headers-ml-1819774962"></a>
### QGR_KEY_ROUNDS_CELLS

```ml
const QGR_KEY_ROUNDS_CELLS = 1111030501
```

Ranking-report key used to identify rounds cells statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L427)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-chaingun-ammo-const-qgr-key-rounds-chaingun-ammo-1111031101-src-mq3-game-game-internal-headers-ml-1385024757"></a>
### QGR_KEY_ROUNDS_CHAINGUN_AMMO

```ml
const QGR_KEY_ROUNDS_CHAINGUN_AMMO = 1111031101
```

Ranking-report key used to identify rounds chaingun ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L451)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-grenades-const-qgr-key-rounds-grenades-1111030301-src-mq3-game-game-internal-headers-ml-811910170"></a>
### QGR_KEY_ROUNDS_GRENADES

```ml
const QGR_KEY_ROUNDS_GRENADES = 1111030301
```

Ranking-report key used to identify rounds grenades statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L419)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-lg-ammo-const-qgr-key-rounds-lg-ammo-1111030701-src-mq3-game-game-internal-headers-ml-1921234214"></a>
### QGR_KEY_ROUNDS_LG_AMMO

```ml
const QGR_KEY_ROUNDS_LG_AMMO = 1111030701
```

Ranking-report key used to identify rounds lg ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L435)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-nailgun-ammo-const-qgr-key-rounds-nailgun-ammo-1111030901-src-mq3-game-game-internal-headers-ml-99123072"></a>
### QGR_KEY_ROUNDS_NAILGUN_AMMO

```ml
const QGR_KEY_ROUNDS_NAILGUN_AMMO = 1111030901
```

Ranking-report key used to identify rounds nailgun ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L443)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-prox-launcher-ammo-const-qgr-key-rounds-prox-launcher-ammo-1111031001-src-mq3-game-game-internal-headers-ml-1741358918"></a>
### QGR_KEY_ROUNDS_PROX_LAUNCHER_AMMO

```ml
const QGR_KEY_ROUNDS_PROX_LAUNCHER_AMMO = 1111031001
```

Ranking-report key used to identify rounds prox launcher ammo statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L447)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-rockets-const-qgr-key-rounds-rockets-1111030401-src-mq3-game-game-internal-headers-ml-1620491901"></a>
### QGR_KEY_ROUNDS_ROCKETS

```ml
const QGR_KEY_ROUNDS_ROCKETS = 1111030401
```

Ranking-report key used to identify rounds rockets statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L423)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-shells-const-qgr-key-rounds-shells-1111030201-src-mq3-game-game-internal-headers-ml-841742389"></a>
### QGR_KEY_ROUNDS_SHELLS

```ml
const QGR_KEY_ROUNDS_SHELLS = 1111030201
```

Ranking-report key used to identify rounds shells statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L415)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-rounds-slugs-const-qgr-key-rounds-slugs-1111030601-src-mq3-game-game-internal-headers-ml-489501041"></a>
### QGR_KEY_ROUNDS_SLUGS

```ml
const QGR_KEY_ROUNDS_SLUGS = 1111030601
```

Ranking-report key used to identify rounds slugs statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L431)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-scout-const-qgr-key-scout-1111160800-src-mq3-game-game-internal-headers-ml-1874832162"></a>
### QGR_KEY_SCOUT

```ml
const QGR_KEY_SCOUT = 1111160800
```

Ranking-report key used to identify scout statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L489)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-const-qgr-key-shot-fired-1111020002-src-mq3-game-game-internal-headers-ml-586168691"></a>
### QGR_KEY_SHOT_FIRED

```ml
const QGR_KEY_SHOT_FIRED = 1111020002
```

Ranking-report key for shots fired.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L79)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-bfg-const-qgr-key-shot-fired-bfg-1111020902-src-mq3-game-game-internal-headers-ml-665280968"></a>
### QGR_KEY_SHOT_FIRED_BFG

```ml
const QGR_KEY_SHOT_FIRED_BFG = 1111020902
```

Ranking-report key for shots fired associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L277)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-chaingun-const-qgr-key-shot-fired-chaingun-1111021402-src-mq3-game-game-internal-headers-ml-1973439956"></a>
### QGR_KEY_SHOT_FIRED_CHAINGUN

```ml
const QGR_KEY_SHOT_FIRED_CHAINGUN = 1111021402
```

Ranking-report key for shots fired associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L387)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-gauntlet-const-qgr-key-shot-fired-gauntlet-1111020102-src-mq3-game-game-internal-headers-ml-65925022"></a>
### QGR_KEY_SHOT_FIRED_GAUNTLET

```ml
const QGR_KEY_SHOT_FIRED_GAUNTLET = 1111020102
```

Ranking-report key for shots fired associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L101)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-grapple-const-qgr-key-shot-fired-grapple-1111021002-src-mq3-game-game-internal-headers-ml-668193622"></a>
### QGR_KEY_SHOT_FIRED_GRAPPLE

```ml
const QGR_KEY_SHOT_FIRED_GRAPPLE = 1111021002
```

Ranking-report key for shots fired associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L299)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-grenade-const-qgr-key-shot-fired-grenade-1111020402-src-mq3-game-game-internal-headers-ml-1581655901"></a>
### QGR_KEY_SHOT_FIRED_GRENADE

```ml
const QGR_KEY_SHOT_FIRED_GRENADE = 1111020402
```

Ranking-report key for shots fired associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L167)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-lightning-const-qgr-key-shot-fired-lightning-1111020802-src-mq3-game-game-internal-headers-ml-1207269229"></a>
### QGR_KEY_SHOT_FIRED_LIGHTNING

```ml
const QGR_KEY_SHOT_FIRED_LIGHTNING = 1111020802
```

Ranking-report key for shots fired associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L255)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-machinegun-const-qgr-key-shot-fired-machinegun-1111020202-src-mq3-game-game-internal-headers-ml-116592399"></a>
### QGR_KEY_SHOT_FIRED_MACHINEGUN

```ml
const QGR_KEY_SHOT_FIRED_MACHINEGUN = 1111020202
```

Ranking-report key for shots fired associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L123)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-nailgin-const-qgr-key-shot-fired-nailgin-1111021202-src-mq3-game-game-internal-headers-ml-1923408054"></a>
### QGR_KEY_SHOT_FIRED_NAILGIN

```ml
const QGR_KEY_SHOT_FIRED_NAILGIN = 1111021202
```

Ranking-report key for shots fired associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L343)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-plasma-const-qgr-key-shot-fired-plasma-1111020602-src-mq3-game-game-internal-headers-ml-1140318111"></a>
### QGR_KEY_SHOT_FIRED_PLASMA

```ml
const QGR_KEY_SHOT_FIRED_PLASMA = 1111020602
```

Ranking-report key for shots fired associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L211)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-prox-launcher-const-qgr-key-shot-fired-prox-launcher-1111021302-src-mq3-game-game-internal-headers-ml-787328117"></a>
### QGR_KEY_SHOT_FIRED_PROX_LAUNCHER

```ml
const QGR_KEY_SHOT_FIRED_PROX_LAUNCHER = 1111021302
```

Ranking-report key for shots fired associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L365)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-railgun-const-qgr-key-shot-fired-railgun-1111020702-src-mq3-game-game-internal-headers-ml-1822538624"></a>
### QGR_KEY_SHOT_FIRED_RAILGUN

```ml
const QGR_KEY_SHOT_FIRED_RAILGUN = 1111020702
```

Ranking-report key for shots fired associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L233)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-rocket-const-qgr-key-shot-fired-rocket-1111020502-src-mq3-game-game-internal-headers-ml-1469904894"></a>
### QGR_KEY_SHOT_FIRED_ROCKET

```ml
const QGR_KEY_SHOT_FIRED_ROCKET = 1111020502
```

Ranking-report key for shots fired associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L189)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-shotgun-const-qgr-key-shot-fired-shotgun-1111020302-src-mq3-game-game-internal-headers-ml-1842508240"></a>
### QGR_KEY_SHOT_FIRED_SHOTGUN

```ml
const QGR_KEY_SHOT_FIRED_SHOTGUN = 1111020302
```

Ranking-report key for shots fired associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L145)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-shot-fired-unknown-const-qgr-key-shot-fired-unknown-1111021102-src-mq3-game-game-internal-headers-ml-18884187"></a>
### QGR_KEY_SHOT_FIRED_UNKNOWN

```ml
const QGR_KEY_SHOT_FIRED_UNKNOWN = 1111021102
```

Ranking-report key for shots fired associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L321)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-slime-const-qgr-key-slime-1111080200-src-mq3-game-game-internal-headers-ml-1785991011"></a>
### QGR_KEY_SLIME

```ml
const QGR_KEY_SLIME = 1111080200
```

Ranking-report key used to identify slime statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L521)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-const-qgr-key-splash-given-1111020007-src-mq3-game-game-internal-headers-ml-100879656"></a>
### QGR_KEY_SPLASH_GIVEN

```ml
const QGR_KEY_SPLASH_GIVEN = 1111020007
```

Ranking-report key for splash damage dealt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L89)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-bfg-const-qgr-key-splash-given-bfg-1111020907-src-mq3-game-game-internal-headers-ml-288787119"></a>
### QGR_KEY_SPLASH_GIVEN_BFG

```ml
const QGR_KEY_SPLASH_GIVEN_BFG = 1111020907
```

Ranking-report key for splash damage dealt associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L287)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-chaingun-const-qgr-key-splash-given-chaingun-1111021407-src-mq3-game-game-internal-headers-ml-30239747"></a>
### QGR_KEY_SPLASH_GIVEN_CHAINGUN

```ml
const QGR_KEY_SPLASH_GIVEN_CHAINGUN = 1111021407
```

Ranking-report key for splash damage dealt associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L397)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-gauntlet-const-qgr-key-splash-given-gauntlet-1111020107-src-mq3-game-game-internal-headers-ml-575772289"></a>
### QGR_KEY_SPLASH_GIVEN_GAUNTLET

```ml
const QGR_KEY_SPLASH_GIVEN_GAUNTLET = 1111020107
```

Ranking-report key for splash damage dealt associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L111)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-grapple-const-qgr-key-splash-given-grapple-1111021007-src-mq3-game-game-internal-headers-ml-1366732765"></a>
### QGR_KEY_SPLASH_GIVEN_GRAPPLE

```ml
const QGR_KEY_SPLASH_GIVEN_GRAPPLE = 1111021007
```

Ranking-report key for splash damage dealt associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L309)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-grenade-const-qgr-key-splash-given-grenade-1111020407-src-mq3-game-game-internal-headers-ml-1312884610"></a>
### QGR_KEY_SPLASH_GIVEN_GRENADE

```ml
const QGR_KEY_SPLASH_GIVEN_GRENADE = 1111020407
```

Ranking-report key for splash damage dealt associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L177)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-lightning-const-qgr-key-splash-given-lightning-1111020807-src-mq3-game-game-internal-headers-ml-2123482062"></a>
### QGR_KEY_SPLASH_GIVEN_LIGHTNING

```ml
const QGR_KEY_SPLASH_GIVEN_LIGHTNING = 1111020807
```

Ranking-report key for splash damage dealt associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L265)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-machinegun-const-qgr-key-splash-given-machinegun-1111020207-src-mq3-game-game-internal-headers-ml-1376478712"></a>
### QGR_KEY_SPLASH_GIVEN_MACHINEGUN

```ml
const QGR_KEY_SPLASH_GIVEN_MACHINEGUN = 1111020207
```

Ranking-report key for splash damage dealt associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L133)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-nailgin-const-qgr-key-splash-given-nailgin-1111021207-src-mq3-game-game-internal-headers-ml-1008066689"></a>
### QGR_KEY_SPLASH_GIVEN_NAILGIN

```ml
const QGR_KEY_SPLASH_GIVEN_NAILGIN = 1111021207
```

Ranking-report key for splash damage dealt associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L353)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-plasma-const-qgr-key-splash-given-plasma-1111020607-src-mq3-game-game-internal-headers-ml-1755828296"></a>
### QGR_KEY_SPLASH_GIVEN_PLASMA

```ml
const QGR_KEY_SPLASH_GIVEN_PLASMA = 1111020607
```

Ranking-report key for splash damage dealt associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L221)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-prox-launcher-const-qgr-key-splash-given-prox-launcher-1111021307-src-mq3-game-game-internal-headers-ml-276593542"></a>
### QGR_KEY_SPLASH_GIVEN_PROX_LAUNCHER

```ml
const QGR_KEY_SPLASH_GIVEN_PROX_LAUNCHER = 1111021307
```

Ranking-report key for splash damage dealt associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L375)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-railgun-const-qgr-key-splash-given-railgun-1111020707-src-mq3-game-game-internal-headers-ml-1138610251"></a>
### QGR_KEY_SPLASH_GIVEN_RAILGUN

```ml
const QGR_KEY_SPLASH_GIVEN_RAILGUN = 1111020707
```

Ranking-report key for splash damage dealt associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L243)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-rocket-const-qgr-key-splash-given-rocket-1111020507-src-mq3-game-game-internal-headers-ml-2095301261"></a>
### QGR_KEY_SPLASH_GIVEN_ROCKET

```ml
const QGR_KEY_SPLASH_GIVEN_ROCKET = 1111020507
```

Ranking-report key for splash damage dealt associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L199)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-shotgun-const-qgr-key-splash-given-shotgun-1111020307-src-mq3-game-game-internal-headers-ml-1988549415"></a>
### QGR_KEY_SPLASH_GIVEN_SHOTGUN

```ml
const QGR_KEY_SPLASH_GIVEN_SHOTGUN = 1111020307
```

Ranking-report key for splash damage dealt associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L155)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-given-unknown-const-qgr-key-splash-given-unknown-1111021107-src-mq3-game-game-internal-headers-ml-924268300"></a>
### QGR_KEY_SPLASH_GIVEN_UNKNOWN

```ml
const QGR_KEY_SPLASH_GIVEN_UNKNOWN = 1111021107
```

Ranking-report key for splash damage dealt associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L331)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-const-qgr-key-splash-taken-1111020008-src-mq3-game-game-internal-headers-ml-2112749453"></a>
### QGR_KEY_SPLASH_TAKEN

```ml
const QGR_KEY_SPLASH_TAKEN = 1111020008
```

Ranking-report key for splash damage received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L91)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-bfg-const-qgr-key-splash-taken-bfg-1111020908-src-mq3-game-game-internal-headers-ml-1417994586"></a>
### QGR_KEY_SPLASH_TAKEN_BFG

```ml
const QGR_KEY_SPLASH_TAKEN_BFG = 1111020908
```

Ranking-report key for splash damage received associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L289)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-chaingun-const-qgr-key-splash-taken-chaingun-1111021408-src-mq3-game-game-internal-headers-ml-2140698862"></a>
### QGR_KEY_SPLASH_TAKEN_CHAINGUN

```ml
const QGR_KEY_SPLASH_TAKEN_CHAINGUN = 1111021408
```

Ranking-report key for splash damage received associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L399)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-gauntlet-const-qgr-key-splash-taken-gauntlet-1111020108-src-mq3-game-game-internal-headers-ml-2057930244"></a>
### QGR_KEY_SPLASH_TAKEN_GAUNTLET

```ml
const QGR_KEY_SPLASH_TAKEN_GAUNTLET = 1111020108
```

Ranking-report key for splash damage received associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L113)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-grapple-const-qgr-key-splash-taken-grapple-1111021008-src-mq3-game-game-internal-headers-ml-805349948"></a>
### QGR_KEY_SPLASH_TAKEN_GRAPPLE

```ml
const QGR_KEY_SPLASH_TAKEN_GRAPPLE = 1111021008
```

Ranking-report key for splash damage received associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L311)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-grenade-const-qgr-key-splash-taken-grenade-1111020408-src-mq3-game-game-internal-headers-ml-1830119419"></a>
### QGR_KEY_SPLASH_TAKEN_GRENADE

```ml
const QGR_KEY_SPLASH_TAKEN_GRENADE = 1111020408
```

Ranking-report key for splash damage received associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L179)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-lightning-const-qgr-key-splash-taken-lightning-1111020808-src-mq3-game-game-internal-headers-ml-1940849115"></a>
### QGR_KEY_SPLASH_TAKEN_LIGHTNING

```ml
const QGR_KEY_SPLASH_TAKEN_LIGHTNING = 1111020808
```

Ranking-report key for splash damage received associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L267)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-machinegun-const-qgr-key-splash-taken-machinegun-1111020208-src-mq3-game-game-internal-headers-ml-867680009"></a>
### QGR_KEY_SPLASH_TAKEN_MACHINEGUN

```ml
const QGR_KEY_SPLASH_TAKEN_MACHINEGUN = 1111020208
```

Ranking-report key for splash damage received associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L135)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-nailgin-const-qgr-key-splash-taken-nailgin-1111021208-src-mq3-game-game-internal-headers-ml-1291270996"></a>
### QGR_KEY_SPLASH_TAKEN_NAILGIN

```ml
const QGR_KEY_SPLASH_TAKEN_NAILGIN = 1111021208
```

Ranking-report key for splash damage received associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L355)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-plasma-const-qgr-key-splash-taken-plasma-1111020608-src-mq3-game-game-internal-headers-ml-644428665"></a>
### QGR_KEY_SPLASH_TAKEN_PLASMA

```ml
const QGR_KEY_SPLASH_TAKEN_PLASMA = 1111020608
```

Ranking-report key for splash damage received associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L223)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-prox-launcher-const-qgr-key-splash-taken-prox-launcher-1111021308-src-mq3-game-game-internal-headers-ml-1334956219"></a>
### QGR_KEY_SPLASH_TAKEN_PROX_LAUNCHER

```ml
const QGR_KEY_SPLASH_TAKEN_PROX_LAUNCHER = 1111021308
```

Ranking-report key for splash damage received associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L377)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-railgun-const-qgr-key-splash-taken-railgun-1111020708-src-mq3-game-game-internal-headers-ml-1576099042"></a>
### QGR_KEY_SPLASH_TAKEN_RAILGUN

```ml
const QGR_KEY_SPLASH_TAKEN_RAILGUN = 1111020708
```

Ranking-report key for splash damage received associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L245)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-rocket-const-qgr-key-splash-taken-rocket-1111020508-src-mq3-game-game-internal-headers-ml-1538468620"></a>
### QGR_KEY_SPLASH_TAKEN_ROCKET

```ml
const QGR_KEY_SPLASH_TAKEN_ROCKET = 1111020508
```

Ranking-report key for splash damage received associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L201)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-shotgun-const-qgr-key-splash-taken-shotgun-1111020308-src-mq3-game-game-internal-headers-ml-216272650"></a>
### QGR_KEY_SPLASH_TAKEN_SHOTGUN

```ml
const QGR_KEY_SPLASH_TAKEN_SHOTGUN = 1111020308
```

Ranking-report key for splash damage received associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L157)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-splash-taken-unknown-const-qgr-key-splash-taken-unknown-1111021108-src-mq3-game-game-internal-headers-ml-1732763517"></a>
### QGR_KEY_SPLASH_TAKEN_UNKNOWN

```ml
const QGR_KEY_SPLASH_TAKEN_UNKNOWN = 1111021108
```

Ranking-report key for splash damage received associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L333)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-const-qgr-key-suicide-1111020001-src-mq3-game-game-internal-headers-ml-1849230624"></a>
### QGR_KEY_SUICIDE

```ml
const QGR_KEY_SUICIDE = 1111020001
```

Ranking-report key for self-inflicted deaths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L77)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-bfg-const-qgr-key-suicide-bfg-1111020901-src-mq3-game-game-internal-headers-ml-1333500271"></a>
### QGR_KEY_SUICIDE_BFG

```ml
const QGR_KEY_SUICIDE_BFG = 1111020901
```

Ranking-report key for self-inflicted deaths associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L275)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-chaingun-const-qgr-key-suicide-chaingun-1111021401-src-mq3-game-game-internal-headers-ml-93243169"></a>
### QGR_KEY_SUICIDE_CHAINGUN

```ml
const QGR_KEY_SUICIDE_CHAINGUN = 1111021401
```

Ranking-report key for self-inflicted deaths associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L385)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-cmd-const-qgr-key-suicide-cmd-1111080700-src-mq3-game-game-internal-headers-ml-736231796"></a>
### QGR_KEY_SUICIDE_CMD

```ml
const QGR_KEY_SUICIDE_CMD = 1111080700
```

Ranking-report key for self-inflicted deaths associated with cmd.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L531)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-gauntlet-const-qgr-key-suicide-gauntlet-1111020101-src-mq3-game-game-internal-headers-ml-1234750697"></a>
### QGR_KEY_SUICIDE_GAUNTLET

```ml
const QGR_KEY_SUICIDE_GAUNTLET = 1111020101
```

Ranking-report key for self-inflicted deaths associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L99)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-grapple-const-qgr-key-suicide-grapple-1111021001-src-mq3-game-game-internal-headers-ml-1652546997"></a>
### QGR_KEY_SUICIDE_GRAPPLE

```ml
const QGR_KEY_SUICIDE_GRAPPLE = 1111021001
```

Ranking-report key for self-inflicted deaths associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L297)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-grenade-const-qgr-key-suicide-grenade-1111020401-src-mq3-game-game-internal-headers-ml-2122805476"></a>
### QGR_KEY_SUICIDE_GRENADE

```ml
const QGR_KEY_SUICIDE_GRENADE = 1111020401
```

Ranking-report key for self-inflicted deaths associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L165)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-lightning-const-qgr-key-suicide-lightning-1111020801-src-mq3-game-game-internal-headers-ml-1983597488"></a>
### QGR_KEY_SUICIDE_LIGHTNING

```ml
const QGR_KEY_SUICIDE_LIGHTNING = 1111020801
```

Ranking-report key for self-inflicted deaths associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L253)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-machinegun-const-qgr-key-suicide-machinegun-1111020201-src-mq3-game-game-internal-headers-ml-1867782194"></a>
### QGR_KEY_SUICIDE_MACHINEGUN

```ml
const QGR_KEY_SUICIDE_MACHINEGUN = 1111020201
```

Ranking-report key for self-inflicted deaths associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L121)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-nailgin-const-qgr-key-suicide-nailgin-1111021201-src-mq3-game-game-internal-headers-ml-2079088627"></a>
### QGR_KEY_SUICIDE_NAILGIN

```ml
const QGR_KEY_SUICIDE_NAILGIN = 1111021201
```

Ranking-report key for self-inflicted deaths associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L341)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-plasma-const-qgr-key-suicide-plasma-1111020601-src-mq3-game-game-internal-headers-ml-210277844"></a>
### QGR_KEY_SUICIDE_PLASMA

```ml
const QGR_KEY_SUICIDE_PLASMA = 1111020601
```

Ranking-report key for self-inflicted deaths associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L209)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-prox-launcher-const-qgr-key-suicide-prox-launcher-1111021301-src-mq3-game-game-internal-headers-ml-1911800368"></a>
### QGR_KEY_SUICIDE_PROX_LAUNCHER

```ml
const QGR_KEY_SUICIDE_PROX_LAUNCHER = 1111021301
```

Ranking-report key for self-inflicted deaths associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L363)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-railgun-const-qgr-key-suicide-railgun-1111020701-src-mq3-game-game-internal-headers-ml-1445806985"></a>
### QGR_KEY_SUICIDE_RAILGUN

```ml
const QGR_KEY_SUICIDE_RAILGUN = 1111020701
```

Ranking-report key for self-inflicted deaths associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L231)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-rocket-const-qgr-key-suicide-rocket-1111020501-src-mq3-game-game-internal-headers-ml-1239885769"></a>
### QGR_KEY_SUICIDE_ROCKET

```ml
const QGR_KEY_SUICIDE_ROCKET = 1111020501
```

Ranking-report key for self-inflicted deaths associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L187)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-shotgun-const-qgr-key-suicide-shotgun-1111020301-src-mq3-game-game-internal-headers-ml-233925581"></a>
### QGR_KEY_SUICIDE_SHOTGUN

```ml
const QGR_KEY_SUICIDE_SHOTGUN = 1111020301
```

Ranking-report key for self-inflicted deaths associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L143)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suicide-unknown-const-qgr-key-suicide-unknown-1111021101-src-mq3-game-game-internal-headers-ml-843194870"></a>
### QGR_KEY_SUICIDE_UNKNOWN

```ml
const QGR_KEY_SUICIDE_UNKNOWN = 1111021101
```

Ranking-report key for self-inflicted deaths associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L319)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-suit-const-qgr-key-suit-1111060200-src-mq3-game-game-internal-headers-ml-681410431"></a>
### QGR_KEY_SUIT

```ml
const QGR_KEY_SUIT = 1111060200
```

Ranking-report key used to identify suit statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L479)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-team-name-const-qgr-key-team-name-1100100007-src-mq3-game-game-internal-headers-ml-1222169763"></a>
### QGR_KEY_TEAM_NAME

```ml
const QGR_KEY_TEAM_NAME = 1100100007
```

Ranking-report key used to identify team name statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L555)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-damage-given-const-qgr-key-teammate-damage-given-1111100003-src-mq3-game-game-internal-headers-ml-35700573"></a>
### QGR_KEY_TEAMMATE_DAMAGE_GIVEN

```ml
const QGR_KEY_TEAMMATE_DAMAGE_GIVEN = 1111100003
```

Ranking-report key used to identify teammate damage given statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L547)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-damage-taken-const-qgr-key-teammate-damage-taken-1111100004-src-mq3-game-game-internal-headers-ml-34270144"></a>
### QGR_KEY_TEAMMATE_DAMAGE_TAKEN

```ml
const QGR_KEY_TEAMMATE_DAMAGE_TAKEN = 1111100004
```

Ranking-report key used to identify teammate damage taken statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L549)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-frag-const-qgr-key-teammate-frag-1211100000-src-mq3-game-game-internal-headers-ml-1088537325"></a>
### QGR_KEY_TEAMMATE_FRAG

```ml
const QGR_KEY_TEAMMATE_FRAG = 1211100000
```

Ranking-report key used to identify teammate frag statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L541)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-hit-given-const-qgr-key-teammate-hit-given-1111100001-src-mq3-game-game-internal-headers-ml-1105161151"></a>
### QGR_KEY_TEAMMATE_HIT_GIVEN

```ml
const QGR_KEY_TEAMMATE_HIT_GIVEN = 1111100001
```

Ranking-report key used to identify teammate hit given statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L543)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-hit-taken-const-qgr-key-teammate-hit-taken-1111100002-src-mq3-game-game-internal-headers-ml-937046894"></a>
### QGR_KEY_TEAMMATE_HIT_TAKEN

```ml
const QGR_KEY_TEAMMATE_HIT_TAKEN = 1111100002
```

Ranking-report key used to identify teammate hit taken statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L545)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-splash-given-const-qgr-key-teammate-splash-given-1111100005-src-mq3-game-game-internal-headers-ml-528604115"></a>
### QGR_KEY_TEAMMATE_SPLASH_GIVEN

```ml
const QGR_KEY_TEAMMATE_SPLASH_GIVEN = 1111100005
```

Ranking-report key used to identify teammate splash given statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L551)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teammate-splash-taken-const-qgr-key-teammate-splash-taken-1111100006-src-mq3-game-game-internal-headers-ml-110753494"></a>
### QGR_KEY_TEAMMATE_SPLASH_TAKEN

```ml
const QGR_KEY_TEAMMATE_SPLASH_TAKEN = 1111100006
```

Ranking-report key used to identify teammate splash taken statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L553)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-telefrag-const-qgr-key-telefrag-1111080500-src-mq3-game-game-internal-headers-ml-454528334"></a>
### QGR_KEY_TELEFRAG

```ml
const QGR_KEY_TELEFRAG = 1111080500
```

Ranking-report key used to identify telefrag statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L527)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teleporter-const-qgr-key-teleporter-1111070100-src-mq3-game-game-internal-headers-ml-701396799"></a>
### QGR_KEY_TELEPORTER

```ml
const QGR_KEY_TELEPORTER = 1111070100
```

Ranking-report key used to identify teleporter statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L501)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-teleporter-use-const-qgr-key-teleporter-use-1111070101-src-mq3-game-game-internal-headers-ml-856604412"></a>
### QGR_KEY_TELEPORTER_USE

```ml
const QGR_KEY_TELEPORTER_USE = 1111070101
```

Ranking-report key used to identify teleporter use statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L503)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-const-qgr-key-time-1111020010-src-mq3-game-game-internal-headers-ml-36872460"></a>
### QGR_KEY_TIME

```ml
const QGR_KEY_TIME = 1111020010
```

Ranking-report key for time spent using the tracked item or weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L95)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-bfg-const-qgr-key-time-bfg-1111020910-src-mq3-game-game-internal-headers-ml-1860980151"></a>
### QGR_KEY_TIME_BFG

```ml
const QGR_KEY_TIME_BFG = 1111020910
```

Ranking-report key for time spent using the tracked item or weapon associated with BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L293)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-chaingun-const-qgr-key-time-chaingun-1111021410-src-mq3-game-game-internal-headers-ml-54066995"></a>
### QGR_KEY_TIME_CHAINGUN

```ml
const QGR_KEY_TIME_CHAINGUN = 1111021410
```

Ranking-report key for time spent using the tracked item or weapon associated with chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L403)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-gauntlet-const-qgr-key-time-gauntlet-1111020110-src-mq3-game-game-internal-headers-ml-783570425"></a>
### QGR_KEY_TIME_GAUNTLET

```ml
const QGR_KEY_TIME_GAUNTLET = 1111020110
```

Ranking-report key for time spent using the tracked item or weapon associated with gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L117)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-grapple-const-qgr-key-time-grapple-1111021010-src-mq3-game-game-internal-headers-ml-1011186201"></a>
### QGR_KEY_TIME_GRAPPLE

```ml
const QGR_KEY_TIME_GRAPPLE = 1111021010
```

Ranking-report key for time spent using the tracked item or weapon associated with grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L315)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-grenade-const-qgr-key-time-grenade-1111020410-src-mq3-game-game-internal-headers-ml-1281976726"></a>
### QGR_KEY_TIME_GRENADE

```ml
const QGR_KEY_TIME_GRENADE = 1111020410
```

Ranking-report key for time spent using the tracked item or weapon associated with grenade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L183)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-lightning-const-qgr-key-time-lightning-1111020810-src-mq3-game-game-internal-headers-ml-1611108330"></a>
### QGR_KEY_TIME_LIGHTNING

```ml
const QGR_KEY_TIME_LIGHTNING = 1111020810
```

Ranking-report key for time spent using the tracked item or weapon associated with lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L271)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-machinegun-const-qgr-key-time-machinegun-1111020210-src-mq3-game-game-internal-headers-ml-499535012"></a>
### QGR_KEY_TIME_MACHINEGUN

```ml
const QGR_KEY_TIME_MACHINEGUN = 1111020210
```

Ranking-report key for time spent using the tracked item or weapon associated with machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L139)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-nailgin-const-qgr-key-time-nailgin-1111021210-src-mq3-game-game-internal-headers-ml-1159838033"></a>
### QGR_KEY_TIME_NAILGIN

```ml
const QGR_KEY_TIME_NAILGIN = 1111021210
```

Ranking-report key for time spent using the tracked item or weapon associated with nailgin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L359)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-plasma-const-qgr-key-time-plasma-1111020610-src-mq3-game-game-internal-headers-ml-868114696"></a>
### QGR_KEY_TIME_PLASMA

```ml
const QGR_KEY_TIME_PLASMA = 1111020610
```

Ranking-report key for time spent using the tracked item or weapon associated with plasma.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L227)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-prox-launcher-const-qgr-key-time-prox-launcher-1111021310-src-mq3-game-game-internal-headers-ml-1903928506"></a>
### QGR_KEY_TIME_PROX_LAUNCHER

```ml
const QGR_KEY_TIME_PROX_LAUNCHER = 1111021310
```

Ranking-report key for time spent using the tracked item or weapon associated with prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L381)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-railgun-const-qgr-key-time-railgun-1111020710-src-mq3-game-game-internal-headers-ml-1994016623"></a>
### QGR_KEY_TIME_RAILGUN

```ml
const QGR_KEY_TIME_RAILGUN = 1111020710
```

Ranking-report key for time spent using the tracked item or weapon associated with railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L249)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-rocket-const-qgr-key-time-rocket-1111020510-src-mq3-game-game-internal-headers-ml-430133533"></a>
### QGR_KEY_TIME_ROCKET

```ml
const QGR_KEY_TIME_ROCKET = 1111020510
```

Ranking-report key for time spent using the tracked item or weapon associated with rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L205)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-shotgun-const-qgr-key-time-shotgun-1111020310-src-mq3-game-game-internal-headers-ml-2024560603"></a>
### QGR_KEY_TIME_SHOTGUN

```ml
const QGR_KEY_TIME_SHOTGUN = 1111020310
```

Ranking-report key for time spent using the tracked item or weapon associated with shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L161)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-time-unknown-const-qgr-key-time-unknown-1111021110-src-mq3-game-game-internal-headers-ml-1115310116"></a>
### QGR_KEY_TIME_UNKNOWN

```ml
const QGR_KEY_TIME_UNKNOWN = 1111021110
```

Ranking-report key for time spent using the tracked item or weapon associated with unknown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L337)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-timelimit-const-qgr-key-timelimit-1010010005-src-mq3-game-game-internal-headers-ml-665947437"></a>
### QGR_KEY_TIMELIMIT

```ml
const QGR_KEY_TIMELIMIT = 1010010005
```

Ranking-report key used to identify time limit statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L61)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-trigger-hurt-const-qgr-key-trigger-hurt-1111080800-src-mq3-game-game-internal-headers-ml-98730421"></a>
### QGR_KEY_TRIGGER_HURT

```ml
const QGR_KEY_TRIGGER_HURT = 1111080800
```

Ranking-report key used to identify trigger hurt statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L533)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-version-const-qgr-key-version-1000010011-src-mq3-game-game-internal-headers-ml-660666677"></a>
### QGR_KEY_VERSION

```ml
const QGR_KEY_VERSION = 1000010011
```

Ranking-report key used to identify version statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L73)

<a id="constant-constant-mq3-game-game-internal-headers-qgr-key-water-const-qgr-key-water-1111080100-src-mq3-game-game-internal-headers-ml-328650770"></a>
### QGR_KEY_WATER

```ml
const QGR_KEY_WATER = 1111080100
```

Ranking-report key used to identify water statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L519)

<a id="function-function-mq3-game-game-internal-headers-rankingkeynames-function-rankingkeynames-src-mq3-game-game-internal-headers-ml-1489576"></a>
### rankingKeyNames

```ml
function rankingKeyNames()
```

Return the ordered ranking key names table for game internal headers: 257 entries beginning with `"QGR_KEY_MATCH_RATING"` and `"QGR_KEY_PLAYED_WITH"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L578)

<a id="function-function-mq3-game-game-internal-headers-rankingkeyvalues-function-rankingkeyvalues-src-mq3-game-game-internal-headers-ml-42463342"></a>
### rankingKeyValues

```ml
function rankingKeyValues()
```

Return the ordered ranking key values table for game internal headers: 257 entries beginning with `QGR_KEY_MATCH_RATING` and `QGR_KEY_PLAYED_WITH`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L580)

<a id="constant-constant-mq3-game-game-internal-headers-schar-max-const-schar-max-127-src-mq3-game-game-internal-headers-ml-270670787"></a>
### SCHAR_MAX

```ml
const SCHAR_MAX = 127
```

Maximum signed 8-bit character value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L11)

<a id="constant-constant-mq3-game-game-internal-headers-schar-min-const-schar-min-128-src-mq3-game-game-internal-headers-ml-1997143357"></a>
### SCHAR_MIN

```ml
const SCHAR_MIN = -128
```

Minimum signed 8-bit character value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L9)

<a id="constant-constant-mq3-game-game-internal-headers-shrt-max-const-shrt-max-32767-src-mq3-game-game-internal-headers-ml-1869955748"></a>
### SHRT_MAX

```ml
const SHRT_MAX = 32767
```

Maximum signed 16-bit short value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L17)

<a id="constant-constant-mq3-game-game-internal-headers-shrt-min-const-shrt-min-32768-src-mq3-game-game-internal-headers-ml-869564174"></a>
### SHRT_MIN

```ml
const SHRT_MIN = -32768
```

Minimum signed 16-bit short value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L15)

<a id="constant-constant-mq3-game-game-internal-headers-stepsize-const-stepsize-18-src-mq3-game-game-internal-headers-ml-503105248"></a>
### STEPSIZE

```ml
const STEPSIZE = 18
```

Maximum vertical stair step attempted by player movement, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L36)

<a id="constant-constant-mq3-game-game-internal-headers-timer-gesture-const-timer-gesture-2294-src-mq3-game-game-internal-headers-ml-494082708"></a>
### TIMER_GESTURE

```ml
const TIMER_GESTURE = 2294
```

Gesture animation duration in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L42)

<a id="constant-constant-mq3-game-game-internal-headers-timer-land-const-timer-land-130-src-mq3-game-game-internal-headers-ml-1067797459"></a>
### TIMER_LAND

```ml
const TIMER_LAND = 130
```

Movement lockout duration in milliseconds after a qualifying landing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L40)

<a id="constant-constant-mq3-game-game-internal-headers-uchar-max-const-uchar-max-255-src-mq3-game-game-internal-headers-ml-1243007831"></a>
### UCHAR_MAX

```ml
const UCHAR_MAX = 255
```

Maximum unsigned 8-bit character value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L13)

<a id="constant-constant-mq3-game-game-internal-headers-uint-max-const-uint-max-1-src-mq3-game-game-internal-headers-ml-199996907"></a>
### UINT_MAX

```ml
const UINT_MAX = -1
```

All-one 32-bit mask representing the original unsigned integer maximum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L25)

<a id="constant-constant-mq3-game-game-internal-headers-ulong-max-const-ulong-max-1-src-mq3-game-game-internal-headers-ml-2091904003"></a>
### ULONG_MAX

```ml
const ULONG_MAX = -1
```

All-one 32-bit mask representing the original unsigned integer maximum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L31)

<a id="constant-constant-mq3-game-game-internal-headers-ushrt-max-const-ushrt-max-65535-src-mq3-game-game-internal-headers-ml-1288223163"></a>
### USHRT_MAX

```ml
const USHRT_MAX = 65535
```

Maximum unsigned 16-bit short value in the original game ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/game_internal_headers.ml#L19)
