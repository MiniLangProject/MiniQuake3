# `src/mq3/server/rankings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.rankings`](Package-mq3-server-rankings-946858282.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-server-rankings-ascii-encoding-const-ascii-encoding-0123456789abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz-src-mq3-server-rankings-ml-1278640670"></a>
### ASCII_ENCODING

```ml
const ASCII_ENCODING = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]"
```

Alphabet used by the ranking service's six-bit text encoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L69)

<a id="function-function-mq3-server-rankings-beginuser-function-beginuser-state-index-kind-username-password-email-src-mq3-server-rankings-ml-101422464"></a>
### beginUser

```ml
function beginUser(state, index, kind, username, password, email)
```

Begin user in server.rankings; updates `state.requests`.

Direct state writes: `state.requests`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `players`, `active`, `gameId`, `requests`, `backendFn`. Updated in place: `requests`. |
| `index` | `dynamic` | — | Initial `index` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `kind` | `dynamic` | — | Initial `kind` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `username` | `dynamic` | — | Initial `username` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `password` | `dynamic` | — | Initial `password` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `email` | `dynamic` | — | Initial `email` field stored in the returned or constructed `mq3.server.rankings.Request` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L271)

<a id="function-function-mq3-server-rankings-context-function-context-state-src-mq3-server-rankings-ml-2025082659"></a>
### context

```ml
function context(state)
```

Update `state.nextContext`, `state.contexts` in server.rankings; the normal completion returns `value`.

Direct state writes: `state.nextContext`, `state.contexts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `nextContext`, `contexts`. Updated in place: `nextContext`, `contexts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L220)

<a id="function-function-mq3-server-rankings-create-function-create-maxclients-src-mq3-server-rankings-ml-445925134"></a>
### create

```ml
function create(maxclients)
```

Create rankings in server.rankings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxclients` | `dynamic` | — | Initial `maxclients` field stored in the returned or constructed `mq3.server.rankings.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L190)

<a id="function-function-mq3-server-rankings-emit-function-emit-state-kind-context-index-payload-src-mq3-server-rankings-ml-161769104"></a>
### emit

```ml
function emit(state, kind, context, index, payload)
```

Emit rankings in server.rankings; the normal completion returns `request`.

Direct state writes: `state.requests`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `gameId`, `requests`, `backendFn`. Updated in place: `requests`. |
| `kind` | `dynamic` | — | Initial `kind` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `index` | `dynamic` | — | Initial `index` field stored in the returned or constructed `mq3.server.rankings.Request` record. |
| `payload` | `dynamic` | — | Initial `payload` field stored in the returned or constructed `mq3.server.rankings.Request` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L206)

<a id="function-function-mq3-server-rankings-gamekeyfor-function-gamekeyfor-state-key-src-mq3-server-rankings-ml-570815768"></a>
### gameKeyFor

```ml
function gameKeyFor(state, key)
```

Compute game key for in server.rankings; the normal completion returns `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `officialGameKey`, `gametype`. |
| `key` | `dynamic` | — | Key used in `(key != state.officialGameKey)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L212)

<a id="constant-constant-mq3-server-rankings-gr-gamekey-const-gr-gamekey-quake-iii-arena-src-mq3-server-rankings-ml-1516826158"></a>
### GR_GAMEKEY

```ml
const GR_GAMEKEY = "Quake III Arena"
```

Game identifier supplied to the legacy ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L67)

<a id="constant-constant-mq3-server-rankings-gr-status-baddomain-const-gr-status-baddomain-8-src-mq3-server-rankings-ml-2053707421"></a>
### GR_STATUS_BADDOMAIN

```ml
const GR_STATUS_BADDOMAIN = 8
```

Legacy global-ranking service status indicating an invalid domain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L54)

<a id="constant-constant-mq3-server-rankings-gr-status-badgame-const-gr-status-badgame-6-src-mq3-server-rankings-ml-412421379"></a>
### GR_STATUS_BADGAME

```ml
const GR_STATUS_BADGAME = 6
```

Legacy global-ranking service status indicating an invalid game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L50)

<a id="constant-constant-mq3-server-rankings-gr-status-badleague-const-gr-status-badleague-13-src-mq3-server-rankings-ml-1322959749"></a>
### GR_STATUS_BADLEAGUE

```ml
const GR_STATUS_BADLEAGUE = 13
```

Legacy global-ranking service status indicating an invalid league.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L64)

<a id="constant-constant-mq3-server-rankings-gr-status-badparams-const-gr-status-badparams-2-src-mq3-server-rankings-ml-1700245379"></a>
### GR_STATUS_BADPARAMS

```ml
const GR_STATUS_BADPARAMS = 2
```

Legacy global-ranking service status indicating invalid parameters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L42)

<a id="constant-constant-mq3-server-rankings-gr-status-badpassword-const-gr-status-badpassword-5-src-mq3-server-rankings-ml-3742720"></a>
### GR_STATUS_BADPASSWORD

```ml
const GR_STATUS_BADPASSWORD = 5
```

Legacy global-ranking service status indicating an incorrect password.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L48)

<a id="constant-constant-mq3-server-rankings-gr-status-domainlock-const-gr-status-domainlock-9-src-mq3-server-rankings-ml-1930751866"></a>
### GR_STATUS_DOMAINLOCK

```ml
const GR_STATUS_DOMAINLOCK = 9
```

Legacy global-ranking service status indicating a locked domain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L56)

<a id="constant-constant-mq3-server-rankings-gr-status-error-const-gr-status-error-1-src-mq3-server-rankings-ml-1439668756"></a>
### GR_STATUS_ERROR

```ml
const GR_STATUS_ERROR = 1
```

Legacy global-ranking service status indicating error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L40)

<a id="constant-constant-mq3-server-rankings-gr-status-invalidcontext-const-gr-status-invalidcontext-12-src-mq3-server-rankings-ml-2108868676"></a>
### GR_STATUS_INVALIDCONTEXT

```ml
const GR_STATUS_INVALIDCONTEXT = 12
```

Legacy global-ranking service status indicating an invalid service context.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L62)

<a id="constant-constant-mq3-server-rankings-gr-status-invaliduser-const-gr-status-invaliduser-11-src-mq3-server-rankings-ml-1354712167"></a>
### GR_STATUS_INVALIDUSER

```ml
const GR_STATUS_INVALIDUSER = 11
```

Legacy global-ranking service status indicating an invalid user.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L60)

<a id="constant-constant-mq3-server-rankings-gr-status-network-const-gr-status-network-3-src-mq3-server-rankings-ml-697387710"></a>
### GR_STATUS_NETWORK

```ml
const GR_STATUS_NETWORK = 3
```

Legacy global-ranking service status indicating network.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L44)

<a id="constant-constant-mq3-server-rankings-gr-status-nouser-const-gr-status-nouser-4-src-mq3-server-rankings-ml-317474449"></a>
### GR_STATUS_NOUSER

```ml
const GR_STATUS_NOUSER = 4
```

Legacy global-ranking service status indicating a missing user account.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L46)

<a id="constant-constant-mq3-server-rankings-gr-status-ok-const-gr-status-ok-0-src-mq3-server-rankings-ml-788021841"></a>
### GR_STATUS_OK

```ml
const GR_STATUS_OK = 0
```

Legacy global-ranking service status indicating ok.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L38)

<a id="constant-constant-mq3-server-rankings-gr-status-pending-const-gr-status-pending-7-src-mq3-server-rankings-ml-1146884550"></a>
### GR_STATUS_PENDING

```ml
const GR_STATUS_PENDING = 7
```

Legacy global-ranking service status indicating pending.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L52)

<a id="constant-constant-mq3-server-rankings-gr-status-timeout-const-gr-status-timeout-10-src-mq3-server-rankings-ml-875777990"></a>
### GR_STATUS_TIMEOUT

```ml
const GR_STATUS_TIMEOUT = 10
```

Legacy global-ranking service status indicating timeout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L58)

<a id="function-function-mq3-server-rankings-least-function-least-value-maximum-src-mq3-server-rankings-ml-358387935"></a>
### least

```ml
function least(value, maximum)
```

Compute least in server.rankings; the normal completion returns `maximum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < maximum)`. |
| `maximum` | `dynamic` | — | Maximum used in `(value < maximum)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L197)

<a id="function-function-mq3-server-rankings-player-function-player-src-mq3-server-rankings-ml-732652160"></a>
### player

```ml
function player()
```

Create `mq3.server.rankings.RankedPlayer` with context=0; gameId=0; match=0; playerId=0; token=[]; status=QGR_STATUS_NEW; finalStatus=QGR_STATUS_NEW; rank=0; name="".


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L187)

<a id="constant-constant-mq3-server-rankings-qgr-status-active-const-qgr-status-active-2-src-mq3-server-rankings-ml-581982259"></a>
### QGR_STATUS_ACTIVE

```ml
const QGR_STATUS_ACTIVE = 2
```

Quake ranking-client status indicating active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L15)

<a id="constant-constant-mq3-server-rankings-qgr-status-bad-password-const-qgr-status-bad-password-7-src-mq3-server-rankings-ml-1757078246"></a>
### QGR_STATUS_BAD_PASSWORD

```ml
const QGR_STATUS_BAD_PASSWORD = 7
```

Quake ranking-client status indicating bad password.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L25)

<a id="constant-constant-mq3-server-rankings-qgr-status-error-const-qgr-status-error-12-src-mq3-server-rankings-ml-966191446"></a>
### QGR_STATUS_ERROR

```ml
const QGR_STATUS_ERROR = 12
```

Quake ranking-client status indicating error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L35)

<a id="constant-constant-mq3-server-rankings-qgr-status-invaliduser-const-qgr-status-invaliduser-11-src-mq3-server-rankings-ml-1069252209"></a>
### QGR_STATUS_INVALIDUSER

```ml
const QGR_STATUS_INVALIDUSER = 11
```

Quake ranking-client status indicating an invalid user.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L33)

<a id="constant-constant-mq3-server-rankings-qgr-status-leaving-const-qgr-status-leaving-5-src-mq3-server-rankings-ml-1877783538"></a>
### QGR_STATUS_LEAVING

```ml
const QGR_STATUS_LEAVING = 5
```

Quake ranking-client status indicating leaving.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L21)

<a id="constant-constant-mq3-server-rankings-qgr-status-new-const-qgr-status-new-0-src-mq3-server-rankings-ml-1067674079"></a>
### QGR_STATUS_NEW

```ml
const QGR_STATUS_NEW = 0
```

Quake ranking-client status indicating new.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L11)

<a id="constant-constant-mq3-server-rankings-qgr-status-no-membership-const-qgr-status-no-membership-9-src-mq3-server-rankings-ml-1271065894"></a>
### QGR_STATUS_NO_MEMBERSHIP

```ml
const QGR_STATUS_NO_MEMBERSHIP = 9
```

Quake ranking-client status indicating no membership.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L29)

<a id="constant-constant-mq3-server-rankings-qgr-status-no-user-const-qgr-status-no-user-6-src-mq3-server-rankings-ml-1357301419"></a>
### QGR_STATUS_NO_USER

```ml
const QGR_STATUS_NO_USER = 6
```

Quake ranking-client status indicating no user.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L23)

<a id="constant-constant-mq3-server-rankings-qgr-status-pending-const-qgr-status-pending-4-src-mq3-server-rankings-ml-1044259561"></a>
### QGR_STATUS_PENDING

```ml
const QGR_STATUS_PENDING = 4
```

Quake ranking-client status indicating pending.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L19)

<a id="constant-constant-mq3-server-rankings-qgr-status-spectator-const-qgr-status-spectator-1-src-mq3-server-rankings-ml-2135485808"></a>
### QGR_STATUS_SPECTATOR

```ml
const QGR_STATUS_SPECTATOR = 1
```

Quake ranking-client status indicating spectator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L13)

<a id="constant-constant-mq3-server-rankings-qgr-status-timeout-const-qgr-status-timeout-10-src-mq3-server-rankings-ml-1871630966"></a>
### QGR_STATUS_TIMEOUT

```ml
const QGR_STATUS_TIMEOUT = 10
```

Quake ranking-client status indicating timeout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L31)

<a id="constant-constant-mq3-server-rankings-qgr-status-user-exists-const-qgr-status-user-exists-8-src-mq3-server-rankings-ml-2009331767"></a>
### QGR_STATUS_USER_EXISTS

```ml
const QGR_STATUS_USER_EXISTS = 8
```

Quake ranking-client status indicating user exists.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L27)

<a id="constant-constant-mq3-server-rankings-qgr-status-validating-const-qgr-status-validating-3-src-mq3-server-rankings-ml-622539026"></a>
### QGR_STATUS_VALIDATING

```ml
const QGR_STATUS_VALIDATING = 3
```

Quake ranking-client status indicating validating.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L17)

- [mq3.server.rankings.RankedPlayer](Type-mq3-server-rankings-rankedplayer-1676792450.md) — struct
- [mq3.server.rankings.Report](Type-mq3-server-rankings-report-1189155454.md) — struct
<a id="function-function-mq3-server-rankings-reporttarget-function-reporttarget-state-index-src-mq3-server-rankings-ml-1304109043"></a>
### reportTarget

```ml
function reportTarget(state, index)
```

Compute report target in server.rankings; the normal completion returns `[p.context, p.match, p.playerId]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `serverContext`, `serverMatch`, `players`. |
| `index` | `dynamic` | — | Zero-based index into `state.players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L336)

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
| `state` | `dynamic` | — | Record exposing `active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L243)

<a id="function-function-mq3-server-rankings-sv-rankasciidecode-function-sv-rankasciidecode-source-src-mq3-server-rankings-ml-297970989"></a>
### SV_RankAsciiDecode

```ml
function SV_RankAsciiDecode(source)
```

SV_RankAsciiDecode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Source used in `bytes(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L295)

<a id="function-function-mq3-server-rankings-sv-rankasciiencode-function-sv-rankasciiencode-source-src-mq3-server-rankings-ml-612100185"></a>
### SV_RankAsciiEncode

```ml
function SV_RankAsciiEncode(source)
```

SV_RankAsciiEncode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Source used in `source[i]` and `len(source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L290)

<a id="function-function-mq3-server-rankings-sv-rankbegin-function-sv-rankbegin-state-gamekey-src-mq3-server-rankings-ml-959708502"></a>
### SV_RankBegin

```ml
function SV_RankBegin(state, gamekey)
```

SV_RankBegin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `enabled`, `singlePlayer`, `cvars`, `serverContext`, `leagueName`. Updated in place: `active`, `cvars`, `gameKey`, `serverContext`. |
| `gamekey` | `dynamic` | — | Key passed as `key` to `mq3.server.rankings.gameKeyFor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L225)

<a id="function-function-mq3-server-rankings-sv-rankcheckinit-function-sv-rankcheckinit-state-src-mq3-server-rankings-ml-484200101"></a>
### SV_RankCheckInit

```ml
function SV_RankCheckInit(state)
```

SV_RankCheckInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `contexts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L240)

<a id="function-function-mq3-server-rankings-sv-rankcleanupcbf-function-sv-rankcleanupcbf-state-index-status-src-mq3-server-rankings-ml-1112621399"></a>
### SV_RankCleanupCBF

```ml
function SV_RankCleanupCBF(state, index, status)
```

SV_RankCleanupCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.rankings.SV_RankError`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.SV_RankCloseContext`. |
| `status` | `dynamic` | — | Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L399)

<a id="function-function-mq3-server-rankings-sv-rankclosecontext-function-sv-rankclosecontext-state-index-src-mq3-server-rankings-ml-625362313"></a>
### SV_RankCloseContext

```ml
function SV_RankCloseContext(state, index)
```

SV_RankCloseContext

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `serverContext`, `players`, `contexts`, `cvars`. Updated in place: `serverContext`, `serverMatch`, `contexts`, `active`, `cvars`. |
| `index` | `dynamic` | — | Zero-based index into `state.players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L403)

<a id="function-function-mq3-server-rankings-sv-rankdecodeplayerid-function-sv-rankdecodeplayerid-value-src-mq3-server-rankings-ml-945625201"></a>
### SV_RankDecodePlayerID

```ml
function SV_RankDecodePlayerID(value)
```

SV_RankDecodePlayerID

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Source passed as `source` to `mq3.server.rankings.SV_RankAsciiDecode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L308)

<a id="function-function-mq3-server-rankings-sv-rankdecodeplayerkey-function-sv-rankdecodeplayerkey-value-src-mq3-server-rankings-ml-671932633"></a>
### SV_RankDecodePlayerKey

```ml
function SV_RankDecodePlayerKey(value)
```

SV_RankDecodePlayerKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Source passed as `source` to `mq3.server.rankings.SV_RankAsciiDecode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L313)

<a id="function-function-mq3-server-rankings-sv-rankencodegameid-function-sv-rankencodegameid-gameid-length-src-mq3-server-rankings-ml-1844855445"></a>
### SV_RankEncodeGameID

```ml
function SV_RankEncodeGameID(gameId, length)
```

SV_RankEncodeGameID

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameId` | `dynamic` | — | Game id operand used by `SV_RankEncodeGameID`; its reads are shown in the implementation. |
| `length` | `dynamic` | — | Length used in `(length < 12)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L303)

<a id="function-function-mq3-server-rankings-sv-rankend-function-sv-rankend-state-src-mq3-server-rankings-ml-1310945917"></a>
### SV_RankEnd

```ml
function SV_RankEnd(state)
```

SV_RankEnd

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `maxclients`, `players`, `serverContext`, `cvars`. Updated in place: `active`, `cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L231)

<a id="function-function-mq3-server-rankings-sv-rankerror-function-sv-rankerror-state-message-src-mq3-server-rankings-ml-1046483560"></a>
### SV_RankError

```ml
function SV_RankError(state, message)
```

SV_RankError

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `errors`, `cvars`. Updated in place: `errors`, `active`, `cvars`. |
| `message` | `dynamic` | — | Message used in `(state.errors + [message])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L416)

<a id="function-function-mq3-server-rankings-sv-rankjoingamecbf-function-sv-rankjoingamecbf-state-index-status-playerid-token-rank-src-mq3-server-rankings-ml-2002766572"></a>
### SV_RankJoinGameCBF

```ml
function SV_RankJoinGameCBF(state, index, status, playerId, token, rank)
```

SV_RankJoinGameCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `players`, `nextMatch`. Updated in place: `nextMatch`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.emit`. |
| `status` | `dynamic` | — | Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`. |
| `playerId` | `dynamic` | — | Player id operand used by `SV_RankJoinGameCBF`; its reads are shown in the implementation. |
| `token` | `dynamic` | — | Token operand used by `SV_RankJoinGameCBF`; its reads are shown in the implementation. |
| `rank` | `dynamic` | — | Rank passed as `rank` to `mq3.server.rankings.SV_RankUserValidate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L385)

<a id="function-function-mq3-server-rankings-sv-ranknewgamecbf-function-sv-ranknewgamecbf-state-status-gameid-src-mq3-server-rankings-ml-1457645914"></a>
### SV_RankNewGameCBF

```ml
function SV_RankNewGameCBF(state, status, gameId)
```

SV_RankNewGameCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `gameKey`, `maxclients`, `players`, `nextMatch`, `cvars`. Updated in place: `gameId`, `configstring`, `serverMatch`, `nextMatch`, `active`, `cvars`. |
| `status` | `dynamic` | — | Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`. |
| `gameId` | `dynamic` | — | Game id passed as `gameId` to `mq3.server.rankings.SV_RankEncodeGameID`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L368)

<a id="function-function-mq3-server-rankings-sv-rankpoll-function-sv-rankpoll-state-src-mq3-server-rankings-ml-100378379"></a>
### SV_RankPoll

```ml
function SV_RankPoll(state)
```

SV_RankPoll

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.rankings.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L237)

<a id="function-function-mq3-server-rankings-sv-rankquit-function-sv-rankquit-state-src-mq3-server-rankings-ml-1189350079"></a>
### SV_RankQuit

```ml
function SV_RankQuit(state)
```

SV_RankQuit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `contexts`, `maxclients`, `players`. Updated in place: `quitting`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L360)

<a id="function-function-mq3-server-rankings-sv-rankreportint-function-sv-rankreportint-state-index1-index2-key-value-accum-src-mq3-server-rankings-ml-659865799"></a>
### SV_RankReportInt

```ml
function SV_RankReportInt(state, index1, index2, key, value, accum)
```

SV_RankReportInt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `reports`, `gameId`, `requests`, `backendFn`. Updated in place: `reports`, `requests`. |
| `index1` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.reportTarget`. |
| `index2` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.reportTarget`. |
| `key` | `dynamic` | — | Initial `key` field stored in the returned or constructed `mq3.server.rankings.Report` record. |
| `value` | `dynamic` | — | Initial `intValue` field stored in the returned or constructed `mq3.server.rankings.Report` record. |
| `accum` | `dynamic` | — | Initial `accum` field stored in the returned or constructed `mq3.server.rankings.Report` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L346)

<a id="function-function-mq3-server-rankings-sv-rankreportstr-function-sv-rankreportstr-state-index1-index2-key-value-src-mq3-server-rankings-ml-762288968"></a>
### SV_RankReportStr

```ml
function SV_RankReportStr(state, index1, index2, key, value)
```

SV_RankReportStr

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `reports`, `gameId`, `requests`, `backendFn`. Updated in place: `reports`, `requests`. |
| `index1` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.reportTarget`. |
| `index2` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.reportTarget`. |
| `key` | `dynamic` | — | Initial `key` field stored in the returned or constructed `mq3.server.rankings.Report` record. |
| `value` | `dynamic` | — | Initial `strValue` field stored in the returned or constructed `mq3.server.rankings.Report` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L355)

<a id="function-function-mq3-server-rankings-sv-ranksendreportscbf-function-sv-ranksendreportscbf-state-index-status-src-mq3-server-rankings-ml-1259214333"></a>
### SV_RankSendReportsCBF

```ml
function SV_RankSendReportsCBF(state, index, status)
```

SV_RankSendReportsCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `serverContext`, `players`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.emit`. |
| `status` | `dynamic` | — | Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L392)

<a id="function-function-mq3-server-rankings-sv-rankstatusstring-function-sv-rankstatusstring-status-src-mq3-server-rankings-ml-338910472"></a>
### SV_RankStatusString

```ml
function SV_RankStatusString(status)
```

SV_RankStatusString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | `dynamic` | — | Zero-based index into `names`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L410)

<a id="function-function-mq3-server-rankings-sv-rankusercbf-function-sv-rankusercbf-state-index-status-src-mq3-server-rankings-ml-1027192669"></a>
### SV_RankUserCBF

```ml
function SV_RankUserCBF(state, index, status)
```

SV_RankUserCBF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `players`, `gameId`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.emit`. |
| `status` | `dynamic` | — | Status used in `(status == GR_STATUS_OK)` and `(status == GR_STATUS_NOUSER)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L375)

<a id="function-function-mq3-server-rankings-sv-rankusercreate-function-sv-rankusercreate-state-index-username-password-email-src-mq3-server-rankings-ml-845679440"></a>
### SV_RankUserCreate

```ml
function SV_RankUserCreate(state, index, username, password, email)
```

SV_RankUserCreate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.rankings.beginUser`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.beginUser`. |
| `username` | `dynamic` | — | Username passed as `username` to `mq3.server.rankings.beginUser`. |
| `password` | `dynamic` | — | Password passed as `password` to `mq3.server.rankings.beginUser`. |
| `email` | `dynamic` | — | Email passed as `email` to `mq3.server.rankings.beginUser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L280)

<a id="function-function-mq3-server-rankings-sv-rankusergrank-function-sv-rankusergrank-state-index-src-mq3-server-rankings-ml-1382778347"></a>
### SV_RankUserGrank

```ml
function SV_RankUserGrank(state, index)
```

SV_RankUserGrank

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `players`. |
| `index` | `dynamic` | — | Zero-based index into `state.players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L251)

<a id="function-function-mq3-server-rankings-sv-rankuserlogin-function-sv-rankuserlogin-state-index-username-password-src-mq3-server-rankings-ml-1386802450"></a>
### SV_RankUserLogin

```ml
function SV_RankUserLogin(state, index, username, password)
```

SV_RankUserLogin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.rankings.beginUser`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.beginUser`. |
| `username` | `dynamic` | — | Username passed as `username` to `mq3.server.rankings.beginUser`. |
| `password` | `dynamic` | — | Password passed as `password` to `mq3.server.rankings.beginUser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L286)

<a id="function-function-mq3-server-rankings-sv-rankuserlogout-function-sv-rankuserlogout-state-index-src-mq3-server-rankings-ml-808296461"></a>
### SV_RankUserLogout

```ml
function SV_RankUserLogout(state, index)
```

SV_RankUserLogout

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `players`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L331)

<a id="function-function-mq3-server-rankings-sv-rankuserreset-function-sv-rankuserreset-state-index-src-mq3-server-rankings-ml-932877099"></a>
### SV_RankUserReset

```ml
function SV_RankUserReset(state, index)
```

SV_RankUserReset

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `players`. |
| `index` | `dynamic` | — | Zero-based index into `state.players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L255)

<a id="function-function-mq3-server-rankings-sv-rankuserspectate-function-sv-rankuserspectate-state-index-src-mq3-server-rankings-ml-782799379"></a>
### SV_RankUserSpectate

```ml
function SV_RankUserSpectate(state, index)
```

SV_RankUserSpectate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `players`. |
| `index` | `dynamic` | — | Zero-based index into `state.players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L261)

<a id="function-function-mq3-server-rankings-sv-rankuserstatus-function-sv-rankuserstatus-state-index-src-mq3-server-rankings-ml-67417997"></a>
### SV_RankUserStatus

```ml
function SV_RankUserStatus(state, index)
```

SV_RankUserStatus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `active`, `players`. |
| `index` | `dynamic` | — | Zero-based index into `state.players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L247)

<a id="function-function-mq3-server-rankings-sv-rankuservalidate-function-sv-rankuservalidate-state-index-playerid-key-tokenlength-rank-name-src-mq3-server-rankings-ml-1182609048"></a>
### SV_RankUserValidate

```ml
function SV_RankUserValidate(state, index, playerId, key, tokenLength, rank, name)
```

SV_RankUserValidate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `players`, `active`, `maxclients`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.rankings.emit`. |
| `playerId` | `dynamic` | — | Value passed as `value` to `mq3.server.rankings.SV_RankDecodePlayerID`. |
| `key` | `dynamic` | — | Value passed as `value` to `mq3.server.rankings.SV_RankDecodePlayerKey`. |
| `tokenLength` | `dynamic` | — | Token length used in `emit(state, "validate", p.context, index, [tokenLength, p.playerId, p.token])`. |
| `rank` | `dynamic` | — | Rank operand used by `SV_RankUserValidate`; its reads are shown in the implementation. |
| `name` | `dynamic` | — | Name used in `(state.players[i].name == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L323)
