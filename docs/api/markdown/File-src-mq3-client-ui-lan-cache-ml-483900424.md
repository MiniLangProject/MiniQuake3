# `src/mq3/client/ui_lan_cache.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_cache`](Package-mq3-client-ui-lan-cache-2124614330.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/ui_lan_browser.ml` as `lan` → [src/mq3/client/ui_lan_browser.ml](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-lan-cache-addresstext-function-addresstext-data-offset-src-mq3-client-ui-lan-cache-ml-755078037"></a>
### addressText

```ml
function addressText(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L69)

<a id="constant-constant-mq3-client-ui-lan-cache-cache-name-const-cache-name-servercache-dat-src-mq3-client-ui-lan-cache-ml-688146815"></a>
### CACHE_NAME

```ml
const CACHE_NAME = "servercache.dat"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L11)

<a id="constant-constant-mq3-client-ui-lan-cache-cache-size-const-cache-size-header-size-payload-size-src-mq3-client-ui-lan-cache-ml-679378927"></a>
### CACHE_SIZE

```ml
const CACHE_SIZE = HEADER_SIZE + PAYLOAD_SIZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L18)

<a id="function-function-mq3-client-ui-lan-cache-copytext-function-copytext-data-offset-capacity-src-mq3-client-ui-lan-cache-ml-1528705911"></a>
### copyText

```ml
function copyText(data, offset, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L39)

<a id="function-function-mq3-client-ui-lan-cache-decodeinto-function-decodeinto-state-data-src-mq3-client-ui-lan-cache-ml-574582485"></a>
### decodeInto

```ml
function decodeInto(state, data)
```

Baseq3 resets all three counts before opening the file and rejects a cache whose fixed-array size differs from this executable's serverInfo_t layout.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L121)

- [mq3.client.ui_lan_cache.DiskContext](Type-mq3-client-ui-lan-cache-diskcontext-1727176568.md) — struct
<a id="function-function-mq3-client-ui-lan-cache-diskread-function-diskread-context-name-src-mq3-client-ui-lan-cache-ml-295489448"></a>
### diskRead

```ml
function diskRead(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L35)

<a id="function-function-mq3-client-ui-lan-cache-diskservices-function-diskservices-root-src-mq3-client-ui-lan-cache-ml-1493323656"></a>
### diskServices

```ml
function diskServices(root)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L37)

<a id="function-function-mq3-client-ui-lan-cache-diskwrite-function-diskwrite-context-name-data-src-mq3-client-ui-lan-cache-ml-1016337724"></a>
### diskWrite

```ml
function diskWrite(context, name, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L36)

<a id="function-function-mq3-client-ui-lan-cache-encode-function-encode-state-src-mq3-client-ui-lan-cache-ml-521403589"></a>
### encode

```ml
function encode(state)
```

LAN_SaveServersToCache writes three counts, the combined fixed-array size, then globalServers, mplayerServers and favoriteServers in that exact order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L108)

<a id="constant-constant-mq3-client-ui-lan-cache-global-bytes-const-global-bytes-lan-max-global-servers-server-info-size-src-mq3-client-ui-lan-cache-ml-1651761703"></a>
### GLOBAL_BYTES

```ml
const GLOBAL_BYTES = lan.MAX_GLOBAL_SERVERS * SERVER_INFO_SIZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L15)

<a id="constant-constant-mq3-client-ui-lan-cache-header-size-const-header-size-16-src-mq3-client-ui-lan-cache-ml-1295565400"></a>
### HEADER_SIZE

```ml
const HEADER_SIZE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L14)

<a id="function-function-mq3-client-ui-lan-cache-load-function-load-state-host-src-mq3-client-ui-lan-cache-ml-569120291"></a>
### load

```ml
function load(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L135)

<a id="constant-constant-mq3-client-ui-lan-cache-na-bad-const-na-bad-1-src-mq3-client-ui-lan-cache-ml-211642820"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L20)

<a id="constant-constant-mq3-client-ui-lan-cache-na-broadcast-const-na-broadcast-3-src-mq3-client-ui-lan-cache-ml-661203602"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L22)

<a id="constant-constant-mq3-client-ui-lan-cache-na-ip-const-na-ip-4-src-mq3-client-ui-lan-cache-ml-1603151249"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L23)

<a id="constant-constant-mq3-client-ui-lan-cache-na-loopback-const-na-loopback-2-src-mq3-client-ui-lan-cache-ml-2123308407"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L21)

<a id="constant-constant-mq3-client-ui-lan-cache-netadr-size-const-netadr-size-20-src-mq3-client-ui-lan-cache-ml-324155203"></a>
### NETADR_SIZE

```ml
const NETADR_SIZE = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L12)

<a id="constant-constant-mq3-client-ui-lan-cache-other-bytes-const-other-bytes-lan-max-other-servers-server-info-size-src-mq3-client-ui-lan-cache-ml-1139137762"></a>
### OTHER_BYTES

```ml
const OTHER_BYTES = lan.MAX_OTHER_SERVERS * SERVER_INFO_SIZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L16)

<a id="function-function-mq3-client-ui-lan-cache-parsedaddress-function-parsedaddress-text-src-mq3-client-ui-lan-cache-ml-2064311561"></a>
### parsedAddress

```ml
function parsedAddress(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L56)

<a id="function-function-mq3-client-ui-lan-cache-parseoctet-function-parseoctet-text-src-mq3-client-ui-lan-cache-ml-835914207"></a>
### parseOctet

```ml
function parseOctet(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L49)

<a id="function-function-mq3-client-ui-lan-cache-path-function-path-root-name-src-mq3-client-ui-lan-cache-ml-733943587"></a>
### path

```ml
function path(root, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L30)

<a id="constant-constant-mq3-client-ui-lan-cache-payload-size-const-payload-size-global-bytes-other-bytes-other-bytes-src-mq3-client-ui-lan-cache-ml-638434686"></a>
### PAYLOAD_SIZE

```ml
const PAYLOAD_SIZE = GLOBAL_BYTES + OTHER_BYTES + OTHER_BYTES
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L17)

<a id="function-function-mq3-client-ui-lan-cache-readlist-function-readlist-data-offset-count-src-mq3-client-ui-lan-cache-ml-183880550"></a>
### readList

```ml
function readList(data, offset, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L99)

<a id="function-function-mq3-client-ui-lan-cache-readserver-function-readserver-data-offset-src-mq3-client-ui-lan-cache-ml-1519746311"></a>
### readServer

```ml
function readServer(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L89)

<a id="function-function-mq3-client-ui-lan-cache-reset-function-reset-state-src-mq3-client-ui-lan-cache-ml-1214343975"></a>
### reset

```ml
function reset(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L102)

<a id="function-function-mq3-client-ui-lan-cache-save-function-save-state-host-src-mq3-client-ui-lan-cache-ml-1923147063"></a>
### save

```ml
function save(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L131)

<a id="constant-constant-mq3-client-ui-lan-cache-server-info-size-const-server-info-size-152-src-mq3-client-ui-lan-cache-ml-1533432927"></a>
### SERVER_INFO_SIZE

```ml
const SERVER_INFO_SIZE = 152
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L13)

<a id="function-function-mq3-client-ui-lan-cache-services-function-services-readfn-writefn-context-src-mq3-client-ui-lan-cache-ml-925872950"></a>
### services

```ml
function services(readFn, writeFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `readFn` | `dynamic` | — |  |
| `writeFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L28)

- [mq3.client.ui_lan_cache.Services](Type-mq3-client-ui-lan-cache-services-1443445716.md) — struct
<a id="function-function-mq3-client-ui-lan-cache-writeaddress-function-writeaddress-data-offset-text-src-mq3-client-ui-lan-cache-ml-2125158224"></a>
### writeAddress

```ml
function writeAddress(data, offset, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L76)

<a id="function-function-mq3-client-ui-lan-cache-writelist-function-writelist-data-offset-values-capacity-src-mq3-client-ui-lan-cache-ml-1904547495"></a>
### writeList

```ml
function writeList(data, offset, values, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L95)

<a id="function-function-mq3-client-ui-lan-cache-writeserver-function-writeserver-data-offset-value-src-mq3-client-ui-lan-cache-ml-572686560"></a>
### writeServer

```ml
function writeServer(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L81)

<a id="function-function-mq3-client-ui-lan-cache-writetext-function-writetext-data-offset-capacity-text-src-mq3-client-ui-lan-cache-ml-1346507292"></a>
### writeText

```ml
function writeText(data, offset, capacity, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L43)
