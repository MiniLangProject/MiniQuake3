# `mq3.video.roq_video.Decoder`

[Home](README.md) · [Source file](File-src-mq3-video-roq-video-ml-1067140839.md)

<a id="struct-struct-mq3-video-roq-video-decoder-struct-decoder-src-mq3-video-roq-video-ml-1214777507"></a>
## Decoder

```ml
struct Decoder
```

Decoder record for video.roq_video, containing `width`, `height`, `q2`, `q4`, `q8`, `buffers`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L22)

## Members

<a id="field-field-mq3-video-roq-video-decoder-buffers-buffers-src-mq3-video-roq-video-ml-1698467147"></a>
### buffers

```ml
buffers
```

Frame buffers retained for RoQ motion compensation and frame output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L34)

<a id="field-field-mq3-video-roq-video-decoder-framecount-framecount-src-mq3-video-roq-video-ml-2128640511"></a>
### frameCount

```ml
frameCount
```

Number of video frames decoded so far.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L36)

<a id="field-field-mq3-video-roq-video-decoder-height-height-src-mq3-video-roq-video-ml-140805825"></a>
### height

```ml
height
```

Image/frame height in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L26)

<a id="field-field-mq3-video-roq-video-decoder-latest-latest-src-mq3-video-roq-video-ml-1993100941"></a>
### latest

```ml
latest
```

Most recently decoded output frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L38)

<a id="field-field-mq3-video-roq-video-decoder-q2-q2-src-mq3-video-roq-video-ml-552774369"></a>
### q2

```ml
q2
```

RoQ codebook entries containing decoded 2-by-2 pixel blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L28)

<a id="field-field-mq3-video-roq-video-decoder-q4-q4-src-mq3-video-roq-video-ml-1982133313"></a>
### q4

```ml
q4
```

RoQ codebook entries containing assembled 4-by-4 pixel blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L30)

<a id="field-field-mq3-video-roq-video-decoder-q8-q8-src-mq3-video-roq-video-ml-110153681"></a>
### q8

```ml
q8
```

RoQ codebook entries containing expanded 8-by-8 pixel blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L32)

<a id="field-field-mq3-video-roq-video-decoder-width-width-src-mq3-video-roq-video-ml-750323379"></a>
### width

```ml
width
```

Image/frame width in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L24)
