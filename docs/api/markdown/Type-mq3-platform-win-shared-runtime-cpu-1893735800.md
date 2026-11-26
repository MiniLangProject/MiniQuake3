# `mq3.platform.win_shared_runtime.Cpu`

[Home](README.md) · [Source file](File-src-mq3-platform-win-shared-runtime-ml-273587826.md)

<a id="struct-struct-mq3-platform-win-shared-runtime-cpu-struct-cpu-src-mq3-platform-win-shared-runtime-ml-251849851"></a>
## Cpu

```ml
struct Cpu
```

Data record for `mq3.platform.win_shared_runtime.Cpu`; groups `maximum`, `extendedMaximum`, `featureEDX`, `extendedFeatureEDX`, `cpuidSupported`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L22)

## Members

<a id="field-field-mq3-platform-win-shared-runtime-cpu-cpuidsupported-cpuidsupported-src-mq3-platform-win-shared-runtime-ml-2103969901"></a>
### cpuidSupported

```ml
cpuidSupported
```

Whether the processor supports the CPUID instruction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L32)

<a id="field-field-mq3-platform-win-shared-runtime-cpu-extendedfeatureedx-extendedfeatureedx-src-mq3-platform-win-shared-runtime-ml-693360907"></a>
### extendedFeatureEDX

```ml
extendedFeatureEDX
```

Processor feature flags returned in EDX by the extended CPUID query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L30)

<a id="field-field-mq3-platform-win-shared-runtime-cpu-extendedmaximum-extendedmaximum-src-mq3-platform-win-shared-runtime-ml-2134691103"></a>
### extendedMaximum

```ml
extendedMaximum
```

Highest supported extended CPUID leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L26)

<a id="field-field-mq3-platform-win-shared-runtime-cpu-featureedx-featureedx-src-mq3-platform-win-shared-runtime-ml-1866462569"></a>
### featureEDX

```ml
featureEDX
```

Processor feature flags returned in EDX by the basic CPUID query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L28)

<a id="field-field-mq3-platform-win-shared-runtime-cpu-maximum-maximum-src-mq3-platform-win-shared-runtime-ml-1735952443"></a>
### maximum

```ml
maximum
```

Highest supported basic CPUID leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_shared_runtime.ml#L24)
