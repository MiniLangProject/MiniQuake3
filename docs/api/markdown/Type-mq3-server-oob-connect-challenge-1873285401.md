# `mq3.server.oob_connect.Challenge`

[Home](README.md) · [Source file](File-src-mq3-server-oob-connect-ml-829458266.md)

<a id="struct-struct-mq3-server-oob-connect-challenge-struct-challenge-src-mq3-server-oob-connect-ml-1714496179"></a>
## Challenge

```ml
struct Challenge
```

Challenge record for server.oob_connect, containing `address`, `challenge`, `time`, `pingTime`, `firstTime`, `connected`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L46)

## Members

<a id="field-field-mq3-server-oob-connect-challenge-address-address-src-mq3-server-oob-connect-ml-814372624"></a>
### address

```ml
address
```

Network address associated with the client or packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L48)

<a id="field-field-mq3-server-oob-connect-challenge-challenge-challenge-src-mq3-server-oob-connect-ml-1383776500"></a>
### challenge

```ml
challenge
```

Challenge value used to authenticate a connection attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L50)

<a id="field-field-mq3-server-oob-connect-challenge-connected-connected-src-mq3-server-oob-connect-ml-1683628220"></a>
### connected

```ml
connected
```

True after the connection challenge has been accepted by a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L58)

<a id="field-field-mq3-server-oob-connect-challenge-firsttime-firsttime-src-mq3-server-oob-connect-ml-1222359292"></a>
### firstTime

```ml
firstTime
```

Server timestamp when this challenge address was first registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L56)

<a id="field-field-mq3-server-oob-connect-challenge-pingtime-pingtime-src-mq3-server-oob-connect-ml-698225902"></a>
### pingTime

```ml
pingTime
```

Server timestamp of the challenge response used to measure connection latency.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L54)

<a id="field-field-mq3-server-oob-connect-challenge-time-time-src-mq3-server-oob-connect-ml-1169300938"></a>
### time

```ml
time
```

Server timestamp when this challenge entry was assigned, used to select the oldest reusable entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L52)
