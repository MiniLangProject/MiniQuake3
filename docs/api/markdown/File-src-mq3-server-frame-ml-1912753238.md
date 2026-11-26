# `src/mq3/server/frame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.frame`](Package-mq3-server-frame-2090772802.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/server/client_pings.ml` as `clientPings` → [src/mq3/server/client_pings.ml](File-src-mq3-server-client-pings-ml-573754950.md)
- `mq3/server/pause.ml` as `serverPause` → [src/mq3/server/pause.ml](File-src-mq3-server-pause-ml-1830413695.md)
- `mq3/server/snapshot_schedule.ml` as `snapshotSchedule` → [src/mq3/server/snapshot_schedule.ml](File-src-mq3-server-snapshot-schedule-ml-156964973.md)
- `mq3/server/timeouts.ml` as `serverTimeouts` → [src/mq3/server/timeouts.ml](File-src-mq3-server-timeouts-ml-1356487829.md)

## Declarations

<a id="function-function-mq3-server-frame-call0-function-call0-fn-host-src-mq3-server-frame-ml-1256005164"></a>
### call0

```ml
function call0(fn, host)
```

Compute call 0 in server.frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fn` | `dynamic` | — | Fn used in `fn(host)` and `(fn != void)`. |
| `host` | `dynamic` | — | Host used in `fn(host)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L114)

<a id="constant-constant-mq3-server-frame-cs-serverinfo-const-cs-serverinfo-0-src-mq3-server-frame-ml-402189561"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```

An info string with all the serverinfo cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L16)

<a id="constant-constant-mq3-server-frame-cs-systeminfo-const-cs-systeminfo-1-src-mq3-server-frame-ml-397464762"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```

An info string for server system to client system configuration (timescale, etc).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L18)

<a id="constant-constant-mq3-server-frame-cvar-serverinfo-const-cvar-serverinfo-4-src-mq3-server-frame-ml-137631489"></a>
### CVAR_SERVERINFO

```ml
const CVAR_SERVERINFO = 4
```

Sent in response to front end requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L12)

<a id="constant-constant-mq3-server-frame-cvar-systeminfo-const-cvar-systeminfo-8-src-mq3-server-frame-ml-1080884573"></a>
### CVAR_SYSTEMINFO

```ml
const CVAR_SYSTEMINFO = 8
```

These cvars will be duplicated on all clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L14)

<a id="function-function-mq3-server-frame-cvarset-function-cvarset-host-name-value-src-mq3-server-frame-ml-526066864"></a>
### cvarSet

```ml
function cvarSet(host, name, value)
```

Compute cvar set in server.frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `cvarSetFn`. |
| `name` | `dynamic` | — | Name used in `host.cvarSetFn(host, name, value)`. |
| `value` | `dynamic` | — | Value used in `host.cvarSetFn(host, name, value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L119)

<a id="function-function-mq3-server-frame-run-function-run-state-msec-host-src-mq3-server-frame-ml-716877157"></a>
### run

```ml
function run(state, msec, host)
```

Runs one outer server frame. All platform/VM effects are explicit services; ping, pause, timeout and snapshot policy use their productive port modules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `killServer`, `running`, `pauseClients`, `clPaused`, `svPaused`, `fps`, `timeResidual` and further fields. Updated in place: `killServer`, `svPaused`, `fps`, `timeResidual`, `restartTime`, `modifiedFlags` and further fields. |
| `msec` | `dynamic` | — | Right integer operand; only its low 32 bits participate. |
| `host` | `dynamic` | — | Record exposing `shutdownFn`, `pauseObservedFn`, `botFrameFn`, `sleepFn`, `commandFn`, `infoStringFn`, `setConfigstringFn` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L126)

<a id="function-function-mq3-server-frame-runtime-function-runtime-src-mq3-server-frame-ml-832790798"></a>
### runtime

```ml
function runtime()
```

Create `mq3.server.frame.Runtime` with killServer=0; running=0; clPaused=0; svPaused=0; 16 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L64)

- [mq3.server.frame.Runtime](Type-mq3-server-frame-runtime-733694840.md) — struct
<a id="function-function-mq3-server-frame-services-function-services-src-mq3-server-frame-ml-408716694"></a>
### services

```ml
function services()
```

Create `mq3.server.frame.Services` with shutdownFn=void; cvarSetFn=void; botFrameFn=void; sleepFn=void; 13 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L107)

- [mq3.server.frame.Services](Type-mq3-server-frame-services-969691596.md) — struct
