# `mq3.server.timeouts.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-timeouts-ml-1356487829.md)

<a id="struct-struct-mq3-server-timeouts-runtime-struct-runtime-src-mq3-server-timeouts-ml-1193573241"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.timeouts, containing `time`, `timeoutSeconds`, `zombieSeconds`, `maxClients`, `clients`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L35)

## Members

<a id="field-field-mq3-server-timeouts-runtime-clients-clients-src-mq3-server-timeouts-ml-1161428469"></a>
### clients

```ml
clients
```

Client slots inspected for inactivity and lingering disconnected connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L45)

<a id="field-field-mq3-server-timeouts-runtime-maxclients-maxclients-src-mq3-server-timeouts-ml-2089496657"></a>
### maxClients

```ml
maxClients
```

Number of configured client slots inspected by the timeout pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L43)

<a id="field-field-mq3-server-timeouts-runtime-time-time-src-mq3-server-timeouts-ml-2126640951"></a>
### time

```ml
time
```

Server clock against which client inactivity and zombie retention are checked, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L37)

<a id="field-field-mq3-server-timeouts-runtime-timeoutseconds-timeoutseconds-src-mq3-server-timeouts-ml-123703865"></a>
### timeoutSeconds

```ml
timeoutSeconds
```

Maximum inactivity interval for a connected client, in seconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L39)

<a id="field-field-mq3-server-timeouts-runtime-zombieseconds-zombieseconds-src-mq3-server-timeouts-ml-1328666441"></a>
### zombieSeconds

```ml
zombieSeconds
```

Retention interval for a disconnected zombie client, in seconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L41)
