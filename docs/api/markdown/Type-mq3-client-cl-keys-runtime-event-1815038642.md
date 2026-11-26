# `mq3.client.cl_keys_runtime.Event`

[Home](README.md) · [Source file](File-src-mq3-client-cl-keys-runtime-ml-1022053976.md)

<a id="struct-struct-mq3-client-cl-keys-runtime-event-struct-event-src-mq3-client-cl-keys-runtime-ml-256658965"></a>
## Event

```ml
struct Event
```

Stores engine client keys runtime event record, including `kind`, `key`, `down`, `text`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L57)

## Members

<a id="field-field-mq3-client-cl-keys-runtime-event-down-down-src-mq3-client-cl-keys-runtime-ml-18980797"></a>
### down

```ml
down
```

When constructing this record, `event` supplies `down` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L64)

<a id="field-field-mq3-client-cl-keys-runtime-event-key-key-src-mq3-client-cl-keys-runtime-ml-1590750113"></a>
### key

```ml
key
```

When constructing this record, `event` supplies `key` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L62)

<a id="field-field-mq3-client-cl-keys-runtime-event-kind-kind-src-mq3-client-cl-keys-runtime-ml-666874621"></a>
### kind

```ml
kind
```

Keyboard-routing event category identifying the destination or action recorded for a key or character event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L60)

<a id="field-field-mq3-client-cl-keys-runtime-event-text-text-src-mq3-client-cl-keys-runtime-ml-1726210635"></a>
### text

```ml
text
```

Console feedback or expanded key-binding command carried by the keyboard runtime event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L66)
