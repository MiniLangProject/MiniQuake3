# `mq3.splines.headers.Bounds`

[Home](README.md) · [Source file](File-src-mq3-splines-headers-ml-550180384.md)

<a id="struct-struct-mq3-splines-headers-bounds-struct-bounds-src-mq3-splines-headers-ml-191138499"></a>
## Bounds

```ml
struct Bounds
```

Bounds record for splines.headers, containing `mins`, `maxs`, `cleared`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L52)

## Members

<a id="field-field-mq3-splines-headers-bounds-cleared-cleared-src-mq3-splines-headers-ml-998124584"></a>
### cleared

```ml
cleared
```

Nonzero when the bounds are empty and the next added point must initialize them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L58)

<a id="field-field-mq3-splines-headers-bounds-maxs-maxs-src-mq3-splines-headers-ml-1927518258"></a>
### maxs

```ml
maxs
```

Upper XYZ corner of the accumulated spline bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L56)

<a id="field-field-mq3-splines-headers-bounds-mins-mins-src-mq3-splines-headers-ml-1718615862"></a>
### mins

```ml
mins
```

Lower XYZ corner of the accumulated spline bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L54)
