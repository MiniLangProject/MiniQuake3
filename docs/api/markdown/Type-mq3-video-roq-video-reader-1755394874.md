# `mq3.video.roq_video.Reader`

[Home](README.md) · [Source file](File-src-mq3-video-roq-video-ml-1067140839.md)

<a id="struct-struct-mq3-video-roq-video-reader-struct-reader-src-mq3-video-roq-video-ml-476810877"></a>
## Reader

```ml
struct Reader
```

Reader record for video.roq_video, containing `data`, `offset`, `limit`, `control`, `remaining`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L41)

## Members

<a id="field-field-mq3-video-roq-video-reader-control-control-src-mq3-video-roq-video-ml-1841268528"></a>
### control

```ml
control
```

Packed RoQ block-control word currently being consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L49)

<a id="field-field-mq3-video-roq-video-reader-data-data-src-mq3-video-roq-video-ml-730191656"></a>
### data

```ml
data
```

Bytes of the current RoQ input chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L43)

<a id="field-field-mq3-video-roq-video-reader-limit-limit-src-mq3-video-roq-video-ml-121802504"></a>
### limit

```ml
limit
```

Exclusive byte boundary of the current RoQ chunk reader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L47)

<a id="field-field-mq3-video-roq-video-reader-offset-offset-src-mq3-video-roq-video-ml-1221543702"></a>
### offset

```ml
offset
```

Byte cursor of the next unread RoQ chunk byte.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L45)

<a id="field-field-mq3-video-roq-video-reader-remaining-remaining-src-mq3-video-roq-video-ml-1045091692"></a>
### remaining

```ml
remaining
```

Number of block-control codes still available in the current control word.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/video/roq_video.ml#L51)
