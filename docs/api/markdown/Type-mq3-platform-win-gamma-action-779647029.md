# `mq3.platform.win_gamma.Action`

[Home](README.md) · [Source file](File-src-mq3-platform-win-gamma-ml-1053734197.md)

<a id="struct-struct-mq3-platform-win-gamma-action-struct-action-src-mq3-platform-win-gamma-ml-292553823"></a>
## Action

```ml
struct Action
```

Data record for `mq3.platform.win_gamma.Action`; groups `boundary`, `kind`, `ramp`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L10)

## Members

<a id="field-field-mq3-platform-win-gamma-action-boundary-boundary-src-mq3-platform-win-gamma-ml-1401170875"></a>
### boundary

```ml
boundary
```

Host operation boundary at which this platform action is dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L12)

<a id="field-field-mq3-platform-win-gamma-action-dispatched-dispatched-src-mq3-platform-win-gamma-ml-1214069629"></a>
### dispatched

```ml
dispatched
```

Whether the recorded action was delivered to its host implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L18)

<a id="field-field-mq3-platform-win-gamma-action-kind-kind-src-mq3-platform-win-gamma-ml-1603449171"></a>
### kind

```ml
kind
```

Gamma operation selecting a Win32 or 3Dfx ramp update or restoration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L14)

<a id="field-field-mq3-platform-win-gamma-action-ramp-ramp-src-mq3-platform-win-gamma-ml-861853639"></a>
### ramp

```ml
ramp
```

Gamma-ramp samples carried by the platform action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L16)
