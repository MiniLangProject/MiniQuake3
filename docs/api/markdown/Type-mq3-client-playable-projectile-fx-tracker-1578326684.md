# `mq3.client.playable_projectile_fx.Tracker`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-fx-ml-1498990564.md)

<a id="struct-struct-mq3-client-playable-projectile-fx-tracker-struct-tracker-src-mq3-client-playable-projectile-fx-ml-2038462419"></a>
## Tracker

```ml
struct Tracker
```

Stores playable projectile fx tracker record, including `entityId`, `style`, `position`, `sampledAt`, `nextPuffAt`, `seenAt`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L76)

## Members

<a id="field-field-mq3-client-playable-projectile-fx-tracker-entityid-entityid-src-mq3-client-playable-projectile-fx-ml-1389004457"></a>
### entityId

```ml
entityId
```

When constructing this record, `sampleFlight` supplies `snapshot.entityId` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L78)

<a id="field-field-mq3-client-playable-projectile-fx-tracker-nextpuffat-nextpuffat-src-mq3-client-playable-projectile-fx-ml-1114792011"></a>
### nextPuffAt

```ml
nextPuffAt
```

When constructing this record, `sampleFlight` supplies `next` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L86)

<a id="field-field-mq3-client-playable-projectile-fx-tracker-position-position-src-mq3-client-playable-projectile-fx-ml-702668087"></a>
### position

```ml
position
```

When constructing this record, `sampleFlight` supplies `copy3(snapshot.position)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L82)

<a id="field-field-mq3-client-playable-projectile-fx-tracker-sampledat-sampledat-src-mq3-client-playable-projectile-fx-ml-845137989"></a>
### sampledAt

```ml
sampledAt
```

When constructing this record, `sampleFlight` supplies `snapshot.eventAt` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L84)

<a id="field-field-mq3-client-playable-projectile-fx-tracker-seenat-seenat-src-mq3-client-playable-projectile-fx-ml-2097787601"></a>
### seenAt

```ml
seenAt
```

When constructing this record, `sampleFlight` supplies `now` for this member. Used by `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L89)

<a id="field-field-mq3-client-playable-projectile-fx-tracker-style-style-src-mq3-client-playable-projectile-fx-ml-519921085"></a>
### style

```ml
style
```

Last tracked projectile style, used when generating and continuing its smoke trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L80)
