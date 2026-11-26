# `mq3.game.g_public.SharedEntity`

[Home](README.md) · [Source file](File-src-mq3-game-g-public-ml-554411541.md)

<a id="struct-struct-mq3-game-g-public-sharedentity-struct-sharedentity-src-mq3-game-g-public-ml-1036243163"></a>
## SharedEntity

```ml
struct SharedEntity
```

`SharedEntity` record for g public, containing `s` and `r`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L85)

## Members

<a id="field-field-mq3-game-g-public-sharedentity-r-r-src-mq3-game-g-public-ml-996442613"></a>
### r

```ml
r
```

Engine-shared entity state used for world linking, collision, and visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L89)

<a id="field-field-mq3-game-g-public-sharedentity-s-s-src-mq3-game-g-public-ml-1024671281"></a>
### s

```ml
s
```

Network-visible entity state used to build snapshots for clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L87)
