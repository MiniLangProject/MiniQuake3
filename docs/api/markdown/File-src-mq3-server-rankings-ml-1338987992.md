# `src/mq3/server/rankings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.rankings`](Package-mq3-server-rankings-946858282.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-server-rankings-ascii-encoding-const-ascii-encoding-0123456789abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz-src-mq3-server-rankings-ml-1278640670"></a>
### ASCII_ENCODING

```ml
const ASCII_ENCODING = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L40)

<a id="function-function-mq3-server-rankings-beginuser-function-beginuser-state-index-kind-username-password-email-src-mq3-server-rankings-ml-101422464"></a>
### beginUser

```ml
function beginUser(state, index, kind, username, password, email)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `username` | `dynamic` | — |  |
| `password` | `dynamic` | — |  |
| `email` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L88)

<a id="function-function-mq3-server-rankings-context-function-context-state-src-mq3-server-rankings-ml-2025082659"></a>
### context

```ml
function context(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L60)

<a id="function-function-mq3-server-rankings-create-function-create-maxclients-src-mq3-server-rankings-ml-445925134"></a>
### create

```ml
function create(maxclients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxclients` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L48)

<a id="function-function-mq3-server-rankings-emit-function-emit-state-kind-context-index-payload-src-mq3-server-rankings-ml-161769104"></a>
### emit

```ml
function emit(state, kind, context, index, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L53)

<a id="function-function-mq3-server-rankings-gamekeyfor-function-gamekeyfor-state-key-src-mq3-server-rankings-ml-570815768"></a>
### gameKeyFor

```ml
function gameKeyFor(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L56)

<a id="constant-constant-mq3-server-rankings-gr-gamekey-const-gr-gamekey-quake-iii-arena-src-mq3-server-rankings-ml-1516826158"></a>
### GR_GAMEKEY

```ml
const GR_GAMEKEY = "Quake III Arena"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L39)

<a id="constant-constant-mq3-server-rankings-gr-status-baddomain-const-gr-status-baddomain-8-src-mq3-server-rankings-ml-2053707421"></a>
### GR_STATUS_BADDOMAIN

```ml
const GR_STATUS_BADDOMAIN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L32)

<a id="constant-constant-mq3-server-rankings-gr-status-badgame-const-gr-status-badgame-6-src-mq3-server-rankings-ml-412421379"></a>
### GR_STATUS_BADGAME

```ml
const GR_STATUS_BADGAME = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L30)

<a id="constant-constant-mq3-server-rankings-gr-status-badleague-const-gr-status-badleague-13-src-mq3-server-rankings-ml-1322959749"></a>
### GR_STATUS_BADLEAGUE

```ml
const GR_STATUS_BADLEAGUE = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L37)

<a id="constant-constant-mq3-server-rankings-gr-status-badparams-const-gr-status-badparams-2-src-mq3-server-rankings-ml-1700245379"></a>
### GR_STATUS_BADPARAMS

```ml
const GR_STATUS_BADPARAMS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L26)

<a id="constant-constant-mq3-server-rankings-gr-status-badpassword-const-gr-status-badpassword-5-src-mq3-server-rankings-ml-3742720"></a>
### GR_STATUS_BADPASSWORD

```ml
const GR_STATUS_BADPASSWORD = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L29)

<a id="constant-constant-mq3-server-rankings-gr-status-domainlock-const-gr-status-domainlock-9-src-mq3-server-rankings-ml-1930751866"></a>
### GR_STATUS_DOMAINLOCK

```ml
const GR_STATUS_DOMAINLOCK = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L33)

<a id="constant-constant-mq3-server-rankings-gr-status-error-const-gr-status-error-1-src-mq3-server-rankings-ml-1439668756"></a>
### GR_STATUS_ERROR

```ml
const GR_STATUS_ERROR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L25)

<a id="constant-constant-mq3-server-rankings-gr-status-invalidcontext-const-gr-status-invalidcontext-12-src-mq3-server-rankings-ml-2108868676"></a>
### GR_STATUS_INVALIDCONTEXT

```ml
const GR_STATUS_INVALIDCONTEXT = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L36)

<a id="constant-constant-mq3-server-rankings-gr-status-invaliduser-const-gr-status-invaliduser-11-src-mq3-server-rankings-ml-1354712167"></a>
### GR_STATUS_INVALIDUSER

```ml
const GR_STATUS_INVALIDUSER = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L35)

<a id="constant-constant-mq3-server-rankings-gr-status-network-const-gr-status-network-3-src-mq3-server-rankings-ml-697387710"></a>
### GR_STATUS_NETWORK

```ml
const GR_STATUS_NETWORK = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L27)

<a id="constant-constant-mq3-server-rankings-gr-status-nouser-const-gr-status-nouser-4-src-mq3-server-rankings-ml-317474449"></a>
### GR_STATUS_NOUSER

```ml
const GR_STATUS_NOUSER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L28)

<a id="constant-constant-mq3-server-rankings-gr-status-ok-const-gr-status-ok-0-src-mq3-server-rankings-ml-788021841"></a>
### GR_STATUS_OK

```ml
const GR_STATUS_OK = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L24)

<a id="constant-constant-mq3-server-rankings-gr-status-pending-const-gr-status-pending-7-src-mq3-server-rankings-ml-1146884550"></a>
### GR_STATUS_PENDING

```ml
const GR_STATUS_PENDING = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L31)

<a id="constant-constant-mq3-server-rankings-gr-status-timeout-const-gr-status-timeout-10-src-mq3-server-rankings-ml-875777990"></a>
### GR_STATUS_TIMEOUT

```ml
const GR_STATUS_TIMEOUT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L34)

<a id="function-function-mq3-server-rankings-least-function-least-value-maximum-src-mq3-server-rankings-ml-358387935"></a>
### least

```ml
function least(value, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L52)

<a id="function-function-mq3-server-rankings-player-function-player-src-mq3-server-rankings-ml-732652160"></a>
### player

```ml
function player()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L47)

<a id="constant-constant-mq3-server-rankings-qgr-status-active-const-qgr-status-active-2-src-mq3-server-rankings-ml-581982259"></a>
### QGR_STATUS_ACTIVE

```ml
const QGR_STATUS_ACTIVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L12)

<a id="constant-constant-mq3-server-rankings-qgr-status-bad-password-const-qgr-status-bad-password-7-src-mq3-server-rankings-ml-1757078246"></a>
### QGR_STATUS_BAD_PASSWORD

```ml
const QGR_STATUS_BAD_PASSWORD = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L17)

<a id="constant-constant-mq3-server-rankings-qgr-status-error-const-qgr-status-error-12-src-mq3-server-rankings-ml-966191446"></a>
### QGR_STATUS_ERROR

```ml
const QGR_STATUS_ERROR = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L22)

<a id="constant-constant-mq3-server-rankings-qgr-status-invaliduser-const-qgr-status-invaliduser-11-src-mq3-server-rankings-ml-1069252209"></a>
### QGR_STATUS_INVALIDUSER

```ml
const QGR_STATUS_INVALIDUSER = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L21)

<a id="constant-constant-mq3-server-rankings-qgr-status-leaving-const-qgr-status-leaving-5-src-mq3-server-rankings-ml-1877783538"></a>
### QGR_STATUS_LEAVING

```ml
const QGR_STATUS_LEAVING = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L15)

<a id="constant-constant-mq3-server-rankings-qgr-status-new-const-qgr-status-new-0-src-mq3-server-rankings-ml-1067674079"></a>
### QGR_STATUS_NEW

```ml
const QGR_STATUS_NEW = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L10)

<a id="constant-constant-mq3-server-rankings-qgr-status-no-membership-const-qgr-status-no-membership-9-src-mq3-server-rankings-ml-1271065894"></a>
### QGR_STATUS_NO_MEMBERSHIP

```ml
const QGR_STATUS_NO_MEMBERSHIP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L19)

<a id="constant-constant-mq3-server-rankings-qgr-status-no-user-const-qgr-status-no-user-6-src-mq3-server-rankings-ml-1357301419"></a>
### QGR_STATUS_NO_USER

```ml
const QGR_STATUS_NO_USER = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L16)

<a id="constant-constant-mq3-server-rankings-qgr-status-pending-const-qgr-status-pending-4-src-mq3-server-rankings-ml-1044259561"></a>
### QGR_STATUS_PENDING

```ml
const QGR_STATUS_PENDING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L14)

<a id="constant-constant-mq3-server-rankings-qgr-status-spectator-const-qgr-status-spectator-1-src-mq3-server-rankings-ml-2135485808"></a>
### QGR_STATUS_SPECTATOR

```ml
const QGR_STATUS_SPECTATOR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L11)

<a id="constant-constant-mq3-server-rankings-qgr-status-timeout-const-qgr-status-timeout-10-src-mq3-server-rankings-ml-1871630966"></a>
### QGR_STATUS_TIMEOUT

```ml
const QGR_STATUS_TIMEOUT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L20)

<a id="constant-constant-mq3-server-rankings-qgr-status-user-exists-const-qgr-status-user-exists-8-src-mq3-server-rankings-ml-2009331767"></a>
### QGR_STATUS_USER_EXISTS

```ml
const QGR_STATUS_USER_EXISTS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L18)

<a id="constant-constant-mq3-server-rankings-qgr-status-validating-const-qgr-status-validating-3-src-mq3-server-rankings-ml-622539026"></a>
### QGR_STATUS_VALIDATING

```ml
const QGR_STATUS_VALIDATING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L13)

- [mq3.server.rankings.RankedPlayer](Type-mq3-server-rankings-rankedplayer-1676792450.md) — struct
- [mq3.server.rankings.Report](Type-mq3-server-rankings-report-1189155454.md) — struct
<a id="function-function-mq3-server-rankings-reporttarget-function-reporttarget-state-index-src-mq3-server-rankings-ml-1304109043"></a>
### reportTarget

```ml
function reportTarget(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L126)

- [mq3.server.rankings.Request](Type-mq3-server-rankings-request-1631012149.md) — struct
- [mq3.server.rankings.State](Type-mq3-server-rankings-state-1098966033.md) — struct
<a id="function-function-mq3-server-rankings-sv-rankactive-function-sv-rankactive-state-src-mq3-server-rankings-ml-1704573781"></a>
### SV_RankActive

```ml
function SV_RankActive(state)
```

SV_RankActive

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L77)

<a id="function-function-mq3-server-rankings-sv-rankasciidecode-function-sv-rankasciidecode-source-src-mq3-server-rankings-ml-297970989"></a>
### SV_RankAsciiDecode

```ml
function SV_RankAsciiDecode(source)
```

SV_RankAsciiDecode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L101)

<a id="function-function-mq3-server-rankings-sv-rankasciiencode-function-sv-rankasciiencode-source-src-mq3-server-rankings-ml-612100185"></a>
### SV_RankAsciiEncode

```ml
function SV_RankAsciiEncode(source)
```

SV_RankAsciiEncode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L97)

<a id="function-function-mq3-server-rankings-sv-rankbegin-function-sv-rankbegin-state-gamekey-src-mq3-server-rankings-ml-959708502"></a>
### SV_RankBegin

```ml
function SV_RankBegin(state, gamekey)
```

SV_RankBegin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gamekey` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L63)

<a id="function-function-mq3-server-rankings-sv-rankcheckinit-function-sv-rankcheckinit-state-src-mq3-server-rankings-ml-484200101"></a>
### SV_RankCheckInit

```ml
function SV_RankCheckInit(state)
```

SV_RankCheckInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L75)

<a id="function-function-mq3-server-rankings-sv-rankcleanupcbf-function-sv-rankcleanupcbf-state-index-status-src-mq3-server-rankings-ml-1112621399"></a>
### SV_RankCleanupCBF

```ml
function SV_RankCleanupCBF(state, index, status)
```

SV_RankCleanupCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L159)

<a id="function-function-mq3-server-rankings-sv-rankclosecontext-function-sv-rankclosecontext-state-index-src-mq3-server-rankings-ml-625362313"></a>
### SV_RankCloseContext

```ml
function SV_RankCloseContext(state, index)
```

SV_RankCloseContext

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L161)

<a id="function-function-mq3-server-rankings-sv-rankdecodeplayerid-function-sv-rankdecodeplayerid-value-src-mq3-server-rankings-ml-945625201"></a>
### SV_RankDecodePlayerID

```ml
function SV_RankDecodePlayerID(value)
```

SV_RankDecodePlayerID

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L111)

<a id="function-function-mq3-server-rankings-sv-rankdecodeplayerkey-function-sv-rankdecodeplayerkey-value-src-mq3-server-rankings-ml-671932633"></a>
### SV_RankDecodePlayerKey

```ml
function SV_RankDecodePlayerKey(value)
```

SV_RankDecodePlayerKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L115)

<a id="function-function-mq3-server-rankings-sv-rankencodegameid-function-sv-rankencodegameid-gameid-length-src-mq3-server-rankings-ml-1844855445"></a>
### SV_RankEncodeGameID

```ml
function SV_RankEncodeGameID(gameId, length)
```

SV_RankEncodeGameID

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameId` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L107)

<a id="function-function-mq3-server-rankings-sv-rankend-function-sv-rankend-state-src-mq3-server-rankings-ml-1310945917"></a>
### SV_RankEnd

```ml
function SV_RankEnd(state)
```

SV_RankEnd

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L68)

<a id="function-function-mq3-server-rankings-sv-rankerror-function-sv-rankerror-state-message-src-mq3-server-rankings-ml-1046483560"></a>
### SV_RankError

```ml
function SV_RankError(state, message)
```

SV_RankError

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L171)

<a id="function-function-mq3-server-rankings-sv-rankjoingamecbf-function-sv-rankjoingamecbf-state-index-status-playerid-token-rank-src-mq3-server-rankings-ml-2002766572"></a>
### SV_RankJoinGameCBF

```ml
function SV_RankJoinGameCBF(state, index, status, playerId, token, rank)
```

SV_RankJoinGameCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |
| `playerId` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |
| `rank` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L151)

<a id="function-function-mq3-server-rankings-sv-ranknewgamecbf-function-sv-ranknewgamecbf-state-status-gameid-src-mq3-server-rankings-ml-1457645914"></a>
### SV_RankNewGameCBF

```ml
function SV_RankNewGameCBF(state, status, gameId)
```

SV_RankNewGameCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |
| `gameId` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L143)

<a id="function-function-mq3-server-rankings-sv-rankpoll-function-sv-rankpoll-state-src-mq3-server-rankings-ml-100378379"></a>
### SV_RankPoll

```ml
function SV_RankPoll(state)
```

SV_RankPoll

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L73)

<a id="function-function-mq3-server-rankings-sv-rankquit-function-sv-rankquit-state-src-mq3-server-rankings-ml-1189350079"></a>
### SV_RankQuit

```ml
function SV_RankQuit(state)
```

SV_RankQuit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L138)

<a id="function-function-mq3-server-rankings-sv-rankreportint-function-sv-rankreportint-state-index1-index2-key-value-accum-src-mq3-server-rankings-ml-659865799"></a>
### SV_RankReportInt

```ml
function SV_RankReportInt(state, index1, index2, key, value, accum)
```

SV_RankReportInt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index1` | `dynamic` | — |  |
| `index2` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `accum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L130)

<a id="function-function-mq3-server-rankings-sv-rankreportstr-function-sv-rankreportstr-state-index1-index2-key-value-src-mq3-server-rankings-ml-762288968"></a>
### SV_RankReportStr

```ml
function SV_RankReportStr(state, index1, index2, key, value)
```

SV_RankReportStr

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index1` | `dynamic` | — |  |
| `index2` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L134)

<a id="function-function-mq3-server-rankings-sv-ranksendreportscbf-function-sv-ranksendreportscbf-state-index-status-src-mq3-server-rankings-ml-1259214333"></a>
### SV_RankSendReportsCBF

```ml
function SV_RankSendReportsCBF(state, index, status)
```

SV_RankSendReportsCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L155)

<a id="function-function-mq3-server-rankings-sv-rankstatusstring-function-sv-rankstatusstring-status-src-mq3-server-rankings-ml-338910472"></a>
### SV_RankStatusString

```ml
function SV_RankStatusString(status)
```

SV_RankStatusString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L167)

<a id="function-function-mq3-server-rankings-sv-rankusercbf-function-sv-rankusercbf-state-index-status-src-mq3-server-rankings-ml-1027192669"></a>
### SV_RankUserCBF

```ml
function SV_RankUserCBF(state, index, status)
```

SV_RankUserCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L147)

<a id="function-function-mq3-server-rankings-sv-rankusercreate-function-sv-rankusercreate-state-index-username-password-email-src-mq3-server-rankings-ml-845679440"></a>
### SV_RankUserCreate

```ml
function SV_RankUserCreate(state, index, username, password, email)
```

SV_RankUserCreate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `username` | `dynamic` | — |  |
| `password` | `dynamic` | — |  |
| `email` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L92)

<a id="function-function-mq3-server-rankings-sv-rankusergrank-function-sv-rankusergrank-state-index-src-mq3-server-rankings-ml-1382778347"></a>
### SV_RankUserGrank

```ml
function SV_RankUserGrank(state, index)
```

SV_RankUserGrank

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L81)

<a id="function-function-mq3-server-rankings-sv-rankuserlogin-function-sv-rankuserlogin-state-index-username-password-src-mq3-server-rankings-ml-1386802450"></a>
### SV_RankUserLogin

```ml
function SV_RankUserLogin(state, index, username, password)
```

SV_RankUserLogin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `username` | `dynamic` | — |  |
| `password` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L94)

<a id="function-function-mq3-server-rankings-sv-rankuserlogout-function-sv-rankuserlogout-state-index-src-mq3-server-rankings-ml-808296461"></a>
### SV_RankUserLogout

```ml
function SV_RankUserLogout(state, index)
```

SV_RankUserLogout

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L124)

<a id="function-function-mq3-server-rankings-sv-rankuserreset-function-sv-rankuserreset-state-index-src-mq3-server-rankings-ml-932877099"></a>
### SV_RankUserReset

```ml
function SV_RankUserReset(state, index)
```

SV_RankUserReset

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L83)

<a id="function-function-mq3-server-rankings-sv-rankuserspectate-function-sv-rankuserspectate-state-index-src-mq3-server-rankings-ml-782799379"></a>
### SV_RankUserSpectate

```ml
function SV_RankUserSpectate(state, index)
```

SV_RankUserSpectate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L87)

<a id="function-function-mq3-server-rankings-sv-rankuserstatus-function-sv-rankuserstatus-state-index-src-mq3-server-rankings-ml-67417997"></a>
### SV_RankUserStatus

```ml
function SV_RankUserStatus(state, index)
```

SV_RankUserStatus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L79)

<a id="function-function-mq3-server-rankings-sv-rankuservalidate-function-sv-rankuservalidate-state-index-playerid-key-tokenlength-rank-name-src-mq3-server-rankings-ml-1182609048"></a>
### SV_RankUserValidate

```ml
function SV_RankUserValidate(state, index, playerId, key, tokenLength, rank, name)
```

SV_RankUserValidate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `playerId` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `tokenLength` | `dynamic` | — |  |
| `rank` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L118)
