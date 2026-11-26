# `mq3.client.cgame_weapons.Boundary`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-weapons-ml-1641558282.md)

<a id="struct-struct-mq3-client-cgame-weapons-boundary-struct-boundary-src-mq3-client-cgame-weapons-ml-482492771"></a>
## Boundary

```ml
struct Boundary
```

Stores client game weapons boundary record, including `boundary`, `kind`, `weapon`, `entity`, `origin`, `finish` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L91)

## Members

<a id="field-field-mq3-client-cgame-weapons-boundary-boundary-boundary-src-mq3-client-cgame-weapons-ml-1470933223"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while registering and presenting weapon models, firing sounds, and impact effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L94)

<a id="field-field-mq3-client-cgame-weapons-boundary-color-color-src-mq3-client-cgame-weapons-ml-1432172803"></a>
### color

```ml
color
```

Color components carried by the weapon light, trail, or temporary-effect host request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L119)

<a id="field-field-mq3-client-cgame-weapons-boundary-dispatched-dispatched-src-mq3-client-cgame-weapons-ml-76577629"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while registering and presenting weapon models, firing sounds, and impact effects; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L125)

<a id="field-field-mq3-client-cgame-weapons-boundary-entity-entity-src-mq3-client-cgame-weapons-ml-984906801"></a>
### entity

```ml
entity
```

When constructing this record, `action` supplies `entityNum` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L101)

<a id="field-field-mq3-client-cgame-weapons-boundary-finish-finish-src-mq3-client-cgame-weapons-ml-1091852293"></a>
### finish

```ml
finish
```

When constructing this record, `action` supplies `copy3(finish)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L105)

<a id="field-field-mq3-client-cgame-weapons-boundary-kind-kind-src-mq3-client-cgame-weapons-ml-1895066103"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while registering and presenting weapon models, firing sounds, and impact effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L97)

<a id="field-field-mq3-client-cgame-weapons-boundary-light-light-src-mq3-client-cgame-weapons-ml-1176718651"></a>
### light

```ml
light
```

Dynamic-light intensity emitted by the local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L117)

<a id="field-field-mq3-client-cgame-weapons-boundary-model-model-src-mq3-client-cgame-weapons-ml-284491111"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L109)

<a id="field-field-mq3-client-cgame-weapons-boundary-origin-origin-src-mq3-client-cgame-weapons-ml-685657575"></a>
### origin

```ml
origin
```

World-space location supplied with the queued weapon sound, projectile, muzzle, or impact effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L103)

<a id="field-field-mq3-client-cgame-weapons-boundary-radius-radius-src-mq3-client-cgame-weapons-ml-1394784983"></a>
### radius

```ml
radius
```

World-space effect radius recorded for the weapon rendering or particle request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L115)

<a id="field-field-mq3-client-cgame-weapons-boundary-shader-shader-src-mq3-client-cgame-weapons-ml-1173223113"></a>
### shader

```ml
shader
```

Material reference carried by a weapon trail, impact, muzzle, or registration request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L111)

<a id="field-field-mq3-client-cgame-weapons-boundary-sound-sound-src-mq3-client-cgame-weapons-ml-711803651"></a>
### sound

```ml
sound
```

Sound resource carried by a weapon audio action at the host dispatch boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L113)

<a id="field-field-mq3-client-cgame-weapons-boundary-value-value-src-mq3-client-cgame-weapons-ml-1629006323"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while registering and presenting weapon models, firing sounds, and impact effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L122)

<a id="field-field-mq3-client-cgame-weapons-boundary-velocity-velocity-src-mq3-client-cgame-weapons-ml-640505593"></a>
### velocity

```ml
velocity
```

Linear rate of change of position used by movement or effect integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L107)

<a id="field-field-mq3-client-cgame-weapons-boundary-weapon-weapon-src-mq3-client-cgame-weapons-ml-1296750503"></a>
### weapon

```ml
weapon
```

Native weapon identifier whose model, sound, trail, or firing effect this host request concerns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L99)
