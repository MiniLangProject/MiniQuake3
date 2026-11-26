# `mq3.client.key_bindings_config.State`

[Home](README.md) · [Source file](File-src-mq3-client-key-bindings-config-ml-2105830282.md)

<a id="struct-struct-mq3-client-key-bindings-config-state-struct-state-src-mq3-client-key-bindings-config-ml-1538017115"></a>
## State

```ml
struct State
```

Stores key bindings config state, including `keys`, `printFn`, `printContext`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L10)

## Members

<a id="field-field-mq3-client-key-bindings-config-state-keys-keys-src-mq3-client-key-bindings-config-ml-2041435944"></a>
### keys

```ml
keys
```

When constructing this record, `create` supplies `keyState` for this member. Used by `bindingText` and `bindCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L13)

<a id="field-field-mq3-client-key-bindings-config-state-printcontext-printcontext-src-mq3-client-key-bindings-config-ml-197491208"></a>
### printContext

```ml
printContext
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `emit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L18)

<a id="field-field-mq3-client-key-bindings-config-state-printfn-printfn-src-mq3-client-key-bindings-config-ml-693753792"></a>
### printFn

```ml
printFn
```

Host callback for the print operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_bindings_config.ml#L15)
