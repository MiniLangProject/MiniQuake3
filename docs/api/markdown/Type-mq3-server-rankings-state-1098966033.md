# `mq3.server.rankings.State`

[Home](README.md) · [Source file](File-src-mq3-server-rankings-ml-1338987992.md)

<a id="struct-struct-mq3-server-rankings-state-struct-state-src-mq3-server-rankings-ml-1114104413"></a>
## State

```ml
struct State
```

State record for server.rankings, containing `enabled`, `singlePlayer`, `officialGameKey`, `gametype`, `leagueName`, `maxclients`, and 16 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L139)

## Members

<a id="field-field-mq3-server-rankings-state-active-active-src-mq3-server-rankings-ml-1018534086"></a>
### active

```ml
active
```

True while this entry participates in the active runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L153)

<a id="field-field-mq3-server-rankings-state-backendfn-backendfn-src-mq3-server-rankings-ml-298183538"></a>
### backendFn

```ml
backendFn
```

Host callback that submits a request to the external ranking-service backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L183)

<a id="field-field-mq3-server-rankings-state-configstring-configstring-src-mq3-server-rankings-ml-1575641916"></a>
### configstring

```ml
configstring
```

Ranking status text published to connected clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L177)

<a id="field-field-mq3-server-rankings-state-contexts-contexts-src-mq3-server-rankings-ml-2017844050"></a>
### contexts

```ml
contexts
```

Allocated ranking-service context records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L155)

<a id="field-field-mq3-server-rankings-state-cvars-cvars-src-mq3-server-rankings-ml-1540406366"></a>
### cvars

```ml
cvars
```

Configuration-variable registry consulted by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L179)

<a id="field-field-mq3-server-rankings-state-enabled-enabled-src-mq3-server-rankings-ml-343075834"></a>
### enabled

```ml
enabled
```

True while ranking-service integration is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L141)

<a id="field-field-mq3-server-rankings-state-errors-errors-src-mq3-server-rankings-ml-1487312168"></a>
### errors

```ml
errors
```

Ranking-service failures collected during operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L181)

<a id="field-field-mq3-server-rankings-state-gameid-gameid-src-mq3-server-rankings-ml-870752964"></a>
### gameId

```ml
gameId
```

Game identifier returned for the active ranking session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L163)

<a id="field-field-mq3-server-rankings-state-gamekey-gamekey-src-mq3-server-rankings-ml-244528338"></a>
### gameKey

```ml
gameKey
```

Game key supplied to the ranking-service backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L161)

<a id="field-field-mq3-server-rankings-state-gametype-gametype-src-mq3-server-rankings-ml-1296141426"></a>
### gametype

```ml
gametype
```

Game-mode identifier used when applying mode-specific rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L147)

<a id="field-field-mq3-server-rankings-state-leaguename-leaguename-src-mq3-server-rankings-ml-858834062"></a>
### leagueName

```ml
leagueName
```

League selected for the ranking-service session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L149)

<a id="field-field-mq3-server-rankings-state-maxclients-maxclients-src-mq3-server-rankings-ml-391638666"></a>
### maxclients

```ml
maxclients
```

Number of player ranking contexts allocated for server client slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L151)

<a id="field-field-mq3-server-rankings-state-nextcontext-nextcontext-src-mq3-server-rankings-ml-614985562"></a>
### nextContext

```ml
nextContext
```

Identifier assigned to the next managed ranking context.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L169)

<a id="field-field-mq3-server-rankings-state-nextmatch-nextmatch-src-mq3-server-rankings-ml-121875506"></a>
### nextMatch

```ml
nextMatch
```

Identifier assigned to the next managed ranking match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L171)

<a id="field-field-mq3-server-rankings-state-officialgamekey-officialgamekey-src-mq3-server-rankings-ml-377358882"></a>
### officialGameKey

```ml
officialGameKey
```

Game key identifying the official ranking-service integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L145)

<a id="field-field-mq3-server-rankings-state-players-players-src-mq3-server-rankings-ml-258125170"></a>
### players

```ml
players
```

Local player records and their ranking authentication state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L165)

<a id="field-field-mq3-server-rankings-state-quitting-quitting-src-mq3-server-rankings-ml-492162628"></a>
### quitting

```ml
quitting
```

True while ranking contexts are being closed for shutdown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L167)

<a id="field-field-mq3-server-rankings-state-reports-reports-src-mq3-server-rankings-ml-1354327970"></a>
### reports

```ml
reports
```

Statistics and textual reports emitted for the ranking backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L175)

<a id="field-field-mq3-server-rankings-state-requests-requests-src-mq3-server-rankings-ml-1404451754"></a>
### requests

```ml
requests
```

Pending or recorded requests sent to the ranking backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L173)

<a id="field-field-mq3-server-rankings-state-servercontext-servercontext-src-mq3-server-rankings-ml-708941602"></a>
### serverContext

```ml
serverContext
```

Ranking context owned by the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L157)

<a id="field-field-mq3-server-rankings-state-servermatch-servermatch-src-mq3-server-rankings-ml-380083030"></a>
### serverMatch

```ml
serverMatch
```

Ranking-service match handle owned by the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L159)

<a id="field-field-mq3-server-rankings-state-singleplayer-singleplayer-src-mq3-server-rankings-ml-149590144"></a>
### singlePlayer

```ml
singlePlayer
```

True when the ranked session is configured for single-player behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/rankings.ml#L143)
