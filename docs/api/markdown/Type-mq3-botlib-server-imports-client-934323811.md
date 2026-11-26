# `mq3.botlib.server_imports.Client`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-imports-ml-1126004744.md)

<a id="struct-struct-mq3-botlib-server-imports-client-struct-client-src-mq3-botlib-server-imports-ml-1545168993"></a>
## Client

```ml
struct Client
```

`Client` record for server imports, containing `state`, `entityNumber`, `name`, `svFlags` and `lastPacketTime` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L33)

## Members

<a id="field-field-mq3-botlib-server-imports-client-addresstype-addresstype-src-mq3-botlib-server-imports-ml-1243679700"></a>
### addressType

```ml
addressType
```

Network-address kind, such as loopback, IPv4, or bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L45)

<a id="field-field-mq3-botlib-server-imports-client-angles-angles-src-mq3-botlib-server-imports-ml-1581110728"></a>
### angles

```ml
angles
```

Pitch, yaw, and roll values carried by the entity or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L53)

<a id="field-field-mq3-botlib-server-imports-client-buttons-buttons-src-mq3-botlib-server-imports-ml-989368020"></a>
### buttons

```ml
buttons
```

Bit mask of pressed user-command buttons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L49)

<a id="field-field-mq3-botlib-server-imports-client-entitynumber-entitynumber-src-mq3-botlib-server-imports-ml-1823779212"></a>
### entityNumber

```ml
entityNumber
```

Game-entity number assigned to this bot client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L37)

<a id="field-field-mq3-botlib-server-imports-client-lastpackettime-lastpackettime-src-mq3-botlib-server-imports-ml-684708318"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L43)

<a id="field-field-mq3-botlib-server-imports-client-name-name-src-mq3-botlib-server-imports-ml-1604241854"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L39)

<a id="field-field-mq3-botlib-server-imports-client-origin-origin-src-mq3-botlib-server-imports-ml-920290940"></a>
### origin

```ml
origin
```

Server-side bot position supplied through the bot client import record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L51)

<a id="field-field-mq3-botlib-server-imports-client-rate-rate-src-mq3-botlib-server-imports-ml-2067896952"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L47)

<a id="field-field-mq3-botlib-server-imports-client-state-state-src-mq3-botlib-server-imports-ml-1234318196"></a>
### state

```ml
state
```

Connection lifecycle value that controls allocation and access to bot-visible server client slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L35)

<a id="field-field-mq3-botlib-server-imports-client-svflags-svflags-src-mq3-botlib-server-imports-ml-1843696284"></a>
### svFlags

```ml
svFlags
```

Server-side visibility and entity-behavior flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L41)
