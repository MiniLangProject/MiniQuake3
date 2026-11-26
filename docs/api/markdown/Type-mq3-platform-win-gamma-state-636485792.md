# `mq3.platform.win_gamma.State`

[Home](README.md) · [Source file](File-src-mq3-platform-win-gamma-ml-1053734197.md)

<a id="struct-struct-mq3-platform-win-gamma-state-struct-state-src-mq3-platform-win-gamma-ml-406471219"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.win_gamma.State`; groups `deviceSupportsGamma`, `ignoreHardwareGamma`, `driverType`, `hasDc`, `has3dfx`, `isWin2k`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L21)

## Members

<a id="field-field-mq3-platform-win-gamma-state-actions-actions-src-mq3-platform-win-gamma-ml-1158133634"></a>
### actions

```ml
actions
```

Platform operations recorded for dispatch or inspection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L39)

<a id="field-field-mq3-platform-win-gamma-state-currentramp-currentramp-src-mq3-platform-win-gamma-ml-978567302"></a>
### currentRamp

```ml
currentRamp
```

Gamma ramp currently selected by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L37)

<a id="field-field-mq3-platform-win-gamma-state-debug-debug-src-mq3-platform-win-gamma-ml-639872738"></a>
### debug

```ml
debug
```

Debug messages recorded while processing platform actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L43)

<a id="field-field-mq3-platform-win-gamma-state-devicesupportsgamma-devicesupportsgamma-src-mq3-platform-win-gamma-ml-210377354"></a>
### deviceSupportsGamma

```ml
deviceSupportsGamma
```

Whether the display supports hardware gamma-ramp updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L23)

<a id="field-field-mq3-platform-win-gamma-state-drivertype-drivertype-src-mq3-platform-win-gamma-ml-1942680830"></a>
### driverType

```ml
driverType
```

Graphics-driver integration category used by platform compatibility handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L27)

<a id="field-field-mq3-platform-win-gamma-state-has3dfx-has3dfx-src-mq3-platform-win-gamma-ml-1825336746"></a>
### has3dfx

```ml
has3dfx
```

Whether the graphics driver uses the legacy 3Dfx path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L31)

<a id="field-field-mq3-platform-win-gamma-state-hasdc-hasdc-src-mq3-platform-win-gamma-ml-2015472086"></a>
### hasDc

```ml
hasDc
```

Whether a valid display device context is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L29)

<a id="field-field-mq3-platform-win-gamma-state-ignorehardwaregamma-ignorehardwaregamma-src-mq3-platform-win-gamma-ml-237732730"></a>
### ignoreHardwareGamma

```ml
ignoreHardwareGamma
```

Whether hardware gamma-ramp updates are disabled by configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L25)

<a id="field-field-mq3-platform-win-gamma-state-iswin2k-iswin2k-src-mq3-platform-win-gamma-ml-1112219986"></a>
### isWin2k

```ml
isWin2k
```

Whether the detected Windows version uses the Windows 2000 gamma restrictions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L33)

<a id="field-field-mq3-platform-win-gamma-state-oldramp-oldramp-src-mq3-platform-win-gamma-ml-1124491426"></a>
### oldRamp

```ml
oldRamp
```

Original display gamma ramp saved for restoration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L35)

<a id="field-field-mq3-platform-win-gamma-state-retailactive-retailactive-src-mq3-platform-win-gamma-ml-1493893972"></a>
### retailActive

```ml
retailActive
```

Whether the real platform backend is active for action dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L45)

<a id="field-field-mq3-platform-win-gamma-state-warnings-warnings-src-mq3-platform-win-gamma-ml-1529421216"></a>
### warnings

```ml
warnings
```

Nonfatal diagnostics retained by the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L41)
