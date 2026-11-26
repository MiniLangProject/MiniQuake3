# `mq3.client.ui_player_settings.HostAction`

[Home](README.md) · [Source file](File-src-mq3-client-ui-player-settings-ml-1356241043.md)

<a id="struct-struct-mq3-client-ui-player-settings-hostaction-struct-hostaction-src-mq3-client-ui-player-settings-ml-1098595151"></a>
## HostAction

```ml
struct HostAction
```

Stores UI player settings host action record, including `boundary`, `kind`, `name`, `text`, `number`, `x` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L26)

## Members

<a id="field-field-mq3-client-ui-player-settings-hostaction-boundary-boundary-src-mq3-client-ui-player-settings-ml-169886559"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while saving player identity and color settings or drawing the player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L29)

<a id="field-field-mq3-client-ui-player-settings-hostaction-dispatched-dispatched-src-mq3-client-ui-player-settings-ml-542684197"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while saving player identity and color settings or drawing the player preview; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L50)

<a id="field-field-mq3-client-ui-player-settings-hostaction-height-height-src-mq3-client-ui-player-settings-ml-113733525"></a>
### height

```ml
height
```

Destination height recorded for a player-settings renderer request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L47)

<a id="field-field-mq3-client-ui-player-settings-hostaction-kind-kind-src-mq3-client-ui-player-settings-ml-337576231"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while saving player identity and color settings or drawing the player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L32)

<a id="field-field-mq3-client-ui-player-settings-hostaction-name-name-src-mq3-client-ui-player-settings-ml-420167025"></a>
### name

```ml
name
```

Target resource, command, or setting name addressed by this queued host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L34)

<a id="field-field-mq3-client-ui-player-settings-hostaction-number-number-src-mq3-client-ui-player-settings-ml-1367837165"></a>
### number

```ml
number
```

When constructing this record, `emit` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L39)

<a id="field-field-mq3-client-ui-player-settings-hostaction-text-text-src-mq3-client-ui-player-settings-ml-596641309"></a>
### text

```ml
text
```

Player-setting text or cvar value sent to the host, such as the edited name, handicap, or effect color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L37)

<a id="field-field-mq3-client-ui-player-settings-hostaction-width-width-src-mq3-client-ui-player-settings-ml-207495463"></a>
### width

```ml
width
```

Destination width recorded for a player-settings renderer request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L45)

<a id="field-field-mq3-client-ui-player-settings-hostaction-x-x-src-mq3-client-ui-player-settings-ml-2096691699"></a>
### x

```ml
x
```

Horizontal coordinate of the player-settings host drawing request in virtual menu coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L41)

<a id="field-field-mq3-client-ui-player-settings-hostaction-y-y-src-mq3-client-ui-player-settings-ml-1051062703"></a>
### y

```ml
y
```

Vertical coordinate of the player-settings host drawing request in virtual menu coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L43)
