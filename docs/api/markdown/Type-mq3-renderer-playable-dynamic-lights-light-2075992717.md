# `mq3.renderer.playable_dynamic_lights.Light`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)

<a id="struct-struct-mq3-renderer-playable-dynamic-lights-light-struct-light-src-mq3-renderer-playable-dynamic-lights-ml-136687773"></a>
## Light

```ml
struct Light
```

Data record for `mq3.renderer.playable_dynamic_lights.Light`; groups `origin`, `radius`, `color`, `additive`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L46)

## Members

<a id="field-field-mq3-renderer-playable-dynamic-lights-light-additive-additive-src-mq3-renderer-playable-dynamic-lights-ml-985799867"></a>
### additive

```ml
additive
```

Whether the dynamic light contributes additively rather than modulating the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L54)

<a id="field-field-mq3-renderer-playable-dynamic-lights-light-color-color-src-mq3-renderer-playable-dynamic-lights-ml-2140149343"></a>
### color

```ml
color
```

RGB intensity of the light projected onto affected world or model triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L52)

<a id="field-field-mq3-renderer-playable-dynamic-lights-light-origin-origin-src-mq3-renderer-playable-dynamic-lights-ml-1189791455"></a>
### origin

```ml
origin
```

World-space light center used when projecting dynamic lighting onto triangle vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L48)

<a id="field-field-mq3-renderer-playable-dynamic-lights-light-radius-radius-src-mq3-renderer-playable-dynamic-lights-ml-1255942735"></a>
### radius

```ml
radius
```

Radius used for the light, sprite, beam, or bounded object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L50)
