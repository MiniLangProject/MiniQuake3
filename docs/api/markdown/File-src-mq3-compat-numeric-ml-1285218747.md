# `src/mq3/compat/numeric.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.compat.numeric`](Package-mq3-compat-numeric-420900857.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-compat-numeric-add32-function-add32-a-as-int-b-as-int-returns-int-src-mq3-compat-numeric-ml-1614174425"></a>
### add32

```ml
function add32(a as int, b as int) returns int
```

Compute the sum with signed 32-bit wraparound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `int` | — | Left integer operand; only its low 32 bits participate. |
| `b` | `int` | — | Right integer operand; only its low 32 bits participate. |


**Returns:** The signed 32-bit sum.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L90)

<a id="function-function-mq3-compat-numeric-addbits-function-addbits-a-b-src-mq3-compat-numeric-ml-128044929"></a>
### addBits

```ml
function addBits(a, b)
```

Add bits in compat.numeric; the normal completion returns `packFloat(sign, result, (power - 3))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |
| `b` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L336)

<a id="function-function-mq3-compat-numeric-bitsfloat-inline-function-bitsfloat-value-returns-float-src-mq3-compat-numeric-ml-84583969"></a>
### bitsFloat

```ml
inline function bitsFloat(value) returns float
```

Decode an IEEE-754 binary32 bit pattern through the MiniLang numeric facade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |


**Returns:** The encoded binary32 value widened to the declared floating-point type.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L150)

<a id="function-function-mq3-compat-numeric-divbits-function-divbits-a-b-src-mq3-compat-numeric-ml-1918849153"></a>
### divBits

```ml
function divBits(a, b)
```

Compute div bits in compat.numeric; the normal completion returns `packFloat(sign, result, ((ea - eb) - 28))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |
| `b` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L409)

<a id="function-function-mq3-compat-numeric-dot3-function-dot3-ax-ay-az-bx-by-bz-returns-float-src-mq3-compat-numeric-ml-978491790"></a>
### dot3

```ml
function dot3(ax, ay, az, bx, by, bz) returns float
```

Compute a three-component dot product with separate binary32 products and left-to-right additions in the numeric facade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ax` | `dynamic` | — | X component of the left vector. |
| `ay` | `dynamic` | — | Y component of the left vector. |
| `az` | `dynamic` | — | Z component of the left vector. |
| `bx` | `dynamic` | — | X component of the right vector. |
| `by` | `dynamic` | — | Y component of the right vector. |
| `bz` | `dynamic` | — | Z component of the right vector. |


**Returns:** The separately rounded binary32 dot product.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L195)

<a id="function-function-mq3-compat-numeric-exponent-function-exponent-bits-src-mq3-compat-numeric-ml-119393466"></a>
### exponent

```ml
function exponent(bits)
```

Compute exponent in compat.numeric; the normal completion returns `(value - 150)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — | Bits used in `(bits >> 23)` and `((bits >> 23) & 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L269)

<a id="function-function-mq3-compat-numeric-f32-function-f32-value-returns-float-src-mq3-compat-numeric-ml-50800476"></a>
### f32

```ml
function f32(value) returns float
```

Round a floating-point value to IEEE-754 binary32 through the native SSE boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow to binary32. |


**Returns:** The rounded binary32 value, widened to the declared floating-point return type.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L134)

<a id="function-function-mq3-compat-numeric-fadd-inline-function-fadd-a-b-returns-float-src-mq3-compat-numeric-ml-1511952267"></a>
### fadd

```ml
inline function fadd(a, b) returns float
```

Compute the binary32 sum through the controlled-rounding native ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left floating-point operand. |
| `b` | `dynamic` | — | Right floating-point operand. |


**Returns:** The binary32 sum, widened to a MiniLang float.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L158)

<a id="function-function-mq3-compat-numeric-fdiv-function-fdiv-a-b-returns-float-src-mq3-compat-numeric-ml-1069362746"></a>
### fdiv

```ml
function fdiv(a, b) returns float
```

Compute the binary32 quotient through the controlled-rounding native ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left floating-point operand. |
| `b` | `dynamic` | — | Right floating-point operand. |


**Returns:** The binary32 quotient, widened to a MiniLang float.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L203)

<a id="function-function-mq3-compat-numeric-floatbits-inline-function-floatbits-value-returns-int-src-mq3-compat-numeric-ml-1527303266"></a>
### floatBits

```ml
inline function floatBits(value) returns int
```

Expose the binary32 representation of a floating-point value through the MiniLang numeric facade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


**Returns:** The unsigned 32-bit IEEE-754 bit pattern.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L143)

<a id="function-function-mq3-compat-numeric-fmul-inline-function-fmul-a-b-returns-float-src-mq3-compat-numeric-ml-1727347409"></a>
### fmul

```ml
inline function fmul(a, b) returns float
```

Compute the binary32 product through the controlled-rounding native ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left floating-point operand. |
| `b` | `dynamic` | — | Right floating-point operand. |


**Returns:** The binary32 product, widened to a MiniLang float.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L183)

<a id="function-function-mq3-compat-numeric-fneg-function-fneg-value-returns-float-src-mq3-compat-numeric-ml-1788435838"></a>
### fneg

```ml
function fneg(value) returns float
```

Negate a binary32 value by toggling its sign bit, preserving signed zero and NaN payload bits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value whose binary32 sign is toggled. |


**Returns:** The binary32 value with bit 31 inverted.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L217)

<a id="function-function-mq3-compat-numeric-fsqrt-function-fsqrt-value-returns-float-src-mq3-compat-numeric-ml-850296950"></a>
### fsqrt

```ml
function fsqrt(value) returns float
```

Compute the binary32 square root through the controlled native numeric boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point radicand. |


**Returns:** The binary32 square-root result widened to a MiniLang float.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L210)

<a id="function-function-mq3-compat-numeric-fsub-inline-function-fsub-a-b-returns-float-src-mq3-compat-numeric-ml-1754441521"></a>
### fsub

```ml
inline function fsub(a, b) returns float
```

Compute the binary32 difference through the controlled-rounding native ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left floating-point operand. |
| `b` | `dynamic` | — | Right floating-point operand. |


**Returns:** The binary32 difference, widened to a MiniLang float.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L166)

<a id="function-function-mq3-compat-numeric-i16-function-i16-value-as-int-returns-int-src-mq3-compat-numeric-ml-915248514"></a>
### i16

```ml
function i16(value as int) returns int
```

Interpret the low 16 bits as a signed integer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `int` | — | Integer whose low 16 bits are retained. |


**Returns:** The signed 16-bit value, represented as a MiniLang integer.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L71)

<a id="function-function-mq3-compat-numeric-i32-inline-function-i32-value-as-int-returns-int-src-mq3-compat-numeric-ml-1242513899"></a>
### i32

```ml
inline function i32(value as int) returns int
```

Interpret the low 32 bits as a signed integer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `int` | — | Integer whose low 32 bits are retained. |


**Returns:** The signed 32-bit value, represented as a MiniLang integer.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L62)

<a id="function-function-mq3-compat-numeric-i8-function-i8-value-as-int-returns-int-src-mq3-compat-numeric-ml-44760694"></a>
### i8

```ml
function i8(value as int) returns int
```

Interpret the low 8 bits as a signed integer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `int` | — | Integer whose low 8 bits are retained. |


**Returns:** The signed 8-bit value, represented as a MiniLang integer.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L80)

<a id="function-function-mq3-compat-numeric-isnanbits-inline-function-isnanbits-value-as-int-returns-bool-src-mq3-compat-numeric-ml-387624950"></a>
### isNaNBits

```ml
inline function isNaNBits(value as int) returns bool
```

Recognize IEEE-754 binary32 NaN encodings from the exponent and mantissa bits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `int` | — | Unsigned 32-bit binary32 encoding. |


**Returns:** True for a NaN bit pattern; false for finite values and infinities.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L329)

<a id="function-function-mq3-compat-numeric-jam-function-jam-value-shift-src-mq3-compat-numeric-ml-1337836023"></a>
### jam

```ml
function jam(value, shift)
```

Compute jam in compat.numeric; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value == 0)` and `(value >> shift)`. |
| `shift` | `dynamic` | — | Shift used in `(shift <= 0)` and `(1 << shift)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L278)

<a id="function-function-mq3-compat-numeric-mantissa-function-mantissa-bits-src-mq3-compat-numeric-ml-1070147254"></a>
### mantissa

```ml
function mantissa(bits)
```

Compute mantissa in compat.numeric; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — | Bits used in `(bits & 8388607)` and `(bits & 2139095040)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L261)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-bits-float-extern-function-mq3-bits-float-value-as-u32-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-1152099730"></a>
### mq3_bits_float

```ml
extern function mq3_bits_float(value as u32) from "miniquake3_abi.dll" returns double
```

Decode an IEEE-754 binary32 bit pattern through the native ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `u32` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |


**Returns:** The encoded binary32 value widened to the declared floating-point type.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L17)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-dot3-extern-function-mq3-dot3-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-1500050510"></a>
### mq3_dot3

```ml
extern function mq3_dot3(ax as double, ay as double, az as double, bx as double, by as double, bz as double) from "miniquake3_abi.dll" returns double
```

Compute a three-component dot product with separate binary32 products and left-to-right additions in one native rounding scope.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ax` | `double` | — | X component of the left vector. |
| `ay` | `double` | — | Y component of the left vector. |
| `az` | `double` | — | Z component of the left vector. |
| `bx` | `double` | — | X component of the right vector. |
| `by` | `double` | — | Y component of the right vector. |
| `bz` | `double` | — | Z component of the right vector. |


**Returns:** The separately rounded binary32 dot product.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L46)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-f32-extern-function-mq3-f32-value-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-431069333"></a>
### mq3_f32

```ml
extern function mq3_f32(value as double) from "miniquake3_abi.dll" returns double
```

Round a floating-point value to IEEE-754 binary32 through a saved and restored SSE rounding environment.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point value to narrow to binary32. |


**Returns:** The rounded binary32 value, widened to the declared floating-point return type.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L9)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-fadd-extern-function-mq3-fadd-a-as-double-b-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-1908597462"></a>
### mq3_fadd

```ml
extern function mq3_fadd(a as double, b as double) from "miniquake3_abi.dll" returns double
```

Compute the binary32 sum while saving and restoring the host SSE control state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `double` | — | Left double argument, narrowed to binary32 before arithmetic. |
| `b` | `double` | — | Right double argument, narrowed to binary32 before arithmetic. |


**Returns:** The binary32 sum, widened to double; NaNs follow left-to-right operand selection.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L22)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-fdiv-extern-function-mq3-fdiv-a-as-double-b-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-65874490"></a>
### mq3_fdiv

```ml
extern function mq3_fdiv(a as double, b as double) from "miniquake3_abi.dll" returns double
```

Compute the binary32 quotient while saving and restoring the host SSE control state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `double` | — | Left double argument, narrowed to binary32 before arithmetic. |
| `b` | `double` | — | Right double argument, narrowed to binary32 before arithmetic. |


**Returns:** The binary32 quotient, widened to double; NaNs follow left-to-right operand selection.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L37)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-float-bits-extern-function-mq3-float-bits-value-as-double-from-miniquake3-abi-dll-returns-u32-src-mq3-compat-numeric-ml-1713572452"></a>
### mq3_float_bits

```ml
extern function mq3_float_bits(value as double) from "miniquake3_abi.dll" returns u32
```

Expose the binary32 representation of a floating-point value through the native ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point value to narrow and reinterpret. |


**Returns:** The unsigned 32-bit IEEE-754 bit pattern.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L13)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-fmul-extern-function-mq3-fmul-a-as-double-b-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-685655624"></a>
### mq3_fmul

```ml
extern function mq3_fmul(a as double, b as double) from "miniquake3_abi.dll" returns double
```

Compute the binary32 product while saving and restoring the host SSE control state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `double` | — | Left double argument, narrowed to binary32 before arithmetic. |
| `b` | `double` | — | Right double argument, narrowed to binary32 before arithmetic. |


**Returns:** The binary32 product, widened to double; NaNs follow left-to-right operand selection.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L32)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-fsqrt-extern-function-mq3-fsqrt-value-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-38913125"></a>
### mq3_fsqrt

```ml
extern function mq3_fsqrt(value as double) from "miniquake3_abi.dll" returns double
```

Take a binary32 square root while preserving the host SSE control state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point radicand, narrowed to binary32. |


**Returns:** The binary32 square root widened to double, including IEEE-754 NaN propagation.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L50)

<a id="extern_function-extern-function-mq3-compat-numeric-mq3-fsub-extern-function-mq3-fsub-a-as-double-b-as-double-from-miniquake3-abi-dll-returns-double-src-mq3-compat-numeric-ml-1881110056"></a>
### mq3_fsub

```ml
extern function mq3_fsub(a as double, b as double) from "miniquake3_abi.dll" returns double
```

Compute the binary32 difference while saving and restoring the host SSE control state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `double` | — | Left double argument, narrowed to binary32 before arithmetic. |
| `b` | `double` | — | Right double argument, narrowed to binary32 before arithmetic. |


**Returns:** The binary32 difference, widened to double; NaNs follow left-to-right operand selection.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L27)

<a id="function-function-mq3-compat-numeric-mul32-function-mul32-a-as-int-b-as-int-returns-int-src-mq3-compat-numeric-ml-1360046207"></a>
### mul32

```ml
function mul32(a as int, b as int) returns int
```

Compute the product with signed 32-bit wraparound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `int` | — | Left integer operand; only its low 32 bits participate. |
| `b` | `int` | — | Right integer operand; only its low 32 bits participate. |


**Returns:** The signed 32-bit product.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L98)

<a id="function-function-mq3-compat-numeric-mulbits-function-mulbits-a-b-src-mq3-compat-numeric-ml-703990999"></a>
### mulBits

```ml
function mulBits(a, b)
```

Compute mul bits in compat.numeric; the normal completion returns `packFloat(sign, (mantissa(a) * mantissa(b)), (exponent(a) + exponent(b)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |
| `b` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L367)

<a id="function-function-mq3-compat-numeric-packfloat-function-packfloat-sign-significand-power-src-mq3-compat-numeric-ml-38213243"></a>
### packFloat

```ml
function packFloat(sign, significand, power)
```

Round an exact integer significand times 2^power to binary32 (nearest-even).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sign` | `dynamic` | — | Sign used in `(sign \| 2139095040)` and `(sign \| significand)`. |
| `significand` | `dynamic` | — | Significand used in `(significand & 1)` and `(significand + 1)`. |
| `power` | `dynamic` | — | Power used in `(power + high)` and `(target - power)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L294)

<a id="function-function-mq3-compat-numeric-quotient-function-quotient-a-b-src-mq3-compat-numeric-ml-1337281667"></a>
### quotient

```ml
function quotient(a, b)
```

Compute quotient in compat.numeric; the normal completion returns `result`.

Validation failures include `integer divide by zero`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `(a >> 1)` and `(shifted <= (a >> 1))`. |
| `b` | `dynamic` | — | B used in `(b == 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L385)

<a id="function-function-mq3-compat-numeric-readi32-inline-function-readi32-data-offset-as-int-src-mq3-compat-numeric-ml-701295519"></a>
### readI32

```ml
inline function readI32(data, offset as int)
```

Read i 32 in compat.numeric; the normal completion returns `i32(readU32(data, offset))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readU32`. |
| `offset` | `int` | — | Offset passed as `offset` to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L449)

<a id="function-function-mq3-compat-numeric-readu32-function-readu32-data-offset-as-int-src-mq3-compat-numeric-ml-2038765784"></a>
### readU32

```ml
function readU32(data, offset as int)
```

Read u 32 in compat.numeric; the normal completion returns `(((data[offset] | (data[(offset + 1)] << 8)) | (data[(offset + 2)] << 16)) | (data[(offset + 3)] << 24))`.

Validation failures include `readU32 out of range`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `int` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L441)

<a id="function-function-mq3-compat-numeric-sar32-function-sar32-a-as-int-b-as-int-returns-int-src-mq3-compat-numeric-ml-1992573103"></a>
### sar32

```ml
function sar32(a as int, b as int) returns int
```

Apply a 32-bit arithmetic right shift with the shift count masked to five bits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `int` | — | Integer bit pattern to shift. |
| `b` | `int` | — | Shift distance; the implementation uses b & 31. |


**Returns:** The shifted 32-bit result.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L127)

<a id="function-function-mq3-compat-numeric-shl32-function-shl32-a-as-int-b-as-int-returns-int-src-mq3-compat-numeric-ml-28240201"></a>
### shl32

```ml
function shl32(a as int, b as int) returns int
```

Apply a 32-bit left shift with the shift count masked to five bits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `int` | — | Integer bit pattern to shift. |
| `b` | `int` | — | Shift distance; the implementation uses b & 31. |


**Returns:** The shifted 32-bit result.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L111)

<a id="function-function-mq3-compat-numeric-shr32-function-shr32-a-as-int-b-as-int-returns-int-src-mq3-compat-numeric-ml-113964033"></a>
### shr32

```ml
function shr32(a as int, b as int) returns int
```

Apply a 32-bit logical right shift with the shift count masked to five bits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `int` | — | Integer bit pattern to shift. |
| `b` | `int` | — | Shift distance; the implementation uses b & 31. |


**Returns:** The shifted 32-bit result.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L119)

<a id="function-function-mq3-compat-numeric-sqrtbits-function-sqrtbits-value-src-mq3-compat-numeric-ml-1668291363"></a>
### sqrtBits

```ml
function sqrtBits(value)
```

Compute sqrt bits in compat.numeric; the normal completion returns `packFloat(0, low, ((power - 23) >> 1))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L236)

<a id="function-function-mq3-compat-numeric-subbits-function-subbits-a-b-src-mq3-compat-numeric-ml-1610695063"></a>
### subBits

```ml
function subBits(a, b)
```

Compute sub bits in compat.numeric; the normal completion returns `addBits(a, (b ^ 2147483648))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |
| `b` | `dynamic` | — | Unsigned 32-bit binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L172)

<a id="function-function-mq3-compat-numeric-trunc32-function-trunc32-value-src-mq3-compat-numeric-ml-144812385"></a>
### trunc32

```ml
function trunc32(value)
```

Truncate binary32 toward zero, matching the x86 integer sentinel for NaN or out-of-range input.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to convert to signed 32-bit integer semantics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L223)

<a id="function-function-mq3-compat-numeric-u32-function-u32-value-as-int-returns-int-src-mq3-compat-numeric-ml-1299631906"></a>
### u32

```ml
function u32(value as int) returns int
```

Interpret the low 32 bits as an unsigned integer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `int` | — | Integer whose low 32 bits are retained. |


**Returns:** The unsigned 32-bit value, represented as a MiniLang integer.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L55)

<a id="function-function-mq3-compat-numeric-writeu32-function-writeu32-data-offset-as-int-value-as-int-src-mq3-compat-numeric-ml-1014296534"></a>
### writeU32

```ml
function writeU32(data, offset as int, value as int)
```

Write u 32 in compat.numeric; the normal completion returns `true`.

Validation failures include `writeU32 out of range`.
Direct state writes: `data elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable sequence written at `offset`, `(offset + 1)`, `(offset + 2)`. |
| `offset` | `int` | — | Offset used in `(offset < 0)` and `(offset + 4)`. |
| `value` | `int` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/numeric.ml#L460)
