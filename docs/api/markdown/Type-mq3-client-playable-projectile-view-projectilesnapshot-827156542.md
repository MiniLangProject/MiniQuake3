# `mq3.client.playable_projectile_view.ProjectileSnapshot`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)

<a id="struct-struct-mq3-client-playable-projectile-view-projectilesnapshot-struct-projectilesnapshot-src-mq3-client-playable-projectile-view-ml-1607114191"></a>
## ProjectileSnapshot

```ml
struct ProjectileSnapshot
```

A gameplay system can create one of these directly from its current entity snapshot. Flying snapshots have no deadline; impact snapshots are half-open timed events in the interval [eventAt, expiresAt).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L35)

## Members

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-entityid-entityid-src-mq3-client-playable-projectile-view-ml-394828978"></a>
### entityId

```ml
entityId
```

When constructing this record, `snapshot` supplies `entityId` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L37)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-eventat-eventat-src-mq3-client-playable-projectile-view-ml-1212692466"></a>
### eventAt

```ml
eventAt
```

When constructing this record, `snapshot` supplies `eventAt` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L49)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-expiresat-expiresat-src-mq3-client-playable-projectile-view-ml-1106332538"></a>
### expiresAt

```ml
expiresAt
```

When constructing this record, `snapshot` supplies `expiresAt` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L51)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-normal-normal-src-mq3-client-playable-projectile-view-ml-677035928"></a>
### normal

```ml
normal
```

Direction or impact normal used to orient the fallback projectile effect's short line segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L45)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-position-position-src-mq3-client-playable-projectile-view-ml-1190221228"></a>
### position

```ml
position
```

When constructing this record, `snapshot` supplies `copyPoint(position)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L43)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-previousposition-previousposition-src-mq3-client-playable-projectile-view-ml-1155606370"></a>
### previousPosition

```ml
previousPosition
```

When constructing this record, `snapshot` supplies `copyPoint(previousPosition)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L41)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-state-state-src-mq3-client-playable-projectile-view-ml-831022262"></a>
### state

```ml
state
```

When constructing this record, `snapshot` supplies `state` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L47)

<a id="field-field-mq3-client-playable-projectile-view-projectilesnapshot-style-style-src-mq3-client-playable-projectile-view-ml-1134303494"></a>
### style

```ml
style
```

Projectile style used to choose the fallback effect's color and appearance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L39)
