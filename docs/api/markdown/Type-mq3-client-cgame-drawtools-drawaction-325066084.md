# `mq3.client.cgame_drawtools.DrawAction`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-drawtools-ml-249217190.md)

<a id="struct-struct-mq3-client-cgame-drawtools-drawaction-struct-drawaction-src-mq3-client-cgame-drawtools-ml-87771807"></a>
## DrawAction

```ml
struct DrawAction
```

Stores client game drawtools draw action record, including `kind`, `x`, `y`, `width`, `height`, `s1` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L61)

## Members

<a id="field-field-mq3-client-cgame-drawtools-drawaction-color-color-src-mq3-client-cgame-drawtools-ml-805034885"></a>
### color

```ml
color
```

Optional RGBA modulation copied into the low-level HUD drawing action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L85)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-dispatched-dispatched-src-mq3-client-cgame-drawtools-ml-1259257467"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while drawing scaled text, pictures, and rectangles for CGame; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L88)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-height-height-src-mq3-client-cgame-drawtools-ml-2145629799"></a>
### height

```ml
height
```

Destination rectangle height carried by the low-level HUD drawing action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L73)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-kind-kind-src-mq3-client-cgame-drawtools-ml-2001019553"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while drawing scaled text, pictures, and rectangles for CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L64)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-s1-s1-src-mq3-client-cgame-drawtools-ml-1301568337"></a>
### s1

```ml
s1
```

When constructing this record, `action` supplies `s1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L75)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-s2-s2-src-mq3-client-cgame-drawtools-ml-1721327415"></a>
### s2

```ml
s2
```

When constructing this record, `action` supplies `s2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L79)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-shader-shader-src-mq3-client-cgame-drawtools-ml-459393023"></a>
### shader

```ml
shader
```

Texture material passed to the HUD stretch-picture request; empty for a color-only action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L83)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-t1-t1-src-mq3-client-cgame-drawtools-ml-1821419419"></a>
### t1

```ml
t1
```

When constructing this record, `action` supplies `t1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L77)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-t2-t2-src-mq3-client-cgame-drawtools-ml-1770165249"></a>
### t2

```ml
t2
```

When constructing this record, `action` supplies `t2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L81)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-width-width-src-mq3-client-cgame-drawtools-ml-520410557"></a>
### width

```ml
width
```

Destination rectangle width carried by the low-level HUD drawing action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L71)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-x-x-src-mq3-client-cgame-drawtools-ml-995057"></a>
### x

```ml
x
```

Horizontal coordinate of a CGame text, image, or rectangle request in its drawing coordinate space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L67)

<a id="field-field-mq3-client-cgame-drawtools-drawaction-y-y-src-mq3-client-cgame-drawtools-ml-1211311869"></a>
### y

```ml
y
```

Vertical coordinate of a CGame text, image, or rectangle request in its drawing coordinate space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_drawtools.ml#L69)
