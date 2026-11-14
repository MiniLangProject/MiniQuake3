# `src/mq3/client/ui_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_main`](Package-mq3-client-ui-main-791166769.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-main-arg-function-arg-args-index-src-mq3-client-ui-main-ml-203050677"></a>
### arg

```ml
function arg(args, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L38)

<a id="function-function-mq3-client-ui-main-create-function-create-retailqvmactive-src-mq3-client-ui-main-ml-1582222863"></a>
### create

```ml
function create(retailQvmActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailQvmActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L36)

<a id="constant-constant-mq3-client-ui-main-cvar-archive-const-cvar-archive-1-src-mq3-client-ui-main-ml-109240264"></a>
### CVAR_ARCHIVE

```ml
const CVAR_ARCHIVE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L18)

<a id="constant-constant-mq3-client-ui-main-cvar-init-const-cvar-init-16-src-mq3-client-ui-main-ml-1128840638"></a>
### CVAR_INIT

```ml
const CVAR_INIT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L19)

<a id="constant-constant-mq3-client-ui-main-cvar-latch-const-cvar-latch-32-src-mq3-client-ui-main-ml-1731694728"></a>
### CVAR_LATCH

```ml
const CVAR_LATCH = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L20)

<a id="constant-constant-mq3-client-ui-main-cvar-rom-const-cvar-rom-64-src-mq3-client-ui-main-ml-2045725531"></a>
### CVAR_ROM

```ml
const CVAR_ROM = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L21)

- [mq3.client.ui_main.CvarSpec](Type-mq3-client-ui-main-cvarspec-1269032976.md) — struct
<a id="function-function-mq3-client-ui-main-cvartable-function-cvartable-src-mq3-client-ui-main-ml-1439948082"></a>
### cvarTable

```ml
function cvarTable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L29)

- [mq3.client.ui_main.DispatchResult](Type-mq3-client-ui-main-dispatchresult-1778608090.md) — struct
<a id="function-function-mq3-client-ui-main-hostaction-function-hostaction-state-boundary-kind-name-args-src-mq3-client-ui-main-ml-713026557"></a>
### hostAction

```ml
function hostAction(state, boundary, kind, name, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L37)

- [mq3.client.ui_main.HostAction](Type-mq3-client-ui-main-hostaction-1975326125.md) — struct
<a id="function-function-mq3-client-ui-main-result-function-result-value-action-src-mq3-client-ui-main-ml-949067465"></a>
### result

```ml
function result(value, action)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `action` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L39)

<a id="function-function-mq3-client-ui-main-spec-function-spec-name-defaultvalue-flags-src-mq3-client-ui-main-ml-1532535040"></a>
### spec

```ml
function spec(name, defaultValue, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L28)

- [mq3.client.ui_main.State](Type-mq3-client-ui-main-state-743995406.md) — struct
<a id="constant-constant-mq3-client-ui-main-ui-api-version-const-ui-api-version-6-src-mq3-client-ui-main-ml-192207847"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L17)

<a id="constant-constant-mq3-client-ui-main-ui-console-command-const-ui-console-command-8-src-mq3-client-ui-main-ml-905140501"></a>
### UI_CONSOLE_COMMAND

```ml
const UI_CONSOLE_COMMAND = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L14)

<a id="constant-constant-mq3-client-ui-main-ui-draw-connect-screen-const-ui-draw-connect-screen-9-src-mq3-client-ui-main-ml-274745700"></a>
### UI_DRAW_CONNECT_SCREEN

```ml
const UI_DRAW_CONNECT_SCREEN = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L15)

<a id="constant-constant-mq3-client-ui-main-ui-getapiversion-const-ui-getapiversion-0-src-mq3-client-ui-main-ml-1182020107"></a>
### UI_GETAPIVERSION

```ml
const UI_GETAPIVERSION = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L6)

<a id="constant-constant-mq3-client-ui-main-ui-hasuniquecdkey-const-ui-hasuniquecdkey-10-src-mq3-client-ui-main-ml-1664150744"></a>
### UI_HASUNIQUECDKEY

```ml
const UI_HASUNIQUECDKEY = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L16)

<a id="constant-constant-mq3-client-ui-main-ui-init-const-ui-init-1-src-mq3-client-ui-main-ml-122100856"></a>
### UI_INIT

```ml
const UI_INIT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L7)

<a id="constant-constant-mq3-client-ui-main-ui-is-fullscreen-const-ui-is-fullscreen-6-src-mq3-client-ui-main-ml-1352086601"></a>
### UI_IS_FULLSCREEN

```ml
const UI_IS_FULLSCREEN = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L12)

<a id="constant-constant-mq3-client-ui-main-ui-key-event-const-ui-key-event-3-src-mq3-client-ui-main-ml-1417606990"></a>
### UI_KEY_EVENT

```ml
const UI_KEY_EVENT = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L9)

<a id="constant-constant-mq3-client-ui-main-ui-mouse-event-const-ui-mouse-event-4-src-mq3-client-ui-main-ml-116290659"></a>
### UI_MOUSE_EVENT

```ml
const UI_MOUSE_EVENT = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L10)

<a id="constant-constant-mq3-client-ui-main-ui-refresh-const-ui-refresh-5-src-mq3-client-ui-main-ml-1207594798"></a>
### UI_REFRESH

```ml
const UI_REFRESH = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L11)

<a id="function-function-mq3-client-ui-main-ui-registercvars-function-ui-registercvars-state-src-mq3-client-ui-main-ml-7027327"></a>
### UI_RegisterCvars

```ml
function UI_RegisterCvars(state)
```

UI_RegisterCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L42)

<a id="constant-constant-mq3-client-ui-main-ui-set-active-menu-const-ui-set-active-menu-7-src-mq3-client-ui-main-ml-875542084"></a>
### UI_SET_ACTIVE_MENU

```ml
const UI_SET_ACTIVE_MENU = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L13)

<a id="constant-constant-mq3-client-ui-main-ui-shutdown-const-ui-shutdown-2-src-mq3-client-ui-main-ml-1236238321"></a>
### UI_SHUTDOWN

```ml
const UI_SHUTDOWN = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L8)

<a id="function-function-mq3-client-ui-main-ui-updatecvars-function-ui-updatecvars-state-src-mq3-client-ui-main-ml-1836780499"></a>
### UI_UpdateCvars

```ml
function UI_UpdateCvars(state)
```

UI_UpdateCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L47)

<a id="function-function-mq3-client-ui-main-vmmain-function-vmmain-state-command-args-src-mq3-client-ui-main-ml-1159591367"></a>
### vmMain

```ml
function vmMain(state, command, args)
```

vmMain

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L52)
