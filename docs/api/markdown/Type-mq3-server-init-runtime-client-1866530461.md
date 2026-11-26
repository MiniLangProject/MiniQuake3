# `mq3.server.init_runtime.Client`

[Home](README.md) · [Source file](File-src-mq3-server-init-runtime-ml-863108862.md)

<a id="struct-struct-mq3-server-init-runtime-client-struct-client-src-mq3-server-init-runtime-ml-1897270813"></a>
## Client

```ml
struct Client
```

Client record for server.init_runtime, containing `state`, `userinfo`, `name`, `noServerInfo`, `bot`, `loopback`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L51)

## Members

<a id="field-field-mq3-server-init-runtime-client-bot-bot-src-mq3-server-init-runtime-ml-1711816592"></a>
### bot

```ml
bot
```

True when the client slot is controlled by an in-process bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L62)

<a id="field-field-mq3-server-init-runtime-client-commands-commands-src-mq3-server-init-runtime-ml-554362704"></a>
### commands

```ml
commands
```

Reliable or pending commands collected for the associated client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L74)

<a id="field-field-mq3-server-init-runtime-client-deltamessage-deltamessage-src-mq3-server-init-runtime-ml-2025746742"></a>
### deltaMessage

```ml
deltaMessage
```

Acknowledged snapshot message selected as the base for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L68)

<a id="field-field-mq3-server-init-runtime-client-gentitynumber-gentitynumber-src-mq3-server-init-runtime-ml-605521796"></a>
### gentityNumber

```ml
gentityNumber
```

Index of the client's entity in the game VM entity array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L66)

<a id="field-field-mq3-server-init-runtime-client-loopback-loopback-src-mq3-server-init-runtime-ml-1925235066"></a>
### loopback

```ml
loopback
```

True when the connection uses the local loopback transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L64)

<a id="field-field-mq3-server-init-runtime-client-name-name-src-mq3-server-init-runtime-ml-1002515862"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L58)

<a id="field-field-mq3-server-init-runtime-client-nextsnapshottime-nextsnapshottime-src-mq3-server-init-runtime-ml-1350129564"></a>
### nextSnapshotTime

```ml
nextSnapshotTime
```

Earliest server timestamp for sending the next snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L70)

<a id="field-field-mq3-server-init-runtime-client-noserverinfo-noserverinfo-src-mq3-server-init-runtime-ml-110784772"></a>
### noServerInfo

```ml
noServerInfo
```

True when server-info updates should be withheld from this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L60)

<a id="field-field-mq3-server-init-runtime-client-state-state-src-mq3-server-init-runtime-ml-1227230576"></a>
### state

```ml
state
```

Connection lifecycle value that preserves the client connection stage across map startup and restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L54)

<a id="field-field-mq3-server-init-runtime-client-tag-tag-src-mq3-server-init-runtime-ml-499711528"></a>
### tag

```ml
tag
```

Client identifier retained while preserving slots across a map transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L72)

<a id="field-field-mq3-server-init-runtime-client-userinfo-userinfo-src-mq3-server-init-runtime-ml-1830873366"></a>
### userinfo

```ml
userinfo
```

Backslash-delimited client information string, including name and connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L56)
