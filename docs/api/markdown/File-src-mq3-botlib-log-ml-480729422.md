# `src/mq3/botlib/log.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.log`](Package-mq3-botlib-log-777496118.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/lib_variables.ml` as `libvars` → [src/mq3/botlib/lib_variables.ml](File-src-mq3-botlib-lib-variables-ml-1792457987.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="extern_function-extern-function-mq3-botlib-log-stdio-common-vsprintf-extern-function-stdio-common-vsprintf-options-as-u64-output-as-bytes-length-as-u64-format-as-cstr-locale-as-ptr-arguments-as-bytes-from-ucrtbase-dll-returns-i32-src-mq3-botlib-log-ml-213624231"></a>
### __stdio_common_vsprintf

```ml
extern function __stdio_common_vsprintf(options as u64, output as bytes, length as u64, format as cstr, locale as ptr, arguments as bytes) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `options` | `u64` | — |  |
| `output` | `bytes` | — |  |
| `length` | `u64` | — |  |
| `format` | `cstr` | — |  |
| `locale` | `ptr` | — |  |
| `arguments` | `bytes` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L9)

- [mq3.botlib.log.Action](Type-mq3-botlib-log-action-1925316146.md) — struct
<a id="function-function-mq3-botlib-log-close-function-close-state-src-mq3-botlib-log-ml-948319289"></a>
### close

```ml
function close(state)
```

Log_Close

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L49)

<a id="function-function-mq3-botlib-log-create-function-create-variables-serviceset-retailactive-src-mq3-botlib-log-ml-915817897"></a>
### create

```ml
function create(variables, serviceSet, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `variables` | `dynamic` | — |  |
| `serviceSet` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L21)

<a id="function-function-mq3-botlib-log-emit-function-emit-state-kind-severity-filename-text-handle-src-mq3-botlib-log-ml-1326809118"></a>
### emit

```ml
function emit(state, kind, severity, filename, text, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `severity` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L26)

<a id="function-function-mq3-botlib-log-filepointer-function-filepointer-state-src-mq3-botlib-log-ml-1734393563"></a>
### filePointer

```ml
function filePointer(state)
```

Log_FilePointer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L64)

<a id="function-function-mq3-botlib-log-floatarg-function-floatarg-value-src-mq3-botlib-log-ml-1159591809"></a>
### floatArg

```ml
function floatArg(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L24)

<a id="function-function-mq3-botlib-log-floattext-function-floattext-value-token-src-mq3-botlib-log-ml-1046230018"></a>
### floatText

```ml
function floatText(value, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L33)

<a id="function-function-mq3-botlib-log-flush-function-flush-state-src-mq3-botlib-log-ml-352483973"></a>
### flush

```ml
function flush(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L41)

<a id="function-function-mq3-botlib-log-format-function-format-fmt-args-src-mq3-botlib-log-ml-1926501048"></a>
### format

```ml
function format(fmt, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fmt` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L37)

- [mq3.botlib.log.FormatArg](Type-mq3-botlib-log-formatarg-777438073.md) — struct
<a id="function-function-mq3-botlib-log-hex32-function-hex32-value-upper-src-mq3-botlib-log-ml-1110298507"></a>
### hex32

```ml
function hex32(value, upper)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L31)

<a id="function-function-mq3-botlib-log-intarg-function-intarg-value-src-mq3-botlib-log-ml-1714268161"></a>
### intArg

```ml
function intArg(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L23)

<a id="function-function-mq3-botlib-log-logflush-function-logflush-state-src-mq3-botlib-log-ml-444937289"></a>
### logFlush

```ml
function logFlush(state)
```

Log_Flush

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L66)

<a id="constant-constant-mq3-botlib-log-max-logfilenamesize-const-max-logfilenamesize-1024-src-mq3-botlib-log-ml-2135721102"></a>
### MAX_LOGFILENAMESIZE

```ml
const MAX_LOGFILENAMESIZE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L13)

<a id="function-function-mq3-botlib-log-open-function-open-state-filename-src-mq3-botlib-log-ml-577788058"></a>
### open

```ml
function open(state, filename)
```

Log_Open

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L44)

<a id="function-function-mq3-botlib-log-pad-function-pad-value-width-left-zero-src-mq3-botlib-log-ml-1369415720"></a>
### pad

```ml
function pad(value, width, left, zero)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `zero` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L30)

<a id="function-function-mq3-botlib-log-pointerarg-function-pointerarg-value-src-mq3-botlib-log-ml-1073782909"></a>
### pointerArg

```ml
function pointerArg(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L25)

<a id="function-function-mq3-botlib-log-pointertext-function-pointertext-value-src-mq3-botlib-log-ml-1245150657"></a>
### pointerText

```ml
function pointerText(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L32)

<a id="function-function-mq3-botlib-log-printmessage-function-printmessage-state-severity-text-src-mq3-botlib-log-ml-1848976813"></a>
### printMessage

```ml
function printMessage(state, severity, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `severity` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L27)

<a id="constant-constant-mq3-botlib-log-prt-error-const-prt-error-3-src-mq3-botlib-log-ml-962023648"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L12)

<a id="constant-constant-mq3-botlib-log-prt-message-const-prt-message-2-src-mq3-botlib-log-ml-1416187459"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L11)

<a id="function-function-mq3-botlib-log-repeat-function-repeat-value-count-src-mq3-botlib-log-ml-106260198"></a>
### repeat

```ml
function repeat(value, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L29)

<a id="function-function-mq3-botlib-log-services-function-services-src-mq3-botlib-log-ml-113846666"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L20)

- [mq3.botlib.log.Services](Type-mq3-botlib-log-services-58467128.md) — struct
<a id="function-function-mq3-botlib-log-shutdown-function-shutdown-state-src-mq3-botlib-log-ml-1280662573"></a>
### shutdown

```ml
function shutdown(state)
```

Log_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L54)

- [mq3.botlib.log.State](Type-mq3-botlib-log-state-233915373.md) — struct
<a id="function-function-mq3-botlib-log-stringarg-function-stringarg-value-src-mq3-botlib-log-ml-1670325359"></a>
### stringArg

```ml
function stringArg(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L22)

<a id="function-function-mq3-botlib-log-write-function-write-state-fmt-args-src-mq3-botlib-log-ml-2132181687"></a>
### write

```ml
function write(state, fmt, args)
```

Log_Write

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fmt` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L58)

<a id="function-function-mq3-botlib-log-writetext-function-writetext-state-text-src-mq3-botlib-log-ml-125999536"></a>
### writeText

```ml
function writeText(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L55)

<a id="function-function-mq3-botlib-log-writetimestamped-function-writetimestamped-state-fmt-args-src-mq3-botlib-log-ml-459517025"></a>
### writeTimeStamped

```ml
function writeTimeStamped(state, fmt, args)
```

Log_WriteTimeStamped

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fmt` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L60)
