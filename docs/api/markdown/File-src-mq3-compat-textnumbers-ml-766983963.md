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

Format a narrow string into a bounded byte buffer using UCRT argument-list storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `options` | `u64` | — | UCRT printf option bitmask. |
| `output` | `bytes` | — | Writable narrow-character output buffer. |
| `length` | `u64` | — | Output capacity in bytes. |
| `format` | `cstr` | — | Null-terminated printf format string. |
| `locale` | `ptr` | — | Native locale pointer, or null for the current locale. |
| `arguments` | `bytes` | — | Native argument-list storage matching the format conversions. |


**Returns:** The formatted character count, or a negative value on formatting failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L30)

<a id="extern_function-extern-function-mq3-compat-textnumbers-stdio-common-vsscanf-extern-function-stdio-common-vsscanf-options-as-u64-text-as-cstr-length-as-u64-format-as-cstr-locale-as-ptr-arguments-as-bytes-from-ucrtbase-dll-returns-i32-src-mq3-compat-textnumbers-ml-957401832"></a>
### __stdio_common_vsscanf

```ml
extern function __stdio_common_vsscanf(options as u64, text as cstr, length as u64, format as cstr, locale as ptr, arguments as bytes) from "ucrtbase.dll" returns i32
```

Parse a bounded narrow string using the UCRT scanner and a prepacked native argument list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `options` | `u64` | — | UCRT scanf option bitmask. |
| `text` | `cstr` | — | Null-terminated narrow input text. |
| `length` | `u64` | — | Maximum input character count supplied to the scanner. |
| `format` | `cstr` | — | Null-terminated scanf format string. |
| `locale` | `ptr` | — | Native locale pointer, or null for the current locale. |
| `arguments` | `bytes` | — | Native argument-list storage containing destination pointers matching the format. |


**Returns:** The number of successfully assigned fields, or a negative scanner failure result.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L21)

<a id="extern_function-extern-function-mq3-compat-textnumbers-atof-extern-function-atof-text-as-cstr-from-ucrtbase-dll-returns-double-src-mq3-compat-textnumbers-ml-1401813081"></a>
### atof

```ml
extern function atof(text as cstr) from "ucrtbase.dll" returns double
```

Convert a C-string floating-point numeric prefix for compat.textnumbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | Null-terminated narrow numeric text accepted by the C runtime. |


**Returns:** The converted double; zero when no number is recognized.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L8)

<a id="function-function-mq3-compat-textnumbers-atof32-function-atof32-text-src-mq3-compat-textnumbers-ml-1100872387"></a>
### atof32

```ml
function atof32(text)
```

Return `mq3.compat.numeric.f32(atof(text))` from `compat.textnumbers.atof32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Null-terminated narrow numeric text accepted by the C runtime. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L33)

<a id="extern_function-extern-function-mq3-compat-textnumbers-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-compat-textnumbers-ml-1063092796"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Convert a C-string signed decimal integer prefix for compat.textnumbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | Null-terminated narrow numeric text accepted by the C runtime. |


**Returns:** The converted signed integer; zero when no number is recognized.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L12)

<a id="function-function-mq3-compat-textnumbers-fixed2-function-fixed2-value-src-mq3-compat-textnumbers-ml-1079666967"></a>
### fixed2

```ml
function fixed2(value)
```

Compute fixed 2 in compat.textnumbers; the normal completion returns `decode(slice(output, 0, count))`.

Validation failures include `Shader time formatting overflow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L55)

<a id="function-function-mq3-compat-textnumbers-fixed6-function-fixed6-value-src-mq3-compat-textnumbers-ml-1845776063"></a>
### fixed6

```ml
function fixed6(value)
```

Compute fixed 6 in compat.textnumbers; the normal completion returns `decode(slice(output, 0, count))`.

Validation failures include `Float formatting overflow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L82)

<a id="function-function-mq3-compat-textnumbers-sessionintegers-function-sessionintegers-text-src-mq3-compat-textnumbers-ml-198750917"></a>
### sessionIntegers

```ml
function sessionIntegers(text)
```

Compute session integers in compat.textnumbers; the normal completion returns `result`.

Validation failures include `Incomplete session data would read uninitialized C locals`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Null-terminated narrow input text. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L125)

<a id="function-function-mq3-compat-textnumbers-truncdouble32-function-truncdouble32-value-src-mq3-compat-textnumbers-ml-1018927311"></a>
### truncDouble32

```ml
function truncDouble32(value)
```

Compute trunc double 32 in compat.textnumbers; the normal completion returns `low`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < 0)` and `(0.0 - value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L38)

<a id="function-function-mq3-compat-textnumbers-vector-function-vector-text-initial-src-mq3-compat-textnumbers-ml-2049175383"></a>
### vector

```ml
function vector(text, initial)
```

Apply `mq3.compat.numeric.floatBits`, `nativeBytesPtr`, `mq3.compat.textnumbers.__stdio_common_vsscanf` for vector in compat.textnumbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Null-terminated narrow input text. |
| `initial` | `dynamic` | — | Initial used in `initial[axis]` and `n.floatBits(initial[axis])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/compat/textnumbers.ml#L107)
