# `mq3.client.cg_local.CEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-centity-struct-centity-src-mq3-client-cg-local-ml-73740921"></a>
## CEntity

```ml
struct CEntity
```

Stores client game local c entity record, including `currentState`, `nextState`, `interpolate`, `currentValid`, `muzzleFlashTime`, `previousEvent` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L238)

## Members

<a id="field-field-mq3-client-cg-local-centity-beamend-beamend-src-mq3-client-cg-local-ml-433235971"></a>
### beamEnd

```ml
beamEnd
```

World-space endpoint used when rendering the entity's beam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L278)

<a id="field-field-mq3-client-cg-local-centity-currentstate-currentstate-src-mq3-client-cg-local-ml-1137206627"></a>
### currentState

```ml
currentState
```

Entity state received in the current server snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L240)

<a id="field-field-mq3-client-cg-local-centity-currentvalid-currentvalid-src-mq3-client-cg-local-ml-2065628161"></a>
### currentValid

```ml
currentValid
```

True when the current snapshot contains a valid state for this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L246)

<a id="field-field-mq3-client-cg-local-centity-dusttrailtime-dusttrailtime-src-mq3-client-cg-local-ml-1078784647"></a>
### dustTrailTime

```ml
dustTrailTime
```

Last time a running player's ground-contact dust effect was emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L256)

<a id="field-field-mq3-client-cg-local-centity-errorangles-errorangles-src-mq3-client-cg-local-ml-750189739"></a>
### errorAngles

```ml
errorAngles
```

Angular correction retained for smoothing a prediction error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L270)

<a id="field-field-mq3-client-cg-local-centity-errororigin-errororigin-src-mq3-client-cg-local-ml-40004827"></a>
### errorOrigin

```ml
errorOrigin
```

Positional correction retained for smoothing a prediction error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L268)

<a id="field-field-mq3-client-cg-local-centity-errortime-errortime-src-mq3-client-cg-local-ml-879289103"></a>
### errorTime

```ml
errorTime
```

Timestamp from which prediction-error smoothing decays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L266)

<a id="field-field-mq3-client-cg-local-centity-extrapolated-extrapolated-src-mq3-client-cg-local-ml-1833832185"></a>
### extrapolated

```ml
extrapolated
```

True when the entity's transform was extrapolated rather than interpolated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L272)

<a id="field-field-mq3-client-cg-local-centity-interpolate-interpolate-src-mq3-client-cg-local-ml-1869050539"></a>
### interpolate

```ml
interpolate
```

True when a valid following snapshot permits interpolation of this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L244)

<a id="field-field-mq3-client-cg-local-centity-lerpangles-lerpangles-src-mq3-client-cg-local-ml-87623285"></a>
### lerpAngles

```ml
lerpAngles
```

Entity orientation after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L282)

<a id="field-field-mq3-client-cg-local-centity-lerporigin-lerporigin-src-mq3-client-cg-local-ml-1938659365"></a>
### lerpOrigin

```ml
lerpOrigin
```

Entity position after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L280)

<a id="field-field-mq3-client-cg-local-centity-misctime-misctime-src-mq3-client-cg-local-ml-38061225"></a>
### miscTime

```ml
miscTime
```

Compatibility member corresponding to native `centity_t.miscTime`; the original declaration is `int miscTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L259)

<a id="field-field-mq3-client-cg-local-centity-muzzleflashtime-muzzleflashtime-src-mq3-client-cg-local-ml-384418483"></a>
### muzzleFlashTime

```ml
muzzleFlashTime
```

Client timestamp at which the entity's muzzle-flash effect began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L248)

<a id="field-field-mq3-client-cg-local-centity-nextstate-nextstate-src-mq3-client-cg-local-ml-1967249579"></a>
### nextState

```ml
nextState
```

Entity state from the following snapshot, used when interpolation is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L242)

<a id="field-field-mq3-client-cg-local-centity-pe-pe-src-mq3-client-cg-local-ml-1452312909"></a>
### pe

```ml
pe
```

Compatibility member corresponding to native `centity_t.pe`; the original declaration is `playerEntity_t pe`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L264)

<a id="field-field-mq3-client-cg-local-centity-previousevent-previousevent-src-mq3-client-cg-local-ml-18054391"></a>
### previousEvent

```ml
previousEvent
```

Last processed entity event, retained to avoid replaying the same event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L250)

<a id="field-field-mq3-client-cg-local-centity-rawangles-rawangles-src-mq3-client-cg-local-ml-410410187"></a>
### rawAngles

```ml
rawAngles
```

Unsmoothened entity orientation before prediction-error correction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L276)

<a id="field-field-mq3-client-cg-local-centity-raworigin-raworigin-src-mq3-client-cg-local-ml-1732167139"></a>
### rawOrigin

```ml
rawOrigin
```

Unsmoothened entity position before prediction-error correction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L274)

<a id="field-field-mq3-client-cg-local-centity-snapshottime-snapshottime-src-mq3-client-cg-local-ml-424513225"></a>
### snapShotTime

```ml
snapShotTime
```

Timestamp of the most recent snapshot containing this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L261)

<a id="field-field-mq3-client-cg-local-centity-teleportflag-teleportflag-src-mq3-client-cg-local-ml-1163151493"></a>
### teleportFlag

```ml
teleportFlag
```

Teleport-state bit retained to detect discontinuities that must not be interpolated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L252)

<a id="field-field-mq3-client-cg-local-centity-trailtime-trailtime-src-mq3-client-cg-local-ml-331743419"></a>
### trailTime

```ml
trailTime
```

Last trail-emission time, allowing missile trails to catch up across dropped packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L254)
