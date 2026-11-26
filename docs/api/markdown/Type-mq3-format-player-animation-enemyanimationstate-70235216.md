# `mq3.format.player_animation.EnemyAnimationState`

[Home](README.md) · [Source file](File-src-mq3-format-player-animation-ml-408606289.md)

<a id="struct-struct-mq3-format-player-animation-enemyanimationstate-struct-enemyanimationstate-src-mq3-format-player-animation-ml-333378647"></a>
## EnemyAnimationState

```ml
struct EnemyAnimationState
```

Standalone hostile-preview animation controller. One-shot sequences keep their final frame in the returned sample and change state for the next call.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L342)

## Members

<a id="field-field-mq3-format-player-animation-enemyanimationstate-deathvariant-deathvariant-src-mq3-format-player-animation-ml-1537393582"></a>
### deathVariant

```ml
deathVariant
```

Selected variation of the death animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L350)

<a id="field-field-mq3-format-player-animation-enemyanimationstate-lowerlerp-lowerlerp-src-mq3-format-player-animation-ml-986150928"></a>
### lowerLerp

```ml
lowerLerp
```

Interpolation state for the player's lower-body animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L354)

<a id="field-field-mq3-format-player-animation-enemyanimationstate-mode-mode-src-mq3-format-player-animation-ml-888598834"></a>
### mode

```ml
mode
```

Current locomotion, action, or death animation mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L344)

<a id="field-field-mq3-format-player-animation-enemyanimationstate-resumemode-resumemode-src-mq3-format-player-animation-ml-1728483880"></a>
### resumeMode

```ml
resumeMode
```

Animation mode to resume after a temporary transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L346)

<a id="field-field-mq3-format-player-animation-enemyanimationstate-startedat-startedat-src-mq3-format-player-animation-ml-724420472"></a>
### startedAt

```ml
startedAt
```

Timestamp at which the current animation mode began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L348)

<a id="field-field-mq3-format-player-animation-enemyanimationstate-transitioncount-transitioncount-src-mq3-format-player-animation-ml-945659720"></a>
### transitionCount

```ml
transitionCount
```

Number of animation-mode transitions applied to this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L352)

<a id="field-field-mq3-format-player-animation-enemyanimationstate-upperlerp-upperlerp-src-mq3-format-player-animation-ml-1030543876"></a>
### upperLerp

```ml
upperLerp
```

Interpolation state for the player's upper-body animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L356)
