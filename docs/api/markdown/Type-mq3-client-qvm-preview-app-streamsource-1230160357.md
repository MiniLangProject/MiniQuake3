# `mq3.client.qvm_preview_app.StreamSource`

[Home](README.md) · [Source file](File-src-mq3-client-qvm-preview-app-ml-1410259322.md)

<a id="struct-struct-mq3-client-qvm-preview-app-streamsource-struct-streamsource-src-mq3-client-qvm-preview-app-ml-215665159"></a>
## StreamSource

```ml
struct StreamSource
```

Stores QVM preview app stream source record, including `transport`, `protocol`, `demo`, `name`, `systemInfo`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L147)

## Members

<a id="field-field-mq3-client-qvm-preview-app-streamsource-demo-demo-src-mq3-client-qvm-preview-app-ml-1037678346"></a>
### demo

```ml
demo
```

True when this source advances a recorded demo instead of pumping a live server connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L153)

<a id="field-field-mq3-client-qvm-preview-app-streamsource-name-name-src-mq3-client-qvm-preview-app-ml-431830142"></a>
### name

```ml
name
```

Virtual resource or definition name used to locate this entry in the client asset catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L155)

<a id="field-field-mq3-client-qvm-preview-app-streamsource-protocol-protocol-src-mq3-client-qvm-preview-app-ml-201064624"></a>
### protocol

```ml
protocol
```

Client protocol parser runtime shared with the live connection or demo playback source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L151)

<a id="field-field-mq3-client-qvm-preview-app-streamsource-systeminfo-systeminfo-src-mq3-client-qvm-preview-app-ml-1211311986"></a>
### systemInfo

```ml
systemInfo
```

Cached server system-info string used to detect changes that must be applied to the transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L157)

<a id="field-field-mq3-client-qvm-preview-app-streamsource-transport-transport-src-mq3-client-qvm-preview-app-ml-1661129216"></a>
### transport

```ml
transport
```

Transport state passed to the live-network pump or the timed demo-advancement path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L149)
