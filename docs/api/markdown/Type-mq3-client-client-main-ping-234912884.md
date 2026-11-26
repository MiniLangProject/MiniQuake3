# `mq3.client.client_main.Ping`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-ping-struct-ping-src-mq3-client-client-main-ml-478553019"></a>
## Ping

```ml
struct Ping
```

Stores client main ping record, including `address`, `start`, `time`, `info`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L79)

## Members

<a id="field-field-mq3-client-client-main-ping-address-address-src-mq3-client-client-main-ml-1424055001"></a>
### address

```ml
address
```

When constructing this record, `CL_GetFreePing` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L81)

<a id="field-field-mq3-client-client-main-ping-info-info-src-mq3-client-client-main-ml-180547709"></a>
### info

```ml
info
```

When constructing this record, `CL_GetFreePing` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L87)

<a id="field-field-mq3-client-client-main-ping-start-start-src-mq3-client-client-main-ml-705323613"></a>
### start

```ml
start
```

When constructing this record, `CL_GetFreePing` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L83)

<a id="field-field-mq3-client-client-main-ping-time-time-src-mq3-client-client-main-ml-1480406983"></a>
### time

```ml
time
```

Ping timing value used to record latency or completion of the browser request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L85)
