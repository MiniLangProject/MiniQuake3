# `src/mq3/server/oob_connect.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.oob_connect`](Package-mq3-server-oob-connect-56257902.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-oob-connect-address-function-address-type-ip-port-src-mq3-server-oob-connect-ml-1308801208"></a>
### address

```ml
function address(type, ip, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — |  |
| `ip` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L17)

- [mq3.server.oob_connect.Address](Type-mq3-server-oob-connect-address-1718501184.md) — struct
<a id="function-function-mq3-server-oob-connect-atoi-function-atoi-text-src-mq3-server-oob-connect-ml-1662370743"></a>
### atoi

```ml
function atoi(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L80)

<a id="constant-constant-mq3-server-oob-connect-authorize-timeout-const-authorize-timeout-5000-src-mq3-server-oob-connect-ml-966274156"></a>
### AUTHORIZE_TIMEOUT

```ml
const AUTHORIZE_TIMEOUT = 5000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L10)

<a id="function-function-mq3-server-oob-connect-authorizediagnostic-function-authorizediagnostic-runtime-text-src-mq3-server-oob-connect-ml-715940559"></a>
### authorizeDiagnostic

```ml
function authorizeDiagnostic(runtime, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L59)

<a id="function-function-mq3-server-oob-connect-authorizeippacket-function-authorizeippacket-runtime-sourceaddress-args-fsrestrict-src-mq3-server-oob-connect-ml-1094388953"></a>
### authorizeIpPacket

```ml
function authorizeIpPacket(runtime, sourceAddress, args, fsRestrict)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `fsRestrict` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L60)

- [mq3.server.oob_connect.Challenge](Type-mq3-server-oob-connect-challenge-1873285401.md) — struct
- [mq3.server.oob_connect.Client](Type-mq3-server-oob-connect-client-143521231.md) — struct
<a id="function-function-mq3-server-oob-connect-config-function-config-src-mq3-server-oob-connect-ml-1038355246"></a>
### config

```ml
function config()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L26)

- [mq3.server.oob_connect.Config](Type-mq3-server-oob-connect-config-1608169934.md) — struct
<a id="function-function-mq3-server-oob-connect-create-function-create-maxclients-settings-src-mq3-server-oob-connect-ml-1483751239"></a>
### create

```ml
function create(maxClients, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L28)

<a id="constant-constant-mq3-server-oob-connect-cs-connected-const-cs-connected-2-src-mq3-server-oob-connect-ml-39802061"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L13)

<a id="constant-constant-mq3-server-oob-connect-cs-free-const-cs-free-0-src-mq3-server-oob-connect-ml-1347887709"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L12)

<a id="function-function-mq3-server-oob-connect-directconnect-function-directconnect-runtime-sourceaddress-userinfo-src-mq3-server-oob-connect-ml-688304548"></a>
### directConnect

```ml
function directConnect(runtime, sourceAddress, userinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |
| `userinfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L83)

<a id="function-function-mq3-server-oob-connect-emptychallenge-function-emptychallenge-src-mq3-server-oob-connect-ml-1391999654"></a>
### emptyChallenge

```ml
function emptyChallenge()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L22)

<a id="function-function-mq3-server-oob-connect-emptyclient-function-emptyclient-src-mq3-server-oob-connect-ml-1853200326"></a>
### emptyClient

```ml
function emptyClient()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L24)

<a id="function-function-mq3-server-oob-connect-getchallenge-function-getchallenge-runtime-sourceaddress-src-mq3-server-oob-connect-ml-1904587623"></a>
### getChallenge

```ml
function getChallenge(runtime, sourceAddress)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L42)

<a id="function-function-mq3-server-oob-connect-islan-function-islan-runtime-sourceaddress-src-mq3-server-oob-connect-ml-1128095929"></a>
### isLan

```ml
function isLan(runtime, sourceAddress)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L37)

<a id="function-function-mq3-server-oob-connect-islocal-function-islocal-runtime-sourceaddress-src-mq3-server-oob-connect-ml-617653041"></a>
### isLocal

```ml
function isLocal(runtime, sourceAddress)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L38)

<a id="function-function-mq3-server-oob-connect-matchingclient-function-matchingclient-client-sourceaddress-qport-src-mq3-server-oob-connect-ml-245028872"></a>
### matchingClient

```ml
function matchingClient(client, sourceAddress, qport)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |
| `qport` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L81)

<a id="constant-constant-mq3-server-oob-connect-max-challenges-const-max-challenges-1024-src-mq3-server-oob-connect-ml-1781854878"></a>
### MAX_CHALLENGES

```ml
const MAX_CHALLENGES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L9)

<a id="constant-constant-mq3-server-oob-connect-na-bot-const-na-bot-0-src-mq3-server-oob-connect-ml-1566922161"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L14)

<a id="constant-constant-mq3-server-oob-connect-protocol-version-const-protocol-version-68-src-mq3-server-oob-connect-ml-1306746683"></a>
### PROTOCOL_VERSION

```ml
const PROTOCOL_VERSION = 68
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L11)

<a id="function-function-mq3-server-oob-connect-randomvalue-function-randomvalue-runtime-src-mq3-server-oob-connect-ml-1606370782"></a>
### randomValue

```ml
function randomValue(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L40)

<a id="function-function-mq3-server-oob-connect-result-function-result-ok-reason-slot-index-userinfo-src-mq3-server-oob-connect-ml-1117917873"></a>
### result

```ml
function result(ok, reason, slot, index, userinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ok` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `userinfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L35)

- [mq3.server.oob_connect.Result](Type-mq3-server-oob-connect-result-1146281401.md) — struct
- [mq3.server.oob_connect.Runtime](Type-mq3-server-oob-connect-runtime-3013588.md) — struct
<a id="function-function-mq3-server-oob-connect-sameaddress-function-sameaddress-a-b-src-mq3-server-oob-connect-ml-373007823"></a>
### sameAddress

```ml
function sameAddress(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L19)

<a id="function-function-mq3-server-oob-connect-samebase-function-samebase-a-b-src-mq3-server-oob-connect-ml-721127311"></a>
### sameBase

```ml
function sameBase(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L18)

<a id="function-function-mq3-server-oob-connect-send-function-send-runtime-targetaddress-text-src-mq3-server-oob-connect-ml-143958822"></a>
### send

```ml
function send(runtime, targetAddress, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `targetAddress` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L39)

<a id="function-function-mq3-server-oob-connect-sv-authorizeippacket-function-sv-authorizeippacket-runtime-sourceaddress-args-fsrestrict-src-mq3-server-oob-connect-ml-1445611829"></a>
### SV_AuthorizeIpPacket

```ml
function SV_AuthorizeIpPacket(runtime, sourceAddress, args, fsRestrict)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `fsRestrict` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L78)
