# `mq3.client.playable_weapon.Shot`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-ml-1762261884.md)

<a id="struct-struct-mq3-client-playable-weapon-shot-struct-shot-src-mq3-client-playable-weapon-ml-1885130739"></a>
## Shot

```ml
struct Shot
```

Stores playable weapon shot record, including `start`, `endPoint`, `hit`, `normal`, `distance`, `fraction`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L50)

## Members

<a id="field-field-mq3-client-playable-weapon-shot-distance-distance-src-mq3-client-playable-weapon-ml-1924010039"></a>
### distance

```ml
distance
```

When constructing this record, `shootRay` supplies `qmath.VectorLength(delta)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L61)

<a id="field-field-mq3-client-playable-weapon-shot-endpoint-endpoint-src-mq3-client-playable-weapon-ml-544431363"></a>
### endPoint

```ml
endPoint
```

World-space endpoint of the trace, beam, or projectile presentation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L55)

<a id="field-field-mq3-client-playable-weapon-shot-fraction-fraction-src-mq3-client-playable-weapon-ml-320766221"></a>
### fraction

```ml
fraction
```

When constructing this record, `shootRay` supplies `fraction` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L63)

<a id="field-field-mq3-client-playable-weapon-shot-hit-hit-src-mq3-client-playable-weapon-ml-163328285"></a>
### hit

```ml
hit
```

When constructing this record, `shootRay` supplies `hit` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L57)

<a id="field-field-mq3-client-playable-weapon-shot-normal-normal-src-mq3-client-playable-weapon-ml-1723053599"></a>
### normal

```ml
normal
```

World-surface normal returned by the player's hitscan trace, retained for impact presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L59)

<a id="field-field-mq3-client-playable-weapon-shot-start-start-src-mq3-client-playable-weapon-ml-2079615693"></a>
### start

```ml
start
```

When constructing this record, `shootRay` supplies `[startPoint[0],startPoint[1],startPoint[2]]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L53)
