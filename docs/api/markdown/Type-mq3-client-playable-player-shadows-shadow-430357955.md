# `mq3.client.playable_player_shadows.Shadow`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-shadows-ml-274754233.md)

<a id="struct-struct-mq3-client-playable-player-shadows-shadow-struct-shadow-src-mq3-client-playable-player-shadows-ml-36681119"></a>
## Shadow

```ml
struct Shadow
```

Stores playable player shadows shadow record, including `origin`, `normal`, `orientation`, `alpha`, `radius`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L35)

## Members

<a id="field-field-mq3-client-playable-player-shadows-shadow-alpha-alpha-src-mq3-client-playable-player-shadows-ml-1123804589"></a>
### alpha

```ml
alpha
```

Opacity or alpha modulation applied while drawing or fading the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L44)

<a id="field-field-mq3-client-playable-player-shadows-shadow-normal-normal-src-mq3-client-playable-player-shadows-ml-35304383"></a>
### normal

```ml
normal
```

Normalized ground-trace normal used to orient the projected shadow polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L39)

<a id="field-field-mq3-client-playable-player-shadows-shadow-orientation-orientation-src-mq3-client-playable-player-shadows-ml-359157685"></a>
### orientation

```ml
orientation
```

When constructing this record, `traceWith` supplies `orientation` for this member. Used by `axes` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L42)

<a id="field-field-mq3-client-playable-player-shadows-shadow-origin-origin-src-mq3-client-playable-player-shadows-ml-1240572769"></a>
### origin

```ml
origin
```

World-space center of the projected shadow polygon on the supporting surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L37)

<a id="field-field-mq3-client-playable-player-shadows-shadow-radius-radius-src-mq3-client-playable-player-shadows-ml-1613665641"></a>
### radius

```ml
radius
```

World-space half-size of the projected player-shadow quad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L46)
