# `src/mq3/compat/textnumbers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.compat.textnumbers`](Package-mq3-compat-textnumbers-535786921.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="extern_function-extern-function-mq3-compat-textnumbers-stdio-common-vsprintf-extern-function-stdio-common-vsprintf-options-as-u64-output-as-bytes-length-as-u64-format-as-cstr-locale-as-ptr-arguments-as-bytes-from-ucrtbase-dll-returns-i32-src-mq3-compat-textnumbers-ml-1443131923"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L8)

<a id="extern_function-extern-function-mq3-compat-textnumbers-stdio-common-vsscanf-extern-function-stdio-common-vsscanf-options-as-u64-text-as-cstr-length-as-u64-format-as-cstr-locale-as-ptr-arguments-as-bytes-from-ucrtbase-dll-returns-i32-src-mq3-compat-textnumbers-ml-957401832"></a>
### __stdio_common_vsscanf

```ml
extern function __stdio_common_vsscanf(options as u64, text as cstr, length as u64, format as cstr, locale as ptr, arguments as bytes) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `options` | `u64` | — |  |
| `text` | `cstr` | — |  |
| `length` | `u64` | — |  |
| `format` | `cstr` | — |  |
| `locale` | `ptr` | — |  |
| `arguments` | `bytes` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L7)

<a id="extern_function-extern-function-mq3-compat-textnumbers-atof-extern-function-atof-text-as-cstr-from-ucrtbase-dll-returns-double-src-mq3-compat-textnumbers-ml-1401813081"></a>
### atof

```ml
extern function atof(text as cstr) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L5)

<a id="function-function-mq3-compat-textnumbers-atof32-function-atof32-text-src-mq3-compat-textnumbers-ml-1100872387"></a>
### atof32

```ml
function atof32(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L9)

<a id="extern_function-extern-function-mq3-compat-textnumbers-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-compat-textnumbers-ml-1063092796"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L6)

<a id="function-function-mq3-compat-textnumbers-fixed2-function-fixed2-value-src-mq3-compat-textnumbers-ml-1079666967"></a>
### fixed2

```ml
function fixed2(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L25)

<a id="function-function-mq3-compat-textnumbers-fixed6-function-fixed6-value-src-mq3-compat-textnumbers-ml-1845776063"></a>
### fixed6

```ml
function fixed6(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L48)

<a id="function-function-mq3-compat-textnumbers-sessionintegers-function-sessionintegers-text-src-mq3-compat-textnumbers-ml-198750917"></a>
### sessionIntegers

```ml
function sessionIntegers(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L84)

<a id="function-function-mq3-compat-textnumbers-truncdouble32-function-truncdouble32-value-src-mq3-compat-textnumbers-ml-1018927311"></a>
### truncDouble32

```ml
function truncDouble32(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L12)

<a id="function-function-mq3-compat-textnumbers-vector-function-vector-text-initial-src-mq3-compat-textnumbers-ml-2049175383"></a>
### vector

```ml
function vector(text, initial)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `initial` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L70)
