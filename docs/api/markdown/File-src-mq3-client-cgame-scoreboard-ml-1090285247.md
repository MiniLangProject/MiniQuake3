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

Updates `value.commands` during client game scoreboard `append`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game scoreboard record/storage; this routine assigns `value.commands`. |
| `command` | `dynamic` | — | Value used by `value.commands=value.commands+[command]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L208)

<a id="constant-constant-mq3-client-cgame-scoreboard-bigchar-height-const-bigchar-height-16-src-mq3-client-cgame-scoreboard-ml-1643848712"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```

Bigchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L44)

<a id="constant-constant-mq3-client-cgame-scoreboard-bigchar-width-const-bigchar-width-16-src-mq3-client-cgame-scoreboard-ml-1572764710"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```

Bigchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L42)

<a id="function-function-mq3-client-cgame-scoreboard-centergiantline-function-centergiantline-y-text-src-mq3-client-cgame-scoreboard-ml-481888180"></a>
### centerGiantLine

```ml
function centerGiantLine(y, text)
```

CG_CenterGiantLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cgame_scoreboard.draw`. |
| `text` | `dynamic` | — | Argument 2, 6 of `mq3.client.cgame_scoreboard.draw`; passed as `(640-GIANT_WIDTH*printableLength(text))/2`, `text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L316)

<a id="function-function-mq3-client-cgame-scoreboard-client-function-client-name-team-src-mq3-client-cgame-scoreboard-ml-1705253140"></a>
### client

```ml
function client(name, team)
```

Creates a `mq3.client.cgame_scoreboard.Client` record. Assigns `name` from `name`, `team` from `team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `Client.name`. |
| `team` | `dynamic` | — | Value used to initialize `Client.team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L184)

- [mq3.client.cgame_scoreboard.Client](Type-mq3-client-cgame-scoreboard-client-577185952.md) — struct
<a id="function-function-mq3-client-cgame-scoreboard-draw-function-draw-kind-x-y-width-height-text-alpha-red-green-blue-clientnum-team-large-src-mq3-client-cgame-scoreboard-ml-1454894454"></a>
### draw

```ml
function draw(kind, x, y, width, height, text, alpha, red, green, blue, clientNum, team, large)
```

Creates a `mq3.client.cgame_scoreboard.Draw` record. Assigns `kind` from `kind`, `x` from `x`, `y` from `y`, `width` from `width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `Draw.kind`. |
| `x` | `dynamic` | — | Value used to initialize `Draw.x`. |
| `y` | `dynamic` | — | Value used to initialize `Draw.y`. |
| `width` | `dynamic` | — | Value used to initialize `Draw.width`. |
| `height` | `dynamic` | — | Value used to initialize `Draw.height`. |
| `text` | `dynamic` | — | Value used to initialize `Draw.text`. |
| `alpha` | `dynamic` | — | Value used to initialize `Draw.alpha`. |
| `red` | `dynamic` | — | Value used to initialize `Draw.red`. |
| `green` | `dynamic` | — | Value used to initialize `Draw.green`. |
| `blue` | `dynamic` | — | Value used to initialize `Draw.blue`. |
| `clientNum` | `dynamic` | — | Value used to initialize `Draw.client`. |
| `team` | `dynamic` | — | Value used to initialize `Draw.team`. |
| `large` | `dynamic` | — | Value used to initialize `Draw.large`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L201)

- [mq3.client.cgame_scoreboard.Draw](Type-mq3-client-cgame-scoreboard-draw-39659597.md) — struct
<a id="function-function-mq3-client-cgame-scoreboard-drawclientscore-function-drawclientscore-value-y-entry-fade-largeformat-src-mq3-client-cgame-scoreboard-ml-1059609034"></a>
### drawClientScore

```ml
function drawClientScore(value, y, entry, fade, largeFormat)
```

CG_DrawClientScore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.clients`, `value.gametype`, `value.clientNum`, `value.rank` and additional values. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawClientScore`. |
| `entry` | `dynamic` | — | Record read through `entry.client`, `entry.ping`, `entry.time`, `entry.score`. |
| `fade` | `dynamic` | — | Value used by `if ci.powerups!=0 then commands=commands+[draw("flag",iconx,iconY,iconSize,iconSize,"",fade,1.0,1.0,1.0,entry.client,ci.team,largeFormat)]`. |
| `largeFormat` | `dynamic` | — | Value used by `if largeFormat then iconY=y-8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L243)

<a id="function-function-mq3-client-cgame-scoreboard-drawoldscoreboard-function-drawoldscoreboard-value-src-mq3-client-cgame-scoreboard-ml-1698690215"></a>
### drawOldScoreboard

```ml
function drawOldScoreboard(value)
```

CG_DrawOldScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game scoreboard record/storage; this routine assigns `value.deferredPlayerLoading`, `value.killerName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L284)

<a id="function-function-mq3-client-cgame-scoreboard-drawoldtourneyscoreboard-function-drawoldtourneyscoreboard-value-src-mq3-client-cgame-scoreboard-ml-316814165"></a>
### drawOldTourneyScoreboard

```ml
function drawOldTourneyScoreboard(value)
```

CG_DrawOldTourneyScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game scoreboard record/storage; this routine assigns `value.scoresRequestTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L320)

<a id="constant-constant-mq3-client-cgame-scoreboard-fade-time-const-fade-time-200-src-mq3-client-cgame-scoreboard-ml-2012495239"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```

Duration in milliseconds of the standard CGame presentation fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L50)

<a id="function-function-mq3-client-cgame-scoreboard-fadealpha-function-fadealpha-statevalue-src-mq3-client-cgame-scoreboard-ml-352665916"></a>
### fadeAlpha

```ml
function fadeAlpha(stateValue)
```

Evaluates client game scoreboard `fadeAlpha` and returns `0.0`, `(FADE_TIME-elapsed)/FADE_TIME` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stateValue` | `dynamic` | — | Record read through `stateValue.time`, `stateValue.scoreFadeTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L227)

<a id="function-function-mq3-client-cgame-scoreboard-frame-function-frame-drawn-src-mq3-client-cgame-scoreboard-ml-2070318674"></a>
### frame

```ml
function frame(drawn)
```

Creates a `mq3.client.cgame_scoreboard.Frame` record. Assigns `drawn` from `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawn` | `dynamic` | — | Value used to initialize `Frame.drawn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L204)

- [mq3.client.cgame_scoreboard.Frame](Type-mq3-client-cgame-scoreboard-frame-549841652.md) — struct
<a id="constant-constant-mq3-client-cgame-scoreboard-giant-height-const-giant-height-48-src-mq3-client-cgame-scoreboard-ml-570988095"></a>
### GIANT_HEIGHT

```ml
const GIANT_HEIGHT = 48
```

Height of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L48)

<a id="constant-constant-mq3-client-cgame-scoreboard-giant-width-const-giant-width-32-src-mq3-client-cgame-scoreboard-ml-672136752"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```

Width of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L46)

<a id="constant-constant-mq3-client-cgame-scoreboard-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-scoreboard-ml-272210325"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Native game-type value for single-player arena progression, used when choosing team grouping and single-player scoreboard behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L17)

<a id="constant-constant-mq3-client-cgame-scoreboard-gt-team-const-gt-team-3-src-mq3-client-cgame-scoreboard-ml-2027502642"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when choosing team grouping and single-player scoreboard behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L20)

<a id="function-function-mq3-client-cgame-scoreboard-padleft-function-padleft-value-width-src-mq3-client-cgame-scoreboard-ml-664432577"></a>
### padLeft

```ml
function padLeft(value, width)
```

Evaluates client game scoreboard `padLeft` and returns `text` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `text=str(value)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `padLeft`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L233)

<a id="function-function-mq3-client-cgame-scoreboard-placestring-function-placestring-rank-src-mq3-client-cgame-scoreboard-ml-1839883584"></a>
### placeString

```ml
function placeString(rank)
```

Evaluates client game scoreboard `placeString` and returns `"Tied for "+text`, `text` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rank` | `dynamic` | — | Value used by `tied=(rank & RANK_TIED_FLAG)!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L220)

<a id="constant-constant-mq3-client-cgame-scoreboard-pm-dead-const-pm-dead-3-src-mq3-client-cgame-scoreboard-ml-293227478"></a>
### PM_DEAD

```ml
const PM_DEAD = 3
```

Player-movement mode selecting dead input and physics behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L22)

<a id="constant-constant-mq3-client-cgame-scoreboard-pm-intermission-const-pm-intermission-5-src-mq3-client-cgame-scoreboard-ml-2089693976"></a>
### PM_INTERMISSION

```ml
const PM_INTERMISSION = 5
```

Player-movement mode selecting intermission input and physics behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L24)

<a id="function-function-mq3-client-cgame-scoreboard-printablelength-function-printablelength-text-src-mq3-client-cgame-scoreboard-ml-1829043883"></a>
### printableLength

```ml
function printableLength(text)
```

Evaluates client game scoreboard `printableLength` and returns `count` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `printableLength` in the client game scoreboard path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L211)

<a id="constant-constant-mq3-client-cgame-scoreboard-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-cgame-scoreboard-ml-69180123"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```

Bit marking that the stored rank is tied with another player's rank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L26)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-header-const-sb-header-86-src-mq3-client-cgame-scoreboard-ml-1306396957"></a>
### SB_HEADER

```ml
const SB_HEADER = 86
```

Virtual-screen Y coordinate of the scoreboard header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L28)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-inter-height-const-sb-inter-height-16-src-mq3-client-cgame-scoreboard-ml-2009511194"></a>
### SB_INTER_HEIGHT

```ml
const SB_INTER_HEIGHT = 16
```

Height of one scoreboard player row in the compact intermission layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L36)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-maxclients-inter-const-sb-maxclients-inter-17-src-mq3-client-cgame-scoreboard-ml-57423179"></a>
### SB_MAXCLIENTS_INTER

```ml
const SB_MAXCLIENTS_INTER = 17
```

Maximum player rows displayed by the compact intermission scoreboard layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L40)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-maxclients-normal-const-sb-maxclients-normal-7-src-mq3-client-cgame-scoreboard-ml-156474884"></a>
### SB_MAXCLIENTS_NORMAL

```ml
const SB_MAXCLIENTS_NORMAL = 7
```

Maximum player rows displayed by the ordinary scoreboard layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L38)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-normal-height-const-sb-normal-height-40-src-mq3-client-cgame-scoreboard-ml-378427735"></a>
### SB_NORMAL_HEIGHT

```ml
const SB_NORMAL_HEIGHT = 40
```

Height of one scoreboard player row in the ordinary layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L34)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-statusbar-const-sb-statusbar-420-src-mq3-client-cgame-scoreboard-ml-1187546883"></a>
### SB_STATUSBAR

```ml
const SB_STATUSBAR = 420
```

Virtual-screen Y coordinate of the scoreboard's status-bar boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L32)

<a id="constant-constant-mq3-client-cgame-scoreboard-sb-top-const-sb-top-118-src-mq3-client-cgame-scoreboard-ml-1836646787"></a>
### SB_TOP

```ml
const SB_TOP = 118
```

Virtual-screen Y coordinate at which scoreboard player rows begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L30)

<a id="function-function-mq3-client-cgame-scoreboard-score-function-score-client-points-ping-time-src-mq3-client-cgame-scoreboard-ml-1119368343"></a>
### score

```ml
function score(client, points, ping, time)
```

Creates a `mq3.client.cgame_scoreboard.Score` record. Assigns `client` from `client`, `score` from `points`, `ping` from `ping`, `time` from `time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Value used to initialize `Score.client`. |
| `points` | `dynamic` | — | Value used to initialize `Score.score`. |
| `ping` | `dynamic` | — | Value used to initialize `Score.ping`. |
| `time` | `dynamic` | — | Value used to initialize `Score.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L180)

- [mq3.client.cgame_scoreboard.Score](Type-mq3-client-cgame-scoreboard-score-1835543747.md) — struct
<a id="function-function-mq3-client-cgame-scoreboard-state-function-state-src-mq3-client-cgame-scoreboard-ml-1633129108"></a>
### state

```ml
function state()
```

Creates a `mq3.client.cgame_scoreboard.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L186)

- [mq3.client.cgame_scoreboard.State](Type-mq3-client-cgame-scoreboard-state-423630336.md) — struct
<a id="constant-constant-mq3-client-cgame-scoreboard-team-blue-const-team-blue-2-src-mq3-client-cgame-scoreboard-ml-89247283"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L12)

<a id="constant-constant-mq3-client-cgame-scoreboard-team-free-const-team-free-0-src-mq3-client-cgame-scoreboard-ml-1996183673"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```

Native team identifier for free, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L8)

<a id="constant-constant-mq3-client-cgame-scoreboard-team-red-const-team-red-1-src-mq3-client-cgame-scoreboard-ml-1565434272"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L10)

<a id="constant-constant-mq3-client-cgame-scoreboard-team-spectator-const-team-spectator-3-src-mq3-client-cgame-scoreboard-ml-390687050"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L14)

<a id="function-function-mq3-client-cgame-scoreboard-teamscoreboard-function-teamscoreboard-value-y-team-fade-maxclients-lineheight-src-mq3-client-cgame-scoreboard-ml-57246262"></a>
### teamScoreboard

```ml
function teamScoreboard(value, y, team, fade, maxClients, lineHeight)
```

CG_TeamScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.scores`, `value.clients`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `teamScoreboard`. |
| `team` | `dynamic` | — | Value used by `if entry.client>=0 and entry.client<len(value.clients) and value.clients[entry.client].team==team then`. |
| `fade` | `dynamic` | — | Value used by `part=drawClientScore(value,y+lineHeight*count,entry,fade,lineHeight==SB_NORMAL_HEIGHT)`. |
| `maxClients` | `dynamic` | — | Value used by `if count>=maxClients then break end if`. |
| `lineHeight` | `dynamic` | — | Value used by `part=drawClientScore(value,y+lineHeight*count,entry,fade,lineHeight==SB_NORMAL_HEIGHT)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_scoreboard.ml#L271)
