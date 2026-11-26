# `mq3.client.playable_projectile_fx.Profile`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-fx-ml-1498990564.md)

<a id="struct-struct-mq3-client-playable-projectile-fx-profile-struct-profile-src-mq3-client-playable-projectile-fx-ml-1279634117"></a>
## Profile

```ml
struct Profile
```

Stores playable projectile fx profile record, including `smoke`, `radius`, `lifetime`, `flyingLight`, `impactLight`, `impactLifetime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L38)

## Members

<a id="field-field-mq3-client-playable-projectile-fx-profile-blue-blue-src-mq3-client-playable-projectile-fx-ml-219200914"></a>
### blue

```ml
blue
```

Blue color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L56)

<a id="field-field-mq3-client-playable-projectile-fx-profile-flyinglight-flyinglight-src-mq3-client-playable-projectile-fx-ml-26166526"></a>
### flyingLight

```ml
flyingLight
```

When constructing this record, `profile` supplies `ROCKET_DLIGHT_RADIUS` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L46)

<a id="field-field-mq3-client-playable-projectile-fx-profile-green-green-src-mq3-client-playable-projectile-fx-ml-1398510074"></a>
### green

```ml
green
```

Green color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L54)

<a id="field-field-mq3-client-playable-projectile-fx-profile-impactlifetime-impactlifetime-src-mq3-client-playable-projectile-fx-ml-663575440"></a>
### impactLifetime

```ml
impactLifetime
```

When constructing this record, `profile` supplies `1000` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L50)

<a id="field-field-mq3-client-playable-projectile-fx-profile-impactlight-impactlight-src-mq3-client-playable-projectile-fx-ml-306116762"></a>
### impactLight

```ml
impactLight
```

When constructing this record, `profile` supplies `EXPLOSION_DLIGHT_RADIUS` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L48)

<a id="field-field-mq3-client-playable-projectile-fx-profile-lifetime-lifetime-src-mq3-client-playable-projectile-fx-ml-1532197460"></a>
### lifetime

```ml
lifetime
```

When constructing this record, `profile` supplies `ROCKET_TRAIL_MILLISECONDS` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L44)

<a id="field-field-mq3-client-playable-projectile-fx-profile-radius-radius-src-mq3-client-playable-projectile-fx-ml-1594434438"></a>
### radius

```ml
radius
```

Initial world-space radius assigned to trail puffs for this projectile style.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L42)

<a id="field-field-mq3-client-playable-projectile-fx-profile-red-red-src-mq3-client-playable-projectile-fx-ml-2100225958"></a>
### red

```ml
red
```

Red color component used by this drawing or effect record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L52)

<a id="field-field-mq3-client-playable-projectile-fx-profile-smoke-smoke-src-mq3-client-playable-projectile-fx-ml-620128818"></a>
### smoke

```ml
smoke
```

When constructing this record, `profile` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L40)
