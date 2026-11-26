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

Builds `rows[channel]` in `mq3.platform.win_gamma.blankRamp`; returns `rows`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L49)

<a id="function-function-mq3-platform-win-gamma-buildramp-function-buildramp-red-green-blue-iswin2k-src-mq3-platform-win-gamma-ml-771854445"></a>
### buildRamp

```ml
function buildRamp(red, green, blue, isWin2k)
```

Builds `table[channel][index]`, `table[channel][127]` in `mq3.platform.win_gamma.buildRamp`; returns `table`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — | Input used by `channels=[red,green,blue]`. |
| `green` | `dynamic` | — | Input used by `channels=[red,green,blue]`. |
| `blue` | `dynamic` | — | Input used by `channels=[red,green,blue]`. |
| `isWin2k` | `dynamic` | — | Input tested by `isWin2k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L100)

<a id="function-function-mq3-platform-win-gamma-copyramp-function-copyramp-source-src-mq3-platform-win-gamma-ml-482879113"></a>
### copyRamp

```ml
function copyRamp(source)
```

Builds `result[channel][index]` in `mq3.platform.win_gamma.copyRamp`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Nested indexed data; outer entries read at `channel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L52)

<a id="function-function-mq3-platform-win-gamma-create-function-create-ignorehardwaregamma-drivertype-hasdc-has3dfx-iswin2k-retailactive-src-mq3-platform-win-gamma-ml-532296833"></a>
### create

```ml
function create(ignoreHardwareGamma, driverType, hasDc, has3dfx, isWin2k, retailActive)
```

Constructs `mq3.platform.win_gamma.State` with `deviceSupportsGamma` = `false`, `oldRamp` = `blankRamp()`, `currentRamp` = `blankRamp()`, `actions` = `[]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ignoreHardwareGamma` | `dynamic` | — | Initial value for `mq3.platform.win_gamma.State.ignoreHardwareGamma`. |
| `driverType` | `dynamic` | — | Initial value for `mq3.platform.win_gamma.State.driverType`. |
| `hasDc` | `dynamic` | — | Initial value for `mq3.platform.win_gamma.State.hasDc`. |
| `has3dfx` | `dynamic` | — | Initial value for `mq3.platform.win_gamma.State.has3dfx`. |
| `isWin2k` | `dynamic` | — | Initial value for `mq3.platform.win_gamma.State.isWin2k`. |
| `retailActive` | `dynamic` | — | Initial value for `mq3.platform.win_gamma.State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L60)

<a id="function-function-mq3-platform-win-gamma-emit-function-emit-state-kind-ramp-src-mq3-platform-win-gamma-ml-312823505"></a>
### emit

```ml
function emit(state, kind, ramp)
```

Updates `state.actions` in `mq3.platform.win_gamma.emit`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.actions`. |
| `kind` | `dynamic` | — | Value used for `mq3.platform.win_gamma.Action.kind`. |
| `ramp` | `dynamic` | — | Value forwarded as `source` to `mq3.platform.win_gamma.copyRamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L72)

<a id="constant-constant-mq3-platform-win-gamma-gldrv-standalone-const-gldrv-standalone-1-src-mq3-platform-win-gamma-ml-400447792"></a>
### GLDRV_STANDALONE

```ml
const GLDRV_STANDALONE = 1
```

Driver category for a standalone OpenGL minidriver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L7)

<a id="function-function-mq3-platform-win-gamma-glimp-setgamma-function-glimp-setgamma-state-red-green-blue-src-mq3-platform-win-gamma-ml-119744309"></a>
### GLimp_SetGamma

```ml
function GLimp_SetGamma(state, red, green, blue)
```

GLimp_SetGamma

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.currentRamp`, `state.debug`. |
| `red` | `dynamic` | — | Value forwarded as `red` to `mq3.platform.win_gamma.buildRamp`. |
| `green` | `dynamic` | — | Value forwarded as `green` to `mq3.platform.win_gamma.buildRamp`. |
| `blue` | `dynamic` | — | Value forwarded as `blue` to `mq3.platform.win_gamma.buildRamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L118)

<a id="function-function-mq3-platform-win-gamma-highbyte-function-highbyte-value-src-mq3-platform-win-gamma-ml-1831636735"></a>
### highByte

```ml
function highByte(value)
```

Computes `(value>>8)&255` for `mq3.platform.win_gamma.highByte`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `(value>>8)&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L63)

<a id="function-function-mq3-platform-win-gamma-mapgammamax-function-mapgammamax-src-mq3-platform-win-gamma-ml-1898501328"></a>
### mapGammaMax

```ml
function mapGammaMax()
```

mapGammaMax is disabled in the released build.  Preserve the exact initial probe ramp so the dormant diagnostic can still be compared and inspected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L134)

- [mq3.platform.win_gamma.State](Type-mq3-platform-win-gamma-state-636485792.md) — struct
<a id="function-function-mq3-platform-win-gamma-warn-function-warn-state-text-src-mq3-platform-win-gamma-ml-128231862"></a>
### warn

```ml
function warn(state, text)
```

Updates `state.warnings` in `mq3.platform.win_gamma.warn`; returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.warnings`. |
| `text` | `dynamic` | — | Input used by `state.warnings=state.warnings+[text]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L67)

<a id="function-function-mq3-platform-win-gamma-wg-checkhardwaregamma-function-wg-checkhardwaregamma-state-querysucceeded-queriedramp-src-mq3-platform-win-gamma-ml-1628086577"></a>
### WG_CheckHardwareGamma

```ml
function WG_CheckHardwareGamma(state, querySucceeded, queriedRamp)
```

WG_CheckHardwareGamma

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.deviceSupportsGamma`, `state.oldRamp`, `state.oldRamp[channel][index]`. |
| `querySucceeded` | `dynamic` | — | Value assigned to `state.deviceSupportsGamma`. |
| `queriedRamp` | `dynamic` | — | Value forwarded as `source` to `mq3.platform.win_gamma.copyRamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L78)

<a id="function-function-mq3-platform-win-gamma-wg-restoregamma-function-wg-restoregamma-state-src-mq3-platform-win-gamma-ml-721729683"></a>
### WG_RestoreGamma

```ml
function WG_RestoreGamma(state)
```

WG_RestoreGamma

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.currentRamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_gamma.ml#L127)
