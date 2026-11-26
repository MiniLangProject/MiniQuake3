# `mq3.client.playable_movement.Controller`

[Home](README.md) · [Source file](File-src-mq3-client-playable-movement-ml-1276157067.md)

<a id="struct-struct-mq3-client-playable-movement-controller-struct-controller-src-mq3-client-playable-movement-ml-2104270855"></a>
## Controller

```ml
struct Controller
```

Stores playable movement controller record, including `motion`, `grounded`, `jumpHeld`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L28)

## Members

<a id="field-field-mq3-client-playable-movement-controller-grounded-grounded-src-mq3-client-playable-movement-ml-1399547653"></a>
### grounded

```ml
grounded
```

When constructing this record, `createWithTrace` supplies `false` for this member. Used by `groundCheck` and `substep` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L34)

<a id="field-field-mq3-client-playable-movement-controller-jumpheld-jumpheld-src-mq3-client-playable-movement-ml-711382683"></a>
### jumpHeld

```ml
jumpHeld
```

When constructing this record, `createWithTrace` supplies `false` for this member. Used by `step` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L37)

<a id="field-field-mq3-client-playable-movement-controller-motion-motion-src-mq3-client-playable-movement-ml-1746691769"></a>
### motion

```ml
motion
```

When constructing this record, `createWithTrace` supplies `motion` for this member. Used by `groundCheck` and `substep` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L31)
