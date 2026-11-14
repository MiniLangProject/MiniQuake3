# `src/mq3/client/cgame_scoreboard.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_scoreboard`](Package-mq3-client-cgame-scoreboard-1894759419.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-cgame-scoreboard-append-function-append-value-command-src-mq3-client-cgame-scoreboard-ml-2110416320"></a>
### append

```ml
function append(value, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L40)

<a id="constant-constant-mq3-client-cgame-scoreboard-bigchar-height-const-bigchar-height-16-src-mq3-client-cgame-scoreboard-ml-1643848712"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L24)

<a id="constant-constant-mq3-client-cgame-scoreboard-bigchar-width-const-bigchar-width-16-src-mq3-client-cgame-scoreboard-ml-1572764710"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L23)

<a id="function-function-mq3-client-cgame-scoreboard-centergiantline-function-centergiantline-y-text-src-mq3-client-cgame-scoreboard-ml-481888180"></a>
### centerGiantLine

```ml
function centerGiantLine(y, text)
```

CG_CenterGiantLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L125)

<a id="function-function-mq3-client-cgame-scoreboard-client-function-client-name-team-src-mq3-client-cgame-scoreboard-ml-1705253140"></a>
### client

```ml
function client(name, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L36)

- [mq3.client.cgame_scoreboard.Client](Type-mq3-client-cgame-scoreboard-client-577185952.md) — struct
<a id="function-function-mq3-client-cgame-scoreboard-draw-function-draw-kind-x-y-width-height-text-alpha-red-green-blue-clientnum-team-large-src-mq3-client-cgame-scoreboard-ml-1454894454"></a>
### draw

```ml
function draw(kind, x, y, width, height, text, alpha, red, green, blue, clientNum, team, large)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `large` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L38)

- [mq3.client.cgame_scoreboard.Draw](Type-mq3-client-cgame-scoreboard-draw-39659597.md) — struct
<a id="function-function-mq3-client-cgame-scoreboard-drawclientscore-function-drawclientscore-value-y-entry-fade-largeformat-src-mq3-client-cgame-scoreboard-ml-1059609034"></a>
### drawClientScore

```ml
function drawClientScore(value, y, entry, fade, largeFormat)
```

CG_DrawClientScore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `entry` | `dynamic` | — |  |
| `fade` | `dynamic` | — |  |
| `largeFormat` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L61)

<a id="function-function-mq3-client-cgame-scoreboard-drawoldscoreboard-function-drawoldscoreboard-value-src-mq3-client-cgame-scoreboard-ml-1698690215"></a>
### drawOldScoreboard

```ml
function drawOldScoreboard(value)
```

CG_DrawOldScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L95)

<a id="function-function-mq3-client-cgame-scoreboard-drawoldtourneyscoreboard-function-drawoldtourneyscoreboard-value-src-mq3-client-cgame-scoreboard-ml-316814165"></a>
### drawOldTourneyScoreboard

```ml
function drawOldTourneyScoreboard(value)
```

CG_DrawOldTourneyScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L128)

<a id="constant-constant-mq3-client-cgame-scoreboard-fade-time-const-fade-time-200-src-mq3-client-cgame-scoreboard-ml-2012495239"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L27)

<a id="function-function-mq3-client-cgame-scoreboard-fadealpha-function-fadealpha-statevalue-src-mq3-client-cgame-scoreboard-ml-352665916"></a>
### fadeAlpha

```ml
function fadeAlpha(stateValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stateValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L53)

<a id="function-function-mq3-client-cgame-scoreboard-frame-function-frame-drawn-src-mq3-client-cgame-scoreboard-ml-2070318674"></a>
### frame

```ml
function frame(drawn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L39)

- [mq3.client.cgame_scoreboard.Frame](Type-mq3-client-cgame-scoreboard-frame-549841652.md) — struct
<a id="constant-constant-mq3-client-cgame-scoreboard-giant-height-const-giant-height-48-src-mq3-client-cgame-scoreboard-ml-570988095"></a>
### GIANT_HEIGHT

```ml
const GIANT_HEIGHT = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L26)

<a id="constant-constant-mq3-client-cgame-scoreboard-giant-width-const-giant-width-32-src-mq3-client-cgame-scoreboard-ml-672136752"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L25)

<a id="constant-constant-mq3-client-cgame-scoreboard-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-scoreboard-ml-272210325"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L11)

<a id="constant-constant-mq3-client-cgame-scoreboard-gt-team-const-gt-team-3-src-mq3-client-cgame-scoreboard-ml-2027502642"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L12)

<a id="function-function-mq3-client-cgame-scoreboard-padleft-function-padleft-value-width-src-mq3-client-cgame-scoreboard-ml-664432577"></a>
### padLeft

```ml
function padLeft(value, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L56)

<a id="function-function-mq3-client-cgame-scoreboard-placestring-function-placestring-rank-src-mq3-client-cgame-scoreboard-ml-1839883584"></a>
### placeString

```ml
function placeString(rank)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rank` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L48)

<a id="constant-constant-mq3-client-cgame-scoreboard-pm-dead-const-pm-dead-3-src-mq3-client-cgame-scoreboard-ml-293227478"></a>
### PM_DEAD

```ml
const PM_DEAD = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L13)

<a id="constant-constant-mq3-client-cgame-scoreboard-pm-intermission-const-pm-intermission-5-src-mq3-client-cgame-scoreboard-ml-2089693976"></a>
### PM_INTERMISSION

```ml
const PM_INTERMISSION = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L14)

<a id="function-function-mq3-client-cgame-scoreboard-printablelength-function-printablelength-text-src-mq3-client-cgame-scoreboard-ml-1829043883"></a>
### printableLength

```ml
function printableLength(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L41)

<a id="constant-constant-mq3-client-cgame-scoreboard-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-cgame-scoreboard-ml-69180123"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L15)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-header-const-sb-header-86-src-mq3-client-cgame-scoreboard-ml-1306396957"></a>
### SB_HEADER

```ml
const SB_HEADER = 86
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L16)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-inter-height-const-sb-inter-height-16-src-mq3-client-cgame-scoreboard-ml-2009511194"></a>
### SB_INTER_HEIGHT

```ml
const SB_INTER_HEIGHT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L20)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-maxclients-inter-const-sb-maxclients-inter-17-src-mq3-client-cgame-scoreboard-ml-57423179"></a>
### SB_MAXCLIENTS_INTER

```ml
const SB_MAXCLIENTS_INTER = 17
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L22)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-maxclients-normal-const-sb-maxclients-normal-7-src-mq3-client-cgame-scoreboard-ml-156474884"></a>
### SB_MAXCLIENTS_NORMAL

```ml
const SB_MAXCLIENTS_NORMAL = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L21)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-normal-height-const-sb-normal-height-40-src-mq3-client-cgame-scoreboard-ml-378427735"></a>
### SB_NORMAL_HEIGHT

```ml
const SB_NORMAL_HEIGHT = 40
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L19)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-statusbar-const-sb-statusbar-420-src-mq3-client-cgame-scoreboard-ml-1187546883"></a>
### SB_STATUSBAR

```ml
const SB_STATUSBAR = 420
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L18)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-top-const-sb-top-118-src-mq3-client-cgame-scoreboard-ml-1836646787"></a>
### SB_TOP

```ml
const SB_TOP = 118
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L17)

<a id="function-function-mq3-client-cgame-scoreboard-score-function-score-client-points-ping-time-src-mq3-client-cgame-scoreboard-ml-1119368343"></a>
### score

```ml
function score(client, points, ping, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L35)

- [mq3.client.cgame_scoreboard.Score](Type-mq3-client-cgame-scoreboard-score-1835543747.md) — struct
<a id="function-function-mq3-client-cgame-scoreboard-state-function-state-src-mq3-client-cgame-scoreboard-ml-1633129108"></a>
### state

```ml
function state()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L37)

- [mq3.client.cgame_scoreboard.State](Type-mq3-client-cgame-scoreboard-state-423630336.md) — struct
<a id="constant-constant-mq3-client-cgame-scoreboard-team-blue-const-team-blue-2-src-mq3-client-cgame-scoreboard-ml-89247283"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L9)

<a id="constant-constant-mq3-client-cgame-scoreboard-team-free-const-team-free-0-src-mq3-client-cgame-scoreboard-ml-1996183673"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L7)

<a id="constant-constant-mq3-client-cgame-scoreboard-team-red-const-team-red-1-src-mq3-client-cgame-scoreboard-ml-1565434272"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L8)

<a id="constant-constant-mq3-client-cgame-scoreboard-team-spectator-const-team-spectator-3-src-mq3-client-cgame-scoreboard-ml-390687050"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L10)

<a id="function-function-mq3-client-cgame-scoreboard-teamscoreboard-function-teamscoreboard-value-y-team-fade-maxclients-lineheight-src-mq3-client-cgame-scoreboard-ml-57246262"></a>
### teamScoreboard

```ml
function teamScoreboard(value, y, team, fade, maxClients, lineHeight)
```

CG_TeamScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `fade` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |
| `lineHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L83)
