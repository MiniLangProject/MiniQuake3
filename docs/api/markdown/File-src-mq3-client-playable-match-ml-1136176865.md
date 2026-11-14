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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L18)

<a id="constant-constant-mq3-client-playable-match-announcer-none-const-announcer-none-0-src-mq3-client-playable-match-ml-328061303"></a>
### ANNOUNCER_NONE

```ml
const ANNOUNCER_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L14)

<a id="constant-constant-mq3-client-playable-match-announcer-one-const-announcer-one-3-src-mq3-client-playable-match-ml-133858126"></a>
### ANNOUNCER_ONE

```ml
const ANNOUNCER_ONE = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L17)

<a id="constant-constant-mq3-client-playable-match-announcer-three-const-announcer-three-1-src-mq3-client-playable-match-ml-1651522180"></a>
### ANNOUNCER_THREE

```ml
const ANNOUNCER_THREE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L15)

<a id="constant-constant-mq3-client-playable-match-announcer-two-const-announcer-two-2-src-mq3-client-playable-match-ml-1946280439"></a>
### ANNOUNCER_TWO

```ml
const ANNOUNCER_TWO = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L16)

<a id="function-function-mq3-client-playable-match-announcercue-function-announcercue-message-src-mq3-client-playable-match-ml-1908077635"></a>
### announcerCue

```ml
function announcerCue(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L62)

<a id="function-function-mq3-client-playable-match-clock-function-clock-state-now-src-mq3-client-playable-match-ml-1312635481"></a>
### clock

```ml
function clock(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L47)

<a id="function-function-mq3-client-playable-match-create-function-create-fraglimit-timelimitminutes-warmupmilliseconds-src-mq3-client-playable-match-ml-1175348300"></a>
### create

```ml
function create(fragLimit, timeLimitMinutes, warmupMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fragLimit` | `dynamic` | — |  |
| `timeLimitMinutes` | `dynamic` | — |  |
| `warmupMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L25)

<a id="function-function-mq3-client-playable-match-fail-function-fail-message-src-mq3-client-playable-match-ml-1412568363"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L23)

<a id="constant-constant-mq3-client-playable-match-phase-active-const-phase-active-2-src-mq3-client-playable-match-ml-966071561"></a>
### PHASE_ACTIVE

```ml
const PHASE_ACTIVE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L9)

<a id="constant-constant-mq3-client-playable-match-phase-intermission-const-phase-intermission-3-src-mq3-client-playable-match-ml-1670811392"></a>
### PHASE_INTERMISSION

```ml
const PHASE_INTERMISSION = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L10)

<a id="constant-constant-mq3-client-playable-match-phase-waiting-const-phase-waiting-0-src-mq3-client-playable-match-ml-1271267173"></a>
### PHASE_WAITING

```ml
const PHASE_WAITING = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L7)

<a id="constant-constant-mq3-client-playable-match-phase-warmup-const-phase-warmup-1-src-mq3-client-playable-match-ml-1358394546"></a>
### PHASE_WARMUP

```ml
const PHASE_WARMUP = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L8)

<a id="function-function-mq3-client-playable-match-secondsceil-function-secondsceil-milliseconds-src-mq3-client-playable-match-ml-151716640"></a>
### secondsCeil

```ml
function secondsCeil(milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L37)

<a id="function-function-mq3-client-playable-match-snapshot-function-snapshot-state-changed-message-playerscore-enemyscore-now-src-mq3-client-playable-match-ml-705310295"></a>
### snapshot

```ml
function snapshot(state, changed, message, playerScore, enemyScore, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `changed` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `playerScore` | `dynamic` | — |  |
| `enemyScore` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L70)

<a id="function-function-mq3-client-playable-match-start-function-start-state-now-src-mq3-client-playable-match-ml-2077754913"></a>
### start

```ml
function start(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L30)

- [mq3.client.playable_match.State](Type-mq3-client-playable-match-state-1582804198.md) — struct
<a id="function-function-mq3-client-playable-match-twodigits-function-twodigits-value-src-mq3-client-playable-match-ml-258793521"></a>
### twoDigits

```ml
function twoDigits(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L42)

<a id="function-function-mq3-client-playable-match-update-function-update-state-now-playerscore-enemyscore-src-mq3-client-playable-match-ml-948116190"></a>
### update

```ml
function update(state, now, playerScore, enemyScore)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `playerScore` | `dynamic` | — |  |
| `enemyScore` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L76)

- [mq3.client.playable_match.Update](Type-mq3-client-playable-match-update-732849796.md) — struct
<a id="function-function-mq3-client-playable-match-warmupmessage-function-warmupmessage-state-now-src-mq3-client-playable-match-ml-216195479"></a>
### warmupMessage

```ml
function warmupMessage(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L54)

<a id="constant-constant-mq3-client-playable-match-winner-enemies-const-winner-enemies-2-src-mq3-client-playable-match-ml-1223727573"></a>
### WINNER_ENEMIES

```ml
const WINNER_ENEMIES = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L13)

<a id="constant-constant-mq3-client-playable-match-winner-none-const-winner-none-0-src-mq3-client-playable-match-ml-1435172081"></a>
### WINNER_NONE

```ml
const WINNER_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L11)

<a id="constant-constant-mq3-client-playable-match-winner-player-const-winner-player-1-src-mq3-client-playable-match-ml-468369992"></a>
### WINNER_PLAYER

```ml
const WINNER_PLAYER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_match.ml#L12)
