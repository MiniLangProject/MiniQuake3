# `mq3.platform.desktop_frame_host.Config`

[Home](README.md) · [Source file](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)

<a id="struct-struct-mq3-platform-desktop-frame-host-config-struct-config-src-mq3-platform-desktop-frame-host-ml-749380133"></a>
## Config

```ml
struct Config
```

Data record for `mq3.platform.desktop_frame_host.Config`; groups `clientEndpoint`, `serverEndpoint`, `packetCapacity`, `packetBudget`, `maxFrameMsec`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L10)

## Members

<a id="field-field-mq3-platform-desktop-frame-host-config-clientendpoint-clientendpoint-src-mq3-platform-desktop-frame-host-ml-1119937195"></a>
### clientEndpoint

```ml
clientEndpoint
```

Local or remote endpoint used by the client transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L12)

<a id="field-field-mq3-platform-desktop-frame-host-config-maxframemsec-maxframemsec-src-mq3-platform-desktop-frame-host-ml-52330373"></a>
### maxFrameMsec

```ml
maxFrameMsec
```

Upper bound on the elapsed milliseconds passed to one frame step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L20)

<a id="field-field-mq3-platform-desktop-frame-host-config-packetbudget-packetbudget-src-mq3-platform-desktop-frame-host-ml-853859569"></a>
### packetBudget

```ml
packetBudget
```

Maximum number of packets drained during one host frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L18)

<a id="field-field-mq3-platform-desktop-frame-host-config-packetcapacity-packetcapacity-src-mq3-platform-desktop-frame-host-ml-1024152023"></a>
### packetCapacity

```ml
packetCapacity
```

Maximum payload size accepted by the frame host's packet buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L16)

<a id="field-field-mq3-platform-desktop-frame-host-config-serverendpoint-serverendpoint-src-mq3-platform-desktop-frame-host-ml-30977955"></a>
### serverEndpoint

```ml
serverEndpoint
```

Local or remote endpoint used by the server transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L14)
