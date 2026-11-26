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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L14)

<a id="function-function-mq3-shared-q-shared-runtime-bigfloat-function-bigfloat-value-src-mq3-shared-q-shared-runtime-ml-1758565757"></a>
### bigFloat

```ml
function bigFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L43)

<a id="function-function-mq3-shared-q-shared-runtime-biglong-function-biglong-value-src-mq3-shared-q-shared-runtime-ml-2075835201"></a>
### bigLong

```ml
function bigLong(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L39)

<a id="function-function-mq3-shared-q-shared-runtime-biglong64-function-biglong64-value-src-mq3-shared-q-shared-runtime-ml-730695457"></a>
### bigLong64

```ml
function bigLong64(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L41)

<a id="function-function-mq3-shared-q-shared-runtime-bigshort-function-bigshort-value-src-mq3-shared-q-shared-runtime-ml-1350979465"></a>
### bigShort

```ml
function bigShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L37)

<a id="function-function-mq3-shared-q-shared-runtime-charat-function-charat-data-index-src-mq3-shared-q-shared-runtime-ml-2017878420"></a>
### charAt

```ml
function charAt(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L88)

<a id="function-function-mq3-shared-q-shared-runtime-colorat-function-colorat-data-index-src-mq3-shared-q-shared-runtime-ml-1664833844"></a>
### colorAt

```ml
function colorAt(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L99)

<a id="function-function-mq3-shared-q-shared-runtime-com-beginparsesession-function-com-beginparsesession-name-text-src-mq3-shared-q-shared-runtime-ml-430746086"></a>
### com_BeginParseSession

```ml
function com_BeginParseSession(name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L47)

<a id="function-function-mq3-shared-q-shared-runtime-com-clamp-function-com-clamp-minimum-maximum-value-src-mq3-shared-q-shared-runtime-ml-1392430465"></a>
### com_Clamp

```ml
function com_Clamp(minimum, maximum, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L18)

<a id="function-function-mq3-shared-q-shared-runtime-com-compress-function-com-compress-text-src-mq3-shared-q-shared-runtime-ml-347875813"></a>
### com_Compress

```ml
function com_Compress(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L57)

<a id="function-function-mq3-shared-q-shared-runtime-com-defaultextension-function-com-defaultextension-path-maxsize-extension-src-mq3-shared-q-shared-runtime-ml-1381815305"></a>
### com_DefaultExtension

```ml
function com_DefaultExtension(path, maxSize, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `maxSize` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L21)

<a id="function-function-mq3-shared-q-shared-runtime-com-getcurrentparseline-function-com-getcurrentparseline-session-src-mq3-shared-q-shared-runtime-ml-1989639508"></a>
### com_GetCurrentParseLine

```ml
function com_GetCurrentParseLine(session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L48)

<a id="function-function-mq3-shared-q-shared-runtime-com-matchtoken-function-com-matchtoken-session-match-src-mq3-shared-q-shared-runtime-ml-703774623"></a>
### com_MatchToken

```ml
function com_MatchToken(session, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L71)

<a id="function-function-mq3-shared-q-shared-runtime-com-parse-function-com-parse-session-src-mq3-shared-q-shared-runtime-ml-1101824586"></a>
### com_Parse

```ml
function com_Parse(session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L50)

<a id="function-function-mq3-shared-q-shared-runtime-com-parseerror-function-com-parseerror-session-message-src-mq3-shared-q-shared-runtime-ml-217153577"></a>
### com_ParseError

```ml
function com_ParseError(session, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L52)

<a id="function-function-mq3-shared-q-shared-runtime-com-parseext-function-com-parseext-session-allowlinebreaks-src-mq3-shared-q-shared-runtime-ml-1254293473"></a>
### com_ParseExt

```ml
function com_ParseExt(session, allowLineBreaks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `allowLineBreaks` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L49)

<a id="function-function-mq3-shared-q-shared-runtime-com-parseinfos-function-com-parseinfos-text-maximum-src-mq3-shared-q-shared-runtime-ml-1112421279"></a>
### com_ParseInfos

```ml
function com_ParseInfos(text, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L77)

<a id="function-function-mq3-shared-q-shared-runtime-com-parsewarning-function-com-parsewarning-session-message-src-mq3-shared-q-shared-runtime-ml-1201264829"></a>
### com_ParseWarning

```ml
function com_ParseWarning(session, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L53)

<a id="function-function-mq3-shared-q-shared-runtime-com-skippath-function-com-skippath-path-src-mq3-shared-q-shared-runtime-ml-1074159597"></a>
### com_SkipPath

```ml
function com_SkipPath(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L19)

<a id="function-function-mq3-shared-q-shared-runtime-com-sprintf-function-com-sprintf-size-format-arguments-src-mq3-shared-q-shared-runtime-ml-1114639702"></a>
### com_sprintf

```ml
function com_sprintf(size, format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L125)

<a id="function-function-mq3-shared-q-shared-runtime-com-stripextension-function-com-stripextension-path-src-mq3-shared-q-shared-runtime-ml-171928713"></a>
### com_StripExtension

```ml
function com_StripExtension(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L20)

<a id="function-function-mq3-shared-q-shared-runtime-diagnostic-function-diagnostic-session-kind-message-src-mq3-shared-q-shared-runtime-ml-1444752179"></a>
### diagnostic

```ml
function diagnostic(session, kind, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L51)

<a id="function-function-mq3-shared-q-shared-runtime-floatnoswap-function-floatnoswap-value-src-mq3-shared-q-shared-runtime-ml-1956176825"></a>
### floatNoSwap

```ml
function floatNoSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L36)

<a id="function-function-mq3-shared-q-shared-runtime-floatswap-function-floatswap-value-src-mq3-shared-q-shared-runtime-ml-657557171"></a>
### floatSwap

```ml
function floatSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L35)

<a id="function-function-mq3-shared-q-shared-runtime-formattext-function-formattext-format-arguments-src-mq3-shared-q-shared-runtime-ml-1092783821"></a>
### formatText

```ml
function formatText(format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L115)

<a id="function-function-mq3-shared-q-shared-runtime-formatunsigned-function-formatunsigned-value-src-mq3-shared-q-shared-runtime-ml-640353809"></a>
### formatUnsigned

```ml
function formatUnsigned(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L112)

<a id="function-function-mq3-shared-q-shared-runtime-formatvalue-function-formatvalue-code-value-src-mq3-shared-q-shared-runtime-ml-1690324194"></a>
### formatValue

```ml
function formatValue(code, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L114)

<a id="function-function-mq3-shared-q-shared-runtime-hextext-function-hextext-value-upper-src-mq3-shared-q-shared-runtime-ml-1189932505"></a>
### hexText

```ml
function hexText(value, upper)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L113)

<a id="function-function-mq3-shared-q-shared-runtime-info-nextpair-function-info-nextpair-text-head-src-mq3-shared-q-shared-runtime-ml-1399670055"></a>
### info_NextPair

```ml
function info_NextPair(text, head)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L129)

<a id="function-function-mq3-shared-q-shared-runtime-info-removekey-function-info-removekey-text-key-src-mq3-shared-q-shared-runtime-ml-1912484566"></a>
### info_RemoveKey

```ml
function info_RemoveKey(text, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L137)

<a id="function-function-mq3-shared-q-shared-runtime-info-removekey-big-function-info-removekey-big-text-key-src-mq3-shared-q-shared-runtime-ml-1064915386"></a>
### info_RemoveKey_Big

```ml
function info_RemoveKey_Big(text, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L138)

<a id="function-function-mq3-shared-q-shared-runtime-info-setvalueforkey-function-info-setvalueforkey-text-key-value-src-mq3-shared-q-shared-runtime-ml-1180234665"></a>
### info_SetValueForKey

```ml
function info_SetValueForKey(text, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L146)

<a id="function-function-mq3-shared-q-shared-runtime-info-setvalueforkey-big-function-info-setvalueforkey-big-text-key-value-src-mq3-shared-q-shared-runtime-ml-106544315"></a>
### info_SetValueForKey_Big

```ml
function info_SetValueForKey_Big(text, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L147)

<a id="function-function-mq3-shared-q-shared-runtime-info-validate-function-info-validate-text-src-mq3-shared-q-shared-runtime-ml-944125203"></a>
### info_Validate

```ml
function info_Validate(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L139)

<a id="function-function-mq3-shared-q-shared-runtime-info-valueforkey-function-info-valueforkey-text-key-src-mq3-shared-q-shared-runtime-ml-397515378"></a>
### info_ValueForKey

```ml
function info_ValueForKey(text, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L128)

- [mq3.shared.q_shared_runtime.InfoPair](Type-mq3-shared-q-shared-runtime-infopair-1480999945.md) — struct
<a id="function-function-mq3-shared-q-shared-runtime-inforemove-function-inforemove-text-key-capacity-src-mq3-shared-q-shared-runtime-ml-610132486"></a>
### infoRemove

```ml
function infoRemove(text, key, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L133)

<a id="function-function-mq3-shared-q-shared-runtime-infoset-function-infoset-text-key-value-capacity-src-mq3-shared-q-shared-runtime-ml-562922457"></a>
### infoSet

```ml
function infoSet(text, key, value, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L140)

<a id="function-function-mq3-shared-q-shared-runtime-littlefloat-function-littlefloat-value-src-mq3-shared-q-shared-runtime-ml-437083201"></a>
### littleFloat

```ml
function littleFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L44)

<a id="function-function-mq3-shared-q-shared-runtime-littlelong-function-littlelong-value-src-mq3-shared-q-shared-runtime-ml-1421478977"></a>
### littleLong

```ml
function littleLong(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L40)

<a id="function-function-mq3-shared-q-shared-runtime-littlelong64-function-littlelong64-value-src-mq3-shared-q-shared-runtime-ml-699743429"></a>
### littleLong64

```ml
function littleLong64(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L42)

<a id="function-function-mq3-shared-q-shared-runtime-littleshort-function-littleshort-value-src-mq3-shared-q-shared-runtime-ml-200791757"></a>
### littleShort

```ml
function littleShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L38)

<a id="function-function-mq3-shared-q-shared-runtime-long64bytes-function-long64bytes-value-src-mq3-shared-q-shared-runtime-ml-894253139"></a>
### long64Bytes

```ml
function long64Bytes(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L29)

<a id="function-function-mq3-shared-q-shared-runtime-long64noswap-function-long64noswap-value-src-mq3-shared-q-shared-runtime-ml-263791645"></a>
### long64NoSwap

```ml
function long64NoSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L34)

<a id="function-function-mq3-shared-q-shared-runtime-long64swap-function-long64swap-value-src-mq3-shared-q-shared-runtime-ml-1227627385"></a>
### long64Swap

```ml
function long64Swap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L33)

<a id="function-function-mq3-shared-q-shared-runtime-longnoswap-function-longnoswap-value-src-mq3-shared-q-shared-runtime-ml-888067857"></a>
### longNoSwap

```ml
function longNoSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L28)

<a id="function-function-mq3-shared-q-shared-runtime-longswap-function-longswap-value-src-mq3-shared-q-shared-runtime-ml-559507065"></a>
### longSwap

```ml
function longSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L27)

<a id="constant-constant-mq3-shared-q-shared-runtime-max-info-string-const-max-info-string-1024-src-mq3-shared-q-shared-runtime-ml-63577798"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L13)

<a id="constant-constant-mq3-shared-q-shared-runtime-max-token-chars-const-max-token-chars-1024-src-mq3-shared-q-shared-runtime-ml-609410814"></a>
### MAX_TOKEN_CHARS

```ml
const MAX_TOKEN_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L12)

<a id="function-function-mq3-shared-q-shared-runtime-parse1dmatrix-function-parse1dmatrix-session-x-src-mq3-shared-q-shared-runtime-ml-1861670708"></a>
### parse1DMatrix

```ml
function parse1DMatrix(session, x)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L74)

<a id="function-function-mq3-shared-q-shared-runtime-parse2dmatrix-function-parse2dmatrix-session-y-x-src-mq3-shared-q-shared-runtime-ml-916205597"></a>
### parse2DMatrix

```ml
function parse2DMatrix(session, y, x)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L75)

<a id="function-function-mq3-shared-q-shared-runtime-parse3dmatrix-function-parse3dmatrix-session-z-y-x-src-mq3-shared-q-shared-runtime-ml-1692927055"></a>
### parse3DMatrix

```ml
function parse3DMatrix(session, z, y, x)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L76)

- [mq3.shared.q_shared_runtime.ParseSession](Type-mq3-shared-q-shared-runtime-parsesession-1465678512.md) — struct
<a id="function-function-mq3-shared-q-shared-runtime-q-cleanstr-function-q-cleanstr-text-src-mq3-shared-q-shared-runtime-ml-1810049373"></a>
### q_CleanStr

```ml
function q_CleanStr(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L101)

<a id="function-function-mq3-shared-q-shared-runtime-q-isalpha-function-q-isalpha-value-src-mq3-shared-q-shared-runtime-ml-780684833"></a>
### q_isalpha

```ml
function q_isalpha(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L85)

<a id="function-function-mq3-shared-q-shared-runtime-q-islower-function-q-islower-value-src-mq3-shared-q-shared-runtime-ml-258992311"></a>
### q_islower

```ml
function q_islower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L83)

<a id="function-function-mq3-shared-q-shared-runtime-q-isprint-function-q-isprint-value-src-mq3-shared-q-shared-runtime-ml-31430019"></a>
### q_isprint

```ml
function q_isprint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L82)

<a id="function-function-mq3-shared-q-shared-runtime-q-isupper-function-q-isupper-value-src-mq3-shared-q-shared-runtime-ml-1679027129"></a>
### q_isupper

```ml
function q_isupper(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L84)

<a id="function-function-mq3-shared-q-shared-runtime-q-printstrlen-function-q-printstrlen-text-src-mq3-shared-q-shared-runtime-ml-1488369535"></a>
### q_PrintStrlen

```ml
function q_PrintStrlen(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L100)

<a id="function-function-mq3-shared-q-shared-runtime-q-strcat-function-q-strcat-destination-size-source-src-mq3-shared-q-shared-runtime-ml-1853257924"></a>
### q_strcat

```ml
function q_strcat(destination, size, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L98)

<a id="function-function-mq3-shared-q-shared-runtime-q-stricmp-function-q-stricmp-first-second-src-mq3-shared-q-shared-runtime-ml-341469726"></a>
### q_stricmp

```ml
function q_stricmp(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L95)

<a id="function-function-mq3-shared-q-shared-runtime-q-stricmpn-function-q-stricmpn-first-second-count-src-mq3-shared-q-shared-runtime-ml-1437385555"></a>
### q_stricmpn

```ml
function q_stricmpn(first, second, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L90)

<a id="function-function-mq3-shared-q-shared-runtime-q-strlwr-function-q-strlwr-text-src-mq3-shared-q-shared-runtime-ml-446240853"></a>
### q_strlwr

```ml
function q_strlwr(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L96)

<a id="function-function-mq3-shared-q-shared-runtime-q-strncmp-function-q-strncmp-first-second-count-src-mq3-shared-q-shared-runtime-ml-1037798661"></a>
### q_strncmp

```ml
function q_strncmp(first, second, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L94)

<a id="function-function-mq3-shared-q-shared-runtime-q-strncpyz-function-q-strncpyz-text-size-src-mq3-shared-q-shared-runtime-ml-1677436264"></a>
### q_strncpyz

```ml
function q_strncpyz(text, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L87)

<a id="function-function-mq3-shared-q-shared-runtime-q-strrchr-function-q-strrchr-text-value-src-mq3-shared-q-shared-runtime-ml-2031166488"></a>
### q_strrchr

```ml
function q_strrchr(text, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L86)

<a id="function-function-mq3-shared-q-shared-runtime-q-strupr-function-q-strupr-text-src-mq3-shared-q-shared-runtime-ml-623847689"></a>
### q_strupr

```ml
function q_strupr(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L97)

<a id="function-function-mq3-shared-q-shared-runtime-shortnoswap-function-shortnoswap-value-src-mq3-shared-q-shared-runtime-ml-1631140045"></a>
### shortNoSwap

```ml
function shortNoSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L26)

<a id="function-function-mq3-shared-q-shared-runtime-shortswap-function-shortswap-value-src-mq3-shared-q-shared-runtime-ml-1642147035"></a>
### shortSwap

```ml
function shortSwap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L25)

<a id="function-function-mq3-shared-q-shared-runtime-skipbracedsection-function-skipbracedsection-session-src-mq3-shared-q-shared-runtime-ml-1838925606"></a>
### skipBracedSection

```ml
function skipBracedSection(session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L72)

<a id="function-function-mq3-shared-q-shared-runtime-skiprestofline-function-skiprestofline-session-src-mq3-shared-q-shared-runtime-ml-536949716"></a>
### skipRestOfLine

```ml
function skipRestOfLine(session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L73)

<a id="function-function-mq3-shared-q-shared-runtime-skipwhitespace-function-skipwhitespace-session-src-mq3-shared-q-shared-runtime-ml-339154620"></a>
### skipWhitespace

```ml
function skipWhitespace(session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L54)

<a id="function-function-mq3-shared-q-shared-runtime-swap-init-function-swap-init-src-mq3-shared-q-shared-runtime-ml-2613382"></a>
### swap_Init

```ml
function swap_Init()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L45)

<a id="function-function-mq3-shared-q-shared-runtime-upperbyte-function-upperbyte-value-src-mq3-shared-q-shared-runtime-ml-1791526889"></a>
### upperByte

```ml
function upperByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L89)

<a id="function-function-mq3-shared-q-shared-runtime-va-function-va-format-arguments-src-mq3-shared-q-shared-runtime-ml-1286883481"></a>
### va

```ml
function va(format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L126)
