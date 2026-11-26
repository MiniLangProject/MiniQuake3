# `mq3.client.playable_target_render.PreviewTarget`

[Home](README.md) · [Source file](File-src-mq3-client-playable-target-render-ml-2094681528.md)

<a id="struct-struct-mq3-client-playable-target-render-previewtarget-struct-previewtarget-src-mq3-client-playable-target-render-ml-416444289"></a>
## PreviewTarget

```ml
struct PreviewTarget
```

Stores playable target render preview target record, including `origin`, `health`, `maxHealth`, `alive`, `respawnAt`, `hitFlashUntil`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L18)

## Members

<a id="field-field-mq3-client-playable-target-render-previewtarget-alive-alive-src-mq3-client-playable-target-render-ml-167584750"></a>
### alive

```ml
alive
```

True while the simulated player or target remains alive and can participate in gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L26)

<a id="field-field-mq3-client-playable-target-render-previewtarget-health-health-src-mq3-client-playable-target-render-ml-91762122"></a>
### health

```ml
health
```

Preview target health used to compute its health fraction and rendered alive state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L22)

<a id="field-field-mq3-client-playable-target-render-previewtarget-hitflashuntil-hitflashuntil-src-mq3-client-playable-target-render-ml-1281542962"></a>
### hitFlashUntil

```ml
hitFlashUntil
```

When constructing this record, `target` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L30)

<a id="field-field-mq3-client-playable-target-render-previewtarget-maxhealth-maxhealth-src-mq3-client-playable-target-render-ml-1816578166"></a>
### maxHealth

```ml
maxHealth
```

When constructing this record, `target` supplies `maxHealth` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L24)

<a id="field-field-mq3-client-playable-target-render-previewtarget-origin-origin-src-mq3-client-playable-target-render-ml-865279858"></a>
### origin

```ml
origin
```

World-space location at which the enemy target model is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L20)

<a id="field-field-mq3-client-playable-target-render-previewtarget-respawnat-respawnat-src-mq3-client-playable-target-render-ml-1339335674"></a>
### respawnAt

```ml
respawnAt
```

Client simulation timestamp at which the entity becomes eligible to respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L28)
