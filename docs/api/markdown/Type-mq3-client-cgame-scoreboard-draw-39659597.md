# `mq3.client.cgame_scoreboard.Draw`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-scoreboard-ml-1090285247.md)

<a id="struct-struct-mq3-client-cgame-scoreboard-draw-struct-draw-src-mq3-client-cgame-scoreboard-ml-1036281987"></a>
## Draw

```ml
struct Draw
```

Stores client game scoreboard draw record, including `kind`, `x`, `y`, `width`, `height`, `text` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L129)

## Members

<a id="field-field-mq3-client-cgame-scoreboard-draw-alpha-alpha-src-mq3-client-cgame-scoreboard-ml-1741626957"></a>
### alpha

```ml
alpha
```

Opacity or alpha modulation applied while drawing or fading the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L145)

<a id="field-field-mq3-client-cgame-scoreboard-draw-blue-blue-src-mq3-client-cgame-scoreboard-ml-1660481565"></a>
### blue

```ml
blue
```

Blue color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L151)

<a id="field-field-mq3-client-cgame-scoreboard-draw-client-client-src-mq3-client-cgame-scoreboard-ml-1353451091"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L153)

<a id="field-field-mq3-client-cgame-scoreboard-draw-green-green-src-mq3-client-cgame-scoreboard-ml-1856647525"></a>
### green

```ml
green
```

Green color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L149)

<a id="field-field-mq3-client-cgame-scoreboard-draw-height-height-src-mq3-client-cgame-scoreboard-ml-485960347"></a>
### height

```ml
height
```

Height of the scoreboard image or rectangle in virtual HUD coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L141)

<a id="field-field-mq3-client-cgame-scoreboard-draw-kind-kind-src-mq3-client-cgame-scoreboard-ml-1697489841"></a>
### kind

```ml
kind
```

Drawing primitive or presentation category selecting how this record is rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L131)

<a id="field-field-mq3-client-cgame-scoreboard-draw-large-large-src-mq3-client-cgame-scoreboard-ml-1982311077"></a>
### large

```ml
large
```

When constructing this record, `draw` supplies `large` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L157)

<a id="field-field-mq3-client-cgame-scoreboard-draw-red-red-src-mq3-client-cgame-scoreboard-ml-1189379497"></a>
### red

```ml
red
```

Red color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L147)

<a id="field-field-mq3-client-cgame-scoreboard-draw-team-team-src-mq3-client-cgame-scoreboard-ml-75289843"></a>
### team

```ml
team
```

Team associated with the scoreboard row or section represented by this draw request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L155)

<a id="field-field-mq3-client-cgame-scoreboard-draw-text-text-src-mq3-client-cgame-scoreboard-ml-1338291067"></a>
### text

```ml
text
```

Text rendered in a scoreboard heading, player row, or match-status notice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L143)

<a id="field-field-mq3-client-cgame-scoreboard-draw-width-width-src-mq3-client-cgame-scoreboard-ml-880347137"></a>
### width

```ml
width
```

Width of the scoreboard image or rectangle in virtual HUD coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L139)

<a id="field-field-mq3-client-cgame-scoreboard-draw-x-x-src-mq3-client-cgame-scoreboard-ml-798988325"></a>
### x

```ml
x
```

Horizontal coordinate of a scoreboard text, icon, or background request in the virtual screen layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L134)

<a id="field-field-mq3-client-cgame-scoreboard-draw-y-y-src-mq3-client-cgame-scoreboard-ml-1249593849"></a>
### y

```ml
y
```

Vertical coordinate of a scoreboard text, icon, or background request in the virtual screen layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_scoreboard.ml#L137)
