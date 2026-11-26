# `mq3.server.user_move.Server`

[Home](README.md) · [Source file](File-src-mq3-server-user-move-ml-1219627038.md)

<a id="struct-struct-mq3-server-user-move-server-struct-server-src-mq3-server-user-move-ml-612282339"></a>
## Server

```ml
struct Server
```

Server record for server.user_move, containing `checksumFeed`, `time`, `pure`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L48)

## Members

<a id="field-field-mq3-server-user-move-server-checksumfeed-checksumfeed-src-mq3-server-user-move-ml-1454683440"></a>
### checksumFeed

```ml
checksumFeed
```

Server-supplied feed value used to calculate pure-package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L50)

<a id="field-field-mq3-server-user-move-server-pure-pure-src-mq3-server-user-move-ml-637205046"></a>
### pure

```ml
pure
```

True when clients must use the server-approved package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L54)

<a id="field-field-mq3-server-user-move-server-time-time-src-mq3-server-user-move-ml-1984954820"></a>
### time

```ml
time
```

Current simulation time used while validating and executing client user commands, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L52)
