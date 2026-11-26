# `src/mq3/platform/win_shared_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_shared_runtime`](Package-mq3-platform-win-shared-runtime-882847340.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `math` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.platform.win_shared_runtime.Clock](Type-mq3-platform-win-shared-runtime-clock-181084728.md) — struct
- [mq3.platform.win_shared_runtime.Cpu](Type-mq3-platform-win-shared-runtime-cpu-1893735800.md) — struct
<a id="function-function-mq3-platform-win-shared-runtime-cpuid-function-cpuid-cpu-func-src-mq3-platform-win-shared-runtime-ml-241876882"></a>
### CPUID

```ml
function CPUID(cpu, func)
```

CPUID exposes the four values win_shared consumes. Vendor text is irrelevant to the original decision after its vendor restriction was removed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — | Record providing `cpu.maximum`, `cpu.featureEDX`, `cpu.extendedMaximum`, `cpu.extendedFeatureEDX`. |
| `func` | `dynamic` | — | Input tested by `func==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L36)

<a id="constant-constant-mq3-platform-win-shared-runtime-cpuid-amd-3dnow-const-cpuid-amd-3dnow-48-src-mq3-platform-win-shared-runtime-ml-1820271321"></a>
### CPUID_AMD_3DNOW

```ml
const CPUID_AMD_3DNOW = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-shared-runtime-cpuid-generic-const-cpuid-generic-0-src-mq3-platform-win-shared-runtime-ml-1653998173"></a>
### CPUID_GENERIC

```ml
const CPUID_GENERIC = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L8)

<a id="constant-constant-mq3-platform-win-shared-runtime-cpuid-intel-katmai-const-cpuid-intel-katmai-35-src-mq3-platform-win-shared-runtime-ml-562102775"></a>
### CPUID_INTEL_KATMAI

```ml
const CPUID_INTEL_KATMAI = 35
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L12)

<a id="constant-constant-mq3-platform-win-shared-runtime-cpuid-intel-mmx-const-cpuid-intel-mmx-34-src-mq3-platform-win-shared-runtime-ml-170654072"></a>
### CPUID_INTEL_MMX

```ml
const CPUID_INTEL_MMX = 34
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-shared-runtime-cpuid-intel-pentium-const-cpuid-intel-pentium-33-src-mq3-platform-win-shared-runtime-ml-1611243559"></a>
### CPUID_INTEL_PENTIUM

```ml
const CPUID_INTEL_PENTIUM = 33
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L10)

<a id="constant-constant-mq3-platform-win-shared-runtime-cpuid-intel-unsupported-const-cpuid-intel-unsupported-32-src-mq3-platform-win-shared-runtime-ml-126975710"></a>
### CPUID_INTEL_UNSUPPORTED

```ml
const CPUID_INTEL_UNSUPPORTED = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L9)

<a id="function-function-mq3-platform-win-shared-runtime-createclock-function-createclock-src-mq3-platform-win-shared-runtime-ml-1358269056"></a>
### createClock

```ml
function createClock()
```

Constructs `mq3.platform.win_shared_runtime.Clock` with `initialized` = `false`, `timeBase` = `0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L30)

<a id="function-function-mq3-platform-win-shared-runtime-createcpu-function-createcpu-maximum-extendedmaximum-featureedx-extendedfeatureedx-cpuidsupported-src-mq3-platform-win-shared-runtime-ml-1255312377"></a>
### createCpu

```ml
function createCpu(maximum, extendedMaximum, featureEDX, extendedFeatureEDX, cpuidSupported)
```

Constructs `mq3.platform.win_shared_runtime.Cpu` from `maximum`, `extendedMaximum`, `featureEDX`, `extendedFeatureEDX`, `cpuidSupported`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maximum` | `dynamic` | — | Initial value for `mq3.platform.win_shared_runtime.Cpu.maximum`. |
| `extendedMaximum` | `dynamic` | — | Initial value for `mq3.platform.win_shared_runtime.Cpu.extendedMaximum`. |
| `featureEDX` | `dynamic` | — | Initial value for `mq3.platform.win_shared_runtime.Cpu.featureEDX`. |
| `extendedFeatureEDX` | `dynamic` | — | Initial value for `mq3.platform.win_shared_runtime.Cpu.extendedFeatureEDX`. |
| `cpuidSupported` | `dynamic` | — | Initial value for `mq3.platform.win_shared_runtime.Cpu.cpuidSupported`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L26)

<a id="function-function-mq3-platform-win-shared-runtime-fastftol-function-fastftol-value-src-mq3-platform-win-shared-runtime-ml-1323924333"></a>
### fastftol

```ml
function fastftol(value)
```

Returns `n.trunc32(vector[0])` from `mq3.platform.win_shared_runtime.fastftol`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used by `vector=[value,0.0,0.0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L80)

<a id="function-function-mq3-platform-win-shared-runtime-is3dnow-function-is3dnow-cpu-src-mq3-platform-win-shared-runtime-ml-1065058872"></a>
### Is3DNOW

```ml
function Is3DNOW(cpu)
```

Returns `(CPUID(cpu,0x80000001)[3]&(1<<31))!=0` from `mq3.platform.win_shared_runtime.Is3DNOW`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — | Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.CPUID`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L54)

<a id="function-function-mq3-platform-win-shared-runtime-iskni-function-iskni-cpu-src-mq3-platform-win-shared-runtime-ml-2143977430"></a>
### IsKNI

```ml
function IsKNI(cpu)
```

Computes `(CPUID(cpu,1)[3]&(1<<25))!=0` for `mq3.platform.win_shared_runtime.IsKNI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — | Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.CPUID`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L51)

<a id="function-function-mq3-platform-win-shared-runtime-ismmx-function-ismmx-cpu-src-mq3-platform-win-shared-runtime-ml-103230986"></a>
### IsMMX

```ml
function IsMMX(cpu)
```

Computes `(CPUID(cpu,1)[3]&(1<<23))!=0` for `mq3.platform.win_shared_runtime.IsMMX`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — | Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.CPUID`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L48)

<a id="function-function-mq3-platform-win-shared-runtime-ispentium-function-ispentium-cpu-src-mq3-platform-win-shared-runtime-ml-872722914"></a>
### IsPentium

```ml
function IsPentium(cpu)
```

Computes `cpu.cpuidSupported` for `mq3.platform.win_shared_runtime.IsPentium`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — | Record providing `cpu.cpuidSupported`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L45)

<a id="function-function-mq3-platform-win-shared-runtime-sys-defaulthomepath-function-sys-defaulthomepath-src-mq3-platform-win-shared-runtime-ml-41155898"></a>
### Sys_DefaultHomePath

```ml
function Sys_DefaultHomePath()
```

Returns `void` for the `mq3.platform.win_shared_runtime.Sys_DefaultHomePath` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L93)

<a id="function-function-mq3-platform-win-shared-runtime-sys-defaultinstallpath-function-sys-defaultinstallpath-currentworkingdirectory-src-mq3-platform-win-shared-runtime-ml-1283941711"></a>
### Sys_DefaultInstallPath

```ml
function Sys_DefaultInstallPath(currentWorkingDirectory)
```

Computes `currentWorkingDirectory` for `mq3.platform.win_shared_runtime.Sys_DefaultInstallPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `currentWorkingDirectory` | `dynamic` | — | Input used in the result expression `currentWorkingDirectory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L96)

<a id="function-function-mq3-platform-win-shared-runtime-sys-getcurrentuser-function-sys-getcurrentuser-username-src-mq3-platform-win-shared-runtime-ml-574785076"></a>
### Sys_GetCurrentUser

```ml
function Sys_GetCurrentUser(userName)
```

Returns `decode(data)` from `mq3.platform.win_shared_runtime.Sys_GetCurrentUser`; earlier branches return `"player"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `userName` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L88)

<a id="function-function-mq3-platform-win-shared-runtime-sys-getprocessorid-function-sys-getprocessorid-cpu-architecture-src-mq3-platform-win-shared-runtime-ml-926161505"></a>
### Sys_GetProcessorId

```ml
function Sys_GetProcessorId(cpu, architecture)
```

Selects the legacy Quake processor identifier from architecture and Pentium/MMX/3DNow/SSE feature checks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — | Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.IsPentium`. |
| `architecture` | `dynamic` | — | Input tested by `architecture!="x86"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L61)

<a id="function-function-mq3-platform-win-shared-runtime-sys-milliseconds-function-sys-milliseconds-clock-timegettime-src-mq3-platform-win-shared-runtime-ml-371462504"></a>
### Sys_Milliseconds

```ml
function Sys_Milliseconds(clock, timeGetTime)
```

Updates `clock.timeBase`, `clock.initialized` in `mq3.platform.win_shared_runtime.Sys_Milliseconds`; returns `n.i32(n.u32(now-clock.timeBase))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — | Mutable record or buffer; this call updates `clock.timeBase`, `clock.initialized`. |
| `timeGetTime` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.u32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L73)

<a id="function-function-mq3-platform-win-shared-runtime-sys-snapvector-function-sys-snapvector-vector-src-mq3-platform-win-shared-runtime-ml-1341064999"></a>
### Sys_SnapVector

```ml
function Sys_SnapVector(vector)
```

Returns `void` from `mq3.platform.win_shared_runtime.Sys_SnapVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.SnapVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L85)
