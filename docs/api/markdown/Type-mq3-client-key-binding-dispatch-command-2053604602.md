# `mq3.client.key_binding_dispatch.Command`

[Home](README.md) · [Source file](File-src-mq3-client-key-binding-dispatch-ml-676068433.md)

<a id="struct-struct-mq3-client-key-binding-dispatch-command-struct-command-src-mq3-client-key-binding-dispatch-ml-651983011"></a>
## Command

```ml
struct Command
```

Stores key binding dispatch command data, including `text`, `action`, `button`, `down`, `key`, `time`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L9)

## Members

<a id="field-field-mq3-client-key-binding-dispatch-command-action-action-src-mq3-client-key-binding-dispatch-ml-948710342"></a>
### action

```ml
action
```

When constructing this record, `emit` supplies `action` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L14)

<a id="field-field-mq3-client-key-binding-dispatch-command-button-button-src-mq3-client-key-binding-dispatch-ml-417592566"></a>
### button

```ml
button
```

When constructing this record, `emit` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L16)

<a id="field-field-mq3-client-key-binding-dispatch-command-down-down-src-mq3-client-key-binding-dispatch-ml-2136099518"></a>
### down

```ml
down
```

When constructing this record, `emit` supplies `down` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L18)

<a id="field-field-mq3-client-key-binding-dispatch-command-key-key-src-mq3-client-key-binding-dispatch-ml-991787674"></a>
### key

```ml
key
```

When constructing this record, `emit` supplies `key` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L20)

<a id="field-field-mq3-client-key-binding-dispatch-command-text-text-src-mq3-client-key-binding-dispatch-ml-101926256"></a>
### text

```ml
text
```

Expanded console command ready for execution, including button press or release arguments when required.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L12)

<a id="field-field-mq3-client-key-binding-dispatch-command-time-time-src-mq3-client-key-binding-dispatch-ml-2076790008"></a>
### time

```ml
time
```

Input event timestamp in milliseconds appended to generated button press or release commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L22)
