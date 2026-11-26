# `src/mq3/server/oob_connect.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.oob_connect`](Package-mq3-server-oob-connect-56257902.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-oob-connect-address-function-address-type-ip-port-src-mq3-server-oob-connect-ml-1308801208"></a>
### address

```ml
function address(type, ip, port)
```

Create `mq3.server.oob_connect.Address` with type=type; ip=ip; port=port.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — | Initial `type` field stored in the returned or constructed `mq3.server.oob_connect.Address` record. |
| `ip` | `dynamic` | — | Initial `ip` field stored in the returned or constructed `mq3.server.oob_connect.Address` record. |
| `port` | `dynamic` | — | Initial `port` field stored in the returned or constructed `mq3.server.oob_connect.Address` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L35)

- [mq3.server.oob_connect.Address](Type-mq3-server-oob-connect-address-1718501184.md) — struct
<a id="function-function-mq3-server-oob-connect-atoi-function-atoi-text-src-mq3-server-oob-connect-ml-1662370743"></a>
### atoi

```ml
function atoi(text)
```

Compute atoi in server.oob_connect; the normal completion returns `(value * sign)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `len(text)` and `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L251)

<a id="constant-constant-mq3-server-oob-connect-authorize-timeout-const-authorize-timeout-5000-src-mq3-server-oob-connect-ml-966274156"></a>
### AUTHORIZE_TIMEOUT

```ml
const AUTHORIZE_TIMEOUT = 5000
```

Wait limit before the connection policy stops waiting for authorization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L12)

<a id="function-function-mq3-server-oob-connect-authorizediagnostic-function-authorizediagnostic-runtime-text-src-mq3-server-oob-connect-ml-715940559"></a>
### authorizeDiagnostic

```ml
function authorizeDiagnostic(runtime, text)
```

Compute authorize diagnostic in server.oob_connect.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `diagnosticFn`. |
| `text` | `dynamic` | — | Text used in `runtime.diagnosticFn(runtime, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L218)

<a id="function-function-mq3-server-oob-connect-authorizeippacket-function-authorizeippacket-runtime-sourceaddress-args-fsrestrict-src-mq3-server-oob-connect-ml-1094388953"></a>
### authorizeIpPacket

```ml
function authorizeIpPacket(runtime, sourceAddress, args, fsRestrict)
```

Compute authorize ip packet in server.oob_connect; the normal completion returns `"denied"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `authorizeAddress`, `challenges`, `time`. |
| `sourceAddress` | `dynamic` | — | A passed as `a` to `mq3.server.oob_connect.sameBase`. |
| `args` | `dynamic` | — | Args used in `args[1]` and `args[2]`. |
| `fsRestrict` | `dynamic` | — | Fs restrict used in `(fsRestrict != 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L224)

- [mq3.server.oob_connect.Challenge](Type-mq3-server-oob-connect-challenge-1873285401.md) — struct
- [mq3.server.oob_connect.Client](Type-mq3-server-oob-connect-client-143521231.md) — struct
<a id="function-function-mq3-server-oob-connect-config-function-config-src-mq3-server-oob-connect-ml-1038355246"></a>
### config

```ml
function config()
```

Create `mq3.server.oob_connect.Config` with singlePlayer=false; reconnectLimit=3; minPing=0; maxPing=0; privateClients=0; privatePassword="".


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L108)

- [mq3.server.oob_connect.Config](Type-mq3-server-oob-connect-config-1608169934.md) — struct
<a id="function-function-mq3-server-oob-connect-create-function-create-maxclients-settings-src-mq3-server-oob-connect-ml-1483751239"></a>
### create

```ml
function create(maxClients, settings)
```

Create oob connect in server.oob_connect; the normal completion returns `Runtime(0, challenges, clients, settings, void, void, void, void, void, void, void, void, void, void, void)`.

Validation failures include `oob connect: invalid maxclients`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Max clients used in `(maxClients - 1)` and `(maxClients <= 0)`. |
| `settings` | `dynamic` | — | Initial `config` field stored in the returned or constructed `mq3.server.oob_connect.Runtime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L149)

<a id="constant-constant-mq3-server-oob-connect-cs-connected-const-cs-connected-2-src-mq3-server-oob-connect-ml-39802061"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```

Client lifecycle state after connection but before gamestate priming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L18)

<a id="constant-constant-mq3-server-oob-connect-cs-free-const-cs-free-0-src-mq3-server-oob-connect-ml-1347887709"></a>
### CS_FREE

```ml
const CS_FREE = 0
```

Client-state value identifying a vacant slot available for accepting a new connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L16)

<a id="function-function-mq3-server-oob-connect-directconnect-function-directconnect-runtime-sourceaddress-userinfo-src-mq3-server-oob-connect-ml-688304548"></a>
### directConnect

```ml
function directConnect(runtime, sourceAddress, userinfo)
```

Compute direct connect in server.oob_connect; the normal completion returns `result(true, "", slot, challengeIndex, userinfo)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `clients`, `time`, `config`, `challenges`, `dropFn`, `gameConnectFn`, `heartbeatFn`. |
| `sourceAddress` | `dynamic` | — | Record exposing `ip`, `port`. |
| `userinfo` | `dynamic` | — | Info passed as `info` to `mq3.shared.info.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L262)

<a id="function-function-mq3-server-oob-connect-emptychallenge-function-emptychallenge-src-mq3-server-oob-connect-ml-1391999654"></a>
### emptyChallenge

```ml
function emptyChallenge()
```

Create `mq3.server.oob_connect.Challenge` with address=void; challenge=0; time=0; pingTime=0; firstTime=0; connected=false.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L61)

<a id="function-function-mq3-server-oob-connect-emptyclient-function-emptyclient-src-mq3-server-oob-connect-ml-1853200326"></a>
### emptyClient

```ml
function emptyClient()
```

Create `mq3.server.oob_connect.Client` with state=CS_FREE; address=void; qport=0; lastConnectTime=0; reliableAcknowledge=0; reliableSequence=0; challenge=0; userinfo=""; nextSnapshotTime=0; lastPacketTime=0; gamestateMessageNum=0; bot=false.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L91)

<a id="function-function-mq3-server-oob-connect-getchallenge-function-getchallenge-runtime-sourceaddress-src-mq3-server-oob-connect-ml-1904587623"></a>
### getChallenge

```ml
function getChallenge(runtime, sourceAddress)
```

Get challenge in server.oob_connect; the normal completion returns `c`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `config`, `challenges`, `time`, `authorizeFn`. |
| `sourceAddress` | `dynamic` | — | A passed as `a` to `mq3.server.oob_connect.sameAddress`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L198)

<a id="function-function-mq3-server-oob-connect-islan-function-islan-runtime-sourceaddress-src-mq3-server-oob-connect-ml-1128095929"></a>
### isLan

```ml
function isLan(runtime, sourceAddress)
```

Test lan in server.oob_connect; the normal completion returns `runtime.lanFn(runtime, sourceAddress)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `lanFn`. |
| `sourceAddress` | `dynamic` | — | Source address used in `runtime.lanFn(runtime, sourceAddress)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L179)

<a id="function-function-mq3-server-oob-connect-islocal-function-islocal-runtime-sourceaddress-src-mq3-server-oob-connect-ml-617653041"></a>
### isLocal

```ml
function isLocal(runtime, sourceAddress)
```

Test local in server.oob_connect; the normal completion returns `runtime.localFn(runtime, sourceAddress)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `localFn`. |
| `sourceAddress` | `dynamic` | — | Source address used in `runtime.localFn(runtime, sourceAddress)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L183)

<a id="function-function-mq3-server-oob-connect-matchingclient-function-matchingclient-client-sourceaddress-qport-src-mq3-server-oob-connect-ml-245028872"></a>
### matchingClient

```ml
function matchingClient(client, sourceAddress, qport)
```

Compute server.oob_connect.matchingClient as `(((client.state != CS_FREE) and sameBase(sourceAddress, client.address)) and ((client.qport == qport) or (sourceAddress.port == client.address.port)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `state`, `address`, `qport`. |
| `sourceAddress` | `dynamic` | — | Record exposing `port`. |
| `qport` | `dynamic` | — | Qport used in `(client.qport == qport)` and `((client.qport == qport) or (sourceAddress.port == client.address.port))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L256)

<a id="constant-constant-mq3-server-oob-connect-max-challenges-const-max-challenges-1024-src-mq3-server-oob-connect-ml-1781854878"></a>
### MAX_CHALLENGES

```ml
const MAX_CHALLENGES = 1024
```

Number of pending connection-challenge entries retained by the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L10)

<a id="constant-constant-mq3-server-oob-connect-na-bot-const-na-bot-0-src-mq3-server-oob-connect-ml-1566922161"></a>
### NA_BOT

```ml
const NA_BOT = 0
```

Network-address kind reserved for an in-process bot client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L20)

<a id="constant-constant-mq3-server-oob-connect-protocol-version-const-protocol-version-68-src-mq3-server-oob-connect-ml-1306746683"></a>
### PROTOCOL_VERSION

```ml
const PROTOCOL_VERSION = 68
```

Protocol version placed in Quake III connection and discovery messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L14)

<a id="function-function-mq3-server-oob-connect-randomvalue-function-randomvalue-runtime-src-mq3-server-oob-connect-ml-1606370782"></a>
### randomValue

```ml
function randomValue(runtime)
```

Compute random value in server.oob_connect; the normal completion returns `runtime.randFn(runtime)`.

Validation failures include `oob connect: missing random service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `randFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L193)

<a id="function-function-mq3-server-oob-connect-result-function-result-ok-reason-slot-index-userinfo-src-mq3-server-oob-connect-ml-1117917873"></a>
### result

```ml
function result(ok, reason, slot, index, userinfo)
```

Create `mq3.server.oob_connect.Result` with accepted=ok; reason=reason; slot=slot; challengeIndex=index; userinfo=userinfo.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ok` | `dynamic` | — | Initial `accepted` field stored in the returned or constructed `mq3.server.oob_connect.Result` record. |
| `reason` | `dynamic` | — | Initial `reason` field stored in the returned or constructed `mq3.server.oob_connect.Result` record. |
| `slot` | `dynamic` | — | Initial `slot` field stored in the returned or constructed `mq3.server.oob_connect.Result` record. |
| `index` | `dynamic` | — | Initial `challengeIndex` field stored in the returned or constructed `mq3.server.oob_connect.Result` record. |
| `userinfo` | `dynamic` | — | Initial `userinfo` field stored in the returned or constructed `mq3.server.oob_connect.Result` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L174)

- [mq3.server.oob_connect.Result](Type-mq3-server-oob-connect-result-1146281401.md) — struct
- [mq3.server.oob_connect.Runtime](Type-mq3-server-oob-connect-runtime-3013588.md) — struct
<a id="function-function-mq3-server-oob-connect-sameaddress-function-sameaddress-a-b-src-mq3-server-oob-connect-ml-373007823"></a>
### sameAddress

```ml
function sameAddress(a, b)
```

Compute server.oob_connect.sameAddress as `(sameBase(a, b) and (a.port == b.port))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `port`. |
| `b` | `dynamic` | — | Record exposing `port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L43)

<a id="function-function-mq3-server-oob-connect-samebase-function-samebase-a-b-src-mq3-server-oob-connect-ml-721127311"></a>
### sameBase

```ml
function sameBase(a, b)
```

Compute server.oob_connect.sameBase as `((((a != void) and (b != void)) and (a.type == b.type)) and (a.ip == b.ip))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `type`, `ip`. |
| `b` | `dynamic` | — | Record exposing `type`, `ip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L39)

<a id="function-function-mq3-server-oob-connect-send-function-send-runtime-targetaddress-text-src-mq3-server-oob-connect-ml-143958822"></a>
### send

```ml
function send(runtime, targetAddress, text)
```

Send oob connect in server.oob_connect.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `sendFn`. |
| `targetAddress` | `dynamic` | — | Target address used in `runtime.sendFn(runtime, targetAddress, text)`. |
| `text` | `dynamic` | — | Text used in `runtime.sendFn(runtime, targetAddress, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L188)

<a id="function-function-mq3-server-oob-connect-sv-authorizeippacket-function-sv-authorizeippacket-runtime-sourceaddress-args-fsrestrict-src-mq3-server-oob-connect-ml-1445611829"></a>
### SV_AuthorizeIpPacket

```ml
function SV_AuthorizeIpPacket(runtime, sourceAddress, args, fsRestrict)
```

Return `mq3.server.oob_connect.authorizeIpPacket(runtime, sourceAddress, args, fsRestrict)` from `server.oob_connect.SV_AuthorizeIpPacket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.server.oob_connect.authorizeIpPacket`. |
| `sourceAddress` | `dynamic` | — | Source address passed as `sourceAddress` to `mq3.server.oob_connect.authorizeIpPacket`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.server.oob_connect.authorizeIpPacket`. |
| `fsRestrict` | `dynamic` | — | Fs restrict passed as `fsRestrict` to `mq3.server.oob_connect.authorizeIpPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L247)
