# `mq3.client.cgame_usercmd.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-usercmd-ml-871099490.md)

<a id="struct-struct-mq3-client-cgame-usercmd-state-struct-state-src-mq3-client-cgame-usercmd-ml-1660212647"></a>
## State

```ml
struct State
```

Stores client game usercmd state, including `weapon`, `sensitivity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_usercmd.ml#L7)

## Members

<a id="field-field-mq3-client-cgame-usercmd-state-sensitivity-sensitivity-src-mq3-client-cgame-usercmd-ml-409921912"></a>
### sensitivity

```ml
sensitivity
```

When constructing this record, `create` supplies `1.0` for this member. Used by `set` and `sensitivity` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_usercmd.ml#L12)

<a id="field-field-mq3-client-cgame-usercmd-state-weapon-weapon-src-mq3-client-cgame-usercmd-ml-499359596"></a>
### weapon

```ml
weapon
```

Native weapon identifier requested by the game module for subsequent user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_usercmd.ml#L9)
