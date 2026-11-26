# `mq3.platform.win_snd.Dma`

[Home](README.md) · [Source file](File-src-mq3-platform-win-snd-ml-1865364643.md)

<a id="struct-struct-mq3-platform-win-snd-dma-struct-dma-src-mq3-platform-win-snd-ml-1666038729"></a>
## Dma

```ml
struct Dma
```

Data record for `mq3.platform.win_snd.Dma`; groups `channels`, `samplebits`, `speed`, `samples`, `submissionChunk`, `bufferValid`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L31)

## Members

<a id="field-field-mq3-platform-win-snd-dma-buffervalid-buffervalid-src-mq3-platform-win-snd-ml-738683757"></a>
### bufferValid

```ml
bufferValid
```

Whether the DMA sound buffer is valid and accessible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L43)

<a id="field-field-mq3-platform-win-snd-dma-channels-channels-src-mq3-platform-win-snd-ml-671443233"></a>
### channels

```ml
channels
```

Number of interleaved channels in the DMA audio stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L33)

<a id="field-field-mq3-platform-win-snd-dma-samplebits-samplebits-src-mq3-platform-win-snd-ml-1815390625"></a>
### samplebits

```ml
samplebits
```

Number of bits stored for each audio sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L35)

<a id="field-field-mq3-platform-win-snd-dma-samples-samples-src-mq3-platform-win-snd-ml-1637173053"></a>
### samples

```ml
samples
```

Number of sample slots in the DMA sound buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L39)

<a id="field-field-mq3-platform-win-snd-dma-speed-speed-src-mq3-platform-win-snd-ml-689507541"></a>
### speed

```ml
speed
```

DMA audio sample rate in samples per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L37)

<a id="field-field-mq3-platform-win-snd-dma-submissionchunk-submissionchunk-src-mq3-platform-win-snd-ml-392860257"></a>
### submissionChunk

```ml
submissionChunk
```

Minimum number of samples submitted to the sound backend at once.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L41)
