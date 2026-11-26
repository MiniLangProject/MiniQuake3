# `mq3.client.cgame_main.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-action-struct-action-src-mq3-client-cgame-main-ml-207363149"></a>
## Action

```ml
struct Action
```

Stores client game main queued engine action, including `boundary`, `kind`, `name`, `value`, `value2`, `number` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L78)

## Members

<a id="field-field-mq3-client-cgame-main-action-boundary-boundary-src-mq3-client-cgame-main-ml-1107091455"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while initializing CGame, registering media, and updating shared client information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L81)

<a id="field-field-mq3-client-cgame-main-action-dispatched-dispatched-src-mq3-client-cgame-main-ml-1246481349"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while initializing CGame, registering media, and updating shared client information; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L100)

<a id="field-field-mq3-client-cgame-main-action-flags-flags-src-mq3-client-cgame-main-ml-1920909527"></a>
### flags

```ml
flags
```

When constructing this record, `action` supplies `flags` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L97)

<a id="field-field-mq3-client-cgame-main-action-kind-kind-src-mq3-client-cgame-main-ml-547119199"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while initializing CGame, registering media, and updating shared client information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L84)

<a id="field-field-mq3-client-cgame-main-action-name-name-src-mq3-client-cgame-main-ml-1712391613"></a>
### name

```ml
name
```

Cvar, media asset, command, or other named target referenced by a client-game initialization action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L87)

<a id="field-field-mq3-client-cgame-main-action-number-number-src-mq3-client-cgame-main-ml-1619523017"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while initializing CGame, registering media, and updating shared client information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L95)

<a id="field-field-mq3-client-cgame-main-action-value-value-src-mq3-client-cgame-main-ml-1228170755"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while initializing CGame, registering media, and updating shared client information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L90)

<a id="field-field-mq3-client-cgame-main-action-value2-value2-src-mq3-client-cgame-main-ml-12939209"></a>
### value2

```ml
value2
```

When constructing this record, `action` supplies `value2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L92)
