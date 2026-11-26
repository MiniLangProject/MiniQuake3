# `mq3.audio.snd_mem_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-mem-runtime-ml-1049815056.md)

<a id="struct-struct-mq3-audio-snd-mem-runtime-services-struct-services-src-mq3-audio-snd-mem-runtime-ml-465807399"></a>
## Services

```ml
struct Services
```

Services record for audio.snd_mem_runtime, containing `readFileFn`, `freeFileFn`, `millisecondsFn`, `adpcmEncodeFn`, `freeOldestFn`, `diagnosticFn`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L69)

## Members

<a id="field-field-mq3-audio-snd-mem-runtime-services-adpcmencodefn-adpcmencodefn-src-mq3-audio-snd-mem-runtime-ml-1051835931"></a>
### adpcmEncodeFn

```ml
adpcmEncodeFn
```

Host callback that encodes loaded mono samples into the host ADPCM representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L77)

<a id="field-field-mq3-audio-snd-mem-runtime-services-context-context-src-mq3-audio-snd-mem-runtime-ml-1385499327"></a>
### context

```ml
context
```

Opaque host data passed to the configured audio service callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L83)

<a id="field-field-mq3-audio-snd-mem-runtime-services-diagnosticfn-diagnosticfn-src-mq3-audio-snd-mem-runtime-ml-1524227657"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback that reports an audio loading, allocation, or playback diagnostic to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L81)

<a id="field-field-mq3-audio-snd-mem-runtime-services-freefilefn-freefilefn-src-mq3-audio-snd-mem-runtime-ml-529137927"></a>
### freeFileFn

```ml
freeFileFn
```

Host callback that releases file data obtained through the host loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L73)

<a id="field-field-mq3-audio-snd-mem-runtime-services-freeoldestfn-freeoldestfn-src-mq3-audio-snd-mem-runtime-ml-1807607617"></a>
### freeOldestFn

```ml
freeOldestFn
```

Host callback that evicts the oldest eligible sound to release sample-buffer memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L79)

<a id="field-field-mq3-audio-snd-mem-runtime-services-millisecondsfn-millisecondsfn-src-mq3-audio-snd-mem-runtime-ml-1343581255"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback that returns the host clock in milliseconds for cache aging.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L75)

<a id="field-field-mq3-audio-snd-mem-runtime-services-readfilefn-readfilefn-src-mq3-audio-snd-mem-runtime-ml-1871556103"></a>
### readFileFn

```ml
readFileFn
```

Host callback that reads the bytes of a sound asset through the host file interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L71)
