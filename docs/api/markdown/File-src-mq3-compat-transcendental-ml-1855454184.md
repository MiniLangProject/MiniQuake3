# `src/mq3/compat/transcendental.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.compat.transcendental`](Package-mq3-compat-transcendental-904659422.md)

Reachable from entry: **yes**

## Declarations

<a id="extern_function-extern-function-mq3-compat-transcendental-atan2-extern-function-atan2-y-as-double-x-as-double-from-ucrtbase-dll-returns-double-src-mq3-compat-transcendental-ml-888895607"></a>
### atan2

```ml
extern function atan2(y as double, x as double) from "ucrtbase.dll" returns double
```

Compute the quadrant-aware angle of the vector (x, y), in radians.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `double` | — | Y coordinate of the direction. |
| `x` | `double` | — | X coordinate of the direction. |


**Returns:** The principal angle in radians, with the quadrant determined by both arguments.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/transcendental.ml#L21)

<a id="extern_function-extern-function-mq3-compat-transcendental-cos-extern-function-cos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-compat-transcendental-ml-457032284"></a>
### cos

```ml
extern function cos(value as double) from "ucrtbase.dll" returns double
```

Compute the cosine of an angle in radians.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Angle in radians. |


**Returns:** The cosine value.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/transcendental.ml#L12)

<a id="extern_function-extern-function-mq3-compat-transcendental-sin-extern-function-sin-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-compat-transcendental-ml-1975410708"></a>
### sin

```ml
extern function sin(value as double) from "ucrtbase.dll" returns double
```

Compute the sine of an angle in radians.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Angle in radians. |


**Returns:** The sine value.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/transcendental.ml#L8)

<a id="extern_function-extern-function-mq3-compat-transcendental-sqrt-extern-function-sqrt-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-compat-transcendental-ml-1962844888"></a>
### sqrt

```ml
extern function sqrt(value as double) from "ucrtbase.dll" returns double
```

Compute a double-precision square root through the C runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point operand. |


**Returns:** The square-root result, with C-runtime domain handling for negative inputs.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/compat/transcendental.ml#L16)
