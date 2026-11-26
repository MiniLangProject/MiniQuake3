# `mq3.audio.qvm_sound_assets.Catalog`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-sound-assets-ml-1587569282.md)

<a id="struct-struct-mq3-audio-qvm-sound-assets-catalog-struct-catalog-src-mq3-audio-qvm-sound-assets-ml-1557655097"></a>
## Catalog

```ml
struct Catalog
```

Catalog record for audio.qvm_sound_assets, containing `archive`, `clips`, `missing`, `registered`, `scanned`, `handles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L38)

## Members

<a id="field-field-mq3-audio-qvm-sound-assets-catalog-archive-archive-src-mq3-audio-qvm-sound-assets-ml-1306598268"></a>
### archive

```ml
archive
```

PK3 archive used to read registered sound assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L40)

<a id="field-field-mq3-audio-qvm-sound-assets-catalog-clips-clips-src-mq3-audio-qvm-sound-assets-ml-867526104"></a>
### clips

```ml
clips
```

Successfully loaded clips indexed by their registered handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L42)

<a id="field-field-mq3-audio-qvm-sound-assets-catalog-handles-handles-src-mq3-audio-qvm-sound-assets-ml-60401288"></a>
### handles

```ml
handles
```

Sound handles corresponding to the stored clip records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L50)

<a id="field-field-mq3-audio-qvm-sound-assets-catalog-missing-missing-src-mq3-audio-qvm-sound-assets-ml-1235128084"></a>
### missing

```ml
missing
```

Assets that could not be loaded, together with their failure reasons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L44)

<a id="field-field-mq3-audio-qvm-sound-assets-catalog-registered-registered-src-mq3-audio-qvm-sound-assets-ml-185321116"></a>
### registered

```ml
registered
```

Number of sound registrations processed by the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L46)

<a id="field-field-mq3-audio-qvm-sound-assets-catalog-scanned-scanned-src-mq3-audio-qvm-sound-assets-ml-396118076"></a>
### scanned

```ml
scanned
```

Number of archive or registration entries examined while building the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L48)
