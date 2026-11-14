# `src/mq3/game/bot_combat_ai.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_combat_ai`](Package-mq3-game-bot-combat-ai-1347546627.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_ai_headers.ml` as `aiheaders` → [src/mq3/game/bot_ai_headers.ml](File-src-mq3-game-bot-ai-headers-ml-1280419323.md)
- `mq3/game/bot_input.ml` as `input` → [src/mq3/game/bot_input.ml](File-src-mq3-game-bot-input-ml-1155152552.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-bot-combat-ai-aggression-function-aggression-bot-src-mq3-game-bot-combat-ai-ml-814827095"></a>
### aggression

```ml
function aggression(bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L127)

<a id="function-function-mq3-game-bot-combat-ai-aimatenemy-function-aimatenemy-services-bot-src-mq3-game-bot-combat-ai-ml-356293415"></a>
### aimAtEnemy

```ml
function aimAtEnemy(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L251)

<a id="function-function-mq3-game-bot-combat-ai-attackmove-function-attackmove-services-bot-tfl-src-mq3-game-bot-combat-ai-ml-276255109"></a>
### attackMove

```ml
function attackMove(services, bot, tfl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L292)

<a id="constant-constant-mq3-game-bot-combat-ai-bfl-attacked-const-bfl-attacked-aiheaders-bfl-attacked-src-mq3-game-bot-combat-ai-ml-1350741853"></a>
### BFL_ATTACKED

```ml
const BFL_ATTACKED = aiheaders.BFL_ATTACKED
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L50)

<a id="constant-constant-mq3-game-bot-combat-ai-bfl-straferight-const-bfl-straferight-aiheaders-bfl-straferight-src-mq3-game-bot-combat-ai-ml-1433337497"></a>
### BFL_STRAFERIGHT

```ml
const BFL_STRAFERIGHT = aiheaders.BFL_STRAFERIGHT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L59)

<a id="function-function-mq3-game-bot-combat-ai-canandwantstorocketjump-function-canandwantstorocketjump-services-bot-src-mq3-game-bot-combat-ai-ml-65456313"></a>
### canAndWantsToRocketJump

```ml
function canAndWantsToRocketJump(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L163)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-aim-accuracy-const-characteristic-aim-accuracy-headers-characteristic-aim-accuracy-src-mq3-game-bot-combat-ai-ml-921030066"></a>
### CHARACTERISTIC_AIM_ACCURACY

```ml
const CHARACTERISTIC_AIM_ACCURACY = headers.CHARACTERISTIC_AIM_ACCURACY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L45)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-aim-skill-const-characteristic-aim-skill-headers-characteristic-aim-skill-src-mq3-game-bot-combat-ai-ml-1919412600"></a>
### CHARACTERISTIC_AIM_SKILL

```ml
const CHARACTERISTIC_AIM_SKILL = headers.CHARACTERISTIC_AIM_SKILL
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L46)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-alertness-const-characteristic-alertness-headers-characteristic-alertness-src-mq3-game-bot-combat-ai-ml-2001197710"></a>
### CHARACTERISTIC_ALERTNESS

```ml
const CHARACTERISTIC_ALERTNESS = headers.CHARACTERISTIC_ALERTNESS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L48)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-attack-skill-const-characteristic-attack-skill-headers-characteristic-attack-skill-src-mq3-game-bot-combat-ai-ml-943822263"></a>
### CHARACTERISTIC_ATTACK_SKILL

```ml
const CHARACTERISTIC_ATTACK_SKILL = headers.CHARACTERISTIC_ATTACK_SKILL
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L53)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-croucher-const-characteristic-croucher-headers-characteristic-croucher-src-mq3-game-bot-combat-ai-ml-709506452"></a>
### CHARACTERISTIC_CROUCHER

```ml
const CHARACTERISTIC_CROUCHER = headers.CHARACTERISTIC_CROUCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L55)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-easy-fragger-const-characteristic-easy-fragger-headers-characteristic-easy-fragger-src-mq3-game-bot-combat-ai-ml-86043470"></a>
### CHARACTERISTIC_EASY_FRAGGER

```ml
const CHARACTERISTIC_EASY_FRAGGER = headers.CHARACTERISTIC_EASY_FRAGGER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L47)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-firethrottle-const-characteristic-firethrottle-headers-characteristic-firethrottle-src-mq3-game-bot-combat-ai-ml-1860662341"></a>
### CHARACTERISTIC_FIRETHROTTLE

```ml
const CHARACTERISTIC_FIRETHROTTLE = headers.CHARACTERISTIC_FIRETHROTTLE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L49)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-jumper-const-characteristic-jumper-headers-characteristic-jumper-src-mq3-game-bot-combat-ai-ml-600115742"></a>
### CHARACTERISTIC_JUMPER

```ml
const CHARACTERISTIC_JUMPER = headers.CHARACTERISTIC_JUMPER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L54)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-reactiontime-const-characteristic-reactiontime-headers-characteristic-reactiontime-src-mq3-game-bot-combat-ai-ml-1146693311"></a>
### CHARACTERISTIC_REACTIONTIME

```ml
const CHARACTERISTIC_REACTIONTIME = headers.CHARACTERISTIC_REACTIONTIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L44)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-weaponjumping-const-characteristic-weaponjumping-headers-characteristic-weaponjumping-src-mq3-game-bot-combat-ai-ml-310132349"></a>
### CHARACTERISTIC_WEAPONJUMPING

```ml
const CHARACTERISTIC_WEAPONJUMPING = headers.CHARACTERISTIC_WEAPONJUMPING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L43)

<a id="function-function-mq3-game-bot-combat-ai-checkattack-function-checkattack-services-bot-src-mq3-game-bot-combat-ai-ml-54747423"></a>
### checkAttack

```ml
function checkAttack(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L273)

- [mq3.game.bot_combat_ai.CombatGoal](Type-mq3-game-bot-combat-ai-combatgoal-332171648.md) — struct
<a id="constant-constant-mq3-game-bot-combat-ai-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-combat-ai-ml-781553414"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L20)

<a id="constant-constant-mq3-game-bot-combat-ai-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-combat-ai-ml-526460524"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L21)

<a id="function-function-mq3-game-bot-combat-ai-corneraim-function-corneraim-services-bot-weapon-aimskill-best-src-mq3-game-bot-combat-ai-ml-1178635259"></a>
### cornerAim

```ml
function cornerAim(services, bot, weapon, aimskill, best)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `aimskill` | `dynamic` | — |  |
| `best` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L244)

<a id="function-function-mq3-game-bot-combat-ai-create-function-create-src-mq3-game-bot-combat-ai-ml-591868426"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L94)

<a id="function-function-mq3-game-bot-combat-ai-ctfcarryingflag-function-ctfcarryingflag-services-bot-src-mq3-game-bot-combat-ai-ml-1370735599"></a>
### ctfCarryingFlag

```ml
function ctfCarryingFlag(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L107)

<a id="constant-constant-mq3-game-bot-combat-ai-damagetype-radial-const-damagetype-radial-2-src-mq3-game-bot-combat-ai-ml-2009952745"></a>
### DAMAGETYPE_RADIAL

```ml
const DAMAGETYPE_RADIAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L52)

<a id="constant-constant-mq3-game-bot-combat-ai-ef-firing-const-ef-firing-256-src-mq3-game-bot-combat-ai-ml-1189107006"></a>
### EF_FIRING

```ml
const EF_FIRING = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L18)

<a id="constant-constant-mq3-game-bot-combat-ai-ef-talk-const-ef-talk-4096-src-mq3-game-bot-combat-ai-ml-428052182"></a>
### EF_TALK

```ml
const EF_TALK = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L19)

<a id="constant-constant-mq3-game-bot-combat-ai-ef-teleport-bit-const-ef-teleport-bit-4-src-mq3-game-bot-combat-ai-ml-299941427"></a>
### EF_TELEPORT_BIT

```ml
const EF_TELEPORT_BIT = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L17)

<a id="function-function-mq3-game-bot-combat-ai-emptymoveresult-function-emptymoveresult-src-mq3-game-bot-combat-ai-ml-1721005148"></a>
### emptyMoveResult

```ml
function emptyMoveResult()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L291)

<a id="constant-constant-mq3-game-bot-combat-ai-enemy-height-const-enemy-height-headers-enemy-height-src-mq3-game-bot-combat-ai-ml-1132674225"></a>
### ENEMY_HEIGHT

```ml
const ENEMY_HEIGHT = headers.ENEMY_HEIGHT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L42)

<a id="constant-constant-mq3-game-bot-combat-ai-enemy-horizontal-dist-const-enemy-horizontal-dist-headers-enemy-horizontal-dist-src-mq3-game-bot-combat-ai-ml-316519041"></a>
### ENEMY_HORIZONTAL_DIST

```ml
const ENEMY_HORIZONTAL_DIST = headers.ENEMY_HORIZONTAL_DIST
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L41)

<a id="function-function-mq3-game-bot-combat-ai-entitycarriesflag-function-entitycarriesflag-entinfo-src-mq3-game-bot-combat-ai-ml-679602723"></a>
### entityCarriesFlag

```ml
function entityCarriesFlag(entinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L97)

<a id="function-function-mq3-game-bot-combat-ai-entityhasquad-function-entityhasquad-entinfo-src-mq3-game-bot-combat-ai-ml-541716387"></a>
### entityHasQuad

```ml
function entityHasQuad(entinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L106)

- [mq3.game.bot_combat_ai.EntityInfo](Type-mq3-game-bot-combat-ai-entityinfo-1001859596.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-entityischatting-function-entityischatting-entinfo-src-mq3-game-bot-combat-ai-ml-199540611"></a>
### entityIsChatting

```ml
function entityIsChatting(entinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L105)

<a id="function-function-mq3-game-bot-combat-ai-entityisinvisible-function-entityisinvisible-entinfo-src-mq3-game-bot-combat-ai-ml-1696769267"></a>
### entityIsInvisible

```ml
function entityIsInvisible(entinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L100)

<a id="function-function-mq3-game-bot-combat-ai-entityisshooting-function-entityisshooting-entinfo-src-mq3-game-bot-combat-ai-ml-2083960291"></a>
### entityIsShooting

```ml
function entityIsShooting(entinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L104)

<a id="function-function-mq3-game-bot-combat-ai-feelingbad-function-feelingbad-bot-src-mq3-game-bot-combat-ai-ml-889139163"></a>
### feelingBad

```ml
function feelingBad(bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L142)

<a id="function-function-mq3-game-bot-combat-ai-findenemy-function-findenemy-services-bot-curenemy-src-mq3-game-bot-combat-ai-ml-1016381799"></a>
### findEnemy

```ml
function findEnemy(services, bot, curenemy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `curenemy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L186)

<a id="constant-constant-mq3-game-bot-combat-ai-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-combat-ai-ml-618156115"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L13)

<a id="constant-constant-mq3-game-bot-combat-ai-gt-team-const-gt-team-3-src-mq3-game-bot-combat-ai-ml-1168255662"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L12)

<a id="function-function-mq3-game-bot-combat-ai-infieldofvision-function-infieldofvision-viewangles-fov-angles-src-mq3-game-bot-combat-ai-ml-1169554844"></a>
### inFieldOfVision

```ml
function inFieldOfVision(viewangles, fov, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewangles` | `dynamic` | — |  |
| `fov` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L171)

<a id="function-function-mq3-game-bot-combat-ai-inlavaorslime-function-inlavaorslime-services-bot-src-mq3-game-bot-combat-ai-ml-1023866007"></a>
### inLavaOrSlime

```ml
function inLavaOrSlime(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L123)

<a id="function-function-mq3-game-bot-combat-ai-intermission-function-intermission-services-bot-src-mq3-game-bot-combat-ai-ml-1457714843"></a>
### intermission

```ml
function intermission(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L119)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-armor-const-inventory-armor-headers-inventory-armor-src-mq3-game-bot-combat-ai-ml-438090967"></a>
### INVENTORY_ARMOR

```ml
const INVENTORY_ARMOR = headers.INVENTORY_ARMOR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L22)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-bot-combat-ai-ml-34731015"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L29)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-bot-combat-ai-ml-1398542611"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L36)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-blueflag-const-inventory-blueflag-headers-inventory-blueflag-src-mq3-game-bot-combat-ai-ml-168328026"></a>
### INVENTORY_BLUEFLAG

```ml
const INVENTORY_BLUEFLAG = headers.INVENTORY_BLUEFLAG
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L40)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-cells-const-inventory-cells-headers-inventory-cells-src-mq3-game-bot-combat-ai-ml-2121459941"></a>
### INVENTORY_CELLS

```ml
const INVENTORY_CELLS = headers.INVENTORY_CELLS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L32)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-grenadelauncher-const-inventory-grenadelauncher-headers-inventory-grenadelauncher-src-mq3-game-bot-combat-ai-ml-1151268302"></a>
### INVENTORY_GRENADELAUNCHER

```ml
const INVENTORY_GRENADELAUNCHER = headers.INVENTORY_GRENADELAUNCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L24)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-grenades-const-inventory-grenades-headers-inventory-grenades-src-mq3-game-bot-combat-ai-ml-1336969417"></a>
### INVENTORY_GRENADES

```ml
const INVENTORY_GRENADES = headers.INVENTORY_GRENADES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L31)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-health-const-inventory-health-headers-inventory-health-src-mq3-game-bot-combat-ai-ml-1938071946"></a>
### INVENTORY_HEALTH

```ml
const INVENTORY_HEALTH = headers.INVENTORY_HEALTH
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L37)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-lightning-const-inventory-lightning-headers-inventory-lightning-src-mq3-game-bot-combat-ai-ml-106961902"></a>
### INVENTORY_LIGHTNING

```ml
const INVENTORY_LIGHTNING = headers.INVENTORY_LIGHTNING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L26)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-lightningammo-const-inventory-lightningammo-headers-inventory-lightningammo-src-mq3-game-bot-combat-ai-ml-124392408"></a>
### INVENTORY_LIGHTNINGAMMO

```ml
const INVENTORY_LIGHTNINGAMMO = headers.INVENTORY_LIGHTNINGAMMO
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L33)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-plasmagun-const-inventory-plasmagun-headers-inventory-plasmagun-src-mq3-game-bot-combat-ai-ml-561691440"></a>
### INVENTORY_PLASMAGUN

```ml
const INVENTORY_PLASMAGUN = headers.INVENTORY_PLASMAGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L28)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-quad-const-inventory-quad-headers-inventory-quad-src-mq3-game-bot-combat-ai-ml-622227549"></a>
### INVENTORY_QUAD

```ml
const INVENTORY_QUAD = headers.INVENTORY_QUAD
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L38)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-bot-combat-ai-ml-1623129686"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L27)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-redflag-const-inventory-redflag-headers-inventory-redflag-src-mq3-game-bot-combat-ai-ml-78480841"></a>
### INVENTORY_REDFLAG

```ml
const INVENTORY_REDFLAG = headers.INVENTORY_REDFLAG
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L39)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-bot-combat-ai-ml-1700020448"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L25)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-rockets-const-inventory-rockets-headers-inventory-rockets-src-mq3-game-bot-combat-ai-ml-202377053"></a>
### INVENTORY_ROCKETS

```ml
const INVENTORY_ROCKETS = headers.INVENTORY_ROCKETS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L34)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-shells-const-inventory-shells-headers-inventory-shells-src-mq3-game-bot-combat-ai-ml-1404878325"></a>
### INVENTORY_SHELLS

```ml
const INVENTORY_SHELLS = headers.INVENTORY_SHELLS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L30)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-shotgun-const-inventory-shotgun-headers-inventory-shotgun-src-mq3-game-bot-combat-ai-ml-670973238"></a>
### INVENTORY_SHOTGUN

```ml
const INVENTORY_SHOTGUN = headers.INVENTORY_SHOTGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L23)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-bot-combat-ai-ml-253961308"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L35)

<a id="function-function-mq3-game-bot-combat-ai-isdead-function-isdead-bot-src-mq3-game-bot-combat-ai-ml-1410869815"></a>
### isDead

```ml
function isDead(bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L118)

<a id="function-function-mq3-game-bot-combat-ai-lengthsquared-function-lengthsquared-v-src-mq3-game-bot-combat-ai-ml-2121526440"></a>
### lengthSquared

```ml
function lengthSquared(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L183)

<a id="constant-constant-mq3-game-bot-combat-ai-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-combat-ai-ml-1715451599"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L14)

<a id="constant-constant-mq3-game-bot-combat-ai-move-crouch-const-move-crouch-2-src-mq3-game-bot-combat-ai-ml-75270149"></a>
### MOVE_CROUCH

```ml
const MOVE_CROUCH = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L57)

<a id="constant-constant-mq3-game-bot-combat-ai-move-jump-const-move-jump-8-src-mq3-game-bot-combat-ai-ml-250780047"></a>
### MOVE_JUMP

```ml
const MOVE_JUMP = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L58)

<a id="constant-constant-mq3-game-bot-combat-ai-move-walk-const-move-walk-1-src-mq3-game-bot-combat-ai-ml-1908311576"></a>
### MOVE_WALK

```ml
const MOVE_WALK = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L56)

- [mq3.game.bot_combat_ai.MoveResult](Type-mq3-game-bot-combat-ai-moveresult-1927036711.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-now-function-now-services-src-mq3-game-bot-combat-ai-ml-86218266"></a>
### now

```ml
function now(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L184)

<a id="function-function-mq3-game-bot-combat-ai-projectileaim-function-projectileaim-services-bot-ent-weapon-aimskill-best-src-mq3-game-bot-combat-ai-ml-1554077688"></a>
### projectileAim

```ml
function projectileAim(services, bot, ent, weapon, aimskill, best)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `aimskill` | `dynamic` | — |  |
| `best` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L217)

- [mq3.game.bot_combat_ai.Services](Type-mq3-game-bot-combat-ai-services-1566822539.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-setteleporttime-function-setteleporttime-services-bot-src-mq3-game-bot-combat-ai-ml-270743067"></a>
### setTeleportTime

```ml
function setTeleportTime(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L114)

<a id="function-function-mq3-game-bot-combat-ai-splashgroundaim-function-splashgroundaim-services-bot-ent-start-best-src-mq3-game-bot-combat-ai-ml-645596250"></a>
### splashGroundAim

```ml
function splashGroundAim(services, bot, ent, start, best)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `best` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L233)

<a id="function-function-mq3-game-bot-combat-ai-subtract-function-subtract-a-b-src-mq3-game-bot-combat-ai-ml-554455547"></a>
### subtract

```ml
function subtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L182)

- [mq3.game.bot_combat_ai.TargetEntityInfo](Type-mq3-game-bot-combat-ai-targetentityinfo-54412113.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-teamplayison-function-teamplayison-services-src-mq3-game-bot-combat-ai-ml-444516074"></a>
### teamPlayIsOn

```ml
function teamPlayIsOn(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L113)

- [mq3.game.bot_combat_ai.Trace](Type-mq3-game-bot-combat-ai-trace-1845261636.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-wantstochase-function-wantstochase-services-bot-src-mq3-game-bot-combat-ai-ml-766303659"></a>
### wantsToChase

```ml
function wantsToChase(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L155)

<a id="function-function-mq3-game-bot-combat-ai-wantstoretreat-function-wantstoretreat-services-bot-src-mq3-game-bot-combat-ai-ml-1844676567"></a>
### wantsToRetreat

```ml
function wantsToRetreat(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L149)

- [mq3.game.bot_combat_ai.WeaponInfo](Type-mq3-game-bot-combat-ai-weaponinfo-1909029331.md) — struct
<a id="constant-constant-mq3-game-bot-combat-ai-wfl-firereleased-const-wfl-firereleased-1-src-mq3-game-bot-combat-ai-ml-1382322300"></a>
### WFL_FIRERELEASED

```ml
const WFL_FIRERELEASED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L51)

<a id="constant-constant-mq3-game-bot-combat-ai-wp-gauntlet-const-wp-gauntlet-1-src-mq3-game-bot-combat-ai-ml-1396107120"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L15)

<a id="constant-constant-mq3-game-bot-combat-ai-wp-machinegun-const-wp-machinegun-2-src-mq3-game-bot-combat-ai-ml-108443225"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L16)
