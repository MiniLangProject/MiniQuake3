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

Lists the active fields catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L30)

<a id="function-function-mq3-client-client-abi-allrecordfields-function-allrecordfields-src-mq3-client-client-abi-ml-1564000068"></a>
### allRecordFields

```ml
function allRecordFields()
```

Computes `snapshotFields()+["p_cmdNumber","p_serverTime","p_realtime"]+activeFields()+connectionFields()+["adr","start","time","info"]+["adr","hostName","mapName","game","netType","gameType","clients","maxCl...` for client ABI `allRecordFields`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L36)

- [mq3.client.client_abi.ClientActive](Type-mq3-client-client-abi-clientactive-678688238.md) — struct
- [mq3.client.client_abi.ClientConnection](Type-mq3-client-client-abi-clientconnection-2238508.md) — struct
- [mq3.client.client_abi.ClientStatic](Type-mq3-client-client-abi-clientstatic-1983680578.md) — struct
- [mq3.client.client_abi.ClSnapshot](Type-mq3-client-client-abi-clsnapshot-975832424.md) — struct
<a id="function-function-mq3-client-client-abi-connectionfields-function-connectionfields-src-mq3-client-client-abi-ml-727842218"></a>
### connectionFields

```ml
function connectionFields()
```

Lists the connection fields catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L32)

<a id="function-function-mq3-client-client-abi-declarationnames-function-declarationnames-src-mq3-client-client-abi-ml-549881950"></a>
### declarationNames

```ml
function declarationNames()
```

Lists the declaration names catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L38)

<a id="function-function-mq3-client-client-abi-externalnames-function-externalnames-src-mq3-client-client-abi-ml-1151548716"></a>
### externalNames

```ml
function externalNames()
```

Lists the external names catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L40)

- [mq3.client.client_abi.KButton](Type-mq3-client-client-abi-kbutton-1103630596.md) — struct
<a id="constant-constant-mq3-client-client-abi-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-client-abi-ml-1038820147"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L6)

- [mq3.client.client_abi.OutPacket](Type-mq3-client-client-abi-outpacket-1317811593.md) — struct
<a id="function-function-mq3-client-client-abi-parseentityslot-function-parseentityslot-sequence-src-mq3-client-client-abi-ml-734643043"></a>
### parseEntitySlot

```ml
function parseEntitySlot(sequence)
```

Maps a nonnegative parse-entity sequence into the MAX_PARSE_ENTITIES ring, rejecting negative sequences with error 7961.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sequence` | `dynamic` | — | Value used by `if sequence<0 then return error(7961,"client.h: negative parse entity sequence") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L47)

- [mq3.client.client_abi.Ping](Type-mq3-client-client-abi-ping-1584983151.md) — struct
<a id="constant-constant-mq3-client-client-abi-retransmit-timeout-const-retransmit-timeout-3000-src-mq3-client-client-abi-ml-194056962"></a>
### RETRANSMIT_TIMEOUT

```ml
const RETRANSMIT_TIMEOUT = 3000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L5)

<a id="function-function-mq3-client-client-abi-retransmitdue-function-retransmitdue-now-lastsent-src-mq3-client-client-abi-ml-2044323544"></a>
### retransmitDue

```ml
function retransmitDue(now, lastSent)
```

Checks whether at least RETRANSMIT_TIMEOUT milliseconds have elapsed since the last connection packet.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `lastSent` | `dynamic` | — | Value used by `return now-lastSent>=RETRANSMIT_TIMEOUT`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L44)

- [mq3.client.client_abi.ServerAddress](Type-mq3-client-client-abi-serveraddress-836391336.md) — struct
- [mq3.client.client_abi.ServerInfo](Type-mq3-client-client-abi-serverinfo-1443235108.md) — struct
<a id="function-function-mq3-client-client-abi-snapshotfields-function-snapshotfields-src-mq3-client-client-abi-ml-706766638"></a>
### snapshotFields

```ml
function snapshotFields()
```

Lists the snapshot fields catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L28)

<a id="function-function-mq3-client-client-abi-staticfields-function-staticfields-src-mq3-client-client-abi-ml-1685488582"></a>
### staticFields

```ml
function staticFields()
```

Lists the static fields catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L34)

<a id="function-function-mq3-client-client-abi-typenames-function-typenames-src-mq3-client-client-abi-ml-1190408346"></a>
### typeNames

```ml
function typeNames()
```

Lists the type names catalog for client ABI in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L26)

<a id="function-function-mq3-client-client-abi-validserverport-function-validserverport-value-src-mq3-client-client-abi-ml-2041553937"></a>
### validServerPort

```ml
function validServerPort(value)
```

Accepts UDP port numbers from zero through 65,535 inclusive.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return value>=0 and value<=65535`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L50)
