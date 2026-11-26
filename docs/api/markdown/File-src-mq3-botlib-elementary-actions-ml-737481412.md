# `src/mq3/botlib/elementary_actions.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.elementary_actions`](Package-mq3-botlib-elementary-actions-1001915482.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/public_headers.ml` as `publicHeaders` → [src/mq3/botlib/public_headers.ml](File-src-mq3-botlib-public-headers-ml-206085358.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-elementary-actions-action-function-action-state-client-bits-src-mq3-botlib-elementary-actions-ml-1155940734"></a>
### action

```ml
function action(state, client, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L90)

<a id="constant-constant-mq3-botlib-elementary-actions-action-affirmative-const-action-affirmative-publicheaders-action-affirmative-src-mq3-botlib-elementary-actions-ml-365011741"></a>
### ACTION_AFFIRMATIVE

```ml
const ACTION_AFFIRMATIVE = publicHeaders.ACTION_AFFIRMATIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L27)

<a id="constant-constant-mq3-botlib-elementary-actions-action-attack-const-action-attack-publicheaders-action-attack-src-mq3-botlib-elementary-actions-ml-1123342273"></a>
### ACTION_ATTACK

```ml
const ACTION_ATTACK = publicHeaders.ACTION_ATTACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L12)

<a id="constant-constant-mq3-botlib-elementary-actions-action-crouch-const-action-crouch-publicheaders-action-crouch-src-mq3-botlib-elementary-actions-ml-837870627"></a>
### ACTION_CROUCH

```ml
const ACTION_CROUCH = publicHeaders.ACTION_CROUCH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L17)

<a id="constant-constant-mq3-botlib-elementary-actions-action-delayedjump-const-action-delayedjump-publicheaders-action-delayedjump-src-mq3-botlib-elementary-actions-ml-307126947"></a>
### ACTION_DELAYEDJUMP

```ml
const ACTION_DELAYEDJUMP = publicHeaders.ACTION_DELAYEDJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L23)

<a id="constant-constant-mq3-botlib-elementary-actions-action-followme-const-action-followme-publicheaders-action-followme-src-mq3-botlib-elementary-actions-ml-1723295616"></a>
### ACTION_FOLLOWME

```ml
const ACTION_FOLLOWME = publicHeaders.ACTION_FOLLOWME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L32)

<a id="constant-constant-mq3-botlib-elementary-actions-action-gesture-const-action-gesture-publicheaders-action-gesture-src-mq3-botlib-elementary-actions-ml-1271855646"></a>
### ACTION_GESTURE

```ml
const ACTION_GESTURE = publicHeaders.ACTION_GESTURE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L25)

<a id="constant-constant-mq3-botlib-elementary-actions-action-getflag-const-action-getflag-publicheaders-action-getflag-src-mq3-botlib-elementary-actions-ml-1744009283"></a>
### ACTION_GETFLAG

```ml
const ACTION_GETFLAG = publicHeaders.ACTION_GETFLAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L29)

<a id="constant-constant-mq3-botlib-elementary-actions-action-guardbase-const-action-guardbase-publicheaders-action-guardbase-src-mq3-botlib-elementary-actions-ml-70874433"></a>
### ACTION_GUARDBASE

```ml
const ACTION_GUARDBASE = publicHeaders.ACTION_GUARDBASE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L30)

<a id="constant-constant-mq3-botlib-elementary-actions-action-jump-const-action-jump-publicheaders-action-jump-src-mq3-botlib-elementary-actions-ml-1518488513"></a>
### ACTION_JUMP

```ml
const ACTION_JUMP = publicHeaders.ACTION_JUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L15)

<a id="constant-constant-mq3-botlib-elementary-actions-action-jumpedlastframe-const-action-jumpedlastframe-128-src-mq3-botlib-elementary-actions-ml-336319398"></a>
### ACTION_JUMPEDLASTFRAME

```ml
const ACTION_JUMPEDLASTFRAME = 128
```

Private be_ea.c latch. Its collision with ACTION_CROUCH is original.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L35)

<a id="constant-constant-mq3-botlib-elementary-actions-action-moveback-const-action-moveback-publicheaders-action-moveback-src-mq3-botlib-elementary-actions-ml-1026464115"></a>
### ACTION_MOVEBACK

```ml
const ACTION_MOVEBACK = publicHeaders.ACTION_MOVEBACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L20)

<a id="constant-constant-mq3-botlib-elementary-actions-action-movedown-const-action-movedown-publicheaders-action-movedown-src-mq3-botlib-elementary-actions-ml-665318090"></a>
### ACTION_MOVEDOWN

```ml
const ACTION_MOVEDOWN = publicHeaders.ACTION_MOVEDOWN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L18)

<a id="constant-constant-mq3-botlib-elementary-actions-action-moveforward-const-action-moveforward-publicheaders-action-moveforward-src-mq3-botlib-elementary-actions-ml-1071514471"></a>
### ACTION_MOVEFORWARD

```ml
const ACTION_MOVEFORWARD = publicHeaders.ACTION_MOVEFORWARD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L19)

<a id="constant-constant-mq3-botlib-elementary-actions-action-moveleft-const-action-moveleft-publicheaders-action-moveleft-src-mq3-botlib-elementary-actions-ml-1696210061"></a>
### ACTION_MOVELEFT

```ml
const ACTION_MOVELEFT = publicHeaders.ACTION_MOVELEFT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L21)

<a id="constant-constant-mq3-botlib-elementary-actions-action-moveright-const-action-moveright-publicheaders-action-moveright-src-mq3-botlib-elementary-actions-ml-1532805568"></a>
### ACTION_MOVERIGHT

```ml
const ACTION_MOVERIGHT = publicHeaders.ACTION_MOVERIGHT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L22)

<a id="constant-constant-mq3-botlib-elementary-actions-action-moveup-const-action-moveup-publicheaders-action-moveup-src-mq3-botlib-elementary-actions-ml-196868861"></a>
### ACTION_MOVEUP

```ml
const ACTION_MOVEUP = publicHeaders.ACTION_MOVEUP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L16)

<a id="constant-constant-mq3-botlib-elementary-actions-action-negative-const-action-negative-publicheaders-action-negative-src-mq3-botlib-elementary-actions-ml-751602848"></a>
### ACTION_NEGATIVE

```ml
const ACTION_NEGATIVE = publicHeaders.ACTION_NEGATIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L28)

<a id="constant-constant-mq3-botlib-elementary-actions-action-patrol-const-action-patrol-publicheaders-action-patrol-src-mq3-botlib-elementary-actions-ml-2063933187"></a>
### ACTION_PATROL

```ml
const ACTION_PATROL = publicHeaders.ACTION_PATROL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L31)

<a id="constant-constant-mq3-botlib-elementary-actions-action-respawn-const-action-respawn-publicheaders-action-respawn-src-mq3-botlib-elementary-actions-ml-1770997549"></a>
### ACTION_RESPAWN

```ml
const ACTION_RESPAWN = publicHeaders.ACTION_RESPAWN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L14)

<a id="constant-constant-mq3-botlib-elementary-actions-action-talk-const-action-talk-publicheaders-action-talk-src-mq3-botlib-elementary-actions-ml-209035847"></a>
### ACTION_TALK

```ml
const ACTION_TALK = publicHeaders.ACTION_TALK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L24)

<a id="constant-constant-mq3-botlib-elementary-actions-action-use-const-action-use-publicheaders-action-use-src-mq3-botlib-elementary-actions-ml-1081447150"></a>
### ACTION_USE

```ml
const ACTION_USE = publicHeaders.ACTION_USE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L13)

<a id="constant-constant-mq3-botlib-elementary-actions-action-walk-const-action-walk-publicheaders-action-walk-src-mq3-botlib-elementary-actions-ml-768785266"></a>
### ACTION_WALK

```ml
const ACTION_WALK = publicHeaders.ACTION_WALK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L26)

<a id="function-function-mq3-botlib-elementary-actions-attack-function-attack-state-client-src-mq3-botlib-elementary-actions-ml-295500734"></a>
### attack

```ml
function attack(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L93)

<a id="function-function-mq3-botlib-elementary-actions-command-function-command-state-client-text-src-mq3-botlib-elementary-actions-ml-876164887"></a>
### command

```ml
function command(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L83)

<a id="function-function-mq3-botlib-elementary-actions-copyinput-function-copyinput-value-src-mq3-botlib-elementary-actions-ml-1553776003"></a>
### copyInput

```ml
function copyInput(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L67)

<a id="function-function-mq3-botlib-elementary-actions-create-function-create-maxclients-commandfn-context-src-mq3-botlib-elementary-actions-ml-1343425978"></a>
### create

```ml
function create(maxClients, commandFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |
| `commandFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L68)

<a id="function-function-mq3-botlib-elementary-actions-crouch-function-crouch-state-client-src-mq3-botlib-elementary-actions-ml-434639250"></a>
### crouch

```ml
function crouch(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L96)

<a id="function-function-mq3-botlib-elementary-actions-delayedjump-function-delayedjump-state-client-src-mq3-botlib-elementary-actions-ml-1837756402"></a>
### delayedJump

```ml
function delayedJump(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L109)

<a id="function-function-mq3-botlib-elementary-actions-dropinv-function-dropinv-state-client-inventory-src-mq3-botlib-elementary-actions-ml-403291562"></a>
### dropInv

```ml
function dropInv(state, client, inventory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L88)

<a id="function-function-mq3-botlib-elementary-actions-dropitem-function-dropitem-state-client-item-src-mq3-botlib-elementary-actions-ml-267739021"></a>
### dropItem

```ml
function dropItem(state, client, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L86)

<a id="function-function-mq3-botlib-elementary-actions-ea-action-function-ea-action-state-client-bits-src-mq3-botlib-elementary-actions-ml-18117004"></a>
### EA_Action

```ml
function EA_Action(state, client, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L170)

<a id="function-function-mq3-botlib-elementary-actions-ea-attack-function-ea-attack-state-client-src-mq3-botlib-elementary-actions-ml-739688792"></a>
### EA_Attack

```ml
function EA_Attack(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L162)

<a id="function-function-mq3-botlib-elementary-actions-ea-command-function-ea-command-state-client-text-src-mq3-botlib-elementary-actions-ml-1994612929"></a>
### EA_Command

```ml
function EA_Command(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L160)

<a id="function-function-mq3-botlib-elementary-actions-ea-crouch-function-ea-crouch-state-client-src-mq3-botlib-elementary-actions-ml-334017424"></a>
### EA_Crouch

```ml
function EA_Crouch(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L168)

<a id="function-function-mq3-botlib-elementary-actions-ea-delayedjump-function-ea-delayedjump-state-client-src-mq3-botlib-elementary-actions-ml-261236726"></a>
### EA_DelayedJump

```ml
function EA_DelayedJump(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L167)

<a id="function-function-mq3-botlib-elementary-actions-ea-dropinv-function-ea-dropinv-state-client-inventory-src-mq3-botlib-elementary-actions-ml-1539945886"></a>
### EA_DropInv

```ml
function EA_DropInv(state, client, inventory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L158)

<a id="function-function-mq3-botlib-elementary-actions-ea-dropitem-function-ea-dropitem-state-client-item-src-mq3-botlib-elementary-actions-ml-1516185259"></a>
### EA_DropItem

```ml
function EA_DropItem(state, client, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L156)

<a id="function-function-mq3-botlib-elementary-actions-ea-endregular-function-ea-endregular-state-client-thinktime-src-mq3-botlib-elementary-actions-ml-1459021343"></a>
### EA_EndRegular

```ml
function EA_EndRegular(state, client, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L179)

<a id="function-function-mq3-botlib-elementary-actions-ea-gesture-function-ea-gesture-state-client-src-mq3-botlib-elementary-actions-ml-1909090490"></a>
### EA_Gesture

```ml
function EA_Gesture(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L159)

<a id="function-function-mq3-botlib-elementary-actions-ea-getinput-function-ea-getinput-state-client-thinktime-src-mq3-botlib-elementary-actions-ml-306115761"></a>
### EA_GetInput

```ml
function EA_GetInput(state, client, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L180)

<a id="function-function-mq3-botlib-elementary-actions-ea-jump-function-ea-jump-state-client-src-mq3-botlib-elementary-actions-ml-1214661036"></a>
### EA_Jump

```ml
function EA_Jump(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L166)

<a id="function-function-mq3-botlib-elementary-actions-ea-move-function-ea-move-state-client-direction-speed-src-mq3-botlib-elementary-actions-ml-985451974"></a>
### EA_Move

```ml
function EA_Move(state, client, direction, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L177)

<a id="function-function-mq3-botlib-elementary-actions-ea-moveback-function-ea-moveback-state-client-src-mq3-botlib-elementary-actions-ml-2008057376"></a>
### EA_MoveBack

```ml
function EA_MoveBack(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L174)

<a id="function-function-mq3-botlib-elementary-actions-ea-movedown-function-ea-movedown-state-client-src-mq3-botlib-elementary-actions-ml-218643386"></a>
### EA_MoveDown

```ml
function EA_MoveDown(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L172)

<a id="function-function-mq3-botlib-elementary-actions-ea-moveforward-function-ea-moveforward-state-client-src-mq3-botlib-elementary-actions-ml-1291756122"></a>
### EA_MoveForward

```ml
function EA_MoveForward(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L173)

<a id="function-function-mq3-botlib-elementary-actions-ea-moveleft-function-ea-moveleft-state-client-src-mq3-botlib-elementary-actions-ml-1630295288"></a>
### EA_MoveLeft

```ml
function EA_MoveLeft(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L175)

<a id="function-function-mq3-botlib-elementary-actions-ea-moveright-function-ea-moveright-state-client-src-mq3-botlib-elementary-actions-ml-881448114"></a>
### EA_MoveRight

```ml
function EA_MoveRight(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L176)

<a id="function-function-mq3-botlib-elementary-actions-ea-moveup-function-ea-moveup-state-client-src-mq3-botlib-elementary-actions-ml-127238592"></a>
### EA_MoveUp

```ml
function EA_MoveUp(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L171)

<a id="function-function-mq3-botlib-elementary-actions-ea-resetinput-function-ea-resetinput-state-client-src-mq3-botlib-elementary-actions-ml-2017912522"></a>
### EA_ResetInput

```ml
function EA_ResetInput(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L181)

<a id="function-function-mq3-botlib-elementary-actions-ea-respawn-function-ea-respawn-state-client-src-mq3-botlib-elementary-actions-ml-553949858"></a>
### EA_Respawn

```ml
function EA_Respawn(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L165)

<a id="function-function-mq3-botlib-elementary-actions-ea-say-function-ea-say-state-client-text-src-mq3-botlib-elementary-actions-ml-501452181"></a>
### EA_Say

```ml
function EA_Say(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L152)

<a id="function-function-mq3-botlib-elementary-actions-ea-sayteam-function-ea-sayteam-state-client-text-src-mq3-botlib-elementary-actions-ml-668141317"></a>
### EA_SayTeam

```ml
function EA_SayTeam(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L153)

<a id="function-function-mq3-botlib-elementary-actions-ea-selectweapon-function-ea-selectweapon-state-client-weapon-src-mq3-botlib-elementary-actions-ml-1199884292"></a>
### EA_SelectWeapon

```ml
function EA_SelectWeapon(state, client, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L161)

<a id="function-function-mq3-botlib-elementary-actions-ea-setup-function-ea-setup-maxclients-src-mq3-botlib-elementary-actions-ml-1899391466"></a>
### EA_Setup

```ml
function EA_Setup(maxClients)
```

Complete code/botlib/be_ea.c surface.  The explicit state argument replaces the original process-global botinputs pointer while retaining every original transition and command string exactly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L146)

<a id="function-function-mq3-botlib-elementary-actions-ea-shutdown-function-ea-shutdown-state-src-mq3-botlib-elementary-actions-ml-1187496495"></a>
### EA_Shutdown

```ml
function EA_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L151)

<a id="function-function-mq3-botlib-elementary-actions-ea-talk-function-ea-talk-state-client-src-mq3-botlib-elementary-actions-ml-1609241764"></a>
### EA_Talk

```ml
function EA_Talk(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L163)

<a id="function-function-mq3-botlib-elementary-actions-ea-tell-function-ea-tell-state-client-clientto-text-src-mq3-botlib-elementary-actions-ml-1977382715"></a>
### EA_Tell

```ml
function EA_Tell(state, client, clientTo, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientTo` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L154)

<a id="function-function-mq3-botlib-elementary-actions-ea-use-function-ea-use-state-client-src-mq3-botlib-elementary-actions-ml-76045266"></a>
### EA_Use

```ml
function EA_Use(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L164)

<a id="function-function-mq3-botlib-elementary-actions-ea-useinv-function-ea-useinv-state-client-inventory-src-mq3-botlib-elementary-actions-ml-1096255568"></a>
### EA_UseInv

```ml
function EA_UseInv(state, client, inventory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L157)

<a id="function-function-mq3-botlib-elementary-actions-ea-useitem-function-ea-useitem-state-client-item-src-mq3-botlib-elementary-actions-ml-1016887401"></a>
### EA_UseItem

```ml
function EA_UseItem(state, client, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L155)

<a id="function-function-mq3-botlib-elementary-actions-ea-view-function-ea-view-state-client-angles-src-mq3-botlib-elementary-actions-ml-1450472974"></a>
### EA_View

```ml
function EA_View(state, client, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L178)

<a id="function-function-mq3-botlib-elementary-actions-ea-walk-function-ea-walk-state-client-src-mq3-botlib-elementary-actions-ml-460241194"></a>
### EA_Walk

```ml
function EA_Walk(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L169)

- [mq3.botlib.elementary_actions.ElementaryInput](Type-mq3-botlib-elementary-actions-elementaryinput-404656510.md) — struct
<a id="function-function-mq3-botlib-elementary-actions-emit-function-emit-state-client-text-src-mq3-botlib-elementary-actions-ml-685378529"></a>
### emit

```ml
function emit(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L76)

<a id="function-function-mq3-botlib-elementary-actions-emptyinput-function-emptyinput-src-mq3-botlib-elementary-actions-ml-938304876"></a>
### emptyInput

```ml
function emptyInput()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L66)

<a id="function-function-mq3-botlib-elementary-actions-endregular-function-endregular-state-client-thinktime-src-mq3-botlib-elementary-actions-ml-369737375"></a>
### endRegular

```ml
function endRegular(state, client, thinktime)
```

The complete body is commented out in released be_ea.c.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L125)

<a id="function-function-mq3-botlib-elementary-actions-fail-function-fail-message-src-mq3-botlib-elementary-actions-ml-1493413395"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L65)

<a id="function-function-mq3-botlib-elementary-actions-gesture-function-gesture-state-client-src-mq3-botlib-elementary-actions-ml-1969718816"></a>
### gesture

```ml
function gesture(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L91)

<a id="function-function-mq3-botlib-elementary-actions-getinput-function-getinput-state-client-thinktime-src-mq3-botlib-elementary-actions-ml-1996966135"></a>
### getInput

```ml
function getInput(state, client, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L126)

<a id="constant-constant-mq3-botlib-elementary-actions-input-size-const-input-size-40-src-mq3-botlib-elementary-actions-ml-807701751"></a>
### INPUT_SIZE

```ml
const INPUT_SIZE = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L10)

<a id="function-function-mq3-botlib-elementary-actions-inputat-function-inputat-state-client-src-mq3-botlib-elementary-actions-ml-40036440"></a>
### inputAt

```ml
function inputAt(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L75)

<a id="function-function-mq3-botlib-elementary-actions-jump-function-jump-state-client-src-mq3-botlib-elementary-actions-ml-1683154690"></a>
### jump

```ml
function jump(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L105)

<a id="constant-constant-mq3-botlib-elementary-actions-max-usermove-const-max-usermove-400-src-mq3-botlib-elementary-actions-ml-212832417"></a>
### MAX_USERMOVE

```ml
const MAX_USERMOVE = 400
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L9)

<a id="function-function-mq3-botlib-elementary-actions-move-function-move-state-client-direction-speed-src-mq3-botlib-elementary-actions-ml-912704310"></a>
### move

```ml
function move(state, client, direction, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L113)

<a id="function-function-mq3-botlib-elementary-actions-moveback-function-moveback-state-client-src-mq3-botlib-elementary-actions-ml-896566906"></a>
### moveBack

```ml
function moveBack(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L101)

<a id="function-function-mq3-botlib-elementary-actions-movedown-function-movedown-state-client-src-mq3-botlib-elementary-actions-ml-479899506"></a>
### moveDown

```ml
function moveDown(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L99)

<a id="function-function-mq3-botlib-elementary-actions-moveforward-function-moveforward-state-client-src-mq3-botlib-elementary-actions-ml-667007082"></a>
### moveForward

```ml
function moveForward(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L100)

<a id="function-function-mq3-botlib-elementary-actions-moveleft-function-moveleft-state-client-src-mq3-botlib-elementary-actions-ml-1038149738"></a>
### moveLeft

```ml
function moveLeft(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L102)

<a id="function-function-mq3-botlib-elementary-actions-moveright-function-moveright-state-client-src-mq3-botlib-elementary-actions-ml-318678472"></a>
### moveRight

```ml
function moveRight(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L103)

<a id="function-function-mq3-botlib-elementary-actions-moveup-function-moveup-state-client-src-mq3-botlib-elementary-actions-ml-1987857406"></a>
### moveUp

```ml
function moveUp(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L98)

<a id="constant-constant-mq3-botlib-elementary-actions-op-action-const-op-action-403-src-mq3-botlib-elementary-actions-ml-240144934"></a>
### OP_ACTION

```ml
const OP_ACTION = 403
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L40)

<a id="constant-constant-mq3-botlib-elementary-actions-op-attack-const-op-attack-406-src-mq3-botlib-elementary-actions-ml-971874031"></a>
### OP_ATTACK

```ml
const OP_ATTACK = 406
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L43)

<a id="constant-constant-mq3-botlib-elementary-actions-op-command-const-op-command-402-src-mq3-botlib-elementary-actions-ml-1278144843"></a>
### OP_COMMAND

```ml
const OP_COMMAND = 402
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L39)

<a id="constant-constant-mq3-botlib-elementary-actions-op-crouch-const-op-crouch-409-src-mq3-botlib-elementary-actions-ml-1154354320"></a>
### OP_CROUCH

```ml
const OP_CROUCH = 409
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L46)

<a id="constant-constant-mq3-botlib-elementary-actions-op-delayed-jump-const-op-delayed-jump-418-src-mq3-botlib-elementary-actions-ml-2110538482"></a>
### OP_DELAYED_JUMP

```ml
const OP_DELAYED_JUMP = 418
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L55)

<a id="constant-constant-mq3-botlib-elementary-actions-op-end-regular-const-op-end-regular-421-src-mq3-botlib-elementary-actions-ml-952582700"></a>
### OP_END_REGULAR

```ml
const OP_END_REGULAR = 421
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L58)

<a id="constant-constant-mq3-botlib-elementary-actions-op-gesture-const-op-gesture-404-src-mq3-botlib-elementary-actions-ml-170380365"></a>
### OP_GESTURE

```ml
const OP_GESTURE = 404
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L41)

<a id="constant-constant-mq3-botlib-elementary-actions-op-get-input-const-op-get-input-422-src-mq3-botlib-elementary-actions-ml-1072697189"></a>
### OP_GET_INPUT

```ml
const OP_GET_INPUT = 422
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L59)

<a id="constant-constant-mq3-botlib-elementary-actions-op-jump-const-op-jump-417-src-mq3-botlib-elementary-actions-ml-641214193"></a>
### OP_JUMP

```ml
const OP_JUMP = 417
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L54)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-const-op-move-419-src-mq3-botlib-elementary-actions-ml-1646357311"></a>
### OP_MOVE

```ml
const OP_MOVE = 419
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L56)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-back-const-op-move-back-413-src-mq3-botlib-elementary-actions-ml-2003931381"></a>
### OP_MOVE_BACK

```ml
const OP_MOVE_BACK = 413
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L50)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-down-const-op-move-down-411-src-mq3-botlib-elementary-actions-ml-1313185093"></a>
### OP_MOVE_DOWN

```ml
const OP_MOVE_DOWN = 411
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L48)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-forward-const-op-move-forward-412-src-mq3-botlib-elementary-actions-ml-1007537288"></a>
### OP_MOVE_FORWARD

```ml
const OP_MOVE_FORWARD = 412
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L49)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-left-const-op-move-left-414-src-mq3-botlib-elementary-actions-ml-1817243274"></a>
### OP_MOVE_LEFT

```ml
const OP_MOVE_LEFT = 414
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L51)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-right-const-op-move-right-415-src-mq3-botlib-elementary-actions-ml-607217215"></a>
### OP_MOVE_RIGHT

```ml
const OP_MOVE_RIGHT = 415
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L52)

<a id="constant-constant-mq3-botlib-elementary-actions-op-move-up-const-op-move-up-410-src-mq3-botlib-elementary-actions-ml-1663821874"></a>
### OP_MOVE_UP

```ml
const OP_MOVE_UP = 410
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L47)

<a id="constant-constant-mq3-botlib-elementary-actions-op-reset-input-const-op-reset-input-423-src-mq3-botlib-elementary-actions-ml-2123237238"></a>
### OP_RESET_INPUT

```ml
const OP_RESET_INPUT = 423
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L60)

<a id="constant-constant-mq3-botlib-elementary-actions-op-respawn-const-op-respawn-408-src-mq3-botlib-elementary-actions-ml-633532435"></a>
### OP_RESPAWN

```ml
const OP_RESPAWN = 408
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L45)

<a id="constant-constant-mq3-botlib-elementary-actions-op-say-const-op-say-400-src-mq3-botlib-elementary-actions-ml-1459725553"></a>
### OP_SAY

```ml
const OP_SAY = 400
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L37)

<a id="constant-constant-mq3-botlib-elementary-actions-op-say-team-const-op-say-team-401-src-mq3-botlib-elementary-actions-ml-1907255228"></a>
### OP_SAY_TEAM

```ml
const OP_SAY_TEAM = 401
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L38)

<a id="constant-constant-mq3-botlib-elementary-actions-op-select-weapon-const-op-select-weapon-416-src-mq3-botlib-elementary-actions-ml-393545588"></a>
### OP_SELECT_WEAPON

```ml
const OP_SELECT_WEAPON = 416
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L53)

<a id="constant-constant-mq3-botlib-elementary-actions-op-talk-const-op-talk-405-src-mq3-botlib-elementary-actions-ml-1392089652"></a>
### OP_TALK

```ml
const OP_TALK = 405
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L42)

<a id="constant-constant-mq3-botlib-elementary-actions-op-use-const-op-use-407-src-mq3-botlib-elementary-actions-ml-301728650"></a>
### OP_USE

```ml
const OP_USE = 407
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L44)

<a id="constant-constant-mq3-botlib-elementary-actions-op-view-const-op-view-420-src-mq3-botlib-elementary-actions-ml-1427324415"></a>
### OP_VIEW

```ml
const OP_VIEW = 420
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L57)

<a id="function-function-mq3-botlib-elementary-actions-resetinput-function-resetinput-state-client-src-mq3-botlib-elementary-actions-ml-564644958"></a>
### resetInput

```ml
function resetInput(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L129)

<a id="function-function-mq3-botlib-elementary-actions-respawn-function-respawn-state-client-src-mq3-botlib-elementary-actions-ml-1768779530"></a>
### respawn

```ml
function respawn(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L95)

<a id="function-function-mq3-botlib-elementary-actions-say-function-say-state-client-text-src-mq3-botlib-elementary-actions-ml-1560060551"></a>
### say

```ml
function say(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L81)

<a id="function-function-mq3-botlib-elementary-actions-sayteam-function-sayteam-state-client-text-src-mq3-botlib-elementary-actions-ml-2129953029"></a>
### sayTeam

```ml
function sayTeam(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L82)

<a id="function-function-mq3-botlib-elementary-actions-selectweapon-function-selectweapon-state-client-weapon-src-mq3-botlib-elementary-actions-ml-1768303362"></a>
### selectWeapon

```ml
function selectWeapon(state, client, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L104)

<a id="function-function-mq3-botlib-elementary-actions-shutdown-function-shutdown-state-src-mq3-botlib-elementary-actions-ml-447651477"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L73)

- [mq3.botlib.elementary_actions.State](Type-mq3-botlib-elementary-actions-state-322894625.md) — struct
<a id="function-function-mq3-botlib-elementary-actions-talk-function-talk-state-client-src-mq3-botlib-elementary-actions-ml-1201005586"></a>
### talk

```ml
function talk(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L92)

<a id="function-function-mq3-botlib-elementary-actions-tell-function-tell-state-client-clientto-text-src-mq3-botlib-elementary-actions-ml-1685470755"></a>
### tell

```ml
function tell(state, client, clientTo, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientTo` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L84)

<a id="function-function-mq3-botlib-elementary-actions-useaction-function-useaction-state-client-src-mq3-botlib-elementary-actions-ml-1371898620"></a>
### useAction

```ml
function useAction(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L94)

<a id="function-function-mq3-botlib-elementary-actions-useinv-function-useinv-state-client-inventory-src-mq3-botlib-elementary-actions-ml-124080082"></a>
### useInv

```ml
function useInv(state, client, inventory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L87)

<a id="function-function-mq3-botlib-elementary-actions-useitem-function-useitem-state-client-item-src-mq3-botlib-elementary-actions-ml-1495953649"></a>
### useItem

```ml
function useItem(state, client, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L85)

<a id="function-function-mq3-botlib-elementary-actions-validclient-function-validclient-state-client-src-mq3-botlib-elementary-actions-ml-1974430124"></a>
### validClient

```ml
function validClient(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L74)

<a id="function-function-mq3-botlib-elementary-actions-view-function-view-state-client-angles-src-mq3-botlib-elementary-actions-ml-655118918"></a>
### view

```ml
function view(state, client, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L119)

<a id="function-function-mq3-botlib-elementary-actions-walk-function-walk-state-client-src-mq3-botlib-elementary-actions-ml-1831079682"></a>
### walk

```ml
function walk(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L97)

<a id="function-function-mq3-botlib-elementary-actions-writeinput-function-writeinput-data-offset-value-src-mq3-botlib-elementary-actions-ml-566249596"></a>
### writeInput

```ml
function writeInput(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/elementary_actions.ml#L136)
