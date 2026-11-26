# `mq3.client.client_abi.Ping`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-ping-struct-ping-src-mq3-client-client-abi-ml-600940863"></a>
## Ping

```ml
struct Ping
```

Stores client ABI ping record, including `adr`, `start`, `time`, `info`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L186)

## Members

<a id="field-field-mq3-client-client-abi-ping-adr-adr-src-mq3-client-client-abi-ml-682959275"></a>
### adr

```ml
adr
```

Compatibility member corresponding to native `ping_t.adr`; the original declaration is `netadr_t adr`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L189)

<a id="field-field-mq3-client-client-abi-ping-info-info-src-mq3-client-client-abi-ml-425346559"></a>
### info

```ml
info
```

Compatibility member corresponding to native `ping_t.info`; the original declaration is `char info[MAX_INFO_STRING]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L197)

<a id="field-field-mq3-client-client-abi-ping-start-start-src-mq3-client-client-abi-ml-2131478471"></a>
### start

```ml
start
```

Compatibility member corresponding to native `ping_t.start`; the original declaration is `int start`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L192)

<a id="field-field-mq3-client-client-abi-ping-time-time-src-mq3-client-client-abi-ml-1633673477"></a>
### time

```ml
time
```

Ping timing value used to record latency or completion of the browser request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L194)
