# `mq3.platform.win_input_runtime.Joystick`

[Home](README.md) · [Source file](File-src-mq3-platform-win-input-runtime-ml-679231699.md)

<a id="struct-struct-mq3-platform-win-input-runtime-joystick-struct-joystick-src-mq3-platform-win-input-runtime-ml-1413828979"></a>
## Joystick

```ml
struct Joystick
```

Data record for `mq3.platform.win_input_runtime.Joystick`; groups `enabled`, `available`, `buttonCount`, `axisCount`, `hasPov`, `oldButtons`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L56)

## Members

<a id="field-field-mq3-platform-win-input-runtime-joystick-available-available-src-mq3-platform-win-input-runtime-ml-1370193319"></a>
### available

```ml
available
```

Whether the requested input device is present and usable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L60)

<a id="field-field-mq3-platform-win-input-runtime-joystick-axiscount-axiscount-src-mq3-platform-win-input-runtime-ml-1023145735"></a>
### axisCount

```ml
axisCount
```

Number of axes reported by the joystick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L64)

<a id="field-field-mq3-platform-win-input-runtime-joystick-ballscale-ballscale-src-mq3-platform-win-input-runtime-ml-256863023"></a>
### ballScale

```ml
ballScale
```

Scale applied to joystick trackball movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L74)

<a id="field-field-mq3-platform-win-input-runtime-joystick-buttoncount-buttoncount-src-mq3-platform-win-input-runtime-ml-1660066975"></a>
### buttonCount

```ml
buttonCount
```

Number of buttons reported by the input device.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L62)

<a id="field-field-mq3-platform-win-input-runtime-joystick-enabled-enabled-src-mq3-platform-win-input-runtime-ml-1957278887"></a>
### enabled

```ml
enabled
```

Whether this feature is enabled by the current configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L58)

<a id="field-field-mq3-platform-win-input-runtime-joystick-haspov-haspov-src-mq3-platform-win-input-runtime-ml-169771909"></a>
### hasPov

```ml
hasPov
```

Whether the joystick provides a point-of-view hat control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L66)

<a id="field-field-mq3-platform-win-input-runtime-joystick-oldbuttons-oldbuttons-src-mq3-platform-win-input-runtime-ml-249788095"></a>
### oldButtons

```ml
oldButtons
```

Joystick button mask retained from the preceding sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L68)

<a id="field-field-mq3-platform-win-input-runtime-joystick-olddirections-olddirections-src-mq3-platform-win-input-runtime-ml-170785799"></a>
### oldDirections

```ml
oldDirections
```

Joystick or hat directions retained from the preceding sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L70)

<a id="field-field-mq3-platform-win-input-runtime-joystick-threshold-threshold-src-mq3-platform-win-input-runtime-ml-573134523"></a>
### threshold

```ml
threshold
```

Dead-zone threshold used when translating joystick axes into directions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L72)
