# `mq3.client.input_command.Command`

[Home](README.md) · [Source file](File-src-mq3-client-input-command-ml-1980603655.md)

<a id="struct-struct-mq3-client-input-command-command-struct-command-src-mq3-client-input-command-ml-974065007"></a>
## Command

```ml
struct Command
```

Stores input command command data, including `angles`, `buttons`, `weapon`, `forwardmove`, `rightmove`, `upmove` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L133)

## Members

<a id="field-field-mq3-client-input-command-command-angles-angles-src-mq3-client-input-command-ml-418847038"></a>
### angles

```ml
angles
```

Euler orientation used to place or animate the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L135)

<a id="field-field-mq3-client-input-command-command-buttons-buttons-src-mq3-client-input-command-ml-1346295218"></a>
### buttons

```ml
buttons
```

When constructing this record, `createCommand` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L137)

<a id="field-field-mq3-client-input-command-command-forwardmove-forwardmove-src-mq3-client-input-command-ml-1824692034"></a>
### forwardmove

```ml
forwardmove
```

When constructing this record, `createCommand` supplies `0` for this member. Used by `keyMove` and `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L142)

<a id="field-field-mq3-client-input-command-command-rightmove-rightmove-src-mq3-client-input-command-ml-1067262798"></a>
### rightmove

```ml
rightmove
```

When constructing this record, `createCommand` supplies `0` for this member. Used by `keyMove` and `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L145)

<a id="field-field-mq3-client-input-command-command-servertime-servertime-src-mq3-client-input-command-ml-1636500710"></a>
### serverTime

```ml
serverTime
```

Server-domain timestamp in milliseconds assigned to this generated user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L150)

<a id="field-field-mq3-client-input-command-command-upmove-upmove-src-mq3-client-input-command-ml-243819266"></a>
### upmove

```ml
upmove
```

When constructing this record, `createCommand` supplies `0` for this member. Used by `keyMove` and `joystickMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L148)

<a id="field-field-mq3-client-input-command-command-viewangles-viewangles-src-mq3-client-input-command-ml-699360948"></a>
### viewangles

```ml
viewangles
```

Locally accumulated view angles used when constructing outgoing user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L152)

<a id="field-field-mq3-client-input-command-command-weapon-weapon-src-mq3-client-input-command-ml-1019884262"></a>
### weapon

```ml
weapon
```

Weapon selection encoded as an unsigned byte in the outgoing user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L139)
