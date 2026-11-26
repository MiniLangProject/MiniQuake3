# `mq3.client.cgame_view.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-view-ml-1544499938.md)

<a id="struct-struct-mq3-client-cgame-view-state-struct-state-src-mq3-client-cgame-view-ml-1423171861"></a>
## State

```ml
struct State
```

Stores client game view state, including `time`, `oldTime`, `frameTime`, `demoPlayback`, `infoScreenText`, `snap` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L179)

## Members

<a id="field-field-mq3-client-cgame-view-state-actions-actions-src-mq3-client-cgame-view-ml-929665426"></a>
### actions

```ml
actions
```

Host requests queued while building the camera view and submitting scene-related work, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L365)

<a id="field-field-mq3-client-cgame-view-state-audio-audio-src-mq3-client-cgame-view-ml-439571158"></a>
### audio

```ml
audio
```

When constructing this record, `create` supplies an empty list for this member. Used by `boundary` and `clearBoundaries` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L371)

<a id="field-field-mq3-client-cgame-view-state-bobcycle-bobcycle-src-mq3-client-cgame-view-ml-747745352"></a>
### bobCycle

```ml
bobCycle
```

When constructing this record, `create` supplies `0` for this member. Used by `offsetFirstPersonView` and `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L279)

<a id="field-field-mq3-client-cgame-view-state-bobfracsin-bobfracsin-src-mq3-client-cgame-view-ml-600254328"></a>
### bobFracSin

```ml
bobFracSin
```

When constructing this record, `create` supplies `0.0` for this member. Used by `offsetFirstPersonView` and `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L282)

<a id="field-field-mq3-client-cgame-view-state-bobpitch-bobpitch-src-mq3-client-cgame-view-ml-898078324"></a>
### bobPitch

```ml
bobPitch
```

When constructing this record, `create` supplies `0.002` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L291)

<a id="field-field-mq3-client-cgame-view-state-bobroll-bobroll-src-mq3-client-cgame-view-ml-2087658058"></a>
### bobRoll

```ml
bobRoll
```

When constructing this record, `create` supplies `0.002` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L294)

<a id="field-field-mq3-client-cgame-view-state-bobup-bobup-src-mq3-client-cgame-view-ml-704917022"></a>
### bobUp

```ml
bobUp
```

When constructing this record, `create` supplies `0.005` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L297)

<a id="field-field-mq3-client-cgame-view-state-cameramode-cameramode-src-mq3-client-cgame-view-ml-2134572486"></a>
### cameraMode

```ml
cameraMode
```

When constructing this record, `create` supplies `false` for this member. Used by `offsetThirdPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L240)

<a id="field-field-mq3-client-cgame-view-state-cameraorbit-cameraorbit-src-mq3-client-cgame-view-ml-878271662"></a>
### cameraOrbit

```ml
cameraOrbit
```

When constructing this record, `create` supplies `0` for this member. Used by `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L243)

<a id="field-field-mq3-client-cgame-view-state-cameraorbitdelay-cameraorbitdelay-src-mq3-client-cgame-view-ml-377401886"></a>
### cameraOrbitDelay

```ml
cameraOrbitDelay
```

When constructing this record, `create` supplies `0` for this member. Used by `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L246)

<a id="field-field-mq3-client-cgame-view-state-clientframe-clientframe-src-mq3-client-cgame-view-ml-1870155942"></a>
### clientFrame

```ml
clientFrame
```

Client-frame counter incremented for each CGame frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L322)

<a id="field-field-mq3-client-cgame-view-state-contents-contents-src-mq3-client-cgame-view-ml-1968279254"></a>
### contents

```ml
contents
```

When constructing this record, `create` supplies `0` for this member. Used by `calcFov` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L220)

<a id="field-field-mq3-client-cgame-view-state-damagepitch-damagepitch-src-mq3-client-cgame-view-ml-748109970"></a>
### damagePitch

```ml
damagePitch
```

When constructing this record, `create` supplies `0.0` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L259)

<a id="field-field-mq3-client-cgame-view-state-damageroll-damageroll-src-mq3-client-cgame-view-ml-1547852534"></a>
### damageRoll

```ml
damageRoll
```

When constructing this record, `create` supplies `0.0` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L262)

<a id="field-field-mq3-client-cgame-view-state-damagetime-damagetime-src-mq3-client-cgame-view-ml-1922177246"></a>
### damageTime

```ml
damageTime
```

Timestamp used to fade the latest damage overlay or view-kick effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L256)

<a id="field-field-mq3-client-cgame-view-state-damagevalue-damagevalue-src-mq3-client-cgame-view-ml-1071013726"></a>
### damageValue

```ml
damageValue
```

Magnitude of the latest damage event used to scale view kick and indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L264)

<a id="field-field-mq3-client-cgame-view-state-damagex-damagex-src-mq3-client-cgame-view-ml-707393122"></a>
### damageX

```ml
damageX
```

Horizontal direction component of the latest damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L266)

<a id="field-field-mq3-client-cgame-view-state-damagey-damagey-src-mq3-client-cgame-view-ml-562540226"></a>
### damageY

```ml
damageY
```

Vertical direction component of the latest damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L268)

<a id="field-field-mq3-client-cgame-view-state-demoplayback-demoplayback-src-mq3-client-cgame-view-ml-536018514"></a>
### demoPlayback

```ml
demoPlayback
```

True when snapshots and commands are being read from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L188)

<a id="field-field-mq3-client-cgame-view-state-dmflags-dmflags-src-mq3-client-cgame-view-ml-1824935366"></a>
### dmflags

```ml
dmflags
```

When constructing this record, `create` supplies `0` for this member. Used by `calcFov` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L217)

<a id="field-field-mq3-client-cgame-view-state-duckchange-duckchange-src-mq3-client-cgame-view-ml-1422666168"></a>
### duckChange

```ml
duckChange
```

Eye-height displacement being smoothed after a crouch transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L301)

<a id="field-field-mq3-client-cgame-view-state-ducktime-ducktime-src-mq3-client-cgame-view-ml-383963262"></a>
### duckTime

```ml
duckTime
```

Client timestamp at which crouch-height smoothing began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L299)

<a id="field-field-mq3-client-cgame-view-state-emitted-emitted-src-mq3-client-cgame-view-ml-519525198"></a>
### emitted

```ml
emitted
```

When constructing this record, `create` supplies `0` for this member. Used by `boundary` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L377)

<a id="field-field-mq3-client-cgame-view-state-errordecay-errordecay-src-mq3-client-cgame-view-ml-572567894"></a>
### errorDecay

```ml
errorDecay
```

When constructing this record, `create` supplies `100.0` for this member. Used by `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L316)

<a id="field-field-mq3-client-cgame-view-state-fov-fov-src-mq3-client-cgame-view-ml-1975184854"></a>
### fov

```ml
fov
```

When constructing this record, `create` supplies `90.0` for this member. Used by `calcFov` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L211)

<a id="field-field-mq3-client-cgame-view-state-frametime-frametime-src-mq3-client-cgame-view-ml-1391426270"></a>
### frameTime

```ml
frameTime
```

Elapsed milliseconds between client view frames, clamped to zero when the presentation clock moves backward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L186)

<a id="field-field-mq3-client-cgame-view-state-gunx-gunx-src-mq3-client-cgame-view-ml-1808787282"></a>
### gunX

```ml
gunX
```

When constructing this record, `create` supplies `0.0` for this member. Used by `addTestModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L331)

<a id="field-field-mq3-client-cgame-view-state-guny-guny-src-mq3-client-cgame-view-ml-1886101944"></a>
### gunY

```ml
gunY
```

When constructing this record, `create` supplies `0.0` for this member. Used by `addTestModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L334)

<a id="field-field-mq3-client-cgame-view-state-gunz-gunz-src-mq3-client-cgame-view-ml-607621670"></a>
### gunZ

```ml
gunZ
```

When constructing this record, `create` supplies `0.0` for this member. Used by `addTestModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L337)

<a id="field-field-mq3-client-cgame-view-state-hyperspace-hyperspace-src-mq3-client-cgame-view-ml-882711798"></a>
### hyperspace

```ml
hyperspace
```

True when prediction has entered a teleport trigger requiring the hyperspace view effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L318)

<a id="field-field-mq3-client-cgame-view-state-infoscreentext-infoscreentext-src-mq3-client-cgame-view-ml-406659300"></a>
### infoScreenText

```ml
infoScreenText
```

Status text displayed while connecting, loading, or waiting for a game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L190)

<a id="field-field-mq3-client-cgame-view-state-kickangles-kickangles-src-mq3-client-cgame-view-ml-199598634"></a>
### kickAngles

```ml
kickAngles
```

When constructing this record, `create` supplies `[0.0,0.0,0.0]` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L251)

<a id="field-field-mq3-client-cgame-view-state-kickorigin-kickorigin-src-mq3-client-cgame-view-ml-322656750"></a>
### kickOrigin

```ml
kickOrigin
```

When constructing this record, `create` supplies `[0.0,0.0,0.0]` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L254)

<a id="field-field-mq3-client-cgame-view-state-landchange-landchange-src-mq3-client-cgame-view-ml-368997020"></a>
### landChange

```ml
landChange
```

Eye-height displacement used for the landing camera kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L305)

<a id="field-field-mq3-client-cgame-view-state-landtime-landtime-src-mq3-client-cgame-view-ml-965527926"></a>
### landTime

```ml
landTime
```

Client timestamp at which the landing camera kick began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L303)

<a id="field-field-mq3-client-cgame-view-state-nextorbittime-nextorbittime-src-mq3-client-cgame-view-ml-544310542"></a>
### nextOrbitTime

```ml
nextOrbitTime
```

Next timestamp at which the automatic camera orbit advances.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L248)

<a id="field-field-mq3-client-cgame-view-state-oldtime-oldtime-src-mq3-client-cgame-view-ml-354845674"></a>
### oldTime

```ml
oldTime
```

Client time of the preceding frame, retained for integration and effect updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L183)

<a id="field-field-mq3-client-cgame-view-state-predicted-predicted-src-mq3-client-cgame-view-ml-659262918"></a>
### predicted

```ml
predicted
```

When constructing this record, `create` supplies `ps` for this member. Used by `calcVrect` and `offsetThirdPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L195)

<a id="field-field-mq3-client-cgame-view-state-predictederror-predictederror-src-mq3-client-cgame-view-ml-1910259730"></a>
### predictedError

```ml
predictedError
```

Positional discrepancy between predicted and authoritative player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L311)

<a id="field-field-mq3-client-cgame-view-state-predictederrortime-predictederrortime-src-mq3-client-cgame-view-ml-478548712"></a>
### predictedErrorTime

```ml
predictedErrorTime
```

Timestamp from which the stored player-prediction error is smoothed away.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L313)

<a id="field-field-mq3-client-cgame-view-state-ragepro-ragepro-src-mq3-client-cgame-view-ml-1246711158"></a>
### ragePro

```ml
ragePro
```

When constructing this record, `create` supplies `false` for this member. Used by `damageBlendBlob` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L271)

<a id="field-field-mq3-client-cgame-view-state-refdef-refdef-src-mq3-client-cgame-view-ml-568092206"></a>
### refdef

```ml
refdef
```

Renderer view definition for the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L197)

<a id="field-field-mq3-client-cgame-view-state-renderingthirdperson-renderingthirdperson-src-mq3-client-cgame-view-ml-1005519774"></a>
### renderingThirdPerson

```ml
renderingThirdPerson
```

True while the camera uses a third-person, chase, or death view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L228)

<a id="field-field-mq3-client-cgame-view-state-runpitch-runpitch-src-mq3-client-cgame-view-ml-491522960"></a>
### runPitch

```ml
runPitch
```

When constructing this record, `create` supplies `0.002` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L285)

<a id="field-field-mq3-client-cgame-view-state-runroll-runroll-src-mq3-client-cgame-view-ml-1899669862"></a>
### runRoll

```ml
runRoll
```

When constructing this record, `create` supplies `0.005` for this member. Used by `offsetFirstPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L288)

<a id="field-field-mq3-client-cgame-view-state-scene-scene-src-mq3-client-cgame-view-ml-1519630458"></a>
### scene

```ml
scene
```

When constructing this record, `create` supplies an empty list for this member. Used by `boundary` and `clearBoundaries` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L368)

<a id="field-field-mq3-client-cgame-view-state-snap-snap-src-mq3-client-cgame-view-ml-1943432486"></a>
### snap

```ml
snap
```

Current snapshot used as the lower endpoint of client interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L192)

<a id="field-field-mq3-client-cgame-view-state-soundbuffer-soundbuffer-src-mq3-client-cgame-view-ml-1672104538"></a>
### soundBuffer

```ml
soundBuffer
```

Ring buffer of announcement sounds waiting to be played.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L339)

<a id="field-field-mq3-client-cgame-view-state-soundbufferin-soundbufferin-src-mq3-client-cgame-view-ml-1819773366"></a>
### soundBufferIn

```ml
soundBufferIn
```

Write position in the queued-announcement sound ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L341)

<a id="field-field-mq3-client-cgame-view-state-soundbufferout-soundbufferout-src-mq3-client-cgame-view-ml-1369679460"></a>
### soundBufferOut

```ml
soundBufferOut
```

Read position in the queued-announcement sound ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L343)

<a id="field-field-mq3-client-cgame-view-state-soundtime-soundtime-src-mq3-client-cgame-view-ml-116456646"></a>
### soundTime

```ml
soundTime
```

Next time at which a queued announcement sound may be played.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L345)

<a id="field-field-mq3-client-cgame-view-state-stepchange-stepchange-src-mq3-client-cgame-view-ml-1027393554"></a>
### stepChange

```ml
stepChange
```

Vertical step displacement being smoothed by the first-person camera.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L309)

<a id="field-field-mq3-client-cgame-view-state-steptime-steptime-src-mq3-client-cgame-view-ml-101355604"></a>
### stepTime

```ml
stepTime
```

Client timestamp at which stair-step smoothing began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L307)

<a id="field-field-mq3-client-cgame-view-state-suppressed-suppressed-src-mq3-client-cgame-view-ml-1724734690"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while building the camera view and submitting scene-related work because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L380)

<a id="field-field-mq3-client-cgame-view-state-system-system-src-mq3-client-cgame-view-ml-404042688"></a>
### system

```ml
system
```

When constructing this record, `create` supplies an empty list for this member. Used by `boundary` and `clearBoundaries` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L374)

<a id="field-field-mq3-client-cgame-view-state-testgun-testgun-src-mq3-client-cgame-view-ml-1813011926"></a>
### testGun

```ml
testGun
```

True when the developer test model is positioned as a first-person weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L328)

<a id="field-field-mq3-client-cgame-view-state-testmodel-testmodel-src-mq3-client-cgame-view-ml-1417199042"></a>
### testModel

```ml
testModel
```

Model resource selected for the test presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L326)

<a id="field-field-mq3-client-cgame-view-state-testmodelname-testmodelname-src-mq3-client-cgame-view-ml-1177783190"></a>
### testModelName

```ml
testModelName
```

Virtual asset name of the model selected by the test-model console commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L324)

<a id="field-field-mq3-client-cgame-view-state-thirdperson-thirdperson-src-mq3-client-cgame-view-ml-891215466"></a>
### thirdPerson

```ml
thirdPerson
```

When constructing this record, `create` supplies `false` for this member. Used by `drawActiveFrame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L231)

<a id="field-field-mq3-client-cgame-view-state-thirdpersonangle-thirdpersonangle-src-mq3-client-cgame-view-ml-698533980"></a>
### thirdPersonAngle

```ml
thirdPersonAngle
```

When constructing this record, `create` supplies `0.0` for this member. Used by `offsetThirdPersonView` and `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L234)

<a id="field-field-mq3-client-cgame-view-state-thirdpersonrange-thirdpersonrange-src-mq3-client-cgame-view-ml-366039724"></a>
### thirdPersonRange

```ml
thirdPersonRange
```

When constructing this record, `create` supplies `80.0` for this member. Used by `offsetThirdPersonView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L237)

<a id="field-field-mq3-client-cgame-view-state-time-time-src-mq3-client-cgame-view-ml-925837520"></a>
### time

```ml
time
```

Presentation timestamp in milliseconds supplied for the current client-game view frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L181)

<a id="field-field-mq3-client-cgame-view-state-timescale-timescale-src-mq3-client-cgame-view-ml-70830842"></a>
### timescale

```ml
timescale
```

When constructing this record, `create` supplies `1.0` for this member. Used by `drawActiveFrame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L350)

<a id="field-field-mq3-client-cgame-view-state-timescalefadeend-timescalefadeend-src-mq3-client-cgame-view-ml-1531079014"></a>
### timescaleFadeEnd

```ml
timescaleFadeEnd
```

When constructing this record, `create` supplies `1.0` for this member. Used by `drawActiveFrame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L353)

<a id="field-field-mq3-client-cgame-view-state-timescalefadespeed-timescalefadespeed-src-mq3-client-cgame-view-ml-174399058"></a>
### timescaleFadeSpeed

```ml
timescaleFadeSpeed
```

When constructing this record, `create` supplies `0.0` for this member. Used by `drawActiveFrame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L356)

<a id="field-field-mq3-client-cgame-view-state-traceat-traceat-src-mq3-client-cgame-view-ml-247371046"></a>
### traceAt

```ml
traceAt
```

When constructing this record, `create` supplies `0` for this member. Used by `nextTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L362)

<a id="field-field-mq3-client-cgame-view-state-traces-traces-src-mq3-client-cgame-view-ml-197565726"></a>
### traces

```ml
traces
```

When constructing this record, `create` supplies an empty list for this member. Used by `nextTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L359)

<a id="field-field-mq3-client-cgame-view-state-vidheight-vidheight-src-mq3-client-cgame-view-ml-695486582"></a>
### vidHeight

```ml
vidHeight
```

When constructing this record, `create` supplies `480` for this member. Used by `calcVrect` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L205)

<a id="field-field-mq3-client-cgame-view-state-vidwidth-vidwidth-src-mq3-client-cgame-view-ml-306991188"></a>
### vidWidth

```ml
vidWidth
```

When constructing this record, `create` supplies `640` for this member. Used by `calcVrect` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L202)

<a id="field-field-mq3-client-cgame-view-state-viewangles-viewangles-src-mq3-client-cgame-view-ml-1607239204"></a>
### viewAngles

```ml
viewAngles
```

Euler camera angles used to construct the client view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L199)

<a id="field-field-mq3-client-cgame-view-state-viewbloodshader-viewbloodshader-src-mq3-client-cgame-view-ml-1156273606"></a>
### viewBloodShader

```ml
viewBloodShader
```

Shader resource selected for view blood rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L273)

<a id="field-field-mq3-client-cgame-view-state-viewsize-viewsize-src-mq3-client-cgame-view-ml-1708019830"></a>
### viewsize

```ml
viewsize
```

When constructing this record, `create` supplies `100` for this member. Used by `calcVrect` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L208)

<a id="field-field-mq3-client-cgame-view-state-weaponselect-weaponselect-src-mq3-client-cgame-view-ml-257499334"></a>
### weaponSelect

```ml
weaponSelect
```

Weapon identifier currently selected by the local player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L320)

<a id="field-field-mq3-client-cgame-view-state-wearoffsound-wearoffsound-src-mq3-client-cgame-view-ml-1128161372"></a>
### wearOffSound

```ml
wearOffSound
```

Sound resource selected for the wear off event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L347)

<a id="field-field-mq3-client-cgame-view-state-xyspeed-xyspeed-src-mq3-client-cgame-view-ml-589117318"></a>
### xySpeed

```ml
xySpeed
```

When constructing this record, `create` supplies `0.0` for this member. Used by `offsetFirstPersonView` and `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L276)

<a id="field-field-mq3-client-cgame-view-state-zoomed-zoomed-src-mq3-client-cgame-view-ml-60465774"></a>
### zoomed

```ml
zoomed
```

True while the local player requests the zoomed view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L222)

<a id="field-field-mq3-client-cgame-view-state-zoomfov-zoomfov-src-mq3-client-cgame-view-ml-1117837254"></a>
### zoomFov

```ml
zoomFov
```

When constructing this record, `create` supplies `22.5` for this member. Used by `calcFov` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L214)

<a id="field-field-mq3-client-cgame-view-state-zoomsensitivity-zoomsensitivity-src-mq3-client-cgame-view-ml-536817182"></a>
### zoomSensitivity

```ml
zoomSensitivity
```

Mouse-sensitivity multiplier derived from the current zoom field of view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L226)

<a id="field-field-mq3-client-cgame-view-state-zoomtime-zoomtime-src-mq3-client-cgame-view-ml-419876190"></a>
### zoomTime

```ml
zoomTime
```

Timestamp used to interpolate the transition into or out of zoom.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L224)
