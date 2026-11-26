# `mq3.server.abi.Challenge`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-challenge-struct-challenge-src-mq3-server-abi-ml-240417751"></a>
## Challenge

```ml
struct Challenge
```

Challenge record for server.abi, containing `address`, `challenge`, `time`, `pingTime`, `firstTime`, `connected`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L346)

## Members

<a id="field-field-mq3-server-abi-challenge-address-address-src-mq3-server-abi-ml-1981624806"></a>
### address

```ml
address
```

Network address associated with the client or packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L348)

<a id="field-field-mq3-server-abi-challenge-challenge-challenge-src-mq3-server-abi-ml-98676506"></a>
### challenge

```ml
challenge
```

Challenge value used to authenticate a connection attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L350)

<a id="field-field-mq3-server-abi-challenge-connected-connected-src-mq3-server-abi-ml-146098658"></a>
### connected

```ml
connected
```

True after the connection challenge has been accepted by a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L358)

<a id="field-field-mq3-server-abi-challenge-firsttime-firsttime-src-mq3-server-abi-ml-204522746"></a>
### firstTime

```ml
firstTime
```

Server timestamp when this challenge address was first registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L356)

<a id="field-field-mq3-server-abi-challenge-pingtime-pingtime-src-mq3-server-abi-ml-511009948"></a>
### pingTime

```ml
pingTime
```

Server timestamp of the challenge response used to measure connection latency.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L354)

<a id="field-field-mq3-server-abi-challenge-time-time-src-mq3-server-abi-ml-436256632"></a>
### time

```ml
time
```

Challenge creation timestamp in the native record, used for replacement ordering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L352)
