# `mq3.client.playable_enemy_movement.Result`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-movement-ml-941250028.md)

<a id="struct-struct-mq3-client-playable-enemy-movement-result-struct-result-src-mq3-client-playable-enemy-movement-ml-1422695591"></a>
## Result

```ml
struct Result
```

Stores playable enemy movement operation result, including `origin`, `delta`, `blocked`, `stepped`, `grounded`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L19)

## Members

<a id="field-field-mq3-client-playable-enemy-movement-result-blocked-blocked-src-mq3-client-playable-enemy-movement-ml-1469160380"></a>
### blocked

```ml
blocked
```

When constructing this record, `moveOriginWithTrace` supplies `blocked` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L25)

<a id="field-field-mq3-client-playable-enemy-movement-result-delta-delta-src-mq3-client-playable-enemy-movement-ml-767690940"></a>
### delta

```ml
delta
```

When constructing this record, `moveOriginWithTrace` supplies `actual` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L23)

<a id="field-field-mq3-client-playable-enemy-movement-result-grounded-grounded-src-mq3-client-playable-enemy-movement-ml-359005000"></a>
### grounded

```ml
grounded
```

When constructing this record, `moveOriginWithTrace` supplies `grounded` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L29)

<a id="field-field-mq3-client-playable-enemy-movement-result-origin-origin-src-mq3-client-playable-enemy-movement-ml-2116227992"></a>
### origin

```ml
origin
```

Final enemy position returned after movement and ground-collision resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L21)

<a id="field-field-mq3-client-playable-enemy-movement-result-stepped-stepped-src-mq3-client-playable-enemy-movement-ml-1734910800"></a>
### stepped

```ml
stepped
```

When constructing this record, `moveOriginWithTrace` supplies `stepped` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L27)
