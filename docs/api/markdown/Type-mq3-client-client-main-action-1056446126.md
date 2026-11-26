# `mq3.client.client_main.Action`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-action-struct-action-src-mq3-client-client-main-ml-1981979415"></a>
## Action

```ml
struct Action
```

Stores client main queued engine action, including `kind`, `text`, `address`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L52)

## Members

<a id="field-field-mq3-client-client-main-action-address-address-src-mq3-client-client-main-ml-58379579"></a>
### address

```ml
address
```

When constructing this record, `emit` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L60)

<a id="field-field-mq3-client-client-main-action-dispatched-dispatched-src-mq3-client-client-main-ml-1151506817"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while processing client lifecycle, connection, demo, and console commands; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L63)

<a id="field-field-mq3-client-client-main-action-kind-kind-src-mq3-client-client-main-ml-1624706135"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while processing client lifecycle, connection, demo, and console commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L55)

<a id="field-field-mq3-client-client-main-action-text-text-src-mq3-client-client-main-ml-807394529"></a>
### text

```ml
text
```

Client host-operation text, including diagnostic messages, demo names, or outgoing connection command payloads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L58)
