# `mq3.platform.win_snd.State`

[Home](README.md) · [Source file](File-src-mq3-platform-win-snd-ml-1865364643.md)

<a id="struct-struct-mq3-platform-win-snd-state-struct-state-src-mq3-platform-win-snd-ml-755673275"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.win_snd.State`; groups `dsoundInit`, `sample16`, `sndBufSize`, `lockSize`, `hasDS`, `hasDSBuf`, and 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L46)

## Members

<a id="field-field-mq3-platform-win-snd-state-actions-actions-src-mq3-platform-win-snd-ml-1720670270"></a>
### actions

```ml
actions
```

Platform operations recorded for dispatch or inspection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L74)

<a id="field-field-mq3-platform-win-snd-state-bufferlocked-bufferlocked-src-mq3-platform-win-snd-ml-881774002"></a>
### bufferLocked

```ml
bufferLocked
```

Whether the sound buffer is currently locked for writes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L70)

<a id="field-field-mq3-platform-win-snd-state-bufferlost-bufferlost-src-mq3-platform-win-snd-ml-57925470"></a>
### bufferLost

```ml
bufferLost
```

Whether DirectSound reported that the sound buffer must be restored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L68)

<a id="field-field-mq3-platform-win-snd-state-coinitialized-coinitialized-src-mq3-platform-win-snd-ml-1379928850"></a>
### coInitialized

```ml
coInitialized
```

Whether COM initialization was performed by the sound backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L64)

<a id="field-field-mq3-platform-win-snd-state-dllloaded-dllloaded-src-mq3-platform-win-snd-ml-919868966"></a>
### dllLoaded

```ml
dllLoaded
```

Whether the DirectSound library has loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L62)

<a id="field-field-mq3-platform-win-snd-state-dma-dma-src-mq3-platform-win-snd-ml-549249146"></a>
### dma

```ml
dma
```

Audio DMA format and buffer information exposed to the mixer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L72)

<a id="field-field-mq3-platform-win-snd-state-dsoundinit-dsoundinit-src-mq3-platform-win-snd-ml-1884032244"></a>
### dsoundInit

```ml
dsoundInit
```

Whether DirectSound initialization has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L48)

<a id="field-field-mq3-platform-win-snd-state-errors-errors-src-mq3-platform-win-snd-ml-1190597144"></a>
### errors

```ml
errors
```

Errors recorded by this subsystem or its host callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L78)

<a id="field-field-mq3-platform-win-snd-state-hasds-hasds-src-mq3-platform-win-snd-ml-1746973818"></a>
### hasDS

```ml
hasDS
```

Whether a DirectSound interface is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L56)

<a id="field-field-mq3-platform-win-snd-state-hasdsbuf-hasdsbuf-src-mq3-platform-win-snd-ml-1806596874"></a>
### hasDSBuf

```ml
hasDSBuf
```

Whether a DirectSound secondary buffer is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L58)

<a id="field-field-mq3-platform-win-snd-state-hasprimary-hasprimary-src-mq3-platform-win-snd-ml-57093130"></a>
### hasPrimary

```ml
hasPrimary
```

Whether a DirectSound primary buffer is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L60)

<a id="field-field-mq3-platform-win-snd-state-locksize-locksize-src-mq3-platform-win-snd-ml-495904650"></a>
### lockSize

```ml
lockSize
```

Size in bytes of the region currently locked for mixing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L54)

<a id="field-field-mq3-platform-win-snd-state-playing-playing-src-mq3-platform-win-snd-ml-1435884042"></a>
### playing

```ml
playing
```

Whether the sound buffer is currently playing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L66)

<a id="field-field-mq3-platform-win-snd-state-prints-prints-src-mq3-platform-win-snd-ml-1704460322"></a>
### prints

```ml
prints
```

Messages captured from diagnostic print operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L76)

<a id="field-field-mq3-platform-win-snd-state-retailactive-retailactive-src-mq3-platform-win-snd-ml-1997865540"></a>
### retailActive

```ml
retailActive
```

Whether the real platform backend is active for action dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L80)

<a id="field-field-mq3-platform-win-snd-state-sample16-sample16-src-mq3-platform-win-snd-ml-1177908280"></a>
### sample16

```ml
sample16
```

Whether DMA samples use sixteen-bit storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L50)

<a id="field-field-mq3-platform-win-snd-state-sndbufsize-sndbufsize-src-mq3-platform-win-snd-ml-1657084160"></a>
### sndBufSize

```ml
sndBufSize
```

Size in bytes of the allocated DirectSound buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L52)
