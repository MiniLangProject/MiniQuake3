# `mq3.client.playable_effects.ShotEffect`

[Home](README.md) · [Source file](File-src-mq3-client-playable-effects-ml-1583408352.md)

<a id="struct-struct-mq3-client-playable-effects-shoteffect-struct-shoteffect-src-mq3-client-playable-effects-ml-1083324365"></a>
## ShotEffect

```ml
struct ShotEffect
```

Stores playable effects shot effect record, including `startPoint`, `impactPoint`, `bornAt`, `expiresAt`, `key`, `classname` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L41)

## Members

<a id="field-field-mq3-client-playable-effects-shoteffect-bornat-bornat-src-mq3-client-playable-effects-ml-374872394"></a>
### bornAt

```ml
bornAt
```

When constructing this record, `shot` supplies `nowMilliseconds` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L47)

<a id="field-field-mq3-client-playable-effects-shoteffect-classname-classname-src-mq3-client-playable-effects-ml-1944673090"></a>
### classname

```ml
classname
```

Weapon classname retained with a shot effect to select its hit-feedback appearance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L54)

<a id="field-field-mq3-client-playable-effects-shoteffect-expiresat-expiresat-src-mq3-client-playable-effects-ml-226753286"></a>
### expiresAt

```ml
expiresAt
```

When constructing this record, `shot` supplies `nowMilliseconds+durationMilliseconds` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L50)

<a id="field-field-mq3-client-playable-effects-shoteffect-impactpoint-impactpoint-src-mq3-client-playable-effects-ml-707567266"></a>
### impactPoint

```ml
impactPoint
```

When constructing this record, `shot` supplies `impactPoint` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L45)

<a id="field-field-mq3-client-playable-effects-shoteffect-key-key-src-mq3-client-playable-effects-ml-694802682"></a>
### key

```ml
key
```

When constructing this record, `shot` supplies `nowMilliseconds` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L52)

<a id="field-field-mq3-client-playable-effects-shoteffect-normal-normal-src-mq3-client-playable-effects-ml-757076708"></a>
### normal

```ml
normal
```

Impact-surface normal retained with the shot-feedback effect for decal and hit presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L56)

<a id="field-field-mq3-client-playable-effects-shoteffect-startpoint-startpoint-src-mq3-client-playable-effects-ml-493761282"></a>
### startPoint

```ml
startPoint
```

When constructing this record, `shot` supplies `startPoint` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L43)

<a id="field-field-mq3-client-playable-effects-shoteffect-worldhit-worldhit-src-mq3-client-playable-effects-ml-1796272792"></a>
### worldHit

```ml
worldHit
```

When constructing this record, `shot` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L58)
