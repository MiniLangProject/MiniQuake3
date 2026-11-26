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

Estimate combat aggression from the bot's health, armor, powerups, ammunition and enemy height.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory` and `weaponnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L316)

<a id="function-function-mq3-game-bot-combat-ai-aimatenemy-function-aimatenemy-services-bot-src-mq3-game-bot-combat-ai-ml-356293415"></a>
### aimAtEnemy

```ml
function aimAtEnemy(services, bot)
```

Update `bot.aimTarget` and `bot.idealViewangles` during `aimAtEnemy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityInfoFn`, `characteristicFloatFn`, `weaponInfoFn`, `visibleFn` and `traceFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `aimTarget`, `idealViewangles`, `eye` and `character` and related fields. May update `bot.aimTarget` and `bot.idealViewangles` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L488)

<a id="function-function-mq3-game-bot-combat-ai-attackmove-function-attackmove-services-bot-tfl-src-mq3-game-bot-combat-ai-ml-276255109"></a>
### attackMove

```ml
function attackMove(services, bot, tfl)
```

Update `bot.attackcrouchTime`, `bot.attackjumpTime`, `bot.attackstrafeTime` and `bot.combatFlags` during `attackMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `setupMovementFn`, `moveToGoalFn`, `characteristicFloatFn`, `entityInfoFn` and `randomFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `attackchaseTime`, `lastEnemyAreaNum`, `lastEnemyOrigin` and `ms` and related fields. May update `bot.attackcrouchTime`, `bot.attackjumpTime` and `bot.attackstrafeTime` and additional fields in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L537)

<a id="constant-constant-mq3-game-bot-combat-ai-bfl-attacked-const-bfl-attacked-aiheaders-bfl-attacked-src-mq3-game-bot-combat-ai-ml-1350741853"></a>
### BFL_ATTACKED

```ml
const BFL_ATTACKED = aiheaders.BFL_ATTACKED
```

Bot-state flag marking attacked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L94)

<a id="constant-constant-mq3-game-bot-combat-ai-bfl-straferight-const-bfl-straferight-aiheaders-bfl-straferight-src-mq3-game-bot-combat-ai-ml-1433337497"></a>
### BFL_STRAFERIGHT

```ml
const BFL_STRAFERIGHT = aiheaders.BFL_STRAFERIGHT
```

Bot-state flag marking straferight.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L113)

<a id="function-function-mq3-game-bot-combat-ai-canandwantstorocketjump-function-canandwantstorocketjump-services-bot-src-mq3-game-bot-combat-ai-ml-65456313"></a>
### canAndWantsToRocketJump

```ml
function canAndWantsToRocketJump(services, bot)
```

Use `services.characteristicFloatFn` to perform `canAndWantsToRocketJump`. Return paths include `value>=0.5`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `rocketjump` and `characteristicFloatFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory` and `character`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L363)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-aim-accuracy-const-characteristic-aim-accuracy-headers-characteristic-aim-accuracy-src-mq3-game-bot-combat-ai-ml-921030066"></a>
### CHARACTERISTIC_AIM_ACCURACY

```ml
const CHARACTERISTIC_AIM_ACCURACY = headers.CHARACTERISTIC_AIM_ACCURACY
```

Bot-character characteristic index for aim accuracy. Definition: accuracy when aiming float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L81)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-aim-skill-const-characteristic-aim-skill-headers-characteristic-aim-skill-src-mq3-game-bot-combat-ai-ml-1919412600"></a>
### CHARACTERISTIC_AIM_SKILL

```ml
const CHARACTERISTIC_AIM_SKILL = headers.CHARACTERISTIC_AIM_SKILL
```

Bot-character characteristic index controlling aim skill.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L83)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-alertness-const-characteristic-alertness-headers-characteristic-alertness-src-mq3-game-bot-combat-ai-ml-2001197710"></a>
### CHARACTERISTIC_ALERTNESS

```ml
const CHARACTERISTIC_ALERTNESS = headers.CHARACTERISTIC_ALERTNESS
```

Bot-character characteristic index for alertness. Definition: how alert the bot is (view distance) float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L89)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-attack-skill-const-characteristic-attack-skill-headers-characteristic-attack-skill-src-mq3-game-bot-combat-ai-ml-943822263"></a>
### CHARACTERISTIC_ATTACK_SKILL

```ml
const CHARACTERISTIC_ATTACK_SKILL = headers.CHARACTERISTIC_ATTACK_SKILL
```

Bot-character characteristic index controlling attack skill.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L100)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-croucher-const-characteristic-croucher-headers-characteristic-croucher-src-mq3-game-bot-combat-ai-ml-709506452"></a>
### CHARACTERISTIC_CROUCHER

```ml
const CHARACTERISTIC_CROUCHER = headers.CHARACTERISTIC_CROUCHER
```

Bot-character characteristic index for croucher. Definition: movement tendency to crouch float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L105)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-easy-fragger-const-characteristic-easy-fragger-headers-characteristic-easy-fragger-src-mq3-game-bot-combat-ai-ml-86043470"></a>
### CHARACTERISTIC_EASY_FRAGGER

```ml
const CHARACTERISTIC_EASY_FRAGGER = headers.CHARACTERISTIC_EASY_FRAGGER
```

Bot-character characteristic index for easy fragger. Definition: tendency to get easy frags float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L86)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-firethrottle-const-characteristic-firethrottle-headers-characteristic-firethrottle-src-mq3-game-bot-combat-ai-ml-1860662341"></a>
### CHARACTERISTIC_FIRETHROTTLE

```ml
const CHARACTERISTIC_FIRETHROTTLE = headers.CHARACTERISTIC_FIRETHROTTLE
```

Bot-character characteristic index for firethrottle. Definition: how much the bot fires it's weapon float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L92)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-jumper-const-characteristic-jumper-headers-characteristic-jumper-src-mq3-game-bot-combat-ai-ml-600115742"></a>
### CHARACTERISTIC_JUMPER

```ml
const CHARACTERISTIC_JUMPER = headers.CHARACTERISTIC_JUMPER
```

Bot-character characteristic index for jumper. Definition: tendency to jump float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L102)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-reactiontime-const-characteristic-reactiontime-headers-characteristic-reactiontime-src-mq3-game-bot-combat-ai-ml-1146693311"></a>
### CHARACTERISTIC_REACTIONTIME

```ml
const CHARACTERISTIC_REACTIONTIME = headers.CHARACTERISTIC_REACTIONTIME
```

Bot-character characteristic index for reactiontime. Definition: reaction time in seconds float [0, 5].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L79)

<a id="constant-constant-mq3-game-bot-combat-ai-characteristic-weaponjumping-const-characteristic-weaponjumping-headers-characteristic-weaponjumping-src-mq3-game-bot-combat-ai-ml-310132349"></a>
### CHARACTERISTIC_WEAPONJUMPING

```ml
const CHARACTERISTIC_WEAPONJUMPING = headers.CHARACTERISTIC_WEAPONJUMPING
```

Bot-character characteristic index for weaponjumping. Definition: tendency to jump using a weapon float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L76)

<a id="function-function-mq3-game-bot-combat-ai-checkattack-function-checkattack-services-bot-src-mq3-game-bot-combat-ai-ml-54747423"></a>
### checkAttack

```ml
function checkAttack(services, bot)
```

Update `bot.firethrottlewaitTime`, `bot.firethrottleshootTime` and `bot.combatFlags` during `checkAttack`. Return paths include `attacked`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityInfoFn`, `characteristicFloatFn`, `randomFn`, `traceFn` and `weaponInfoFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `character`, `enemySightTime`, `teleportTime` and `weaponchangeTime` and related fields. May update `bot.firethrottlewaitTime`, `bot.firethrottleshootTime` and `bot.combatFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L513)

- [mq3.game.bot_combat_ai.CombatGoal](Type-mq3-game-bot-combat-ai-combatgoal-332171648.md) — struct
<a id="constant-constant-mq3-game-bot-combat-ai-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-combat-ai-ml-781553414"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```

Collision-contents bit identifying lava space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L29)

<a id="constant-constant-mq3-game-bot-combat-ai-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-combat-ai-ml-526460524"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```

Collision-contents bit identifying slime space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L31)

<a id="function-function-mq3-game-bot-combat-ai-corneraim-function-corneraim-services-bot-weapon-aimskill-best-src-mq3-game-bot-combat-ai-ml-1178635259"></a>
### cornerAim

```ml
function cornerAim(services, bot, weapon, aimskill, best)
```

Use `services.predictVisibleFn` to perform `cornerAim`. Return paths include `[target[0],target[1],n.fsub(target[2],20.0)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `predictVisibleFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastEnemyOrigin`, `lastEnemyAreaNum` and `eye`. |
| `weapon` | `dynamic` | — | Weapon record; accesses `number`. |
| `aimskill` | `dynamic` | — | Value used by `cornerAim` in `if aimskill<=0.5 or (weapon.number!=5 and weapon.number!=4 and weapon.number!=9) then return best end if`. |
| `best` | `dynamic` | — | Operand used to evaluate the returned expression `best`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L478)

<a id="function-function-mq3-game-bot-combat-ai-create-function-create-src-mq3-game-bot-combat-ai-ml-591868426"></a>
### create

```ml
function create()
```

Create a `mq3.game.bot_combat_ai.Services` record, initializing `maxclients` as `64` and `lastteleportOrigin` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L255)

<a id="function-function-mq3-game-bot-combat-ai-ctfcarryingflag-function-ctfcarryingflag-services-bot-src-mq3-game-bot-combat-ai-ml-1370735599"></a>
### ctfCarryingFlag

```ml
function ctfCarryingFlag(services, bot)
```

Return the red or blue flag code carried by the bot in CTF, or zero when neither flag is carried.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L281)

<a id="constant-constant-mq3-game-bot-combat-ai-damagetype-radial-const-damagetype-radial-2-src-mq3-game-bot-combat-ai-ml-2009952745"></a>
### DAMAGETYPE_RADIAL

```ml
const DAMAGETYPE_RADIAL = 2
```

Weapon damage-category bit identifying radial damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L98)

<a id="constant-constant-mq3-game-bot-combat-ai-ef-firing-const-ef-firing-256-src-mq3-game-bot-combat-ai-ml-1189107006"></a>
### EF_FIRING

```ml
const EF_FIRING = 256
```

Network entity-flag bit indicating firing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L25)

<a id="constant-constant-mq3-game-bot-combat-ai-ef-talk-const-ef-talk-4096-src-mq3-game-bot-combat-ai-ml-428052182"></a>
### EF_TALK

```ml
const EF_TALK = 4096
```

Network entity-flag bit indicating talk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L27)

<a id="constant-constant-mq3-game-bot-combat-ai-ef-teleport-bit-const-ef-teleport-bit-4-src-mq3-game-bot-combat-ai-ml-299941427"></a>
### EF_TELEPORT_BIT

```ml
const EF_TELEPORT_BIT = 4
```

Network entity-flag bit indicating teleport bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L23)

<a id="function-function-mq3-game-bot-combat-ai-emptymoveresult-function-emptymoveresult-src-mq3-game-bot-combat-ai-ml-1721005148"></a>
### emptyMoveResult

```ml
function emptyMoveResult()
```

Create a `mq3.game.bot_combat_ai.MoveResult` record, initializing `movedir` as `[0.0,0.0,0.0]` and `idealViewangles` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L532)

<a id="constant-constant-mq3-game-bot-combat-ai-enemy-height-const-enemy-height-headers-enemy-height-src-mq3-game-bot-combat-ai-ml-1132674225"></a>
### ENEMY_HEIGHT

```ml
const ENEMY_HEIGHT = headers.ENEMY_HEIGHT
```

Bot inventory slot containing the enemy height relative to the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L73)

<a id="constant-constant-mq3-game-bot-combat-ai-enemy-horizontal-dist-const-enemy-horizontal-dist-headers-enemy-horizontal-dist-src-mq3-game-bot-combat-ai-ml-316519041"></a>
### ENEMY_HORIZONTAL_DIST

```ml
const ENEMY_HORIZONTAL_DIST = headers.ENEMY_HORIZONTAL_DIST
```

Bot inventory slot containing horizontal distance to the selected enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L71)

<a id="function-function-mq3-game-bot-combat-ai-entitycarriesflag-function-entitycarriesflag-entinfo-src-mq3-game-bot-combat-ai-ml-679602723"></a>
### entityCarriesFlag

```ml
function entityCarriesFlag(entinfo)
```

Test `(entinfo.powerups&(1<<c.PW_REDFLAG))!=0 or (entinfo.powerups&(1<<c.PW_BLUEFLAG))!=0` as the condition for `entityCarriesFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — | Entinfo record; accesses `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L260)

<a id="function-function-mq3-game-bot-combat-ai-entityhasquad-function-entityhasquad-entinfo-src-mq3-game-bot-combat-ai-ml-541716387"></a>
### entityHasQuad

```ml
function entityHasQuad(entinfo)
```

Test `(entinfo.powerups&(1<<c.PW_QUAD))!=0` as the condition for `entityHasQuad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — | Entinfo record; accesses `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L277)

- [mq3.game.bot_combat_ai.EntityInfo](Type-mq3-game-bot-combat-ai-entityinfo-1001859596.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-entityischatting-function-entityischatting-entinfo-src-mq3-game-bot-combat-ai-ml-199540611"></a>
### entityIsChatting

```ml
function entityIsChatting(entinfo)
```

Test `(entinfo.flags&EF_TALK)!=0` as the condition for `entityIsChatting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — | Entinfo record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L274)

<a id="function-function-mq3-game-bot-combat-ai-entityisinvisible-function-entityisinvisible-entinfo-src-mq3-game-bot-combat-ai-ml-1696769267"></a>
### entityIsInvisible

```ml
function entityIsInvisible(entinfo)
```

Apply `mq3.game.bot_combat_ai.entityCarriesFlag` while evaluating `entityIsInvisible`. Return paths include `(entinfo.powerups&(1<<c.PW_INVIS))!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — | Entinfo record; accesses `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L265)

<a id="function-function-mq3-game-bot-combat-ai-entityisshooting-function-entityisshooting-entinfo-src-mq3-game-bot-combat-ai-ml-2083960291"></a>
### entityIsShooting

```ml
function entityIsShooting(entinfo)
```

Test `(entinfo.flags&EF_FIRING)!=0` as the condition for `entityIsShooting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entinfo` | `dynamic` | — | Entinfo record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L271)

<a id="function-function-mq3-game-bot-combat-ai-feelingbad-function-feelingbad-bot-src-mq3-game-bot-combat-ai-ml-889139163"></a>
### feelingBad

```ml
function feelingBad(bot)
```

Assign a retreat pressure value from the bot's current weapon and remaining health.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `weaponnum` and `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L333)

<a id="function-function-mq3-game-bot-combat-ai-findenemy-function-findenemy-services-bot-curenemy-src-mq3-game-bot-combat-ai-ml-1016381799"></a>
### findEnemy

```ml
function findEnemy(services, bot, curenemy)
```

Update `bot.lastHealth`, `bot.enemy`, `bot.enemySightTime` and `bot.enemySuicide` and related state during `findEnemy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `characteristicFloatFn`, `entityInfoFn`, `maxclients`, `entityDeadFn` and `lastteleportTime` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `character`, `lastHealth`, `inventory`, `origin` and `client` and related fields. May update `bot.lastHealth`, `bot.enemy` and `bot.enemySightTime` and additional fields in place. |
| `curenemy` | `dynamic` | — | Value passed as argument 2 to `services.entityInfoFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L401)

<a id="constant-constant-mq3-game-bot-combat-ai-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-combat-ai-ml-618156115"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Game-mode identifier selecting capture the flag rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L15)

<a id="constant-constant-mq3-game-bot-combat-ai-gt-team-const-gt-team-3-src-mq3-game-bot-combat-ai-ml-1168255662"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Game-mode identifier selecting team rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L13)

<a id="function-function-mq3-game-bot-combat-ai-infieldofvision-function-infieldofvision-viewangles-fov-angles-src-mq3-game-bot-combat-ai-ml-1169554844"></a>
### inFieldOfVision

```ml
function inFieldOfVision(viewangles, fov, angles)
```

Set `angles[axis]` to `input.angleMod(angles[axis])` in `mq3.game.bot_combat_ai.inFieldOfVision`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewangles` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `fov` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. Entries may be updated in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L375)

<a id="function-function-mq3-game-bot-combat-ai-inlavaorslime-function-inlavaorslime-services-bot-src-mq3-game-bot-combat-ai-ml-1023866007"></a>
### inLavaOrSlime

```ml
function inLavaOrSlime(services, bot)
```

Use `services.pointContentsFn` to perform `inLavaOrSlime`. Return paths include `(services.pointContentsFn(services,feet)&(CONTENTS_LAVA|CONTENTS_SLIME))!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `pointContentsFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L310)

<a id="function-function-mq3-game-bot-combat-ai-intermission-function-intermission-services-bot-src-mq3-game-bot-combat-ai-ml-1457714843"></a>
### intermission

```ml
function intermission(services, bot)
```

Detect intermission from the game timer or the bot player-state freeze/intermission mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `intermissiontime`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L303)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-armor-const-inventory-armor-headers-inventory-armor-src-mq3-game-bot-combat-ai-ml-438090967"></a>
### INVENTORY_ARMOR

```ml
const INVENTORY_ARMOR = headers.INVENTORY_ARMOR
```

Bot inventory slot used to read or update armor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L33)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-bot-combat-ai-ml-34731015"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```

Bot inventory slot used to read or update bfg10 k.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L47)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-bot-combat-ai-ml-1398542611"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```

Bot inventory slot used to read or update bfgammo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L61)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-blueflag-const-inventory-blueflag-headers-inventory-blueflag-src-mq3-game-bot-combat-ai-ml-168328026"></a>
### INVENTORY_BLUEFLAG

```ml
const INVENTORY_BLUEFLAG = headers.INVENTORY_BLUEFLAG
```

Bot inventory slot used to read or update blueflag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L69)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-cells-const-inventory-cells-headers-inventory-cells-src-mq3-game-bot-combat-ai-ml-2121459941"></a>
### INVENTORY_CELLS

```ml
const INVENTORY_CELLS = headers.INVENTORY_CELLS
```

Bot inventory slot used to read or update cells.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L53)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-grenadelauncher-const-inventory-grenadelauncher-headers-inventory-grenadelauncher-src-mq3-game-bot-combat-ai-ml-1151268302"></a>
### INVENTORY_GRENADELAUNCHER

```ml
const INVENTORY_GRENADELAUNCHER = headers.INVENTORY_GRENADELAUNCHER
```

Bot inventory slot used to read or update grenade launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L37)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-grenades-const-inventory-grenades-headers-inventory-grenades-src-mq3-game-bot-combat-ai-ml-1336969417"></a>
### INVENTORY_GRENADES

```ml
const INVENTORY_GRENADES = headers.INVENTORY_GRENADES
```

Bot inventory slot used to read or update grenades.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L51)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-health-const-inventory-health-headers-inventory-health-src-mq3-game-bot-combat-ai-ml-1938071946"></a>
### INVENTORY_HEALTH

```ml
const INVENTORY_HEALTH = headers.INVENTORY_HEALTH
```

Bot inventory slot used to read or update health.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L63)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-lightning-const-inventory-lightning-headers-inventory-lightning-src-mq3-game-bot-combat-ai-ml-106961902"></a>
### INVENTORY_LIGHTNING

```ml
const INVENTORY_LIGHTNING = headers.INVENTORY_LIGHTNING
```

Bot inventory slot used to read or update lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L41)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-lightningammo-const-inventory-lightningammo-headers-inventory-lightningammo-src-mq3-game-bot-combat-ai-ml-124392408"></a>
### INVENTORY_LIGHTNINGAMMO

```ml
const INVENTORY_LIGHTNINGAMMO = headers.INVENTORY_LIGHTNINGAMMO
```

Bot inventory slot used to read or update lightningammo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L55)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-plasmagun-const-inventory-plasmagun-headers-inventory-plasmagun-src-mq3-game-bot-combat-ai-ml-561691440"></a>
### INVENTORY_PLASMAGUN

```ml
const INVENTORY_PLASMAGUN = headers.INVENTORY_PLASMAGUN
```

Bot inventory slot used to read or update plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L45)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-quad-const-inventory-quad-headers-inventory-quad-src-mq3-game-bot-combat-ai-ml-622227549"></a>
### INVENTORY_QUAD

```ml
const INVENTORY_QUAD = headers.INVENTORY_QUAD
```

Bot inventory slot used to read or update quad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L65)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-bot-combat-ai-ml-1623129686"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```

Bot inventory slot used to read or update railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L43)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-redflag-const-inventory-redflag-headers-inventory-redflag-src-mq3-game-bot-combat-ai-ml-78480841"></a>
### INVENTORY_REDFLAG

```ml
const INVENTORY_REDFLAG = headers.INVENTORY_REDFLAG
```

Bot inventory slot used to read or update redflag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L67)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-bot-combat-ai-ml-1700020448"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```

Bot inventory slot used to read or update rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L39)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-rockets-const-inventory-rockets-headers-inventory-rockets-src-mq3-game-bot-combat-ai-ml-202377053"></a>
### INVENTORY_ROCKETS

```ml
const INVENTORY_ROCKETS = headers.INVENTORY_ROCKETS
```

Bot inventory slot used to read or update rockets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L57)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-shells-const-inventory-shells-headers-inventory-shells-src-mq3-game-bot-combat-ai-ml-1404878325"></a>
### INVENTORY_SHELLS

```ml
const INVENTORY_SHELLS = headers.INVENTORY_SHELLS
```

Bot inventory slot used to read or update shells.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L49)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-shotgun-const-inventory-shotgun-headers-inventory-shotgun-src-mq3-game-bot-combat-ai-ml-670973238"></a>
### INVENTORY_SHOTGUN

```ml
const INVENTORY_SHOTGUN = headers.INVENTORY_SHOTGUN
```

Bot inventory slot used to read or update shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L35)

<a id="constant-constant-mq3-game-bot-combat-ai-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-bot-combat-ai-ml-253961308"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```

Bot inventory slot used to read or update slugs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L59)

<a id="function-function-mq3-game-bot-combat-ai-isdead-function-isdead-bot-src-mq3-game-bot-combat-ai-ml-1410869815"></a>
### isDead

```ml
function isDead(bot)
```

Test `bot.curPs.pm_type==c.PM_DEAD` as the condition for `isDead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L299)

<a id="function-function-mq3-game-bot-combat-ai-lengthsquared-function-lengthsquared-v-src-mq3-game-bot-combat-ai-ml-2121526440"></a>
### lengthSquared

```ml
function lengthSquared(v)
```

Forward `lengthSquared` to `mq3.shared.math.DotProduct` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.DotProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L392)

<a id="constant-constant-mq3-game-bot-combat-ai-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-combat-ai-ml-1715451599"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```

Long-term bot goal identifier selecting capture the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L17)

<a id="constant-constant-mq3-game-bot-combat-ai-move-crouch-const-move-crouch-2-src-mq3-game-bot-combat-ai-ml-75270149"></a>
### MOVE_CROUCH

```ml
const MOVE_CROUCH = 2
```

Bot movement-type flag selecting crouch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L109)

<a id="constant-constant-mq3-game-bot-combat-ai-move-jump-const-move-jump-8-src-mq3-game-bot-combat-ai-ml-250780047"></a>
### MOVE_JUMP

```ml
const MOVE_JUMP = 8
```

Bot movement-type flag selecting jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L111)

<a id="constant-constant-mq3-game-bot-combat-ai-move-walk-const-move-walk-1-src-mq3-game-bot-combat-ai-ml-1908311576"></a>
### MOVE_WALK

```ml
const MOVE_WALK = 1
```

Bot movement-type flag selecting walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L107)

- [mq3.game.bot_combat_ai.MoveResult](Type-mq3-game-bot-combat-ai-moveresult-1927036711.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-now-function-now-services-src-mq3-game-bot-combat-ai-ml-86218266"></a>
### now

```ml
function now(services)
```

Return the result of `services.floatTimeFn(services)` for `now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L395)

<a id="function-function-mq3-game-bot-combat-ai-projectileaim-function-projectileaim-services-bot-ent-weapon-aimskill-best-src-mq3-game-bot-combat-ai-ml-1554077688"></a>
### projectileAim

```ml
function projectileAim(services, bot, ent, weapon, aimskill, best)
```

Update `bot.enemyPositionTime`, `bot.enemyVelocity` and `bot.enemyOrigin` during `projectileAim`. Return paths include `best`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `predictMovementFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemyPositionTime`, `enemyVelocity`, `enemyOrigin`, `origin` and `curPs` and related fields. May update `bot.enemyPositionTime`, `bot.enemyVelocity` and `bot.enemyOrigin` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `origin`, `lastVisOrigin` and `updateTime`. |
| `weapon` | `dynamic` | — | Weapon record; accesses `speed`. |
| `aimskill` | `dynamic` | — | Value used by `projectileAim` in `if aimskill>0.8 and bot.curPs.weaponstate==0 then`. |
| `best` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L439)

- [mq3.game.bot_combat_ai.Services](Type-mq3-game-bot-combat-ai-services-1566822539.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-setteleporttime-function-setteleporttime-services-bot-src-mq3-game-bot-combat-ai-ml-270743067"></a>
### setTeleportTime

```ml
function setTeleportTime(services, bot)
```

Set `bot.teleportTime` to `services.floatTimeFn(services)` and `bot.lastEFlags` to `bot.curPs.eFlags` in `mq3.game.bot_combat_ai.setTeleportTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`, `lastEFlags` and `teleportTime`. May update `bot.teleportTime` and `bot.lastEFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L293)

<a id="function-function-mq3-game-bot-combat-ai-splashgroundaim-function-splashgroundaim-services-bot-ent-start-best-src-mq3-game-bot-combat-ai-ml-645596250"></a>
### splashGroundAim

```ml
function splashGroundAim(services, bot, ent, start, best)
```

Use `services.traceFn` to perform `splashGroundAim`. Return paths include `best`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `traceFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin` and `entitynum`. |
| `ent` | `dynamic` | — | Game entity; accesses `origin` and `number`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `best` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L461)

<a id="function-function-mq3-game-bot-combat-ai-subtract-function-subtract-a-b-src-mq3-game-bot-combat-ai-ml-554455547"></a>
### subtract

```ml
function subtract(a, b)
```

Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `subtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L389)

- [mq3.game.bot_combat_ai.TargetEntityInfo](Type-mq3-game-bot-combat-ai-targetentityinfo-54412113.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-teamplayison-function-teamplayison-services-src-mq3-game-bot-combat-ai-ml-444516074"></a>
### teamPlayIsOn

```ml
function teamPlayIsOn(services)
```

Test `services.gametype>=GT_TEAM` as the condition for `teamPlayIsOn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `gametype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L289)

- [mq3.game.bot_combat_ai.Trace](Type-mq3-game-bot-combat-ai-trace-1845261636.md) — struct
<a id="function-function-mq3-game-bot-combat-ai-wantstochase-function-wantstochase-services-bot-src-mq3-game-bot-combat-ai-ml-766303659"></a>
### wantsToChase

```ml
function wantsToChase(services, bot)
```

Use `services.entityInfoFn` to perform `wantsToChase`. Return paths include `aggression(bot)>50.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `gametype` and `entityInfoFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy` and `ltgtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L352)

<a id="function-function-mq3-game-bot-combat-ai-wantstoretreat-function-wantstoretreat-services-bot-src-mq3-game-bot-combat-ai-ml-1844676567"></a>
### wantsToRetreat

```ml
function wantsToRetreat(services, bot)
```

Use `services.entityInfoFn` to perform `wantsToRetreat`. Return paths include `aggression(bot)<50.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `gametype` and `entityInfoFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy` and `ltgtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L343)

- [mq3.game.bot_combat_ai.WeaponInfo](Type-mq3-game-bot-combat-ai-weaponinfo-1909029331.md) — struct
<a id="constant-constant-mq3-game-bot-combat-ai-wfl-firereleased-const-wfl-firereleased-1-src-mq3-game-bot-combat-ai-ml-1382322300"></a>
### WFL_FIRERELEASED

```ml
const WFL_FIRERELEASED = 1
```

Bot weapon flag selecting firereleased.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L96)

<a id="constant-constant-mq3-game-bot-combat-ai-wp-gauntlet-const-wp-gauntlet-1-src-mq3-game-bot-combat-ai-ml-1396107120"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```

Weapon identifier selecting gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L19)

<a id="constant-constant-mq3-game-bot-combat-ai-wp-machinegun-const-wp-machinegun-2-src-mq3-game-bot-combat-ai-ml-108443225"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```

Weapon identifier selecting machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L21)
