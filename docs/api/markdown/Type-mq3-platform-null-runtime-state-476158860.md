# `mq3.platform.null_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-platform-null-runtime-ml-1369931911.md)

<a id="struct-struct-mq3-platform-null-runtime-state-struct-state-src-mq3-platform-null-runtime-ml-1803962531"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.null_runtime.State`; groups `clientInitialized`, `inputInitialized`, `glInitialized`, `qglInitialized`, `logging`, `frames`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L23)

## Members

<a id="field-field-mq3-platform-null-runtime-state-clientinitialized-clientinitialized-src-mq3-platform-null-runtime-ml-1855277186"></a>
### clientInitialized

```ml
clientInitialized
```

Whether client-side platform services have initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L25)

<a id="field-field-mq3-platform-null-runtime-state-consoletext-consoletext-src-mq3-platform-null-runtime-ml-468148858"></a>
### consoleText

```ml
consoleText
```

Text accumulated in the platform console buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L47)

<a id="field-field-mq3-platform-null-runtime-state-errors-errors-src-mq3-platform-null-runtime-ml-1816410000"></a>
### errors

```ml
errors
```

Errors recorded by this subsystem or its host callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L51)

<a id="field-field-mq3-platform-null-runtime-state-frames-frames-src-mq3-platform-null-runtime-ml-1905327258"></a>
### frames

```ml
frames
```

Number of headless platform frames processed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L35)

<a id="field-field-mq3-platform-null-runtime-state-glframes-glframes-src-mq3-platform-null-runtime-ml-1899544724"></a>
### glFrames

```ml
glFrames
```

Number of graphics-frame updates processed by the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L39)

<a id="field-field-mq3-platform-null-runtime-state-glinitialized-glinitialized-src-mq3-platform-null-runtime-ml-628617714"></a>
### glInitialized

```ml
glInitialized
```

Whether the platform graphics context has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L29)

<a id="field-field-mq3-platform-null-runtime-state-inputframes-inputframes-src-mq3-platform-null-runtime-ml-561094818"></a>
### inputFrames

```ml
inputFrames
```

Number of input-frame updates processed by the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L37)

<a id="field-field-mq3-platform-null-runtime-state-inputinitialized-inputinitialized-src-mq3-platform-null-runtime-ml-562956954"></a>
### inputInitialized

```ml
inputInitialized
```

Whether native input processing has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L27)

<a id="field-field-mq3-platform-null-runtime-state-localsounds-localsounds-src-mq3-platform-null-runtime-ml-1624543494"></a>
### localSounds

```ml
localSounds
```

Local sound playback requests recorded by the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L43)

<a id="field-field-mq3-platform-null-runtime-state-logging-logging-src-mq3-platform-null-runtime-ml-410607882"></a>
### logging

```ml
logging
```

Whether graphics or platform call logging is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L33)

<a id="field-field-mq3-platform-null-runtime-state-qglinitialized-qglinitialized-src-mq3-platform-null-runtime-ml-1549865154"></a>
### qglInitialized

```ml
qglInitialized
```

Whether graphics entry-point binding has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L31)

<a id="field-field-mq3-platform-null-runtime-state-quitrequested-quitrequested-src-mq3-platform-null-runtime-ml-1848261318"></a>
### quitRequested

```ml
quitRequested
```

Whether application shutdown has been requested.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L49)

<a id="field-field-mq3-platform-null-runtime-state-sentpackets-sentpackets-src-mq3-platform-null-runtime-ml-2114865874"></a>
### sentPackets

```ml
sentPackets
```

Network packets submitted through the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L45)

<a id="field-field-mq3-platform-null-runtime-state-soundregistrations-soundregistrations-src-mq3-platform-null-runtime-ml-174616220"></a>
### soundRegistrations

```ml
soundRegistrations
```

Sound resource registrations recorded by the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/null_runtime.ml#L41)
