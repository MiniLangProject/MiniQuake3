# `src/mq3/platform/win_gamma.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_gamma`](Package-mq3-platform-win-gamma-333738203.md)

Reachable from entry: **no**

## Declarations

- [mq3.platform.win_gamma.Action](Type-mq3-platform-win-gamma-action-779647029.md) — struct
<a id="function-function-mq3-platform-win-gamma-blankramp-function-blankramp-src-mq3-platform-win-gamma-ml-1401503778"></a>
### blankRamp

```ml
function blankRamp()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L11)

<a id="function-function-mq3-platform-win-gamma-buildramp-function-buildramp-red-green-blue-iswin2k-src-mq3-platform-win-gamma-ml-771854445"></a>
### buildRamp

```ml
function buildRamp(red, green, blue, isWin2k)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `isWin2k` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L36)

<a id="function-function-mq3-platform-win-gamma-copyramp-function-copyramp-source-src-mq3-platform-win-gamma-ml-482879113"></a>
### copyRamp

```ml
function copyRamp(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L12)

<a id="function-function-mq3-platform-win-gamma-create-function-create-ignorehardwaregamma-drivertype-hasdc-has3dfx-iswin2k-retailactive-src-mq3-platform-win-gamma-ml-532296833"></a>
### create

```ml
function create(ignoreHardwareGamma, driverType, hasDc, has3dfx, isWin2k, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ignoreHardwareGamma` | `dynamic` | — |  |
| `driverType` | `dynamic` | — |  |
| `hasDc` | `dynamic` | — |  |
| `has3dfx` | `dynamic` | — |  |
| `isWin2k` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L13)

<a id="function-function-mq3-platform-win-gamma-emit-function-emit-state-kind-ramp-src-mq3-platform-win-gamma-ml-312823505"></a>
### emit

```ml
function emit(state, kind, ramp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `ramp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L16)

<a id="constant-constant-mq3-platform-win-gamma-gldrv-standalone-const-gldrv-standalone-1-src-mq3-platform-win-gamma-ml-400447792"></a>
### GLDRV_STANDALONE

```ml
const GLDRV_STANDALONE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L6)

<a id="function-function-mq3-platform-win-gamma-glimp-setgamma-function-glimp-setgamma-state-red-green-blue-src-mq3-platform-win-gamma-ml-119744309"></a>
### GLimp_SetGamma

```ml
function GLimp_SetGamma(state, red, green, blue)
```

GLimp_SetGamma

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L50)

<a id="function-function-mq3-platform-win-gamma-highbyte-function-highbyte-value-src-mq3-platform-win-gamma-ml-1831636735"></a>
### highByte

```ml
function highByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L14)

<a id="function-function-mq3-platform-win-gamma-mapgammamax-function-mapgammamax-src-mq3-platform-win-gamma-ml-1898501328"></a>
### mapGammaMax

```ml
function mapGammaMax()
```

mapGammaMax is disabled in the released build.  Preserve the exact initial probe ramp so the dormant diagnostic can still be compared and inspected.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L65)

- [mq3.platform.win_gamma.State](Type-mq3-platform-win-gamma-state-636485792.md) — struct
<a id="function-function-mq3-platform-win-gamma-warn-function-warn-state-text-src-mq3-platform-win-gamma-ml-128231862"></a>
### warn

```ml
function warn(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L15)

<a id="function-function-mq3-platform-win-gamma-wg-checkhardwaregamma-function-wg-checkhardwaregamma-state-querysucceeded-queriedramp-src-mq3-platform-win-gamma-ml-1628086577"></a>
### WG_CheckHardwareGamma

```ml
function WG_CheckHardwareGamma(state, querySucceeded, queriedRamp)
```

WG_CheckHardwareGamma

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `querySucceeded` | `dynamic` | — |  |
| `queriedRamp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L19)

<a id="function-function-mq3-platform-win-gamma-wg-restoregamma-function-wg-restoregamma-state-src-mq3-platform-win-gamma-ml-721729683"></a>
### WG_RestoreGamma

```ml
function WG_RestoreGamma(state)
```

WG_RestoreGamma

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_gamma.ml#L58)
