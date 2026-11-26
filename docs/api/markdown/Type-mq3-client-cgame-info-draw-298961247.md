# `mq3.client.cgame_info.Draw`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-info-ml-1413900769.md)

<a id="struct-struct-mq3-client-cgame-info-draw-struct-draw-src-mq3-client-cgame-info-ml-173995599"></a>
## Draw

```ml
struct Draw
```

Stores client game info draw record, including `kind`, `x`, `y`, `width`, `height`, `text` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L48)

## Members

<a id="field-field-mq3-client-cgame-info-draw-asset-asset-src-mq3-client-cgame-info-ml-1178892841"></a>
### asset

```ml
asset
```

When constructing this record, `drawLoadingIcons` supplies `handle` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L62)

<a id="field-field-mq3-client-cgame-info-draw-height-height-src-mq3-client-cgame-info-ml-806122535"></a>
### height

```ml
height
```

Height of the loading-screen image or detail overlay in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L58)

<a id="field-field-mq3-client-cgame-info-draw-kind-kind-src-mq3-client-cgame-info-ml-1191082189"></a>
### kind

```ml
kind
```

Drawing primitive or presentation category selecting how this record is rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L50)

<a id="field-field-mq3-client-cgame-info-draw-text-text-src-mq3-client-cgame-info-ml-1603546607"></a>
### text

```ml
text
```

Status or information string drawn on the map-loading screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L60)

<a id="field-field-mq3-client-cgame-info-draw-width-width-src-mq3-client-cgame-info-ml-596196557"></a>
### width

```ml
width
```

Width of the loading-screen image or detail overlay in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L56)

<a id="field-field-mq3-client-cgame-info-draw-x-x-src-mq3-client-cgame-info-ml-373546241"></a>
### x

```ml
x
```

Horizontal coordinate of a loading-information drawing command in the virtual screen layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L52)

<a id="field-field-mq3-client-cgame-info-draw-y-y-src-mq3-client-cgame-info-ml-2145411605"></a>
### y

```ml
y
```

Vertical coordinate of a loading-information drawing command in the virtual screen layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L54)
