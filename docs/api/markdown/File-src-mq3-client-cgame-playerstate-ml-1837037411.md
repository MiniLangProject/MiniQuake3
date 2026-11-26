# `src/mq3/client/cgame_playerstate.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_playerstate`](Package-mq3-client-cgame-playerstate-1438180373.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-cgame-playerstate-bufferedsound-function-bufferedsound-state-sound-src-mq3-client-cgame-playerstate-ml-1645603910"></a>
### bufferedSound

```ml
function bufferedSound(state, sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L85)

<a id="function-function-mq3-client-cgame-playerstate-checkammo-function-checkammo-state-ps-src-mq3-client-cgame-playerstate-ml-173778740"></a>
### checkAmmo

```ml
function checkAmmo(state, ps)
```

CG_CheckAmmo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L88)

<a id="function-function-mq3-client-cgame-playerstate-checkchangedpredictableevents-function-checkchangedpredictableevents-state-ps-src-mq3-client-cgame-playerstate-ml-1711713996"></a>
### checkChangedPredictableEvents

```ml
function checkChangedPredictableEvents(state, ps)
```

CG_CheckChangedPredictableEvents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L129)

<a id="function-function-mq3-client-cgame-playerstate-checklocalsounds-function-checklocalsounds-state-ps-ops-src-mq3-client-cgame-playerstate-ml-129841690"></a>
### checkLocalSounds

```ml
function checkLocalSounds(state, ps, ops)
```

CG_CheckLocalSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |
| `ops` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L142)

<a id="function-function-mq3-client-cgame-playerstate-checkplayerstateevents-function-checkplayerstateevents-state-ps-ops-src-mq3-client-cgame-playerstate-ml-253176742"></a>
### checkPlayerstateEvents

```ml
function checkPlayerstateEvents(state, ps, ops)
```

CG_CheckPlayerstateEvents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |
| `ops` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L120)

<a id="function-function-mq3-client-cgame-playerstate-create-function-create-src-mq3-client-cgame-playerstate-ml-470676058"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L79)

<a id="constant-constant-mq3-client-cgame-playerstate-damage-time-const-damage-time-cgabi-damage-time-src-mq3-client-cgame-playerstate-ml-1105723350"></a>
### DAMAGE_TIME

```ml
const DAMAGE_TIME = cgabi.DAMAGE_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L45)

<a id="function-function-mq3-client-cgame-playerstate-damagefeedback-function-damagefeedback-state-ps-yawbyte-pitchbyte-damage-src-mq3-client-cgame-playerstate-ml-1206774818"></a>
### damageFeedback

```ml
function damageFeedback(state, ps, yawByte, pitchByte, damage)
```

CG_DamageFeedback

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |
| `yawByte` | `dynamic` | — |  |
| `pitchByte` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L100)

<a id="function-function-mq3-client-cgame-playerstate-emit-function-emit-state-kind-a-b-c-src-mq3-client-cgame-playerstate-ml-767316005"></a>
### emit

```ml
function emit(state, kind, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L83)

<a id="function-function-mq3-client-cgame-playerstate-entityevent-function-entityevent-state-event-eventparm-clientnum-src-mq3-client-cgame-playerstate-ml-1709370672"></a>
### entityEvent

```ml
function entityEvent(state, event, eventParm, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `eventParm` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L117)

<a id="constant-constant-mq3-client-cgame-playerstate-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-playerstate-ml-631942899"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L36)

<a id="constant-constant-mq3-client-cgame-playerstate-gt-team-const-gt-team-3-src-mq3-client-cgame-playerstate-ml-1051892882"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L35)

<a id="function-function-mq3-client-cgame-playerstate-localsound-function-localsound-state-sound-channel-src-mq3-client-cgame-playerstate-ml-536342501"></a>
### localSound

```ml
function localSound(state, sound, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L84)

<a id="constant-constant-mq3-client-cgame-playerstate-m-assist-const-m-assist-106-src-mq3-client-cgame-playerstate-ml-814980318"></a>
### M_ASSIST

```ml
const M_ASSIST = 106
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L75)

<a id="constant-constant-mq3-client-cgame-playerstate-m-capture-const-m-capture-101-src-mq3-client-cgame-playerstate-ml-503383987"></a>
### M_CAPTURE

```ml
const M_CAPTURE = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L70)

<a id="constant-constant-mq3-client-cgame-playerstate-m-defend-const-m-defend-105-src-mq3-client-cgame-playerstate-ml-1529742185"></a>
### M_DEFEND

```ml
const M_DEFEND = 105
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L74)

<a id="constant-constant-mq3-client-cgame-playerstate-m-excellent-const-m-excellent-103-src-mq3-client-cgame-playerstate-ml-60039597"></a>
### M_EXCELLENT

```ml
const M_EXCELLENT = 103
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L72)

<a id="constant-constant-mq3-client-cgame-playerstate-m-gauntlet-const-m-gauntlet-104-src-mq3-client-cgame-playerstate-ml-2054365634"></a>
### M_GAUNTLET

```ml
const M_GAUNTLET = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L73)

<a id="constant-constant-mq3-client-cgame-playerstate-m-impressive-const-m-impressive-102-src-mq3-client-cgame-playerstate-ml-410295698"></a>
### M_IMPRESSIVE

```ml
const M_IMPRESSIVE = 102
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L71)

<a id="constant-constant-mq3-client-cgame-playerstate-max-predicted-events-const-max-predicted-events-cgabi-max-predicted-events-src-mq3-client-cgame-playerstate-ml-357567348"></a>
### MAX_PREDICTED_EVENTS

```ml
const MAX_PREDICTED_EVENTS = cgabi.MAX_PREDICTED_EVENTS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L43)

<a id="constant-constant-mq3-client-cgame-playerstate-max-ps-events-const-max-ps-events-2-src-mq3-client-cgame-playerstate-ml-1602894593"></a>
### MAX_PS_EVENTS

```ml
const MAX_PS_EVENTS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L42)

<a id="constant-constant-mq3-client-cgame-playerstate-max-rewardstack-const-max-rewardstack-cgabi-max-rewardstack-src-mq3-client-cgame-playerstate-ml-1309149713"></a>
### MAX_REWARDSTACK

```ml
const MAX_REWARDSTACK = cgabi.MAX_REWARDSTACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L44)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-assist-count-const-pers-assist-count-12-src-mq3-client-cgame-playerstate-ml-1008627950"></a>
### PERS_ASSIST_COUNT

```ml
const PERS_ASSIST_COUNT = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L22)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-attackee-armor-const-pers-attackee-armor-7-src-mq3-client-cgame-playerstate-ml-406524682"></a>
### PERS_ATTACKEE_ARMOR

```ml
const PERS_ATTACKEE_ARMOR = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L18)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-captures-const-pers-captures-14-src-mq3-client-cgame-playerstate-ml-1016533304"></a>
### PERS_CAPTURES

```ml
const PERS_CAPTURES = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L24)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-defend-count-const-pers-defend-count-11-src-mq3-client-cgame-playerstate-ml-386233171"></a>
### PERS_DEFEND_COUNT

```ml
const PERS_DEFEND_COUNT = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L21)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-excellent-count-const-pers-excellent-count-10-src-mq3-client-cgame-playerstate-ml-2096565900"></a>
### PERS_EXCELLENT_COUNT

```ml
const PERS_EXCELLENT_COUNT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L20)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-gauntlet-frag-count-const-pers-gauntlet-frag-count-13-src-mq3-client-cgame-playerstate-ml-571539599"></a>
### PERS_GAUNTLET_FRAG_COUNT

```ml
const PERS_GAUNTLET_FRAG_COUNT = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L23)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-hits-const-pers-hits-1-src-mq3-client-cgame-playerstate-ml-873895992"></a>
### PERS_HITS

```ml
const PERS_HITS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L13)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-impressive-count-const-pers-impressive-count-9-src-mq3-client-cgame-playerstate-ml-195221684"></a>
### PERS_IMPRESSIVE_COUNT

```ml
const PERS_IMPRESSIVE_COUNT = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L19)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-playerevents-const-pers-playerevents-5-src-mq3-client-cgame-playerstate-ml-432676452"></a>
### PERS_PLAYEREVENTS

```ml
const PERS_PLAYEREVENTS = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L17)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-rank-const-pers-rank-2-src-mq3-client-cgame-playerstate-ml-1236434777"></a>
### PERS_RANK

```ml
const PERS_RANK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L14)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-spawn-count-const-pers-spawn-count-4-src-mq3-client-cgame-playerstate-ml-1411349313"></a>
### PERS_SPAWN_COUNT

```ml
const PERS_SPAWN_COUNT = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L16)

<a id="constant-constant-mq3-client-cgame-playerstate-pers-team-const-pers-team-3-src-mq3-client-cgame-playerstate-ml-1991738850"></a>
### PERS_TEAM

```ml
const PERS_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L15)

<a id="constant-constant-mq3-client-cgame-playerstate-playerevent-deniedreward-const-playerevent-deniedreward-1-src-mq3-client-cgame-playerstate-ml-388435254"></a>
### PLAYEREVENT_DENIEDREWARD

```ml
const PLAYEREVENT_DENIEDREWARD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L39)

<a id="constant-constant-mq3-client-cgame-playerstate-playerevent-gauntletreward-const-playerevent-gauntletreward-2-src-mq3-client-cgame-playerstate-ml-1328703985"></a>
### PLAYEREVENT_GAUNTLETREWARD

```ml
const PLAYEREVENT_GAUNTLETREWARD = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L40)

<a id="constant-constant-mq3-client-cgame-playerstate-playerevent-holyshit-const-playerevent-holyshit-4-src-mq3-client-cgame-playerstate-ml-36161397"></a>
### PLAYEREVENT_HOLYSHIT

```ml
const PLAYEREVENT_HOLYSHIT = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L41)

<a id="constant-constant-mq3-client-cgame-playerstate-pm-intermission-const-pm-intermission-5-src-mq3-client-cgame-playerstate-ml-1332294884"></a>
### PM_INTERMISSION

```ml
const PM_INTERMISSION = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L37)

<a id="function-function-mq3-client-cgame-playerstate-pushreward-function-pushreward-state-sound-shader-count-src-mq3-client-cgame-playerstate-ml-1923202484"></a>
### pushReward

```ml
function pushReward(state, sound, shader, count)
```

pushReward

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L137)

<a id="constant-constant-mq3-client-cgame-playerstate-pw-blueflag-const-pw-blueflag-8-src-mq3-client-cgame-playerstate-ml-989223047"></a>
### PW_BLUEFLAG

```ml
const PW_BLUEFLAG = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L26)

<a id="constant-constant-mq3-client-cgame-playerstate-pw-neutralflag-const-pw-neutralflag-9-src-mq3-client-cgame-playerstate-ml-2131021280"></a>
### PW_NEUTRALFLAG

```ml
const PW_NEUTRALFLAG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L27)

<a id="constant-constant-mq3-client-cgame-playerstate-pw-redflag-const-pw-redflag-7-src-mq3-client-cgame-playerstate-ml-1032678590"></a>
### PW_REDFLAG

```ml
const PW_REDFLAG = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L25)

<a id="constant-constant-mq3-client-cgame-playerstate-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-cgame-playerstate-ml-526905121"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L38)

<a id="function-function-mq3-client-cgame-playerstate-respawn-function-respawn-state-ps-src-mq3-client-cgame-playerstate-ml-682357476"></a>
### respawn

```ml
function respawn(state, ps)
```

CG_Respawn

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L115)

<a id="constant-constant-mq3-client-cgame-playerstate-s-assist-const-s-assist-9-src-mq3-client-cgame-playerstate-ml-904238440"></a>
### S_ASSIST

```ml
const S_ASSIST = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L57)

<a id="constant-constant-mq3-client-cgame-playerstate-s-capture-const-s-capture-4-src-mq3-client-cgame-playerstate-ml-1763694055"></a>
### S_CAPTURE

```ml
const S_CAPTURE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L52)

<a id="constant-constant-mq3-client-cgame-playerstate-s-defend-const-s-defend-8-src-mq3-client-cgame-playerstate-ml-1179316001"></a>
### S_DEFEND

```ml
const S_DEFEND = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L56)

<a id="constant-constant-mq3-client-cgame-playerstate-s-denied-const-s-denied-10-src-mq3-client-cgame-playerstate-ml-247692796"></a>
### S_DENIED

```ml
const S_DENIED = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L58)

<a id="constant-constant-mq3-client-cgame-playerstate-s-excellent-const-s-excellent-6-src-mq3-client-cgame-playerstate-ml-1468221297"></a>
### S_EXCELLENT

```ml
const S_EXCELLENT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L54)

<a id="constant-constant-mq3-client-cgame-playerstate-s-five-minute-const-s-five-minute-18-src-mq3-client-cgame-playerstate-ml-1085582020"></a>
### S_FIVE_MINUTE

```ml
const S_FIVE_MINUTE = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L66)

<a id="constant-constant-mq3-client-cgame-playerstate-s-hit-const-s-hit-2-src-mq3-client-cgame-playerstate-ml-729367449"></a>
### S_HIT

```ml
const S_HIT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L50)

<a id="constant-constant-mq3-client-cgame-playerstate-s-hit-team-const-s-hit-team-3-src-mq3-client-cgame-playerstate-ml-75533050"></a>
### S_HIT_TEAM

```ml
const S_HIT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L51)

<a id="constant-constant-mq3-client-cgame-playerstate-s-holyshit-const-s-holyshit-11-src-mq3-client-cgame-playerstate-ml-196676285"></a>
### S_HOLYSHIT

```ml
const S_HOLYSHIT = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L59)

<a id="constant-constant-mq3-client-cgame-playerstate-s-humiliation-const-s-humiliation-7-src-mq3-client-cgame-playerstate-ml-359825126"></a>
### S_HUMILIATION

```ml
const S_HUMILIATION = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L55)

<a id="constant-constant-mq3-client-cgame-playerstate-s-impressive-const-s-impressive-5-src-mq3-client-cgame-playerstate-ml-996045868"></a>
### S_IMPRESSIVE

```ml
const S_IMPRESSIVE = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L53)

<a id="constant-constant-mq3-client-cgame-playerstate-s-lost-lead-const-s-lost-lead-15-src-mq3-client-cgame-playerstate-ml-1923746179"></a>
### S_LOST_LEAD

```ml
const S_LOST_LEAD = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L63)

<a id="constant-constant-mq3-client-cgame-playerstate-s-no-ammo-const-s-no-ammo-1-src-mq3-client-cgame-playerstate-ml-1380306932"></a>
### S_NO_AMMO

```ml
const S_NO_AMMO = 1
```

The integer media values are observation tags.  They intentionally do not call the renderer/audio traps a second time beside the real cgame QVM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L49)

<a id="constant-constant-mq3-client-cgame-playerstate-s-one-frag-const-s-one-frag-19-src-mq3-client-cgame-playerstate-ml-1161997387"></a>
### S_ONE_FRAG

```ml
const S_ONE_FRAG = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L67)

<a id="constant-constant-mq3-client-cgame-playerstate-s-one-minute-const-s-one-minute-17-src-mq3-client-cgame-playerstate-ml-2016898425"></a>
### S_ONE_MINUTE

```ml
const S_ONE_MINUTE = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L65)

<a id="constant-constant-mq3-client-cgame-playerstate-s-sudden-death-const-s-sudden-death-16-src-mq3-client-cgame-playerstate-ml-2140272244"></a>
### S_SUDDEN_DEATH

```ml
const S_SUDDEN_DEATH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L64)

<a id="constant-constant-mq3-client-cgame-playerstate-s-taken-lead-const-s-taken-lead-13-src-mq3-client-cgame-playerstate-ml-294904743"></a>
### S_TAKEN_LEAD

```ml
const S_TAKEN_LEAD = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L61)

<a id="constant-constant-mq3-client-cgame-playerstate-s-three-frag-const-s-three-frag-21-src-mq3-client-cgame-playerstate-ml-1769615104"></a>
### S_THREE_FRAG

```ml
const S_THREE_FRAG = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L69)

<a id="constant-constant-mq3-client-cgame-playerstate-s-tied-lead-const-s-tied-lead-14-src-mq3-client-cgame-playerstate-ml-1678779980"></a>
### S_TIED_LEAD

```ml
const S_TIED_LEAD = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L62)

<a id="constant-constant-mq3-client-cgame-playerstate-s-two-frag-const-s-two-frag-20-src-mq3-client-cgame-playerstate-ml-1072189107"></a>
### S_TWO_FRAG

```ml
const S_TWO_FRAG = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L68)

<a id="constant-constant-mq3-client-cgame-playerstate-s-you-have-flag-const-s-you-have-flag-12-src-mq3-client-cgame-playerstate-ml-1649419942"></a>
### S_YOU_HAVE_FLAG

```ml
const S_YOU_HAVE_FLAG = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L60)

<a id="constant-constant-mq3-client-cgame-playerstate-stat-health-const-stat-health-0-src-mq3-client-cgame-playerstate-ml-1162234759"></a>
### STAT_HEALTH

```ml
const STAT_HEALTH = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L11)

<a id="constant-constant-mq3-client-cgame-playerstate-stat-weapons-const-stat-weapons-2-src-mq3-client-cgame-playerstate-ml-2080355943"></a>
### STAT_WEAPONS

```ml
const STAT_WEAPONS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L12)

- [mq3.client.cgame_playerstate.State](Type-mq3-client-cgame-playerstate-state-1047346034.md) — struct
<a id="constant-constant-mq3-client-cgame-playerstate-team-spectator-const-team-spectator-3-src-mq3-client-cgame-playerstate-ml-1211222242"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L34)

<a id="function-function-mq3-client-cgame-playerstate-transitionplayerstate-function-transitionplayerstate-state-ps-old-src-mq3-client-cgame-playerstate-ml-825468267"></a>
### transitionPlayerState

```ml
function transitionPlayerState(state, ps, old)
```

CG_TransitionPlayerState.  Event and sound actions are observation only.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |
| `old` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L177)

<a id="constant-constant-mq3-client-cgame-playerstate-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-cgame-playerstate-ml-78066783"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L30)

<a id="constant-constant-mq3-client-cgame-playerstate-wp-machinegun-const-wp-machinegun-2-src-mq3-client-cgame-playerstate-ml-1597030097"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L28)

<a id="constant-constant-mq3-client-cgame-playerstate-wp-num-weapons-const-wp-num-weapons-11-src-mq3-client-cgame-playerstate-ml-617722933"></a>
### WP_NUM_WEAPONS

```ml
const WP_NUM_WEAPONS = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L33)

<a id="constant-constant-mq3-client-cgame-playerstate-wp-railgun-const-wp-railgun-7-src-mq3-client-cgame-playerstate-ml-498426484"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L32)

<a id="constant-constant-mq3-client-cgame-playerstate-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-cgame-playerstate-ml-1924983024"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L31)

<a id="constant-constant-mq3-client-cgame-playerstate-wp-shotgun-const-wp-shotgun-3-src-mq3-client-cgame-playerstate-ml-1494126708"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_playerstate.ml#L29)
