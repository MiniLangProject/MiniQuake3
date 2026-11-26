# `src/mq3/audio/snd_public.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_public`](Package-mq3-audio-snd-public-665719639.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-audio-snd-public-declarationnames-function-declarationnames-src-mq3-audio-snd-public-ml-512607472"></a>
### declarationNames

```ml
function declarationNames()
```

List the 22 names in audio.snd_public.declarationNames, beginning with `S_Init`, `S_Shutdown`, `S_StartSound`, `S_StartLocalSound`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_public.ml#L6)

<a id="function-function-mq3-audio-snd-public-soundcommandkind-function-soundcommandkind-name-src-mq3-audio-snd-public-ml-1413523957"></a>
### soundCommandKind

```ml
function soundCommandKind(name)
```

Compute sound command kind in audio.snd_public; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(names[index] == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_public.ml#L17)

<a id="function-function-mq3-audio-snd-public-validentity-function-validentity-entity-src-mq3-audio-snd-public-ml-2113154263"></a>
### validEntity

```ml
function validEntity(entity)
```

Compute audio.snd_public.validEntity as `((entity >= 0) and (entity < 1024))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Entity used in `(entity >= 0)` and `(entity < 1024)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_public.ml#L14)

<a id="function-function-mq3-audio-snd-public-validrawformat-function-validrawformat-rate-width-channels-src-mq3-audio-snd-public-ml-719935388"></a>
### validRawFormat

```ml
function validRawFormat(rate, width, channels)
```

Compute audio.snd_public.validRawFormat as `(((rate > 0) and ((width == 1) or (width == 2))) and ((channels == 1) or (channels == 2)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Rate used in `(rate > 0)` and `((rate > 0) and ((width == 1) or (width == 2)))`. |
| `width` | `dynamic` | — | Width used in `(width == 1)` and `(width == 2)`. |
| `channels` | `dynamic` | — | Channels used in `(channels == 1)` and `(channels == 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_public.ml#L11)
