# `mq3.qcommon.network_pump.Step`

[Home](README.md) · [Source file](File-src-mq3-qcommon-network-pump-ml-493477247.md)

<a id="struct-struct-mq3-qcommon-network-pump-step-struct-step-src-mq3-qcommon-network-pump-ml-1892391093"></a>
## Step

```ml
struct Step
```

Result of one receive attempt, carrying the selected endpoint and any received datagram.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L40)

## Members

<a id="field-field-mq3-qcommon-network-pump-step-address-address-src-mq3-qcommon-network-pump-ml-1953321149"></a>
### address

```ml
address
```

Sender network address, or `void` when the attempt received no datagram.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L46)

<a id="field-field-mq3-qcommon-network-pump-step-data-data-src-mq3-qcommon-network-pump-ml-1065803577"></a>
### data

```ml
data
```

Datagram payload delivered during this pump step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L48)

<a id="field-field-mq3-qcommon-network-pump-step-processed-processed-src-mq3-qcommon-network-pump-ml-1750512949"></a>
### processed

```ml
processed
```

True when a datagram was received and its optional callback completed without an error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L42)

<a id="field-field-mq3-qcommon-network-pump-step-side-side-src-mq3-qcommon-network-pump-ml-1340236535"></a>
### side

```ml
side
```

Endpoint examined by this attempt: SIDE_CLIENT or SIDE_SERVER, even when no datagram was received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L44)
