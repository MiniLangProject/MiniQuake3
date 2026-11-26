# `mq3.platform.desktop_frame_host.LiveContext`

[Home](README.md) · [Source file](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)

<a id="struct-struct-mq3-platform-desktop-frame-host-livecontext-struct-livecontext-src-mq3-platform-desktop-frame-host-ml-1943783381"></a>
## LiveContext

```ml
struct LiveContext
```

Callback table for `mq3.platform.desktop_frame_host.LiveContext`; exposes `ingress`, `frameContext`, `commonFrameFn`, `serverFrameFn`, `clientFrameFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L51)

## Members

<a id="field-field-mq3-platform-desktop-frame-host-livecontext-clientframefn-clientframefn-src-mq3-platform-desktop-frame-host-ml-699377758"></a>
### clientFrameFn

```ml
clientFrameFn
```

Host callback used to perform client frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L61)

<a id="field-field-mq3-platform-desktop-frame-host-livecontext-commonframefn-commonframefn-src-mq3-platform-desktop-frame-host-ml-989665958"></a>
### commonFrameFn

```ml
commonFrameFn
```

Host callback used to perform common frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L57)

<a id="field-field-mq3-platform-desktop-frame-host-livecontext-framecontext-framecontext-src-mq3-platform-desktop-frame-host-ml-383991982"></a>
### frameContext

```ml
frameContext
```

Host state passed to common, server, and client frame callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L55)

<a id="field-field-mq3-platform-desktop-frame-host-livecontext-ingress-ingress-src-mq3-platform-desktop-frame-host-ml-869160558"></a>
### ingress

```ml
ingress
```

Ingress adapter that delivers received packets to the common frame loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L53)

<a id="field-field-mq3-platform-desktop-frame-host-livecontext-serverframefn-serverframefn-src-mq3-platform-desktop-frame-host-ml-1859910454"></a>
### serverFrameFn

```ml
serverFrameFn
```

Host callback used to perform server frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L59)
