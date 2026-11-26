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

Format a native C argument buffer through the Universal C Runtime into the supplied bounded byte buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `options` | `u64` | — | Formatting option bits forwarded to the C runtime. |
| `output` | `bytes` | — | Writable byte buffer receiving the formatted text and terminating zero. |
| `length` | `u64` | — | Capacity of the output buffer in bytes, including space for the terminating zero. |
| `format` | `cstr` | — | C-style format string. |
| `locale` | `ptr` | — | Native C locale pointer used by formatting. |
| `arguments` | `bytes` | — | Packed native variadic-argument storage consumed by the C formatter. |


**Returns:** The native formatter result: a nonnegative character count or a negative value on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L17)

- [mq3.botlib.log.Action](Type-mq3-botlib-log-action-1925316146.md) — struct
<a id="function-function-mq3-botlib-log-close-function-close-state-src-mq3-botlib-log-ml-948319289"></a>
### close

```ml
function close(state)
```

Log_Close

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`, `filename`, `retailActive` and `services`. May update `state.handle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L171)

<a id="function-function-mq3-botlib-log-create-function-create-variables-serviceset-retailactive-src-mq3-botlib-log-ml-915817897"></a>
### create

```ml
function create(variables, serviceSet, retailActive)
```

Build the `mq3.botlib.log.State` result for `create`. Return paths include `State(variables,serviceSet,"",0,0,0.0,"",[],retailActive,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `serviceSet` | `dynamic` | — | Initial value stored in `mq3.botlib.log.State.services`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L100)

<a id="function-function-mq3-botlib-log-emit-function-emit-state-kind-severity-filename-text-handle-src-mq3-botlib-log-ml-1326809118"></a>
### emit

```ml
function emit(state, kind, severity, filename, text, handle)
```

Set `state.actions` to `state.actions+[item]` in `mq3.botlib.log.emit`. Return paths include `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.botlib.log.Action.kind`. |
| `severity` | `dynamic` | — | Initial value stored in `mq3.botlib.log.Action.severity`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L120)

<a id="function-function-mq3-botlib-log-filepointer-function-filepointer-state-src-mq3-botlib-log-ml-1734393563"></a>
### filePointer

```ml
function filePointer(state)
```

Log_FilePointer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L197)

<a id="function-function-mq3-botlib-log-floatarg-function-floatarg-value-src-mq3-botlib-log-ml-1159591809"></a>
### floatArg

```ml
function floatArg(value)
```

Create a `mq3.botlib.log.FormatArg` record, initializing `kind` as `"float"` and `real` as `numeric.f32(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L109)

<a id="function-function-mq3-botlib-log-floattext-function-floattext-value-token-src-mq3-botlib-log-ml-1046230018"></a>
### floatText

```ml
function floatText(value, token)
```

Apply `mq3.botlib.log.__stdio_common_vsprintf` while evaluating `floatText`. Return paths include `decode(slice(output,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.floatBits`. |
| `token` | `dynamic` | — | C-style format string. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L147)

<a id="function-function-mq3-botlib-log-flush-function-flush-state-src-mq3-botlib-log-ml-352483973"></a>
### flush

```ml
function flush(state)
```

Record or dispatch `"flush"` actions in `flush`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`, `flushes`, `filename`, `retailActive` and `services`. May update `state.flushes` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L160)

<a id="function-function-mq3-botlib-log-format-function-format-fmt-args-src-mq3-botlib-log-ml-1926501048"></a>
### format

```ml
function format(fmt, args)
```

Apply `mq3.botlib.log.hex32`, `mq3.botlib.log.pointerText` and `mq3.botlib.log.floatText` while evaluating `format`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fmt` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `args` | `dynamic` | — | Array or byte sequence accessed at `argAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L154)

- [mq3.botlib.log.FormatArg](Type-mq3-botlib-log-formatarg-777438073.md) — struct
<a id="function-function-mq3-botlib-log-hex32-function-hex32-value-upper-src-mq3-botlib-log-ml-1110298507"></a>
### hex32

```ml
function hex32(value, upper)
```

Format an unsigned 32-bit value in hexadecimal without leading zeroes and with the requested letter case.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.u32`. |
| `upper` | `dynamic` | — | Value used by `hex32` in `if upper then digits="0123456789ABCDEF" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L140)

<a id="function-function-mq3-botlib-log-intarg-function-intarg-value-src-mq3-botlib-log-ml-1714268161"></a>
### intArg

```ml
function intArg(value)
```

Create a `mq3.botlib.log.FormatArg` record, initializing `kind` as `"integer"` and `integer` as `numeric.i32(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L106)

<a id="function-function-mq3-botlib-log-logflush-function-logflush-state-src-mq3-botlib-log-ml-444937289"></a>
### logFlush

```ml
function logFlush(state)
```

Log_Flush

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`, `flushes`, `filename`, `retailActive` and `services`. May update `state.flushes` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L200)

<a id="constant-constant-mq3-botlib-log-max-logfilenamesize-const-max-logfilenamesize-1024-src-mq3-botlib-log-ml-2135721102"></a>
### MAX_LOGFILENAMESIZE

```ml
const MAX_LOGFILENAMESIZE = 1024
```

Maximum length of a bot-library log filename.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L24)

<a id="function-function-mq3-botlib-log-open-function-open-state-filename-src-mq3-botlib-log-ml-577788058"></a>
### open

```ml
function open(state, filename)
```

Log_Open

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `variables`, `handle`, `filename`, `retailActive` and `services` and related fields. May update `state.handle`, `state.content` and `state.filename` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L165)

<a id="function-function-mq3-botlib-log-pad-function-pad-value-width-left-zero-src-mq3-botlib-log-ml-1369415720"></a>
### pad

```ml
function pad(value, width, left, zero)
```

Apply `mq3.botlib.log.repeat` while evaluating `pad`. Return paths include `repeat(fill,missing)+value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Array or byte sequence accessed at `0`. |
| `width` | `dynamic` | — | Value used by `pad` in `missing=width-len(value)`. |
| `left` | `dynamic` | — | Value used by `pad` in `if left then return value+repeat(fill,missing) end if`. |
| `zero` | `dynamic` | — | Value used by `pad` in `if zero then fill="0" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L136)

<a id="function-function-mq3-botlib-log-pointerarg-function-pointerarg-value-src-mq3-botlib-log-ml-1073782909"></a>
### pointerArg

```ml
function pointerArg(value)
```

Create a `mq3.botlib.log.FormatArg` record, initializing `kind` as `"pointer"` and `integer` from `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Initial value stored in `mq3.botlib.log.FormatArg.integer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L112)

<a id="function-function-mq3-botlib-log-pointertext-function-pointertext-value-src-mq3-botlib-log-ml-1245150657"></a>
### pointerText

```ml
function pointerText(value)
```

Format a pointer-sized value as sixteen uppercase hexadecimal digits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `pointerText` in `while index>=0 result=result+digits[(value>>(index*4))&15]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L143)

<a id="function-function-mq3-botlib-log-printmessage-function-printmessage-state-severity-text-src-mq3-botlib-log-ml-1848976813"></a>
### printMessage

```ml
function printMessage(state, severity, text)
```

Record or dispatch `"print"` actions in `printMessage`. Return paths include `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `filename`, `handle`, `retailActive` and `services`. |
| `severity` | `dynamic` | — | Initial value stored in `mq3.botlib.log.Action.severity`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L125)

<a id="constant-constant-mq3-botlib-log-prt-error-const-prt-error-3-src-mq3-botlib-log-ml-962023648"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```

Bot-library diagnostic severity for error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L22)

<a id="constant-constant-mq3-botlib-log-prt-message-const-prt-message-2-src-mq3-botlib-log-ml-1416187459"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 2
```

Bot-library diagnostic severity for message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L20)

<a id="function-function-mq3-botlib-log-repeat-function-repeat-value-count-src-mq3-botlib-log-ml-106260198"></a>
### repeat

```ml
function repeat(value, count)
```

Repeat a formatting fragment the requested number of times, returning an empty string for a nonpositive count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `repeat` in `if count>0 then for i=1 to count result=result+value end for end if`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L130)

<a id="function-function-mq3-botlib-log-services-function-services-src-mq3-botlib-log-ml-113846666"></a>
### services

```ml
function services()
```

Create a `mq3.botlib.log.Services` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L95)

- [mq3.botlib.log.Services](Type-mq3-botlib-log-services-58467128.md) — struct
<a id="function-function-mq3-botlib-log-shutdown-function-shutdown-state-src-mq3-botlib-log-ml-1280662573"></a>
### shutdown

```ml
function shutdown(state)
```

Log_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L177)

- [mq3.botlib.log.State](Type-mq3-botlib-log-state-233915373.md) — struct
<a id="function-function-mq3-botlib-log-stringarg-function-stringarg-value-src-mq3-botlib-log-ml-1670325359"></a>
### stringArg

```ml
function stringArg(value)
```

Build the `mq3.botlib.log.FormatArg` result for `stringArg`. Return paths include `FormatArg("string",value,0,0.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Initial value stored in `mq3.botlib.log.FormatArg.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L103)

<a id="function-function-mq3-botlib-log-write-function-write-state-fmt-args-src-mq3-botlib-log-ml-2132181687"></a>
### write

```ml
function write(state, fmt, args)
```

Log_Write

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`. |
| `fmt` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `args` | `dynamic` | — | Array or byte sequence accessed at `argAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L187)

<a id="function-function-mq3-botlib-log-writetext-function-writetext-state-text-src-mq3-botlib-log-ml-125999536"></a>
### writeText

```ml
function writeText(state, text)
```

Record or dispatch `"write"` actions in `writeText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`, `content`, `filename`, `retailActive` and `services`. May update `state.content` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L181)

<a id="function-function-mq3-botlib-log-writetimestamped-function-writetimestamped-state-fmt-args-src-mq3-botlib-log-ml-459517025"></a>
### writeTimeStamped

```ml
function writeTimeStamped(state, fmt, args)
```

Log_WriteTimeStamped

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Log state; accesses `handle`, `time` and `numwrites`. May update `state.numwrites` in place. |
| `fmt` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `args` | `dynamic` | — | Array or byte sequence accessed at `argAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L192)
