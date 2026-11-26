# `mq3.client.playable_spatial_ambient.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-playable-spatial-ambient-ml-1799232719.md)

<a id="struct-struct-mq3-client-playable-spatial-ambient-runtime-struct-runtime-src-mq3-client-playable-spatial-ambient-ml-364832029"></a>
## Runtime

```ml
struct Runtime
```

Stores playable spatial ambient runtime wiring and state, including `mix`, `submitted`, `dropped`, `started`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_spatial_ambient.ml#L14)

## Members

<a id="field-field-mq3-client-playable-spatial-ambient-runtime-dropped-dropped-src-mq3-client-playable-spatial-ambient-ml-1807001517"></a>
### dropped

```ml
dropped
```

When constructing this record, `create` supplies `0` for this member. Used by `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_spatial_ambient.ml#L23)

<a id="field-field-mq3-client-playable-spatial-ambient-runtime-mix-mix-src-mq3-client-playable-spatial-ambient-ml-85360981"></a>
### mix

```ml
mix
```

When constructing this record, `create` supplies `state` for this member. Used by `start` and `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_spatial_ambient.ml#L17)

<a id="field-field-mq3-client-playable-spatial-ambient-runtime-started-started-src-mq3-client-playable-spatial-ambient-ml-43473737"></a>
### started

```ml
started
```

When constructing this record, `create` supplies `false` for this member. Used by `start` and `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_spatial_ambient.ml#L26)

<a id="field-field-mq3-client-playable-spatial-ambient-runtime-submitted-submitted-src-mq3-client-playable-spatial-ambient-ml-244049285"></a>
### submitted

```ml
submitted
```

When constructing this record, `create` supplies `0` for this member. Used by `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_spatial_ambient.ml#L20)
