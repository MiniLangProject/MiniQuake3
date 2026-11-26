# `src/mq3/client/playable_match.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_match`](Package-mq3-client-playable-match-1403407961.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-client-playable-match-announcer-fight-const-announcer-fight-4-src-mq3-client-playable-match-ml-1781922761"></a>
### ANNOUNCER_FIGHT

```ml
const ANNOUNCER_FIGHT = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L18)

<a id="constant-constant-mq3-client-playable-match-announcer-none-const-announcer-none-0-src-mq3-client-playable-match-ml-328061303"></a>
### ANNOUNCER_NONE

```ml
const ANNOUNCER_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L14)

<a id="constant-constant-mq3-client-playable-match-announcer-one-const-announcer-one-3-src-mq3-client-playable-match-ml-133858126"></a>
### ANNOUNCER_ONE

```ml
const ANNOUNCER_ONE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L17)

<a id="constant-constant-mq3-client-playable-match-announcer-three-const-announcer-three-1-src-mq3-client-playable-match-ml-1651522180"></a>
### ANNOUNCER_THREE

```ml
const ANNOUNCER_THREE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L15)

<a id="constant-constant-mq3-client-playable-match-announcer-two-const-announcer-two-2-src-mq3-client-playable-match-ml-1946280439"></a>
### ANNOUNCER_TWO

```ml
const ANNOUNCER_TWO = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L16)

<a id="function-function-mq3-client-playable-match-announcercue-function-announcercue-message-src-mq3-client-playable-match-ml-1908077635"></a>
### announcerCue

```ml
function announcerCue(message)
```

Evaluates playable match `announcerCue` and returns `ANNOUNCER_THREE`, `ANNOUNCER_TWO`, `ANNOUNCER_ONE` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Value used by `if message=="3" then return ANNOUNCER_THREE end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L85)

<a id="function-function-mq3-client-playable-match-clock-function-clock-state-now-src-mq3-client-playable-match-ml-1312635481"></a>
### clock

```ml
function clock(state, now)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.playable_match.twoDigits` from playable match `clock`. The final path returns `twoDigits(minutes)+":"+twoDigits(seconds)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.phase`, `state.matchStart`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L65)

<a id="function-function-mq3-client-playable-match-create-function-create-fraglimit-timelimitminutes-warmupmilliseconds-src-mq3-client-playable-match-ml-1175348300"></a>
### create

```ml
function create(fragLimit, timeLimitMinutes, warmupMilliseconds)
```

Calls `mq3.client.playable_match.State` from playable match `create`. The final path returns `State(PHASE_WAITING,fragLimit,timeLimitMinutes*60000,warmupMilliseconds,0,0,0,WINNER_NONE)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fragLimit` | `dynamic` | — | Value used by `if fragLimit<1 or timeLimitMinutes<1 or warmupMilliseconds<0 then return fail("positive limits and non-negative warmup required") end if`. |
| `timeLimitMinutes` | `dynamic` | — | Value used by `if fragLimit<1 or timeLimitMinutes<1 or warmupMilliseconds<0 then return fail("positive limits and non-negative warmup required") end if`. |
| `warmupMilliseconds` | `dynamic` | — | Value used by `if fragLimit<1 or timeLimitMinutes<1 or warmupMilliseconds<0 then return fail("positive limits and non-negative warmup required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L33)

<a id="function-function-mq3-client-playable-match-fail-function-fail-message-src-mq3-client-playable-match-ml-1412568363"></a>
### fail

```ml
function fail(message)
```

Creates the playable match error `7620` with diagnostic text `"preview match: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview match: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L27)

<a id="constant-constant-mq3-client-playable-match-phase-active-const-phase-active-2-src-mq3-client-playable-match-ml-966071561"></a>
### PHASE_ACTIVE

```ml
const PHASE_ACTIVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L9)

<a id="constant-constant-mq3-client-playable-match-phase-intermission-const-phase-intermission-3-src-mq3-client-playable-match-ml-1670811392"></a>
### PHASE_INTERMISSION

```ml
const PHASE_INTERMISSION = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L10)

<a id="constant-constant-mq3-client-playable-match-phase-waiting-const-phase-waiting-0-src-mq3-client-playable-match-ml-1271267173"></a>
### PHASE_WAITING

```ml
const PHASE_WAITING = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L7)

<a id="constant-constant-mq3-client-playable-match-phase-warmup-const-phase-warmup-1-src-mq3-client-playable-match-ml-1358394546"></a>
### PHASE_WARMUP

```ml
const PHASE_WARMUP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L8)

<a id="function-function-mq3-client-playable-match-secondsceil-function-secondsceil-milliseconds-src-mq3-client-playable-match-ml-151716640"></a>
### secondsCeil

```ml
function secondsCeil(milliseconds)
```

Calls `mq3.compat.numeric.trunc32` from playable match `secondsCeil`. The final path returns `numeric.trunc32((milliseconds+999)/1000)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L50)

<a id="function-function-mq3-client-playable-match-snapshot-function-snapshot-state-changed-message-playerscore-enemyscore-now-src-mq3-client-playable-match-ml-705310295"></a>
### snapshot

```ml
function snapshot(state, changed, message, playerScore, enemyScore, now)
```

Calls `mq3.client.playable_match.secondsCeil`, `mq3.client.playable_match.Update`, `mq3.client.playable_match.clock` from playable match `snapshot`. The final path returns `Update(state.phase,changed,message,playerScore,enemyScore,remaining,clock(state,now))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.phase`, `state.timeLimitMilliseconds`, `state.matchStart`. |
| `changed` | `dynamic` | — | Value used by `return Update(state.phase,changed,message,playerScore,enemyScore,remaining,clock(state,now))`. |
| `message` | `dynamic` | — | Value used by `return Update(state.phase,changed,message,playerScore,enemyScore,remaining,clock(state,now))`. |
| `playerScore` | `dynamic` | — | Value used by `return Update(state.phase,changed,message,playerScore,enemyScore,remaining,clock(state,now))`. |
| `enemyScore` | `dynamic` | — | Value used by `return Update(state.phase,changed,message,playerScore,enemyScore,remaining,clock(state,now))`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L100)

<a id="function-function-mq3-client-playable-match-start-function-start-state-now-src-mq3-client-playable-match-ml-2077754913"></a>
### start

```ml
function start(state, now)
```

Updates `state.warmupStart`, `state.matchStart`, `state.intermissionAt`, `state.winner` and additional values during playable match `start`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable match record/storage; this routine assigns `state.warmupStart`, `state.matchStart`, `state.intermissionAt`, `state.winner` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L41)

- [mq3.client.playable_match.State](Type-mq3-client-playable-match-state-1582804198.md) — struct
<a id="function-function-mq3-client-playable-match-twodigits-function-twodigits-value-src-mq3-client-playable-match-ml-258793521"></a>
### twoDigits

```ml
function twoDigits(value)
```

Evaluates playable match `twoDigits` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<10` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L57)

<a id="function-function-mq3-client-playable-match-update-function-update-state-now-playerscore-enemyscore-src-mq3-client-playable-match-ml-948116190"></a>
### update

```ml
function update(state, now, playerScore, enemyScore)
```

Updates `state.phase`, `state.intermissionAt`, `state.winner` during playable match `update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable match record/storage; this routine assigns `state.phase`, `state.intermissionAt`, `state.winner`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `playerScore` | `dynamic` | — | Value used by `if state==void or now<0 or playerScore<0 or enemyScore<0 then return fail("valid state, time and scores required") end if`. |
| `enemyScore` | `dynamic` | — | Value used by `if state==void or now<0 or playerScore<0 or enemyScore<0 then return fail("valid state, time and scores required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L111)

- [mq3.client.playable_match.Update](Type-mq3-client-playable-match-update-732849796.md) — struct
<a id="function-function-mq3-client-playable-match-warmupmessage-function-warmupmessage-state-now-src-mq3-client-playable-match-ml-216195479"></a>
### warmupMessage

```ml
function warmupMessage(state, now)
```

Calls `mq3.client.playable_match.secondsCeil` from playable match `warmupMessage`. The final path returns `str(remaining)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.phase`, `state.matchStart`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L75)

<a id="constant-constant-mq3-client-playable-match-winner-enemies-const-winner-enemies-2-src-mq3-client-playable-match-ml-1223727573"></a>
### WINNER_ENEMIES

```ml
const WINNER_ENEMIES = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L13)

<a id="constant-constant-mq3-client-playable-match-winner-none-const-winner-none-0-src-mq3-client-playable-match-ml-1435172081"></a>
### WINNER_NONE

```ml
const WINNER_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L11)

<a id="constant-constant-mq3-client-playable-match-winner-player-const-winner-player-1-src-mq3-client-playable-match-ml-468369992"></a>
### WINNER_PLAYER

```ml
const WINNER_PLAYER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_match.ml#L12)
