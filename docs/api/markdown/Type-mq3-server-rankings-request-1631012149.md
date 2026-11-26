# `mq3.server.rankings.Request`

[Home](README.md) · [Source file](File-src-mq3-server-rankings-ml-1338987992.md)

<a id="struct-struct-mq3-server-rankings-request-struct-request-src-mq3-server-rankings-ml-1937579441"></a>
## Request

```ml
struct Request
```

Request record for server.rankings, containing `kind`, `context`, `player`, `index`, `gameId`, `username`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L93)

## Members

<a id="field-field-mq3-server-rankings-request-context-context-src-mq3-server-rankings-ml-261527466"></a>
### context

```ml
context
```

Ranking-service context handle to which this asynchronous account request belongs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L97)

<a id="field-field-mq3-server-rankings-request-email-email-src-mq3-server-rankings-ml-558186154"></a>
### email

```ml
email
```

Email address supplied when registering a ranking account.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L109)

<a id="field-field-mq3-server-rankings-request-gameid-gameid-src-mq3-server-rankings-ml-1979979316"></a>
### gameId

```ml
gameId
```

Ranking-service game identifier supplied with the request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L103)

<a id="field-field-mq3-server-rankings-request-index-index-src-mq3-server-rankings-ml-2113192118"></a>
### index

```ml
index
```

Local player-slot index associated with the request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L101)

<a id="field-field-mq3-server-rankings-request-kind-kind-src-mq3-server-rankings-ml-1184677086"></a>
### kind

```ml
kind
```

Ranking-service operation requested by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L95)

<a id="field-field-mq3-server-rankings-request-password-password-src-mq3-server-rankings-ml-732476704"></a>
### password

```ml
password
```

Account password supplied to the ranking-service authentication request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L107)

<a id="field-field-mq3-server-rankings-request-payload-payload-src-mq3-server-rankings-ml-1442651682"></a>
### payload

```ml
payload
```

Additional operation-specific data supplied to the ranking backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L111)

<a id="field-field-mq3-server-rankings-request-player-player-src-mq3-server-rankings-ml-207928396"></a>
### player

```ml
player
```

Player record or identifier targeted by the request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L99)

<a id="field-field-mq3-server-rankings-request-username-username-src-mq3-server-rankings-ml-340333458"></a>
### username

```ml
username
```

Account name supplied to the ranking-service request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L105)
