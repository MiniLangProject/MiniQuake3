# `mq3.client.cgame_particles.RenderAction`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-particles-ml-1614063868.md)

<a id="struct-struct-mq3-client-cgame-particles-renderaction-struct-renderaction-src-mq3-client-cgame-particles-ml-2036723435"></a>
## RenderAction

```ml
struct RenderAction
```

Stores client game particles render action record, including `boundary`, `kind`, `particle`, `shader`, `vertexCount`, `vertices` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L118)

## Members

<a id="field-field-mq3-client-cgame-particles-renderaction-alpha-alpha-src-mq3-client-cgame-particles-ml-1407993851"></a>
### alpha

```ml
alpha
```

Opacity or alpha modulation applied while drawing or fading the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L142)

<a id="field-field-mq3-client-cgame-particles-renderaction-boundary-boundary-src-mq3-client-cgame-particles-ml-139129587"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while registering particle media and emitting particle geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L121)

<a id="field-field-mq3-client-cgame-particles-renderaction-color-color-src-mq3-client-cgame-particles-ml-1228500783"></a>
### color

```ml
color
```

Evaluated RGB particle tint; opacity is stored separately in the alpha field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L144)

<a id="field-field-mq3-client-cgame-particles-renderaction-dispatched-dispatched-src-mq3-client-cgame-particles-ml-1504392389"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while registering particle media and emitting particle geometry; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L149)

<a id="field-field-mq3-client-cgame-particles-renderaction-frame-frame-src-mq3-client-cgame-particles-ml-718277631"></a>
### frame

```ml
frame
```

Zero-based image-sequence frame selected for an animated particle shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L146)

<a id="field-field-mq3-client-cgame-particles-renderaction-height-height-src-mq3-client-cgame-particles-ml-492449497"></a>
### height

```ml
height
```

Evaluated vertical half-size of the emitted particle quad in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L140)

<a id="field-field-mq3-client-cgame-particles-renderaction-kind-kind-src-mq3-client-cgame-particles-ml-423678163"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while registering particle media and emitting particle geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L124)

<a id="field-field-mq3-client-cgame-particles-renderaction-origin-origin-src-mq3-client-cgame-particles-ml-1123970787"></a>
### origin

```ml
origin
```

World-space center of the particle geometry being submitted to the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L136)

<a id="field-field-mq3-client-cgame-particles-renderaction-particle-particle-src-mq3-client-cgame-particles-ml-1907301523"></a>
### particle

```ml
particle
```

When constructing this record, `action` supplies `p.id` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L126)

<a id="field-field-mq3-client-cgame-particles-renderaction-shader-shader-src-mq3-client-cgame-particles-ml-875847649"></a>
### shader

```ml
shader
```

Resolved particle material name used for the emitted quad or triangle geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L128)

<a id="field-field-mq3-client-cgame-particles-renderaction-texcoords-texcoords-src-mq3-client-cgame-particles-ml-675202799"></a>
### texcoords

```ml
texcoords
```

When constructing this record, `action` supplies `texcoords` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L134)

<a id="field-field-mq3-client-cgame-particles-renderaction-vertexcount-vertexcount-src-mq3-client-cgame-particles-ml-1341776423"></a>
### vertexCount

```ml
vertexCount
```

When constructing this record, `action` supplies `len(vertices)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L130)

<a id="field-field-mq3-client-cgame-particles-renderaction-vertices-vertices-src-mq3-client-cgame-particles-ml-1969436437"></a>
### vertices

```ml
vertices
```

When constructing this record, `action` supplies `vertices` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L132)

<a id="field-field-mq3-client-cgame-particles-renderaction-width-width-src-mq3-client-cgame-particles-ml-642367639"></a>
### width

```ml
width
```

Evaluated horizontal half-size of the emitted particle quad in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L138)
