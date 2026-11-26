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
| `cpu` | `dynamic` | — |  |
| `func` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L25)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L21)

<a id="function-function-mq3-platform-win-shared-runtime-createcpu-function-createcpu-maximum-extendedmaximum-featureedx-extendedfeatureedx-cpuidsupported-src-mq3-platform-win-shared-runtime-ml-1255312377"></a>
### createCpu

```ml
function createCpu(maximum, extendedMaximum, featureEDX, extendedFeatureEDX, cpuidSupported)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maximum` | `dynamic` | — |  |
| `extendedMaximum` | `dynamic` | — |  |
| `featureEDX` | `dynamic` | — |  |
| `extendedFeatureEDX` | `dynamic` | — |  |
| `cpuidSupported` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L18)

<a id="function-function-mq3-platform-win-shared-runtime-fastftol-function-fastftol-value-src-mq3-platform-win-shared-runtime-ml-1323924333"></a>
### fastftol

```ml
function fastftol(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L53)

<a id="function-function-mq3-platform-win-shared-runtime-is3dnow-function-is3dnow-cpu-src-mq3-platform-win-shared-runtime-ml-1065058872"></a>
### Is3DNOW

```ml
function Is3DNOW(cpu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L35)

<a id="function-function-mq3-platform-win-shared-runtime-iskni-function-iskni-cpu-src-mq3-platform-win-shared-runtime-ml-2143977430"></a>
### IsKNI

```ml
function IsKNI(cpu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L34)

<a id="function-function-mq3-platform-win-shared-runtime-ismmx-function-ismmx-cpu-src-mq3-platform-win-shared-runtime-ml-103230986"></a>
### IsMMX

```ml
function IsMMX(cpu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L33)

<a id="function-function-mq3-platform-win-shared-runtime-ispentium-function-ispentium-cpu-src-mq3-platform-win-shared-runtime-ml-872722914"></a>
### IsPentium

```ml
function IsPentium(cpu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L32)

<a id="function-function-mq3-platform-win-shared-runtime-sys-defaulthomepath-function-sys-defaulthomepath-src-mq3-platform-win-shared-runtime-ml-41155898"></a>
### Sys_DefaultHomePath

```ml
function Sys_DefaultHomePath()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L61)

<a id="function-function-mq3-platform-win-shared-runtime-sys-defaultinstallpath-function-sys-defaultinstallpath-currentworkingdirectory-src-mq3-platform-win-shared-runtime-ml-1283941711"></a>
### Sys_DefaultInstallPath

```ml
function Sys_DefaultInstallPath(currentWorkingDirectory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `currentWorkingDirectory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L62)

<a id="function-function-mq3-platform-win-shared-runtime-sys-getcurrentuser-function-sys-getcurrentuser-username-src-mq3-platform-win-shared-runtime-ml-574785076"></a>
### Sys_GetCurrentUser

```ml
function Sys_GetCurrentUser(userName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `userName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L57)

<a id="function-function-mq3-platform-win-shared-runtime-sys-getprocessorid-function-sys-getprocessorid-cpu-architecture-src-mq3-platform-win-shared-runtime-ml-926161505"></a>
### Sys_GetProcessorId

```ml
function Sys_GetProcessorId(cpu, architecture)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cpu` | `dynamic` | — |  |
| `architecture` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L39)

<a id="function-function-mq3-platform-win-shared-runtime-sys-milliseconds-function-sys-milliseconds-clock-timegettime-src-mq3-platform-win-shared-runtime-ml-371462504"></a>
### Sys_Milliseconds

```ml
function Sys_Milliseconds(clock, timeGetTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clock` | `dynamic` | — |  |
| `timeGetTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L48)

<a id="function-function-mq3-platform-win-shared-runtime-sys-snapvector-function-sys-snapvector-vector-src-mq3-platform-win-shared-runtime-ml-1341064999"></a>
### Sys_SnapVector

```ml
function Sys_SnapVector(vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L56)
