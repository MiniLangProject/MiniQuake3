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

Calls `mq3.compat.numeric.readI32` from UI LAN cache `addressText`. The final path returns `str(data[offset+4])+"."+str(data[offset+5])+"."+str(data[offset+6])+"."+str(data[offset+7])+suffix`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[offset+18]`, `data[offset+19]`, `data[offset+4]`, `data[offset+5]` and additional values. |
| `offset` | `dynamic` | — | Value used by `addressType=n.readI32(data,offset)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L126)

<a id="constant-constant-mq3-client-ui-lan-cache-cache-name-const-cache-name-servercache-dat-src-mq3-client-ui-lan-cache-ml-688146815"></a>
### CACHE_NAME

```ml
const CACHE_NAME = "servercache.dat"
```

Filename used to persist the native server-browser cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L12)

<a id="constant-constant-mq3-client-ui-lan-cache-cache-size-const-cache-size-header-size-payload-size-src-mq3-client-ui-lan-cache-ml-679378927"></a>
### CACHE_SIZE

```ml
const CACHE_SIZE = HEADER_SIZE + PAYLOAD_SIZE
```

Total byte length of the persisted cache header and server-list payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L26)

<a id="function-function-mq3-client-ui-lan-cache-copytext-function-copytext-data-offset-capacity-src-mq3-client-ui-lan-cache-ml-1528705911"></a>
### copyText

```ml
function copyText(data, offset, capacity)
```

Calls `decode`, `slice` from UI LAN cache `copyText`. The final path returns `decode(slice(data,offset,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[offset+count]`. |
| `offset` | `dynamic` | — | Value used by `while count<capacity and data[offset+count]!=0 count=count+1 end while`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L84)

<a id="function-function-mq3-client-ui-lan-cache-decodeinto-function-decodeinto-state-data-src-mq3-client-ui-lan-cache-ml-574582485"></a>
### decodeInto

```ml
function decodeInto(state, data)
```

Baseq3 resets all three counts before opening the file and rejects a cache whose fixed-array size differs from this executable's serverInfo_t layout.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN cache record/storage; this routine assigns `state.globalServers`, `state.mplayer`, `state.favorites`. |
| `data` | `dynamic` | — | Payload whose length/content is inspected by `decodeInto`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L203)

- [mq3.client.ui_lan_cache.DiskContext](Type-mq3-client-ui-lan-cache-diskcontext-1727176568.md) — struct
<a id="function-function-mq3-client-ui-lan-cache-diskread-function-diskread-context-name-src-mq3-client-ui-lan-cache-ml-295489448"></a>
### diskRead

```ml
function diskRead(context, name)
```

Adapts `std.fs.readAllBytes` to UI LAN cache `diskRead`, returning its result for `path(context.root,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.root`. |
| `name` | `dynamic` | — | Argument 1 of `std.fs.readAllBytes`; passed as `path(context.root,name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L70)

<a id="function-function-mq3-client-ui-lan-cache-diskservices-function-diskservices-root-src-mq3-client-ui-lan-cache-ml-1493323656"></a>
### diskServices

```ml
function diskServices(root)
```

Adapts `mq3.client.ui_lan_cache.services` to UI LAN cache `diskServices`, returning its result for `diskRead, diskWrite, DiskContext(root)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_cache.services`; passed as `DiskContext(root)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L78)

<a id="function-function-mq3-client-ui-lan-cache-diskwrite-function-diskwrite-context-name-data-src-mq3-client-ui-lan-cache-ml-1016337724"></a>
### diskWrite

```ml
function diskWrite(context, name, data)
```

Adapts `std.fs.writeAllBytes` to UI LAN cache `diskWrite`, returning its result for `path(context.root,name), data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.root`. |
| `name` | `dynamic` | — | Argument 1 of `std.fs.writeAllBytes`; passed as `path(context.root,name)`. |
| `data` | `dynamic` | — | Argument 2 of `std.fs.writeAllBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L75)

<a id="function-function-mq3-client-ui-lan-cache-encode-function-encode-state-src-mq3-client-ui-lan-cache-ml-521403589"></a>
### encode

```ml
function encode(state)
```

LAN_SaveServersToCache writes three counts, the combined fixed-array size, then globalServers, mplayerServers and favoriteServers in that exact order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.globalServers`, `state.mplayer`, `state.favorites`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L188)

<a id="constant-constant-mq3-client-ui-lan-cache-global-bytes-const-global-bytes-lan-max-global-servers-server-info-size-src-mq3-client-ui-lan-cache-ml-1651761703"></a>
### GLOBAL_BYTES

```ml
const GLOBAL_BYTES = lan.MAX_GLOBAL_SERVERS * SERVER_INFO_SIZE
```

Byte count used when storing or marshalling the global data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L20)

<a id="constant-constant-mq3-client-ui-lan-cache-header-size-const-header-size-16-src-mq3-client-ui-lan-cache-ml-1295565400"></a>
### HEADER_SIZE

```ml
const HEADER_SIZE = 16
```

Byte length of the persisted server-cache header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L18)

<a id="function-function-mq3-client-ui-lan-cache-load-function-load-state-host-src-mq3-client-ui-lan-cache-ml-569120291"></a>
### load

```ml
function load(state, host)
```

Calls `mq3.client.ui_lan_cache.reset`, `host.readFn`, `mq3.client.ui_lan_cache.decodeInto` from UI LAN cache `load`. The final path returns `decodeInto(state,data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN cache state passed to the helper calls in `load`. |
| `host` | `dynamic` | — | Record read through `host.readFn`, `host.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L223)

<a id="constant-constant-mq3-client-ui-lan-cache-na-bad-const-na-bad-1-src-mq3-client-ui-lan-cache-ml-211642820"></a>
### NA_BAD

```ml
const NA_BAD = 1
```

Network-address kind identifying a bad destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L29)

<a id="constant-constant-mq3-client-ui-lan-cache-na-broadcast-const-na-broadcast-3-src-mq3-client-ui-lan-cache-ml-661203602"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```

Network-address kind identifying a broadcast destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L33)

<a id="constant-constant-mq3-client-ui-lan-cache-na-ip-const-na-ip-4-src-mq3-client-ui-lan-cache-ml-1603151249"></a>
### NA_IP

```ml
const NA_IP = 4
```

Network-address kind identifying a ip destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L35)

<a id="constant-constant-mq3-client-ui-lan-cache-na-loopback-const-na-loopback-2-src-mq3-client-ui-lan-cache-ml-2123308407"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```

Network-address kind identifying a loopback destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L31)

<a id="constant-constant-mq3-client-ui-lan-cache-netadr-size-const-netadr-size-20-src-mq3-client-ui-lan-cache-ml-324155203"></a>
### NETADR_SIZE

```ml
const NETADR_SIZE = 20
```

Size in bytes of the native network-address record used by the compatibility ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L14)

<a id="constant-constant-mq3-client-ui-lan-cache-other-bytes-const-other-bytes-lan-max-other-servers-server-info-size-src-mq3-client-ui-lan-cache-ml-1139137762"></a>
### OTHER_BYTES

```ml
const OTHER_BYTES = lan.MAX_OTHER_SERVERS * SERVER_INFO_SIZE
```

Byte count used when storing or marshalling the other data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L22)

<a id="function-function-mq3-client-ui-lan-cache-parsedaddress-function-parsedaddress-text-src-mq3-client-ui-lan-cache-ml-2064311561"></a>
### parsedAddress

```ml
function parsedAddress(text)
```

Calls `std.string.lastIndexOf`, `decode`, `slice` and additional helpers from UI LAN cache `parsedAddress`. The final path returns `[addressType,a,b,c,d,port]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `parsedAddress` in the UI LAN cache path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L110)

<a id="function-function-mq3-client-ui-lan-cache-parseoctet-function-parseoctet-text-src-mq3-client-ui-lan-cache-ml-835914207"></a>
### parseOctet

```ml
function parseOctet(text)
```

Calls `toNumber` from UI LAN cache `parseOctet`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `parseOctet` in the UI LAN cache path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L101)

<a id="function-function-mq3-client-ui-lan-cache-path-function-path-root-name-src-mq3-client-ui-lan-cache-ml-733943587"></a>
### path

```ml
function path(root, name)
```

Evaluates UI LAN cache `path` and returns `name`, `root+name`, `root+"/"+name` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | Value used by `if root=="" then return name end if`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI LAN cache resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L62)

<a id="constant-constant-mq3-client-ui-lan-cache-payload-size-const-payload-size-global-bytes-other-bytes-other-bytes-src-mq3-client-ui-lan-cache-ml-638434686"></a>
### PAYLOAD_SIZE

```ml
const PAYLOAD_SIZE = GLOBAL_BYTES + OTHER_BYTES + OTHER_BYTES
```

Byte length of the server-list record blocks stored after the cache header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L24)

<a id="function-function-mq3-client-ui-lan-cache-readlist-function-readlist-data-offset-count-src-mq3-client-ui-lan-cache-ml-183880550"></a>
### readList

```ml
function readList(data, offset, count)
```

Calls `mq3.client.ui_lan_cache.readServer` from UI LAN cache `readList`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `if count>0 then for index=0 to count-1 result=result+[readServer(data,offset+index*SERVER_INFO_SIZE)] end for end if`. |
| `offset` | `dynamic` | — | Value used by `if count>0 then for index=0 to count-1 result=result+[readServer(data,offset+index*SERVER_INFO_SIZE)] end for end if`. |
| `count` | `dynamic` | — | Value tested by `count>0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L176)

<a id="function-function-mq3-client-ui-lan-cache-readserver-function-readserver-data-offset-src-mq3-client-ui-lan-cache-ml-1519746311"></a>
### readServer

```ml
function readServer(data, offset)
```

Calls `mq3.client.ui_lan_browser.server`, `mq3.client.ui_lan_cache.addressText`, `mq3.client.ui_lan_cache.copyText` and additional helpers from UI LAN cache `readServer`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `value=lan.server(addressText(data,offset),copyText(data,offset+20,32))`. |
| `offset` | `dynamic` | — | Value used by `value=lan.server(addressText(data,offset),copyText(data,offset+20,32))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L157)

<a id="function-function-mq3-client-ui-lan-cache-reset-function-reset-state-src-mq3-client-ui-lan-cache-ml-1214343975"></a>
### reset

```ml
function reset(state)
```

Updates `state.globalServers`, `state.mplayer`, `state.favorites` during UI LAN cache `reset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN cache record/storage; this routine assigns `state.globalServers`, `state.mplayer`, `state.favorites`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L181)

<a id="function-function-mq3-client-ui-lan-cache-save-function-save-state-host-src-mq3-client-ui-lan-cache-ml-1923147063"></a>
### save

```ml
function save(state, host)
```

Calls `host.writeFn`, `mq3.client.ui_lan_cache.encode` from UI LAN cache `save`. The final path returns `result==true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN cache state passed to the helper calls in `save`. |
| `host` | `dynamic` | — | Record read through `host.writeFn`, `host.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L216)

<a id="constant-constant-mq3-client-ui-lan-cache-server-info-size-const-server-info-size-152-src-mq3-client-ui-lan-cache-ml-1533432927"></a>
### SERVER_INFO_SIZE

```ml
const SERVER_INFO_SIZE = 152
```

Size in bytes reserved for a native server-information record during ABI marshalling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L16)

<a id="function-function-mq3-client-ui-lan-cache-services-function-services-readfn-writefn-context-src-mq3-client-ui-lan-cache-ml-925872950"></a>
### services

```ml
function services(readFn, writeFn, context)
```

Creates a `mq3.client.ui_lan_cache.Services` record. Assigns `readFn` from `readFn`, `writeFn` from `writeFn`, `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `readFn` | `dynamic` | — | Value used to initialize `Services.readFn`. |
| `writeFn` | `dynamic` | — | Value used to initialize `Services.writeFn`. |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L57)

- [mq3.client.ui_lan_cache.Services](Type-mq3-client-ui-lan-cache-services-1443445716.md) — struct
<a id="function-function-mq3-client-ui-lan-cache-writeaddress-function-writeaddress-data-offset-text-src-mq3-client-ui-lan-cache-ml-2125158224"></a>
### writeAddress

```ml
function writeAddress(data, offset, text)
```

Updates `data[offset+4]`, `data[offset+5]`, `data[offset+6]`, `data[offset+7]` and additional values during UI LAN cache `writeAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable sequence; this routine writes `data[offset+4]`, `data[offset+5]`, `data[offset+6]`, `data[offset+7]` and additional values. |
| `offset` | `dynamic` | — | Value used by `n.writeU32(data,offset,parsed[0])`. |
| `text` | `dynamic` | — | Text consumed or emitted by `writeAddress` in the UI LAN cache path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L137)

<a id="function-function-mq3-client-ui-lan-cache-writelist-function-writelist-data-offset-values-capacity-src-mq3-client-ui-lan-cache-ml-1904547495"></a>
### writeList

```ml
function writeList(data, offset, values, capacity)
```

Calls `mq3.client.ui_lan_cache.writeServer` from UI LAN cache `writeList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `if count>0 then for index=0 to count-1 writeServer(data,offset+index*SERVER_INFO_SIZE,values[index]) end for end if`. |
| `offset` | `dynamic` | — | Value used by `if count>0 then for index=0 to count-1 writeServer(data,offset+index*SERVER_INFO_SIZE,values[index]) end for end if`. |
| `values` | `dynamic` | — | Sequence read at `values[index]`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L168)

<a id="function-function-mq3-client-ui-lan-cache-writeserver-function-writeserver-data-offset-value-src-mq3-client-ui-lan-cache-ml-572686560"></a>
### writeServer

```ml
function writeServer(data, offset, value)
```

Calls `mq3.client.ui_lan_cache.writeAddress`, `mq3.client.ui_lan_cache.writeText`, `mq3.compat.numeric.writeU32` from UI LAN cache `writeServer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `writeAddress(data,offset,value.address)`. |
| `offset` | `dynamic` | — | Value used by `writeAddress(data,offset,value.address)`. |
| `value` | `dynamic` | — | Record read through `value.address`, `value.hostName`, `value.mapName`, `value.game` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L146)

<a id="function-function-mq3-client-ui-lan-cache-writetext-function-writetext-data-offset-capacity-text-src-mq3-client-ui-lan-cache-ml-1346507292"></a>
### writeText

```ml
function writeText(data, offset, capacity, text)
```

Calls `copyBytes` from UI LAN cache `writeText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`. |
| `offset` | `dynamic` | — | Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |
| `text` | `dynamic` | — | Text consumed or emitted by `writeText` in the UI LAN cache path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L93)
