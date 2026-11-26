# `mq3.client.ui_servers2.PingResult`

[Home](README.md) · [Source file](File-src-mq3-client-ui-servers2-ml-1909498126.md)

<a id="struct-struct-mq3-client-ui-servers2-pingresult-struct-pingresult-src-mq3-client-ui-servers2-ml-377238351"></a>
## PingResult

```ml
struct PingResult
```

Stores UI servers2 ping result record, including `slot`, `address`, `time`, `infoText`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L163)

## Members

<a id="field-field-mq3-client-ui-servers2-pingresult-address-address-src-mq3-client-ui-servers2-ml-1436847400"></a>
### address

```ml
address
```

Network-address string identifying the server that answered the ping request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L167)

<a id="field-field-mq3-client-ui-servers2-pingresult-infotext-infotext-src-mq3-client-ui-servers2-ml-788962926"></a>
### infoText

```ml
infoText
```

Server information string associated with the browser query result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L171)

<a id="field-field-mq3-client-ui-servers2-pingresult-slot-slot-src-mq3-client-ui-servers2-ml-534583516"></a>
### slot

```ml
slot
```

Ping-request slot associated with the browser latency result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L165)

<a id="field-field-mq3-client-ui-servers2-pingresult-time-time-src-mq3-client-ui-servers2-ml-859724442"></a>
### time

```ml
time
```

Ping timing value used to record latency or completion of the browser request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L169)
