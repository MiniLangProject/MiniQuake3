# `mq3.platform.desktop_frame_host.FrameResult`

[Home](README.md) · [Source file](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)

<a id="struct-struct-mq3-platform-desktop-frame-host-frameresult-struct-frameresult-src-mq3-platform-desktop-frame-host-ml-928152531"></a>
## FrameResult

```ml
struct FrameResult
```

Data record for `mq3.platform.desktop_frame_host.FrameResult`; groups `number`, `time`, `msec`, `packets`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L91)

## Members

<a id="field-field-mq3-platform-desktop-frame-host-frameresult-msec-msec-src-mq3-platform-desktop-frame-host-ml-2000625709"></a>
### msec

```ml
msec
```

Elapsed duration of the operation or frame, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L97)

<a id="field-field-mq3-platform-desktop-frame-host-frameresult-number-number-src-mq3-platform-desktop-frame-host-ml-20505579"></a>
### number

```ml
number
```

Sequence number of the host frame represented by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L93)

<a id="field-field-mq3-platform-desktop-frame-host-frameresult-packets-packets-src-mq3-platform-desktop-frame-host-ml-57533609"></a>
### packets

```ml
packets
```

Network packets received or processed by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L99)

<a id="field-field-mq3-platform-desktop-frame-host-frameresult-time-time-src-mq3-platform-desktop-frame-host-ml-1009674495"></a>
### time

```ml
time
```

Host clock in milliseconds recorded for the completed desktop frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L95)
