# `mq3.platform.desktop_frame_host.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)

<a id="struct-struct-mq3-platform-desktop-frame-host-runtime-struct-runtime-src-mq3-platform-desktop-frame-host-ml-1817987991"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.desktop_frame_host.Runtime`; groups `config`, `services`, `clientSocket`, `serverSocket`, `clientEndpoint`, `serverEndpoint`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L64)

## Members

<a id="field-field-mq3-platform-desktop-frame-host-runtime-active-active-src-mq3-platform-desktop-frame-host-ml-1742155481"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L86)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-clientendpoint-clientendpoint-src-mq3-platform-desktop-frame-host-ml-1889451625"></a>
### clientEndpoint

```ml
clientEndpoint
```

Local or remote endpoint used by the client transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L74)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-clientsocket-clientsocket-src-mq3-platform-desktop-frame-host-ml-1062178737"></a>
### clientSocket

```ml
clientSocket
```

Socket used for the client side of the local host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L70)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-config-config-src-mq3-platform-desktop-frame-host-ml-1888198041"></a>
### config

```ml
config
```

Configuration values used to initialize or drive this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L66)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-framenumber-framenumber-src-mq3-platform-desktop-frame-host-ml-1935964269"></a>
### frameNumber

```ml
frameNumber
```

Sequence number identifying the current host frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L82)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-packetcount-packetcount-src-mq3-platform-desktop-frame-host-ml-1486756921"></a>
### packetCount

```ml
packetCount
```

Number of packets processed by the frame host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L84)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-pump-pump-src-mq3-platform-desktop-frame-host-ml-837793369"></a>
### pump

```ml
pump
```

Packet pump used to drain transport events into the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L78)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-serverendpoint-serverendpoint-src-mq3-platform-desktop-frame-host-ml-2063455321"></a>
### serverEndpoint

```ml
serverEndpoint
```

Local or remote endpoint used by the server transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L76)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-serversocket-serversocket-src-mq3-platform-desktop-frame-host-ml-818647049"></a>
### serverSocket

```ml
serverSocket
```

Socket used for the server side of the local host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L72)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-services-services-src-mq3-platform-desktop-frame-host-ml-1713200033"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L68)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-time-time-src-mq3-platform-desktop-frame-host-ml-5525447"></a>
### time

```ml
time
```

Current host clock in milliseconds, advanced before packet draining and engine frame callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L80)

<a id="field-field-mq3-platform-desktop-frame-host-runtime-udpstarted-udpstarted-src-mq3-platform-desktop-frame-host-ml-746778341"></a>
### udpStarted

```ml
udpStarted
```

Whether the UDP transport has completed startup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/desktop_frame_host.ml#L88)
