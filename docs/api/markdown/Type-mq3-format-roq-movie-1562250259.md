# `mq3.format.roq.Movie`

[Home](README.md) · [Source file](File-src-mq3-format-roq-ml-406347091.md)

<a id="struct-struct-mq3-format-roq-movie-struct-movie-src-mq3-format-roq-ml-2020585401"></a>
## Movie

```ml
struct Movie
```

Movie record for format.roq, containing `data`, `fps`, `chunks`, `videoFrames`, `audioChunks`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/roq.ml#L41)

## Members

<a id="field-field-mq3-format-roq-movie-audiochunks-audiochunks-src-mq3-format-roq-ml-1380711695"></a>
### audioChunks

```ml
audioChunks
```

Indexes of chunks carrying mono or stereo audio.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/roq.ml#L51)

<a id="field-field-mq3-format-roq-movie-chunks-chunks-src-mq3-format-roq-ml-984361111"></a>
### chunks

```ml
chunks
```

Parsed chunk directory in playback order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/roq.ml#L47)

<a id="field-field-mq3-format-roq-movie-data-data-src-mq3-format-roq-ml-1502658147"></a>
### data

```ml
data
```

Complete RoQ movie file bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/roq.ml#L43)

<a id="field-field-mq3-format-roq-movie-fps-fps-src-mq3-format-roq-ml-1233390351"></a>
### fps

```ml
fps
```

Requested server simulation frames per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/roq.ml#L45)

<a id="field-field-mq3-format-roq-movie-videoframes-videoframes-src-mq3-format-roq-ml-1025840003"></a>
### videoFrames

```ml
videoFrames
```

Indexes of chunks that produce video frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/roq.ml#L49)
