# `mq3.client.ui_player_settings.DrawCommand`

[Home](README.md) · [Source file](File-src-mq3-client-ui-player-settings-ml-1356241043.md)

<a id="struct-struct-mq3-client-ui-player-settings-drawcommand-struct-drawcommand-src-mq3-client-ui-player-settings-ml-370689455"></a>
## DrawCommand

```ml
struct DrawCommand
```

Stores UI player settings draw command record, including `kind`, `text`, `x`, `y`, `width`, `height` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L53)

## Members

<a id="field-field-mq3-client-ui-player-settings-drawcommand-asset-asset-src-mq3-client-ui-player-settings-ml-784845136"></a>
### asset

```ml
asset
```

When constructing this record, `visibleNameCommands` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L72)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-color-color-src-mq3-client-ui-player-settings-ml-1424107556"></a>
### color

```ml
color
```

RGBA text or cursor color selected for the player-settings draw command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L70)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-height-height-src-mq3-client-ui-player-settings-ml-1138893798"></a>
### height

```ml
height
```

Height of the character or image quad in a player-settings draw command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L66)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-kind-kind-src-mq3-client-ui-player-settings-ml-326210384"></a>
### kind

```ml
kind
```

Player-settings drawing operation selecting how its text, artwork, bounds, and color are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L56)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-style-style-src-mq3-client-ui-player-settings-ml-346944060"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L68)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-text-text-src-mq3-client-ui-player-settings-ml-275251738"></a>
### text

```ml
text
```

Text portion of a player-settings drawing command, such as the cleaned name or a handicap label.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L58)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-width-width-src-mq3-client-ui-player-settings-ml-1033680892"></a>
### width

```ml
width
```

Width of the character or image quad in a player-settings draw command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L64)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-x-x-src-mq3-client-ui-player-settings-ml-447013952"></a>
### x

```ml
x
```

Horizontal coordinate of the player-settings text or image command in the virtual menu layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L60)

<a id="field-field-mq3-client-ui-player-settings-drawcommand-y-y-src-mq3-client-ui-player-settings-ml-550529580"></a>
### y

```ml
y
```

Vertical coordinate of the player-settings text or image command in the virtual menu layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L62)
