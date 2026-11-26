# `mq3.renderer.playable_flares.Catalog`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-flares-ml-2125885383.md)

<a id="struct-struct-mq3-renderer-playable-flares-catalog-struct-catalog-src-mq3-renderer-playable-flares-ml-1564018467"></a>
## Catalog

```ml
struct Catalog
```

Data record for `mq3.renderer.playable_flares.Catalog`; groups `flares`, `states`, `dynamicStates`, `textureSlot`, `image`, `enabled`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L51)

## Members

<a id="field-field-mq3-renderer-playable-flares-catalog-dynamicstates-dynamicstates-src-mq3-renderer-playable-flares-ml-1707570484"></a>
### dynamicStates

```ml
dynamicStates
```

Visibility and fade state retained for dynamically generated flares.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L57)

<a id="field-field-mq3-renderer-playable-flares-catalog-enabled-enabled-src-mq3-renderer-playable-flares-ml-599975500"></a>
### enabled

```ml
enabled
```

Whether this feature is enabled by the current configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L63)

<a id="field-field-mq3-renderer-playable-flares-catalog-flares-flares-src-mq3-renderer-playable-flares-ml-1063410918"></a>
### flares

```ml
flares
```

Map-defined light flares registered by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L53)

<a id="field-field-mq3-renderer-playable-flares-catalog-image-image-src-mq3-renderer-playable-flares-ml-861374268"></a>
### image

```ml
image
```

Shared flare texture drawn by static and dynamic flare instances.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L61)

<a id="field-field-mq3-renderer-playable-flares-catalog-states-states-src-mq3-renderer-playable-flares-ml-1865131532"></a>
### states

```ml
states
```

Persistent visibility and fade state associated with the registered flares.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L55)

<a id="field-field-mq3-renderer-playable-flares-catalog-textureslot-textureslot-src-mq3-renderer-playable-flares-ml-336707588"></a>
### textureSlot

```ml
textureSlot
```

Texture slot reserved for this effect's image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L59)
