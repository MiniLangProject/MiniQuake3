# `mq3.client.cgame_particles.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-particles-ml-1614063868.md)

<a id="struct-struct-mq3-client-cgame-particles-state-struct-state-src-mq3-client-cgame-particles-ml-443402559"></a>
## State

```ml
struct State
```

Stores client game particles state, including `capacity`, `particles`, `free`, `active`, `time`, `oldtime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L152)

## Members

<a id="field-field-mq3-client-cgame-particles-state-actions-actions-src-mq3-client-cgame-particles-ml-144363848"></a>
### actions

```ml
actions
```

Host requests queued while registering particle media and emitting particle geometry, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L201)

<a id="field-field-mq3-client-cgame-particles-state-active-active-src-mq3-client-cgame-particles-ml-1245329224"></a>
### active

```ml
active
```

Indices of allocated particles that still participate in simulation and rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L162)

<a id="field-field-mq3-client-cgame-particles-state-capacity-capacity-src-mq3-client-cgame-particles-ml-869866428"></a>
### capacity

```ml
capacity
```

Maximum number of entries or allocation units supported by the bounded storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L154)

<a id="field-field-mq3-client-cgame-particles-state-dropped-dropped-src-mq3-client-cgame-particles-ml-908449940"></a>
### dropped

```ml
dropped
```

When constructing this record, `create` supplies `0` for this member. Used by `allocParticle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L216)

<a id="field-field-mq3-client-cgame-particles-state-errors-errors-src-mq3-client-cgame-particles-ml-973870726"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L218)

<a id="field-field-mq3-client-cgame-particles-state-free-free-src-mq3-client-cgame-particles-ml-1951813088"></a>
### free

```ml
free
```

When constructing this record, `create` supplies an empty list for this member. Used by `clearParticles` and `allocParticle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L160)

<a id="field-field-mq3-client-cgame-particles-state-freed-freed-src-mq3-client-cgame-particles-ml-1811021444"></a>
### freed

```ml
freed
```

When constructing this record, `create` supplies `0` for this member. Used by `freeParticle` and `addParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L213)

<a id="field-field-mq3-client-cgame-particles-state-initialized-initialized-src-mq3-client-cgame-particles-ml-580876356"></a>
### initialized

```ml
initialized
```

True after the particle pool, active/free lists, and simulation timing have been reset for use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L171)

<a id="field-field-mq3-client-cgame-particles-state-oldtime-oldtime-src-mq3-client-cgame-particles-ml-516802656"></a>
### oldtime

```ml
oldtime
```

When constructing this record, `create` supplies `0` for this member. Used by `clearParticles` and `addParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L167)

<a id="field-field-mq3-client-cgame-particles-state-particles-particles-src-mq3-client-cgame-particles-ml-1686419964"></a>
### particles

```ml
particles
```

When constructing this record, `create` supplies an empty list for this member. Used by `clearParticles` and `allocParticle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L157)

<a id="field-field-mq3-client-cgame-particles-state-ragepro-ragepro-src-mq3-client-cgame-particles-ml-1124742468"></a>
### ragePro

```ml
ragePro
```

When constructing this record, `create` supplies `false` for this member. Used by `addParticleToScene` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L189)

<a id="field-field-mq3-client-cgame-particles-state-randomat-randomat-src-mq3-client-cgame-particles-ml-1884691172"></a>
### randomAt

```ml
randomAt
```

When constructing this record, `create` supplies `0` for this member. Used by `setRandomInts` and `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L198)

<a id="field-field-mq3-client-cgame-particles-state-randomints-randomints-src-mq3-client-cgame-particles-ml-733621190"></a>
### randomInts

```ml
randomInts
```

When constructing this record, `create` supplies an empty list for this member. Used by `setRandomInts` and `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L195)

<a id="field-field-mq3-client-cgame-particles-state-randomseed-randomseed-src-mq3-client-cgame-particles-ml-115615296"></a>
### randomSeed

```ml
randomSeed
```

When constructing this record, `create` supplies `0x92` for this member. Used by `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L192)

<a id="field-field-mq3-client-cgame-particles-state-registrations-registrations-src-mq3-client-cgame-particles-ml-465247964"></a>
### registrations

```ml
registrations
```

When constructing this record, `create` supplies an empty list for this member. Used by `clearParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L204)

<a id="field-field-mq3-client-cgame-particles-state-rendered-rendered-src-mq3-client-cgame-particles-ml-648263554"></a>
### rendered

```ml
rendered
```

When constructing this record, `create` supplies `0` for this member. Used by `action` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L207)

<a id="field-field-mq3-client-cgame-particles-state-retailactive-retailactive-src-mq3-client-cgame-particles-ml-1184579658"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the CGame particle simulation, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L186)

<a id="field-field-mq3-client-cgame-particles-state-roll-roll-src-mq3-client-cgame-particles-ml-1838067378"></a>
### roll

```ml
roll
```

When constructing this record, `create` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L169)

<a id="field-field-mq3-client-cgame-particles-state-suppressed-suppressed-src-mq3-client-cgame-particles-ml-1465610024"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while registering particle media and emitting particle geometry because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L210)

<a id="field-field-mq3-client-cgame-particles-state-time-time-src-mq3-client-cgame-particles-ml-1599608590"></a>
### time

```ml
time
```

Current client-game time in milliseconds used to advance particle motion, animation, and lifetime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L164)

<a id="field-field-mq3-client-cgame-particles-state-vforward-vforward-src-mq3-client-cgame-particles-ml-1920735438"></a>
### vforward

```ml
vforward
```

When constructing this record, `create` supplies `[1.0,0.0,0.0]` for this member. Used by `addParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L177)

<a id="field-field-mq3-client-cgame-particles-state-vieworg-vieworg-src-mq3-client-cgame-particles-ml-1721554872"></a>
### vieworg

```ml
vieworg
```

When constructing this record, `create` supplies `zero3()` for this member. Used by `addParticleToScene` and `addParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L174)

<a id="field-field-mq3-client-cgame-particles-state-vright-vright-src-mq3-client-cgame-particles-ml-1239717020"></a>
### vright

```ml
vright
```

When constructing this record, `create` supplies `[0.0,1.0,0.0]` for this member. Used by `addParticleToScene` and `addParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L180)

<a id="field-field-mq3-client-cgame-particles-state-vup-vup-src-mq3-client-cgame-particles-ml-18022072"></a>
### vup

```ml
vup
```

When constructing this record, `create` supplies `[0.0,0.0,1.0]` for this member. Used by `addParticleToScene` and `addParticles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L183)
