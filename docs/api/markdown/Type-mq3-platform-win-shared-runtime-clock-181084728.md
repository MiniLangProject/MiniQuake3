# `mq3.platform.win_shared_runtime.Clock`

[Home](README.md) · [Source file](File-src-mq3-platform-win-shared-runtime-ml-273587826.md)

<a id="struct-struct-mq3-platform-win-shared-runtime-clock-struct-clock-src-mq3-platform-win-shared-runtime-ml-2122780227"></a>
## Clock

```ml
struct Clock
```

Data record for `mq3.platform.win_shared_runtime.Clock`; groups `initialized`, `timeBase`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_shared_runtime.ml#L35)

## Members

<a id="field-field-mq3-platform-win-shared-runtime-clock-initialized-initialized-src-mq3-platform-win-shared-runtime-ml-1965996863"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_shared_runtime.ml#L37)

<a id="field-field-mq3-platform-win-shared-runtime-clock-timebase-timebase-src-mq3-platform-win-shared-runtime-ml-764798779"></a>
### timeBase

```ml
timeBase
```

Clock origin subtracted to produce elapsed platform milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_shared_runtime.ml#L39)
