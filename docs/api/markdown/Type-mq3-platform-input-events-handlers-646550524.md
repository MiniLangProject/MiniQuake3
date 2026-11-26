# `mq3.platform.input_events.Handlers`

[Home](README.md) · [Source file](File-src-mq3-platform-input-events-ml-1710405869.md)

<a id="struct-struct-mq3-platform-input-events-handlers-struct-handlers-src-mq3-platform-input-events-ml-1631375955"></a>
## Handlers

```ml
struct Handlers
```

Callback table for `mq3.platform.input_events.Handlers`; exposes `context`, `keyFn`, `charFn`, `mouseFn`, `joystickFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L52)

## Members

<a id="field-field-mq3-platform-input-events-handlers-charfn-charfn-src-mq3-platform-input-events-ml-200871996"></a>
### charFn

```ml
charFn
```

Host callback used to perform char operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L58)

<a id="field-field-mq3-platform-input-events-handlers-context-context-src-mq3-platform-input-events-ml-682106152"></a>
### context

```ml
context
```

Input-consumer state passed to the keyboard, character, mouse, and joystick handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L54)

<a id="field-field-mq3-platform-input-events-handlers-joystickfn-joystickfn-src-mq3-platform-input-events-ml-1592895296"></a>
### joystickFn

```ml
joystickFn
```

Host callback used to perform joystick operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L62)

<a id="field-field-mq3-platform-input-events-handlers-keyfn-keyfn-src-mq3-platform-input-events-ml-1068430624"></a>
### keyFn

```ml
keyFn
```

Host callback used to perform key operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L56)

<a id="field-field-mq3-platform-input-events-handlers-mousefn-mousefn-src-mq3-platform-input-events-ml-496852816"></a>
### mouseFn

```ml
mouseFn
```

Host callback used to perform mouse operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L60)
