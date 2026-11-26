# `mq3.platform.unix_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-platform-unix-runtime-ml-1537873738.md)

<a id="struct-struct-mq3-platform-unix-runtime-state-struct-state-src-mq3-platform-unix-runtime-ml-1000349461"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.unix_runtime.State`; groups `glInitialized`, `inputInitialized`, `joystickInitialized`, `soundInitialized`, `logging`, `gamma`, and 13 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L58)

## Members

<a id="field-field-mq3-platform-unix-runtime-state-active-active-src-mq3-platform-unix-runtime-ml-570115346"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L72)

<a id="field-field-mq3-platform-unix-runtime-state-currenttime-currenttime-src-mq3-platform-unix-runtime-ml-104856038"></a>
### currentTime

```ml
currentTime
```

Current platform clock value in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L76)

<a id="field-field-mq3-platform-unix-runtime-state-errors-errors-src-mq3-platform-unix-runtime-ml-1634327272"></a>
### errors

```ml
errors
```

Errors recorded by this subsystem or its host callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L94)

<a id="field-field-mq3-platform-unix-runtime-state-events-events-src-mq3-platform-unix-runtime-ml-1639519980"></a>
### events

```ml
events
```

Pending input or system events awaiting delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L82)

<a id="field-field-mq3-platform-unix-runtime-state-gamma-gamma-src-mq3-platform-unix-runtime-ml-58975874"></a>
### gamma

```ml
gamma
```

Configured gamma correction or platform gamma-ramp state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L70)

<a id="field-field-mq3-platform-unix-runtime-state-glinitialized-glinitialized-src-mq3-platform-unix-runtime-ml-1505209030"></a>
### glInitialized

```ml
glInitialized
```

Whether the platform graphics context has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L60)

<a id="field-field-mq3-platform-unix-runtime-state-history-history-src-mq3-platform-unix-runtime-ml-1804390322"></a>
### history

```ml
history
```

Previously entered console commands retained for recall.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L88)

<a id="field-field-mq3-platform-unix-runtime-state-historycursor-historycursor-src-mq3-platform-unix-runtime-ml-1214546694"></a>
### historyCursor

```ml
historyCursor
```

Current position while browsing console command history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L90)

<a id="field-field-mq3-platform-unix-runtime-state-inputinitialized-inputinitialized-src-mq3-platform-unix-runtime-ml-1619120190"></a>
### inputInitialized

```ml
inputInitialized
```

Whether native input processing has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L62)

<a id="field-field-mq3-platform-unix-runtime-state-joystickinitialized-joystickinitialized-src-mq3-platform-unix-runtime-ml-735868234"></a>
### joystickInitialized

```ml
joystickInitialized
```

Whether the joystick input subsystem has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L64)

<a id="field-field-mq3-platform-unix-runtime-state-logging-logging-src-mq3-platform-unix-runtime-ml-574525238"></a>
### logging

```ml
logging
```

Whether graphics or platform call logging is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L68)

<a id="field-field-mq3-platform-unix-runtime-state-packets-packets-src-mq3-platform-unix-runtime-ml-802656902"></a>
### packets

```ml
packets
```

Network packets received or processed by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L86)

<a id="field-field-mq3-platform-unix-runtime-state-paths-paths-src-mq3-platform-unix-runtime-ml-1305716994"></a>
### paths

```ml
paths
```

Filesystem paths used to locate user data and game resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L78)

<a id="field-field-mq3-platform-unix-runtime-state-quitrequested-quitrequested-src-mq3-platform-unix-runtime-ml-1706436242"></a>
### quitRequested

```ml
quitRequested
```

Whether application shutdown has been requested.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L96)

<a id="field-field-mq3-platform-unix-runtime-state-signals-signals-src-mq3-platform-unix-runtime-ml-88150114"></a>
### signals

```ml
signals
```

Operating-system signals recorded by the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L74)

<a id="field-field-mq3-platform-unix-runtime-state-soundinitialized-soundinitialized-src-mq3-platform-unix-runtime-ml-746276904"></a>
### soundInitialized

```ml
soundInitialized
```

Whether the platform sound subsystem has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L66)

<a id="field-field-mq3-platform-unix-runtime-state-systemevents-systemevents-src-mq3-platform-unix-runtime-ml-1459862022"></a>
### systemEvents

```ml
systemEvents
```

Native system events waiting to be translated into engine events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L84)

<a id="field-field-mq3-platform-unix-runtime-state-user-user-src-mq3-platform-unix-runtime-ml-74169776"></a>
### user

```ml
user
```

Operating-system user information used by platform services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L80)

<a id="field-field-mq3-platform-unix-runtime-state-warnings-warnings-src-mq3-platform-unix-runtime-ml-1847204028"></a>
### warnings

```ml
warnings
```

Nonfatal diagnostics retained by the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L92)
