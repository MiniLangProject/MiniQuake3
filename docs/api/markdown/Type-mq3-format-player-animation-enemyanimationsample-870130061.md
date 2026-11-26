# `mq3.format.player_animation.EnemyAnimationSample`

[Home](README.md) · [Source file](File-src-mq3-format-player-animation-ml-408606289.md)

<a id="struct-struct-mq3-format-player-animation-enemyanimationsample-struct-enemyanimationsample-src-mq3-format-player-animation-ml-951447227"></a>
## EnemyAnimationSample

```ml
struct EnemyAnimationSample
```

EnemyAnimationSample record for format.player_animation, containing `mode`, `nextMode`, `lowerAnimation`, `upperAnimation`, `elapsed`, `lower`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L366)

## Members

<a id="field-field-mq3-format-player-animation-enemyanimationsample-elapsed-elapsed-src-mq3-format-player-animation-ml-1206942391"></a>
### elapsed

```ml
elapsed
```

Time elapsed since the current animation mode began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L376)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-lower-lower-src-mq3-format-player-animation-ml-29173099"></a>
### lower

```ml
lower
```

Sampled frame pair for the lower-body model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L378)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-loweranimation-loweranimation-src-mq3-format-player-animation-ml-1381944761"></a>
### lowerAnimation

```ml
lowerAnimation
```

Animation selected for the player's lower body.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L372)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-mode-mode-src-mq3-format-player-animation-ml-5219713"></a>
### mode

```ml
mode
```

Animation mode sampled for the current update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L368)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-nextmode-nextmode-src-mq3-format-player-animation-ml-1627310487"></a>
### nextMode

```ml
nextMode
```

Animation mode selected for the next update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L370)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-transitioned-transitioned-src-mq3-format-player-animation-ml-1772105931"></a>
### transitioned

```ml
transitioned
```

True when this sample causes an animation-mode transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L382)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-upper-upper-src-mq3-format-player-animation-ml-449570471"></a>
### upper

```ml
upper
```

Sampled frame pair for the upper-body model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L380)

<a id="field-field-mq3-format-player-animation-enemyanimationsample-upperanimation-upperanimation-src-mq3-format-player-animation-ml-1240184055"></a>
### upperAnimation

```ml
upperAnimation
```

Animation selected for the player's upper body.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L374)
