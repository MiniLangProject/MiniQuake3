# `mq3.client.cgame_particles.Particle`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-particles-ml-1614063868.md)

<a id="struct-struct-mq3-client-cgame-particles-particle-struct-particle-src-mq3-client-cgame-particles-ml-1388997115"></a>
## Particle

```ml
struct Particle
```

Stores client game particles particle record, including `id`, `active`, `time`, `endtime`, `org`, `vel` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L63)

## Members

<a id="field-field-mq3-client-cgame-particles-particle-accel-accel-src-mq3-client-cgame-particles-ml-506144195"></a>
### accel

```ml
accel
```

When constructing this record, `newParticle` supplies `zero3()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L77)

<a id="field-field-mq3-client-cgame-particles-particle-accumroll-accumroll-src-mq3-client-cgame-particles-ml-470045411"></a>
### accumroll

```ml
accumroll
```

When constructing this record, `newParticle` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L115)

<a id="field-field-mq3-client-cgame-particles-particle-active-active-src-mq3-client-cgame-particles-ml-868377283"></a>
### active

```ml
active
```

When constructing this record, `newParticle` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L67)

<a id="field-field-mq3-client-cgame-particles-particle-alpha-alpha-src-mq3-client-cgame-particles-ml-1847474059"></a>
### alpha

```ml
alpha
```

Opacity or alpha modulation applied while drawing or fading the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L83)

<a id="field-field-mq3-client-cgame-particles-particle-alphavel-alphavel-src-mq3-client-cgame-particles-ml-181905025"></a>
### alphavel

```ml
alphavel
```

When constructing this record, `newParticle` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L85)

<a id="field-field-mq3-client-cgame-particles-particle-color-color-src-mq3-client-cgame-particles-ml-2011195263"></a>
### color

```ml
color
```

Particle color-mode selector, including blood-red, gray, and emissive-fade behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L79)

<a id="field-field-mq3-client-cgame-particles-particle-colorvel-colorvel-src-mq3-client-cgame-particles-ml-2049148483"></a>
### colorvel

```ml
colorvel
```

When constructing this record, `newParticle` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L81)

<a id="field-field-mq3-client-cgame-particles-particle-endheight-endheight-src-mq3-client-cgame-particles-ml-332002595"></a>
### endheight

```ml
endheight
```

Target particle height reached at the end of its lifetime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L95)

<a id="field-field-mq3-client-cgame-particles-particle-endtime-endtime-src-mq3-client-cgame-particles-ml-1735941743"></a>
### endtime

```ml
endtime
```

When constructing this record, `newParticle` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L71)

<a id="field-field-mq3-client-cgame-particles-particle-endwidth-endwidth-src-mq3-client-cgame-particles-ml-1383585205"></a>
### endwidth

```ml
endwidth
```

Target particle width reached at the end of its lifetime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L97)

<a id="field-field-mq3-client-cgame-particles-particle-finish-finish-src-mq3-client-cgame-particles-ml-724887205"></a>
### finish

```ml
finish
```

When constructing this record, `newParticle` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L101)

<a id="field-field-mq3-client-cgame-particles-particle-height-height-src-mq3-client-cgame-particles-ml-1384874601"></a>
### height

```ml
height
```

Initial vertical half-size of the particle quad in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L91)

<a id="field-field-mq3-client-cgame-particles-particle-id-id-src-mq3-client-cgame-particles-ml-1648783981"></a>
### id

```ml
id
```

Stable effect identifier used to track or replace this projectile, particle, or mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L65)

<a id="field-field-mq3-client-cgame-particles-particle-link-link-src-mq3-client-cgame-particles-ml-241945295"></a>
### link

```ml
link
```

When constructing this record, `newParticle` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L109)

<a id="field-field-mq3-client-cgame-particles-particle-org-org-src-mq3-client-cgame-particles-ml-597313259"></a>
### org

```ml
org
```

When constructing this record, `newParticle` supplies `zero3()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L73)

<a id="field-field-mq3-client-cgame-particles-particle-roll-roll-src-mq3-client-cgame-particles-ml-1374200697"></a>
### roll

```ml
roll
```

When constructing this record, `newParticle` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L113)

<a id="field-field-mq3-client-cgame-particles-particle-rotate-rotate-src-mq3-client-cgame-particles-ml-1752562425"></a>
### rotate

```ml
rotate
```

When constructing this record, `newParticle` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L105)

<a id="field-field-mq3-client-cgame-particles-particle-shader-shader-src-mq3-client-cgame-particles-ml-2017549553"></a>
### shader

```ml
shader
```

Particle material name, updated to the selected frame name for an animated particle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L89)

<a id="field-field-mq3-client-cgame-particles-particle-shaderanim-shaderanim-src-mq3-client-cgame-particles-ml-1883543243"></a>
### shaderAnim

```ml
shaderAnim
```

When constructing this record, `newParticle` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L111)

<a id="field-field-mq3-client-cgame-particles-particle-snum-snum-src-mq3-client-cgame-particles-ml-1588940969"></a>
### snum

```ml
snum
```

When constructing this record, `newParticle` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L107)

<a id="field-field-mq3-client-cgame-particles-particle-start-start-src-mq3-client-cgame-particles-ml-179264307"></a>
### start

```ml
start
```

When constructing this record, `newParticle` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L99)

<a id="field-field-mq3-client-cgame-particles-particle-startfade-startfade-src-mq3-client-cgame-particles-ml-242409443"></a>
### startfade

```ml
startfade
```

When constructing this record, `newParticle` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L103)

<a id="field-field-mq3-client-cgame-particles-particle-time-time-src-mq3-client-cgame-particles-ml-739129501"></a>
### time

```ml
time
```

Client timestamp used as the creation or update reference for this temporary visual effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L69)

<a id="field-field-mq3-client-cgame-particles-particle-type-type-src-mq3-client-cgame-particles-ml-522537983"></a>
### type

```ml
type
```

When constructing this record, `newParticle` supplies `P_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L87)

<a id="field-field-mq3-client-cgame-particles-particle-vel-vel-src-mq3-client-cgame-particles-ml-29994575"></a>
### vel

```ml
vel
```

When constructing this record, `newParticle` supplies `zero3()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L75)

<a id="field-field-mq3-client-cgame-particles-particle-width-width-src-mq3-client-cgame-particles-ml-1742213031"></a>
### width

```ml
width
```

Initial horizontal half-size of the particle quad in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L93)
