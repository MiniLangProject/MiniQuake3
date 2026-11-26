# `mq3.client.playable_projectile_view.EffectCommand`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)

<a id="struct-struct-mq3-client-playable-projectile-view-effectcommand-struct-effectcommand-src-mq3-client-playable-projectile-view-ml-368129869"></a>
## EffectCommand

```ml
struct EffectCommand
```

Stores playable projectile view effect command record, including `kind`, `a`, `b`, `radius`, `red`, `green` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L54)

## Members

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-a-a-src-mq3-client-playable-projectile-view-ml-1497711683"></a>
### a

```ml
a
```

Alpha component controlling opacity or blending.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L59)

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-b-b-src-mq3-client-playable-projectile-view-ml-183454199"></a>
### b

```ml
b
```

Blue component of the stored color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L61)

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-blue-blue-src-mq3-client-playable-projectile-view-ml-830358463"></a>
### blue

```ml
blue
```

Blue color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L69)

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-green-green-src-mq3-client-playable-projectile-view-ml-211441671"></a>
### green

```ml
green
```

Green color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L67)

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-kind-kind-src-mq3-client-playable-projectile-view-ml-1117227819"></a>
### kind

```ml
kind
```

Drawing primitive selector choosing a line, impact cross, or glow for the fallback projectile effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L57)

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-radius-radius-src-mq3-client-playable-projectile-view-ml-330772195"></a>
### radius

```ml
radius
```

Screen-space radius in pixels of the projected projectile glow or impact cross.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L63)

<a id="field-field-mq3-client-playable-projectile-view-effectcommand-red-red-src-mq3-client-playable-projectile-view-ml-1303293699"></a>
### red

```ml
red
```

Red color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_view.ml#L65)
