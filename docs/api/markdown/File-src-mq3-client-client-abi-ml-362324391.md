# `src/mq3/client/client_abi.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.client_abi`](Package-mq3-client-client-abi-745723543.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-client-abi-activefields-function-activefields-src-mq3-client-client-abi-ml-1031377774"></a>
### activeFields

```ml
function activeFields()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L18)

<a id="function-function-mq3-client-client-abi-allrecordfields-function-allrecordfields-src-mq3-client-client-abi-ml-1564000068"></a>
### allRecordFields

```ml
function allRecordFields()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L21)

- [mq3.client.client_abi.ClientActive](Type-mq3-client-client-abi-clientactive-678688238.md) — struct
- [mq3.client.client_abi.ClientConnection](Type-mq3-client-client-abi-clientconnection-2238508.md) — struct
- [mq3.client.client_abi.ClientStatic](Type-mq3-client-client-abi-clientstatic-1983680578.md) — struct
- [mq3.client.client_abi.ClSnapshot](Type-mq3-client-client-abi-clsnapshot-975832424.md) — struct
<a id="function-function-mq3-client-client-abi-connectionfields-function-connectionfields-src-mq3-client-client-abi-ml-727842218"></a>
### connectionFields

```ml
function connectionFields()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L19)

<a id="function-function-mq3-client-client-abi-declarationnames-function-declarationnames-src-mq3-client-client-abi-ml-549881950"></a>
### declarationNames

```ml
function declarationNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L22)

<a id="function-function-mq3-client-client-abi-externalnames-function-externalnames-src-mq3-client-client-abi-ml-1151548716"></a>
### externalNames

```ml
function externalNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L23)

- [mq3.client.client_abi.KButton](Type-mq3-client-client-abi-kbutton-1103630596.md) — struct
<a id="constant-constant-mq3-client-client-abi-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-client-abi-ml-1038820147"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L6)

- [mq3.client.client_abi.OutPacket](Type-mq3-client-client-abi-outpacket-1317811593.md) — struct
<a id="function-function-mq3-client-client-abi-parseentityslot-function-parseentityslot-sequence-src-mq3-client-client-abi-ml-734643043"></a>
### parseEntitySlot

```ml
function parseEntitySlot(sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L25)

- [mq3.client.client_abi.Ping](Type-mq3-client-client-abi-ping-1584983151.md) — struct
<a id="constant-constant-mq3-client-client-abi-retransmit-timeout-const-retransmit-timeout-3000-src-mq3-client-client-abi-ml-194056962"></a>
### RETRANSMIT_TIMEOUT

```ml
const RETRANSMIT_TIMEOUT = 3000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L5)

<a id="function-function-mq3-client-client-abi-retransmitdue-function-retransmitdue-now-lastsent-src-mq3-client-client-abi-ml-2044323544"></a>
### retransmitDue

```ml
function retransmitDue(now, lastSent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |
| `lastSent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L24)

- [mq3.client.client_abi.ServerAddress](Type-mq3-client-client-abi-serveraddress-836391336.md) — struct
- [mq3.client.client_abi.ServerInfo](Type-mq3-client-client-abi-serverinfo-1443235108.md) — struct
<a id="function-function-mq3-client-client-abi-snapshotfields-function-snapshotfields-src-mq3-client-client-abi-ml-706766638"></a>
### snapshotFields

```ml
function snapshotFields()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L17)

<a id="function-function-mq3-client-client-abi-staticfields-function-staticfields-src-mq3-client-client-abi-ml-1685488582"></a>
### staticFields

```ml
function staticFields()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L20)

<a id="function-function-mq3-client-client-abi-typenames-function-typenames-src-mq3-client-client-abi-ml-1190408346"></a>
### typeNames

```ml
function typeNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L16)

<a id="function-function-mq3-client-client-abi-validserverport-function-validserverport-value-src-mq3-client-client-abi-ml-2041553937"></a>
### validServerPort

```ml
function validServerPort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L26)
