# `mq3.client.cl_cin_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-client-cl-cin-runtime-ml-1180130886.md)

<a id="struct-struct-mq3-client-cl-cin-runtime-state-struct-state-src-mq3-client-cl-cin-runtime-ml-1071643073"></a>
## State

```ml
struct State
```

Stores engine client cin runtime state, including `runtime`, `currentHandle`, `yuvTable`, `rllTable`, `screenDraws`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_cin_runtime.ml#L11)

## Members

<a id="field-field-mq3-client-cl-cin-runtime-state-currenthandle-currenthandle-src-mq3-client-cl-cin-runtime-ml-1426716754"></a>
### currentHandle

```ml
currentHandle
```

When constructing this record, `create` supplies `-1` for this member. Used by `CIN_PlayCinematic` and `CIN_StopCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_cin_runtime.ml#L17)

<a id="field-field-mq3-client-cl-cin-runtime-state-rlltable-rlltable-src-mq3-client-cl-cin-runtime-ml-2041762086"></a>
### rllTable

```ml
rllTable
```

When constructing this record, `create` supplies `RllSetupTable()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_cin_runtime.ml#L22)

<a id="field-field-mq3-client-cl-cin-runtime-state-runtime-runtime-src-mq3-client-cl-cin-runtime-ml-1447802218"></a>
### runtime

```ml
runtime
```

When constructing this record, `create` supplies `runtime` for this member. Used by `CIN_HandleForVideo` and `CIN_PlayCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_cin_runtime.ml#L14)

<a id="field-field-mq3-client-cl-cin-runtime-state-screendraws-screendraws-src-mq3-client-cl-cin-runtime-ml-1679862550"></a>
### screenDraws

```ml
screenDraws
```

When constructing this record, `create` supplies an empty list for this member. Used by `SCR_DrawCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_cin_runtime.ml#L25)

<a id="field-field-mq3-client-cl-cin-runtime-state-yuvtable-yuvtable-src-mq3-client-cl-cin-runtime-ml-869728330"></a>
### yuvTable

```ml
yuvTable
```

When constructing this record, `create` supplies an empty list for this member. Used by `ROQ_GenYUVTables` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_cin_runtime.ml#L20)
