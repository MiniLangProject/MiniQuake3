# `mq3.renderer.tr_types.Refdef`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-types-ml-1757535937.md)

<a id="struct-struct-mq3-renderer-tr-types-refdef-struct-refdef-src-mq3-renderer-tr-types-ml-1479809895"></a>
## Refdef

```ml
struct Refdef
```

Data record for `mq3.renderer.tr_types.Refdef`; groups `x`, `y`, `width`, `height`, `fov_x`, `fov_y`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L148)

## Members

<a id="field-field-mq3-renderer-tr-types-refdef-areamask-areamask-src-mq3-renderer-tr-types-ml-1053650253"></a>
### areamask

```ml
areamask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L170)

<a id="field-field-mq3-renderer-tr-types-refdef-fov-x-fov-x-src-mq3-renderer-tr-types-ml-837579539"></a>
### fov_x

```ml
fov_x
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L158)

<a id="field-field-mq3-renderer-tr-types-refdef-fov-y-fov-y-src-mq3-renderer-tr-types-ml-727277279"></a>
### fov_y

```ml
fov_y
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L160)

<a id="field-field-mq3-renderer-tr-types-refdef-height-height-src-mq3-renderer-tr-types-ml-62300349"></a>
### height

```ml
height
```

Height in pixels of the viewport supplied through the public renderer interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L156)

<a id="field-field-mq3-renderer-tr-types-refdef-rdflags-rdflags-src-mq3-renderer-tr-types-ml-958119751"></a>
### rdflags

```ml
rdflags
```

Bit mask of view-level rendering options such as no-world or hyperspace rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L168)

<a id="field-field-mq3-renderer-tr-types-refdef-text-text-src-mq3-renderer-tr-types-ml-1925947645"></a>
### text

```ml
text
```

Strings made available to deform-text shader stages for this view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L172)

<a id="field-field-mq3-renderer-tr-types-refdef-time-time-src-mq3-renderer-tr-types-ml-1206019653"></a>
### time

```ml
time
```

Scene timestamp in milliseconds supplied through the public renderer view definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L166)

<a id="field-field-mq3-renderer-tr-types-refdef-viewaxis-viewaxis-src-mq3-renderer-tr-types-ml-1674565707"></a>
### viewaxis

```ml
viewaxis
```

Camera orientation represented by three basis vectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L164)

<a id="field-field-mq3-renderer-tr-types-refdef-vieworg-vieworg-src-mq3-renderer-tr-types-ml-386591831"></a>
### vieworg

```ml
vieworg
```

Camera origin in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L162)

<a id="field-field-mq3-renderer-tr-types-refdef-width-width-src-mq3-renderer-tr-types-ml-1439186015"></a>
### width

```ml
width
```

Width in pixels of the viewport supplied through the public renderer interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L154)

<a id="field-field-mq3-renderer-tr-types-refdef-x-x-src-mq3-renderer-tr-types-ml-1959940987"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L150)

<a id="field-field-mq3-renderer-tr-types-refdef-y-y-src-mq3-renderer-tr-types-ml-1533250711"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L152)
