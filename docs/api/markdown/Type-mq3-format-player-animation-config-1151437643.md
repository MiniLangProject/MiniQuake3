# `mq3.format.player_animation.Config`

[Home](README.md) · [Source file](File-src-mq3-format-player-animation-ml-408606289.md)

<a id="struct-struct-mq3-format-player-animation-config-struct-config-src-mq3-format-player-animation-ml-1449914747"></a>
## Config

```ml
struct Config
```

Config record for format.player_animation, containing `animations`, `footsteps`, `headOffset`, `gender`, `fixedLegs`, `fixedTorso`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L69)

## Members

<a id="field-field-mq3-format-player-animation-config-animations-animations-src-mq3-format-player-animation-ml-893317811"></a>
### animations

```ml
animations
```

Animation sequences parsed from the player animation configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L71)

<a id="field-field-mq3-format-player-animation-config-fixedlegs-fixedlegs-src-mq3-format-player-animation-ml-1573514089"></a>
### fixedLegs

```ml
fixedLegs
```

True when the player model requests fixed leg orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L79)

<a id="field-field-mq3-format-player-animation-config-fixedtorso-fixedtorso-src-mq3-format-player-animation-ml-1909331431"></a>
### fixedTorso

```ml
fixedTorso
```

True when the player model requests fixed torso orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L81)

<a id="field-field-mq3-format-player-animation-config-footsteps-footsteps-src-mq3-format-player-animation-ml-2138581849"></a>
### footsteps

```ml
footsteps
```

Footstep-sound category selected by the player animation configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L73)

<a id="field-field-mq3-format-player-animation-config-gender-gender-src-mq3-format-player-animation-ml-1804862507"></a>
### gender

```ml
gender
```

Gender identifier used by player sounds or bot chat selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L77)

<a id="field-field-mq3-format-player-animation-config-headoffset-headoffset-src-mq3-format-player-animation-ml-1759399703"></a>
### headOffset

```ml
headOffset
```

Model-space offset applied when positioning the player head.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L75)
