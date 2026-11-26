# `mq3.client.input_command.State`

[Home](README.md) · [Source file](File-src-mq3-client-input-command-ml-1980603655.md)

<a id="struct-struct-mq3-client-input-command-state-struct-state-src-mq3-client-input-command-ml-175633423"></a>
## State

```ml
struct State
```

Stores input command state, including `left`, `right`, `forward`, `back`, `lookup`, `lookdown` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L80)

## Members

<a id="field-field-mq3-client-input-command-state-back-back-src-mq3-client-input-command-ml-1807988260"></a>
### back

```ml
back
```

When constructing this record, `create` supplies `button()` for this member. Used by `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L90)

<a id="field-field-mq3-client-input-command-state-buttons-buttons-src-mq3-client-input-command-ml-962803582"></a>
### buttons

```ml
buttons
```

When constructing this record, `create` supplies `values` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L116)

<a id="field-field-mq3-client-input-command-state-down-down-src-mq3-client-input-command-ml-1985989714"></a>
### down

```ml
down
```

When constructing this record, `create` supplies `button()` for this member. Used by `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L114)

<a id="field-field-mq3-client-input-command-state-forward-forward-src-mq3-client-input-command-ml-12042258"></a>
### forward

```ml
forward
```

When constructing this record, `create` supplies `button()` for this member. Used by `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L87)

<a id="field-field-mq3-client-input-command-state-joystickaxis-joystickaxis-src-mq3-client-input-command-ml-1801244024"></a>
### joystickAxis

```ml
joystickAxis
```

Latest sampled joystick-axis values used by user-command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L130)

<a id="field-field-mq3-client-input-command-state-left-left-src-mq3-client-input-command-ml-1523357660"></a>
### left

```ml
left
```

Left boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L82)

<a id="field-field-mq3-client-input-command-state-lookdown-lookdown-src-mq3-client-input-command-ml-294368248"></a>
### lookdown

```ml
lookdown
```

When constructing this record, `create` supplies `button()` for this member. Used by `adjustAngles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L96)

<a id="field-field-mq3-client-input-command-state-lookup-lookup-src-mq3-client-input-command-ml-28006274"></a>
### lookup

```ml
lookup
```

When constructing this record, `create` supplies `button()` for this member. Used by `adjustAngles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L93)

<a id="field-field-mq3-client-input-command-state-mlooking-mlooking-src-mq3-client-input-command-ml-1096099210"></a>
### mlooking

```ml
mlooking
```

When constructing this record, `create` supplies `false` for this member. Used by `mouseMove` and `joystickMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L119)

<a id="field-field-mq3-client-input-command-state-mousedx-mousedx-src-mq3-client-input-command-ml-2082947062"></a>
### mouseDx

```ml
mouseDx
```

Buffered horizontal mouse movement awaiting user-command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L123)

<a id="field-field-mq3-client-input-command-state-mousedy-mousedy-src-mq3-client-input-command-ml-1248231354"></a>
### mouseDy

```ml
mouseDy
```

Buffered vertical mouse movement awaiting user-command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L125)

<a id="field-field-mq3-client-input-command-state-mouseindex-mouseindex-src-mq3-client-input-command-ml-941929468"></a>
### mouseIndex

```ml
mouseIndex
```

When constructing this record, `create` supplies `0` for this member. Used by `accumulateMouse` and `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L128)

<a id="field-field-mq3-client-input-command-state-moveleft-moveleft-src-mq3-client-input-command-ml-1049716674"></a>
### moveleft

```ml
moveleft
```

When constructing this record, `create` supplies `button()` for this member. Used by `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L99)

<a id="field-field-mq3-client-input-command-state-moveright-moveright-src-mq3-client-input-command-ml-1156630654"></a>
### moveright

```ml
moveright
```

When constructing this record, `create` supplies `button()` for this member. Used by `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L102)

<a id="field-field-mq3-client-input-command-state-right-right-src-mq3-client-input-command-ml-204580618"></a>
### right

```ml
right
```

Right boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L84)

<a id="field-field-mq3-client-input-command-state-speed-speed-src-mq3-client-input-command-ml-37786558"></a>
### speed

```ml
speed
```

When constructing this record, `create` supplies `button()` for this member. Used by `adjustAngles` and `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L108)

<a id="field-field-mq3-client-input-command-state-strafe-strafe-src-mq3-client-input-command-ml-1324213512"></a>
### strafe

```ml
strafe
```

When constructing this record, `create` supplies `button()` for this member. Used by `adjustAngles` and `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L105)

<a id="field-field-mq3-client-input-command-state-up-up-src-mq3-client-input-command-ml-1785603984"></a>
### up

```ml
up
```

When constructing this record, `create` supplies `button()` for this member. Used by `keyMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L111)

<a id="field-field-mq3-client-input-command-state-viewangles-viewangles-src-mq3-client-input-command-ml-655844480"></a>
### viewangles

```ml
viewangles
```

Locally accumulated view angles used when constructing outgoing user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L121)
