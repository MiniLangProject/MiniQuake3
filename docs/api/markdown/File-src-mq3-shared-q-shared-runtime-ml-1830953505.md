# `src/mq3/shared/q_shared_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.shared.q_shared_runtime`](Package-mq3-shared-q-shared-runtime-789796161.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-shared-q-shared-runtime-big-info-string-const-big-info-string-8192-src-mq3-shared-q-shared-runtime-ml-1891490755"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```

Byte limit for an extended backslash-delimited information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L17)

<a id="function-function-mq3-shared-q-shared-runtime-bigfloat-function-bigfloat-value-src-mq3-shared-q-shared-runtime-ml-1758565757"></a>
### bigFloat

```ml
function bigFloat(value)
```

Return `mq3.shared.q_shared_runtime.floatSwap(value)` from `shared.q_shared_runtime.bigFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.floatSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L108)

<a id="function-function-mq3-shared-q-shared-runtime-biglong-function-biglong-value-src-mq3-shared-q-shared-runtime-ml-2075835201"></a>
### bigLong

```ml
function bigLong(value)
```

Return `mq3.shared.q_shared_runtime.longSwap(value)` from `shared.q_shared_runtime.bigLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.longSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L96)

<a id="function-function-mq3-shared-q-shared-runtime-biglong64-function-biglong64-value-src-mq3-shared-q-shared-runtime-ml-730695457"></a>
### bigLong64

```ml
function bigLong64(value)
```

Return `mq3.shared.q_shared_runtime.long64Swap(value)` from `shared.q_shared_runtime.bigLong64`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.long64Swap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L102)

<a id="function-function-mq3-shared-q-shared-runtime-bigshort-function-bigshort-value-src-mq3-shared-q-shared-runtime-ml-1350979465"></a>
### bigShort

```ml
function bigShort(value)
```

Return `mq3.shared.q_shared_runtime.shortSwap(value)` from `shared.q_shared_runtime.bigShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.shortSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L90)

<a id="function-function-mq3-shared-q-shared-runtime-charat-function-charat-data-index-src-mq3-shared-q-shared-runtime-ml-2017878420"></a>
### charAt

```ml
function charAt(data, index)
```

Compute char at in shared.q_shared_runtime; the normal completion returns `data[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |
| `index` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L223)

<a id="function-function-mq3-shared-q-shared-runtime-colorat-function-colorat-data-index-src-mq3-shared-q-shared-runtime-ml-1664833844"></a>
### colorAt

```ml
function colorAt(data, index)
```

Compute shared.q_shared_runtime.colorAt as `(((((index + 1) < len(data)) and (data[index] == 94)) and (data[(index + 1)] != 94)) and (data[(index + 1)] != 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |
| `index` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L260)

<a id="function-function-mq3-shared-q-shared-runtime-com-beginparsesession-function-com-beginparsesession-name-text-src-mq3-shared-q-shared-runtime-ml-430746086"></a>
### com_BeginParseSession

```ml
function com_BeginParseSession(name, text)
```

Create `mq3.shared.q_shared_runtime.ParseSession` with name=name; state=parser.create(text); diagnostics=[].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.shared.q_shared_runtime.ParseSession` record. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.parser.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L118)

<a id="function-function-mq3-shared-q-shared-runtime-com-clamp-function-com-clamp-minimum-maximum-value-src-mq3-shared-q-shared-runtime-ml-1392430465"></a>
### com_Clamp

```ml
function com_Clamp(minimum, maximum, value)
```

Clamp q shared runtime in shared.q_shared_runtime; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | `dynamic` | — | Minimum used in `(value < minimum)`. |
| `maximum` | `dynamic` | — | Maximum used in `(value > maximum)`. |
| `value` | `dynamic` | — | Value used in `(value < minimum)` and `(value > maximum)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L41)

<a id="function-function-mq3-shared-q-shared-runtime-com-compress-function-com-compress-text-src-mq3-shared-q-shared-runtime-ml-347875813"></a>
### com_Compress

```ml
function com_Compress(text)
```

Compress q shared runtime in shared.q_shared_runtime; the normal completion returns `decode(bytes(output))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L151)

<a id="function-function-mq3-shared-q-shared-runtime-com-defaultextension-function-com-defaultextension-path-maxsize-extension-src-mq3-shared-q-shared-runtime-ml-1381815305"></a>
### com_DefaultExtension

```ml
function com_DefaultExtension(path, maxSize, extension)
```

Compute default extension in shared.q_shared_runtime; the normal completion returns `com_sprintf(maxSize, "%s%s", [path, extension])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.q_strncpyz`. |
| `maxSize` | `dynamic` | — | Size passed as `size` to `mq3.shared.q_shared_runtime.q_strncpyz`. |
| `extension` | `dynamic` | — | Extension used in `com_sprintf(maxSize, "%s%s", [path, extension])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L52)

<a id="function-function-mq3-shared-q-shared-runtime-com-getcurrentparseline-function-com-getcurrentparseline-session-src-mq3-shared-q-shared-runtime-ml-1989639508"></a>
### com_GetCurrentParseLine

```ml
function com_GetCurrentParseLine(session)
```

Get current parse line in shared.q_shared_runtime; the normal completion returns `session.state.line`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Record exposing `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L121)

<a id="function-function-mq3-shared-q-shared-runtime-com-matchtoken-function-com-matchtoken-session-match-src-mq3-shared-q-shared-runtime-ml-703774623"></a>
### com_MatchToken

```ml
function com_MatchToken(session, match)
```

Compute match token in shared.q_shared_runtime; the normal completion returns `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.com_Parse`. |
| `match` | `dynamic` | — | Match used in `(token != match)` and `((("MatchToken: " + token) + " != ") + match)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L168)

<a id="function-function-mq3-shared-q-shared-runtime-com-parse-function-com-parse-session-src-mq3-shared-q-shared-runtime-ml-1101824586"></a>
### com_Parse

```ml
function com_Parse(session)
```

Return `mq3.shared.q_shared_runtime.com_ParseExt(session, true)` from `shared.q_shared_runtime.com_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.com_ParseExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L128)

<a id="function-function-mq3-shared-q-shared-runtime-com-parseerror-function-com-parseerror-session-message-src-mq3-shared-q-shared-runtime-ml-217153577"></a>
### com_ParseError

```ml
function com_ParseError(session, message)
```

Return `mq3.shared.q_shared_runtime.diagnostic(session, "ERROR", message)` from `shared.q_shared_runtime.com_ParseError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.diagnostic`. |
| `message` | `dynamic` | — | Message passed as `message` to `mq3.shared.q_shared_runtime.diagnostic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L139)

<a id="function-function-mq3-shared-q-shared-runtime-com-parseext-function-com-parseext-session-allowlinebreaks-src-mq3-shared-q-shared-runtime-ml-1254293473"></a>
### com_ParseExt

```ml
function com_ParseExt(session, allowLineBreaks)
```

Return `mq3.shared.parser.parseExt(session.state, allowLineBreaks)` from `shared.q_shared_runtime.com_ParseExt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Record exposing `state`. |
| `allowLineBreaks` | `dynamic` | — | Allow line breaks passed as `allowLineBreaks` to `mq3.shared.parser.parseExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L125)

<a id="function-function-mq3-shared-q-shared-runtime-com-parseinfos-function-com-parseinfos-text-maximum-src-mq3-shared-q-shared-runtime-ml-1112421279"></a>
### com_ParseInfos

```ml
function com_ParseInfos(text, maximum)
```

Parse infos in shared.q_shared_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.com_BeginParseSession`. |
| `maximum` | `dynamic` | — | Maximum used in `(len(result) < maximum)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L193)

<a id="function-function-mq3-shared-q-shared-runtime-com-parsewarning-function-com-parsewarning-session-message-src-mq3-shared-q-shared-runtime-ml-1201264829"></a>
### com_ParseWarning

```ml
function com_ParseWarning(session, message)
```

Return `mq3.shared.q_shared_runtime.diagnostic(session, "WARNING", message)` from `shared.q_shared_runtime.com_ParseWarning`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.diagnostic`. |
| `message` | `dynamic` | — | Message passed as `message` to `mq3.shared.q_shared_runtime.diagnostic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L143)

<a id="function-function-mq3-shared-q-shared-runtime-com-skippath-function-com-skippath-path-src-mq3-shared-q-shared-runtime-ml-1074159597"></a>
### com_SkipPath

```ml
function com_SkipPath(path)
```

Compute skip path in shared.q_shared_runtime; the normal completion returns `decode(slice(data, start, (len(data) - start)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path used in `bytes(path)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L44)

<a id="function-function-mq3-shared-q-shared-runtime-com-sprintf-function-com-sprintf-size-format-arguments-src-mq3-shared-q-shared-runtime-ml-1114639702"></a>
### com_sprintf

```ml
function com_sprintf(size, format, arguments)
```

Compute sprintf in shared.q_shared_runtime; the normal completion returns `q_strncpyz(value, size)`.

Validation failures include `Com_sprintf bigbuffer overflow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.shared.q_shared_runtime.q_strncpyz`. |
| `format` | `dynamic` | — | Format passed as `format` to `mq3.shared.q_shared_runtime.formatText`. |
| `arguments` | `dynamic` | — | Arguments passed as `arguments` to `mq3.shared.q_shared_runtime.formatText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L309)

<a id="function-function-mq3-shared-q-shared-runtime-com-stripextension-function-com-stripextension-path-src-mq3-shared-q-shared-runtime-ml-171928713"></a>
### com_StripExtension

```ml
function com_StripExtension(path)
```

Compute strip extension in shared.q_shared_runtime; the normal completion returns `decode(slice(data, 0, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path used in `bytes(path)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L47)

<a id="function-function-mq3-shared-q-shared-runtime-diagnostic-function-diagnostic-session-kind-message-src-mq3-shared-q-shared-runtime-ml-1444752179"></a>
### diagnostic

```ml
function diagnostic(session, kind, message)
```

Update `session.diagnostics` in shared.q_shared_runtime; the normal completion returns `text`.

Direct state writes: `session.diagnostics`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Record exposing `name`, `diagnostics`. Updated in place: `diagnostics`. |
| `kind` | `dynamic` | — | Kind used in `(kind + ": ")` and `((kind + ": ") + session.name)`. |
| `message` | `dynamic` | — | Message operand used by `diagnostic`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L135)

<a id="function-function-mq3-shared-q-shared-runtime-floatnoswap-function-floatnoswap-value-src-mq3-shared-q-shared-runtime-ml-1956176825"></a>
### floatNoSwap

```ml
function floatNoSwap(value)
```

Return `mq3.compat.numeric.f32(value)` from `shared.q_shared_runtime.floatNoSwap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L87)

<a id="function-function-mq3-shared-q-shared-runtime-floatswap-function-floatswap-value-src-mq3-shared-q-shared-runtime-ml-657557171"></a>
### floatSwap

```ml
function floatSwap(value)
```

Return `mq3.compat.numeric.bitsFloat(n.u32(longSwap(n.floatBits(value))))` from `shared.q_shared_runtime.floatSwap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L84)

<a id="function-function-mq3-shared-q-shared-runtime-formattext-function-formattext-format-arguments-src-mq3-shared-q-shared-runtime-ml-1092783821"></a>
### formatText

```ml
function formatText(format, arguments)
```

Compute format text in shared.q_shared_runtime; the normal completion returns `result`.

Validation failures include `missing format argument`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — | Format used in `bytes(format)` and `error(7674, "missing format argument")`. |
| `arguments` | `dynamic` | — | Arguments used in `len(arguments)` and `arguments[argument]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L293)

<a id="function-function-mq3-shared-q-shared-runtime-formatunsigned-function-formatunsigned-value-src-mq3-shared-q-shared-runtime-ml-640353809"></a>
### formatUnsigned

```ml
function formatUnsigned(value)
```

Compute format unsigned in shared.q_shared_runtime; the normal completion returns `str(n.u32(value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L279)

<a id="function-function-mq3-shared-q-shared-runtime-formatvalue-function-formatvalue-code-value-src-mq3-shared-q-shared-runtime-ml-1690324194"></a>
### formatValue

```ml
function formatValue(code, value)
```

Compute format value in shared.q_shared_runtime; the normal completion returns `("%" + code)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Code used in `("%" + code)` and `(code == "s")`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.formatUnsigned`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L287)

<a id="function-function-mq3-shared-q-shared-runtime-hextext-function-hextext-value-upper-src-mq3-shared-q-shared-runtime-ml-1189932505"></a>
### hexText

```ml
function hexText(value, upper)
```

Compute hex text in shared.q_shared_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |
| `upper` | `dynamic` | — | Upper operand used by `hexText`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L283)

<a id="function-function-mq3-shared-q-shared-runtime-info-nextpair-function-info-nextpair-text-head-src-mq3-shared-q-shared-runtime-ml-1399670055"></a>
### info_NextPair

```ml
function info_NextPair(text, head)
```

Compute info next pair in shared.q_shared_runtime; the normal completion returns `InfoPair(index, key, decode(slice(data, valueStart, (index - valueStart))))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |
| `head` | `dynamic` | — | Head operand used by `info_NextPair`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L324)

<a id="function-function-mq3-shared-q-shared-runtime-info-removekey-function-info-removekey-text-key-src-mq3-shared-q-shared-runtime-ml-1912484566"></a>
### info_RemoveKey

```ml
function info_RemoveKey(text, key)
```

Return `mq3.shared.q_shared_runtime.infoRemove(text, key, MAX_INFO_STRING)` from `shared.q_shared_runtime.info_RemoveKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.infoRemove`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.shared.q_shared_runtime.infoRemove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L341)

<a id="function-function-mq3-shared-q-shared-runtime-info-removekey-big-function-info-removekey-big-text-key-src-mq3-shared-q-shared-runtime-ml-1064915386"></a>
### info_RemoveKey_Big

```ml
function info_RemoveKey_Big(text, key)
```

Return `mq3.shared.q_shared_runtime.infoRemove(text, key, BIG_INFO_STRING)` from `shared.q_shared_runtime.info_RemoveKey_Big`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.infoRemove`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.shared.q_shared_runtime.infoRemove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L345)

<a id="function-function-mq3-shared-q-shared-runtime-info-setvalueforkey-function-info-setvalueforkey-text-key-value-src-mq3-shared-q-shared-runtime-ml-1180234665"></a>
### info_SetValueForKey

```ml
function info_SetValueForKey(text, key, value)
```

Return `mq3.shared.q_shared_runtime.infoSet(text, key, value, MAX_INFO_STRING)` from `shared.q_shared_runtime.info_SetValueForKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.infoSet`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.shared.q_shared_runtime.infoSet`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.infoSet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L366)

<a id="function-function-mq3-shared-q-shared-runtime-info-setvalueforkey-big-function-info-setvalueforkey-big-text-key-value-src-mq3-shared-q-shared-runtime-ml-106544315"></a>
### info_SetValueForKey_Big

```ml
function info_SetValueForKey_Big(text, key, value)
```

Return `mq3.shared.q_shared_runtime.infoSet(text, key, value, BIG_INFO_STRING)` from `shared.q_shared_runtime.info_SetValueForKey_Big`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.infoSet`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.shared.q_shared_runtime.infoSet`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.infoSet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L371)

<a id="function-function-mq3-shared-q-shared-runtime-info-validate-function-info-validate-text-src-mq3-shared-q-shared-runtime-ml-944125203"></a>
### info_Validate

```ml
function info_Validate(text)
```

Return `mq3.shared.info.valid(text)` from `shared.q_shared_runtime.info_Validate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Info passed as `info` to `mq3.shared.info.valid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L348)

<a id="function-function-mq3-shared-q-shared-runtime-info-valueforkey-function-info-valueforkey-text-key-src-mq3-shared-q-shared-runtime-ml-397515378"></a>
### info_ValueForKey

```ml
function info_ValueForKey(text, key)
```

Return `mq3.shared.info.value(text, key)` from `shared.q_shared_runtime.info_ValueForKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Info passed as `info` to `mq3.shared.info.value`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.shared.info.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L320)

- [mq3.shared.q_shared_runtime.InfoPair](Type-mq3-shared-q-shared-runtime-infopair-1480999945.md) — struct
<a id="function-function-mq3-shared-q-shared-runtime-inforemove-function-inforemove-text-key-capacity-src-mq3-shared-q-shared-runtime-ml-610132486"></a>
### infoRemove

```ml
function infoRemove(text, key, capacity)
```

Compute info remove in shared.q_shared_runtime; the normal completion returns `text`.

Validation failures include `Info_RemoveKey oversize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `len(bytes(text))`. |
| `key` | `dynamic` | — | Key used in `(found == key)` and `strings.indexOf(key, "\\\\", 0)`. |
| `capacity` | `dynamic` | — | Capacity used in `(len(bytes(text)) >= capacity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L334)

<a id="function-function-mq3-shared-q-shared-runtime-infoset-function-infoset-text-key-value-capacity-src-mq3-shared-q-shared-runtime-ml-562922457"></a>
### infoSet

```ml
function infoSet(text, key, value, capacity)
```

Compute info set in shared.q_shared_runtime; the normal completion returns `(pair + remaining)`.

Validation failures include `Info_SetValueForKey oversize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.infoRemove`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.shared.q_shared_runtime.infoRemove`. |
| `value` | `dynamic` | — | Value used in `(value == "")` and `(value == void)`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.shared.q_shared_runtime.infoRemove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L356)

<a id="function-function-mq3-shared-q-shared-runtime-littlefloat-function-littlefloat-value-src-mq3-shared-q-shared-runtime-ml-437083201"></a>
### littleFloat

```ml
function littleFloat(value)
```

Return `mq3.shared.q_shared_runtime.floatNoSwap(value)` from `shared.q_shared_runtime.littleFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.floatNoSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L111)

<a id="function-function-mq3-shared-q-shared-runtime-littlelong-function-littlelong-value-src-mq3-shared-q-shared-runtime-ml-1421478977"></a>
### littleLong

```ml
function littleLong(value)
```

Return `mq3.shared.q_shared_runtime.longNoSwap(value)` from `shared.q_shared_runtime.littleLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.longNoSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L99)

<a id="function-function-mq3-shared-q-shared-runtime-littlelong64-function-littlelong64-value-src-mq3-shared-q-shared-runtime-ml-699743429"></a>
### littleLong64

```ml
function littleLong64(value)
```

Return `mq3.shared.q_shared_runtime.long64NoSwap(value)` from `shared.q_shared_runtime.littleLong64`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.long64NoSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L105)

<a id="function-function-mq3-shared-q-shared-runtime-littleshort-function-littleshort-value-src-mq3-shared-q-shared-runtime-ml-200791757"></a>
### littleShort

```ml
function littleShort(value)
```

Return `mq3.shared.q_shared_runtime.shortNoSwap(value)` from `shared.q_shared_runtime.littleShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.shortNoSwap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L93)

<a id="function-function-mq3-shared-q-shared-runtime-long64bytes-function-long64bytes-value-src-mq3-shared-q-shared-runtime-ml-894253139"></a>
### long64Bytes

```ml
function long64Bytes(value)
```

Compute long64 bytes in shared.q_shared_runtime; the normal completion returns `output`.

Validation failures include `qint64 requires eight bytes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `len(value)` and `typeof(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L72)

<a id="function-function-mq3-shared-q-shared-runtime-long64noswap-function-long64noswap-value-src-mq3-shared-q-shared-runtime-ml-263791645"></a>
### long64NoSwap

```ml
function long64NoSwap(value)
```

Compute long64 no swap in shared.q_shared_runtime; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.long64Bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L81)

<a id="function-function-mq3-shared-q-shared-runtime-long64swap-function-long64swap-value-src-mq3-shared-q-shared-runtime-ml-1227627385"></a>
### long64Swap

```ml
function long64Swap(value)
```

Compute long64 swap in shared.q_shared_runtime; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.long64Bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L78)

<a id="function-function-mq3-shared-q-shared-runtime-longnoswap-function-longnoswap-value-src-mq3-shared-q-shared-runtime-ml-888067857"></a>
### longNoSwap

```ml
function longNoSwap(value)
```

Return `mq3.compat.numeric.i32(value)` from `shared.q_shared_runtime.longNoSwap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L67)

<a id="function-function-mq3-shared-q-shared-runtime-longswap-function-longswap-value-src-mq3-shared-q-shared-runtime-ml-559507065"></a>
### longSwap

```ml
function longSwap(value)
```

Compute long swap in shared.q_shared_runtime; the normal completion returns `n.i32((((((value & 255) << 24) | ((value & 65280) << 8)) | ((value >> 8) & 65280)) | ((value >> 24) & 255)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L64)

<a id="constant-constant-mq3-shared-q-shared-runtime-max-info-string-const-max-info-string-1024-src-mq3-shared-q-shared-runtime-ml-63577798"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```

Byte limit for a normal backslash-delimited information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L15)

<a id="constant-constant-mq3-shared-q-shared-runtime-max-token-chars-const-max-token-chars-1024-src-mq3-shared-q-shared-runtime-ml-609410814"></a>
### MAX_TOKEN_CHARS

```ml
const MAX_TOKEN_CHARS = 1024
```

Maximum character-buffer size for one parsed token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L13)

<a id="function-function-mq3-shared-q-shared-runtime-parse1dmatrix-function-parse1dmatrix-session-x-src-mq3-shared-q-shared-runtime-ml-1861670708"></a>
### parse1DMatrix

```ml
function parse1DMatrix(session, x)
```

Compute parse1 d matrix in shared.q_shared_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.com_MatchToken`. |
| `x` | `dynamic` | — | X used in `(x - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L178)

<a id="function-function-mq3-shared-q-shared-runtime-parse2dmatrix-function-parse2dmatrix-session-y-x-src-mq3-shared-q-shared-runtime-ml-916205597"></a>
### parse2DMatrix

```ml
function parse2DMatrix(session, y, x)
```

Compute parse2 d matrix in shared.q_shared_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.com_MatchToken`. |
| `y` | `dynamic` | — | Y used in `(y - 1)`. |
| `x` | `dynamic` | — | X passed as `x` to `mq3.shared.q_shared_runtime.parse1DMatrix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L183)

<a id="function-function-mq3-shared-q-shared-runtime-parse3dmatrix-function-parse3dmatrix-session-z-y-x-src-mq3-shared-q-shared-runtime-ml-1692927055"></a>
### parse3DMatrix

```ml
function parse3DMatrix(session, z, y, x)
```

Compute parse3 d matrix in shared.q_shared_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session passed as `session` to `mq3.shared.q_shared_runtime.com_MatchToken`. |
| `z` | `dynamic` | — | Z used in `(z - 1)`. |
| `y` | `dynamic` | — | Y passed as `y` to `mq3.shared.q_shared_runtime.parse2DMatrix`. |
| `x` | `dynamic` | — | X passed as `x` to `mq3.shared.q_shared_runtime.parse2DMatrix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L189)

- [mq3.shared.q_shared_runtime.ParseSession](Type-mq3-shared-q-shared-runtime-parsesession-1465678512.md) — struct
<a id="function-function-mq3-shared-q-shared-runtime-q-cleanstr-function-q-cleanstr-text-src-mq3-shared-q-shared-runtime-ml-1810049373"></a>
### q_CleanStr

```ml
function q_CleanStr(text)
```

Compute clean str in shared.q_shared_runtime; the normal completion returns `decode(bytes(output))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L266)

<a id="function-function-mq3-shared-q-shared-runtime-q-isalpha-function-q-isalpha-value-src-mq3-shared-q-shared-runtime-ml-780684833"></a>
### q_isalpha

```ml
function q_isalpha(value)
```

Compute shared.q_shared_runtime.q_isalpha as `(q_islower(value) or q_isupper(value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.q_islower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L209)

<a id="function-function-mq3-shared-q-shared-runtime-q-islower-function-q-islower-value-src-mq3-shared-q-shared-runtime-ml-258992311"></a>
### q_islower

```ml
function q_islower(value)
```

Compute shared.q_shared_runtime.q_islower as `((value >= 97) and (value <= 122))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >= 97)` and `(value <= 122)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L203)

<a id="function-function-mq3-shared-q-shared-runtime-q-isprint-function-q-isprint-value-src-mq3-shared-q-shared-runtime-ml-31430019"></a>
### q_isprint

```ml
function q_isprint(value)
```

Compute shared.q_shared_runtime.q_isprint as `((value >= 32) and (value <= 126))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >= 32)` and `(value <= 126)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L200)

<a id="function-function-mq3-shared-q-shared-runtime-q-isupper-function-q-isupper-value-src-mq3-shared-q-shared-runtime-ml-1679027129"></a>
### q_isupper

```ml
function q_isupper(value)
```

Compute shared.q_shared_runtime.q_isupper as `((value >= 65) and (value <= 90))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >= 65)` and `(value <= 90)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L206)

<a id="function-function-mq3-shared-q-shared-runtime-q-printstrlen-function-q-printstrlen-text-src-mq3-shared-q-shared-runtime-ml-1488369535"></a>
### q_PrintStrlen

```ml
function q_PrintStrlen(text)
```

Compute print strlen in shared.q_shared_runtime; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L263)

<a id="function-function-mq3-shared-q-shared-runtime-q-strcat-function-q-strcat-destination-size-source-src-mq3-shared-q-shared-runtime-ml-1853257924"></a>
### q_strcat

```ml
function q_strcat(destination, size, source)
```

Compute strcat in shared.q_shared_runtime; the normal completion returns `(destination + q_strncpyz(source, (size - len(bytes(destination)))))`.

Validation failures include `Q_strcat already overflowed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Destination used in `bytes(destination)` and `len(bytes(destination))`. |
| `size` | `dynamic` | — | Size used in `(size - len(bytes(destination)))` and `(len(bytes(destination)) >= size)`. |
| `source` | `dynamic` | — | Text passed as `text` to `mq3.shared.q_shared_runtime.q_strncpyz`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L256)

<a id="function-function-mq3-shared-q-shared-runtime-q-stricmp-function-q-stricmp-first-second-src-mq3-shared-q-shared-runtime-ml-341469726"></a>
### q_stricmp

```ml
function q_stricmp(first, second)
```

Compute stricmp in shared.q_shared_runtime; the normal completion returns `q_stricmpn(first, second, 99999)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First passed as `first` to `mq3.shared.q_shared_runtime.q_stricmpn`. |
| `second` | `dynamic` | — | Second passed as `second` to `mq3.shared.q_shared_runtime.q_stricmpn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L243)

<a id="function-function-mq3-shared-q-shared-runtime-q-stricmpn-function-q-stricmpn-first-second-count-src-mq3-shared-q-shared-runtime-ml-1437385555"></a>
### q_stricmpn

```ml
function q_stricmpn(first, second, count)
```

Apply `mq3.shared.q_shared_runtime.charAt`, `mq3.shared.q_shared_runtime.upperByte` for stricmpn in shared.q_shared_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First used in `bytes(first)` and `(first == void)`. |
| `second` | `dynamic` | — | Second used in `bytes(second)` and `(second == void)`. |
| `count` | `dynamic` | — | Count operand used by `q_stricmpn`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L231)

<a id="function-function-mq3-shared-q-shared-runtime-q-strlwr-function-q-strlwr-text-src-mq3-shared-q-shared-runtime-ml-446240853"></a>
### q_strlwr

```ml
function q_strlwr(text)
```

Compute strlwr in shared.q_shared_runtime; the normal completion returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L246)

<a id="function-function-mq3-shared-q-shared-runtime-q-strncmp-function-q-strncmp-first-second-count-src-mq3-shared-q-shared-runtime-ml-1037798661"></a>
### q_strncmp

```ml
function q_strncmp(first, second, count)
```

Apply `mq3.shared.q_shared_runtime.charAt` for strncmp in shared.q_shared_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First used in `bytes(first)`. |
| `second` | `dynamic` | — | Second used in `bytes(second)`. |
| `count` | `dynamic` | — | Count operand used by `q_strncmp`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L239)

<a id="function-function-mq3-shared-q-shared-runtime-q-strncpyz-function-q-strncpyz-text-size-src-mq3-shared-q-shared-runtime-ml-1677436264"></a>
### q_strncpyz

```ml
function q_strncpyz(text, size)
```

Compute strncpyz in shared.q_shared_runtime; the normal completion returns `decode(data)`.

Validation failures include `Q_strncpyz invalid argument`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |
| `size` | `dynamic` | — | Size used in `(size < 1)` and `(size - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L219)

<a id="function-function-mq3-shared-q-shared-runtime-q-strrchr-function-q-strrchr-text-value-src-mq3-shared-q-shared-runtime-ml-2031166488"></a>
### q_strrchr

```ml
function q_strrchr(text, value)
```

Compute strrchr in shared.q_shared_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |
| `value` | `dynamic` | — | Value used in `(value & 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L213)

<a id="function-function-mq3-shared-q-shared-runtime-q-strupr-function-q-strupr-text-src-mq3-shared-q-shared-runtime-ml-623847689"></a>
### q_strupr

```ml
function q_strupr(text)
```

Compute strupr in shared.q_shared_runtime; the normal completion returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L249)

<a id="function-function-mq3-shared-q-shared-runtime-shortnoswap-function-shortnoswap-value-src-mq3-shared-q-shared-runtime-ml-1631140045"></a>
### shortNoSwap

```ml
function shortNoSwap(value)
```

Return `mq3.compat.numeric.i16(value)` from `shared.q_shared_runtime.shortNoSwap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 16 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L61)

<a id="function-function-mq3-shared-q-shared-runtime-shortswap-function-shortswap-value-src-mq3-shared-q-shared-runtime-ml-1642147035"></a>
### shortSwap

```ml
function shortSwap(value)
```

Compute short swap in shared.q_shared_runtime; the normal completion returns `n.i16((((value & 255) << 8) | ((value >> 8) & 255)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >> 8)` and `(value & 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L58)

<a id="function-function-mq3-shared-q-shared-runtime-skipbracedsection-function-skipbracedsection-session-src-mq3-shared-q-shared-runtime-ml-1838925606"></a>
### skipBracedSection

```ml
function skipBracedSection(session)
```

Compute skip braced section in shared.q_shared_runtime; the normal completion returns `depth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Record exposing `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L171)

<a id="function-function-mq3-shared-q-shared-runtime-skiprestofline-function-skiprestofline-session-src-mq3-shared-q-shared-runtime-ml-536949716"></a>
### skipRestOfLine

```ml
function skipRestOfLine(session)
```

Compute skip rest of line in shared.q_shared_runtime; the normal completion returns `state.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Record exposing `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L174)

<a id="function-function-mq3-shared-q-shared-runtime-skipwhitespace-function-skipwhitespace-session-src-mq3-shared-q-shared-runtime-ml-339154620"></a>
### skipWhitespace

```ml
function skipWhitespace(session)
```

Compute skip whitespace in shared.q_shared_runtime; the normal completion returns `newLines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Record exposing `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L146)

<a id="function-function-mq3-shared-q-shared-runtime-swap-init-function-swap-init-src-mq3-shared-q-shared-runtime-ml-2613382"></a>
### swap_Init

```ml
function swap_Init()
```

Compute shared.q_shared_runtime.swap_Init as `"little"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L113)

<a id="function-function-mq3-shared-q-shared-runtime-upperbyte-function-upperbyte-value-src-mq3-shared-q-shared-runtime-ml-1791526889"></a>
### upperByte

```ml
function upperByte(value)
```

Compute upper byte in shared.q_shared_runtime; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value - 32)` and `(value >= 97)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L226)

<a id="function-function-mq3-shared-q-shared-runtime-va-function-va-format-arguments-src-mq3-shared-q-shared-runtime-ml-1286883481"></a>
### va

```ml
function va(format, arguments)
```

Compute va in shared.q_shared_runtime; the normal completion returns `value`.

Validation failures include `va buffer overflow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — | Format passed as `format` to `mq3.shared.q_shared_runtime.formatText`. |
| `arguments` | `dynamic` | — | Arguments passed as `arguments` to `mq3.shared.q_shared_runtime.formatText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L315)
