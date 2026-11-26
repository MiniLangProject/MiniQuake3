# `mq3.shared.math.Plane`

[Home](README.md) · [Source file](File-src-mq3-shared-math-ml-294597397.md)

<a id="struct-struct-mq3-shared-math-plane-struct-plane-src-mq3-shared-math-ml-358230065"></a>
## Plane

```ml
struct Plane
```

Remaining code/game/q_math.c runtime surface. Arrays own the output that the C API writes through pointer arguments; mutating variants retain C behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/math.ml#L224)

## Members

<a id="field-field-mq3-shared-math-plane-dist-dist-src-mq3-shared-math-ml-1017116095"></a>
### dist

```ml
dist
```

Signed plane distance from the coordinate origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/math.ml#L228)

<a id="field-field-mq3-shared-math-plane-normal-normal-src-mq3-shared-math-ml-766890317"></a>
### normal

```ml
normal
```

Plane normal used by geometric distance and side-of-plane calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/math.ml#L226)

<a id="field-field-mq3-shared-math-plane-signbits-signbits-src-mq3-shared-math-ml-1522778493"></a>
### signbits

```ml
signbits
```

Bit mask encoding which components of the plane normal are negative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/math.ml#L232)

<a id="field-field-mq3-shared-math-plane-type-type-src-mq3-shared-math-ml-1324651711"></a>
### type

```ml
type
```

Axial/general plane classification used to accelerate plane tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/math.ml#L230)
